# =============================================================================
# phase_01.S —— 第 1 关分析笔记
# 原始汇编由 objdump -d --no-show-raw-insn 导出，注释是本人自己推导的结论。
# 地址来自本人的 bomb，换机器/重新领取炸弹时地址可能需要重新确认。
# =============================================================================


# -----------------------------------------------------------------------------
# 一、关卡函数：phase_01
#     C 原型：bool phase_01(const char *input, uint64_t challenge)
#     入口时：rdi = input 字符串，rsi = challenge
# -----------------------------------------------------------------------------
0000000000402090 <phase_01>:
  402090:	endbr64
  402094:	push   %rbp                           # 函数序言（保存现场，可略过）
  402095:	mov    %rsp,%rbp
  402098:	push   %r12
  40209a:	mov    %rsi,%r12                      # 保存 challenge（rsi 马上要被覆盖）
  40209d:	mov    $0x1,%esi                      # ★【个数】valid_u32_fields 的第 2 个参数 = 1
  4020a2:	push   %rbx
  4020a3:	mov    %rdi,%rbx                      # 保存 input
  4020a6:	sub    $0x10,%rsp
  4020aa:	call   402c80 <valid_u32_fields>      # valid_u32_fields(input, 1)：只检查格式
  4020af:	test   %al,%al
  4020b1:	jne    4020c0 <phase_01+0x30>         # 格式合法 → 4020c0
  4020b3:	add    $0x10,%rsp                      # 失败路径（返回 false）
  4020b7:	xor    %eax,%eax
  4020b9:	pop    %rbx
  4020ba:	pop    %r12
  4020bc:	pop    %rbp
  4020bd:	ret
  4020be:	xchg   %ax,%ax
  4020c0:	xor    %eax,%eax                      # 成功路径入口
  4020c2:	lea    -0x14(%rbp),%rdx               # sscanf 第 3 个参数 = &values[0]（栈上 4 字节）
  4020c6:	mov    $0x403189,%esi                 # sscanf 第 2 个参数 = 格式串，内容是 "%u"
  4020cb:	mov    %rbx,%rdi                      # sscanf 第 1 个参数 = input
  4020ce:	call   4011e0 <__isoc99_sscanf@plt>   # sscanf(input, "%u", &values[0])
  4020d3:	cmp    $0x1,%eax                      # 必须成功解析出 1 个数
  4020d6:	jne    4020b3 <phase_01+0x23>         # 否则返回 false
  4020d8:	mov    %r12,%rdi                      # 参数 = challenge
  4020db:	call   402050 <p1_compute>            # 算出本关要求的那个整数，放在 eax
  4020e0:	cmp    %eax,-0x14(%rbp)               # ★ 比较：输入的 values[0] 是否等于 p1_compute 的返回值
  4020e3:	sete   %al                            # 相等则 al = 1（返回 true）
  4020e6:	add    $0x10,%rsp
  4020ea:	pop    %rbx
  4020eb:	pop    %r12
  4020ed:	pop    %rbp
  4020ee:	ret


# -----------------------------------------------------------------------------
# 二、调度函数：p1_compute
#     它自己不做运算，只负责"切 challenge → 喂给三个 helper → 组合结果"
#     入口时：rdi = challenge（完整 64 位）
# -----------------------------------------------------------------------------
0000000000402050 <p1_compute>:
  402050:	endbr64
  402054:	push   %rbp
  402055:	mov    %rdi,%rdx                      # rdx = challenge（完整 64 位，后面一直没变）
  402058:	mov    %rdi,%rax                      # rax = challenge
  40205b:	shr    $0x20,%rax                      # rax = challenge >> 32
  40205f:	mov    %rdx,%rsi                      # rsi = challenge
  402062:	mov    %eax,%edi                      # (A) edi = challenge 的高 32 位
  402064:	shr    $0x10,%rsi                      # (B) rsi = challenge >> 16（0x10 = 16）
  402068:	mov    %rsp,%rbp
  40206b:	call   402030 <p1_step1>               # (C) 参数1 = 高 32 位
                                                 #     参数2 = (uint32_t)(challenge >> 16)
                                                 #     函数体只写 %esi，所以高位被丢掉，实际是第 16~47 位
  402070:	mov    %edi,%esi                      # (D) p1_step1 没有写过 edi，所以 esi 仍是"高 32 位"
  402072:	mov    %edx,%edi                      # (E) edi = challenge 的低 32 位
  402074:	mov    %eax,%ecx                      # (G) ecx = p1_step1 的返回值（先存起来，下一步 call 会覆盖 eax）
  402076:	call   402020 <p1_step0>               # (F) 参数1 = 低 32 位，参数2 = 高 32 位
  40207b:	mov    %ecx,%esi                      # esi = p1_step1 的结果
  40207d:	mov    %eax,%edi                      # edi = p1_step0 的结果
  40207f:	call   402040 <p1_step2>               # (H) 参数1 = p1_step0 的结果，参数2 = p1_step1 的结果
  402084:	pop    %rbp
  402085:	ret                                   # (I) 返回值 = p1_step2 的返回值（在 eax 里）


# -----------------------------------------------------------------------------
# 三、三个 helper（每个只有 2~3 条有效指令）
#     约定：参数在 rdi、rsi，返回值在 eax
# -----------------------------------------------------------------------------
0000000000402020 <p1_step0>:
  402020:	endbr64
  402024:	lea    (%rdi,%rdi,4),%eax               # eax = rdi + rdi*4 = rdi*5
  402027:	add    %esi,%eax                        # eax += rsi
  402029:	xor    $0x57bb,%eax                      # eax ^= 0x57bb
  40202e:	ret                                   # 返回 (rdi*5 + rsi) ^ 0x57bb       【3 条指令 → 3 个运算】

0000000000402030 <p1_step1>:
  402030:	endbr64
  402034:	xor    $0xdcf,%esi                       # 注意：先异或，再 lea；改的是第 2 个参数
  40203a:	lea    (%rsi,%rdi,4),%eax               # eax = rsi + rdi*4
  40203d:	ret                                   # 返回 (rsi ^ 0xdcf) + rdi*4        【2 条指令 → 2 个运算】

0000000000402040 <p1_step2>:
  402040:	endbr64
  402044:	lea    0xf9b4(%rsi),%eax                # eax = rsi + 0xf9b4
  40204a:	xor    %edi,%eax                        # eax ^= edi
  40204c:	ret                                   # 返回 (rsi + 0xf9b4) ^ edi         【2 条指令 → 2 个运算】


# =============================================================================
# 四、自查表（学生自行推导，已核对）
#
#   challenge = 0x28efe333b266f103（seed 42 实测值）
#     low  = (uint32_t)challenge          = 0xb266f103   → 低 32 位
#     high = (uint32_t)(challenge >> 32)  = 0x28efe333   → 高 32 位
#     mid  = (uint32_t)(challenge >> 16)  = 0xe333b266   → 第 16~47 位
#
#   step1 = (mid  ^ 0xdcf)  + high * 4
#   step0 = (low  * 5 + high) ^ 0x57bb
#   口令  = (step1 + 0xf9b4) ^ step0          ← p1_step2(step0, step1) 展开
#
#   验证记录（自己的实验，写报告时要用公开 seed 之外的值再补一次）：
#     GDB: break *p1_step1 / *p1_step0 / *p1_step2 观察参数
#          p1_step1: rdi = 0x28efe333(=high), rsi = 0x28efe333b266(→ 只用 esi = 0xe333b266 = mid)
#          p1_step0: rdi = 0xb266f103(=low), rsi = 0x28efe333(=high)
#          p1_step2: rdi = 0xa4f2cff9(=step0 结果), rsi = 0x86f34c75(=step1 结果)
# =============================================================================
