
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402430 <p5_traverse>:
  402430:	endbr64
  402434:	mov    %rdi,%rax
  402437:	mov    %rdi,%rcx
  40243a:	mov    %rsi,%r8
  40243d:	and    $0x7,%eax
  402440:	shr    $0x3,%rcx
  402444:	mov    0x405b60(,%rax,8),%rdx
  40244c:	mov    %rdi,%rax
  40244f:	shr    $0x20,%rdi
  402453:	shr    $0x6,%rax
  402457:	mov    0x4(%rdx),%esi
  40245a:	xor    %edi,%eax
  40245c:	xor    (%rdx),%eax
  40245e:	mov    %ecx,%edi
  402460:	xor    $0x2511,%eax
  402465:	mov    %esi,(%r8)
  402468:	add    %esi,%eax
  40246a:	and    $0x3,%edi
  40246d:	je     402489 <p5_traverse+0x59>
  40246f:	mov    $0x1,%ecx
  402474:	mov    0x8(%rdx),%rdx
  402478:	add    $0x1,%ecx
  40247b:	mov    0x4(%rdx),%esi
  40247e:	xor    (%rdx),%eax
  402480:	add    %esi,%eax
  402482:	mov    %esi,(%r8)
  402485:	cmp    %ecx,%edi
  402487:	jae    402474 <p5_traverse+0x44>
  402489:	ret

Disassembly of section .fini:
