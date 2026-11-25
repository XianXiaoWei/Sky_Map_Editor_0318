0x100096410: push rbp
0x100096411: mov rbp, rsp
0x100096414: push r15
0x100096416: push r14
0x100096418: push r13
0x10009641a: push r12
0x10009641c: push rbx
0x10009641d: sub rsp, 0x18
0x100096421: mov rbx, rdi
0x100096424: test esi, esi
0x100096426: js 0x100096494
0x100096428: lea rax, [rip + 0x1d39b01] ; 0x101dcff30
0x10009642f: cmp dword ptr [rax], esi
0x100096431: jle 0x100096494
0x100096433: movsxd rcx, esi
0x100096436: mov r14, qword ptr [rax + rcx*8 + 8]
0x10009643b: mov al, 1
0x10009643d: cmp dword ptr [r14 + 0x18], 0
0x100096442: jle 0x100096485
0x100096444: xor r15d, r15d
0x100096447: lea r12, [rbp - 0x30]
0x10009644b: lea r13, [rbp - 0x2c]
0x10009644f: nop 
0x100096450: mov rax, qword ptr [r14 + r15*8 + 0x20]
0x100096455: mov rsi, qword ptr [rax + 8]
0x100096459: xor r9d, r9d
0x10009645c: mov rdi, rbx
0x10009645f: lea rdx, [rbp - 0x34]
0x100096463: mov rcx, r12
0x100096466: mov r8, r13
0x100096469: call 0x100095690 ; 0x100095690
0x10009646e: test rax, rax
0x100096471: je 0x100096483
0x100096473: inc r15
0x100096476: movsxd rax, dword ptr [r14 + 0x18]
0x10009647a: cmp r15, rax
0x10009647d: jl 0x100096450
0x10009647f: mov al, 1
0x100096481: jmp 0x100096485 ; 0x100096485
0x100096483: xor eax, eax
0x100096485: add rsp, 0x18
0x100096489: pop rbx
0x10009648a: pop r12
0x10009648c: pop r13
0x10009648e: pop r14
0x100096490: pop r15
0x100096492: pop rbp
0x100096493: ret 
0x100096494: lea rdi, [rip + 0xacf689] ; 0x100b65b24 idx >= 0 && idx < animationSequenceList.sequenceCount
0x10009649b: lea rsi, [rip + 0xacf152] ; 0x100b655f4 AnimationInstance.cpp
0x1000964a2: mov edx, 0x2da
0x1000964a7: mov ecx, 3
0x1000964ac: call 0x1007e5f70 ; 0x1007e5f70
0x1000964b1: ud2 
0x1000964b3: nop word ptr cs:[rax + rax]
