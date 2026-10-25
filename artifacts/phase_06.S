
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

00000000004025d0 <phase_06>:
  4025d0:	endbr64
  4025d4:	push   %rbp
  4025d5:	mov    %rsp,%rbp
  4025d8:	push   %r12
  4025da:	mov    %rsi,%r12
  4025dd:	mov    $0x1,%esi
  4025e2:	push   %rbx
  4025e3:	mov    %rdi,%rbx
  4025e6:	sub    $0x10,%rsp
  4025ea:	call   402c80 <valid_u32_fields>
  4025ef:	test   %al,%al
  4025f1:	jne    402600 <phase_06+0x30>
  4025f3:	add    $0x10,%rsp
  4025f7:	xor    %eax,%eax
  4025f9:	pop    %rbx
  4025fa:	pop    %r12
  4025fc:	pop    %rbp
  4025fd:	ret
  4025fe:	xchg   %ax,%ax
  402600:	xor    %eax,%eax
  402602:	lea    -0x14(%rbp),%rdx
  402606:	mov    $0x403189,%esi
  40260b:	mov    %rbx,%rdi
  40260e:	call   4011e0 <__isoc99_sscanf@plt>
  402613:	cmp    $0x1,%eax
  402616:	jne    4025f3 <phase_06+0x23>
  402618:	mov    %r12,%rdi
  40261b:	call   402580 <p6_dispatch>
  402620:	cmp    %eax,-0x14(%rbp)
  402623:	sete   %al
  402626:	add    $0x10,%rsp
  40262a:	pop    %rbx
  40262b:	pop    %r12
  40262d:	pop    %rbp
  40262e:	ret

Disassembly of section .fini:
