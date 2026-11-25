0x10055cc60: push rbp
0x10055cc61: mov rbp, rsp
0x10055cc64: push r15
0x10055cc66: push r14
0x10055cc68: push r12
0x10055cc6a: push rbx
0x10055cc6b: mov rbx, rdi
0x10055cc6e: cmp dword ptr [rbx + 0x28], 1
0x10055cc72: jbe 0x10055cf05
0x10055cc78: mov rsi, qword ptr [rbx + 0x90]
0x10055cc7f: test rsi, rsi
0x10055cc82: je 0x10055cc9b
0x10055cc84: mov rdi, qword ptr [rbx + 0xf0]
0x10055cc8b: call 0x100795a70 ; 0x100795a70
0x10055cc90: mov qword ptr [rbx + 0x90], 0
0x10055cc9b: mov rsi, qword ptr [rbx + 0x98]
0x10055cca2: test rsi, rsi
0x10055cca5: je 0x10055ccbe
0x10055cca7: mov rdi, qword ptr [rbx + 0xf0]
0x10055ccae: call 0x100795a70 ; 0x100795a70
0x10055ccb3: mov qword ptr [rbx + 0x98], 0
0x10055ccbe: mov rsi, qword ptr [rbx + 0xa8]
0x10055ccc5: test rsi, rsi
0x10055ccc8: je 0x10055cce1
0x10055ccca: mov rdi, qword ptr [rbx + 0xf0]
0x10055ccd1: call 0x100795a70 ; 0x100795a70
0x10055ccd6: mov qword ptr [rbx + 0xa8], 0
0x10055cce1: mov rsi, qword ptr [rbx + 0xb0]
0x10055cce8: test rsi, rsi
0x10055cceb: je 0x10055cd04
0x10055cced: mov rdi, qword ptr [rbx + 0xf0]
0x10055ccf4: call 0x100795a70 ; 0x100795a70
0x10055ccf9: mov qword ptr [rbx + 0xb0], 0
0x10055cd04: mov rsi, qword ptr [rbx + 0xa0]
0x10055cd0b: test rsi, rsi
0x10055cd0e: je 0x10055cd27
0x10055cd10: mov rdi, qword ptr [rbx + 0xf0]
0x10055cd17: call 0x100795a70 ; 0x100795a70
0x10055cd1c: mov qword ptr [rbx + 0xa0], 0
0x10055cd27: mov rsi, qword ptr [rbx + 0xb8]
0x10055cd2e: test rsi, rsi
0x10055cd31: je 0x10055cd4a
0x10055cd33: mov rdi, qword ptr [rbx + 0xf0]
0x10055cd3a: call 0x100795a70 ; 0x100795a70
0x10055cd3f: mov qword ptr [rbx + 0xb8], 0
0x10055cd4a: mov rsi, qword ptr [rbx + 8]
0x10055cd4e: test rsi, rsi
0x10055cd51: je 0x10055cd67
0x10055cd53: mov rdi, qword ptr [rbx + 0xf0]
0x10055cd5a: call 0x100795a70 ; 0x100795a70
0x10055cd5f: mov qword ptr [rbx + 8], 0
0x10055cd67: mov rdi, qword ptr [rbx + 0xf0]
0x10055cd6e: mov esi, dword ptr [rbx + 0x28]
0x10055cd71: shl rsi, 4
0x10055cd75: mov rdx, qword ptr [rip + 0x1ac0564] ; 0x10201d2e0
0x10055cd7c: mov ecx, 0x10
0x10055cd81: call 0x100795530 ; 0x100795530
0x10055cd86: mov qword ptr [rbx + 0x90], rax
0x10055cd8d: cmp byte ptr [rbx + 0x40], 0
0x10055cd91: je 0x10055cdca
0x10055cd93: mov rdi, qword ptr [rbx + 0xf0]
0x10055cd9a: mov esi, dword ptr [rbx + 0x28]
0x10055cd9d: shl rsi, 4
0x10055cda1: mov rdx, qword ptr [rip + 0x1ac0538] ; 0x10201d2e0
0x10055cda8: mov ecx, 0x10
0x10055cdad: call 0x100795530 ; 0x100795530
0x10055cdb2: mov qword ptr [rbx + 0x98], rax
0x10055cdb9: mov esi, dword ptr [rbx + 0x28]
0x10055cdbc: shl rsi, 4
0x10055cdc0: mov rdi, rax
0x10055cdc3: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10055cdc8: jmp 0x10055cdd5 ; 0x10055cdd5
0x10055cdca: mov qword ptr [rbx + 0x98], 0
0x10055cdd5: mov rdi, qword ptr [rbx + 0xf0]
0x10055cddc: mov esi, dword ptr [rbx + 0x28]
0x10055cddf: shl rsi, 2
0x10055cde3: mov rdx, qword ptr [rip + 0x1ac04f6] ; 0x10201d2e0
0x10055cdea: mov ecx, 0x10
0x10055cdef: call 0x100795530 ; 0x100795530
0x10055cdf4: mov qword ptr [rbx + 0xa8], rax
0x10055cdfb: mov rdi, qword ptr [rbx + 0xf0]
0x10055ce02: mov esi, dword ptr [rbx + 0x28]
0x10055ce05: shl rsi, 2
0x10055ce09: mov rdx, qword ptr [rip + 0x1ac04d0] ; 0x10201d2e0
0x10055ce10: mov ecx, 0x10
0x10055ce15: call 0x100795530 ; 0x100795530
0x10055ce1a: mov qword ptr [rbx + 0xa0], rax
0x10055ce21: mov rdi, qword ptr [rbx + 0xf0]
0x10055ce28: mov esi, dword ptr [rbx + 0x28]
0x10055ce2b: shl rsi, 2
0x10055ce2f: mov rdx, qword ptr [rip + 0x1ac04aa] ; 0x10201d2e0
0x10055ce36: mov ecx, 0x10
0x10055ce3b: call 0x100795530 ; 0x100795530
0x10055ce40: mov qword ptr [rbx + 0xb0], rax
0x10055ce47: mov rdi, qword ptr [rbx + 0xf0]
0x10055ce4e: mov esi, dword ptr [rbx + 0x28]
0x10055ce51: shl rsi, 2
0x10055ce55: mov rdx, qword ptr [rip + 0x1ac0484] ; 0x10201d2e0
0x10055ce5c: mov ecx, 0x10
0x10055ce61: call 0x100795530 ; 0x100795530
0x10055ce66: mov qword ptr [rbx + 0xb8], rax
0x10055ce6d: mov r14d, dword ptr [rbx + 0x28]
0x10055ce71: test r14, r14
0x10055ce74: je 0x10055ceca
0x10055ce76: mov rdi, qword ptr [rbx + 0xa0]
0x10055ce7d: lea r15, [r14*4]
0x10055ce85: lea r12, [rip + 0x54a7d4] ; 0x100aa7660
0x10055ce8c: mov rsi, r12
0x10055ce8f: mov rdx, r15
0x10055ce92: call 0x100aa2906 ; 0x100aa2906 _memset_pattern16
0x10055ce97: mov rdi, qword ptr [rbx + 0xa8]
0x10055ce9e: mov rsi, r12
0x10055cea1: mov rdx, r15
0x10055cea4: call 0x100aa2906 ; 0x100aa2906 _memset_pattern16
0x10055cea9: mov rdi, qword ptr [rbx + 0xb0]
0x10055ceb0: mov rsi, r12
0x10055ceb3: mov rdx, r15
0x10055ceb6: call 0x100aa2906 ; 0x100aa2906 _memset_pattern16
0x10055cebb: mov rdi, qword ptr [rbx + 0xb8]
0x10055cec2: mov rsi, r15
0x10055cec5: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10055ceca: shl r14d, 4
0x10055cece: mov dword ptr [rbx + 0x14], r14d
0x10055ced2: mov rdi, qword ptr [rbx + 0xf0]
0x10055ced9: shl r14, 3
0x10055cedd: mov rdx, qword ptr [rip + 0x1ac03fc] ; 0x10201d2e0
0x10055cee4: mov ecx, 0x10
0x10055cee9: mov rsi, r14
0x10055ceec: call 0x100795530 ; 0x100795530
0x10055cef1: mov qword ptr [rbx + 8], rax
0x10055cef5: mov rdi, rbx
0x10055cef8: pop rbx
0x10055cef9: pop r12
0x10055cefb: pop r14
0x10055cefd: pop r15
0x10055ceff: pop rbp
0x10055cf00: jmp 0x10055cf30 ; 0x10055cf30
0x10055cf05: lea rdi, [rip + 0x634853] ; 0x100b9175f numPoints >= 2
0x10055cf0c: lea rsi, [rip + 0x634819] ; 0x100b9172c Rail.cpp
0x10055cf13: lea r8, [rip + 0x634854] ; 0x100b9176e Rails must have atleast 2 points
0x10055cf1a: mov edx, 0xee
0x10055cf1f: mov ecx, 4
0x10055cf24: xor eax, eax
0x10055cf26: call 0x1007e6030 ; 0x1007e6030
0x10055cf2b: ud2 
0x10055cf2d: nop dword ptr [rax]
