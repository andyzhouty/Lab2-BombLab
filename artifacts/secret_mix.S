
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402630 <secret_mix>:
  402630:	endbr64
  402634:	mov    %edi,%eax
  402636:	rol    $0x7,%eax
  402639:	add    $0xb1d1,%eax
  40263e:	xor    $0x85fd,%eax
  402643:	ret

Disassembly of section .fini:
