0x10022b840: push rbp
0x10022b841: mov rbp, rsp
0x10022b844: push r14
0x10022b846: push rbx
0x10022b847: mov ebx, esi
0x10022b849: mov r14, rdi
0x10022b84c: mov rdi, qword ptr [r14 + 0x18]
0x10022b850: test rdi, rdi
0x10022b853: je 0x10022b8ab
0x10022b855: cmp dword ptr [r14 + 0x10], ebx
0x10022b859: je 0x10022b8a6
0x10022b85b: mov rsi, qword ptr [r14 + 8]
0x10022b85f: test rsi, rsi
0x10022b862: je 0x10022b869
0x10022b864: call 0x100795a70 ; 0x100795a70
0x10022b869: mov dword ptr [r14 + 0x10], ebx
0x10022b86d: test ebx, ebx
0x10022b86f: je 0x10022b899
0x10022b871: mov rdi, qword ptr [r14 + 0x18]
0x10022b875: mov esi, ebx
0x10022b877: shl rsi, 3
0x10022b87b: mov rdx, qword ptr [rip + 0x1bb77f6] ; 0x101de3078
0x10022b882: mov ecx, 0x10
0x10022b887: call 0x100795530 ; 0x100795530
0x10022b88c: mov rdi, rax
0x10022b88f: mov esi, dword ptr [r14 + 0x10]
0x10022b893: shl rsi, 3
0x10022b897: jmp 0x10022b89d ; 0x10022b89d
0x10022b899: xor esi, esi
0x10022b89b: xor edi, edi
0x10022b89d: mov qword ptr [r14 + 8], rdi
0x10022b8a1: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10022b8a6: pop rbx
0x10022b8a7: pop r14
0x10022b8a9: pop rbp
0x10022b8aa: ret 
0x10022b8ab: lea rdi, [rip + 0x94f3e5] ; 0x100b7ac97 m_heap
0x10022b8b2: lea rsi, [rip + 0x94f3e5] ; 0x100b7ac9e Clump.cpp
0x10022b8b9: mov edx, 0x22
0x10022b8be: mov ecx, 3
0x10022b8c3: call 0x1007e5f70 ; 0x1007e5f70
0x10022b8c8: ud2 
0x10022b8ca: nop word ptr [rax + rax]
