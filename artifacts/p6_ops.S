
./bomb：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000402500 <p6_op_0>:
  402500:	endbr64
  402504:	mov    %edi,%eax
  402506:	xor    $0xe1e9,%eax
  40250b:	lea    (%rax,%rdi,2),%eax
  40250e:	ret
  40250f:	nop

0000000000402510 <p6_op_1>:
  402510:	endbr64
  402514:	mov    %edi,%eax
  402516:	rol    $0x7,%eax
  402519:	xor    $0x4e6c,%eax
  40251e:	ret
  40251f:	nop

0000000000402520 <p6_op_2>:
  402520:	endbr64
  402524:	mov    %edi,%eax
  402526:	shr    $0x2,%eax
  402529:	xor    %edi,%eax
  40252b:	add    $0xa02a,%eax
  402530:	ret
  402531:	data16 cs nopw 0x0(%rax,%rax,1)
  40253c:	nopl   0x0(%rax)

0000000000402540 <p6_op_3>:
  402540:	endbr64
  402544:	lea    0xae74(,%rdi,8),%eax
  40254b:	lea    (%rdi,%rdi,2),%edx
  40254e:	xor    %edx,%eax
  402550:	ret
  402551:	data16 cs nopw 0x0(%rax,%rax,1)
  40255c:	nopl   0x0(%rax)

0000000000402560 <p6_op_4>:
  402560:	endbr64
  402564:	lea    0xe3fc(%rdi),%eax
  40256a:	shr    $0x7,%edi
  40256d:	xor    %edi,%eax
  40256f:	ret

0000000000402570 <p6_op_5>:
  402570:	endbr64
  402574:	mov    %edi,%eax
  402576:	ror    $0x7,%eax
  402579:	ret
