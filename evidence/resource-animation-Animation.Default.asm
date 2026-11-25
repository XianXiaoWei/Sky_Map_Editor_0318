0x100096120: push rbp
0x100096121: mov rbp, rsp
0x100096124: push r15
0x100096126: push r14
0x100096128: push rbx
0x100096129: push rax
0x10009612a: mov r14, rdi
0x10009612d: cmp dword ptr [r14 + 0x6220], 0
0x100096135: jle 0x100096245
0x10009613b: xor ebx, ebx
0x10009613d: nop dword ptr [rax]
0x100096140: call 0x10009fcd0 ; 0x10009fcd0
0x100096145: mov rsi, qword ptr [r14 + rbx*8 + 0x6020]
0x10009614d: xor edx, edx
0x10009614f: mov rdi, rax
0x100096152: call 0x1000dd230 ; 0x1000dd230
0x100096157: mov r15, rax
0x10009615a: test r15, r15
0x10009615d: je 0x10009616a
0x10009615f: cmp dword ptr [r15 + 0x20], 0
0x100096164: jg 0x1000961ea
0x10009616a: inc rbx
0x10009616d: movsxd rax, dword ptr [r14 + 0x6220]
0x100096174: cmp rbx, rax
0x100096177: jl 0x100096140
0x100096179: test eax, eax
0x10009617b: jle 0x100096245
0x100096181: mov rax, qword ptr [r14 + 0x6020]
0x100096188: mov edx, dword ptr [rax + 0x48]
0x10009618b: sub rsp, 8
0x10009618f: vmovss xmm0, dword ptr [rip + 0xa0ef29] ; 0x100aa50c0
0x100096197: vmovss xmm5, dword ptr [rip + 0xa1090d] ; 0x100aa6aac
0x10009619f: mov esi, 1
0x1000961a4: mov ecx, 0
0x1000961a9: mov r8d, 0
0x1000961af: mov r9d, 0
0x1000961b5: vxorps xmm3, xmm3, xmm3
0x1000961b9: vxorps xmm4, xmm4, xmm4
0x1000961bd: mov rdi, r14
0x1000961c0: vmovaps xmm1, xmm0
0x1000961c4: vmovaps xmm2, xmm0
0x1000961c8: push -1
0x1000961ca: push 0
0x1000961cc: push 0
0x1000961ce: push -1
0x1000961d0: push -1
0x1000961d2: push 0
0x1000961d4: push 1
0x1000961d6: push 1
0x1000961d8: push 0
0x1000961da: call 0x100095c70 ; 0x100095c70
0x1000961df: add rsp, 0x58
0x1000961e3: pop rbx
0x1000961e4: pop r14
0x1000961e6: pop r15
0x1000961e8: pop rbp
0x1000961e9: ret 
0x1000961ea: call 0x10009fcd0 ; 0x10009fcd0
0x1000961ef: xor edx, edx
0x1000961f1: mov rdi, rax
0x1000961f4: mov rsi, r15
0x1000961f7: call 0x1000dd350 ; 0x1000dd350
0x1000961fc: test byte ptr [rax + 0x10], 1
0x100096200: jne 0x10009620b
0x100096202: add rax, 0x10
0x100096206: inc rax
0x100096209: jmp 0x100096214 ; 0x100096214
0x10009620b: mov rax, qword ptr [rax + 0x20]
0x10009620f: test rax, rax
0x100096212: je 0x100096236
0x100096214: vmovss xmm0, dword ptr [rip + 0xa0eea4] ; 0x100aa50c0
0x10009621c: mov esi, 0xffffffff
0x100096221: mov rdi, r14
0x100096224: mov rdx, rax
0x100096227: add rsp, 8
0x10009622b: pop rbx
0x10009622c: pop r14
0x10009622e: pop r15
0x100096230: pop rbp
0x100096231: jmp 0x1000959d0 ; 0x1000959d0
0x100096236: mov eax, dword ptr [r14 + 0x6220]
0x10009623d: test eax, eax
0x10009623f: jg 0x100096181
0x100096245: lea rdi, [rip + 0xacf875] ; 0x100b65ac1 m_animPackCount > 0
0x10009624c: lea rsi, [rip + 0xacf3a1] ; 0x100b655f4 AnimationInstance.cpp
0x100096253: mov edx, 0x2b4
0x100096258: mov ecx, 3
0x10009625d: call 0x1007e5f70 ; 0x1007e5f70
0x100096262: ud2 
0x100096264: nop word ptr cs:[rax + rax]
