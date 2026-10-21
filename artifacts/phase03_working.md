# 第 3 关 · 分流站 —— 工作笔记

> 用途：记录第 3 关的进度、待回答的问题、用到的命令和观察结果。
> 约定：每完成一项就把 `[ ]` 改成 `[x]`；观察到的数值填进表格；结论追加到第 6 节。
> 说明：本文件是分析过程记录，随仓库一起提交；正式报告是 `report.md`。

目录

| 小节                                      | 内容                   |
| ----------------------------------------- | ---------------------- |
| [1. 关卡信息](#1-关卡信息)                 | 函数、地址、知识点     |
| [2. 进度清单](#2-进度清单)                 | Q1~Q9 的完成情况       |
| [3. 命令速查](#3-命令速查)                 | 导出汇编、GDB、验证    |
| [4. 待回答问题](#4-待回答问题)             | 分阶段的引导问题       |
| [5. 观察记录表](#5-观察记录表gdb-实测填写) | 8 个分支的运算（待填） |
| [6. 已确认结论](#6-已确认结论随进度追加)   | 目前确定的关系         |
| [7. 备忘](#7-备忘)                         | 报告要求、草稿清理     |

## 1. 关卡信息

| 项目           | 内容                                                                                  |
| -------------- | ------------------------------------------------------------------------------------- |
| 函数           | `bool phase_03(const char *input, uint64_t challenge)`，入口 `0x4022c0`           |
| 特点           | 会调用 `p3_dispatch`，由它再跳转到 8 个 `p3_case_*` 之一                          |
| 知识点         | switch 分支与跳转表、间接跳转                                                         |
| 与前一关的区别 | 第 2 关的逻辑全在一个函数里；这关逻辑分散在 10 个函数中，要靠"跳转表"串起来 |

## 2. 进度清单

- [X] 导出 `phase_03.S`（已有）
- [X] Q1 确定口令有几个整数（看 `valid_u32_fields` 前面的 `mov $?,%esi`）
- [X] Q2 弄清 `sscanf` 的两个输出槽在栈上哪里、格式串是什么
- [X] Q3 推出第一个整数的要求
- [X] Q4 弄清调用 `p3_dispatch` 时的两个参数分别怎么从 `challenge` 算出来
- [X] Q5 读懂 `p3_dispatch` 的"分派"方式（跳转表 + 间接跳转）
- [X] Q6 导出并读懂 8 个 `p3_case_*` 各自做什么运算
- [X] Q7 把 Q3~Q6 串起来，写出第二个整数的完整表达式
- [X] 写 `solve_phase_3`
- [X] 多 seed 验证 + `public_test.py --phase 3`（10/10，另测随机 seed）
- [X] 补进 `report.md` 第五节（含非公开 seed 记录与截图）

## 3. 命令速查

```bash
cd ~/ics/Lab2-BombLab-Copy

# 主函数已经导出过（artifacts/phase_03.S）；下面导出被调用的函数
objdump -d --no-show-raw-insn --disassemble=p3_dispatch ./bomb > /tmp/p3_dispatch.S
for i in 0 1 2 3 4 5 6 7; do
    objdump -d --no-show-raw-insn --disassemble=p3_case_$i ./bomb >> /tmp/p3_cases.S
done

# 看有哪些相关符号（含跳转表可能的名字）
nm bomb | grep -i 'p3'

# 一路看全部函数
objdump -d --no-show-raw-insn ./bomb > bomb.S   # 已有 artifacts/bomb.S

# 交互调试
gdb ./bomb
```

GDB 常用入口：

```gdb
set pagination off
break *phase_03          # 函数入口，看 rdi / rsi
break *0x402329          # 调用 p3_dispatch 之前，看它的两个参数
break *p3_dispatch       # 进入分派函数
break *p3_case_0         # 某个分支（换数字看别的分支）
```

验证（写完 solver 之后）：

```bash
make
./defuser --seed 42    --phase 3 | ./bomb --seed 42    --phase 3
./defuser --seed 55555 --phase 3 | ./bomb --seed 55555 --phase 3
python3 public_test.py --phase 3
```

## 4. 待回答问题

### Q1：几个整数？

> 找 `call <valid_u32_fields>` 前面那条 `mov $?,%esi`。
> 再用 `cmp` 之后的立即数交叉验证。

答：2

### Q2：两个数存在哪、格式串是什么？

> 看 `4022f2` 和 `4022f6` 两条 `lea`：它们是 `sscanf` 的第 3、4 个参数（输出地址）。
> 两个地址相差多少字节？说明是什么类型？

| 第几个数 | 栈上地址 | 传给 `sscanf` 的参数 |
| -------- | -------- | ---------------------- |
| 1        | rbp-0x18 | rdx                    |
| 2        | rbp-0x14 | rcx                    |

格式串（用 `x/s` 看地址 `0x403186`）：

答：`%u %u`

### Q3：第一个整数要和什么相等？

对应汇编：

```asm
40230c:	mov    %r12d,%edi
402311:	and    $0x7,%edi
402314:	cmp    %edi,-0x18(%rbp)
402317:	jne    ...失败
```

提示：

- `%r12` 存的是什么？（回看函数开头） `challenge`
- `and $0x7,%edi` 会把数值限制在什么范围？ `0~7`
- `cmp %edi,-0x18(%rbp)` 中 `-0x18(%rbp)` 是第几个输入？

答（写成 C 表达式）：`challenge & 7`

### Q4：`p3_dispatch` 的两个参数

```asm
402319:	mov    %r12,%rax           # rax = challenge
40231c:	mov    %r12,%rsi           # rsi = challenge
40231f:	shr    $0x3,%rax           # rax >>= 3
402323:	shr    $0x20,%rsi          # rsi >>= 32
402327:	xor    %eax,%esi           # eax ^ esi
402329:	call   402260 <p3_dispatch>
```

请你回答：

1. 调用时 `rdi` 是什么？（注意它是在 `40230c`~`402311` 设置的，不在这一段里）
2. 调用时 `rsi` 是什么？（用 `challenge` 表示）
3. 这两个参数分别会用来做什么？（看 `p3_dispatch` 的汇编再回答）

答：

1. `rdi = challenge & 7`（就是上面第一个数的值），也就是 switch 的变量
2. `rsi = (challenge >> 3) ^ (challenge >> 32)`，两处都只取低 32 位再异或
3. 第 1 个参数当跳转表的下标，第 2 个参数传进去给具体分支做运算

### Q5：`p3_dispatch` 怎么选分支？

需要你先导出 `p3_dispatch`（见第 3 节命令），然后回答：

1. 它在跳转前做了什么范围检查？越界时返回什么？
2. 哪条指令是"间接跳转"？它的地址形式 `*0xXXXXXXXX(,%rax,8)` 是什么意思？
3. 跳转表里一共有几项？怎么用 GDB 打印出来？

> 🔍 提示：`jmp *表地址(,%rax,8)` 的意思是"从 `表地址 + rax×8` 处读一个 8 字节的值，跳过去"。
> 可以用 `x/8gx 表地址` 查看表项，每项是一个函数地址。

答：

1. 先 `cmp $0x7,%eax` + `ja 4022b5`，无符号大于 7 就跳走；`4022b5` 那里是 `xor %eax,%eax; ret`，也就是越界返回 0。
2. 间接跳转是 `40226d: notrack jmp *0x405820(,%rax,8)`。含义是先算 `0x405820 + rax*8`，从这个地址读 8 字节当目标地址跳过去。
3. 表在 `0x405820`，一共 8 项，每项 8 字节。打印：`gdb -batch -ex 'x/8gx 0x405820' ./bomb`。

每个表项指向的是一句 `jmp p3_case_x` 的跳板，再顺着跳板才能看到真正进入哪个函数。

### Q6：8 个分支各做什么？

导出 `p3_case_0` ~ `p3_case_7`，逐个翻译（每个只有 2~4 条指令）。
提示：注意 `lea` 的变址写法，例如 `lea 0x1234(%rdi,%rdi,4),%eax` 表示 `rdi + rdi*4 + 0x1234`。

填到第 5 节的表格里。

### Q7：第二个整数的完整表达式

把 Q4（分派参数）、Q5（选择哪个分支）、Q6（分支运算）串起来，写成 C 表达式。

答：

```c
arg1 = challenge & 7;
arg2 = (challenge >> 3) ^ (challenge >> 32);

switch (arg1) {
    case 0: t = (arg2 * 2) ^ 0x2197;              break;   // p3_case_5
    case 1: t = 0xf657 + 5 * arg2;                break;   // p3_case_4
    case 2: t = 0x3679a + 5 * arg2;               break;   // p3_case_0
    case 3: t = (arg2 ^ 0x770b) + (arg2 >> 2);    break;   // p3_case_6
    case 4: t = arg2 * 5 + 0x48639;               break;   // p3_case_7
    case 5: t = (arg2 * 4) ^ 0xa6ba;              break;   // p3_case_3
    case 6: t = (arg2 ^ 0xc6ad) + (arg2 >> 1);    break;   // p3_case_1
    case 7: t = 0x55f6 + 5 * arg2;                break;   // p3_case_2
}
values[0] = arg1;
values[1] = t;
```

## 5. 观察记录表（GDB 实测填写）

### 5.1 8 个分支的运算

| 分支 | 对应函数      | 运算表达式（用 `x` 表示传入的参数） |
| ---- | ------------- | ----------------------------------  |
| 0    | `p3_case_0`   | `0x3679a+5*rdi`                     |
| 1    | `p3_case_1`   | `(edi^0xc6ad)+(edi>>1)`             |
| 2    | `p3_case_2`   | `0x55f6+5*rdi`                      |
| 3    | `p3_case_3`   | `(rdi * 4) ^ 0xa6ba`                |
| 4    | `p3_case_4`   | `0xf657+5*rdi`                      |
| 5    | `p3_case_5`   | `(rdi*2)^0x2197`                    |
| 6    | `p3_case_6`   | `(edi^0x770b)+(edi>>2)`             |
| 7    | `p3_case_7`   | `rdi*5+0x48639`                     |

### 5.2 跳转表内容

用 `x/8gx 0x405820` 打印，把每一项对应的函数名填上：

| 下标 | 表项地址值 | 指向的函数 |
| ---- | ---------- | ---------- |
| 0    | 402288     | p3_case_5  |
| 1    | 402290     | p3_case_4  |
| 2    | 402298     | p3_case_0  |
| 3    | 4022a0     | p3_case_6  |
| 4    | 4022a8     | p3_case_7  |
| 5    | 4022b0     | p3_case_3  |
| 6    | 402278     | p3_case_1  |
| 7    | 402280     | p3_case_2  |

### 5.3 GDB 实测记录

| 观察点                                        | 你看到的（seed 42） |
| --------------------------------------------- | -------- |
| `break *phase_03` 时的 `rdi`（input）     | `0x7fffffffcfd0`，内容是 `"4 0"` |
| `break *phase_03` 时的 `rsi`（challenge） | `0x581ce1ff0e4ae394` |
| `break *0x402329` 时的 `rdi`              | `4` |
| `break *0x402329` 时的 `rsi`              | `3117792653`（`0xb9d5bd8d`） |
| 实际进入的 `p3_case_*`                      | `p3_case_7`（下标 4 对应它） |

## 6. 已确认结论（随进度追加）

- Q1：口令是 2 个整数（`4022cd: mov $0x2,%esi`；`402307: cmp $0x2,%eax`），格式串 `"%u %u"`。
- Q2：第 1 个数在 `rbp-0x18`（`rdx`，`sscanf` 第 3 个参数），第 2 个数在 `rbp-0x14`（`rcx`，第 4 个参数）。一开始把这两个填反了，用输入 `111 222` 实测确认：`rbp-0x18 = 111`。
- Q3：`values[0] = challenge & 7`。
- Q4：`p3_dispatch` 的两个参数是 `challenge & 7` 和 `(challenge >> 3) ^ (challenge >> 32)`。
- Q5：`p3_dispatch` 用 `cmp $0x7` + `ja` 做范围检查（越界返回 0），再用 `notrack jmp *0x405820(,%rax,8)` 查表跳转，表有 8 项。
- Q6：8 个分支的运算见 5.1 表；它们与下标的对应关系见 5.2 表，是一一对应但顺序被打乱（0→`case_5`、4→`case_7`），不能按编号猜。
- Q7：完整表达式见 Q7 的代码，`values[1] = t`。
- 验证：公开测试 10/10；seed 42、123、55555 以及若干随机 seed 均通过。
- 两个容易误解的点：`cmp` 只更新标志位、不保存结果；跳转表下标与 `p3_case_N` 编号不是同一个数。

## 7. 备忘

- 报告 `report.md` 第五节需要：关键汇编、计算关系、推理过程、公开列表之外的 seed 验证记录、运行截图（存 `images/`）。
- 跳转表是这一关的核心知识点，报告里值得单独讲清"表怎么存、怎么查"。
- `phase03_annotated.S` 和本文件都在 `.gitignore` 中，只留在本地。
