
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

00000000004023b0 <phase_04>:
  4023b0:	endbr64
  4023b4:	push   %rbp
  4023b5:	mov    %rsp,%rbp
  4023b8:	push   %r12
  4023ba:	mov    %rsi,%r12
  4023bd:	mov    $0x1,%esi
  4023c2:	push   %rbx
  4023c3:	mov    %rdi,%rbx
  4023c6:	sub    $0x10,%rsp
  4023ca:	call   402c80 <valid_u32_fields>
  4023cf:	test   %al,%al
  4023d1:	jne    4023e0 <phase_04+0x30>
  4023d3:	add    $0x10,%rsp
  4023d7:	xor    %eax,%eax
  4023d9:	pop    %rbx
  4023da:	pop    %r12
  4023dc:	pop    %rbp
  4023dd:	ret
  4023de:	xchg   %ax,%ax
  4023e0:	xor    %eax,%eax
  4023e2:	lea    -0x14(%rbp),%rdx
  4023e6:	mov    $0x403189,%esi
  4023eb:	mov    %rbx,%rdi
  4023ee:	call   4011e0 <__isoc99_sscanf@plt>
  4023f3:	cmp    $0x1,%eax
  4023f6:	jne    4023d3 <phase_04+0x23>
  4023f8:	mov    %r12,%rcx
  4023fb:	mov    %r12,%rax
  4023fe:	mov    %r12d,%edi
  402401:	xor    %esi,%esi
  402403:	shr    $0x20,%rax
  402407:	shr    $0x7,%rcx
  40240b:	and    $0x7f,%edi
  40240e:	mov    $0x7f,%edx
  402413:	xor    %eax,%ecx
  402415:	call   402340 <p4_walk>
  40241a:	cmp    %eax,-0x14(%rbp)
  40241d:	sete   %al
  402420:	add    $0x10,%rsp
  402424:	pop    %rbx
  402425:	pop    %r12
  402427:	pop    %rbp
  402428:	ret

Disassembly of section .fini:
