
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402340 <p4_walk>:
  402340:	endbr64
  402344:	mov    %edi,%eax
  402346:	mov    %edx,%edi
  402348:	sub    %esi,%edi
  40234a:	shr    $1,%edi
  40234c:	add    %esi,%edi
  40234e:	cmp    %eax,%edi
  402350:	je     4023a0 <p4_walk+0x60>
  402352:	push   %rbp
  402353:	mov    %rsp,%rbp
  402356:	push   %rbx
  402357:	lea    (%rdi,%rcx,1),%ebx
  40235a:	sub    $0x8,%rsp
  40235e:	cmp    %edi,%eax
  402360:	jb     402380 <p4_walk+0x40>
  402362:	lea    0x1(%rdi),%esi
  402365:	mov    %eax,%edi
  402367:	call   402340 <p4_walk>
  40236c:	lea    (%rax,%rax,2),%eax
  40236f:	xor    %ebx,%eax
  402371:	mov    -0x8(%rbp),%rbx
  402375:	leave
  402376:	xor    $0x1a,%eax
  402379:	ret
  40237a:	nopw   0x0(%rax,%rax,1)
  402380:	lea    -0x1(%rdi),%edx
  402383:	mov    %eax,%edi
  402385:	call   402340 <p4_walk>
  40238a:	lea    (%rax,%rax,2),%eax
  40238d:	xor    %ebx,%eax
  40238f:	mov    -0x8(%rbp),%rbx
  402393:	leave
  402394:	xor    $0x10,%eax
  402397:	ret
  402398:	nopl   0x0(%rax,%rax,1)
  4023a0:	lea    0xe0(%rdi),%eax
  4023a6:	xor    %ecx,%eax
  4023a8:	ret

Disassembly of section .fini:
