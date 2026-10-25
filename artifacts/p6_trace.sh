#!/bin/bash
# 用法: ./artifacts/p6_trace.sh [seed]
# 打印 p6_dispatch 里两次间接调用的下标、被调函数、参数与返回值。
SEED=${1:-42}
cd ~/ics/Lab2-BombLab-Copy || exit 1

CH=$(./bomb --seed "$SEED" --phase 6 </dev/null | sed -n 's/.*challenge: 0x\([0-9a-f]*\).*/\1/p')
printf '0\n' > /tmp/p6.txt

echo "seed=$SEED"
echo "challenge = 0x$CH"
echo "challenge & 7        = $(( 16#$CH & 7 ))"
echo "(challenge >> 3) & 7 = $(( (16#$CH >> 3) & 7 ))"
echo "(challenge >> 6) ^ (challenge >> 32) 的低 32 位 = $(( ((16#$CH >> 6) ^ (16#$CH >> 32)) & 0xffffffff ))"
echo

cat > /tmp/p6_trace.gdb <<'EOF'
set pagination off
break *0x4025a6
commands
silent
printf "第一次调用：下标 = %d，函数地址 = ", $rax
info symbol *(void**)(0x405e00 + 8*$rax)
printf "           参数 x = %u\n", (unsigned int)$edi
continue
end
break *0x4025ad
commands
silent
printf "第一次调用返回：%u\n", (unsigned int)$eax
continue
end
break *0x4025b4
commands
silent
printf "第二次调用：下标 = %d（rbx=%#lx），函数地址 = ", $rbx/8, $rbx
info symbol *(void**)(0x405e00 + $rbx)
printf "           参数 x = %u\n", (unsigned int)$edi
continue
end
break *0x4025bf
commands
silent
printf "第二次调用返回：%u\n", (unsigned int)$eax
continue
end
break *0x4025c4
commands
silent
printf "加 0x91d5 之后（返回值）：%u\n", (unsigned int)$eax
continue
end
run --seed SEED --phase 6 < /tmp/p6.txt
EOF
sed -i "s/--seed SEED/--seed $SEED/" /tmp/p6_trace.gdb
gdb -batch -x /tmp/p6_trace.gdb ./bomb 2>&1 | grep -E '^(第一次|第二次|加 )|^ '
