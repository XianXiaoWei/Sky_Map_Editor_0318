0x1007693f0: push rbp
0x1007693f1: mov rbp, rsp
0x1007693f4: push r14
0x1007693f6: push rbx
0x1007693f7: mov r9, qword ptr [rdi + 8]
0x1007693fb: test r9, r9
0x1007693fe: je 0x1007694af
0x100769404: xor eax, eax
0x100769406: cmp byte ptr [rdi], 0
0x100769409: je 0x1007694aa
0x10076940f: lea ecx, [rsi - 1]
0x100769412: cmp ecx, 0x20
0x100769415: jb 0x100769429
0x100769417: cmp byte ptr [rdi + 0x24], 1
0x10076941b: je 0x1007694ce
0x100769421: mov byte ptr [rdi], 0
0x100769424: jmp 0x1007694aa ; 0x1007694aa
0x100769429: mov r10, qword ptr [rdi + 0x18]
0x10076942d: mov eax, dword ptr [rdi + 0x10]
0x100769430: add r9, rax
0x100769433: xor r8d, r8d
0x100769436: mov r11d, esi
0x100769439: xor eax, eax
0x10076943b: nop dword ptr [rax + rax]
0x100769440: cmp r10, r9
0x100769443: jae 0x10076949f
0x100769445: mov edx, dword ptr [rdi + 0x20]
0x100769448: mov ebx, 8
0x10076944d: sub ebx, edx
0x10076944f: cmp ebx, r11d
0x100769452: cmovg ebx, r11d
0x100769456: movzx r14d, byte ptr [r10]
0x10076945a: mov ecx, edx
0x10076945c: shr r14d, cl
0x10076945f: mov ecx, r8d
0x100769462: shl r14d, cl
0x100769465: sub r11d, ebx
0x100769468: add edx, ebx
0x10076946a: mov dword ptr [rdi + 0x20], edx
0x10076946d: cmp edx, 8
0x100769470: jb 0x100769480
0x100769472: mov dword ptr [rdi + 0x20], 0
0x100769479: inc r10
0x10076947c: mov qword ptr [rdi + 0x18], r10
0x100769480: or eax, r14d
0x100769483: add r8d, ebx
0x100769486: test r11d, r11d
0x100769489: jg 0x100769440
0x10076948b: cmp esi, 0x1f
0x10076948e: ja 0x1007694aa
0x100769490: mov edx, 1
0x100769495: mov ecx, esi
0x100769497: shl edx, cl
0x100769499: dec edx
0x10076949b: and eax, edx
0x10076949d: jmp 0x1007694aa ; 0x1007694aa
0x10076949f: cmp byte ptr [rdi + 0x24], 1
0x1007694a3: je 0x1007694ea
0x1007694a5: mov byte ptr [rdi], 0
0x1007694a8: xor eax, eax
0x1007694aa: pop rbx
0x1007694ab: pop r14
0x1007694ad: pop rbp
0x1007694ae: ret 
0x1007694af: lea rdi, [rip + 0x434b02] ; 0x100b9dfb8 m_buffer
0x1007694b6: lea rsi, [rip + 0x434b04] ; 0x100b9dfc1 BinaryStream.cpp
0x1007694bd: mov edx, 0x59
0x1007694c2: mov ecx, 3
0x1007694c7: call 0x1007e5f70 ; 0x1007e5f70
0x1007694cc: ud2 
0x1007694ce: lea rdi, [rip + 0x434afd] ; 0x100b9dfd2 !m_assert
0x1007694d5: lea rsi, [rip + 0x434ae5] ; 0x100b9dfc1 BinaryStream.cpp
0x1007694dc: lea r8, [rip + 0x434b2e] ; 0x100b9e011 Invalid bit read count
0x1007694e3: mov edx, 0x5e
0x1007694e8: jmp 0x100769504 ; 0x100769504
0x1007694ea: lea rdi, [rip + 0x434ae1] ; 0x100b9dfd2 !m_assert
0x1007694f1: lea rsi, [rip + 0x434ac9] ; 0x100b9dfc1 BinaryStream.cpp
0x1007694f8: lea r8, [rip + 0x434b29] ; 0x100b9e028 Read past end of bit stream
0x1007694ff: mov edx, 0x6a
0x100769504: mov ecx, 4
0x100769509: xor eax, eax
0x10076950b: call 0x1007e6030 ; 0x1007e6030
0x100769510: ud2 
0x100769512: nop word ptr cs:[rax + rax]
