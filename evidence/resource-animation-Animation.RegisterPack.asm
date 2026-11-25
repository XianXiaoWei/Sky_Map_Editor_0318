0x100094430: push rbp
0x100094431: mov rbp, rsp
0x100094434: push rbx
0x100094435: push rax
0x100094436: mov rbx, rsi
0x100094439: mov r10d, dword ptr [rbx + 0x54]
0x10009443d: test r10d, r10d
0x100094440: jle 0x1000944b7
0x100094442: cmp dword ptr [rbx + 0x48], 0
0x100094446: jle 0x1000944d6
0x10009444c: movsxd rax, dword ptr [rdi + 0x6220]
0x100094453: cmp rax, 0x40
0x100094457: jge 0x1000944f5
0x10009445d: test eax, eax
0x10009445f: jle 0x100094488
0x100094461: mov rcx, qword ptr [rdi + 0x6018]
0x100094468: mov r11d, dword ptr [rcx + 0x54]
0x10009446c: cmp r10d, r11d
0x10009446f: jne 0x100094514
0x100094475: mov qword ptr [rdi + rax*8 + 0x6020], rbx
0x10009447d: lea eax, [rax + 1]
0x100094480: mov dword ptr [rdi + 0x6220], eax
0x100094486: jmp 0x1000944a9 ; 0x1000944a9
0x100094488: mov qword ptr [rdi + rax*8 + 0x6020], rbx
0x100094490: lea ecx, [rax + 1]
0x100094493: mov dword ptr [rdi + 0x6220], ecx
0x100094499: test eax, eax
0x10009449b: jne 0x1000944a9
0x10009449d: mov rsi, qword ptr [rbx + 0x60]
0x1000944a1: mov edx, r10d
0x1000944a4: call 0x100094900 ; 0x100094900
0x1000944a9: mov rdi, rbx
0x1000944ac: add rsp, 8
0x1000944b0: pop rbx
0x1000944b1: pop rbp
0x1000944b2: jmp 0x1000e74c0 ; 0x1000e74c0
0x1000944b7: lea rdi, [rip + 0xad1403] ; 0x100b658c1 _data->boneCount > 0
0x1000944be: lea rsi, [rip + 0xad112f] ; 0x100b655f4 AnimationInstance.cpp
0x1000944c5: mov edx, 0x12f
0x1000944ca: mov ecx, 3
0x1000944cf: call 0x1007e5f70 ; 0x1007e5f70
0x1000944d4: ud2 
0x1000944d6: lea rdi, [rip + 0xad13f9] ; 0x100b658d6 _data->frameCount > 0
0x1000944dd: lea rsi, [rip + 0xad1110] ; 0x100b655f4 AnimationInstance.cpp
0x1000944e4: mov edx, 0x130
0x1000944e9: mov ecx, 3
0x1000944ee: call 0x1007e5f70 ; 0x1007e5f70
0x1000944f3: ud2 
0x1000944f5: lea rdi, [rip + 0xad13f0] ; 0x100b658ec m_animPackCount < kMaxAnimPackCount
0x1000944fc: lea rsi, [rip + 0xad10f1] ; 0x100b655f4 AnimationInstance.cpp
0x100094503: mov edx, 0x131
0x100094508: mov ecx, 3
0x10009450d: call 0x1007e5f70 ; 0x1007e5f70
0x100094512: ud2 
0x100094514: lea rdi, [rip + 0xad13f5] ; 0x100b65910 _data->boneCount == m_baseSkeleton->boneCount
0x10009451b: lea rsi, [rip + 0xad10d2] ; 0x100b655f4 AnimationInstance.cpp
0x100094522: lea r8, [rip + 0xad1415] ; 0x100b6593e Mismatch : %s bones %d != %d skeleton bones
0x100094529: mov edx, 0x135
0x10009452e: mov ecx, 4
0x100094533: xor eax, eax
0x100094535: mov r9, rbx
0x100094538: push r11
0x10009453a: push r10
0x10009453c: call 0x1007e6030 ; 0x1007e6030
0x100094541: add rsp, 0x10
0x100094545: ud2 
0x100094547: nop word ptr [rax + rax]
