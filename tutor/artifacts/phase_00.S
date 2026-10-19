
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000401480 <phase_00>:
  401480:	endbr64
  401484:	push   %rbp
  401485:	mov    %rsp,%rbp
  401488:	push   %r14
  40148a:	push   %rbx
  40148b:	mov    %rdi,%rbx
  40148e:	sub    $0x10,%rsp
  401492:	mov    %fs:0x28,%r14
  40149b:	mov    %r14,-0x18(%rbp)
  40149f:	mov    %rsi,%r14
  4014a2:	mov    $0x2,%esi
  4014a7:	call   401540 <valid_u32_fields>
  4014ac:	test   %al,%al
  4014ae:	jne    4014d0 <phase_00+0x50>
  4014b0:	xor    %eax,%eax
  4014b2:	mov    -0x18(%rbp),%rdx
  4014b6:	sub    %fs:0x28,%rdx
  4014bf:	jne    40150c <phase_00+0x8c>
  4014c1:	add    $0x10,%rsp
  4014c5:	pop    %rbx
  4014c6:	pop    %r14
  4014c8:	pop    %rbp
  4014c9:	ret
  4014ca:	nopw   0x0(%rax,%rax,1)
  4014d0:	xor    %eax,%eax
  4014d2:	lea    -0x20(%rbp),%rdx
  4014d6:	lea    -0x1c(%rbp),%rcx
  4014da:	mov    $0x402041,%esi
  4014df:	mov    %rbx,%rdi
  4014e2:	call   401150 <__isoc99_sscanf@plt>
  4014e7:	cmp    $0x2,%eax
  4014ea:	jne    4014b0 <phase_00+0x30>
  4014ec:	mov    %r14,%rdi
  4014ef:	shr    $0x5,%rdi
  4014f3:	movzbl %dil,%edi
  4014f7:	xor    $0x2a,%edi
  4014fa:	cmp    %edi,-0x20(%rbp)
  4014fd:	jne    4014b0 <phase_00+0x30>
  4014ff:	call   401470 <tutorial_mix>
  401504:	cmp    %eax,-0x1c(%rbp)
  401507:	sete   %al
  40150a:	jmp    4014b2 <phase_00+0x32>
  40150c:	call   401120 <__stack_chk_fail@plt>

Disassembly of section .fini:
