#!/bin/bash
# 用法: ./p3_trace.sh [seed]
SEED=${1:-42}
cd ~/ics/Lab2-BombLab-Copy || exit 1

CH=$(./bomb --seed "$SEED" --phase 3 </dev/null | sed -n 's/.*challenge: 0x\([0-9a-f]*\).*/\1/p')
P=$(( 16#$CH & 7 ))
printf '%d 0\n' "$P" > /tmp/p3in.txt

echo "seed=$SEED"
echo "challenge = 0x$CH"
echo "p = challenge & 7 = $P"
echo

gdb -batch ./bomb \
  -ex 'set pagination off' \
  -ex 'break *0x402329' \
  -ex 'break *p3_case_0' -ex 'break *p3_case_1' \
  -ex 'break *p3_case_2' -ex 'break *p3_case_3' \
  -ex 'break *p3_case_4' -ex 'break *p3_case_5' \
  -ex 'break *p3_case_6' -ex 'break *p3_case_7' \
  -ex "run --seed $SEED --phase 3 < /tmp/p3in.txt" \
  -ex 'printf "调用 p3_dispatch: rdi=%u, rsi=%u (0x%x)\n", $rdi, $rsi, $rsi' \
  -ex 'continue' \
  -ex 'printf "\n实际进入的函数：\n"' \
  -ex 'bt 1' \
  2>&1 | grep -E 'seed=|challenge =|p = |调用 p3_dispatch|实际进入|^#0'
