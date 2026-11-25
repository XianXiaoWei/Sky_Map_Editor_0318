0x10032ecf0: push rbp
0x10032ecf1: mov rbp, rsp
0x10032ecf4: push r15
0x10032ecf6: push r14
0x10032ecf8: push r13
0x10032ecfa: push r12
0x10032ecfc: push rbx
0x10032ecfd: sub rsp, 0x28
0x10032ed01: mov rbx, rsi
0x10032ed04: mov r12, rdi
0x10032ed07: call 0x100039f40 ; 0x100039f40
0x10032ed0c: mov r15, rax
0x10032ed0f: mov dword ptr [r15 + 0x28], 1
0x10032ed17: movzx eax, word ptr [r12 + 0xc]
0x10032ed1d: cmp eax, 0xffff
0x10032ed22: je 0x10032ee2e
0x10032ed28: lea ecx, [rax + 1]
0x10032ed2b: mov word ptr [r12 + 0xc], cx
0x10032ed31: mov word ptr [r15 + 0x2c], ax
0x10032ed36: mov qword ptr [rbp - 0x38], rbx
0x10032ed3a: mov eax, dword ptr [rbx + 0x38]
0x10032ed3d: lea rsi, [r12 + 0x20]
0x10032ed42: mov rcx, qword ptr [r12 + 0x20]
0x10032ed47: test rcx, rcx
0x10032ed4a: je 0x10032ed75
0x10032ed4c: mov rbx, rsi
0x10032ed4f: nop 
0x10032ed50: lea rdx, [rcx + 8]
0x10032ed54: cmp dword ptr [rcx + 0x1c], eax
0x10032ed57: cmovae rdx, rcx
0x10032ed5b: cmovae rbx, rcx
0x10032ed5f: mov rcx, qword ptr [rdx]
0x10032ed62: test rcx, rcx
0x10032ed65: jne 0x10032ed50
0x10032ed67: cmp rbx, rsi
0x10032ed6a: je 0x10032ed75
0x10032ed6c: cmp eax, dword ptr [rbx + 0x1c]
0x10032ed6f: jae 0x10032edfb
0x10032ed75: lea r13, [r12 + 0x18]
0x10032ed7a: mov dword ptr [rbp - 0x30], eax
0x10032ed7d: mov byte ptr [rbp - 0x2c], 0
0x10032ed81: lea rdx, [rbp - 0x40]
0x10032ed85: lea rcx, [rbp - 0x48]
0x10032ed89: lea r8, [rbp - 0x30]
0x10032ed8d: mov rdi, r13
0x10032ed90: call 0x1003320e0 ; 0x1003320e0
0x10032ed95: mov r14, rax
0x10032ed98: mov rbx, qword ptr [r14]
0x10032ed9b: test rbx, rbx
0x10032ed9e: jne 0x10032edfb
0x10032eda0: call 0x1007e50d0 ; 0x1007e50d0
0x10032eda5: mov esi, 0x28
0x10032edaa: mov rdi, rax
0x10032edad: call 0x1007e5790 ; 0x1007e5790
0x10032edb2: mov rbx, rax
0x10032edb5: mov eax, dword ptr [rbp - 0x30]
0x10032edb8: mov dword ptr [rbx + 0x1c], eax
0x10032edbb: mov al, byte ptr [rbp - 0x2c]
0x10032edbe: mov byte ptr [rbx + 0x20], al
0x10032edc1: mov rax, qword ptr [rbp - 0x40]
0x10032edc5: vxorps xmm0, xmm0, xmm0
0x10032edc9: vmovups xmmword ptr [rbx], xmm0
0x10032edcd: mov qword ptr [rbx + 0x10], rax
0x10032edd1: mov qword ptr [r14], rbx
0x10032edd4: mov rax, qword ptr [r13]
0x10032edd8: mov rax, qword ptr [rax]
0x10032eddb: test rax, rax
0x10032edde: je 0x10032ede9
0x10032ede0: mov qword ptr [r13], rax
0x10032ede4: mov rsi, qword ptr [r14]
0x10032ede7: jmp 0x10032edec ; 0x10032edec
0x10032ede9: mov rsi, rbx
0x10032edec: mov rdi, qword ptr [r12 + 0x20]
0x10032edf1: call 0x1001a7bb0 ; 0x1001a7bb0
0x10032edf6: inc qword ptr [r12 + 0x28]
0x10032edfb: movzx r14d, byte ptr [rbx + 0x20]
0x10032ee00: mov rax, qword ptr [r15]
0x10032ee03: mov rdi, r15
0x10032ee06: call qword ptr [rax + 0x60]
0x10032ee09: cmp eax, r14d
0x10032ee0c: jbe 0x10032ee56
0x10032ee0e: mov al, byte ptr [rbx + 0x20]
0x10032ee11: mov ecx, eax
0x10032ee13: inc cl
0x10032ee15: mov byte ptr [rbx + 0x20], cl
0x10032ee18: mov byte ptr [r15 + 0x2e], al
0x10032ee1c: mov rax, r15
0x10032ee1f: add rsp, 0x28
0x10032ee23: pop rbx
0x10032ee24: pop r12
0x10032ee26: pop r13
0x10032ee28: pop r14
0x10032ee2a: pop r15
0x10032ee2c: pop rbp
0x10032ee2d: ret 
0x10032ee2e: lea rdi, [rip + 0x852509] ; 0x100b8133e m_nextUniqueId < ( 1 << (sizeof( EventUniqueId ) * 8) ) - 1
0x10032ee35: lea rsi, [rip + 0x85230f] ; 0x100b8114b Event.cpp
0x10032ee3c: lea r8, [rip + 0x852537] ; 0x100b8137a Ran out of EventUniqueIds
0x10032ee43: mov edx, 0x1b5
0x10032ee48: mov ecx, 4
0x10032ee4d: xor eax, eax
0x10032ee4f: call 0x1007e6030 ; 0x1007e6030
0x10032ee54: ud2 
0x10032ee56: mov rax, qword ptr [rbp - 0x38]
0x10032ee5a: mov rbx, qword ptr [rax + 8]
0x10032ee5e: mov rax, qword ptr [r15]
0x10032ee61: mov rdi, r15
0x10032ee64: call qword ptr [rax + 0x60]
0x10032ee67: mov dword ptr [rsp], eax
0x10032ee6a: lea rdi, [rip + 0x852523] ; 0x100b81394 it->second < event->GetMaxTypeIdx()
0x10032ee71: lea rsi, [rip + 0x8522d3] ; 0x100b8114b Event.cpp
0x10032ee78: lea r8, [rip + 0x852539] ; 0x100b813b8 Ran out of EventTypeIdxs for %s, max is %d
0x10032ee7f: mov edx, 0x1be
0x10032ee84: mov ecx, 4
0x10032ee89: xor eax, eax
0x10032ee8b: mov r9, rbx
0x10032ee8e: call 0x1007e6030 ; 0x1007e6030
0x10032ee93: ud2 
0x10032ee95: nop word ptr cs:[rax + rax]
