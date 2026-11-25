0x10076a0a0: push rbp
0x10076a0a1: mov rbp, rsp
0x10076a0a4: push r15
0x10076a0a6: push r14
0x10076a0a8: push rbx
0x10076a0a9: push rax
0x10076a0aa: cmp dword ptr [rdi], 1
0x10076a0ad: mov rcx, qword ptr [rdi + 0x10]
0x10076a0b1: jne 0x10076a0e4
0x10076a0b3: test rcx, rcx
0x10076a0b6: je 0x10076a1b0
0x10076a0bc: cmp byte ptr [rdi + 8], 0
0x10076a0c0: je 0x10076a1a5
0x10076a0c6: cmp dword ptr [rdi + 0x28], 0
0x10076a0ca: je 0x10076a115
0x10076a0cc: mov dword ptr [rdi + 0x28], 0
0x10076a0d3: lea r14, [rdi + 0x20]
0x10076a0d7: mov rax, qword ptr [rdi + 0x20]
0x10076a0db: inc rax
0x10076a0de: mov qword ptr [rdi + 0x20], rax
0x10076a0e2: jmp 0x10076a11d ; 0x10076a11d
0x10076a0e4: test rcx, rcx
0x10076a0e7: je 0x10076a1cf
0x10076a0ed: cmp byte ptr [rdi + 8], 0
0x10076a0f1: je 0x10076a1a5
0x10076a0f7: cmp dword ptr [rdi + 0x28], 0
0x10076a0fb: je 0x10076a16c
0x10076a0fd: mov dword ptr [rdi + 0x28], 0
0x10076a104: lea r14, [rdi + 0x20]
0x10076a108: mov rax, qword ptr [rdi + 0x20]
0x10076a10c: inc rax
0x10076a10f: mov qword ptr [rdi + 0x20], rax
0x10076a113: jmp 0x10076a174 ; 0x10076a174
0x10076a115: lea r14, [rdi + 0x20]
0x10076a119: mov rax, qword ptr [rdi + 0x20]
0x10076a11d: mov ebx, edx
0x10076a11f: lea r8, [rax + rbx]
0x10076a123: mov edx, dword ptr [rdi + 0x18]
0x10076a126: add rcx, rdx
0x10076a129: cmp r8, rcx
0x10076a12c: jbe 0x10076a15c
0x10076a12e: cmp byte ptr [rdi + 0x2c], 1
0x10076a132: jne 0x10076a18e
0x10076a134: lea rdi, [rip + 0x433e97] ; 0x100b9dfd2 !m_assert
0x10076a13b: lea rsi, [rip + 0x433e7f] ; 0x100b9dfc1 BinaryStream.cpp
0x10076a142: lea r8, [rip + 0x433eab] ; 0x100b9dff4 Write past end of bit stream
0x10076a149: mov edx, 0x91
0x10076a14e: mov ecx, 4
0x10076a153: xor eax, eax
0x10076a155: call 0x1007e6030 ; 0x1007e6030
0x10076a15a: ud2 
0x10076a15c: mov rdi, rax
0x10076a15f: mov rdx, rbx
0x10076a162: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10076a167: add qword ptr [r14], rbx
0x10076a16a: jmp 0x10076a1a5 ; 0x10076a1a5
0x10076a16c: lea r14, [rdi + 0x20]
0x10076a170: mov rax, qword ptr [rdi + 0x20]
0x10076a174: mov r15d, edx
0x10076a177: lea rbx, [rax + r15]
0x10076a17b: mov r8d, dword ptr [rdi + 0x18]
0x10076a17f: lea rdx, [rcx + r8]
0x10076a183: cmp rbx, rdx
0x10076a186: jbe 0x10076a194
0x10076a188: cmp byte ptr [rdi + 0x2c], 1
0x10076a18c: je 0x10076a1ee
0x10076a18e: mov byte ptr [rdi + 8], 0
0x10076a192: jmp 0x10076a1a5 ; 0x10076a1a5
0x10076a194: mov rdi, rsi
0x10076a197: mov rsi, rax
0x10076a19a: mov rdx, r15
0x10076a19d: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10076a1a2: add qword ptr [r14], r15
0x10076a1a5: add rsp, 8
0x10076a1a9: pop rbx
0x10076a1aa: pop r14
0x10076a1ac: pop r15
0x10076a1ae: pop rbp
0x10076a1af: ret 
0x10076a1b0: lea rdi, [rip + 0x433e01] ; 0x100b9dfb8 m_buffer
0x10076a1b7: lea rsi, [rip + 0x433e03] ; 0x100b9dfc1 BinaryStream.cpp
0x10076a1be: mov edx, 0x87
0x10076a1c3: mov ecx, 3
0x10076a1c8: call 0x1007e5f70 ; 0x1007e5f70
0x10076a1cd: ud2 
0x10076a1cf: lea rdi, [rip + 0x433de2] ; 0x100b9dfb8 m_buffer
0x10076a1d6: lea rsi, [rip + 0x433de4] ; 0x100b9dfc1 BinaryStream.cpp
0x10076a1dd: mov edx, 0xaa
0x10076a1e2: mov ecx, 3
0x10076a1e7: call 0x1007e5f70 ; 0x1007e5f70
0x10076a1ec: ud2 
0x10076a1ee: sub r15, rcx
0x10076a1f1: add r15, rax
0x10076a1f4: mov dword ptr [rsp], r8d
0x10076a1f8: lea rdi, [rip + 0x433dd3] ; 0x100b9dfd2 !m_assert
0x10076a1ff: lea rsi, [rip + 0x433dbb] ; 0x100b9dfc1 BinaryStream.cpp
0x10076a206: lea r8, [rip + 0x433e37] ; 0x100b9e044 Read past end of bit stream. next: %u size: %u
0x10076a20d: mov edx, 0xb4
0x10076a212: mov ecx, 4
0x10076a217: xor eax, eax
0x10076a219: mov r9, r15
0x10076a21c: call 0x1007e6030 ; 0x1007e6030
0x10076a221: ud2 
0x10076a223: nop word ptr cs:[rax + rax]
