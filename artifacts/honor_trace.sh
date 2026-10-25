#!/bin/bash
# 用法: ./artifacts/honor_trace.sh [seed]
# 观察 Honor 关：入口参数、OPEN 检查读到哪四个字节、解析出的三个整数、
# 以及三处检查各自有没有通过（不打印应有答案）。
SEED=${1:-42}
cd ~/ics/Lab2-BombLab-Copy || exit 1

# 前六关的口令 + 一条占位行：32 个 x + OPEN + 三个 0
./defuser --seed "$SEED" > /tmp/honor_in.txt 2>/dev/null
printf '%s\n' "$(python3 -c 'print("x"*32 + "OPEN 0 0 0")')" >> /tmp/honor_in.txt

echo "seed=$SEED"
echo "占位输入行（32 个 x + OPEN + 三个 0）："
tail -1 /tmp/honor_in.txt
echo

cat > /tmp/honor_trace.gdb <<'EOF'
set pagination off
break *0x402730
commands
silent
printf "secret_gate 入口: challenge = %#lx   context = %#lx\n", $rsi, $rdx
printf "                  输入行长度 = %d\n", (int)strlen($rdi)
continue
end
break *0x40279b
commands
silent
printf "OPEN 检查点 rbp-0xb0（缓冲区起点是 rbp-0xd0）读到 %#x\n", *(unsigned int*)($rbp-0xb0)
continue
end
break *0x4026b0
commands
silent
printf "sscanf 解析出: num1=%u num2=%u num3=%u（依次对应三个 %%u）\n", *(unsigned int*)($rbp-0x2c), *(unsigned int*)($rbp-0x28), *(unsigned int*)($rbp-0x24)
printf "                 第一个整数的要求值 = %u\n", $ecx
continue
end
break *0x4026bd
commands
silent
printf "第一处检查：通过\n"
continue
end
break *0x4026f1
commands
silent
printf "第二处检查：通过\n"
continue
end
break *0x402703
commands
silent
printf "第三处检查：通过\n"
continue
end
break *0x40267a
commands
silent
printf "从失败出口返回（值为 %d，0 表示没过）\n", $edx
continue
end
run --seed SEED < /tmp/honor_in.txt
EOF
sed -i "s/--seed SEED/--seed $SEED/" /tmp/honor_trace.gdb
gdb -batch -x /tmp/honor_trace.gdb ./bomb 2>&1 | grep -E "^(secret_gate| {18}输入行|OPEN 检查点|sscanf 解析| {17}第一个|第[一二三]处检查|从失败出口)"
