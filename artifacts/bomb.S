
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	endbr64
  401004:	sub    $0x8,%rsp
  401008:	mov    0x6fd1(%rip),%rax        # 407fe0 <__gmon_start__@Base>
  40100f:	test   %rax,%rax
  401012:	je     401016 <_init+0x16>
  401014:	call   *%rax
  401016:	add    $0x8,%rsp
  40101a:	ret

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	push   0x6fca(%rip)        # 407ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	jmp    *0x6fcc(%rip)        # 407ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	nopl   0x0(%rax)
  401030:	endbr64
  401034:	push   $0x0
  401039:	jmp    401020 <_init+0x20>
  40103e:	xchg   %ax,%ax
  401040:	endbr64
  401044:	push   $0x1
  401049:	jmp    401020 <_init+0x20>
  40104e:	xchg   %ax,%ax
  401050:	endbr64
  401054:	push   $0x2
  401059:	jmp    401020 <_init+0x20>
  40105e:	xchg   %ax,%ax
  401060:	endbr64
  401064:	push   $0x3
  401069:	jmp    401020 <_init+0x20>
  40106e:	xchg   %ax,%ax
  401070:	endbr64
  401074:	push   $0x4
  401079:	jmp    401020 <_init+0x20>
  40107e:	xchg   %ax,%ax
  401080:	endbr64
  401084:	push   $0x5
  401089:	jmp    401020 <_init+0x20>
  40108e:	xchg   %ax,%ax
  401090:	endbr64
  401094:	push   $0x6
  401099:	jmp    401020 <_init+0x20>
  40109e:	xchg   %ax,%ax
  4010a0:	endbr64
  4010a4:	push   $0x7
  4010a9:	jmp    401020 <_init+0x20>
  4010ae:	xchg   %ax,%ax
  4010b0:	endbr64
  4010b4:	push   $0x8
  4010b9:	jmp    401020 <_init+0x20>
  4010be:	xchg   %ax,%ax
  4010c0:	endbr64
  4010c4:	push   $0x9
  4010c9:	jmp    401020 <_init+0x20>
  4010ce:	xchg   %ax,%ax
  4010d0:	endbr64
  4010d4:	push   $0xa
  4010d9:	jmp    401020 <_init+0x20>
  4010de:	xchg   %ax,%ax
  4010e0:	endbr64
  4010e4:	push   $0xb
  4010e9:	jmp    401020 <_init+0x20>
  4010ee:	xchg   %ax,%ax
  4010f0:	endbr64
  4010f4:	push   $0xc
  4010f9:	jmp    401020 <_init+0x20>
  4010fe:	xchg   %ax,%ax
  401100:	endbr64
  401104:	push   $0xd
  401109:	jmp    401020 <_init+0x20>
  40110e:	xchg   %ax,%ax
  401110:	endbr64
  401114:	push   $0xe
  401119:	jmp    401020 <_init+0x20>
  40111e:	xchg   %ax,%ax
  401120:	endbr64
  401124:	push   $0xf
  401129:	jmp    401020 <_init+0x20>
  40112e:	xchg   %ax,%ax
  401130:	endbr64
  401134:	push   $0x10
  401139:	jmp    401020 <_init+0x20>
  40113e:	xchg   %ax,%ax

Disassembly of section .plt.sec:

0000000000401140 <getenv@plt>:
  401140:	endbr64
  401144:	jmp    *0x6eb6(%rip)        # 408000 <getenv@GLIBC_2.2.5>
  40114a:	nopw   0x0(%rax,%rax,1)

0000000000401150 <__errno_location@plt>:
  401150:	endbr64
  401154:	jmp    *0x6eae(%rip)        # 408008 <__errno_location@GLIBC_2.2.5>
  40115a:	nopw   0x0(%rax,%rax,1)

0000000000401160 <puts@plt>:
  401160:	endbr64
  401164:	jmp    *0x6ea6(%rip)        # 408010 <puts@GLIBC_2.2.5>
  40116a:	nopw   0x0(%rax,%rax,1)

0000000000401170 <ferror@plt>:
  401170:	endbr64
  401174:	jmp    *0x6e9e(%rip)        # 408018 <ferror@GLIBC_2.2.5>
  40117a:	nopw   0x0(%rax,%rax,1)

0000000000401180 <isatty@plt>:
  401180:	endbr64
  401184:	jmp    *0x6e96(%rip)        # 408020 <isatty@GLIBC_2.2.5>
  40118a:	nopw   0x0(%rax,%rax,1)

0000000000401190 <strlen@plt>:
  401190:	endbr64
  401194:	jmp    *0x6e8e(%rip)        # 408028 <strlen@GLIBC_2.2.5>
  40119a:	nopw   0x0(%rax,%rax,1)

00000000004011a0 <strcmp@plt>:
  4011a0:	endbr64
  4011a4:	jmp    *0x6e86(%rip)        # 408030 <strcmp@GLIBC_2.2.5>
  4011aa:	nopw   0x0(%rax,%rax,1)

00000000004011b0 <putc@plt>:
  4011b0:	endbr64
  4011b4:	jmp    *0x6e7e(%rip)        # 408038 <putc@GLIBC_2.2.5>
  4011ba:	nopw   0x0(%rax,%rax,1)

00000000004011c0 <__memcpy_chk@plt>:
  4011c0:	endbr64
  4011c4:	jmp    *0x6e76(%rip)        # 408040 <__memcpy_chk@GLIBC_2.3.4>
  4011ca:	nopw   0x0(%rax,%rax,1)

00000000004011d0 <fflush@plt>:
  4011d0:	endbr64
  4011d4:	jmp    *0x6e6e(%rip)        # 408048 <fflush@GLIBC_2.2.5>
  4011da:	nopw   0x0(%rax,%rax,1)

00000000004011e0 <__isoc99_sscanf@plt>:
  4011e0:	endbr64
  4011e4:	jmp    *0x6e66(%rip)        # 408050 <__isoc99_sscanf@GLIBC_2.7>
  4011ea:	nopw   0x0(%rax,%rax,1)

00000000004011f0 <__printf_chk@plt>:
  4011f0:	endbr64
  4011f4:	jmp    *0x6e5e(%rip)        # 408058 <__printf_chk@GLIBC_2.3.4>
  4011fa:	nopw   0x0(%rax,%rax,1)

0000000000401200 <strtoumax@plt>:
  401200:	endbr64
  401204:	jmp    *0x6e56(%rip)        # 408060 <strtoumax@GLIBC_2.2.5>
  40120a:	nopw   0x0(%rax,%rax,1)

0000000000401210 <exit@plt>:
  401210:	endbr64
  401214:	jmp    *0x6e4e(%rip)        # 408068 <exit@GLIBC_2.2.5>
  40121a:	nopw   0x0(%rax,%rax,1)

0000000000401220 <fwrite@plt>:
  401220:	endbr64
  401224:	jmp    *0x6e46(%rip)        # 408070 <fwrite@GLIBC_2.2.5>
  40122a:	nopw   0x0(%rax,%rax,1)

0000000000401230 <getc@plt>:
  401230:	endbr64
  401234:	jmp    *0x6e3e(%rip)        # 408078 <getc@GLIBC_2.2.5>
  40123a:	nopw   0x0(%rax,%rax,1)

0000000000401240 <__ctype_b_loc@plt>:
  401240:	endbr64
  401244:	jmp    *0x6e36(%rip)        # 408080 <__ctype_b_loc@GLIBC_2.3>
  40124a:	nopw   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000401250 <main>:
  401250:	endbr64
  401254:	push   %rbp
  401255:	mov    %rsp,%rbp
  401258:	push   %r15
  40125a:	push   %r14
  40125c:	push   %r13
  40125e:	push   %r12
  401260:	mov    %rsi,%r12
  401263:	push   %rbx
  401264:	mov    %edi,%ebx
  401266:	sub    $0x8a8,%rsp
  40126d:	cmp    $0x2,%edi
  401270:	jne    401288 <main+0x38>
  401272:	mov    0x8(%rsi),%rdi
  401276:	mov    $0x40300c,%esi
  40127b:	call   4011a0 <strcmp@plt>
  401280:	test   %eax,%eax
  401282:	je     40148a <main+0x23a>
  401288:	lea    -0x8c0(%rbp),%rdx
  40128f:	mov    %r12,%rsi
  401292:	mov    %ebx,%edi
  401294:	call   402950 <parse_options>
  401299:	test   %eax,%eax
  40129b:	jne    401472 <main+0x222>
  4012a1:	cmpl   $0x0,-0x8a4(%rbp)
  4012a8:	jne    4014b6 <main+0x266>
  4012ae:	mov    $0x402d60,%eax
  4012b3:	mov    $0xc0,%ecx
  4012b8:	mov    $0x1,%ebx
  4012bd:	mov    $0x6,%r13d
  4012c3:	movq   %rax,%xmm0
  4012c8:	mov    $0x4020f0,%eax
  4012cd:	lea    -0x630(%rbp),%rdi
  4012d4:	movq   $0x4025d0,-0x840(%rbp)
  4012df:	movhps 0x41e2(%rip),%xmm0        # 4054c8 <_IO_stdin_used+0x24c8>
  4012e6:	movaps %xmm0,-0x870(%rbp)
  4012ed:	movq   %rax,%xmm0
  4012f2:	mov    $0x4023b0,%eax
  4012f7:	movhps 0x41d2(%rip),%xmm0        # 4054d0 <_IO_stdin_used+0x24d0>
  4012fe:	movaps %xmm0,-0x860(%rbp)
  401305:	movq   %rax,%xmm0
  40130a:	xor    %eax,%eax
  40130c:	rep stos %rax,(%rdi)
  40130f:	mov    -0x8c0(%rbp),%edi
  401315:	movhps 0x41bc(%rip),%xmm0        # 4054d8 <_IO_stdin_used+0x24d8>
  40131c:	movaps %xmm0,-0x850(%rbp)
  401323:	cmp    $0x7,%edi
  401326:	cmovne %edi,%ebx
  401329:	cmovne %edi,%r13d
  40132d:	call   401a40 <story_begin>
  401332:	nopw   0x0(%rax,%rax,1)
  401338:	mov    %ebx,%edi
  40133a:	xor    %r14d,%r14d
  40133d:	call   401c00 <story_phase_enter>
  401342:	mov    %ebx,%esi
  401344:	lea    -0x8c0(%rbp),%rdi
  40134b:	call   402c60 <phase_challenge>
  401350:	mov    %ebx,%edx
  401352:	mov    $0x403013,%esi
  401357:	mov    $0x2,%edi
  40135c:	mov    %rax,%rcx
  40135f:	mov    %rax,%r12
  401362:	xor    %eax,%eax
  401364:	call   4011f0 <__printf_chk@plt>
  401369:	mov    $0x4032c8,%edi
  40136e:	call   401160 <puts@plt>
  401373:	mov    0x6d26(%rip),%rdi        # 4080a0 <stdout@GLIBC_2.2.5>
  40137a:	call   4011d0 <fflush@plt>
  40137f:	jmp    4013ae <main+0x15e>
  401381:	nopl   0x0(%rax)
  401388:	cmp    $0xffffffff,%eax
  40138b:	je     4013bf <main+0x16f>
  40138d:	test   %eax,%eax
  40138f:	je     40146d <main+0x21d>
  401395:	add    $0x1,%r14
  401399:	cmp    $0x100,%r14
  4013a0:	je     40146d <main+0x21d>
  4013a6:	mov    %al,-0x831(%rbp,%r14,1)
  4013ae:	mov    0x6cfb(%rip),%rdi        # 4080b0 <stdin@GLIBC_2.2.5>
  4013b5:	call   401230 <getc@plt>
  4013ba:	cmp    $0xa,%eax
  4013bd:	jne    401388 <main+0x138>
  4013bf:	mov    0x6cea(%rip),%rdi        # 4080b0 <stdin@GLIBC_2.2.5>
  4013c6:	call   401170 <ferror@plt>
  4013cb:	test   %r14,%r14
  4013ce:	sete   %r15b
  4013d2:	test   %eax,%eax
  4013d4:	setne  %al
  4013d7:	or     %al,%r15b
  4013da:	jne    40146d <main+0x21d>
  4013e0:	mov    %ebx,%eax
  4013e2:	mov    %r12,%rsi
  4013e5:	movb   $0x0,-0x830(%rbp,%r14,1)
  4013ee:	lea    -0x830(%rbp),%rdi
  4013f5:	call   *-0x870(%rbp,%rax,8)
  4013fc:	mov    %eax,%r12d
  4013ff:	test   %al,%al
  401401:	je     40146d <main+0x21d>
  401403:	test   %ebx,%ebx
  401405:	je     40143a <main+0x1ea>
  401407:	lea    -0x1(%rbx),%edi
  40140a:	mov    $0x600,%eax
  40140f:	lea    0x1(%r14),%rdx
  401413:	shl    $0x8,%rdi
  401417:	lea    -0x830(%rbp),%rsi
  40141e:	cmp    %rax,%rdi
  401421:	cmovae %rdi,%rax
  401425:	mov    %rax,%rcx
  401428:	lea    -0x630(%rbp),%rax
  40142f:	sub    %rdi,%rcx
  401432:	add    %rax,%rdi
  401435:	call   4011c0 <__memcpy_chk@plt>
  40143a:	mov    %ebx,%edx
  40143c:	mov    $0x403031,%esi
  401441:	mov    $0x2,%edi
  401446:	xor    %eax,%eax
  401448:	call   4011f0 <__printf_chk@plt>
  40144d:	mov    %ebx,%edi
  40144f:	add    $0x1,%ebx
  401452:	call   401ca0 <story_phase_passed>
  401457:	cmp    %ebx,%r13d
  40145a:	jae    401338 <main+0xe8>
  401460:	cmpl   $0x7,-0x8c0(%rbp)
  401467:	je     4014d8 <main+0x288>
  401469:	xor    %eax,%eax
  40146b:	jmp    401478 <main+0x228>
  40146d:	call   401790 <explode_bomb>
  401472:	sar    $0x1e,%eax
  401475:	and    $0x2,%eax
  401478:	add    $0x8a8,%rsp
  40147f:	pop    %rbx
  401480:	pop    %r12
  401482:	pop    %r13
  401484:	pop    %r14
  401486:	pop    %r15
  401488:	pop    %rbp
  401489:	ret
  40148a:	mov    $0x4031b0,%edi
  40148f:	call   401160 <puts@plt>
  401494:	mov    $0x4031e0,%edi
  401499:	call   401160 <puts@plt>
  40149e:	mov    $0x403208,%edi
  4014a3:	call   401160 <puts@plt>
  4014a8:	mov    $0x403250,%edi
  4014ad:	call   401160 <puts@plt>
  4014b2:	xor    %eax,%eax
  4014b4:	jmp    401478 <main+0x228>
  4014b6:	mov    $0x21,%edx
  4014bb:	mov    $0x1,%esi
  4014c0:	mov    $0x4032a0,%edi
  4014c5:	mov    0x6bf4(%rip),%rcx        # 4080c0 <stderr@GLIBC_2.2.5>
  4014cc:	call   401220 <fwrite@plt>
  4014d1:	mov    $0x2,%eax
  4014d6:	jmp    401478 <main+0x228>
  4014d8:	mov    $0x4032f0,%edi
  4014dd:	call   401160 <puts@plt>
  4014e2:	call   401d40 <story_city_saved>
  4014e7:	xor    %edi,%edi
  4014e9:	call   401180 <isatty@plt>
  4014ee:	test   %eax,%eax
  4014f0:	jne    401688 <main+0x438>
  4014f6:	mov    0x6bb3(%rip),%rdi        # 4080b0 <stdin@GLIBC_2.2.5>
  4014fd:	call   401230 <getc@plt>
  401502:	mov    %eax,%edx
  401504:	cmp    $0xffffffff,%eax
  401507:	je     401674 <main+0x424>
  40150d:	xor    %r13d,%r13d
  401510:	xor    %ebx,%ebx
  401512:	jmp    401566 <main+0x316>
  401514:	mov    %edx,-0x8c4(%rbp)
  40151a:	call   401240 <__ctype_b_loc@plt>
  40151f:	mov    -0x8c4(%rbp),%edx
  401525:	mov    %rax,%rcx
  401528:	mov    (%rcx),%rcx
  40152b:	movzbl %dl,%eax
  40152e:	testb  $0x20,0x1(%rcx,%rax,2)
  401533:	je     40158d <main+0x33d>
  401535:	test   %edx,%edx
  401537:	je     40146d <main+0x21d>
  40153d:	lea    0x1(%rbx),%rax
  401541:	cmp    $0xff,%rax
  401547:	ja     401553 <main+0x303>
  401549:	mov    %dl,-0x730(%rbp,%rbx,1)
  401550:	mov    %rax,%rbx
  401553:	mov    0x6b56(%rip),%rdi        # 4080b0 <stdin@GLIBC_2.2.5>
  40155a:	call   401230 <getc@plt>
  40155f:	mov    %eax,%edx
  401561:	cmp    $0xffffffff,%eax
  401564:	je     40159a <main+0x34a>
  401566:	cmp    $0xa,%edx
  401569:	je     40159a <main+0x34a>
  40156b:	test   %r13b,%r13b
  40156e:	je     401514 <main+0x2c4>
  401570:	test   %edx,%edx
  401572:	je     40146d <main+0x21d>
  401578:	lea    0x1(%rbx),%rax
  40157c:	cmp    $0xff,%rax
  401582:	ja     40146d <main+0x21d>
  401588:	mov    %r12d,%r13d
  40158b:	jmp    401549 <main+0x2f9>
  40158d:	call   401dd0 <story_honor_begin>
  401592:	mov    -0x8c4(%rbp),%edx
  401598:	jmp    401570 <main+0x320>
  40159a:	mov    0x6b0f(%rip),%rdi        # 4080b0 <stdin@GLIBC_2.2.5>
  4015a1:	call   401170 <ferror@plt>
  4015a6:	test   %eax,%eax
  4015a8:	jne    40146d <main+0x21d>
  4015ae:	test   %r13b,%r13b
  4015b1:	je     4014f6 <main+0x2a6>
  4015b7:	lea    -0x630(%rbp),%rcx
  4015be:	lea    -0x530(%rbp),%rax
  4015c5:	movb   $0x0,-0x730(%rbp,%rbx,1)
  4015cd:	movq   %rax,%xmm1
  4015d2:	movq   %rcx,%xmm0
  4015d7:	lea    -0x430(%rbp),%rax
  4015de:	punpcklqdq %xmm1,%xmm0
  4015e2:	lea    -0x8a0(%rbp),%rdi
  4015e9:	movaps %xmm0,-0x8a0(%rbp)
  4015f0:	movq   %rax,%xmm0
  4015f5:	lea    -0x330(%rbp),%rax
  4015fc:	movq   %rax,%xmm2
  401601:	lea    -0x230(%rbp),%rax
  401608:	punpcklqdq %xmm2,%xmm0
  40160c:	movaps %xmm0,-0x890(%rbp)
  401613:	movq   %rax,%xmm0
  401618:	lea    -0x130(%rbp),%rax
  40161f:	movq   %rax,%xmm3
  401624:	punpcklqdq %xmm3,%xmm0
  401628:	movaps %xmm0,-0x880(%rbp)
  40162f:	call   402830 <transcript_context>
  401634:	mov    $0x7,%esi
  401639:	lea    -0x8c0(%rbp),%rdi
  401640:	mov    %rax,%rbx
  401643:	call   402c60 <phase_challenge>
  401648:	mov    %rbx,%rdx
  40164b:	lea    -0x730(%rbp),%rdi
  401652:	mov    %rax,%rsi
  401655:	call   402730 <secret_gate>
  40165a:	mov    %eax,%r15d
  40165d:	test   %al,%al
  40165f:	je     40146d <main+0x21d>
  401665:	mov    $0x403044,%edi
  40166a:	call   401160 <puts@plt>
  40166f:	call   401e60 <story_honor_passed>
  401674:	mov    0x6a35(%rip),%rdi        # 4080b0 <stdin@GLIBC_2.2.5>
  40167b:	call   401170 <ferror@plt>
  401680:	test   %eax,%eax
  401682:	jne    40146d <main+0x21d>
  401688:	movzbl %r15b,%edi
  40168c:	call   401ef0 <story_finish>
  401691:	xor    %eax,%eax
  401693:	jmp    401478 <main+0x228>
  401698:	nopl   0x0(%rax,%rax,1)

00000000004016a0 <_start>:
  4016a0:	endbr64
  4016a4:	xor    %ebp,%ebp
  4016a6:	mov    %rdx,%r9
  4016a9:	pop    %rsi
  4016aa:	mov    %rsp,%rdx
  4016ad:	and    $0xfffffffffffffff0,%rsp
  4016b1:	push   %rax
  4016b2:	push   %rsp
  4016b3:	xor    %r8d,%r8d
  4016b6:	xor    %ecx,%ecx
  4016b8:	mov    $0x401250,%rdi
  4016bf:	call   *0x6913(%rip)        # 407fd8 <__libc_start_main@GLIBC_2.34>
  4016c5:	hlt
  4016c6:	cs nopw 0x0(%rax,%rax,1)

00000000004016d0 <_dl_relocate_static_pie>:
  4016d0:	endbr64
  4016d4:	ret
  4016d5:	cs nopw 0x0(%rax,%rax,1)
  4016df:	nop

00000000004016e0 <deregister_tm_clones>:
  4016e0:	mov    $0x408098,%eax
  4016e5:	cmp    $0x408098,%rax
  4016eb:	je     401700 <deregister_tm_clones+0x20>
  4016ed:	mov    $0x0,%eax
  4016f2:	test   %rax,%rax
  4016f5:	je     401700 <deregister_tm_clones+0x20>
  4016f7:	mov    $0x408098,%edi
  4016fc:	jmp    *%rax
  4016fe:	xchg   %ax,%ax
  401700:	ret
  401701:	data16 cs nopw 0x0(%rax,%rax,1)
  40170c:	nopl   0x0(%rax)

0000000000401710 <register_tm_clones>:
  401710:	mov    $0x408098,%esi
  401715:	sub    $0x408098,%rsi
  40171c:	mov    %rsi,%rax
  40171f:	shr    $0x3f,%rsi
  401723:	sar    $0x3,%rax
  401727:	add    %rax,%rsi
  40172a:	sar    $1,%rsi
  40172d:	je     401740 <register_tm_clones+0x30>
  40172f:	mov    $0x0,%eax
  401734:	test   %rax,%rax
  401737:	je     401740 <register_tm_clones+0x30>
  401739:	mov    $0x408098,%edi
  40173e:	jmp    *%rax
  401740:	ret
  401741:	data16 cs nopw 0x0(%rax,%rax,1)
  40174c:	nopl   0x0(%rax)

0000000000401750 <__do_global_dtors_aux>:
  401750:	endbr64
  401754:	cmpb   $0x0,0x696d(%rip)        # 4080c8 <completed.0>
  40175b:	jne    401770 <__do_global_dtors_aux+0x20>
  40175d:	push   %rbp
  40175e:	mov    %rsp,%rbp
  401761:	call   4016e0 <deregister_tm_clones>
  401766:	movb   $0x1,0x695b(%rip)        # 4080c8 <completed.0>
  40176d:	pop    %rbp
  40176e:	ret
  40176f:	nop
  401770:	ret
  401771:	data16 cs nopw 0x0(%rax,%rax,1)
  40177c:	nopl   0x0(%rax)

0000000000401780 <frame_dummy>:
  401780:	endbr64
  401784:	jmp    401710 <register_tm_clones>
  401786:	cs nopw 0x0(%rax,%rax,1)

0000000000401790 <explode_bomb>:
  401790:	endbr64
  401794:	push   %rbp
  401795:	mov    $0x403004,%edi
  40179a:	mov    %rsp,%rbp
  40179d:	call   401160 <puts@plt>
  4017a2:	call   401f40 <story_failure>
  4017a7:	mov    $0x1,%edi
  4017ac:	call   401210 <exit@plt>
  4017b1:	cs nopw 0x0(%rax,%rax,1)
  4017bb:	nopl   0x0(%rax,%rax,1)

00000000004017c0 <progress>:
  4017c0:	push   %rbp
  4017c1:	mov    %rsp,%rbp
  4017c4:	push   %r13
  4017c6:	mov    %edi,%r13d
  4017c9:	push   %r12
  4017cb:	push   %rbx
  4017cc:	mov    $0x1,%ebx
  4017d1:	sub    $0x8,%rsp
  4017d5:	nopl   (%rax)
  4017d8:	cmpb   $0x0,0x4080c8(%rbx)
  4017df:	mov    %ebx,%r12d
  4017e2:	je     401840 <progress+0x80>
  4017e4:	cmpb   $0x0,0x68e7(%rip)        # 4080d2 <colored>
  4017eb:	jne    4018e0 <progress+0x120>
  4017f1:	cmp    $0x6,%rbx
  4017f5:	je     4019b0 <progress+0x1f0>
  4017fb:	xor    %eax,%eax
  4017fd:	mov    $0x40306c,%r8d
  401803:	mov    $0x40306e,%ecx
  401808:	mov    %ebx,%edx
  40180a:	mov    $0x403089,%esi
  40180f:	mov    $0x2,%edi
  401814:	call   4011f0 <__printf_chk@plt>
  401819:	cmpb   $0x0,0x68b2(%rip)        # 4080d2 <colored>
  401820:	jne    401978 <progress+0x1b8>
  401826:	add    $0x1,%rbx
  40182a:	cmpb   $0x0,0x4080c8(%rbx)
  401831:	mov    %ebx,%r12d
  401834:	jne    4017e4 <progress+0x24>
  401836:	cs nopw 0x0(%rax,%rax,1)
  401840:	cmp    %ebx,%r13d
  401843:	je     401950 <progress+0x190>
  401849:	cmpb   $0x0,0x6882(%rip)        # 4080d2 <colored>
  401850:	jne    401940 <progress+0x180>
  401856:	cmp    $0x6,%rbx
  40185a:	je     4019c0 <progress+0x200>
  401860:	mov    $0x40306c,%r8d
  401866:	mov    $0x403078,%ecx
  40186b:	cmp    %r12d,%r13d
  40186e:	je     40192e <progress+0x16e>
  401874:	xor    %eax,%eax
  401876:	mov    %r12d,%edx
  401879:	mov    $0x403089,%esi
  40187e:	mov    $0x2,%edi
  401883:	call   4011f0 <__printf_chk@plt>
  401888:	cmpb   $0x0,0x6843(%rip)        # 4080d2 <colored>
  40188f:	jne    4018c0 <progress+0x100>
  401891:	add    $0x1,%rbx
  401895:	cmp    $0x7,%rbx
  401899:	jne    4017d8 <progress+0x18>
  40189f:	mov    0x67fa(%rip),%rsi        # 4080a0 <stdout@GLIBC_2.2.5>
  4018a6:	add    $0x8,%rsp
  4018aa:	mov    $0xa,%edi
  4018af:	pop    %rbx
  4018b0:	pop    %r12
  4018b2:	pop    %r13
  4018b4:	pop    %rbp
  4018b5:	jmp    4011b0 <putc@plt>
  4018ba:	nopw   0x0(%rax,%rax,1)
  4018c0:	mov    $0x4,%edx
  4018c5:	mov    $0x1,%esi
  4018ca:	mov    $0x403093,%edi
  4018cf:	mov    0x67ca(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  4018d6:	call   401220 <fwrite@plt>
  4018db:	jmp    401891 <progress+0xd1>
  4018dd:	nopl   (%rax)
  4018e0:	mov    $0x403060,%edi
  4018e5:	mov    0x67b4(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  4018ec:	mov    $0x5,%edx
  4018f1:	mov    $0x1,%esi
  4018f6:	call   401220 <fwrite@plt>
  4018fb:	cmp    $0x6,%rbx
  4018ff:	mov    $0x40306c,%r8d
  401905:	mov    $0x403042,%eax
  40190a:	cmove  %rax,%r8
  40190e:	cmpb   $0x0,0x4080c8(%rbx)
  401915:	mov    $0x40306e,%ecx
  40191a:	jne    401874 <progress+0xb4>
  401920:	mov    $0x403078,%ecx
  401925:	cmp    %r12d,%r13d
  401928:	jne    401874 <progress+0xb4>
  40192e:	mov    $0x403082,%ecx
  401933:	jmp    401874 <progress+0xb4>
  401938:	nopl   0x0(%rax,%rax,1)
  401940:	mov    $0x403066,%edi
  401945:	jmp    4018e5 <progress+0x125>
  401947:	nopw   0x0(%rax,%rax,1)
  401950:	cmpb   $0x0,0x677b(%rip)        # 4080d2 <colored>
  401957:	jne    4019a0 <progress+0x1e0>
  401959:	cmp    $0x6,%rbx
  40195d:	jne    401860 <progress+0xa0>
  401963:	mov    $0x403042,%r8d
  401969:	mov    $0x403082,%ecx
  40196e:	jmp    401874 <progress+0xb4>
  401973:	nopl   0x0(%rax,%rax,1)
  401978:	mov    0x6721(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  40197f:	mov    $0x4,%edx
  401984:	mov    $0x1,%esi
  401989:	mov    $0x403093,%edi
  40198e:	add    $0x1,%rbx
  401992:	call   401220 <fwrite@plt>
  401997:	jmp    4017d8 <progress+0x18>
  40199c:	nopl   0x0(%rax)
  4019a0:	mov    $0x40305a,%edi
  4019a5:	jmp    4018e5 <progress+0x125>
  4019aa:	nopw   0x0(%rax,%rax,1)
  4019b0:	mov    $0x403042,%r8d
  4019b6:	mov    $0x40306e,%ecx
  4019bb:	jmp    401874 <progress+0xb4>
  4019c0:	mov    $0x403042,%r8d
  4019c6:	mov    $0x403078,%ecx
  4019cb:	jmp    401874 <progress+0xb4>

00000000004019d0 <rule>:
  4019d0:	push   %rbp
  4019d1:	cmpb   $0x0,0x66fa(%rip)        # 4080d2 <colored>
  4019d8:	mov    %rsp,%rbp
  4019db:	jne    4019f8 <rule+0x28>
  4019dd:	mov    $0x403320,%edi
  4019e2:	call   401160 <puts@plt>
  4019e7:	cmpb   $0x0,0x66e4(%rip)        # 4080d2 <colored>
  4019ee:	jne    401a18 <rule+0x48>
  4019f0:	pop    %rbp
  4019f1:	ret
  4019f2:	nopw   0x0(%rax,%rax,1)
  4019f8:	mov    $0x5,%edx
  4019fd:	mov    $0x1,%esi
  401a02:	mov    $0x403098,%edi
  401a07:	mov    0x6692(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401a0e:	call   401220 <fwrite@plt>
  401a13:	jmp    4019dd <rule+0xd>
  401a15:	nopl   (%rax)
  401a18:	mov    $0x4,%edx
  401a1d:	mov    $0x1,%esi
  401a22:	mov    $0x403093,%edi
  401a27:	pop    %rbp
  401a28:	mov    0x6671(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401a2f:	jmp    401220 <fwrite@plt>
  401a34:	data16 cs nopw 0x0(%rax,%rax,1)
  401a3f:	nop

0000000000401a40 <story_begin>:
  401a40:	endbr64
  401a44:	push   %rbp
  401a45:	mov    %rsp,%rbp
  401a48:	push   %r13
  401a4a:	push   %r12
  401a4c:	push   %rbx
  401a4d:	mov    %edi,%ebx
  401a4f:	mov    $0x1,%edi
  401a54:	sub    $0x8,%rsp
  401a58:	call   401180 <isatty@plt>
  401a5d:	test   %eax,%eax
  401a5f:	setne  %al
  401a62:	test   %ebx,%ebx
  401a64:	setne  %dl
  401a67:	and    %dl,%al
  401a69:	jne    401a80 <story_begin+0x40>
  401a6b:	movb   $0x0,0x6661(%rip)        # 4080d3 <enabled>
  401a72:	add    $0x8,%rsp
  401a76:	pop    %rbx
  401a77:	pop    %r12
  401a79:	pop    %r13
  401a7b:	pop    %rbp
  401a7c:	ret
  401a7d:	nopl   (%rax)
  401a80:	mov    $0x40309e,%edi
  401a85:	movb   $0x1,0x6647(%rip)        # 4080d3 <enabled>
  401a8c:	mov    %eax,%r12d
  401a8f:	call   401140 <getenv@plt>
  401a94:	mov    $0x4030a3,%edi
  401a99:	mov    %rax,%r13
  401a9c:	call   401140 <getenv@plt>
  401aa1:	test   %rax,%rax
  401aa4:	je     401bd0 <story_begin+0x190>
  401aaa:	xor    %r12d,%r12d
  401aad:	cmp    $0x7,%ebx
  401ab0:	mov    %r12b,0x661b(%rip)        # 4080d2 <colored>
  401ab7:	sete   0x6613(%rip)        # 4080d1 <full_run>
  401abe:	call   4019d0 <rule>
  401ac3:	cmpb   $0x0,0x6608(%rip)        # 4080d2 <colored>
  401aca:	jne    401b38 <story_begin+0xf8>
  401acc:	mov    $0x4033f0,%edi
  401ad1:	call   401160 <puts@plt>
  401ad6:	cmpb   $0x0,0x65f5(%rip)        # 4080d2 <colored>
  401add:	jne    401b80 <story_begin+0x140>
  401ae3:	mov    $0x403438,%edi
  401ae8:	call   401160 <puts@plt>
  401aed:	cmpb   $0x0,0x65de(%rip)        # 4080d2 <colored>
  401af4:	jne    401b60 <story_begin+0x120>
  401af6:	cmpb   $0x0,0x65d4(%rip)        # 4080d1 <full_run>
  401afd:	mov    $0x1,%eax
  401b02:	cmovne %eax,%ebx
  401b05:	mov    %ebx,%edi
  401b07:	call   4017c0 <progress>
  401b0c:	call   4019d0 <rule>
  401b11:	cmpb   $0x0,0x65b9(%rip)        # 4080d1 <full_run>
  401b18:	mov    $0x403568,%edi
  401b1d:	je     401b24 <story_begin+0xe4>
  401b1f:	mov    $0x4035b8,%edi
  401b24:	add    $0x8,%rsp
  401b28:	pop    %rbx
  401b29:	pop    %r12
  401b2b:	pop    %r13
  401b2d:	pop    %rbp
  401b2e:	jmp    401160 <puts@plt>
  401b33:	nopl   0x0(%rax,%rax,1)
  401b38:	mov    $0x5,%edx
  401b3d:	mov    $0x1,%esi
  401b42:	mov    $0x403098,%edi
  401b47:	mov    0x6552(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401b4e:	call   401220 <fwrite@plt>
  401b53:	jmp    401acc <story_begin+0x8c>
  401b58:	nopl   0x0(%rax,%rax,1)
  401b60:	mov    $0x4,%edx
  401b65:	mov    $0x1,%esi
  401b6a:	mov    $0x403093,%edi
  401b6f:	mov    0x652a(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401b76:	call   401220 <fwrite@plt>
  401b7b:	jmp    401af6 <story_begin+0xb6>
  401b80:	mov    $0x4,%edx
  401b85:	mov    $0x1,%esi
  401b8a:	mov    $0x403093,%edi
  401b8f:	mov    0x650a(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401b96:	call   401220 <fwrite@plt>
  401b9b:	cmpb   $0x0,0x6530(%rip)        # 4080d2 <colored>
  401ba2:	je     401ae3 <story_begin+0xa3>
  401ba8:	mov    $0x5,%edx
  401bad:	mov    $0x1,%esi
  401bb2:	mov    $0x40305a,%edi
  401bb7:	mov    0x64e2(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401bbe:	call   401220 <fwrite@plt>
  401bc3:	jmp    401ae3 <story_begin+0xa3>
  401bc8:	nopl   0x0(%rax,%rax,1)
  401bd0:	test   %r13,%r13
  401bd3:	je     401aad <story_begin+0x6d>
  401bd9:	mov    $0x4030ac,%esi
  401bde:	mov    %r13,%rdi
  401be1:	call   4011a0 <strcmp@plt>
  401be6:	test   %eax,%eax
  401be8:	setne  %r12b
  401bec:	jmp    401aad <story_begin+0x6d>
  401bf1:	data16 cs nopw 0x0(%rax,%rax,1)
  401bfc:	nopl   0x0(%rax)

0000000000401c00 <story_phase_enter>:
  401c00:	endbr64
  401c04:	cmpb   $0x0,0x64c8(%rip)        # 4080d3 <enabled>
  401c0b:	je     401c15 <story_phase_enter+0x15>
  401c0d:	lea    -0x1(%rdi),%eax
  401c10:	cmp    $0x5,%eax
  401c13:	jbe    401c20 <story_phase_enter+0x20>
  401c15:	ret
  401c16:	cs nopw 0x0(%rax,%rax,1)
  401c20:	push   %rbp
  401c21:	cmpb   $0x0,0x64aa(%rip)        # 4080d2 <colored>
  401c28:	mov    %rsp,%rbp
  401c2b:	push   %r12
  401c2d:	push   %rbx
  401c2e:	mov    %edi,%ebx
  401c30:	mov    0x4054e0(,%rbx,8),%r12
  401c38:	jne    401c60 <story_phase_enter+0x60>
  401c3a:	mov    %r12,%rdi
  401c3d:	call   401160 <puts@plt>
  401c42:	cmpb   $0x0,0x6489(%rip)        # 4080d2 <colored>
  401c49:	jne    401c80 <story_phase_enter+0x80>
  401c4b:	mov    0x405560(,%rbx,8),%rdi
  401c53:	pop    %rbx
  401c54:	pop    %r12
  401c56:	pop    %rbp
  401c57:	jmp    401160 <puts@plt>
  401c5c:	nopl   0x0(%rax)
  401c60:	mov    $0x5,%edx
  401c65:	mov    $0x1,%esi
  401c6a:	mov    $0x40305a,%edi
  401c6f:	mov    0x642a(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401c76:	call   401220 <fwrite@plt>
  401c7b:	jmp    401c3a <story_phase_enter+0x3a>
  401c7d:	nopl   (%rax)
  401c80:	mov    $0x4,%edx
  401c85:	mov    $0x1,%esi
  401c8a:	mov    $0x403093,%edi
  401c8f:	mov    0x640a(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401c96:	call   401220 <fwrite@plt>
  401c9b:	jmp    401c4b <story_phase_enter+0x4b>
  401c9d:	nopl   (%rax)

0000000000401ca0 <story_phase_passed>:
  401ca0:	endbr64
  401ca4:	cmpb   $0x0,0x6428(%rip)        # 4080d3 <enabled>
  401cab:	je     401d00 <story_phase_passed+0x60>
  401cad:	push   %rbp
  401cae:	lea    -0x1(%rdi),%eax
  401cb1:	mov    %rsp,%rbp
  401cb4:	push   %rbx
  401cb5:	mov    %edi,%ebx
  401cb7:	sub    $0x8,%rsp
  401cbb:	cmp    $0x5,%eax
  401cbe:	jbe    401cd0 <story_phase_passed+0x30>
  401cc0:	mov    -0x8(%rbp),%rbx
  401cc4:	leave
  401cc5:	ret
  401cc6:	cs nopw 0x0(%rax,%rax,1)
  401cd0:	mov    0x63c9(%rip),%rsi        # 4080a0 <stdout@GLIBC_2.2.5>
  401cd7:	mov    $0xa,%edi
  401cdc:	movb   $0x1,0x4080c9(%rax)
  401ce3:	call   4011b0 <putc@plt>
  401ce8:	cmpb   $0x0,0x63e2(%rip)        # 4080d1 <full_run>
  401cef:	jne    401d08 <story_phase_passed+0x68>
  401cf1:	mov    -0x8(%rbp),%rbx
  401cf5:	xor    %edi,%edi
  401cf7:	leave
  401cf8:	jmp    4017c0 <progress>
  401cfd:	nopl   (%rax)
  401d00:	ret
  401d01:	nopl   0x0(%rax)
  401d08:	mov    %ebx,%eax
  401d0a:	mov    0x405520(,%rax,8),%rdi
  401d12:	call   401160 <puts@plt>
  401d17:	cmpb   $0x0,0x63b3(%rip)        # 4080d1 <full_run>
  401d1e:	je     401cf1 <story_phase_passed+0x51>
  401d20:	cmp    $0x6,%ebx
  401d23:	je     401cf1 <story_phase_passed+0x51>
  401d25:	lea    0x1(%rbx),%edi
  401d28:	mov    -0x8(%rbp),%rbx
  401d2c:	leave
  401d2d:	jmp    4017c0 <progress>
  401d32:	data16 cs nopw 0x0(%rax,%rax,1)
  401d3d:	nopl   (%rax)

0000000000401d40 <story_city_saved>:
  401d40:	endbr64
  401d44:	cmpb   $0x0,0x6388(%rip)        # 4080d3 <enabled>
  401d4b:	movb   $0x1,0x637e(%rip)        # 4080d0 <city_safe>
  401d52:	jne    401d58 <story_city_saved+0x18>
  401d54:	ret
  401d55:	nopl   (%rax)
  401d58:	push   %rbp
  401d59:	cmpb   $0x0,0x6372(%rip)        # 4080d2 <colored>
  401d60:	mov    %rsp,%rbp
  401d63:	jne    401d88 <story_city_saved+0x48>
  401d65:	mov    $0x403848,%edi
  401d6a:	call   401160 <puts@plt>
  401d6f:	cmpb   $0x0,0x635c(%rip)        # 4080d2 <colored>
  401d76:	jne    401da8 <story_city_saved+0x68>
  401d78:	mov    $0x403880,%edi
  401d7d:	pop    %rbp
  401d7e:	jmp    401160 <puts@plt>
  401d83:	nopl   0x0(%rax,%rax,1)
  401d88:	mov    $0x5,%edx
  401d8d:	mov    $0x1,%esi
  401d92:	mov    $0x403060,%edi
  401d97:	mov    0x6302(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401d9e:	call   401220 <fwrite@plt>
  401da3:	jmp    401d65 <story_city_saved+0x25>
  401da5:	nopl   (%rax)
  401da8:	mov    $0x403093,%edi
  401dad:	mov    $0x4,%edx
  401db2:	mov    $0x1,%esi
  401db7:	mov    0x62e2(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401dbe:	call   401220 <fwrite@plt>
  401dc3:	mov    $0x403880,%edi
  401dc8:	pop    %rbp
  401dc9:	jmp    401160 <puts@plt>
  401dce:	xchg   %ax,%ax

0000000000401dd0 <story_honor_begin>:
  401dd0:	endbr64
  401dd4:	cmpb   $0x0,0x62f8(%rip)        # 4080d3 <enabled>
  401ddb:	movb   $0x1,0x62ed(%rip)        # 4080cf <honor_started>
  401de2:	jne    401de8 <story_honor_begin+0x18>
  401de4:	ret
  401de5:	nopl   (%rax)
  401de8:	push   %rbp
  401de9:	cmpb   $0x0,0x62e2(%rip)        # 4080d2 <colored>
  401df0:	mov    %rsp,%rbp
  401df3:	jne    401e18 <story_honor_begin+0x48>
  401df5:	mov    $0x4030b1,%edi
  401dfa:	call   401160 <puts@plt>
  401dff:	cmpb   $0x0,0x62cc(%rip)        # 4080d2 <colored>
  401e06:	jne    401e38 <story_honor_begin+0x68>
  401e08:	mov    $0x403980,%edi
  401e0d:	pop    %rbp
  401e0e:	jmp    401160 <puts@plt>
  401e13:	nopl   0x0(%rax,%rax,1)
  401e18:	mov    $0x5,%edx
  401e1d:	mov    $0x1,%esi
  401e22:	mov    $0x403098,%edi
  401e27:	mov    0x6272(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401e2e:	call   401220 <fwrite@plt>
  401e33:	jmp    401df5 <story_honor_begin+0x25>
  401e35:	nopl   (%rax)
  401e38:	mov    $0x403093,%edi
  401e3d:	mov    $0x4,%edx
  401e42:	mov    $0x1,%esi
  401e47:	mov    0x6252(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401e4e:	call   401220 <fwrite@plt>
  401e53:	mov    $0x403980,%edi
  401e58:	pop    %rbp
  401e59:	jmp    401160 <puts@plt>
  401e5e:	xchg   %ax,%ax

0000000000401e60 <story_honor_passed>:
  401e60:	endbr64
  401e64:	cmpb   $0x0,0x6268(%rip)        # 4080d3 <enabled>
  401e6b:	jne    401e70 <story_honor_passed+0x10>
  401e6d:	ret
  401e6e:	xchg   %ax,%ax
  401e70:	push   %rbp
  401e71:	cmpb   $0x0,0x625a(%rip)        # 4080d2 <colored>
  401e78:	mov    %rsp,%rbp
  401e7b:	jne    401ea0 <story_honor_passed+0x40>
  401e7d:	mov    $0x403b50,%edi
  401e82:	call   401160 <puts@plt>
  401e87:	cmpb   $0x0,0x6244(%rip)        # 4080d2 <colored>
  401e8e:	jne    401ec0 <story_honor_passed+0x60>
  401e90:	mov    $0x403b88,%edi
  401e95:	pop    %rbp
  401e96:	jmp    401160 <puts@plt>
  401e9b:	nopl   0x0(%rax,%rax,1)
  401ea0:	mov    $0x5,%edx
  401ea5:	mov    $0x1,%esi
  401eaa:	mov    $0x403060,%edi
  401eaf:	mov    0x61ea(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401eb6:	call   401220 <fwrite@plt>
  401ebb:	jmp    401e7d <story_honor_passed+0x1d>
  401ebd:	nopl   (%rax)
  401ec0:	mov    $0x403093,%edi
  401ec5:	mov    $0x4,%edx
  401eca:	mov    $0x1,%esi
  401ecf:	mov    0x61ca(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401ed6:	call   401220 <fwrite@plt>
  401edb:	mov    $0x403b88,%edi
  401ee0:	pop    %rbp
  401ee1:	jmp    401160 <puts@plt>
  401ee6:	cs nopw 0x0(%rax,%rax,1)

0000000000401ef0 <story_finish>:
  401ef0:	endbr64
  401ef4:	cmpb   $0x0,0x61d8(%rip)        # 4080d3 <enabled>
  401efb:	je     401f38 <story_finish+0x48>
  401efd:	push   %rbp
  401efe:	mov    %rsp,%rbp
  401f01:	test   %dil,%dil
  401f04:	jne    401f28 <story_finish+0x38>
  401f06:	mov    $0x404350,%edi
  401f0b:	call   401160 <puts@plt>
  401f10:	call   4019d0 <rule>
  401f15:	mov    $0x4044e0,%edi
  401f1a:	call   401160 <puts@plt>
  401f1f:	pop    %rbp
  401f20:	jmp    4019d0 <rule>
  401f25:	nopl   (%rax)
  401f28:	mov    $0x4042b0,%edi
  401f2d:	call   401160 <puts@plt>
  401f32:	jmp    401f06 <story_finish+0x16>
  401f34:	nopl   0x0(%rax)
  401f38:	ret
  401f39:	nopl   0x0(%rax)

0000000000401f40 <story_failure>:
  401f40:	endbr64
  401f44:	cmpb   $0x0,0x6188(%rip)        # 4080d3 <enabled>
  401f4b:	je     402000 <story_failure+0xc0>
  401f51:	push   %rbp
  401f52:	mov    %rsp,%rbp
  401f55:	push   %rbx
  401f56:	mov    $0x4030cd,%ebx
  401f5b:	sub    $0x8,%rsp
  401f5f:	cmpb   $0x0,0x6169(%rip)        # 4080cf <honor_started>
  401f66:	je     401f78 <story_failure+0x38>
  401f68:	cmpb   $0x0,0x6161(%rip)        # 4080d0 <city_safe>
  401f6f:	mov    $0x404528,%eax
  401f74:	cmovne %rax,%rbx
  401f78:	cmpb   $0x0,0x6153(%rip)        # 4080d2 <colored>
  401f7f:	jne    401fe0 <story_failure+0xa0>
  401f81:	mov    %rbx,%rdi
  401f84:	call   401160 <puts@plt>
  401f89:	cmpb   $0x0,0x6142(%rip)        # 4080d2 <colored>
  401f90:	jne    401fb8 <story_failure+0x78>
  401f92:	cmpb   $0x0,0x6136(%rip)        # 4080cf <honor_started>
  401f99:	je     401fa4 <story_failure+0x64>
  401f9b:	cmpb   $0x0,0x612e(%rip)        # 4080d0 <city_safe>
  401fa2:	jne    402008 <story_failure+0xc8>
  401fa4:	mov    -0x8(%rbp),%rbx
  401fa8:	mov    $0x4045c0,%edi
  401fad:	leave
  401fae:	jmp    401160 <puts@plt>
  401fb3:	nopl   0x0(%rax,%rax,1)
  401fb8:	mov    $0x4,%edx
  401fbd:	mov    $0x1,%esi
  401fc2:	mov    $0x403093,%edi
  401fc7:	mov    0x60d2(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401fce:	call   401220 <fwrite@plt>
  401fd3:	cmpb   $0x0,0x60f5(%rip)        # 4080cf <honor_started>
  401fda:	jne    401f9b <story_failure+0x5b>
  401fdc:	jmp    401fa4 <story_failure+0x64>
  401fde:	xchg   %ax,%ax
  401fe0:	mov    $0x5,%edx
  401fe5:	mov    $0x1,%esi
  401fea:	mov    $0x4030ea,%edi
  401fef:	mov    0x60aa(%rip),%rcx        # 4080a0 <stdout@GLIBC_2.2.5>
  401ff6:	call   401220 <fwrite@plt>
  401ffb:	jmp    401f81 <story_failure+0x41>
  401ffd:	nopl   (%rax)
  402000:	ret
  402001:	nopl   0x0(%rax)
  402008:	mov    -0x8(%rbp),%rbx
  40200c:	mov    $0x404548,%edi
  402011:	leave
  402012:	jmp    401160 <puts@plt>
  402017:	nopw   0x0(%rax,%rax,1)

0000000000402020 <p1_step0>:
  402020:	endbr64
  402024:	lea    (%rdi,%rdi,4),%eax
  402027:	add    %esi,%eax
  402029:	xor    $0x57bb,%eax
  40202e:	ret
  40202f:	nop

0000000000402030 <p1_step1>:
  402030:	endbr64
  402034:	xor    $0xdcf,%esi
  40203a:	lea    (%rsi,%rdi,4),%eax
  40203d:	ret
  40203e:	xchg   %ax,%ax

0000000000402040 <p1_step2>:
  402040:	endbr64
  402044:	lea    0xf9b4(%rsi),%eax
  40204a:	xor    %edi,%eax
  40204c:	ret
  40204d:	nopl   (%rax)

0000000000402050 <p1_compute>:
  402050:	endbr64
  402054:	push   %rbp
  402055:	mov    %rdi,%rdx
  402058:	mov    %rdi,%rax
  40205b:	shr    $0x20,%rax
  40205f:	mov    %rdx,%rsi
  402062:	mov    %eax,%edi
  402064:	shr    $0x10,%rsi
  402068:	mov    %rsp,%rbp
  40206b:	call   402030 <p1_step1>
  402070:	mov    %edi,%esi
  402072:	mov    %edx,%edi
  402074:	mov    %eax,%ecx
  402076:	call   402020 <p1_step0>
  40207b:	mov    %ecx,%esi
  40207d:	mov    %eax,%edi
  40207f:	call   402040 <p1_step2>
  402084:	pop    %rbp
  402085:	ret
  402086:	cs nopw 0x0(%rax,%rax,1)

0000000000402090 <phase_01>:
  402090:	endbr64
  402094:	push   %rbp
  402095:	mov    %rsp,%rbp
  402098:	push   %r12
  40209a:	mov    %rsi,%r12
  40209d:	mov    $0x1,%esi
  4020a2:	push   %rbx
  4020a3:	mov    %rdi,%rbx
  4020a6:	sub    $0x10,%rsp
  4020aa:	call   402c80 <valid_u32_fields>
  4020af:	test   %al,%al
  4020b1:	jne    4020c0 <phase_01+0x30>
  4020b3:	add    $0x10,%rsp
  4020b7:	xor    %eax,%eax
  4020b9:	pop    %rbx
  4020ba:	pop    %r12
  4020bc:	pop    %rbp
  4020bd:	ret
  4020be:	xchg   %ax,%ax
  4020c0:	xor    %eax,%eax
  4020c2:	lea    -0x14(%rbp),%rdx
  4020c6:	mov    $0x403189,%esi
  4020cb:	mov    %rbx,%rdi
  4020ce:	call   4011e0 <__isoc99_sscanf@plt>
  4020d3:	cmp    $0x1,%eax
  4020d6:	jne    4020b3 <phase_01+0x23>
  4020d8:	mov    %r12,%rdi
  4020db:	call   402050 <p1_compute>
  4020e0:	cmp    %eax,-0x14(%rbp)
  4020e3:	sete   %al
  4020e6:	add    $0x10,%rsp
  4020ea:	pop    %rbx
  4020eb:	pop    %r12
  4020ed:	pop    %rbp
  4020ee:	ret
  4020ef:	nop

00000000004020f0 <phase_02>:
  4020f0:	endbr64
  4020f4:	push   %rbp
  4020f5:	mov    %rsp,%rbp
  4020f8:	push   %r13
  4020fa:	mov    %rsi,%r13
  4020fd:	mov    $0x6,%esi
  402102:	push   %r12
  402104:	mov    %rdi,%r12
  402107:	push   %rbx
  402108:	sub    $0x28,%rsp
  40210c:	call   402c80 <valid_u32_fields>
  402111:	test   %al,%al
  402113:	jne    402128 <phase_02+0x38>
  402115:	xor    %ebx,%ebx
  402117:	lea    -0x18(%rbp),%rsp
  40211b:	mov    %ebx,%eax
  40211d:	pop    %rbx
  40211e:	pop    %r12
  402120:	pop    %r13
  402122:	pop    %rbp
  402123:	ret
  402124:	nopl   0x0(%rax)
  402128:	mov    %eax,%ebx
  40212a:	lea    -0x2c(%rbp),%rax
  40212e:	lea    -0x3c(%rbp),%rcx
  402132:	mov    $0x40317a,%esi
  402137:	push   %rax
  402138:	lea    -0x30(%rbp),%rax
  40213c:	lea    -0x40(%rbp),%rdx
  402140:	mov    %r12,%rdi
  402143:	push   %rax
  402144:	lea    -0x34(%rbp),%r9
  402148:	lea    -0x38(%rbp),%r8
  40214c:	xor    %eax,%eax
  40214e:	call   4011e0 <__isoc99_sscanf@plt>
  402153:	pop    %rdx
  402154:	pop    %rcx
  402155:	cmp    $0x6,%eax
  402158:	jne    402115 <phase_02+0x25>
  40215a:	mov    %r13,%rax
  40215d:	mov    -0x40(%rbp),%esi
  402160:	shr    $0x5,%rax
  402164:	add    %eax,%eax
  402166:	and    $0x7e,%eax
  402169:	add    $0x1d,%eax
  40216c:	cmp    %eax,%esi
  40216e:	jne    402115 <phase_02+0x25>
  402170:	lea    -0x40(%rbp),%rdx
  402174:	mov    $0xd,%r8d
  40217a:	mov    $0x1,%edi
  40217f:	sub    %edx,%r8d
  402182:	lea    (%r8,%rdx,1),%ecx
  402186:	mov    %r13,%rax
  402189:	add    $0x1,%edi
  40218c:	add    $0x4,%rdx
  402190:	shr    %cl,%rax
  402193:	lea    (%rsi,%rsi,2),%ecx
  402196:	mov    (%rdx),%esi
  402198:	and    $0xf,%eax
  40219b:	xor    %edi,%eax
  40219d:	add    %ecx,%eax
  40219f:	cmp    %eax,%esi
  4021a1:	jne    402115 <phase_02+0x25>
  4021a7:	cmp    $0x6,%edi
  4021aa:	jne    402182 <phase_02+0x92>
  4021ac:	jmp    402117 <phase_02+0x27>
  4021b1:	cs nopw 0x0(%rax,%rax,1)
  4021bb:	nopl   0x0(%rax,%rax,1)

00000000004021c0 <p3_case_0>:
  4021c0:	endbr64
  4021c4:	lea    0x3679a(%rdi,%rdi,4),%eax
  4021cb:	ret
  4021cc:	nopl   0x0(%rax)

00000000004021d0 <p3_case_1>:
  4021d0:	endbr64
  4021d4:	mov    %edi,%eax
  4021d6:	shr    $1,%edi
  4021d8:	xor    $0xc6ad,%eax
  4021dd:	add    %edi,%eax
  4021df:	ret

00000000004021e0 <p3_case_2>:
  4021e0:	endbr64
  4021e4:	lea    0x55f6(%rdi,%rdi,4),%eax
  4021eb:	ret
  4021ec:	nopl   0x0(%rax)

00000000004021f0 <p3_case_3>:
  4021f0:	endbr64
  4021f4:	lea    0x0(,%rdi,4),%eax
  4021fb:	xor    $0xa6ba,%eax
  402200:	ret
  402201:	data16 cs nopw 0x0(%rax,%rax,1)
  40220c:	nopl   0x0(%rax)

0000000000402210 <p3_case_4>:
  402210:	endbr64
  402214:	lea    0xf657(%rdi,%rdi,4),%eax
  40221b:	ret
  40221c:	nopl   0x0(%rax)

0000000000402220 <p3_case_5>:
  402220:	endbr64
  402224:	lea    (%rdi,%rdi,1),%eax
  402227:	xor    $0x2197,%eax
  40222c:	ret
  40222d:	nopl   (%rax)

0000000000402230 <p3_case_6>:
  402230:	endbr64
  402234:	mov    %edi,%eax
  402236:	shr    $0x2,%edi
  402239:	xor    $0x770b,%eax
  40223e:	add    %edi,%eax
  402240:	ret
  402241:	data16 cs nopw 0x0(%rax,%rax,1)
  40224c:	nopl   0x0(%rax)

0000000000402250 <p3_case_7>:
  402250:	endbr64
  402254:	lea    0x48639(%rdi,%rdi,4),%eax
  40225b:	ret
  40225c:	nopl   0x0(%rax)

0000000000402260 <p3_dispatch>:
  402260:	endbr64
  402264:	mov    %edi,%eax
  402266:	mov    %esi,%edi
  402268:	cmp    $0x7,%eax
  40226b:	ja     4022b5 <p3_dispatch+0x55>
  40226d:	notrack jmp *0x405820(,%rax,8)
  402275:	nopl   (%rax)
  402278:	jmp    4021d0 <p3_case_1>
  40227d:	nopl   (%rax)
  402280:	jmp    4021e0 <p3_case_2>
  402285:	nopl   (%rax)
  402288:	jmp    402220 <p3_case_5>
  40228a:	nopw   0x0(%rax,%rax,1)
  402290:	jmp    402210 <p3_case_4>
  402295:	nopl   (%rax)
  402298:	jmp    4021c0 <p3_case_0>
  40229d:	nopl   (%rax)
  4022a0:	jmp    402230 <p3_case_6>
  4022a2:	nopw   0x0(%rax,%rax,1)
  4022a8:	jmp    402250 <p3_case_7>
  4022aa:	nopw   0x0(%rax,%rax,1)
  4022b0:	jmp    4021f0 <p3_case_3>
  4022b5:	xor    %eax,%eax
  4022b7:	ret
  4022b8:	nopl   0x0(%rax,%rax,1)

00000000004022c0 <phase_03>:
  4022c0:	endbr64
  4022c4:	push   %rbp
  4022c5:	mov    %rsp,%rbp
  4022c8:	push   %r12
  4022ca:	mov    %rsi,%r12
  4022cd:	mov    $0x2,%esi
  4022d2:	push   %rbx
  4022d3:	mov    %rdi,%rbx
  4022d6:	sub    $0x10,%rsp
  4022da:	call   402c80 <valid_u32_fields>
  4022df:	test   %al,%al
  4022e1:	jne    4022f0 <phase_03+0x30>
  4022e3:	xor    %eax,%eax
  4022e5:	add    $0x10,%rsp
  4022e9:	pop    %rbx
  4022ea:	pop    %r12
  4022ec:	pop    %rbp
  4022ed:	ret
  4022ee:	xchg   %ax,%ax
  4022f0:	xor    %eax,%eax
  4022f2:	lea    -0x14(%rbp),%rcx
  4022f6:	lea    -0x18(%rbp),%rdx
  4022fa:	mov    $0x403186,%esi
  4022ff:	mov    %rbx,%rdi
  402302:	call   4011e0 <__isoc99_sscanf@plt>
  402307:	cmp    $0x2,%eax
  40230a:	jne    4022e3 <phase_03+0x23>
  40230c:	mov    %r12d,%edi
  40230f:	xor    %eax,%eax
  402311:	and    $0x7,%edi
  402314:	cmp    %edi,-0x18(%rbp)
  402317:	jne    4022e5 <phase_03+0x25>
  402319:	mov    %r12,%rax
  40231c:	mov    %r12,%rsi
  40231f:	shr    $0x3,%rax
  402323:	shr    $0x20,%rsi
  402327:	xor    %eax,%esi
  402329:	call   402260 <p3_dispatch>
  40232e:	cmp    %eax,-0x14(%rbp)
  402331:	sete   %al
  402334:	jmp    4022e5 <phase_03+0x25>
  402336:	cs nopw 0x0(%rax,%rax,1)

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
  4023a9:	nopl   0x0(%rax)

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
  402429:	nopl   0x0(%rax)

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
  40248a:	nopw   0x0(%rax,%rax,1)

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
  4024fc:	nopl   0x0(%rax)

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
  40257a:	nopw   0x0(%rax,%rax,1)

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
  4025c5:	data16 cs nopw 0x0(%rax,%rax,1)

00000000004025d0 <phase_06>:
  4025d0:	endbr64
  4025d4:	push   %rbp
  4025d5:	mov    %rsp,%rbp
  4025d8:	push   %r12
  4025da:	mov    %rsi,%r12
  4025dd:	mov    $0x1,%esi
  4025e2:	push   %rbx
  4025e3:	mov    %rdi,%rbx
  4025e6:	sub    $0x10,%rsp
  4025ea:	call   402c80 <valid_u32_fields>
  4025ef:	test   %al,%al
  4025f1:	jne    402600 <phase_06+0x30>
  4025f3:	add    $0x10,%rsp
  4025f7:	xor    %eax,%eax
  4025f9:	pop    %rbx
  4025fa:	pop    %r12
  4025fc:	pop    %rbp
  4025fd:	ret
  4025fe:	xchg   %ax,%ax
  402600:	xor    %eax,%eax
  402602:	lea    -0x14(%rbp),%rdx
  402606:	mov    $0x403189,%esi
  40260b:	mov    %rbx,%rdi
  40260e:	call   4011e0 <__isoc99_sscanf@plt>
  402613:	cmp    $0x1,%eax
  402616:	jne    4025f3 <phase_06+0x23>
  402618:	mov    %r12,%rdi
  40261b:	call   402580 <p6_dispatch>
  402620:	cmp    %eax,-0x14(%rbp)
  402623:	sete   %al
  402626:	add    $0x10,%rsp
  40262a:	pop    %rbx
  40262b:	pop    %r12
  40262d:	pop    %rbp
  40262e:	ret
  40262f:	nop

0000000000402630 <secret_mix>:
  402630:	endbr64
  402634:	mov    %edi,%eax
  402636:	rol    $0x7,%eax
  402639:	add    $0xb1d1,%eax
  40263e:	xor    $0x85fd,%eax
  402643:	ret
  402644:	data16 cs nopw 0x0(%rax,%rax,1)
  40264f:	nop

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
  40270b:	nopl   0x0(%rax,%rax,1)

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
  4027c9:	nopl   0x0(%rax)

00000000004027d0 <challenge_from_seed>:
  4027d0:	endbr64
  4027d4:	movabs $0x9e3779b97f4a7c15,%rdx
  4027de:	mov    %esi,%eax
  4027e0:	add    $0x1,%rax
  4027e4:	imul   %rdx,%rax
  4027e8:	add    %rdi,%rax
  4027eb:	mov    %rax,%rdx
  4027ee:	shr    $0x1e,%rdx
  4027f2:	xor    %rdx,%rax
  4027f5:	movabs $0xbf58476d1ce4e5b9,%rdx
  4027ff:	imul   %rdx,%rax
  402803:	mov    %rax,%rdx
  402806:	shr    $0x1b,%rdx
  40280a:	xor    %rax,%rdx
  40280d:	movabs $0x94d049bb133111eb,%rax
  402817:	imul   %rax,%rdx
  40281b:	mov    %rdx,%rax
  40281e:	shr    $0x1f,%rax
  402822:	xor    %rdx,%rax
  402825:	ret
  402826:	cs nopw 0x0(%rax,%rax,1)

0000000000402830 <transcript_context>:
  402830:	endbr64
  402834:	push   %rbp
  402835:	mov    $0x1,%r11d
  40283b:	movabs $0x243f6a8885a308d3,%rsi
  402845:	movabs $0xbf58476d1ce4e5b9,%r9
  40284f:	movabs $0x94d049bb133111eb,%r8
  402859:	mov    %rsp,%rbp
  40285c:	push   %r12
  40285e:	push   %rbx
  40285f:	mov    %rdi,%rbx
  402862:	nopw   0x0(%rax,%rax,1)
  402868:	xor    %r11,%rsi
  40286b:	mov    %rsi,%rdx
  40286e:	shr    $0x1e,%rdx
  402872:	xor    %rsi,%rdx
  402875:	imul   %r9,%rdx
  402879:	mov    %rdx,%rax
  40287c:	shr    $0x1b,%rax
  402880:	xor    %rdx,%rax
  402883:	mov    -0x8(%rbx,%r11,8),%rdx
  402888:	imul   %r8,%rax
  40288c:	mov    %rax,%rsi
  40288f:	shr    $0x1f,%rsi
  402893:	xor    %rax,%rsi
  402896:	movzbl (%rdx),%eax
  402899:	test   %al,%al
  40289b:	je     4028c4 <transcript_context+0x94>
  40289d:	mov    %r11,%r10
  4028a0:	sub    $0x30,%eax
  4028a3:	xor    %edi,%edi
  4028a5:	shl    $0x20,%r10
  4028a9:	cmp    $0x9,%al
  4028ab:	jbe    4028e4 <transcript_context+0xb4>
  4028ad:	nopl   (%rax)
  4028b0:	movzbl 0x1(%rdx),%eax
  4028b4:	add    $0x1,%rdx
  4028b8:	lea    -0x30(%rax),%ecx
  4028bb:	cmp    $0x9,%cl
  4028be:	jbe    4028e0 <transcript_context+0xb0>
  4028c0:	test   %al,%al
  4028c2:	jne    4028b0 <transcript_context+0x80>
  4028c4:	add    $0x1,%r11
  4028c8:	cmp    $0x7,%r11
  4028cc:	jne    402868 <transcript_context+0x38>
  4028ce:	pop    %rbx
  4028cf:	mov    %rsi,%rax
  4028d2:	pop    %r12
  4028d4:	pop    %rbp
  4028d5:	ret
  4028d6:	cs nopw 0x0(%rax,%rax,1)
  4028e0:	test   %al,%al
  4028e2:	je     4028c4 <transcript_context+0x94>
  4028e4:	movzbl (%rdx),%eax
  4028e7:	lea    -0x30(%rax),%ecx
  4028ea:	cmp    $0x9,%cl
  4028ed:	mov    $0x0,%ecx
  4028f2:	ja     402916 <transcript_context+0xe6>
  4028f4:	nopl   0x0(%rax)
  4028f8:	sub    $0x30,%eax
  4028fb:	lea    (%rcx,%rcx,4),%rcx
  4028ff:	add    $0x1,%rdx
  402903:	cltq
  402905:	lea    (%rax,%rcx,2),%rcx
  402909:	movzbl (%rdx),%eax
  40290c:	lea    -0x30(%rax),%r12d
  402910:	cmp    $0x9,%r12b
  402914:	jbe    4028f8 <transcript_context+0xc8>
  402916:	mov    %edi,%r12d
  402919:	add    $0x1,%edi
  40291c:	or     %r10,%r12
  40291f:	xor    %rsi,%r12
  402922:	xor    %r12,%rcx
  402925:	mov    %rcx,%rsi
  402928:	shr    $0x1e,%rsi
  40292c:	xor    %rcx,%rsi
  40292f:	imul   %r9,%rsi
  402933:	mov    %rsi,%rcx
  402936:	shr    $0x1b,%rcx
  40293a:	xor    %rsi,%rcx
  40293d:	imul   %r8,%rcx
  402941:	mov    %rcx,%rsi
  402944:	shr    $0x1f,%rsi
  402948:	xor    %rcx,%rsi
  40294b:	jmp    4028c0 <transcript_context+0x90>

0000000000402950 <parse_options>:
  402950:	endbr64
  402954:	push   %rbp
  402955:	mov    %rsp,%rbp
  402958:	push   %r15
  40295a:	push   %r14
  40295c:	push   %r13
  40295e:	push   %r12
  402960:	mov    %rdx,%r12
  402963:	push   %rbx
  402964:	sub    $0x58,%rsp
  402968:	cmp    $0x1,%edi
  40296b:	jle    402c3f <parse_options+0x2ef>
  402971:	cmp    $0x2,%edi
  402974:	mov    %edi,%r14d
  402977:	mov    $0x7,%edi
  40297c:	mov    %rdx,-0x78(%rbp)
  402980:	movq   $0x0,-0x58(%rbp)
  402988:	mov    $0x1,%ebx
  40298d:	mov    %rsi,%r13
  402990:	movq   $0x1,-0x70(%rbp)
  402998:	mov    %rdi,-0x50(%rbp)
  40299c:	mov    %r14d,-0x44(%rbp)
  4029a0:	sete   -0x45(%rbp)
  4029a4:	xor    %r15d,%r15d
  4029a7:	movslq %ebx,%rax
  4029aa:	mov    $0x40300c,%esi
  4029af:	mov    0x0(%r13,%rax,8),%r12
  4029b4:	lea    0x0(,%rax,8),%r14
  4029bc:	mov    %r12,%rdi
  4029bf:	call   4011a0 <strcmp@plt>
  4029c4:	test   %eax,%eax
  4029c6:	jne    4029d2 <parse_options+0x82>
  4029c8:	cmpb   $0x0,-0x45(%rbp)
  4029cc:	jne    402c0d <parse_options+0x2bd>
  4029d2:	mov    $0x40318c,%esi
  4029d7:	mov    %r12,%rdi
  4029da:	call   4011a0 <strcmp@plt>
  4029df:	test   %eax,%eax
  4029e1:	jne    402a88 <parse_options+0x138>
  4029e7:	test   $0x8,%r15b
  4029eb:	jne    402b80 <parse_options+0x230>
  4029f1:	or     $0x8,%r15d
  4029f5:	add    $0x1,%ebx
  4029f8:	cmp    %ebx,-0x44(%rbp)
  4029fb:	jg     4029a7 <parse_options+0x57>
  4029fd:	mov    %r15d,%eax
  402a00:	mov    -0x50(%rbp),%rdi
  402a04:	mov    -0x78(%rbp),%r12
  402a08:	not    %eax
  402a0a:	test   $0x3,%al
  402a0c:	je     402bf0 <parse_options+0x2a0>
  402a12:	test   $0x4,%r15b
  402a16:	je     402bdb <parse_options+0x28b>
  402a1c:	cmp    $0x6,%rdi
  402a20:	ja     402bf0 <parse_options+0x2a0>
  402a26:	mov    %r15d,%eax
  402a29:	and    $0xe,%eax
  402a2c:	cmp    $0x2,%eax
  402a2f:	je     402bf0 <parse_options+0x2a0>
  402a35:	mov    %r15d,%eax
  402a38:	not    %eax
  402a3a:	test   $0xc,%al
  402a3c:	je     402bf0 <parse_options+0x2a0>
  402a42:	mov    -0x70(%rbp),%rax
  402a46:	mov    %r15d,%edx
  402a49:	mov    %edi,(%r12)
  402a4d:	shr    $0x3,%edx
  402a50:	mov    %rax,0x8(%r12)
  402a55:	mov    -0x58(%rbp),%rax
  402a59:	and    $0x1,%edx
  402a5c:	mov    %edx,0x1c(%r12)
  402a61:	mov    %rax,0x10(%r12)
  402a66:	mov    %r15d,%eax
  402a69:	shr    $1,%eax
  402a6b:	and    $0x1,%eax
  402a6e:	mov    %eax,0x18(%r12)
  402a73:	xor    %eax,%eax
  402a75:	add    $0x58,%rsp
  402a79:	pop    %rbx
  402a7a:	pop    %r12
  402a7c:	pop    %r13
  402a7e:	pop    %r14
  402a80:	pop    %r15
  402a82:	pop    %rbp
  402a83:	ret
  402a84:	nopl   0x0(%rax)
  402a88:	mov    $0x403195,%esi
  402a8d:	mov    %r12,%rdi
  402a90:	call   4011a0 <strcmp@plt>
  402a95:	test   %eax,%eax
  402a97:	je     402bb0 <parse_options+0x260>
  402a9d:	mov    $0x40319c,%esi
  402aa2:	mov    %r12,%rdi
  402aa5:	call   4011a0 <strcmp@plt>
  402aaa:	test   %eax,%eax
  402aac:	je     402bd0 <parse_options+0x280>
  402ab2:	mov    $0x4031a8,%esi
  402ab7:	mov    %r12,%rdi
  402aba:	call   4011a0 <strcmp@plt>
  402abf:	test   %eax,%eax
  402ac1:	jne    402b80 <parse_options+0x230>
  402ac7:	mov    $0x4,%r12d
  402acd:	test   %r15d,%r12d
  402ad0:	jne    402b80 <parse_options+0x230>
  402ad6:	add    $0x1,%ebx
  402ad9:	cmp    %ebx,-0x44(%rbp)
  402adc:	je     402b80 <parse_options+0x230>
  402ae2:	mov    0x8(%r13,%r14,1),%r14
  402ae7:	movzbl (%r14),%eax
  402aeb:	lea    -0x30(%rax),%edx
  402aee:	cmp    $0x9,%dl
  402af1:	ja     402b80 <parse_options+0x230>
  402af7:	mov    $0xa,%edx
  402afc:	cmp    $0x30,%al
  402afe:	jne    402b12 <parse_options+0x1c2>
  402b00:	movzbl 0x1(%r14),%eax
  402b05:	and    $0xffffffdf,%eax
  402b08:	cmp    $0x58,%al
  402b0a:	mov    $0x10,%eax
  402b0f:	cmove  %eax,%edx
  402b12:	mov    %edx,-0x64(%rbp)
  402b15:	movq   $0x0,-0x38(%rbp)
  402b1d:	call   401150 <__errno_location@plt>
  402b22:	mov    -0x64(%rbp),%edx
  402b25:	lea    -0x38(%rbp),%rsi
  402b29:	mov    %r14,%rdi
  402b2c:	movl   $0x0,(%rax)
  402b32:	mov    %rax,-0x60(%rbp)
  402b36:	call   401200 <strtoumax@plt>
  402b3b:	mov    -0x60(%rbp),%rcx
  402b3f:	mov    (%rcx),%edx
  402b41:	test   %edx,%edx
  402b43:	jne    402b80 <parse_options+0x230>
  402b45:	mov    -0x38(%rbp),%rdx
  402b49:	cmp    %rdx,%r14
  402b4c:	je     402b80 <parse_options+0x230>
  402b4e:	cmpb   $0x0,(%rdx)
  402b51:	jne    402b80 <parse_options+0x230>
  402b53:	or     %r12d,%r15d
  402b56:	cmp    $0x1,%r12d
  402b5a:	je     402bc0 <parse_options+0x270>
  402b5c:	mov    -0x50(%rbp),%rcx
  402b60:	cmp    $0x2,%r12d
  402b64:	cmovne %rax,%rcx
  402b68:	cmovne -0x58(%rbp),%rax
  402b6d:	mov    %rcx,-0x50(%rbp)
  402b71:	mov    %rax,-0x58(%rbp)
  402b75:	jmp    4029f5 <parse_options+0xa5>
  402b7a:	nopw   0x0(%rax,%rax,1)
  402b80:	mov    $0x33,%edx
  402b85:	mov    $0x1,%esi
  402b8a:	mov    $0x405430,%edi
  402b8f:	mov    0x552a(%rip),%rcx        # 4080c0 <stderr@GLIBC_2.2.5>
  402b96:	call   401220 <fwrite@plt>
  402b9b:	add    $0x58,%rsp
  402b9f:	mov    $0xffffffff,%eax
  402ba4:	pop    %rbx
  402ba5:	pop    %r12
  402ba7:	pop    %r13
  402ba9:	pop    %r14
  402bab:	pop    %r15
  402bad:	pop    %rbp
  402bae:	ret
  402baf:	nop
  402bb0:	mov    $0x1,%r12d
  402bb6:	jmp    402acd <parse_options+0x17d>
  402bbb:	nopl   0x0(%rax,%rax,1)
  402bc0:	mov    %rax,-0x70(%rbp)
  402bc4:	jmp    4029f5 <parse_options+0xa5>
  402bc9:	nopl   0x0(%rax)
  402bd0:	mov    $0x2,%r12d
  402bd6:	jmp    402acd <parse_options+0x17d>
  402bdb:	mov    %r15d,%eax
  402bde:	and    $0xe,%eax
  402be1:	cmp    $0x2,%eax
  402be4:	jne    402a42 <parse_options+0xf2>
  402bea:	nopw   0x0(%rax,%rax,1)
  402bf0:	mov    $0x5e,%edx
  402bf5:	mov    $0x1,%esi
  402bfa:	mov    $0x405468,%edi
  402bff:	mov    0x54ba(%rip),%rcx        # 4080c0 <stderr@GLIBC_2.2.5>
  402c06:	call   401220 <fwrite@plt>
  402c0b:	jmp    402b9b <parse_options+0x24b>
  402c0d:	mov    $0x4031b0,%edi
  402c12:	call   401160 <puts@plt>
  402c17:	mov    $0x4031e0,%edi
  402c1c:	call   401160 <puts@plt>
  402c21:	mov    $0x4053f8,%edi
  402c26:	call   401160 <puts@plt>
  402c2b:	mov    $0x403208,%edi
  402c30:	call   401160 <puts@plt>
  402c35:	mov    $0x1,%eax
  402c3a:	jmp    402a75 <parse_options+0x125>
  402c3f:	movq   $0x1,-0x70(%rbp)
  402c47:	mov    $0x7,%edi
  402c4c:	xor    %r15d,%r15d
  402c4f:	movq   $0x0,-0x58(%rbp)
  402c57:	jmp    402a42 <parse_options+0xf2>
  402c5c:	nopl   0x0(%rax)

0000000000402c60 <phase_challenge>:
  402c60:	endbr64
  402c64:	mov    0x18(%rdi),%eax
  402c67:	test   %eax,%eax
  402c69:	je     402c70 <phase_challenge+0x10>
  402c6b:	mov    0x10(%rdi),%rax
  402c6f:	ret
  402c70:	mov    0x8(%rdi),%rdi
  402c74:	jmp    4027d0 <challenge_from_seed>
  402c79:	nopl   0x0(%rax)

0000000000402c80 <valid_u32_fields>:
  402c80:	endbr64
  402c84:	push   %rbp
  402c85:	mov    %rsp,%rbp
  402c88:	push   %r12
  402c8a:	mov    %rsi,%r12
  402c8d:	push   %rbx
  402c8e:	mov    %rdi,%rbx
  402c91:	call   401240 <__ctype_b_loc@plt>
  402c96:	xor    %r8d,%r8d
  402c99:	mov    $0xcccccccd,%edi
  402c9e:	mov    (%rax),%rsi
  402ca1:	movzbl (%rbx),%eax
  402ca4:	test   %r12,%r12
  402ca7:	je     402d3c <valid_u32_fields+0xbc>
  402cad:	movzbl %al,%edx
  402cb0:	testb  $0x20,0x1(%rsi,%rdx,2)
  402cb5:	je     402cd2 <valid_u32_fields+0x52>
  402cb7:	nopw   0x0(%rax,%rax,1)
  402cc0:	movzbl 0x1(%rbx),%edx
  402cc4:	add    $0x1,%rbx
  402cc8:	mov    %rdx,%rax
  402ccb:	testb  $0x20,0x1(%rsi,%rdx,2)
  402cd0:	jne    402cc0 <valid_u32_fields+0x40>
  402cd2:	sub    $0x30,%eax
  402cd5:	cmp    $0x9,%al
  402cd7:	ja     402d0b <valid_u32_fields+0x8b>
  402cd9:	xor    %ecx,%ecx
  402cdb:	jmp    402cf5 <valid_u32_fields+0x75>
  402cdd:	nopl   (%rax)
  402ce0:	lea    (%rcx,%rcx,4),%eax
  402ce3:	add    $0x1,%rbx
  402ce7:	lea    (%rdx,%rax,2),%ecx
  402cea:	movzbl (%rbx),%eax
  402ced:	lea    -0x30(%rax),%edx
  402cf0:	cmp    $0x9,%dl
  402cf3:	ja     402d18 <valid_u32_fields+0x98>
  402cf5:	movzbl (%rbx),%edx
  402cf8:	sub    $0x30,%edx
  402cfb:	mov    %edx,%eax
  402cfd:	not    %eax
  402cff:	imul   %rdi,%rax
  402d03:	shr    $0x23,%rax
  402d07:	cmp    %ecx,%eax
  402d09:	jae    402ce0 <valid_u32_fields+0x60>
  402d0b:	xor    %eax,%eax
  402d0d:	pop    %rbx
  402d0e:	pop    %r12
  402d10:	pop    %rbp
  402d11:	ret
  402d12:	nopw   0x0(%rax,%rax,1)
  402d18:	test   %al,%al
  402d1a:	je     402d26 <valid_u32_fields+0xa6>
  402d1c:	movzbl %al,%edx
  402d1f:	testb  $0x20,0x1(%rsi,%rdx,2)
  402d24:	je     402d0b <valid_u32_fields+0x8b>
  402d26:	add    $0x1,%r8
  402d2a:	cmp    %r8,%r12
  402d2d:	jne    402cad <valid_u32_fields+0x2d>
  402d33:	jmp    402d3c <valid_u32_fields+0xbc>
  402d35:	nopl   (%rax)
  402d38:	add    $0x1,%rbx
  402d3c:	movzbl (%rbx),%edx
  402d3f:	testb  $0x20,0x1(%rsi,%rdx,2)
  402d44:	jne    402d38 <valid_u32_fields+0xb8>
  402d46:	test   %dl,%dl
  402d48:	sete   %al
  402d4b:	jmp    402d0d <valid_u32_fields+0x8d>
  402d4d:	nopl   (%rax)

0000000000402d50 <tutorial_mix>:
  402d50:	endbr64
  402d54:	lea    0x7(%rdi,%rdi,2),%eax
  402d58:	ret
  402d59:	nopl   0x0(%rax)

0000000000402d60 <phase_00>:
  402d60:	endbr64
  402d64:	push   %rbp
  402d65:	mov    %rsp,%rbp
  402d68:	push   %r12
  402d6a:	mov    %rdi,%r12
  402d6d:	push   %rbx
  402d6e:	mov    %rsi,%rbx
  402d71:	mov    $0x2,%esi
  402d76:	sub    $0x10,%rsp
  402d7a:	call   402c80 <valid_u32_fields>
  402d7f:	test   %al,%al
  402d81:	jne    402d90 <phase_00+0x30>
  402d83:	add    $0x10,%rsp
  402d87:	xor    %eax,%eax
  402d89:	pop    %rbx
  402d8a:	pop    %r12
  402d8c:	pop    %rbp
  402d8d:	ret
  402d8e:	xchg   %ax,%ax
  402d90:	xor    %eax,%eax
  402d92:	lea    -0x14(%rbp),%rcx
  402d96:	lea    -0x18(%rbp),%rdx
  402d9a:	mov    $0x403186,%esi
  402d9f:	mov    %r12,%rdi
  402da2:	call   4011e0 <__isoc99_sscanf@plt>
  402da7:	cmp    $0x2,%eax
  402daa:	jne    402d83 <phase_00+0x23>
  402dac:	shr    $0x5,%rbx
  402db0:	movzbl %bl,%edi
  402db3:	xor    $0x2a,%edi
  402db6:	cmp    %edi,-0x18(%rbp)
  402db9:	jne    402d83 <phase_00+0x23>
  402dbb:	call   402d50 <tutorial_mix>
  402dc0:	cmp    %eax,-0x14(%rbp)
  402dc3:	sete   %al
  402dc6:	add    $0x10,%rsp
  402dca:	pop    %rbx
  402dcb:	pop    %r12
  402dcd:	pop    %rbp
  402dce:	ret

Disassembly of section .fini:

0000000000402dd0 <_fini>:
  402dd0:	endbr64
  402dd4:	sub    $0x8,%rsp
  402dd8:	add    $0x8,%rsp
  402ddc:	ret
