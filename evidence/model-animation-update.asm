0x100469710: push rbp
0x100469711: mov rbp, rsp
0x100469714: push r15
0x100469716: push r14
0x100469718: push r13
0x10046971a: push r12
0x10046971c: push rbx
0x10046971d: sub rsp, 0xa288
0x100469724: mov rbx, r9
0x100469727: mov qword ptr [rbp - 0xa2a8], r8
0x10046972e: mov qword ptr [rbp - 0xa2b0], rcx
0x100469735: mov r12, rdx
0x100469738: mov r13, rsi
0x10046973b: mov r15, qword ptr [rbp + 0x10]
0x10046973f: mov rax, qword ptr [rip + 0x7a4192] ; 0x100c0d8d8
0x100469746: mov rax, qword ptr [rax]
0x100469749: mov qword ptr [rbp - 0x30], rax
0x10046974d: lea r14, [rbp - 0x6260]
0x100469754: mov rdi, r14
0x100469757: call 0x100106170 ; 0x100106170
0x10046975c: xor esi, esi
0x10046975e: xor edx, edx
0x100469760: xor r8d, r8d
0x100469763: mov rdi, r14
0x100469766: mov rcx, r15
0x100469769: call 0x1000941f0 ; 0x1000941f0
0x10046976e: mov rsi, qword ptr [rbp + 0x18]
0x100469772: mov rdx, qword ptr [rbx + 0x60]
0x100469776: lea rdi, [rbp - 0x6260]
0x10046977d: xor ecx, ecx
0x10046977f: call 0x1000942e0 ; 0x1000942e0
0x100469784: mov rsi, qword ptr [rbx + 0x68]
0x100469788: lea rdi, [rbp - 0x6260]
0x10046978f: vmovss xmm0, dword ptr [rip + 0x63b929] ; 0x100aa50c0
0x100469797: call 0x1000959b0 ; 0x1000959b0
0x10046979c: lea rdi, [rbp - 0x6260]
0x1004697a3: mov esi, eax
0x1004697a5: call 0x100097d30 ; 0x100097d30
0x1004697aa: lea rdi, [rbp - 0x6260]
0x1004697b1: vxorps xmm0, xmm0, xmm0
0x1004697b5: call 0x100098b90 ; 0x100098b90
0x1004697ba: mov rax, qword ptr [r13]
0x1004697be: mov r13, qword ptr [rax + 0x58]
0x1004697c2: test r13, r13
0x1004697c5: je 0x100469924
0x1004697cb: mov eax, dword ptr [r13 + 0x54]
0x1004697cf: cmp eax, 0x101
0x1004697d4: jae 0x100469943
0x1004697da: mov rcx, qword ptr [rbp - 0xa20]
0x1004697e1: vmovaps xmm0, xmmword ptr [rcx]
0x1004697e5: vmovaps xmmword ptr [rbp - 0xa2a0], xmm0
0x1004697ed: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x1004697f2: vmovaps xmmword ptr [rbp - 0xa290], xmm0
0x1004697fa: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x1004697ff: vmovaps xmmword ptr [rbp - 0xa280], xmm0
0x100469807: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x10046980c: vmovaps xmmword ptr [rbp - 0xa270], xmm0
0x100469814: test eax, eax
0x100469816: je 0x1004698ba
0x10046981c: xor r15d, r15d
0x10046981f: lea r14, [rbp - 0x6260]
0x100469826: mov rsi, qword ptr [r13 + 0x60]
0x10046982a: mov eax, r15d
0x10046982d: nop dword ptr [rax]
0x100469830: cdqe 
0x100469832: imul rbx, rax, 0x44
0x100469836: add rsi, rbx
0x100469839: xor edx, edx
0x10046983b: xor ecx, ecx
0x10046983d: mov rdi, r14
0x100469840: call 0x100093a90 ; 0x100093a90
0x100469845: test eax, eax
0x100469847: jns 0x10046985a
0x100469849: mov rsi, qword ptr [r13 + 0x60]
0x10046984d: mov ecx, dword ptr [rsi + rbx + 0x40]
0x100469851: lea eax, [rcx - 1]
0x100469854: test ecx, ecx
0x100469856: jg 0x100469830
0x100469858: xor eax, eax
0x10046985a: mov rcx, qword ptr [rbp - 0xa20]
0x100469861: cdqe 
0x100469863: shl rax, 6
0x100469867: inc r15
0x10046986a: vmovaps xmm0, xmmword ptr [rcx + rax + 0x40]
0x100469870: mov rdx, r15
0x100469873: shl rdx, 6
0x100469877: vmovaps xmmword ptr [rbp + rdx - 0xa2a0], xmm0
0x100469880: vmovaps xmm0, xmmword ptr [rcx + rax + 0x50]
0x100469886: vmovaps xmmword ptr [rbp + rdx - 0xa290], xmm0
0x10046988f: vmovaps xmm0, xmmword ptr [rcx + rax + 0x60]
0x100469895: vmovaps xmmword ptr [rbp + rdx - 0xa280], xmm0
0x10046989e: vmovaps xmm0, xmmword ptr [rcx + rax + 0x70]
0x1004698a4: vmovaps xmmword ptr [rbp + rdx - 0xa270], xmm0
0x1004698ad: movsxd rax, dword ptr [r13 + 0x54]
0x1004698b1: cmp r15, rax
0x1004698b4: jl 0x100469826
0x1004698ba: lea rdx, [rbp - 0xa2a0]
0x1004698c1: mov rbx, qword ptr [rbp - 0xa2b0]
0x1004698c8: mov rdi, rbx
0x1004698cb: mov rsi, r12
0x1004698ce: call 0x100457f50 ; 0x100457f50
0x1004698d3: mov rdi, qword ptr [rbp - 0xa2a8]
0x1004698da: mov rsi, rbx
0x1004698dd: mov rdx, r12
0x1004698e0: call 0x10045edf0 ; 0x10045edf0
0x1004698e5: lea rdi, [rbp - 0x6260]
0x1004698ec: call 0x10009e4e0 ; 0x10009e4e0
0x1004698f1: lea rdi, [rbp - 0x690]
0x1004698f8: call 0x100106d10 ; 0x100106d10
0x1004698fd: mov rax, qword ptr [rip + 0x7a3fd4] ; 0x100c0d8d8
0x100469904: mov rax, qword ptr [rax]
0x100469907: cmp rax, qword ptr [rbp - 0x30]
0x10046990b: jne 0x10046991f
0x10046990d: add rsp, 0xa288
0x100469914: pop rbx
0x100469915: pop r12
0x100469917: pop r13
0x100469919: pop r14
0x10046991b: pop r15
0x10046991d: pop rbp
0x10046991e: ret 
0x10046991f: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100469924: lea rdi, [rip + 0x7205ac] ; 0x100b89ed7 animData != nullptr
0x10046992b: lea rsi, [rip + 0x72005f] ; 0x100b89991 Model.cpp
0x100469932: mov edx, 0x389
0x100469937: mov ecx, 3
0x10046993c: call 0x1007e5f70 ; 0x1007e5f70
0x100469941: jmp 0x100469960 ; 0x100469960
0x100469943: lea rdi, [rip + 0x7205a1] ; 0x100b89eeb animData->boneCount <= kMaxBones
0x10046994a: lea rsi, [rip + 0x720040] ; 0x100b89991 Model.cpp
0x100469951: mov edx, 0x38a
0x100469956: mov ecx, 3
0x10046995b: call 0x1007e5f70 ; 0x1007e5f70
0x100469960: ud2 
0x100469962: jmp 0x10046996a ; 0x10046996a
0x100469964: jmp 0x10046996a ; 0x10046996a
0x100469966: jmp 0x10046996a ; 0x10046996a
0x100469968: jmp 0x10046996a ; 0x10046996a
0x10046996a: mov rbx, rax
0x10046996d: lea rdi, [rbp - 0x690]
0x100469974: call 0x100106d10 ; 0x100106d10
0x100469979: mov rdi, rbx
0x10046997c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100469981: nop word ptr cs:[rax + rax]
