0x1001e2ac0: push rbp
0x1001e2ac1: mov rbp, rsp
0x1001e2ac4: cmp dl, 5
0x1001e2ac7: jae 0x1001e2b31
0x1001e2ac9: movzx eax, dl
0x1001e2acc: mov rax, qword ptr [rsi + rax*8 + 0x118]
0x1001e2ad4: mov rax, qword ptr [rax + 0x10]
0x1001e2ad8: test rax, rax
0x1001e2adb: je 0x1001e2b50
0x1001e2add: vxorps xmm0, xmm0, xmm0
0x1001e2ae1: vmovups xmmword ptr [rdi], xmm0
0x1001e2ae5: mov qword ptr [rdi + 0x10], 0
0x1001e2aed: lea rcx, [rax + 0xe8]
0x1001e2af4: cmp qword ptr [rax + 0xe8], 0
0x1001e2afc: je 0x1001e2b15
0x1001e2afe: mov rdx, qword ptr [rax + 0xf0]
0x1001e2b05: add rax, 0xf0
0x1001e2b0b: mov qword ptr [rdx + 8], rdi
0x1001e2b0f: mov qword ptr [rdi + 0x10], rdx
0x1001e2b13: jmp 0x1001e2b22 ; 0x1001e2b22
0x1001e2b15: mov qword ptr [rax + 0xe8], rdi
0x1001e2b1c: add rax, 0xf0
0x1001e2b22: mov qword ptr [rax], rdi
0x1001e2b25: mov qword ptr [rdi], rcx
0x1001e2b28: mov qword ptr [rdi + 0x18], rsi
0x1001e2b2c: mov rax, rdi
0x1001e2b2f: pop rbp
0x1001e2b30: ret 
0x1001e2b31: lea rdi, [rip + 0x9967bd] ; 0x100b792f5 type < kCameraType_NumTypes - 1
0x1001e2b38: lea rsi, [rip + 0x996518] ; 0x100b79057 CameraSystem.cpp
0x1001e2b3f: mov edx, 0x321
0x1001e2b44: mov ecx, 3
0x1001e2b49: call 0x1007e5f70 ; 0x1007e5f70
0x1001e2b4e: ud2 
0x1001e2b50: lea rdi, [rip + 0x9967be] ; 0x100b79315 camera
0x1001e2b57: lea rsi, [rip + 0x9964f9] ; 0x100b79057 CameraSystem.cpp
0x1001e2b5e: mov edx, 0x323
0x1001e2b63: mov ecx, 3
0x1001e2b68: call 0x1007e5f70 ; 0x1007e5f70
0x1001e2b6d: ud2 
0x1001e2b6f: nop 
