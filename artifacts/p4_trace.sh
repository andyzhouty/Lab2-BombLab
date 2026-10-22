#!/bin/bash
# 用法: ./artifacts/p4_trace.sh [seed]
# 打印 p4_walk 每一层递归的参数。输入用一个数占位，能走到递归即可。
SEED=${1:-42}
cd ~/ics/Lab2-BombLab-Copy || exit 1

CH=$(./bomb --seed "$SEED" --phase 4 </dev/null | sed -n 's/.*challenge: 0x\([0-9a-f]*\).*/\1/p')
printf '0\n' > /tmp/p4.txt

echo "seed=$SEED"
echo "challenge = 0x$CH"
echo "challenge & 0x7f = $(( 16#$CH & 0x7f ))"
echo

cat > /tmp/p4_depth.gdb <<'EOF'
set pagination off
break *p4_walk
commands
silent
python
f = gdb.newest_frame()
n = 0
while f and f.name() == "p4_walk":
    n += 1
    f = f.older()
print("depth=%d  rdi=%d rsi=%d rdx=%d rcx=%#x" % (
    n,
    int(gdb.parse_and_eval("$rdi")),
    int(gdb.parse_and_eval("$rsi")),
    int(gdb.parse_and_eval("$rdx")),
    int(gdb.parse_and_eval("$rcx")) & 0xffffffff))
end
continue
end
run --seed SEED --phase 4 < /tmp/p4.txt
EOF

sed -i "s/--seed SEED/--seed $SEED/" /tmp/p4_depth.gdb
gdb -batch -x /tmp/p4_depth.gdb ./bomb 2>&1 | grep -E '^depth=|^\[Inferior'
