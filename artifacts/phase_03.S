
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

00000000004022c0 <phase_03>:
  4022c0:	endbr64
  4022c4:	push   %rbp
  4022c5:	mov    %rsp,%rbp
  4022c8:	push   %r12
  4022ca:	mov    %rsi,%r12
  4022cd:	mov    $0x2,%esi
  4022d2:	push   %rbx
  4022d3:	mov    %rdi,%rbx
  4022d6:	sub    $0x10,%rsp
  4022da:	call   402c80 <valid_u32_fields>
  4022df:	test   %al,%al
  4022e1:	jne    4022f0 <phase_03+0x30>
  4022e3:	xor    %eax,%eax
  4022e5:	add    $0x10,%rsp
  4022e9:	pop    %rbx
  4022ea:	pop    %r12
  4022ec:	pop    %rbp
  4022ed:	ret
  4022ee:	xchg   %ax,%ax
  4022f0:	xor    %eax,%eax
  4022f2:	lea    -0x14(%rbp),%rcx
  4022f6:	lea    -0x18(%rbp),%rdx
  4022fa:	mov    $0x403186,%esi
  4022ff:	mov    %rbx,%rdi
  402302:	call   4011e0 <__isoc99_sscanf@plt>
  402307:	cmp    $0x2,%eax
  40230a:	jne    4022e3 <phase_03+0x23>
  40230c:	mov    %r12d,%edi
  40230f:	xor    %eax,%eax
  402311:	and    $0x7,%edi
  402314:	cmp    %edi,-0x18(%rbp)
  402317:	jne    4022e5 <phase_03+0x25>
  402319:	mov    %r12,%rax
  40231c:	mov    %r12,%rsi
  40231f:	shr    $0x3,%rax
  402323:	shr    $0x20,%rsi
  402327:	xor    %eax,%esi
  402329:	call   402260 <p3_dispatch>
  40232e:	cmp    %eax,-0x14(%rbp)
  402331:	sete   %al
  402334:	jmp    4022e5 <phase_03+0x25>

Disassembly of section .fini:
