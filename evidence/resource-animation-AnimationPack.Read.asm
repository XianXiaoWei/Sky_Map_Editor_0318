0x1000e5db0: push rbp
0x1000e5db1: mov rbp, rsp
0x1000e5db4: push r15
0x1000e5db6: push r14
0x1000e5db8: push r13
0x1000e5dba: push r12
0x1000e5dbc: push rbx
0x1000e5dbd: sub rsp, 0x98
0x1000e5dc4: mov rbx, r8
0x1000e5dc7: mov r13, rdx
0x1000e5dca: mov r14, rsi
0x1000e5dcd: mov r15, rdi
0x1000e5dd0: mov dword ptr [r15 + 0x40], ecx
0x1000e5dd4: lea rsi, [rbp - 0x2c]
0x1000e5dd8: mov rdi, r14
0x1000e5ddb: call 0x10076a280 ; 0x10076a280
0x1000e5de0: mov edx, 0x40
0x1000e5de5: mov rdi, r14
0x1000e5de8: mov rsi, r15
0x1000e5deb: call 0x10076a0a0 ; 0x10076a0a0
0x1000e5df0: mov eax, dword ptr [rbp - 0x2c]
0x1000e5df3: lea ecx, [rax - 7]
0x1000e5df6: cmp ecx, 3
0x1000e5df9: jae 0x1000e61f6
0x1000e5dff: mov qword ptr [rbp - 0x40], rbx
0x1000e5e03: lea r12, [r15 + 0x54]
0x1000e5e07: mov rdi, r14
0x1000e5e0a: mov rsi, r12
0x1000e5e0d: call 0x10076a240 ; 0x10076a240
0x1000e5e12: lea rsi, [r15 + 0x48]
0x1000e5e16: mov rdi, r14
0x1000e5e19: mov qword ptr [rbp - 0x60], rsi
0x1000e5e1d: call 0x10076a240 ; 0x10076a240
0x1000e5e22: lea rsi, [r15 + 0x50]
0x1000e5e26: mov rdi, r14
0x1000e5e29: mov qword ptr [rbp - 0x50], rsi
0x1000e5e2d: call 0x10076a240 ; 0x10076a240
0x1000e5e32: lea rsi, [r15 + 0x4c]
0x1000e5e36: mov rdi, r14
0x1000e5e39: mov qword ptr [rbp - 0x58], rsi
0x1000e5e3d: call 0x10076a260 ; 0x10076a260
0x1000e5e42: mov eax, dword ptr [r15 + 0x54]
0x1000e5e46: test eax, eax
0x1000e5e48: jle 0x1000e6222
0x1000e5e4e: mov ebx, dword ptr [r15 + 0x48]
0x1000e5e52: mov rdx, qword ptr [rip + 0x1cecd17] ; 0x101dd2b70
0x1000e5e59: imul rsi, rax, 0x44
0x1000e5e5d: mov ecx, 4
0x1000e5e62: mov rdi, r13
0x1000e5e65: call 0x100795530 ; 0x100795530
0x1000e5e6a: mov qword ptr [r15 + 0x60], rax
0x1000e5e6e: test ebx, ebx
0x1000e5e70: jle 0x1000e5e90
0x1000e5e72: mov rdx, qword ptr [rip + 0x1ceccf7] ; 0x101dd2b70
0x1000e5e79: mov esi, dword ptr [r12]
0x1000e5e7d: shl rsi, 6
0x1000e5e81: mov ecx, 0x10
0x1000e5e86: mov rdi, r13
0x1000e5e89: call 0x100795530 ; 0x100795530
0x1000e5e8e: jmp 0x1000e5e92 ; 0x1000e5e92
0x1000e5e90: xor eax, eax
0x1000e5e92: mov qword ptr [r15 + 0x68], rax
0x1000e5e96: mov eax, dword ptr [r15 + 0x54]
0x1000e5e9a: test eax, eax
0x1000e5e9c: jle 0x1000e6047
0x1000e5ea2: test ebx, ebx
0x1000e5ea4: jle 0x1000e5ffb
0x1000e5eaa: mov qword ptr [rbp - 0x48], r13
0x1000e5eae: xor ebx, ebx
0x1000e5eb0: xor r12d, r12d
0x1000e5eb3: xor r13d, r13d
0x1000e5eb6: nop word ptr cs:[rax + rax]
0x1000e5ec0: mov rsi, qword ptr [r15 + 0x60]
0x1000e5ec4: add rsi, r12
0x1000e5ec7: mov edx, 0x40
0x1000e5ecc: mov rdi, r14
0x1000e5ecf: call 0x10076a0a0 ; 0x10076a0a0
0x1000e5ed4: mov rsi, qword ptr [r15 + 0x68]
0x1000e5ed8: add rsi, rbx
0x1000e5edb: mov edx, 0x40
0x1000e5ee0: mov rdi, r14
0x1000e5ee3: call 0x10076a0a0 ; 0x10076a0a0
0x1000e5ee8: mov rax, qword ptr [r15 + 0x68]
0x1000e5eec: vmovaps xmm0, xmmword ptr [rax + rbx]
0x1000e5ef1: vpermilps xmm1, xmm0, 0xe7
0x1000e5ef7: vucomiss xmm1, xmm1
0x1000e5efb: jp 0x1000e61c3
0x1000e5f01: vmovshdup xmm1, xmm0
0x1000e5f05: vucomiss xmm0, xmm1
0x1000e5f09: jp 0x1000e61c3
0x1000e5f0f: vpermilpd xmm0, xmm0, 1
0x1000e5f15: vucomiss xmm0, xmm0
0x1000e5f19: jp 0x1000e61c3
0x1000e5f1f: vmovaps xmm0, xmmword ptr [rax + rbx + 0x10]
0x1000e5f25: vpermilps xmm1, xmm0, 0xe7
0x1000e5f2b: vucomiss xmm1, xmm1
0x1000e5f2f: jp 0x1000e61c3
0x1000e5f35: vmovshdup xmm1, xmm0
0x1000e5f39: vucomiss xmm0, xmm1
0x1000e5f3d: jp 0x1000e61c3
0x1000e5f43: vpermilpd xmm0, xmm0, 1
0x1000e5f49: vucomiss xmm0, xmm0
0x1000e5f4d: jp 0x1000e61c3
0x1000e5f53: vmovaps xmm0, xmmword ptr [rax + rbx + 0x20]
0x1000e5f59: vpermilps xmm1, xmm0, 0xe7
0x1000e5f5f: vucomiss xmm1, xmm1
0x1000e5f63: jp 0x1000e61c3
0x1000e5f69: vmovshdup xmm1, xmm0
0x1000e5f6d: vucomiss xmm0, xmm1
0x1000e5f71: jp 0x1000e61c3
0x1000e5f77: vpermilpd xmm0, xmm0, 1
0x1000e5f7d: vucomiss xmm0, xmm0
0x1000e5f81: jp 0x1000e61c3
0x1000e5f87: vmovaps xmm0, xmmword ptr [rax + rbx + 0x30]
0x1000e5f8d: vpermilps xmm1, xmm0, 0xe7
0x1000e5f93: vucomiss xmm1, xmm1
0x1000e5f97: jp 0x1000e61c3
0x1000e5f9d: vmovshdup xmm1, xmm0
0x1000e5fa1: vucomiss xmm0, xmm1
0x1000e5fa5: jp 0x1000e61c3
0x1000e5fab: vpermilpd xmm0, xmm0, 1
0x1000e5fb1: vucomiss xmm0, xmm0
0x1000e5fb5: jp 0x1000e61c3
0x1000e5fbb: mov rax, qword ptr [r15 + 0x60]
0x1000e5fbf: lea rsi, [rax + r12 + 0x40]
0x1000e5fc4: mov edx, 4
0x1000e5fc9: mov rdi, r14
0x1000e5fcc: call 0x10076a0a0 ; 0x10076a0a0
0x1000e5fd1: inc r13
0x1000e5fd4: movsxd rax, dword ptr [r15 + 0x54]
0x1000e5fd8: add r12, 0x44
0x1000e5fdc: add rbx, 0x40
0x1000e5fe0: cmp r13, rax
0x1000e5fe3: jl 0x1000e5ec0
0x1000e5fe9: mov r13, qword ptr [rbp - 0x48]
0x1000e5fed: mov rcx, qword ptr [rbp - 0x60]
0x1000e5ff1: cmp dword ptr [rcx], 0
0x1000e5ff4: jg 0x1000e6054
0x1000e5ff6: jmp 0x1000e619a ; 0x1000e619a
0x1000e5ffb: xor ebx, ebx
0x1000e5ffd: xor r12d, r12d
0x1000e6000: mov rsi, qword ptr [r15 + 0x60]
0x1000e6004: add rsi, rbx
0x1000e6007: mov edx, 0x40
0x1000e600c: mov rdi, r14
0x1000e600f: call 0x10076a0a0 ; 0x10076a0a0
0x1000e6014: mov esi, 0x40
0x1000e6019: mov rdi, r14
0x1000e601c: call 0x100769ec0 ; 0x100769ec0
0x1000e6021: mov rax, qword ptr [r15 + 0x60]
0x1000e6025: lea rsi, [rax + rbx + 0x40]
0x1000e602a: mov edx, 4
0x1000e602f: mov rdi, r14
0x1000e6032: call 0x10076a0a0 ; 0x10076a0a0
0x1000e6037: inc r12
0x1000e603a: movsxd rax, dword ptr [r15 + 0x54]
0x1000e603e: add rbx, 0x44
0x1000e6042: cmp r12, rax
0x1000e6045: jl 0x1000e6000
0x1000e6047: mov rcx, qword ptr [rbp - 0x60]
0x1000e604b: cmp dword ptr [rcx], 0
0x1000e604e: jle 0x1000e619a
0x1000e6054: mov rcx, qword ptr [rbp - 0x50]
0x1000e6058: cmp dword ptr [rcx], 0
0x1000e605b: jle 0x1000e6246
0x1000e6061: mov rdx, qword ptr [rip + 0x1cecb00] ; 0x101dd2b68
0x1000e6068: mov eax, eax
0x1000e606a: shl rax, 4
0x1000e606e: lea rsi, [rax + rax*2]
0x1000e6072: mov ecx, 0x10
0x1000e6077: mov rdi, r13
0x1000e607a: call 0x100795530 ; 0x100795530
0x1000e607f: mov rbx, rax
0x1000e6082: mov qword ptr [r15 + 0x58], rbx
0x1000e6086: mov r12d, dword ptr [r15 + 0x54]
0x1000e608a: test r12d, r12d
0x1000e608d: jle 0x1000e60bc
0x1000e608f: nop 
0x1000e6090: mov rdi, r14
0x1000e6093: mov rsi, rbx
0x1000e6096: call 0x10076a360 ; 0x10076a360
0x1000e609b: lea rsi, [rbx + 0x10]
0x1000e609f: mov rdi, r14
0x1000e60a2: call 0x10076a4f0 ; 0x10076a4f0
0x1000e60a7: lea rsi, [rbx + 0x20]
0x1000e60ab: mov rdi, r14
0x1000e60ae: call 0x10076a360 ; 0x10076a360
0x1000e60b3: add rbx, 0x30
0x1000e60b7: dec r12
0x1000e60ba: jne 0x1000e6090
0x1000e60bc: mov rax, qword ptr [rbp - 0x58]
0x1000e60c0: cmp byte ptr [rax], 1
0x1000e60c3: jne 0x1000e60ef
0x1000e60c5: mov dword ptr [rbp - 0x30], 0x400000
0x1000e60cc: lea rsi, [rbp - 0x34]
0x1000e60d0: mov rdi, r14
0x1000e60d3: call 0x10076a280 ; 0x10076a280
0x1000e60d8: cmp dword ptr [rbp - 0x2c], 9
0x1000e60dc: jb 0x1000e610a
0x1000e60de: lea rsi, [rbp - 0x30]
0x1000e60e2: mov rdi, r14
0x1000e60e5: call 0x10076a280 ; 0x10076a280
0x1000e60ea: mov ebx, dword ptr [rbp - 0x30]
0x1000e60ed: jmp 0x1000e610f ; 0x1000e610f
0x1000e60ef: mov esi, dword ptr [r15 + 0x54]
0x1000e60f3: mov r8d, dword ptr [rbp - 0x2c]
0x1000e60f7: mov rdi, r15
0x1000e60fa: mov rdx, r13
0x1000e60fd: mov rcx, r14
0x1000e6100: call 0x1000e4a20 ; 0x1000e4a20
0x1000e6105: jmp 0x1000e619a ; 0x1000e619a
0x1000e610a: mov ebx, 0x400000
0x1000e610f: call 0x1007c6c20 ; 0x1007c6c20
0x1000e6114: lea rcx, [rip + 0x1f62a35] ; 0x102048b50
0x1000e611b: mov rdx, qword ptr [rcx]
0x1000e611e: mov ecx, 1
0x1000e6123: mov rdi, rax
0x1000e6126: mov rsi, rbx
0x1000e6129: call 0x100795530 ; 0x100795530
0x1000e612e: mov r12, rax
0x1000e6131: mov rbx, qword ptr [r14 + 0x10]
0x1000e6135: add r14, 8
0x1000e6139: mov rdi, r14
0x1000e613c: call 0x100769850 ; 0x100769850
0x1000e6141: cdqe 
0x1000e6143: add rbx, rax
0x1000e6146: mov ecx, dword ptr [rbp - 0x34]
0x1000e6149: mov r8d, dword ptr [rbp - 0x30]
0x1000e614d: mov edi, 1
0x1000e6152: mov rsi, rbx
0x1000e6155: mov rdx, r12
0x1000e6158: call 0x100780880 ; 0x100780880
0x1000e615d: lea rdi, [rbp - 0xa8]
0x1000e6164: xor esi, esi
0x1000e6166: mov rdx, r12
0x1000e6169: mov ecx, eax
0x1000e616b: call 0x100769c80 ; 0x100769c80
0x1000e6170: mov esi, dword ptr [r15 + 0x54]
0x1000e6174: mov r8d, dword ptr [rbp - 0x2c]
0x1000e6178: lea rcx, [rbp - 0xa8]
0x1000e617f: mov rdi, r15
0x1000e6182: mov rdx, r13
0x1000e6185: call 0x1000e4a20 ; 0x1000e4a20
0x1000e618a: call 0x1007c6c20 ; 0x1007c6c20
0x1000e618f: mov rdi, rax
0x1000e6192: mov rsi, r12
0x1000e6195: call 0x100795a70 ; 0x100795a70
0x1000e619a: mov qword ptr [r15 + 0xd0], r13
0x1000e61a1: mov byte ptr [r15 + 0xd8], 0
0x1000e61a9: mov rdi, r15
0x1000e61ac: call 0x1000e62a0 ; 0x1000e62a0
0x1000e61b1: add rsp, 0x98
0x1000e61b8: pop rbx
0x1000e61b9: pop r12
0x1000e61bb: pop r13
0x1000e61bd: pop r14
0x1000e61bf: pop r15
0x1000e61c1: pop rbp
0x1000e61c2: ret 
0x1000e61c3: add r12, qword ptr [r15 + 0x60]
0x1000e61c7: mov qword ptr [rsp], r12
0x1000e61cb: lea rdi, [rip + 0xa8c6d1] ; 0x100b728a3 !isNan(boneLinkMats[i] )
0x1000e61d2: lea rsi, [rip + 0xa8c59b] ; 0x100b72774 AnimationPack.cpp
0x1000e61d9: lea r8, [rip + 0xa8c6dc] ; 0x100b728bc AnimPack/Mesh "%s" invalid link mat on bone "%s"
0x1000e61e0: mov edx, 0x1c5
0x1000e61e5: mov ecx, 4
0x1000e61ea: xor eax, eax
0x1000e61ec: mov r9, r15
0x1000e61ef: call 0x1007e6030 ; 0x1007e6030
0x1000e61f4: ud2 
0x1000e61f6: mov qword ptr [rsp + 0x10], rbx
0x1000e61fb: mov dword ptr [rsp], eax
0x1000e61fe: mov dword ptr [rsp + 8], 9
0x1000e6206: lea rdi, [rip + 0xa8c5a2] ; 0x100b727af version <= kAnimPackVersion && version >= kAnimPackMinVersion
0x1000e620d: lea rsi, [rip + 0xa8c560] ; 0x100b72774 AnimationPack.cpp
0x1000e6214: lea r8, [rip + 0xa8c5d2] ; 0x100b727ed %s version is %d  (%d required.)  To force rebuild delete %s.
0x1000e621b: mov edx, 0x1ae
0x1000e6220: jmp 0x1000e61e5 ; 0x1000e61e5
0x1000e6222: mov rax, qword ptr [rbp - 0x40]
0x1000e6226: mov qword ptr [rsp], rax
0x1000e622a: lea rdi, [rip + 0xa8c5fa] ; 0x100b7282b boneCount > 0
0x1000e6231: lea rsi, [rip + 0xa8c53c] ; 0x100b72774 AnimationPack.cpp
0x1000e6238: lea r8, [rip + 0xa8c5fa] ; 0x100b72839 %s animation with 0 bones. To force rebuild delete %s. To fix corrupt asset try force syncing source fbx.
0x1000e623f: mov edx, 0x1b7
0x1000e6244: jmp 0x1000e61e5 ; 0x1000e61e5
0x1000e6246: mov rax, qword ptr [rbp - 0x40]
0x1000e624a: mov qword ptr [rsp], rax
0x1000e624e: lea rdi, [rip + 0xa8c698] ; 0x100b728ed frameRate > 0
0x1000e6255: lea rsi, [rip + 0xa8c518] ; 0x100b72774 AnimationPack.cpp
0x1000e625c: lea r8, [rip + 0xa8c698] ; 0x100b728fb %s animation with 0 frameRate. To force rebuild delete %s. To fix corrupt asset try force syncing source fbx.
0x1000e6263: mov edx, 0x1d1
0x1000e6268: jmp 0x1000e61e5 ; 0x1000e61e5
0x1000e626d: mov rdi, rax
0x1000e6270: call 0x100011bf0 ; 0x100011bf0
0x1000e6275: jmp 0x1000e6277 ; 0x1000e6277
0x1000e6277: mov rbx, rax
0x1000e627a: call 0x1007c6c20 ; 0x1007c6c20
0x1000e627f: mov rdi, rax
0x1000e6282: mov rsi, r12
0x1000e6285: call 0x100795a70 ; 0x100795a70
0x1000e628a: mov rdi, rbx
0x1000e628d: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1000e6292: mov rdi, rax
0x1000e6295: call 0x100011bf0 ; 0x100011bf0
0x1000e629a: nop word ptr [rax + rax]
