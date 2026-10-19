# 第 2 关 · 钟楼 —— 工作笔记

> **用途**：记录第 2 关的进度、待回答的问题、用到的命令和观察结果，避免反复翻聊天记录。
> **约定**：每完成一项就把 `[ ]` 改成 `[x]`；观察到的数值填进表格；有了新结论就追加到"已确认结论"一节。
> **提醒**：这是草稿文件，提交前删除或不要 `git add`（`report.md` 才是要交的报告）。

---

## 1. 关卡信息

| 项目 | 内容 |
| --- | --- |
| 函数 | `bool phase_02(const char *input, uint64_t challenge)`，入口地址 `0x4020f0` |
| 特点 | 这一关**没有 helper 函数**，全部逻辑都在 `phase_02` 体内（69 行） |
| 知识点 | 数组、循环、递推关系 |

---

## 2. 进度清单

- [x] 导出 `phase_02.S`
- [x] **Q1** 确定口令有几个整数（找 `valid_u32_fields` 前的 `mov $?,%esi`）→ 答：**6**
- [x] **Q2** 填出 6 个整数在栈上的地址与传递参数
- [x] **Q3** 推出第一个数的公式 → 答：`(((uint32_t)(challenge >> 5) * 2) & 0x7e) + 0x1d`（seed 42 得 145，与 GDB 一致）
- [ ] **Q4** 拆出循环三要素（初始化 / 循环体 / 步进 / 出口）
- [ ] **Q5** 弄清变量移位 `shr %cl,%rax` 里 `cl` 的五次取值
- [ ] **Q6** 用 GDB 看 `xor %edi,%eax` 里 `edi` 的五次取值（**最容易错的一步**）
- [ ] **Q7** 写出完整的递推关系式
- [ ] 写 `solve_phase_2`（`values[0..5]`，`count = 6`）
- [ ] 多 seed 验证 + `public_test.py --phase 2`
- [ ] 把结论补进 `report.md` 第四节（含非公开 seed 记录与截图）

---

## 3. 命令速查

```bash
cd ~/ics/Lab2-BombLab-Copy

# 导出这一关的汇编
objdump -d --no-show-raw-insn --disassemble=phase_02 ./bomb > phase_02.S

# 看整个程序的汇编（找被调用的函数时用）
objdump -d --no-show-raw-insn ./bomb > bomb.S

# 交互调试
gdb --args ./bomb --seed 42 --phase 2

# 验证（写完 solver 之后）
make
./defuser --seed 42    --phase 2 | ./bomb --seed 42    --phase 2
./defuser --seed 123   --phase 2 | ./bomb --seed 123   --phase 2
./defuser --seed 55555 --phase 2 | ./bomb --seed 55555 --phase 2   # 非公开 seed，报告要用
python3 public_test.py --phase 2
```

GDB 会话模板（注意：第一个数的检查在循环**之前**，输入必须让第一个数正确才能进循环）：

```bash
printf '<第一个数> 0 0 0 0 0\n' > /tmp/p2.txt
gdb --args ./bomb --seed 42 --phase 2
```

```gdb
set pagination off
break *0x40219f          # 循环体里 cmp 之前那一条
run --seed 42 --phase 2 < /tmp/p2.txt
display/d $edi           # 每次停下来都按十进制显示
display/d $eax
display/d $esi
continue                 # 连按 5 次 = 5 次迭代
```

小技巧：`--challenge` 可以指定 challenge，用 `./bomb --phase 2 --challenge 0` 时所有移位结果都是 0，可以把"递推关系"和"移位取值"分开观察。

---

## 4. 待回答的问题

### Q1：几个整数？

> 找 `call <valid_u32_fields>` 前面那条 `mov $?,%esi`。同样可以对照 `sscanf` 后的 `cmp $?,%eax`。

答：6

### Q2：6 个整数存在哪里？

x86-64 只有 6 个参数寄存器（`rdi`、`rsi`、`rdx`、`rcx`、`r8`、`r9`），第 7、8 个参数要用 `push` 传到栈上。请填表：

| 第几个数 | 栈上地址 | 通过哪个参数传给 `sscanf` |
| --- | --- | --- |
| 1 | `rbp-0x40` | `rdx`（第 3 个参数） |
| 2 | `rbp-0x3c` | `rcx`（第 4 个参数） |
| 3 | `rbp-0x38` | `r8`（第 5 个参数） |
| 4 | `rbp-0x34` | `r9`（第 6 个参数） |
| 5 | `rbp-0x30` | 栈参数，第 7 个（**后** push 的那个） |
| 6 | `rbp-0x2c` | 栈参数，第 8 个（**先** push 的那个） |

并回答：为什么这些地址相差 4 字节？这说明它们是什么类型、在内存里怎么排？

答：它们是连续的 `uint32_t`（4 字节），在栈上构成数组 `values[0..5]`；地址从低到高对应下标从小到大，即 `&values[i] = rbp - 0x40 + 4*i`。

> **卡点记录：为什么会有两次 `lea ...,%rax`？**
>
> `%rax` 被复用了两次，每次 `push` 用的都是**它上面最近的那次写入**：
> - `40212a: lea -0x2c(%rbp),%rax` 写入的值，被 `402137: push %rax` 用掉；
> - `402138: lea -0x30(%rbp),%rax` 重新写入，被 `402143: push %rax` 用掉。
>
> 所以两次 `lea` 都不是多余的，它们压入的是两个不同的地址。**判断寄存器当前的值，永远只看最近一次写入。**
>
> 还要记住：**push 的顺序与参数顺序相反**。栈向下生长，先 push 的落在较高地址，是**第 8 个**参数；后 push 的落在 `[rsp]`，是**第 7 个**参数。
>
> 另外一个容易混的点：`rax` 不是"第几个参数"，它只是为了构造要 push 的值而临时使用的寄存器；参数编号要看 `sscanf` 的原型 `sscanf(input, fmt, &v0, &v1, ...)`。
>
> 验证命令（本人已复跑）：
> ```bash
> gdb -batch -ex 'set pagination off' -ex 'break *0x40214e' \
>     -ex 'run --seed 42 --phase 2 < /tmp/six.txt' \
>     -ex 'info registers rdx rcx r8 r9' -ex 'x/2gx $rsp' ./bomb
> ```
> `rdx/rcx/r8/r9` 打印出第 1~4 个数的地址；`x/2gx $rsp` 打出的两个地址依次是第 7、第 8 个参数（即第 5、第 6 个数）。6 个地址应当相差 4 字节且连续。

### Q3：第一个数的公式

对应汇编（`40215a` ~ `40216e`）：

```asm
40215a:	mov    %r13,%rax    # rax = r13
402160:	shr    $0x5,%rax    # rax >>= 5
402164:	add    %eax,%eax    # eax *= 2
402166:	and    $0x7e,%eax   # eax &= 0x7e
402169:	add    $0x1d,%eax   # eax += 0x1d
40216c:	cmp    %eax,%esi
```

提示：`add %eax,%eax` 相当于 `eax = eax * 2`；`and $0x7e` 保留第 1~6 位；`0x1d` = 29。

答（写成 C 表达式）：

`uint32_t(r13 >> 5) * 2 & 0x7e + 0x1d`   ← 运算顺序对，写法要改（见批注）

更正：`(((uint32_t)(r13 >> 5) * 2) & 0x7e) + 0x1d`

✅ 已核对：写进求解函数的形式是 `(((uint32_t)(challenge >> 5) * 2) & 0x7e) + 0x1d`，代入 seed 42 得 **145**，与 GDB 在 `*0x40216c` 处看到的 `$eax` 一致。
（`r13` 只是分析时的寄存器名，代码里要写成参数名 `challenge`。）

> **批注（Q3）**：运算顺序正确（`>>5` → `*2` → `&0x7e` → `+0x1d`），但有两处要修正：
>
> 1. **C 的运算符优先级会导致算错**。`x * 2 & 0x7e + 0x1d` 会被解析成 `(x*2) & (0x7e + 0x1d)`，因为 `+` 比 `&` 优先级高。seed 42 实测：正确写法得 **145**，错误写法得 **144**。
>    C 运算符优先级（高 → 低）：`* / %` → `+ -` → `<< >>` → 比较 → `&` → `^` → `|`。
>    **把汇编翻译成 C 时，每一步都加括号最保险**——汇编是"按顺序一条条执行"，C 表达式是"按优先级解析"，两者不是一回事。
> 2. `uint32_t(...)` 是 C++ 的函数式转换写法，C 里应写 `(uint32_t)(...)`；另外求解函数里要用参数名 `challenge`，`r13` 只是运行时的寄存器名。
>
> 参考写法：
> ```c
> uint32_t x  = (uint32_t)(challenge >> 5);
> uint32_t v0 = (x * 2 & 0x7e) + 0x1d;      /* 先 (x*2) 和 (x*2)&0x7e，再 +0x1d */
> ```
> 等价变形（可用于交叉验证）：`(x * 2) & 0x7e` 等于 `(x & 0x3f) * 2`。
>
> 自查命令（`$eax` 就是程序算出的期望值）：
> ```bash
> gdb -batch -ex 'set pagination off' -ex 'break *0x40216c' \
>     -ex 'run --seed 42 --phase 2 < /tmp/six.txt' -ex 'p/d $eax' -ex 'p/u $esi' ./bomb
> ```

### Q4：循环三要素

| 要素 | 汇编位置 | 内容 |
| --- | --- | --- |
| 初始化 | `402170` ~ `40217a` | `rdx`、`r8d`、`edi` 各被设成什么？ |
| 循环体 | `402182` ~ `4021a1` | 每次做什么运算？ |
| 步进 | | 哪个寄存器在变？变多少？ |
| 出口条件 | `4021a7` | 什么时候停？ |

补充回答：

- `rdx` 从 `&values[0]` 开始，每次 `add $0x4,%rdx`，它现在指向谁？`add $0x1,%edi` 又是什么？
- `lea (%rsi,%rsi,2),%ecx` = `3 * rsi`，而 `mov (%rdx),%esi` 在它**之后**才执行——这说明 6 个数之间是什么关系？

答：

### Q5：移位量 `cl` 是多少？

```asm
402174:	mov    $0xd,%r8d
40217f:	sub    %edx,%r8d
402182:	lea    (%r8,%rdx,1),%ecx     # cl 就是这里的低 8 位
402190:	shr    %cl,%rax
```

提示：设 `rdx = &values[k]`，先手算，再用 GDB 验证。

先猜五次的值：____ / ____ / ____ / ____ / ____

GDB 实测：

### Q6：`xor %edi,%eax` 里的 `edi` 是几？

注意循环体开头有一条 `add $0x1,%edi`，它在 `xor` **之前**执行。**不要凭直觉，用 GDB 看。**

GDB 实测（5 次）：____ / ____ / ____ / ____ / ____

### Q7：完整递推关系式

答（写成 C 表达式，形如 `values[i] = ...`，并注明 `i` 的取值范围）：

---

## 5. 观察记录表（GDB 实测填写）

| 第几次迭代 | `cl`（移位量） | `edi`（异或值） | `eax`（算出的期望值） | `esi`（实际输入值） |
| --- | --- | --- | --- | --- |
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |

第一个数 `values[0]` = ________（seed 42，challenge = `0x47526757130f9f52`）

---

## 6. 已确认结论（随进度追加）

- **Q1**：口令由 **6 个**整数组成（`4020fd: mov $0x6,%esi`；`402155: cmp $0x6,%eax`）。
- **Q2**：6 个整数在栈上是连续的 `uint32_t values[0..5]`，`&values[i] = rbp-0x40 + 4*i`；前 4 个通过 `rdx/rcx/r8/r9` 传给 `sscanf`，第 5、6 个通过栈参数（第 7、8 个参数）传递。判断寄存器值只看最近一次写入，push 顺序与参数顺序相反。
- **Q3**：`values[0] = (((uint32_t)(challenge >> 5) * 2) & 0x7e) + 0x1d`（= `((challenge >> 5) & 0x3f) * 2 + 29`）。
- **C 语言坑（务必记住）**：把汇编逐条翻译成 C 时，每一步都要加括号。C 的 `+` 比 `&` 优先级高，`x * 2 & 0x7e + 0x1d` 会被解析成 `(x*2) & (0x7e+0x1d)`。

---

## 7. 备忘

- 报告 `report.md` 第四节需要：关键汇编、计算关系、推理过程、**公开列表之外的 seed 验证记录**、运行截图（存 `images/`）。
- 分析用的汇编与笔记统一放在 `artifacts/`（`phase_01.S`、`phase_02.S`、本文件），已随仓库提交。
- 还没处理的草稿：根目录 `bomb.S`（整个程序的完整反汇编，可用 `objdump -d --no-show-raw-insn ./bomb > bomb.S` 随时重新生成）、`tutor/phase_00.S`。

---

## 8. WIP 代码暂存（从 `defuser.c` 移出，保证编译通过）

第 2 关已经推出来的部分暂时记在这里，等 Q4~Q7 推完，再和 `count = 6;` 一起写回 `defuser.c`。

```c
/* solve_phase_2 的中间结果（2026-10-19），尚未完成 */
u32 x  = (u32)(challenge >> 5);
u32 v0 = (x * 2 & 0x7e) + 0x1d;      /* values[0] 的公式，已与 GDB 核对 */
```

> 移出的原因：`v0` 只赋值、未使用，会触发 `-Werror=unused-variable`，导致整个仓库 `make` 失败。
> 提交原则：**每一次提交都要保证 `make` 能通过、已经完成的关卡公开测试仍然全绿。**
