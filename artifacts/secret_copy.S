
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402710 <secret_copy>:
  402710:	endbr64
  402714:	xor    %eax,%eax
  402716:	cs nopw 0x0(%rax,%rax,1)
  402720:	movzbl (%rsi,%rax,1),%edx
  402724:	mov    %dl,(%rdi,%rax,1)
  402727:	add    $0x1,%rax
  40272b:	test   %dl,%dl
  40272d:	jne    402720 <secret_copy+0x10>
  40272f:	ret

Disassembly of section .fini:
