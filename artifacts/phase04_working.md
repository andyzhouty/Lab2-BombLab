# 第 4 关 · 档案馆 —— 工作笔记

> 用途：记录第 4 关的进度、待回答的问题、用到的命令和观察结果。
> 约定：每完成一项就把 `[ ]` 改成 `[x]`；观察到的数值填进表格；结论追加到第 6 节。

目录

| 小节                                      | 内容                           |
| ----------------------------------------- | ------------------------------ |
| [1. 关卡信息](#1-关卡信息)                 | 函数、地址、知识点             |
| [2. 进度清单](#2-进度清单)                 | Q1~Q8 的完成情况               |
| [3. 命令速查](#3-命令速查)                 | 导出汇编、递归调试、验证       |
| [4. 待回答问题](#4-待回答问题)             | 分阶段的引导问题               |
| [5. 观察记录表](#5-观察记录表gdb-实测填写) | 递归各层的参数与返回值（待填） |
| [6. 已确认结论](#6-已确认结论随进度追加)   | 目前确定的关系                 |
| [7. 备忘](#7-备忘)                         | 报告要求、草稿清理             |

## 1. 关卡信息

| 项目            | 内容                                                                                                          |
| --------------- | ------------------------------------------------------------------------------------------------------------- |
| 主函数          | `bool phase_04(const char *input, uint64_t challenge)`，入口 `0x4023b0`                                   |
| 递归函数        | `p4_walk`，入口 `0x402340`，会调用自己                                                                    |
| 知识点          | 递归调用与返回过程                                                                                            |
| 与第 3 关的区别 | 第 3 关是"跳转表分派到不同函数"；这一关是"同一个函数反复调用自己"，读法要看递归参数怎么变、返回值怎么层层组合 |

## 2. 进度清单

- [X] 导出 `artifacts/phase_04.S` 与 `artifacts/p4_walk.S`
- [X] Q1 确定口令有几个整数、格式串是什么
- [X] Q2 弄清输入存在栈上哪里
- [X] Q3 写出调用 `p4_walk` 时的四个参数
- [X] Q4 弄清 `p4_walk` 四个参数各自的含义（公式对了，可补上具体数值 0x3f）
- [X] Q5 找出递归的终止条件（写法可以再简化）
- [X] Q6 弄清两个递归分支的区别（参数怎么变、返回值怎么组合）
- [X] Q7 用 GDB 观察递归过程（层数、各层参数、返回值）
- [X] Q8 写出输入的完整表达式并实现 `solve_phase_4`
- [X] 多 seed 验证 + `public_test.py --phase 4`（10/10，另测 5 个非公开 seed）
- [ ] 补进 `report.md` 第六节（含非公开 seed 记录与截图）

## 3. 命令速查

```bash
cd ~/ics/Lab2-BombLab-Copy

# 已经导出过，需要重新导出时：
objdump -d --no-show-raw-insn --disassemble=phase_04 ./bomb > artifacts/phase_04.S
objdump -d --no-show-raw-insn --disassemble=p4_walk ./bomb > artifacts/p4_walk.S

# 看符号
nm bomb | grep -i 'p4'

# 交互调试
gdb ./bomb
```

递归相关的 GDB 用法（这是本关的新内容）：

```gdb
set pagination off
break *p4_walk
run --seed 42 --phase 4 < /tmp/p4.txt

bt                  # 看当前在第几层递归，调用链一目了然
info args           # 没有调试信息时不可用；改用下面的寄存器
info registers rdi rsi rdx rcx
finish              # 执行到本层返回，然后 p $eax 看返回值
continue            # 继续递归
```

想看每一层递归的参数，可以直接用现成的脚本：

```bash
./artifacts/p4_trace.sh 42
```

输出形如（seed 42）：

```
depth=1  rdi=114 rsi=0   rdx=127 rcx=0xbdf4c81d
depth=2  rdi=114 rsi=64  rdx=127 rcx=0xbdf4c81d
depth=3  rdi=114 rsi=96  rdx=127 rcx=0xbdf4c81d
depth=4  rdi=114 rsi=112 rdx=127 rcx=0xbdf4c81d
depth=5  rdi=114 rsi=112 rdx=118 rcx=0xbdf4c81d
depth=6  rdi=114 rsi=112 rdx=114 rcx=0xbdf4c81d
depth=7  rdi=114 rsi=114 rdx=114 rcx=0xbdf4c81d
```

七行就是七层递归，参数在逐层变化，变化规律留给你自己总结。

脚本用 GDB 的 Python 接口统计调用深度（GDB 本身没有现成的深度变量），
命令都写在 `/tmp/p4_depth.gdb` 里，可以打开看。

注意输入只需要一个数（这一关只解析 1 个整数），写 `0` 就能走到递归。

想看每一层的返回值，用另一个脚本：

```bash
./artifacts/p4_return.sh 42
```

输出（seed 42）：

```
返回值出现的顺序（从最内层到最外层）：
  终止返回  eax=3186936143
  分支A返回 eax=2217382777
  分支B返回 eax=831222507
  分支B返回 eax=693538885
  分支A返回 eax=3254220889
  分支A返回 eax=4161970541
  分支A返回 eax=1438854145

最内层（终止情形）返回值：3186936143
最外层返回值：            1438854145
返回总层数：              7
```

顺序是从最内层往外，最后一行就是 `phase_04` 拿去和输入比较的值。
不同 seed 的层数不一样（比如 seed 55555 只有 3 层），差别出在哪里可以自己对照目标值想一想。

验证（写完 solver 之后）：

```bash
make
./defuser --seed 42    --phase 4 | ./bomb --seed 42    --phase 4
./defuser --seed 55555 --phase 4 | ./bomb --seed 55555 --phase 4
python3 public_test.py --phase 4
```

## 4. 待回答问题

### Q1：几个整数？格式串是什么？

> 看 `phase_04` 里 `valid_u32_fields` 前面的 `mov $?,%esi`，
> 以及 `sscanf` 之后的 `cmp $?,%eax`。
> 格式串地址是 `0x403189`，用 `x/s` 看内容。

答：1 个整数，格式串是 `"%u"`（地址 `0x403189`）。

### Q2：输入存在哪？

> 看 `4023e2: lea -0x14(%rbp),%rdx`，这是 `sscanf` 的第几个参数？

答：`rbp-0x14`，是 `sscanf` 的第 3 个参数（`rdx`）。

### Q3：调用 `p4_walk` 的四个参数

> 看 `4023f8` ~ `402413` 这一段，逐条把四个参数的表达式写出来。
> 提示：
>
> - `and $0x7f,%edi` 表示只保留低 7 位；
> - `shr $0x7,%rcx` 后再 `xor %eax,%ecx`，注意两个值各自取自 challenge 的哪一段。

| 参数    | 寄存器  | 表达式                                           |
| ------- | ------- | ------------------------------------------------ |
| 第 1 个 | `rdi` | challenge & 0x7f                                 |
| 第 2 个 | `rsi` | 0                                                |
| 第 3 个 | `rdx` | 0x7f                                             |
| 第 4 个 | `rcx` | (uint32_t)((challenge >> 7) ^ (challenge >> 32)) |



### Q4：四个参数的含义

> 读 `p4_walk` 开头六条指令：
>
> ```asm
> 402344:	mov    %edi,%eax
> 402346:	mov    %edx,%edi
> 402348:	sub    %esi,%edi
> 40234a:	shr    $1,%edi
> 40234c:	add    %esi,%edi
> ```
>
> 这五条算出了一个"中间值"，它由 `esi`、`edx` 决定。结合参数的实际取值
> （第 2 个是 0、第 3 个是 0x7f），想一想这个中间值是什么？

答：

eax = edi

edi = edx = 0x7f

edi -= esi = 0x7f

edi >>= 1

edi += esi

即， edi = (edx - esi)/2 + esi = (edx + esi) / 2;

### Q5：终止条件

> `40234e` 的 `cmp` 和 `402350` 的 `je` 构成终止条件。
> 相等时跳到 `4023a0`，那里只有两条运算指令。
>
> 问：什么情况下递归停止？终止时返回什么？

答：

(challenge & 0xffff) & 0x7f == edi

返回(rdi + 0xe0) ^ ((uint32_t)((challenge >> 7) ^ (challenge >> 32)))

### Q6：两个递归分支

> `40235e: cmp %edi,%eax` + `402360: jb 402380` 决定走哪一边。
>
> 请分别回答：
>
> 1. 什么时候走分支 A（`402362`）？递归时哪个参数变了、变成多少？
> 2. 什么时候走分支 B（`402380`）？递归时哪个参数变了、变成多少？
> 3. 两个分支拿到返回值后，做的运算有区别吗？区别在哪条指令？

答：

eax = challenge & 0x7f

eax  >= edi时走A

esi = rdi + 1

edi = eax

eax < edi时走B

edx = rdi - 1

edi = eax

拿到返回值后A分支

eax = 3 * rax

eax ^= ebx

eax ^= 0x1a

B分支

eax = 3 * rax

eax ^= ebx

eax ^= 0x10

### Q7：用 GDB 观察递归

> 建议至少观察两点：
>
> 1. 第一次进入 `p4_walk` 时四个参数的值；
> 2. 递归调用了几层（用 `bt` 看调用链长度）。

实测记录填到第 5 节。

### Q8：最终的表达式

> 把 Q3（参数）、Q4~Q6（递归逻辑）串起来，说明输入应该等于什么。
> 如果你能用一段文字把递归描述清楚（"在某个区间里…"），代码自然就出来了。

答：

```c
uint32_t p4_walk(uint32_t t, uint32_t low, uint32_t high, uint32_t mix) {
    uint32_t mid = (high - low) / 2 + low;
    if (mid == t)
        return (mid + 0xe0) ^ mix;

    uint32_t base = mid + mix;
    if (t >= mid)
        return ((3 * p4_walk(t, mid + 1, high, mix)) ^ base) ^ 0x1a;
    else
        return ((3 * p4_walk(t, low, mid - 1, mix)) ^ base) ^ 0x10;
}

/* 输入应该等于： */
values[0] = p4_walk(challenge & 0x7f, 0, 0x7f,
                    (uint32_t)((challenge >> 7) ^ (challenge >> 32)));
```

一句话描述：在区间 `[0, 127]` 里二分查找目标值，
路径上每经过一个中点就把 `mid + mix` 和上一层的结果揉进返回值，
向左走异或 `0x10`，向右走异或 `0x1a`，找到时返回 `(mid + 0xe0) ^ mix`。

## 5. 观察记录表（GDB 实测填写）

### 5.1 首次调用 `p4_walk` 的参数（seed 42）

| 参数               | 寄存器的值 |
| ------------------ | ---------- |
| 第 1 个（`rdi`） | 0x72       |
| 第 2 个（`rsi`） | 0          |
| 第 3 个（`rdx`） | 0x7f       |
| 第 4 个（`rcx`） | 0xbdf4c81d |

（先跑 `./bomb --seed 42 --phase 4` 拿到 challenge，再在 `0x402415` 下断点看；
或者直接跑 `./artifacts/p4_trace.sh 42`，第一行就是这一层。）

### 5.2 递归层数与返回值

| 观察点                        | 你看到的   |
| ----------------------------- | ---------- |
| 递归最大深度（`bt` 的层数） | 7          |
| 最内层（终止情形）返回的值    | 3186936143 |
| 最外层的返回值                | 1438854145 |

## 6. 已确认结论（随进度追加）

- Q1：口令是 1 个整数，格式串 `"%u"`。
- Q2：存在 `rbp-0x14`，是 `sscanf` 的第 3 个参数。
- Q3：调用 `p4_walk` 的四个参数是
  `challenge & 0x7f`、`0`、`0x7f`、`(challenge >> 7) ^ (challenge >> 32)`。
- Q4：开头五条指令算的是区间中点 `mid = low + (high - low) / 2`；
  seed 42 时四个参数是 (114, 0, 127, 0xbdf4c81d)，mid 为 63。
- Q5：当 `mid` 等于目标值 `t` 时递归停止，返回 `(mid + 0xe0) ^ mix`。
- Q6：`t >= mid` 走右半边 `[mid+1, high]`，返回值再异或 `0x1a`；
  `t < mid` 走左半边 `[low, mid-1]`，返回值再异或 `0x10`。
  两条支路都要先把递归结果乘 3、再异或 `mid + mix`。
- Q7：seed 42 递归 7 层，最内层返回 3186936143，最外层返回 1438854145。
- Q8：输入就是 `p4_walk` 的返回值，完整表达式见 Q8 的代码。
- 验证：公开测试 10/10；seed 55555、3、777、12345、424242 也都通过。
- 踩过的坑：分支 B 一开始把 `mid - 1` 传给了第 2 个参数（`low`），
  正确应该是第 3 个参数（`high`）。参数传反导致区间不收窄，递归不终止，直接段错误。

## 7. 备忘

- 报告 `report.md` 第六节需要：关键汇编、计算关系、推理过程、公开列表之外的 seed 验证记录、运行截图。
- 递归是这一关的新知识点，报告里值得讲清楚"参数怎么变、返回值怎么组合"。
- 本文件与 `phase04_annotated.S`、`p4_walk.S` 是过程材料，会随仓库提交。
