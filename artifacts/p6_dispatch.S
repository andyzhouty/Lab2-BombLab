
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402580 <p6_dispatch>:
  402580:	endbr64
  402584:	push   %rbp
  402585:	mov    %rsp,%rbp
  402588:	push   %rbx
  402589:	mov    %rdi,%rbx
  40258c:	shr    $0x6,%rdi
  402590:	mov    %rbx,%rax
  402593:	shr    $0x20,%rax
  402597:	xor    %eax,%edi
  402599:	mov    %rbx,%rax
  40259c:	sub    $0x8,%rsp
  4025a0:	and    $0x38,%ebx
  4025a3:	and    $0x7,%eax
  4025a6:	call   *0x405e00(,%rax,8)
  4025ad:	xor    $0x5354,%eax
  4025b2:	mov    %eax,%edi
  4025b4:	call   *0x405e00(%rbx)
  4025ba:	mov    -0x8(%rbp),%rbx
  4025be:	leave
  4025bf:	add    $0x91d5,%eax
  4025c4:	ret

Disassembly of section .fini:
