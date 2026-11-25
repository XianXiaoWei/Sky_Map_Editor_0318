0x1007f5430: push rbp
0x1007f5431: mov rbp, rsp
0x1007f5434: push r15
0x1007f5436: push r14
0x1007f5438: push r13
0x1007f543a: push r12
0x1007f543c: push rbx
0x1007f543d: sub rsp, 0x18
0x1007f5441: mov r11, rdi
0x1007f5444: cmp esi, 6
0x1007f5447: jae 0x1007f5566
0x1007f544d: mov r12d, esi
0x1007f5450: lea rax, [r12 + r12*4]
0x1007f5454: cmp dword ptr [r11 + rax*8 + 0x150], 0
0x1007f545d: jne 0x1007f5585
0x1007f5463: mov qword ptr [rbp - 0x38], rax
0x1007f5467: mov dword ptr [rbp - 0x30], r9d
0x1007f546b: mov rax, qword ptr [rbp + 0x18]
0x1007f546f: mov qword ptr [rbp - 0x40], rax
0x1007f5473: mov eax, dword ptr [rbp + 0x10]
0x1007f5476: mov dword ptr [rbp - 0x2c], eax
0x1007f5479: mov r10d, dword ptr [r11 + 0x130]
0x1007f5480: test r8d, r8d
0x1007f5483: je 0x1007f54ee
0x1007f5485: mov ebx, r8d
0x1007f5488: xor r15d, r15d
0x1007f548b: lea r14, [rip + 0x2ee5be] ; 0x100ae3a50
0x1007f5492: mov r13d, r10d
0x1007f5495: nop word ptr cs:[rax + rax]
0x1007f54a0: mov eax, dword ptr [rcx]
0x1007f54a2: mov edi, r13d
0x1007f54a5: shl rdi, 4
0x1007f54a9: mov dword ptr [r11 + rdi], eax
0x1007f54ad: mov eax, dword ptr [rdx]
0x1007f54af: mov dword ptr [r11 + rdi + 4], eax
0x1007f54b4: mov dword ptr [r11 + rdi + 0xc], esi
0x1007f54b9: mov dword ptr [r11 + rdi + 8], r15d
0x1007f54be: mov r9d, dword ptr [rdx]
0x1007f54c1: dec r9d
0x1007f54c4: mov eax, 0
0x1007f54c9: cmp r9d, 0x22
0x1007f54cd: ja 0x1007f54d6
0x1007f54cf: movsxd rax, r9d
0x1007f54d2: mov eax, dword ptr [r14 + rax*4]
0x1007f54d6: add eax, r15d
0x1007f54d9: add rcx, 4
0x1007f54dd: add rdx, 4
0x1007f54e1: inc r13d
0x1007f54e4: mov r15d, eax
0x1007f54e7: dec rbx
0x1007f54ea: jne 0x1007f54a0
0x1007f54ec: jmp 0x1007f54f0 ; 0x1007f54f0
0x1007f54ee: xor eax, eax
0x1007f54f0: add r10d, r8d
0x1007f54f3: mov dword ptr [r11 + 0x130], r10d
0x1007f54fa: mov dword ptr [r11 + r12*8 + 0x100], eax
0x1007f5502: mov esi, dword ptr [rbp - 0x2c]
0x1007f5505: mov dword ptr [r11 + r12*8 + 0x104], esi
0x1007f550d: cmp r10d, 0x11
0x1007f5511: jae 0x1007f55a4
0x1007f5517: mov rcx, qword ptr [rbp - 0x38]
0x1007f551b: lea rdi, [r11 + rcx*8 + 0x148]
0x1007f5523: lea rcx, [r11 + 0x140]
0x1007f552a: lea rdx, [r11 + 0x13c]
0x1007f5531: test esi, esi
0x1007f5533: cmove rcx, rdx
0x1007f5537: imul eax, dword ptr [rcx]
0x1007f553a: add r11, 0x418
0x1007f5541: mov edx, 2
0x1007f5546: mov rsi, r11
0x1007f5549: mov ecx, dword ptr [rbp - 0x30]
0x1007f554c: mov r8d, eax
0x1007f554f: mov r9, qword ptr [rbp - 0x40]
0x1007f5553: add rsp, 0x18
0x1007f5557: pop rbx
0x1007f5558: pop r12
0x1007f555a: pop r13
0x1007f555c: pop r14
0x1007f555e: pop r15
0x1007f5560: pop rbp
0x1007f5561: jmp 0x100794e00 ; 0x100794e00
0x1007f5566: lea rdi, [rip + 0x3b25bc] ; 0x100ba7b29 idx < kMaxVertexBuffers
0x1007f556d: lea rsi, [rip + 0x3b2570] ; 0x100ba7ae4 Vertex.cpp
0x1007f5574: mov edx, 0x3c
0x1007f5579: mov ecx, 3
0x1007f557e: call 0x1007e5f70 ; 0x1007e5f70
0x1007f5583: ud2 
0x1007f5585: lea rdi, [rip + 0x3b25b5] ; 0x100ba7b41 m_vertexBuffers[ idx ].GetUsage() == Bind_None
0x1007f558c: lea rsi, [rip + 0x3b2551] ; 0x100ba7ae4 Vertex.cpp
0x1007f5593: mov edx, 0x3d
0x1007f5598: mov ecx, 3
0x1007f559d: call 0x1007e5f70 ; 0x1007e5f70
0x1007f55a2: ud2 
0x1007f55a4: lea rdi, [rip + 0x3b25c5] ; 0x100ba7b70 m_format.attributeCount <= kMaxShaderAttributes
0x1007f55ab: lea rsi, [rip + 0x3b2532] ; 0x100ba7ae4 Vertex.cpp
0x1007f55b2: mov edx, 0x4e
0x1007f55b7: mov ecx, 3
0x1007f55bc: call 0x1007e5f70 ; 0x1007e5f70
0x1007f55c1: ud2 
0x1007f55c3: nop word ptr cs:[rax + rax]
