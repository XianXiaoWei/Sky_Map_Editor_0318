0x1000e6820: push rbp
0x1000e6821: mov rbp, rsp
0x1000e6824: push r15
0x1000e6826: push r14
0x1000e6828: push rbx
0x1000e6829: sub rsp, 0x38
0x1000e682d: mov r14, rsi
0x1000e6830: mov r15, rdi
0x1000e6833: mov eax, dword ptr [r15 + 0x78]
0x1000e6837: test eax, eax
0x1000e6839: je 0x1000e6865
0x1000e683b: mov rbx, qword ptr [r15 + 0x70]
0x1000e683f: xor ecx, ecx
0x1000e6841: nop word ptr cs:[rax + rax]
0x1000e6850: mov esi, dword ptr [rbx]
0x1000e6852: cmp esi, edx
0x1000e6854: jg 0x1000e685b
0x1000e6856: cmp dword ptr [rbx + 4], edx
0x1000e6859: jge 0x1000e6884
0x1000e685b: inc ecx
0x1000e685d: sub rbx, -0x80
0x1000e6861: cmp eax, ecx
0x1000e6863: ja 0x1000e6850
0x1000e6865: lea rdi, [rip + 0xa8bef8] ; 0x100b72764 anim != nullptr
0x1000e686c: lea rsi, [rip + 0xa8bf01] ; 0x100b72774 AnimationPack.cpp
0x1000e6873: mov edx, 0x22f
0x1000e6878: mov ecx, 3
0x1000e687d: call 0x1007e5f70 ; 0x1007e5f70
0x1000e6882: ud2 
0x1000e6884: sub edx, esi
0x1000e6886: vcvtsi2ss xmm0, xmm0, edx
0x1000e688a: vcvttss2si eax, xmm0
0x1000e688e: vmovd xmm0, eax
0x1000e6892: vpshufd xmm0, xmm0, 0
0x1000e6897: vmovdqu xmmword ptr [rbp - 0x38], xmm0
0x1000e689c: mov byte ptr [rbp - 0x28], 0
0x1000e68a0: movabs rax, 0x3f80000000000000
0x1000e68aa: mov qword ptr [rbp - 0x40], rax
0x1000e68ae: vmovaps xmm0, xmmword ptr [rip + 0x9c353a] ; 0x100aa9df0
0x1000e68b6: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1000e68bb: mov rsi, qword ptr [r15 + 0x88]
0x1000e68c2: movsxd rax, dword ptr [r15 + 0x54]
0x1000e68c6: shl rax, 4
0x1000e68ca: lea rdx, [rax + rax*2]
0x1000e68ce: mov rdi, r14
0x1000e68d1: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1000e68d6: lea rdx, [rbp - 0x50]
0x1000e68da: xor ecx, ecx
0x1000e68dc: xor r9d, r9d
0x1000e68df: mov rdi, rbx
0x1000e68e2: mov rsi, r14
0x1000e68e5: mov r8, r15
0x1000e68e8: call 0x1000e5020 ; 0x1000e5020
0x1000e68ed: add rsp, 0x38
0x1000e68f1: pop rbx
0x1000e68f2: pop r14
0x1000e68f4: pop r15
0x1000e68f6: pop rbp
0x1000e68f7: ret 
0x1000e68f8: nop dword ptr [rax + rax]
