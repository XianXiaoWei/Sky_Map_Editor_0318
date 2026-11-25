0x10052e320: push rbp
0x10052e321: mov rbp, rsp
0x10052e324: push r15
0x10052e326: push r14
0x10052e328: push r13
0x10052e32a: push r12
0x10052e32c: push rbx
0x10052e32d: sub rsp, 0x28
0x10052e331: mov r14, rdi
0x10052e334: mov qword ptr [r14 + 0x50], 0
0x10052e33c: mov dword ptr [r14 + 0x108], 0
0x10052e347: mov rax, qword ptr [r14 + 0x38]
0x10052e34b: mov rcx, qword ptr [rax + 8]
0x10052e34f: mov qword ptr [r14 + 0x58], rcx
0x10052e353: mov eax, dword ptr [rax + 0x10]
0x10052e356: mov dword ptr [r14 + 0x60], eax
0x10052e35a: test eax, eax
0x10052e35c: jle 0x10052e55a
0x10052e362: cmp eax, 0x21
0x10052e365: jge 0x10052e579
0x10052e36b: mov rax, qword ptr [r14 + 0xe8]
0x10052e372: test rax, rax
0x10052e375: je 0x10052e382
0x10052e377: cmp qword ptr [rax + 0x10], 0
0x10052e37c: jne 0x10052e54b
0x10052e382: lea r15, [r14 + 0xe8]
0x10052e389: mov r13, qword ptr [rsi + 0x298]
0x10052e390: xor eax, eax
0x10052e392: nop word ptr cs:[rax + rax]
0x10052e3a0: mov rbx, rax
0x10052e3a3: cmp rbx, 0x1f
0x10052e3a7: ja 0x10052e3b7
0x10052e3a9: mov rcx, qword ptr [r13 + rbx*8 + 0x10]
0x10052e3ae: lea rax, [rbx + 1]
0x10052e3b2: test rcx, rcx
0x10052e3b5: jne 0x10052e3a0
0x10052e3b7: cmp rbx, 0x20
0x10052e3bb: jae 0x10052e598
0x10052e3c1: lea rdi, [r13 + 0x270]
0x10052e3c8: lea rax, [rip + 0x18b01a9] ; 0x101dde578
0x10052e3cf: mov rdx, qword ptr [rax]
0x10052e3d2: mov esi, 0x140
0x10052e3d7: mov ecx, 0x10
0x10052e3dc: call 0x100795530 ; 0x100795530
0x10052e3e1: mov r12, rax
0x10052e3e4: mov rdi, r12
0x10052e3e7: call 0x1001e6010 ; 0x1001e6010
0x10052e3ec: mov qword ptr [r13 + rbx*8 + 0x10], r12
0x10052e3f1: vxorps xmm0, xmm0, xmm0
0x10052e3f5: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x10052e3fa: mov qword ptr [rbp - 0x40], 0
0x10052e402: lea rax, [r12 + 0xe8]
0x10052e40a: cmp qword ptr [r12 + 0xe8], 0
0x10052e413: je 0x10052e435
0x10052e415: mov rcx, r12
0x10052e418: add rcx, 0xf0
0x10052e41f: mov rdx, qword ptr [r12 + 0xf0]
0x10052e427: lea rsi, [rbp - 0x50]
0x10052e42b: mov qword ptr [rdx + 8], rsi
0x10052e42f: mov qword ptr [rbp - 0x40], rdx
0x10052e433: jmp 0x10052e44b ; 0x10052e44b
0x10052e435: lea rcx, [rbp - 0x50]
0x10052e439: mov qword ptr [r12 + 0xe8], rcx
0x10052e441: add r12, 0xf0
0x10052e448: mov rcx, r12
0x10052e44b: lea rdx, [rbp - 0x50]
0x10052e44f: mov qword ptr [rcx], rdx
0x10052e452: mov qword ptr [rbp - 0x50], rax
0x10052e456: mov qword ptr [rbp - 0x38], r13
0x10052e45a: cmp r15, rdx
0x10052e45d: je 0x10052e4de
0x10052e45f: mov rcx, qword ptr [r15]
0x10052e462: test rcx, rcx
0x10052e465: je 0x10052e4b8
0x10052e467: mov rax, qword ptr [r14 + 0xf0]
0x10052e46e: mov rdx, qword ptr [r14 + 0xf8]
0x10052e475: test rdx, rdx
0x10052e478: lea rdx, [rdx + 8]
0x10052e47c: cmove rdx, rcx
0x10052e480: mov qword ptr [rdx], rax
0x10052e483: mov rax, qword ptr [r14 + 0xf0]
0x10052e48a: mov rdx, qword ptr [r14 + 0xf8]
0x10052e491: add rcx, 8
0x10052e495: test rax, rax
0x10052e498: lea rax, [rax + 0x10]
0x10052e49c: cmove rax, rcx
0x10052e4a0: mov qword ptr [rax], rdx
0x10052e4a3: vxorps xmm0, xmm0, xmm0
0x10052e4a7: vmovups xmmword ptr [r15], xmm0
0x10052e4ac: mov qword ptr [r15 + 0x10], 0
0x10052e4b4: mov rax, qword ptr [rbp - 0x50]
0x10052e4b8: test rax, rax
0x10052e4bb: je 0x10052e4de
0x10052e4bd: cmp qword ptr [rax], 0
0x10052e4c1: je 0x10052e4d4
0x10052e4c3: mov rcx, qword ptr [rax + 8]
0x10052e4c7: mov qword ptr [rcx + 8], r15
0x10052e4cb: mov qword ptr [r14 + 0xf8], rcx
0x10052e4d2: jmp 0x10052e4d7 ; 0x10052e4d7
0x10052e4d4: mov qword ptr [rax], r15
0x10052e4d7: mov qword ptr [rax + 8], r15
0x10052e4db: mov qword ptr [r15], rax
0x10052e4de: mov rcx, qword ptr [rbp - 0x38]
0x10052e4e2: mov qword ptr [r14 + 0x100], rcx
0x10052e4e9: test rax, rax
0x10052e4ec: je 0x10052e52f
0x10052e4ee: mov rcx, qword ptr [rbp - 0x48]
0x10052e4f2: mov rdx, qword ptr [rbp - 0x40]
0x10052e4f6: test rdx, rdx
0x10052e4f9: lea rdx, [rdx + 8]
0x10052e4fd: cmove rdx, rax
0x10052e501: mov qword ptr [rdx], rcx
0x10052e504: mov rcx, qword ptr [rbp - 0x48]
0x10052e508: mov rdx, qword ptr [rbp - 0x40]
0x10052e50c: add rax, 8
0x10052e510: test rcx, rcx
0x10052e513: lea rcx, [rcx + 0x10]
0x10052e517: cmove rcx, rax
0x10052e51b: mov qword ptr [rcx], rdx
0x10052e51e: vxorps xmm0, xmm0, xmm0
0x10052e522: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x10052e527: mov qword ptr [rbp - 0x40], 0
0x10052e52f: mov rax, qword ptr [r15]
0x10052e532: test rax, rax
0x10052e535: je 0x10052e53d
0x10052e537: mov rdi, qword ptr [rax + 0x10]
0x10052e53b: jmp 0x10052e53f ; 0x10052e53f
0x10052e53d: xor edi, edi
0x10052e53f: mov rax, qword ptr [r14 + 0x58]
0x10052e543: mov rsi, qword ptr [rax]
0x10052e546: call 0x1001e6150 ; 0x1001e6150
0x10052e54b: add rsp, 0x28
0x10052e54f: pop rbx
0x10052e550: pop r12
0x10052e552: pop r13
0x10052e554: pop r14
0x10052e556: pop r15
0x10052e558: pop rbp
0x10052e559: ret 
0x10052e55a: lea rdi, [rip + 0x661c6b] ; 0x100b901cc m_numKeyFrames > 0
0x10052e561: lea rsi, [rip + 0x661bf4] ; 0x100b9015c PauseCameraConfig.cpp
0x10052e568: mov edx, 0x34
0x10052e56d: mov ecx, 3
0x10052e572: call 0x1007e5f70 ; 0x1007e5f70
0x10052e577: ud2 
0x10052e579: lea rdi, [rip + 0x661c5f] ; 0x100b901df m_numKeyFrames <= MAX_PAUSE_KEYFRAMES
0x10052e580: lea rsi, [rip + 0x661bd5] ; 0x100b9015c PauseCameraConfig.cpp
0x10052e587: mov edx, 0x35
0x10052e58c: mov ecx, 3
0x10052e591: call 0x1007e5f70 ; 0x1007e5f70
0x10052e596: ud2 
0x10052e598: lea rdi, [rip + 0x64ae0c] ; 0x100b793ab idx < kMaxCameras
0x10052e59f: lea rsi, [rip + 0x64ae17] ; 0x100b793bd ./CameraSystem.h
0x10052e5a6: mov edx, 0x10f
0x10052e5ab: mov ecx, 3
0x10052e5b0: call 0x1007e5f70 ; 0x1007e5f70
0x10052e5b5: ud2 
0x10052e5b7: nop word ptr [rax + rax]
