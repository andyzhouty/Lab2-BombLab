#!/bin/bash
# 用法: ./artifacts/p4_return.sh [seed]
# 打印 p4_walk 每一层的返回值（从最内层到最外层），并标出终止层与最外层。
SEED=${1:-42}
cd ~/ics/Lab2-BombLab-Copy || exit 1

CH=$(./bomb --seed "$SEED" --phase 4 </dev/null | sed -n 's/.*challenge: 0x\([0-9a-f]*\).*/\1/p')
printf '0\n' > /tmp/p4.txt

echo "seed=$SEED"
echo "challenge = 0x$CH"
echo

cat > /tmp/p4_ret.gdb <<'EOF'
set pagination off
break *0x4023a8
break *0x402379
break *0x402397
commands 1
silent
python
f, n = gdb.newest_frame(), 0
while f and f.name() == "p4_walk":
    n += 1
    f = f.older()
print("  终止返回  eax=%u" % (int(gdb.parse_and_eval("$eax")) & 0xffffffff))
end
continue
end
commands 2
silent
python
f, n = gdb.newest_frame(), 0
while f and f.name() == "p4_walk":
    n += 1
    f = f.older()
print("  分支A返回 eax=%u" % (int(gdb.parse_and_eval("$eax")) & 0xffffffff))
end
continue
end
commands 3
silent
python
f, n = gdb.newest_frame(), 0
while f and f.name() == "p4_walk":
    n += 1
    f = f.older()
print("  分支B返回 eax=%u" % (int(gdb.parse_and_eval("$eax")) & 0xffffffff))
end
continue
end
run --seed SEED --phase 4 < /tmp/p4.txt
EOF
sed -i "s/--seed SEED/--seed $SEED/" /tmp/p4_ret.gdb

gdb -batch -x /tmp/p4_ret.gdb ./bomb 2>&1 | grep -E '^  (终止|分支)' > /tmp/p4_ret.out

echo "返回值出现的顺序（从最内层到最外层）："
cat /tmp/p4_ret.out
echo
echo "最内层（终止情形）返回值：$(head -1 /tmp/p4_ret.out | awk '{print $2}' | cut -d= -f2)"
echo "最外层返回值：            $(tail -1 /tmp/p4_ret.out | awk '{print $2}' | cut -d= -f2)"
echo "返回总层数：              $(wc -l < /tmp/p4_ret.out)"
