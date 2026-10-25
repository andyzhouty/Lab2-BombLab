# =============================================================================
# honor_annotated.S —— Honor 关「带注释的汇编副本」（脚手架版）
#
# 本文件是 artifacts/secret_gate.S、artifacts/secret_copy.S、
# artifacts/secret_mix.S、artifacts/secret_phase.S 的注释副本，指令一字未改。
# 现在没有答案，只有：
#   ⬜ 需要你自己看出来的地方
#   🔍 建议配合的观察命令
#
# 与前六关最大的不同：
#   1. 这一关的输入不是几个整数，而是【一行文本】。
#   2. 检查不在一个函数里做完，而是三层：secret_gate 管外壳，
#      secret_copy 只负责搬字符串，secret_phase 检查那三个整数。
#   3. solve_secret 除了 challenge，还多收到一个 context。
#      context 是驱动算好的，你不需要自己推，只要会用。
# =============================================================================


0000000000402730 <secret_gate>:
  402730:	endbr64
  402734:	push   %rbp                           # ┐
  402735:	xor    %eax,%eax                      # │
  402737:	mov    $0x14,%ecx                      # │ ecx = 20，下面 rep stos 要清 20 个 8 字节
  40273c:	mov    %rsp,%rbp                      # │
  40273f:	push   %r14                           # │
  402741:	mov    %rdx,%r14                      # │ r14 = context（第 3 个参数）
  402744:	push   %r13                           # │
  402746:	mov    %rsi,%r13                      # │ r13 = challenge（第 2 个参数）
  402749:	push   %r12                           # │
  40274b:	lea    -0xd0(%rbp),%r12               # │ r12 = 局部缓冲区，起点 rbp-0xd0
  402752:	push   %rbx                           # │
  402753:	mov    %rdi,%rbx                      # │ rbx = input（第 1 个参数，一行文本）
  402756:	mov    %r12,%rdi                      # │
  402759:	sub    $0xb0,%rsp                      # │ 缓冲区共 0xb0 字节
  402760:	rep stos %rax,(%rdi)                   # │ 清 0xa0 字节
  402763:	movl   $0x0,(%rdi)                      # ┘ 再清 4 字节，合计 0xa4
  402769:	mov    %rbx,%rdi
  40276c:	call   401190 <strlen@plt>
  402771:	sub    $0x24,%rax                      # rax = strlen(input) - 36
  402775:	cmp    $0x7f,%rax
  402779:	jbe    402790 <secret_gate+0x60>        # ⬜【填空 1】strlen 必须在什么范围？
                                                         #    提示：这里是无符号比较（jbe），减出负数会变成一个
                                                         #    很大的无符号数。最小值 36 是从哪儿来的？先猜，后面验证。
  40277b:	add    $0xb0,%rsp                      # ┐
  402782:	xor    %eax,%eax                      # │ 失败出口：返回 0
  402784:	pop    %rbx                           # │
  402785:	pop    %r12                           # │
  402787:	pop    %r13                           # │
  402789:	pop    %r14                           # │
  40278b:	pop    %rbp                           # │
  40278c:	ret                                   # ┘
  40278d:	nopl   (%rax)
  402790:	mov    %rbx,%rsi                      # rsi = 源 = input
  402793:	mov    %r12,%rdi                      # rdi = 目标 = 缓冲区
  402796:	call   402710 <secret_copy>
  40279b:	cmpl   $0x4e45504f,-0xb0(%rbp)         # ⬜【填空 2】0x4e45504f 按小端序是哪四个 ASCII 字符？
                                                         #    缓冲区从 rbp-0xd0 开始，这里比的是 rbp-0xb0。
                                                         #    那么这四个字符出现在缓冲区（也就是输入行）的第几个字节处？
                                                         #    🔍 数一数：-0xd0 到 -0xb0 差多少？
  4027a5:	jne    40277b <secret_gate+0x4b>
  4027a7:	mov    %r14,%rdx                      # 第 3 个参数 = context
  4027aa:	mov    %r13,%rsi                      # 第 2 个参数 = challenge
  4027ad:	lea    -0xac(%rbp),%rdi               # ⬜【填空 3】第 1 个参数是 rbp-0xac，
                                                         #    它是缓冲区的第几个字节？（缓冲区起点 rbp-0xd0）
                                                         #    为什么要从那里开始，而不是从缓冲区开头？
  4027b4:	call   402650 <secret_phase>
  4027b9:	add    $0xb0,%rsp
  4027c0:	pop    %rbx
  4027c1:	pop    %r12
  4027c3:	pop    %r13
  4027c5:	pop    %r14
  4027c7:	pop    %rbp
  4027c8:	ret


0000000000402710 <secret_copy>:
  402710:	endbr64
  402714:	xor    %eax,%eax                      # rax = 0，当计数器兼下标
  402716:	cs nopw 0x0(%rax,%rax,1)
  402720:	movzbl (%rsi,%rax,1),%edx             # 读源串第 rax 个字节
  402724:	mov    %dl,(%rdi,%rax,1)               # 写到目标第 rax 个字节
  402727:	add    $0x1,%rax
  40272b:	test   %dl,%dl                        # 读到 0 就停
  40272d:	jne    402720 <secret_copy+0x10>
  40272f:	ret
                                                         # ⬜【填空 4】这个函数等价于 C 库里的哪个函数？
                                                         #    它有没有检查目标缓冲区够不够大？（看循环里有没有长度上限）


0000000000402630 <secret_mix>:
  402630:	endbr64
  402634:	mov    %edi,%eax                      # eax = x
  402636:	rol    $0x7,%eax                      # ⬜【填空 5】写出 secret_mix(x) 的表达式（32 位）
  402639:	add    $0xb1d1,%eax
  40263e:	xor    $0x85fd,%eax
  402643:	ret


0000000000402650 <secret_phase>:
  402650:	endbr64
  402654:	push   %rbp
  402655:	mov    %rsp,%rbp
  402658:	push   %r13                           # ┐
  40265a:	mov    %rdx,%r13                      # │ r13 = context（第 3 个参数）
  40265d:	push   %r12                           # │
  40265f:	mov    %rsi,%r12                      # │ r12 = challenge（第 2 个参数）
  402662:	mov    $0x3,%esi                      # │ ⬜【填空 6】这个 3 表示要解析几个整数？
  402667:	push   %rbx                           # │
  402668:	mov    %rdi,%rbx                      # │ rbx = input（第 1 个参数，注意已经跳过了前 36 个字节）
  40266b:	sub    $0x18,%rsp                      # ┘
  40266f:	call   402c80 <valid_u32_fields>
  402674:	test   %al,%al
  402676:	jne    402690 <secret_phase+0x40>
  402678:	xor    %edx,%edx                      # ┐
  40267a:	add    $0x18,%rsp                      # │ 失败出口：返回 0
  40267e:	mov    %edx,%eax                      # │
  402680:	pop    %rbx                           # │
  402681:	pop    %r12                           # │
  402683:	pop    %r13                           # │
  402685:	pop    %rbp                           # │
  402686:	ret                                   # ┘
  402687:	nopw   0x0(%rax,%rax,1)
  402690:	xor    %eax,%eax
  402692:	lea    -0x24(%rbp),%r8                # 第 5 个参数 = &num3
  402696:	lea    -0x28(%rbp),%rcx                # 第 4 个参数 = &num2
  40269a:	mov    $0x403183,%esi                # ⬜【填空 7】格式串是什么？
                                                         #    🔍 gdb -batch -ex 'x/s 0x403183' ./bomb
  40269f:	lea    -0x2c(%rbp),%rdx                # 第 3 个参数 = &num1
  4026a3:	mov    %rbx,%rdi
  4026a6:	call   4011e0 <__isoc99_sscanf@plt>
  4026ab:	cmp    $0x3,%eax
  4026ae:	jne    402678 <secret_phase+0x28>

# ---- 第一处检查：第一个整数 ----
  4026b0:	mov    %r13d,%ecx                    # ecx = context 的低 32 位
  4026b3:	xor    %edx,%edx
  4026b5:	and    $0x3,%ecx                      # ecx = context & 3
  4026b8:	cmp    %ecx,-0x2c(%rbp)               # ⬜【填空 8】第一个整数必须等于什么？
  4026bb:	jne    40267a <secret_phase+0x2a>

# ---- 第二处检查：第二个整数 ----
  4026bd:	mov    %r12,%rsi                     # rsi = challenge
  4026c0:	imul   $0xb1d1,%ecx,%r9d              # r9d = 0xb1d1 * (context & 3)
  4026c7:	mov    %r13,%r8                      # r8 = context
  4026ca:	shr    $0x20,%rsi                     # rsi = challenge >> 32
  4026ce:	shr    $0x20,%r8                      # r8 = context >> 32
  4026d2:	xor    %r12d,%esi                     # esi = (challenge >> 32) ^ (u32)challenge
  4026d5:	xor    %r13d,%r8d                     # r8d = (context >> 32) ^ (u32)context
  4026d8:	shr    $0x10,%r13                     # r13 = context >> 16
  4026dc:	mov    %esi,%edi
  4026de:	xor    %r13d,%r9d                     # ⬜ r9d ^= (u32)(context >> 16)
  4026e1:	xor    %r8d,%edi                      # edi = esi ^ r8d
  4026e4:	call   402630 <secret_mix>
  4026e9:	xor    %r9d,%eax                      # eax = secret_mix(edi) ^ r9d
  4026ec:	cmp    %eax,-0x28(%rbp)               # ⬜【填空 9】第二个整数必须等于什么？用 challenge 和 context 表示
  4026ef:	jne    40267a <secret_phase+0x2a>

# ---- 第三处检查：第三个整数 ----
  4026f1:	shr    $0x7,%esi                     # esi = esi >> 7（esi 还是上面那个异或结果）
  4026f4:	lea    0x85fd(%r8,%rcx,1),%edx         # edx = 0x85fd + r8 + rcx（lea 只做加法）
  4026fc:	add    %esi,%edx                     # edx += esi
  4026fe:	xor    %edx,%eax                      # eax = 第二处那个值 ^ edx
  402700:	cmp    -0x24(%rbp),%eax                # ⬜【填空 10】第三个整数必须等于什么？
  402703:	sete   %dl                            # 相等时 dl = 1
  402706:	jmp    40267a <secret_phase+0x2a>
  40270b:	nopl   0x0(%rax,%rax,1)


# -----------------------------------------------------------------------------
# 【拼装】这一关要输出的是一行文本，不是整数
#
# ⬜【填空 11】把整行写出来：
#
#     第 0~31 字节：                        （32 个字节，内容由你决定）
#     第 32~35 字节：                       （四个字母）
#     第 36 字节起：                        （三个整数，空格分隔）
#
#     整行长度必须在            到            之间。
#
# 注意 out 的容量是 ANSWER_CAP = 256，整行放得下。
# =============================================================================
