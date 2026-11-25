0x100779200: push rbp
0x100779201: mov rbp, rsp
0x100779204: push r14
0x100779206: push rbx
0x100779207: mov r14, rsi
0x10077920a: mov rbx, rdi
0x10077920d: mov rax, 0xfffffffffffe81cf
0x100779214: sub rax, rbx
0x100779217: add rax, r14
0x10077921a: cmp rax, 0x781df
0x100779220: jae 0x1007792ee
0x100779226: lea rdi, [rbx + 0x92038]
0x10077922d: lea rsi, [r14 + 0x198]
0x100779234: call 0x10077e4b0 ; 0x10077e4b0
0x100779239: mov rdi, qword ptr [rbx + 0x92020]
0x100779240: movzx edx, word ptr [r14 + 0x188]
0x100779248: mov rsi, r14
0x10077924b: call 0x10077b350 ; 0x10077b350
0x100779250: mov rdi, qword ptr [rbx + 0x92028]
0x100779257: movzx edx, word ptr [r14 + 0x18a]
0x10077925f: mov rsi, r14
0x100779262: call 0x10077b350 ; 0x10077b350
0x100779267: mov eax, dword ptr [rbx + 0x90018]
0x10077926d: test eax, eax
0x10077926f: je 0x100779294
0x100779271: xor ecx, ecx
0x100779273: nop word ptr cs:[rax + rax]
0x100779280: mov rdx, qword ptr [rbx + rcx*8 + 0x90020]
0x100779288: cmp rdx, r14
0x10077928b: je 0x1007792b3
0x10077928d: inc rcx
0x100779290: cmp ecx, eax
0x100779292: jb 0x100779280
0x100779294: lea rdi, [rip + 0x4254a4] ; 0x100b9e73f idx < m_instCount
0x10077929b: lea rsi, [rip + 0x4250ad] ; 0x100b9e34f CollisionGeo.cpp
0x1007792a2: mov edx, 0x9cf
0x1007792a7: mov ecx, 3
0x1007792ac: call 0x1007e5f70 ; 0x1007e5f70
0x1007792b1: ud2 
0x1007792b3: dec eax
0x1007792b5: mov dword ptr [rbx + 0x90018], eax
0x1007792bb: mov rsi, qword ptr [rbx + rax*8 + 0x90020]
0x1007792c3: mov qword ptr [rbx + rcx*8 + 0x90020], rsi
0x1007792cb: mov qword ptr [rbx + rax*8 + 0x90020], rdx
0x1007792d3: test r14, r14
0x1007792d6: je 0x1007792e9
0x1007792d8: mov rax, qword ptr [rbx + 0x90010]
0x1007792df: mov qword ptr [r14], rax
0x1007792e2: mov qword ptr [rbx + 0x90010], r14
0x1007792e9: pop rbx
0x1007792ea: pop r14
0x1007792ec: pop rbp
0x1007792ed: ret 
0x1007792ee: lea rdi, [rip + 0x425409] ; 0x100b9e6fe inst - m_geoInstPool >= 0 && inst - m_geoInstPool < kMaxGeoInsts
0x1007792f5: lea rsi, [rip + 0x425053] ; 0x100b9e34f CollisionGeo.cpp
0x1007792fc: mov edx, 0x9bf
0x100779301: mov ecx, 3
0x100779306: call 0x1007e5f70 ; 0x1007e5f70
0x10077930b: ud2 
0x10077930d: nop dword ptr [rax]
