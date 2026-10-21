
./bomb：     文件格式 elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.sec:

Disassembly of section .text:

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

Disassembly of section .fini:
