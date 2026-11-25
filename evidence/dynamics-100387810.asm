0x100387810: push rbp
0x100387811: mov rbp, rsp
0x100387814: push r15
0x100387816: push r14
0x100387818: push rbx
0x100387819: push rax
0x10038781a: mov rbx, rdi
0x10038781d: mov qword ptr [rbx + 0x24], 0
0x100387825: vmovaps xmm0, xmmword ptr [rip + 0x7211d3] ; 0x100aa8a00
0x10038782d: vmovups xmmword ptr [rbx + 0x14], xmm0
0x100387832: lea rdi, [rbx + 0x2c]
0x100387836: lea rsi, [rip + 0x71d893] ; 0x100aa50d0
0x10038783d: mov edx, 0x40
0x100387842: call 0x100aa2906 ; 0x100aa2906 _memset_pattern16
0x100387847: call 0x100aa285e ; 0x100aa285e _mach_absolute_time
0x10038784c: mov qword ptr [rbx + 0x88], rax
0x100387853: mov edi, 8
0x100387858: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10038785d: mov qword ptr [rax], 0
0x100387864: mov qword ptr [rbx + 0x98], rax
0x10038786b: mov rdi, rax
0x10038786e: call 0x100aa28a6 ; 0x100aa28a6 _mach_timebase_info
0x100387873: mov rcx, qword ptr [rbx + 0x88]
0x10038787a: mov rdx, qword ptr [rbx + 0x98]
0x100387881: mov eax, dword ptr [rdx]
0x100387883: mov esi, dword ptr [rdx + 4]
0x100387886: imul rax, rcx
0x10038788a: xor edx, edx
0x10038788c: div rsi
0x10038788f: vmovq xmm0, rax
0x100387894: vpunpckldq xmm0, xmm0, xmmword ptr [rip + 0x71e5f4] ; 0x100aa5e90
0x10038789c: vsubpd xmm0, xmm0, xmmword ptr [rip + 0x71e5fc] ; 0x100aa5ea0
0x1003878a4: vhaddpd xmm0, xmm0, xmm0
0x1003878a8: vdivsd xmm0, xmm0, qword ptr [rip + 0x736da0] ; 0x100abe650
0x1003878b0: vmovsd qword ptr [rbx + 0xa0], xmm0
0x1003878b8: vmovsd qword ptr [rbx + 0xa8], xmm0
0x1003878c0: mov qword ptr [rbx + 0x90], rcx
0x1003878c7: vxorpd xmm0, xmm0, xmm0
0x1003878cb: vmovupd xmmword ptr [rbx + 0x78], xmm0
0x1003878d0: movabs rax, 0x3f8000003f800000
0x1003878da: mov qword ptr [rbx + 0x70], rax
0x1003878de: mov byte ptr [rbx + 0x6c], 0
0x1003878e2: call 0x1007945e0 ; 0x1007945e0
0x1003878e7: test rax, rax
0x1003878ea: je 0x100387956
0x1003878ec: lea r14, [rbx + 0x14]
0x1003878f0: lea r15, [rbx + 0x28]
0x1003878f4: lea rbx, [rbx + 0x24]
0x1003878f8: call 0x1007945e0 ; 0x1007945e0
0x1003878fd: lea rsi, [rip + 0x7fc74a] ; 0x100b8404e u_dt
0x100387904: mov ecx, 1
0x100387909: mov rdi, rax
0x10038790c: mov rdx, r14
0x10038790f: call 0x100793f20 ; 0x100793f20
0x100387914: call 0x1007945e0 ; 0x1007945e0
0x100387919: lea rsi, [rip + 0x7fc733] ; 0x100b84053 u_averagedt
0x100387920: mov ecx, 1
0x100387925: mov rdi, rax
0x100387928: mov rdx, r15
0x10038792b: call 0x100793f20 ; 0x100793f20
0x100387930: call 0x1007945e0 ; 0x1007945e0
0x100387935: lea rsi, [rip + 0x7fc723] ; 0x100b8405f u_time
0x10038793c: mov ecx, 1
0x100387941: mov rdi, rax
0x100387944: mov rdx, rbx
0x100387947: add rsp, 8
0x10038794b: pop rbx
0x10038794c: pop r14
0x10038794e: pop r15
0x100387950: pop rbp
0x100387951: jmp 0x100793f20 ; 0x100793f20
0x100387956: add rsp, 8
0x10038795a: pop rbx
0x10038795b: pop r14
0x10038795d: pop r15
0x10038795f: pop rbp
0x100387960: ret 
0x100387961: nop word ptr cs:[rax + rax]
