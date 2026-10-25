
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402490 <phase_05>:
  402490:	endbr64
  402494:	push   %rbp
  402495:	mov    %rsp,%rbp
  402498:	push   %r12
  40249a:	mov    %rsi,%r12
  40249d:	mov    $0x2,%esi
  4024a2:	push   %rbx
  4024a3:	mov    %rdi,%rbx
  4024a6:	sub    $0x10,%rsp
  4024aa:	call   402c80 <valid_u32_fields>
  4024af:	test   %al,%al
  4024b1:	jne    4024c0 <phase_05+0x30>
  4024b3:	xor    %eax,%eax
  4024b5:	add    $0x10,%rsp
  4024b9:	pop    %rbx
  4024ba:	pop    %r12
  4024bc:	pop    %rbp
  4024bd:	ret
  4024be:	xchg   %ax,%ax
  4024c0:	xor    %eax,%eax
  4024c2:	lea    -0x18(%rbp),%rcx
  4024c6:	lea    -0x1c(%rbp),%rdx
  4024ca:	mov    $0x403186,%esi
  4024cf:	mov    %rbx,%rdi
  4024d2:	call   4011e0 <__isoc99_sscanf@plt>
  4024d7:	cmp    $0x2,%eax
  4024da:	jne    4024b3 <phase_05+0x23>
  4024dc:	lea    -0x14(%rbp),%rsi
  4024e0:	mov    %r12,%rdi
  4024e3:	call   402430 <p5_traverse>
  4024e8:	mov    %eax,%edx
  4024ea:	xor    %eax,%eax
  4024ec:	cmp    %edx,-0x1c(%rbp)
  4024ef:	jne    4024b5 <phase_05+0x25>
  4024f1:	mov    -0x14(%rbp),%eax
  4024f4:	cmp    %eax,-0x18(%rbp)
  4024f7:	sete   %al
  4024fa:	jmp    4024b5 <phase_05+0x25>

Disassembly of section .fini:
