# Honor · 交接记录 —— 工作笔记

> 用途：记录 Honor 关的进度、待回答的问题、用到的命令和观察结果。
> 约定：每完成一项就把 `[ ]` 改成 `[x]`；观察到的数值填进表格；结论追加到第 6 节。

目录

| 小节                                    | 内容                       |
| --------------------------------------- | -------------------------- |
| [1. 关卡信息](#1-关卡信息)               | 函数、参数、知识点         |
| [2. 进度清单](#2-进度清单)               | Q1~Q9 的完成情况           |
| [3. 命令速查](#3-命令速查)               | 导出汇编、观察、验证       |
| [4. 待回答问题](#4-待回答问题)           | 分阶段的引导问题           |
| [5. 观察记录表](#5-观察记录表实测填写)   | 检查值、输出行结构（待填） |
| [6. 已确认结论](#6-已确认结论随进度追加) | 目前确定的关系             |
| [7. 备忘](#7-备忘)                       | 报告要求                   |

## 1. 关卡信息

| 项目       | 内容                                                                              |
| ---------- | --------------------------------------------------------------------------------- |
| 求解接口   | `int solve_secret(uint64_t challenge, uint64_t context, char *out, size_t cap)` |
| 最外层     | `secret_gate(input, challenge, context)`，入口 `0x402730`                     |
| 字符串复制 | `secret_copy`，入口 `0x402710`                                                |
| 单次变换   | `secret_mix`，入口 `0x402630`                                                 |
| 整数检查   | `secret_phase`，入口 `0x402650`                                               |
| 整数格式串 | `0x403183`                                                                      |
| 输出容量   | `ANSWER_CAP = 256`                                                              |
| 知识点     | 字符串、长度检查、多层调用、前六关结果组成的 context                              |

与前六关最大的不同：输入是一行文本，输出也是一行文本；口令不再是“几个整数”，而是一整行字符。

## 2. 进度清单

- [X] 导出 `artifacts/secret_gate.S`、`secret_copy.S`、`secret_mix.S`、`secret_phase.S`
- [ ] Q1 弄清输入形式、要解析几个整数、格式串
- [ ] Q2 弄清整行长度的允许范围，以及最小值是怎么来的
- [ ] Q3 认出 `secret_copy` 等价于哪个库函数
- [ ] Q4 弄清 `0x4e45504f` 的含义，以及它出现在输入行的第几个字节
- [ ] Q5 写出 `secret_mix` 的表达式
- [ ] Q6 写出第一个整数的计算式
- [ ] Q7 写出第二个整数的计算式
- [ ] Q8 写出第三个整数的计算式
- [ ] Q9 拼出整行输出并实现 `solve_secret`
- [ ] 多 seed 验证 + `public_test.py`
- [ ] 补进 `report.md`（含非公开 seed 记录与截图）

## 3. 命令速查

```bash
cd ~/ics/Lab2-BombLab-Copy

# 反汇编（已导出，需要重来时用）
objdump -d --no-show-raw-insn --disassemble=secret_gate  ./bomb > artifacts/secret_gate.S
objdump -d --no-show-raw-insn --disassemble=secret_copy  ./bomb > artifacts/secret_copy.S
objdump -d --no-show-raw-insn --disassemble=secret_mix   ./bomb > artifacts/secret_mix.S
objdump -d --no-show-raw-insn --disassemble=secret_phase ./bomb > artifacts/secret_phase.S

# 看符号
nm -S bomb | grep -i secret

# 看格式串
gdb -batch -ex 'x/s 0x403183' ./bomb
```

观察脚本：

```bash
./artifacts/honor_trace.sh 42
```

它会在 `secret_gate` 入口打印 challenge 与 context，在 `OPEN` 比较处打印实际读到的四个字节，并打印四处检查的计算值与输入值。

验证（写完 solver 之后）：

```bash
make

# 单关：前六关的口令 + Honor 那一行
{ ./defuser --seed 42; ./defuser --seed 42 --secret; } | ./bomb --seed 42

# 直接看 Honor 那一行
./defuser --seed 42 --secret

# 公开测试
python3 public_test.py
```

## 4. 待回答问题

### Q1：输入是什么形式？

> ```asm
>  402662:	mov    $0x3,%esi
>  40266f:	call   402c80 <valid_u32_fields>
>  40269a:	mov    $0x403183,%esi
> ```

> 问：这一关要从输入里解析几个整数？格式串是什么？
> 这些整数是从整行的第几个字节开始解析的？（看 `secret_gate` 传给 `secret_phase` 的
> 第 1 个参数是 `rbp-0xac`，而缓冲区起点是 `rbp-0xd0`）

答：3个整数，"%u %u %u"
从第37个字节开始解析

### Q2：整行的长度范围

> ```asm
>  40276c:	call   401190 <strlen@plt>
>  402771:	sub    $0x24,%rax
>  402775:	cmp    $0x7f,%rax
>  402779:	jbe    402790
> ```

> 问：`strlen(input)` 必须在什么范围内？为什么最小值是 36 而不是 0？
> 提示：`jbe` 是无符号比较，`strlen - 36` 若为负数会变成一个极大的无符号数。
> 结合 Q4 里 `OPEN` 的位置想一想，36 这个数和它有没有关系。

答：`strlen(input)`必须在36~163之间，402771将strlen(input)-36赋值给rax，如果小于36，会得到一个极大无符号数

### Q3：`secret_copy` 做了什么？

> ```asm
>  402720:	movzbl (%rsi,%rax,1),%edx
>  402724:	mov    %dl,(%rdi,%rax,1)
>  40272b:	test   %dl,%dl
>  40272d:	jne    402720
> ```

> 问：这个函数等价于 C 库里的哪个函数？它有没有检查目标缓冲区大小？

答：strcpy，没有检查目标缓冲区大小。

### Q4：`0x4e45504f` 是什么？在哪里？

> ```asm
>  40279b:	cmpl   $0x4e45504f,-0xb0(%rbp)
> ```

> 缓冲区起点是 `rbp-0xd0`，比较的是 `rbp-0xb0`。
>
> 问：`0x4e45504f` 按小端序拆成四个字节是什么？这四个字符应该出现在输入行的第几个字节处？
> 为什么不是第 0 个字节？

答：OPEN，第32~35字节

比较指令的参数是 `rbp-0xb0`，缓冲区起点是 `rbp-0xd0`，两者相差 `0x20`，也就是 32 字节。所以程序读的是从偏移 32 开始的那四个字节，前面的 32 个字节不参与这条比较。

### Q5：`secret_mix` 的表达式

> ```asm
>  402634:	mov    %edi,%eax
>  402636:	rol    $0x7,%eax
>  402639:	add    $0xb1d1,%eax
>  40263e:	xor    $0x85fd,%eax
> ```

> 问：写出 `secret_mix(x)` 的表达式（32 位无符号）。

答：

`(((x << 7) | (x >> 25))+0xb1d1)^0x85fd`

### Q6：第一个整数

> ```asm
>  4026b0:	mov    %r13d,%ecx
>  4026b5:	and    $0x3,%ecx
>  4026b8:	cmp    %ecx,-0x2c(%rbp)
> ```

> 问：第一个整数必须等于什么？用 `context` 表示。

答：
`context & 3`

### Q7：第二个整数

> ```asm
>  4026bd:	mov    %r12,%rsi
>  4026c0:	imul   $0xb1d1,%ecx,%r9d
>  4026c7:	mov    %r13,%r8
>  4026ca:	shr    $0x20,%rsi
>  4026ce:	shr    $0x20,%r8
>  4026d2:	xor    %r12d,%esi
>  4026d5:	xor    %r13d,%r8d
>  4026d8:	shr    $0x10,%r13
>  4026dc:	mov    %esi,%edi
>  4026de:	xor    %r13d,%r9d
>  4026e1:	xor    %r8d,%edi
>  4026e4:	call   402630 <secret_mix>
>  4026e9:	xor    %r9d,%eax
>  4026ec:	cmp    %eax,-0x28(%rbp)
> ```

> 问：先分别写出 `%esi`、`%r8d`、`%r9d`、`%edi` 各是什么（`%r12` 是 challenge，`%r13` 是 context），
> 再写出第二个整数的完整表达式。

答：

`esi = (challenge >>32) ^ (u32)challenge`

`r8d = (context >> 32) ^ (u32)context`

`r9d = (0xb1d1 * (context & 3)) ^ (u32)(context >> 16)`

`edi = ((challenge >>32) ^ (u32)challenge) ^ ((context >> 32) ^ (u32)context)`

第二个整数必须等于

```asm

u32 a = ((challenge >>32) ^ (u32)challenge) ^ ((context >> 32) ^ (u32)context);`
u32 b = (0xb1d1 * (context & 3)) ^ (u32)(context >> 16)
answer2 = ((((a << 7) | (a >> 25))+0xb1d1)^0x85fd) ^ b
```

### Q8：第三个整数

> ```asm
>  4026f1:	shr    $0x7,%esi
>  4026f4:	lea    0x85fd(%r8,%rcx,1),%edx
>  4026fc:	add    %esi,%edx
>  4026fe:	xor    %edx,%eax
>  402700:	cmp    -0x24(%rbp),%eax
> ```

> 问：这里的 `%esi`、`%r8`、`%rcx`、`%eax` 各是什么？
> `lea 0x85fd(%r8,%rcx,1)` 算的是什么？（注意 `lea` 只做加法，不访问内存）

答：

```
esi = ((challenge >>32) ^ (u32)challenge) >> 7;
r8 = (context >> 32) ^ (u32)context;   /* 到 4026f4 时 r8d 已经被异或过了 */
rcx = context & 3;
eax = answer2 ^ ((((context >> 32) ^ (u32)context) + (context & 3) + 0x85fd) + (((challenge >>32) ^ (u32)challenge) >> 7));
```

### Q9：拼出整行并实现

> 问：整行由哪三段组成？各占多少个字节、内容是什么？
> 写出 `solve_secret` 的结构（不必先写完整代码，写清每一段怎么来的即可）。

答：

整行分三段：

| 字节范围 | 内容 | 说明 |
| -------- | ---- | ---- |
| 0 ~ 31   | 32 个填充字符 | 内容不受检查，只要不是 0、不是换行 |
| 32 ~ 35  | `OPEN` | 与 `0x4e45504f` 相等 |
| 36 起    | 三个整数，空格分隔 | 就是上面算出的 n1、n2、n3 |

实现步骤：

1. 依次算出 n1 = `context & 3`、n2、n3（后两个用 Q7、Q8 的式子）；
2. 用 `snprintf(out, cap, "%sOPEN %u %u %u", filler, n1, n2, n3)` 拼出整行；
3. 返回 0。

三个数必须用 `%u` 打印。用 `%d` 时，超过 2^31 的数会变成负数，炸弹解析失败，
这正是最初"部分 seed 不通过"的原因。

## 5. 观察记录表（实测填写）

### 5.1 入口参数（seed 42）

用 `./artifacts/honor_trace.sh 42` 得到：

| 项目                             | 值                  |
| -------------------------------- | ------------------- |
| challenge（第 7 关的 challenge） | 0xccf635ee9e9e2fa4  |
| context                          | 0xe71d5248cf8314d0  |
| 输入行长度                       | 56                  |

### 5.2 四处检查

| 检查       | 计算值 | 与输入比较的位置 |
| ---------- | ------ | ---------------- |
| 第一个整数 | 0          | `rbp-0x2c`     |
| 第二个整数 | 694636912  | `rbp-0x28`     |
| 第三个整数 | 2411961    | `rbp-0x24`     |

### 5.3 整行结构

| 字节范围 | 内容 | 说明 |
| -------- | ---- | ---- |
| 0 ~ 31   | 填充字符（当前用 `0xxx4xxx…28xx`，32 个） | 不受检查，标注偏移便于核对 |
| 32 ~ 35  | `OPEN` | 与 `0x4e45504f` 比较 |
| 36 起    | `n1 n2 n3` | `sscanf` 用 `%u %u %u` 解析 |

## 6. 已确认结论（随进度追加）

- 整行分三段：32 字节前缀、`OPEN`、三个十进制整数。
- 长度必须在 36 到 163 之间；最小值 36 就是“32 字节前缀 + OPEN”。
- n1 = `context & 3`
- n2 = `secret_mix(((challenge >> 32) ^ challenge) ^ ((context >> 32) ^ context)) ^ (0xb1d1 * n1) ^ (context >> 16)`
- n3 = n2 ^ ((0x85fd + ((context >> 32) ^ context) + n1) + (((challenge >> 32) ^ challenge) >> 7))
- 三个数用 `%u` 打印，不能用 `%d`。

## 7. 备忘

- `solve_secret` 收到的 `context` 是驱动用前六关的口令算好的，不需要自己重算 `transcript_context`。
- 输出是一行文本，可以用 `snprintf` 写入；写完返回 0。原来模板返回 1 表示“还没做”。
- 测试命令是 `{ ./defuser --seed S; ./defuser --seed S --secret; } | ./bomb --seed S`，第七条输入就是 Honor 那一行。
