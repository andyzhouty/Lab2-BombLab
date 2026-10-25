
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402730 <secret_gate>:
  402730:	endbr64
  402734:	push   %rbp
  402735:	xor    %eax,%eax
  402737:	mov    $0x14,%ecx
  40273c:	mov    %rsp,%rbp
  40273f:	push   %r14
  402741:	mov    %rdx,%r14
  402744:	push   %r13
  402746:	mov    %rsi,%r13
  402749:	push   %r12
  40274b:	lea    -0xd0(%rbp),%r12
  402752:	push   %rbx
  402753:	mov    %rdi,%rbx
  402756:	mov    %r12,%rdi
  402759:	sub    $0xb0,%rsp
  402760:	rep stos %rax,(%rdi)
  402763:	movl   $0x0,(%rdi)
  402769:	mov    %rbx,%rdi
  40276c:	call   401190 <strlen@plt>
  402771:	sub    $0x24,%rax
  402775:	cmp    $0x7f,%rax
  402779:	jbe    402790 <secret_gate+0x60>
  40277b:	add    $0xb0,%rsp
  402782:	xor    %eax,%eax
  402784:	pop    %rbx
  402785:	pop    %r12
  402787:	pop    %r13
  402789:	pop    %r14
  40278b:	pop    %rbp
  40278c:	ret
  40278d:	nopl   (%rax)
  402790:	mov    %rbx,%rsi
  402793:	mov    %r12,%rdi
  402796:	call   402710 <secret_copy>
  40279b:	cmpl   $0x4e45504f,-0xb0(%rbp)
  4027a5:	jne    40277b <secret_gate+0x4b>
  4027a7:	mov    %r14,%rdx
  4027aa:	mov    %r13,%rsi
  4027ad:	lea    -0xac(%rbp),%rdi
  4027b4:	call   402650 <secret_phase>
  4027b9:	add    $0xb0,%rsp
  4027c0:	pop    %rbx
  4027c1:	pop    %r12
  4027c3:	pop    %r13
  4027c5:	pop    %r14
  4027c7:	pop    %rbp
  4027c8:	ret

Disassembly of section .fini:
