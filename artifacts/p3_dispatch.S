
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000402260 <p3_dispatch>:
  402260:	endbr64
  402264:	mov    %edi,%eax          # eax = edi
  402266:	mov    %esi,%edi          # edi = esi
  402268:	cmp    $0x7,%eax          # eax - 7
  40226b:	ja     4022b5 <p3_dispatch+0x55> # if (eax - 7 > 0)
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

Disassembly of section .fini:
