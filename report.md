# BombLab 实验报告

> 姓名 周天佑 / 学号 25300680065（可填可不填）
> 仓库：`Lab2-BombLab-Copy`
> 进度：第 1 关已完成并通过公开测试；第 2 关进行中；第 3~6 关与 Honor 未开始。
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
| 第 2 关 | 数组、循环、递推关系 | 🚧 进行中 | — |
| 第 3 关 | switch 分支与跳转表 | ⬜ 未开始 | — |
| 第 4 关 | 递归调用与返回过程 | ⬜ 未开始 | — |
| 第 5 关 | 结构体布局、指针、链表遍历 | ⬜ 未开始 | — |
| 第 6 关 | 函数指针表与间接调用 | ⬜ 未开始 | — |
| Honor | 保密 | ⬜ 未开始 | — |

## 三、第 1 关

### 3.1 输入格式与判定位置

先在 `phase_01` 里找 `valid_u32_fields` 的调用：

```asm
40209a:	mov    %rsi,%r12            # 保存 challenge（rsi 后续将被覆盖）
40209d:	mov    $0x1,%esi            # 第二个参数 = 1，说明 这一关只要 1 个整数
4020a3:	mov    %rdi,%rbx            # 保存 input
4020aa:	call   402c80 <valid_u32_fields>
```

`valid_u32_fields(input, count)` 只检查"格式是否合法、个数是否为 count、是否在 uint32 范围内"，不保存数值。真正的解析在 `sscanf`：

```asm
4020c2:	lea    -0x14(%rbp),%rdx     # 第 3 个参数 = &values[0]（栈上 4 字节）
4020c6:	mov    $0x403189,%esi       # 第 2 个参数 = 格式串，内容为 "%u"
4020cb:	mov    %rbx,%rdi            # 第 1 个参数 = input
4020ce:	call   4011e0 <__isoc99_sscanf@plt>
4020d3:	cmp    $0x1,%eax            # 必须成功解析出 1 个数
4020d6:	jne    4020b3               # 否则返回 false
```

判定在最后：

```asm
4020d8:	mov    %r12,%rdi            # 参数 = challenge
4020db:	call   402050 <p1_compute>  # 算出这一关要求的整数，放在 eax
4020e0:	cmp    %eax,-0x14(%rbp)     # 比较：输入的 values[0] 是否等于 p1_compute 的返回值
4020e3:	sete   %al                  # 相等返回 true
```

也就是说：**口令 = `p1_compute(challenge)` 的返回值**。

### 3.2 `p1_compute`：切分 challenge 与组合结果

`p1_compute` 把 64 位的 `challenge` 切成几块，交给三个 helper，再把结果串起来：

```asm
402055:	mov    %rdi,%rdx            # rdx = challenge（64 位）
402058:	mov    %rdi,%rax
40205b:	shr    $0x20,%rax           # rax = challenge >> 32
40205f:	mov    %rdx,%rsi
402062:	mov    %eax,%edi            # edi = challenge 高 32 位
402064:	shr    $0x10,%rsi           # rsi = challenge >> 16
40206b:	call   402030 <p1_step1>     # p1_step1(高 32 位, challenge >> 16)
402070:	mov    %edi,%esi            # esi = 高 32 位（p1_step1 没有写过 edi）
402072:	mov    %edx,%edi            # edi = challenge 的低 32 位
402074:	mov    %eax,%ecx            # 保存 p1_step1 的返回值（下一步 call 将覆盖 eax）
402076:	call   402020 <p1_step0>     # p1_step0(低 32 位, 高 32 位)
40207b:	mov    %ecx,%esi            # esi = p1_step1 的结果
40207d:	mov    %eax,%edi            # edi = p1_step0 的结果
40207f:	call   402040 <p1_step2>     # p1_step2(step0 结果, step1 结果)
402085:	ret                         # 返回值 = p1_step2 的返回值
```

### 3.3 三个 helper

```asm
0000000000402020 <p1_step0>:
  402024:	lea    (%rdi,%rdi,4),%eax    # eax = rdi*5
  402027:	add    %esi,%eax             # eax += rsi
  402029:	xor    $0x57bb,%eax          # eax ^= 0x57bb

0000000000402030 <p1_step1>:
  402034:	xor    $0xdcf,%esi           # esi ^= 0xdcf
  40203a:	lea    (%rsi,%rdi,4),%eax    # eax = rsi + rdi*4

0000000000402040 <p1_step2>:
  402044:	lea    0xf9b4(%rsi),%eax     # eax = rsi + 0xf9b4
  40204a:	xor    %edi,%eax             # eax ^= edi
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

另外单步确认 `p1_step1` 返回后 `%edi` 是否被改写（在 `p1_step1` 内 `finish` 后 `info registers edi`）。

> 注：命令中的 `/tmp/in.txt` 里放的是格式合法但值错误的输入（例如 `0`）。

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

## 四、第 2 关 · 钟楼（进行中）

- 已确认：`phase_02` 要求 **6 个**整数，6 个解析结果在栈上连续存放（`rbp-0x40` 起，每个 4 字节）。
- 待完成：第一个数的公式、循环的递推关系、写 `solve_phase_2` 并验证。

（本节在完成后再补全关键汇编、计算关系与验证记录。）

## 五、尚未完成的部分

- 第 2~6 关与 Honor 关卡尚未完成；完成情况将按上面的格式逐关补充。
- 主要困难记录：第 1 关曾漏读 helper 中的部分指令（`xor`/`add`），后来用"数指令条数逐条翻译"的办法纠正。

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

- 课程主页与实验文档：https://ics-26fall-fdu.github.io/
- 本仓库 `README.md`、`tutor/README.md`、`teaching/README.md`
