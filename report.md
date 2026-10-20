# BombLab 实验报告

> 姓名 周天佑 / 学号 25300680065（可填可不填）
> 仓库：`Lab2-BombLab-Copy`
> 进度：第 1、2 关已完成并通过公开测试；第 3~6 关与 Honor 尚未开始。
> 最后更新：2026-10-19

## 一、实验环境与工具

| 项目 | 内容 |
| --- | --- |
| 系统 | Ubuntu 26.04.1 LTS（WSL2，Linux 6.18.54.1-microsoft-standard-WSL2） |
| 编译器 | gcc (Ubuntu 15.2.0-16ubuntu1) 15.2.0 |
| 调试器 | GNU gdb (Ubuntu 17.1-2ubuntu1) 17.1 |
| 反汇编 | GNU objdump (GNU Binutils for Ubuntu) 2.46 |

主要使用的命令：

```bash
objdump -d --no-show-raw-insn --disassemble=phase_0N ./bomb > phase_0N.S
gdb --args ./bomb --seed 42 --phase N
./defuser --seed S --phase N | ./bomb --seed S --phase N
python3 public_test.py --phase N
```

说明：本人的 `bomb` 没有被 strip，`nm bomb` 可以看到 `phase_01`、`p1_compute`、`p1_step0` 等函数符号，因此可以直接对函数名下断点。本报告中的所有地址都来自本人仓库中的 `bomb`。

## 二、总览

| 关卡 | 知识点 | 状态 | 验证情况 |
| --- | --- | --- | --- |
| 第 1 关 | 函数调用、参数传递、返回值 | ✅ 完成 | 公开 seed 10/10，另测 seed 123、55555 |
| 第 2 关 | 数组、循环、递推关系 | ✅ 完成 | 公开 seed 10/10，另测 seed 55555 |
| 第 3 关 | switch 分支与跳转表 | ⬜ 未开始 | — |
| 第 4 关 | 递归调用与返回过程 | ⬜ 未开始 | — |
| 第 5 关 | 结构体布局、指针、链表遍历 | ⬜ 未开始 | — |
| 第 6 关 | 函数指针表与间接调用 | ⬜ 未开始 | — |
| Honor | 保密 | ⬜ 未开始 | — |

## 三、第 1 关

### 3.1 输入格式与判定位置

先在 `phase_01` 里找 `valid_u32_fields` 的调用：

```asm
40209a: mov    %rsi,%r12            # 保存 challenge（rsi 后续将被覆盖）
40209d: mov    $0x1,%esi            # 第二个参数 = 1，说明 这一关只要 1 个整数
4020a3: mov    %rdi,%rbx            # 保存 input
4020aa: call   402c80 <valid_u32_fields>
```

`valid_u32_fields(input, count)` 只检查"格式是否合法、个数是否为 count、是否在 uint32 范围内"，不保存数值。真正的解析在 `sscanf`：

```asm
4020c2: lea    -0x14(%rbp),%rdx     # 第 3 个参数 = &values[0]（栈上 4 字节）
4020c6: mov    $0x403189,%esi       # 第 2 个参数 = 格式串，内容为 "%u"
4020cb: mov    %rbx,%rdi            # 第 1 个参数 = input
4020ce: call   4011e0 <__isoc99_sscanf@plt>
4020d3: cmp    $0x1,%eax            # 必须成功解析出 1 个数
4020d6: jne    4020b3               # 否则返回 false
```

判定在最后：

```asm
4020d8: mov    %r12,%rdi            # 参数 = challenge
4020db: call   402050 <p1_compute>  # 算出这一关要求的整数，放在 eax
4020e0: cmp    %eax,-0x14(%rbp)     # 比较：输入的 values[0] 是否等于 p1_compute 的返回值
4020e3: sete   %al                  # 相等返回 true
```

也就是说，口令 = `p1_compute(challenge)`。

### 3.2 `p1_compute`：切分 challenge 与组合结果

`p1_compute` 把 64 位的 `challenge` 切成几块，交给三个 helper，再把结果串起来：

```asm
402055: mov    %rdi,%rdx            # rdx = challenge（64 位）
402058: mov    %rdi,%rax
40205b: shr    $0x20,%rax           # rax = challenge >> 32
40205f: mov    %rdx,%rsi
402062: mov    %eax,%edi            # edi = challenge 高 32 位
402064: shr    $0x10,%rsi           # rsi = challenge >> 16
40206b: call   402030 <p1_step1>     # p1_step1(高 32 位, challenge >> 16)
402070: mov    %edi,%esi            # esi = 高 32 位（p1_step1 没有写过 edi）
402072: mov    %edx,%edi            # edi = challenge 的低 32 位
402074: mov    %eax,%ecx            # 保存 p1_step1 的返回值（下一步 call 将覆盖 eax）
402076: call   402020 <p1_step0>     # p1_step0(低 32 位, 高 32 位)
40207b: mov    %ecx,%esi            # esi = p1_step1 的结果
40207d: mov    %eax,%edi            # edi = p1_step0 的结果
40207f: call   402040 <p1_step2>     # p1_step2(step0 结果, step1 结果)
402085: ret                         # 返回值 = p1_step2 的返回值
```

### 3.3 三个 helper

```asm
0000000000402020 <p1_step0>:
  402024: lea    (%rdi,%rdi,4),%eax    # eax = rdi*5
  402027: add    %esi,%eax             # eax += rsi
  402029: xor    $0x57bb,%eax          # eax ^= 0x57bb

0000000000402030 <p1_step1>:
  402034: xor    $0xdcf,%esi           # esi ^= 0xdcf
  40203a: lea    (%rsi,%rdi,4),%eax    # eax = rsi + rdi*4

0000000000402040 <p1_step2>:
  402044: lea    0xf9b4(%rsi),%eax     # eax = rsi + 0xf9b4
  40204a: xor    %edi,%eax             # eax ^= edi
```

### 3.4 恢复出的计算关系

```c
uint32_t low  = (uint32_t)challenge;          // 低 32 位
uint32_t high = (uint32_t)(challenge >> 32);  // 高 32 位
uint32_t mid  = (uint32_t)(challenge >> 16);  // 16~47 位

uint32_t step1  = (mid ^ UINT32_C(0xdcf)) + high * UINT32_C(4);   // p1_step1
uint32_t step0  = (low * UINT32_C(5) + high) ^ UINT32_C(0x57bb);  // p1_step0
uint32_t answer = (step1 + UINT32_C(0xf9b4)) ^ step0;             // p1_step2(step0, step1)
```

`solve_phase_1` 里把 `answer` 存入 `values[0]`，`count = 1`，再交给 `write_answer`。

### 3.5 推理过程小结

1. 在 `phase_01` 里找 `valid_u32_fields` 前的 `mov $0x1,%esi`，确定口令由 **1 个**整数组成；再用 `sscanf` 的格式串和 `cmp $0x1,%eax` 交叉验证。
2. 找到最终判定 `cmp %eax,-0x14(%rbp)`，确认"输入的数"要和 `p1_compute(challenge)` 的返回值相等。
3. 分别读 `p1_compute` 和三个 helper：先逐条翻译 helper，再跟踪 `rdx`/`rax`/`rsi`/`rdi`/`ecx` 弄清每个调用点的实参。
4. 在 `p1_compute` 里逐行跟踪寄存器，弄清三次调用的实参，并注意到两个细节：`%edi` 跨 `call p1_step1` 仍然可用（因为被调函数没有改写它），`p1_step1` 的第二个参数只取低 32 位。
5. 把公式写进 `solve_phase_1`，用多个 seed 与公开测试验证（见 3.7）。

### 3.6 GDB 验证记录

在三个 helper 入口下断点观察实参（`--seed 42`，challenge = `0x28efe333b266f103`）：

```bash
gdb -batch -ex 'set pagination off' \
    -ex 'break *p1_step1' -ex 'break *p1_step0' -ex 'break *p1_step2' \
    -ex 'run --seed 42 --phase 1 < /tmp/in.txt' \
    -ex 'info registers rdi rsi' -ex 'continue' \
    -ex 'info registers rdi rsi' -ex 'continue' \
    -ex 'info registers rdi rsi' ./bomb
```

| 断点 | `rdi`（第 1 参数） | `rsi`（第 2 参数） | 说明 |
| --- | --- | --- | --- |
| `p1_step1` | `0x28efe333` | `0x28efe333b266` | 实际只用 `esi = 0xe333b266`（第 16~47 位） |
| `p1_step0` | `0xb266f103` | `0x28efe333` | 低 32 位、高 32 位 |
| `p1_step2` | `0xa4f2cff9` | `0x86f34c75` | 分别是 step0、step1 的结果 |

用 `finish` 从 `p1_step1` 返回 `p1_compute` 后再看寄存器：`edi` 仍为 `0x28efe333`（高 32 位）、`edx` 仍为 `0xb266f103`（低 32 位），证实 `p1_step1` 没有改写这两个寄存器，因此 `p1_compute` 可以直接复用它们。

> 注：命令中的 `/tmp/in.txt` 里放的是格式合法但值错误的输入（例如 `0`），这样程序会走到 `p1_compute` 并在比较处失败，方便在 helper 入口停下观察。

### 3.7 验证结果

```bash
./defuser --seed 42    --phase 1 | ./bomb --seed 42    --phase 1
# Phase 1 defused.
./defuser --seed 123   --phase 1 | ./bomb --seed 123   --phase 1
# Phase 1 defused.
./defuser --seed 55555 --phase 1 | ./bomb --seed 55555 --phase 1
# Phase 1 defused.（公开列表之外的 seed）
python3 public_test.py --phase 1                                   # Public tests: 10/10
```

公开 seed 为 `tests/public.json` 中的 0、1、7、42、99、123、2026、65535、987654321、18446744073709551615；其中 `55555` 不在公开列表中，用于确认解法不是针对公开样例硬编码。

### 3.8 运行截图

![第 1 关通过截图](images/phase1-defused.png)

## 四、第 2 关 · 钟楼

### 4.1 输入格式与判定位置

和第一关一样，先在 `phase_02` 里找 `valid_u32_fields` 的参数：

```asm
4020fa: mov    %rsi,%r13            # 保存 challenge
4020fd: mov    $0x6,%esi            # 第二个参数 = 6 → 这一关要 6 个整数
402104: mov    %rdi,%r12            # 保存 input
40210c: call   402c80 <valid_u32_fields>
```

`sscanf` 的返回值同样是交叉验证：`402155: cmp $0x6,%eax` 要求恰好解析出 6 个数。

### 4.2 6 个整数在栈上的布局

这一关的参数超过 6 个，出现了**栈传参**：

```asm
40212a: lea    -0x2c(%rbp),%rax     # 第 6 个数的地址
40212e: lea    -0x3c(%rbp),%rcx     # 第 2 个数的地址 → rcx
402137: push   %rax                 # 先 push → 落在高地址 → 第 8 个参数
402138: lea    -0x30(%rbp),%rax     # 第 5 个数的地址
40213c: lea    -0x40(%rbp),%rdx     # 第 1 个数的地址 → rdx
402143: push   %rax                 # 后 push → 落在 [rsp] → 第 7 个参数
402144: lea    -0x34(%rbp),%r9       # 第 4 个数的地址
402148: lea    -0x38(%rbp),%r8       # 第 3 个数的地址
40214e: call   4011e0 <__isoc99_sscanf@plt>
```

**推断依据**：x86-64 只有 6 个参数寄存器（`rdi`、`rsi`、`rdx`、`rcx`、`r8`、`r9`），第 7、8 个参数走栈；而 `push` 使 `rsp` 减小，所以**先 push 的落在较高地址，对应靠后的参数**。

| 第几个数 | 栈上地址 | 通过哪个参数传给 `sscanf` |
| --- | --- | --- |
| 1 | `rbp-0x40` | `rdx`（第 3 个参数） |
| 2 | `rbp-0x3c` | `rcx`（第 4 个参数） |
| 3 | `rbp-0x38` | `r8`（第 5 个参数） |
| 4 | `rbp-0x34` | `r9`（第 6 个参数） |
| 5 | `rbp-0x30` | 栈参数，第 7 个（后 push） |
| 6 | `rbp-0x2c` | 栈参数，第 8 个（先 push） |

6 个地址依次相差 4 字节，且从低到高排列，说明它们是连续的 `uint32_t values[0..5]`，即 `&values[i] = rbp - 0x40 + 4*i`。

### 4.3 第一个数 `values[0]` 的计算关系

```asm
40215a: mov    %r13,%rax            # rax = challenge
40215d: mov    -0x40(%rbp),%esi     # esi = values[0]
402160: shr    $0x5,%rax            # rax = challenge >> 5
402164: add    %eax,%eax            # eax = eax * 2
402166: and    $0x7e,%eax            # 保留第 1~6 位
402169: add    $0x1d,%eax            # + 29
40216c: cmp    %eax,%esi            # values[0] == 算出来的值？
```

```c
values[0] = (((uint32_t)(challenge >> 5) * 2) & 0x7e) + 0x1d;
```

### 4.4 循环：一次处理一个数

循环的**回边**是 `4021aa: jne 402182`，因此循环体是 `402182` ~ `4021aa`；`402170` ~ `40217f` 是循环外只执行一次的初始化。

循环体可以归成四件事：

| 步骤 | 指令 | 作用 |
| --- | --- | --- |
| ① 算移位量 | `402182: lea (%r8,%rdx,1),%ecx` | `cl = (r8 + rdx) & 0xff` |
| ② 取 challenge 的 4 位 | `402190: shr %cl,%rax`、`402198: and $0xf,%eax` | `(challenge >> cl) & 0xf` |
| ③ 拼期望值 | `40219b: xor %edi,%eax`、`40219d: add %ecx,%eax` | `^ 轮次 + 3 × 上一个数` |
| ④ 比较 | `40219f: cmp %eax,%esi` | 输入值 == 期望值？ |

其中：

- `402189: add $0x1,%edi` 让轮次从 1 开始，进入循环体后变成 2、3、4、5、6；
- `40218c: add $0x4,%rdx` 让指针依次指向 `values[1]` … `values[5]`；
- `4021a7: cmp $0x6,%edi` + `jne 402182` 决定循环跑 **5 轮**。

`40217f: sub %edx,%r8d` 在循环外算出 $r8 = 13 - A_0$（$A_0$ 是 `&values[0]` 的低 32 位），循环内 `rdx` 每轮 +4，`lea` 相加后地址部分互相抵消，只剩 $4k+9$，即 13、17、21、25、29。

### 4.5 恢复出的计算关系

```c
values[0] = (((uint32_t)(challenge >> 5) * 2) & 0x7e) + 0x1d;

for (int k = 1; k <= 5; ++k)
    values[k] = (((challenge >> (9 + 4 * k)) & 0xf) ^ (k + 1)) + 3 * values[k-1];
```

（`9 + 4k` 与 `13 + 4(k-1)` 是同一个量。）

`solve_phase_2` 里算出 6 个数后 `count = 6`，交给 `write_answer`。

### 4.6 推理过程小结

1. 用 `valid_u32_fields(input, 6)` 和 `cmp $0x6,%eax` 确定口令是 **6 个**整数。
2. 把 6 个 `lea` 的地址按大小排序，得到 `values[0..5]` 的栈布局；再对照参数寄存器与 `push` 顺序，确定每个数的传递方式。
3. 逐个翻译循环体，先整理成"四件事"，再确认每轮的自增量：`edi` 每轮 +1、`rdx` 每轮 +4。
4. 通过回边定位循环范围（`402182` ~ `4021aa`），从而确认 `r8d` 的初值来自循环外的 `sub`，进而推出移位量每轮递增 4。
5. 用 GDB 实测确认 `cl`、`edi` 的五轮取值，并用"喂入观察值"的方式逐轮核对期望值。
6. 把递推式写进 `defuser.c`，用多个 seed 验证。

### 4.7 GDB 验证记录

1. 确认 `cl` 与 `edi` 的取值**（`--seed 42` 第 1 轮）：

  ```bash
  gdb -batch -ex 'set pagination off' -ex 'break *0x402190' \
      -ex 'run --seed 42 --phase 2 < /tmp/p2.txt' \
      -ex 'printf "cl=%d edi=%d\n", $rcx & 0xff, $edi' ./bomb
  ```

  ```text
  cl=13  edi=2
  ```

2. 逐轮观察期望值（在 `40219f` 处停，`eax` 就是程序算出的期望值）：

```bash
printf '145 449 1351 0 0 0\n' > /tmp/p2.txt

cat > /tmp/trace.gdb <<'EOF'
set pagination off
set $n = 0
break *0x40219f
commands
silent
set $n = $n + 1
printf "第 %d 轮: eax=%d  esi=%d\n", $n, $eax, $esi
continue
end
run --seed 42 --phase 2 < /tmp/p2.txt
EOF

gdb -batch -x /tmp/trace.gdb ./bomb
```

```
第 1 轮: eax=449   esi=449
第 2 轮: eax=1351  esi=1351
第 3 轮: eax=4065  esi=0
```

前三轮输入的 `145 449 1351` 全部匹配，第 3 轮暴露出程序要求 `values[3] = 4065`。

这个方法的原理是，即使输入错误，程序也会先把期望值算进 `eax` 再比较，所以可以从 `eax` 读到"正确答案"。注意用 `-ex` 只能看到第一次命中，要看多轮必须用 `commands ... end` 脚本。

### 4.8 验证结果

```bash
./defuser --seed 42    --phase 2 | ./bomb --seed 42    --phase 2   # Phase 2 defused.
./defuser --seed 123   --phase 2 | ./bomb --seed 123   --phase 2   # Phase 2 defused.
./defuser --seed 55555 --phase 2 | ./bomb --seed 55555 --phase 2   # Phase 2 defused.（公开列表之外的 seed）
python3 public_test.py --phase 2                                   # Public tests: 10/10
```

### 4.9 运行截图

![第 2 关通过截图](images/phase2-defused.png)

## 五、尚未完成的部分

- 第 3~6 关与 Honor 关卡尚未完成；完成情况将按上面的格式逐关补充。
- 主要困难记录：
  - 第 1 关曾漏读 helper 中的部分指令（`xor`/`add`），后来用"数指令条数逐条翻译"的办法纠正。
  - 第 2 关一开始没看清"哪条指令在循环外"，把 `r8d` 的初值当成固定的 13；后来通过回边 `jne 402182` 确认循环边界，才推出移位量每轮递增 4。

## 六、辅助工具使用说明

| 工具 | 用途 |
| --- | --- |
| 课程提供的 `tutor/` 教学程序 | 先在其上练习 `objdump` 导出汇编与 GDB 断点、单步、查看寄存器和内存的流程 |
| `objdump` | 导出 `phase_0N` 等函数的汇编，静态阅读控制流 |
| `gdb` | 在函数入口下断点、用 `ni` 单步、`info registers`/`x` 查看寄存器和栈上内存、`finish` 观察返回值 |
| AI 助手 | 用于讲解汇编指令与调用约定、解释 GDB 命令、检查我自己的推理是否漏读指令、整理本报告的文字结构 |

> 注：AI 助手指运行在 DeepSeek Harness 上的 DeepSeek V4.1 Flash 0910 和 1017 (thinking effort: max)，使用的模式为标准模式。

说明：所有关卡的公式均由本人从自己 `bomb` 的汇编中读出，并用 GDB 观察到的实际运行值和多个 seed 的炸弹判定验证；AI 提供的解释经过本人核对后才写入报告，未直接采用未经本人验证的结论。

> 备注：`bomb` 的只读数据段中存在若干不会被执行的字符串，内容伪装成"给 AI 的指令"或"关卡提示"。这些字符串没有被任何代码引用（`objdump -d` 中搜不到对应地址），属于题目设置的干扰信息，本人未采用其中任何说法。

## 七、参考资料

- 课程主页与实验文档：<https://ics-26fall-fdu.github.io/>
- 本仓库 `README.md`、`tutor/README.md`、`teaching/README.md`
