#!/bin/bash
# 用法: ./artifacts/p5_trace.sh [seed]
# 打印 p5_traverse 访问到的节点地址与累加值。
SEED=${1:-42}
cd ~/ics/Lab2-BombLab-Copy || exit 1

CH=$(./bomb --seed "$SEED" --phase 5 </dev/null | sed -n 's/.*challenge: 0x\([0-9a-f]*\).*/\1/p')
printf '0 0\n' > /tmp/p5.txt

echo "seed=$SEED"
echo "challenge = 0x$CH"
echo "challenge & 7        = $(( 16#$CH & 7 ))"
echo "(challenge >> 3) & 3 = $(( (16#$CH >> 3) & 3 ))"
echo

cat > /tmp/p5_trace.gdb <<'EOF'
set pagination off
set $step = 0
break *0x40244c
commands
silent
printf "head[%d] -> 节点 %p\n", $rax, $rdx
continue
end
break *0x40246a
commands
silent
set $step = $step + 1
printf "第 %d 个节点 %p  a=%u b=%u  累加后 eax=%u\n", $step, $rdx, *(unsigned int*)$rdx, *(unsigned int*)($rdx+4), $eax
continue
end
break *0x402485
commands
silent
set $step = $step + 1
printf "第 %d 个节点 %p  a=%u b=%u  累加后 eax=%u  已写入输出槽的 b=%u\n", $step, $rdx, *(unsigned int*)$rdx, *(unsigned int*)($rdx+4), $eax, *(unsigned int*)$r8
continue
end
run --seed SEED --phase 5 < /tmp/p5.txt
EOF
sed -i "s/--seed SEED/--seed $SEED/" /tmp/p5_trace.gdb
gdb -batch -x /tmp/p5_trace.gdb ./bomb 2>&1 | grep -E '^head|^第 '
