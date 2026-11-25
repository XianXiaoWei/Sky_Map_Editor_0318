0x1007f05e0: push rbp
0x1007f05e1: mov rbp, rsp
0x1007f05e4: push r14
0x1007f05e6: push rbx
0x1007f05e7: sub rsp, 0x30
0x1007f05eb: mov rbx, rdi
0x1007f05ee: cmp dword ptr [rbx], -1
0x1007f05f1: jne 0x1007f06cb
0x1007f05f7: lea rdi, [rbx + 0x50]
0x1007f05fb: mov edx, 0x1b
0x1007f0600: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1007f0605: movabs rax, 0x400000004
0x1007f060f: mov qword ptr [rbx + 0x10], rax
0x1007f0613: mov dword ptr [rbx + 0x18], 1
0x1007f061a: mov byte ptr [rbx + 0x2c], 1
0x1007f061e: cmp byte ptr [rip + 0x1858e33], 0 ; 0x102049458
0x1007f0625: jne 0x1007f068f
0x1007f0627: mov byte ptr [rip + 0x1858e2a], 1 ; 0x102049458
0x1007f062e: movabs rax, 0x3e8fffffc18
0x1007f0638: mov qword ptr [rbp - 0x20], rax
0x1007f063c: mov dword ptr [rbp - 0x18], 1
0x1007f0643: movabs rax, 0x200000002
0x1007f064d: mov qword ptr [rbp - 0x38], rax
0x1007f0651: vxorps xmm0, xmm0, xmm0
0x1007f0655: vmovups xmmword ptr [rbp - 0x30], xmm0
0x1007f065a: mov r14, qword ptr [rip + 0x1858e37] ; 0x102049498
0x1007f0661: vmovups ymm0, ymmword ptr [rbp - 0x38]
0x1007f0666: vmovups ymmword ptr [r14], ymm0
0x1007f066b: mov dword ptr [r14 + 0x20], 1
0x1007f0673: vzeroupper 
0x1007f0676: call 0x1007c1470 ; 0x1007c1470
0x1007f067b: mov rcx, qword ptr [rax]
0x1007f067e: lea rsi, [rbp - 0x38]
0x1007f0682: mov rdi, rax
0x1007f0685: call qword ptr [rcx + 0x100]
0x1007f068b: mov dword ptr [r14 + 0x24], eax
0x1007f068f: mov rax, qword ptr [rip + 0x1858e02] ; 0x102049498
0x1007f0696: mov qword ptr [rbx + 8], rax
0x1007f069a: mov byte ptr [rbx + 0x2e], 1
0x1007f069e: vmovaps xmm0, xmmword ptr [rip + 0x2f324a] ; 0x100ae38f0
0x1007f06a6: vmovups xmmword ptr [rbx + 0x1c], xmm0
0x1007f06ab: mov byte ptr [rbx + 0x2c], 1
0x1007f06af: call 0x1007c1470 ; 0x1007c1470
0x1007f06b4: mov rcx, qword ptr [rax]
0x1007f06b7: mov rdi, rax
0x1007f06ba: call qword ptr [rcx + 0x110]
0x1007f06c0: mov dword ptr [rbx], eax
0x1007f06c2: add rsp, 0x30
0x1007f06c6: pop rbx
0x1007f06c7: pop r14
0x1007f06c9: pop rbp
0x1007f06ca: ret 
0x1007f06cb: lea rdi, [rip + 0x3b0a92] ; 0x100ba1164 !IsInitialized()
0x1007f06d2: lea rsi, [rip + 0x3b6f01] ; 0x100ba75da Texture.cpp
0x1007f06d9: mov edx, 0x4c
0x1007f06de: mov ecx, 3
0x1007f06e3: call 0x1007e5f70 ; 0x1007e5f70
0x1007f06e8: ud2 
0x1007f06ea: nop word ptr [rax + rax]
