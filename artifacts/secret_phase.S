
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402650 <secret_phase>:
  402650:	endbr64
  402654:	push   %rbp
  402655:	mov    %rsp,%rbp
  402658:	push   %r13
  40265a:	mov    %rdx,%r13
  40265d:	push   %r12
  40265f:	mov    %rsi,%r12
  402662:	mov    $0x3,%esi
  402667:	push   %rbx
  402668:	mov    %rdi,%rbx
  40266b:	sub    $0x18,%rsp
  40266f:	call   402c80 <valid_u32_fields>
  402674:	test   %al,%al
  402676:	jne    402690 <secret_phase+0x40>
  402678:	xor    %edx,%edx
  40267a:	add    $0x18,%rsp
  40267e:	mov    %edx,%eax
  402680:	pop    %rbx
  402681:	pop    %r12
  402683:	pop    %r13
  402685:	pop    %rbp
  402686:	ret
  402687:	nopw   0x0(%rax,%rax,1)
  402690:	xor    %eax,%eax
  402692:	lea    -0x24(%rbp),%r8
  402696:	lea    -0x28(%rbp),%rcx
  40269a:	mov    $0x403183,%esi
  40269f:	lea    -0x2c(%rbp),%rdx
  4026a3:	mov    %rbx,%rdi
  4026a6:	call   4011e0 <__isoc99_sscanf@plt>
  4026ab:	cmp    $0x3,%eax
  4026ae:	jne    402678 <secret_phase+0x28>
  4026b0:	mov    %r13d,%ecx
  4026b3:	xor    %edx,%edx
  4026b5:	and    $0x3,%ecx
  4026b8:	cmp    %ecx,-0x2c(%rbp)
  4026bb:	jne    40267a <secret_phase+0x2a>
  4026bd:	mov    %r12,%rsi
  4026c0:	imul   $0xb1d1,%ecx,%r9d
  4026c7:	mov    %r13,%r8
  4026ca:	shr    $0x20,%rsi
  4026ce:	shr    $0x20,%r8
  4026d2:	xor    %r12d,%esi
  4026d5:	xor    %r13d,%r8d
  4026d8:	shr    $0x10,%r13
  4026dc:	mov    %esi,%edi
  4026de:	xor    %r13d,%r9d
  4026e1:	xor    %r8d,%edi
  4026e4:	call   402630 <secret_mix>
  4026e9:	xor    %r9d,%eax
  4026ec:	cmp    %eax,-0x28(%rbp)
  4026ef:	jne    40267a <secret_phase+0x2a>
  4026f1:	shr    $0x7,%esi
  4026f4:	lea    0x85fd(%r8,%rcx,1),%edx
  4026fc:	add    %esi,%edx
  4026fe:	xor    %edx,%eax
  402700:	cmp    -0x24(%rbp),%eax
  402703:	sete   %dl
  402706:	jmp    40267a <secret_phase+0x2a>

Disassembly of section .fini:
