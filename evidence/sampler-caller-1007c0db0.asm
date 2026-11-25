0x1007c0db0: push rbp
0x1007c0db1: mov rbp, rsp
0x1007c0db4: push r15
0x1007c0db6: push r14
0x1007c0db8: push r12
0x1007c0dba: push rbx
0x1007c0dbb: sub rsp, 0x80
0x1007c0dc2: mov rax, qword ptr [rip + 0x44cb0f] ; 0x100c0d8d8
0x1007c0dc9: mov rax, qword ptr [rax]
0x1007c0dcc: mov qword ptr [rbp - 0x28], rax
0x1007c0dd0: movabs rax, 0x3e8fffffc18
0x1007c0dda: mov qword ptr [rbp - 0x80], rax
0x1007c0dde: mov dword ptr [rbp - 0x78], 1
0x1007c0de5: movabs rax, 0x200000002
0x1007c0def: mov qword ptr [rbp - 0x98], rax
0x1007c0df6: vxorps xmm0, xmm0, xmm0
0x1007c0dfa: vmovups xmmword ptr [rbp - 0x90], xmm0
0x1007c0e02: call 0x1007c1470 ; 0x1007c1470
0x1007c0e07: mov rcx, qword ptr [rax]
0x1007c0e0a: lea rsi, [rbp - 0x98]
0x1007c0e11: mov rdi, rax
0x1007c0e14: call qword ptr [rcx + 0x100]
0x1007c0e1a: mov dword ptr [rip + 0x18874f8], eax ; 0x102048318
0x1007c0e20: vmovaps ymm0, ymmword ptr [rip + 0x31ff78] ; 0x100ae0da0
0x1007c0e28: vmovups ymmword ptr [rbp - 0x70], ymm0
0x1007c0e2d: mov word ptr [rbp - 0x50], 1
0x1007c0e33: vzeroupper 
0x1007c0e36: call 0x1007c1470 ; 0x1007c1470
0x1007c0e3b: mov rcx, qword ptr [rax]
0x1007c0e3e: lea rsi, [rip + 0x3e351b] ; 0x100ba4360 Default2D
0x1007c0e45: lea rbx, [rbp - 0x70]
0x1007c0e49: mov rdi, rax
0x1007c0e4c: mov rdx, rbx
0x1007c0e4f: call qword ptr [rcx + 0x118]
0x1007c0e55: mov dword ptr [rip + 0x5524c5], eax ; 0x100d13320
0x1007c0e5b: mov dword ptr [rbp - 0x64], 0xd
0x1007c0e62: call 0x1007c1470 ; 0x1007c1470
0x1007c0e67: mov rcx, qword ptr [rax]
0x1007c0e6a: lea rsi, [rip + 0x3e34f9] ; 0x100ba436a Default2Dui
0x1007c0e71: mov rdi, rax
0x1007c0e74: mov rdx, rbx
0x1007c0e77: call qword ptr [rcx + 0x118]
0x1007c0e7d: mov dword ptr [rip + 0x5524a1], eax ; 0x100d13324
0x1007c0e83: mov dword ptr [rbp - 0x70], 2
0x1007c0e8a: mov dword ptr [rbp - 0x64], 6
0x1007c0e91: call 0x1007c1470 ; 0x1007c1470
0x1007c0e96: mov rcx, qword ptr [rax]
0x1007c0e99: lea rsi, [rip + 0x3e34d6] ; 0x100ba4376 Default3D
0x1007c0ea0: mov rdi, rax
0x1007c0ea3: mov rdx, rbx
0x1007c0ea6: call qword ptr [rcx + 0x118]
0x1007c0eac: mov dword ptr [rip + 0x552476], eax ; 0x100d13328
0x1007c0eb2: mov dword ptr [rbp - 0x70], 3
0x1007c0eb9: call 0x1007c1470 ; 0x1007c1470
0x1007c0ebe: mov rcx, qword ptr [rax]
0x1007c0ec1: lea rsi, [rip + 0x3e34b8] ; 0x100ba4380 DefaultCube
0x1007c0ec8: mov rdi, rax
0x1007c0ecb: mov rdx, rbx
0x1007c0ece: call qword ptr [rcx + 0x118]
0x1007c0ed4: mov dword ptr [rip + 0x552452], eax ; 0x100d1332c
0x1007c0eda: mov dword ptr [rbp - 0x4c], 0x1000000
0x1007c0ee1: mov dword ptr [rbp - 0x30], 0
0x1007c0ee8: mov qword ptr [rbp - 0x38], 0
0x1007c0ef0: mov eax, dword ptr [rip + 0x31fed2] ; 0x100ae0dc8
0x1007c0ef6: mov dword ptr [rbp - 0x40], eax
0x1007c0ef9: mov rax, qword ptr [rip + 0x31fec0] ; 0x100ae0dc0
0x1007c0f00: mov qword ptr [rbp - 0x48], rax
0x1007c0f04: call 0x1007c1470 ; 0x1007c1470
0x1007c0f09: mov rbx, qword ptr [rax]
0x1007c0f0c: mov esi, dword ptr [rip + 0x55240e] ; 0x100d13320
0x1007c0f12: lea r15, [rbp - 0x4c]
0x1007c0f16: lea r12, [rbp - 0x38]
0x1007c0f1a: lea r14, [rbp - 0x48]
0x1007c0f1e: mov edx, 0
0x1007c0f23: mov ecx, 0
0x1007c0f28: mov rdi, rax
0x1007c0f2b: mov r8, r12
0x1007c0f2e: mov r9, r14
0x1007c0f31: push 4
0x1007c0f33: push r15
0x1007c0f35: call qword ptr [rbx + 0x128]
0x1007c0f3b: add rsp, 0x10
0x1007c0f3f: call 0x1007c1470 ; 0x1007c1470
0x1007c0f44: mov rbx, qword ptr [rax]
0x1007c0f47: mov esi, dword ptr [rip + 0x5523d7] ; 0x100d13324
0x1007c0f4d: xor edx, edx
0x1007c0f4f: xor ecx, ecx
0x1007c0f51: mov rdi, rax
0x1007c0f54: mov r8, r12
0x1007c0f57: mov r9, r14
0x1007c0f5a: push 2
0x1007c0f5c: push r15
0x1007c0f5e: call qword ptr [rbx + 0x128]
0x1007c0f64: add rsp, 0x10
0x1007c0f68: call 0x1007c1470 ; 0x1007c1470
0x1007c0f6d: mov rbx, qword ptr [rax]
0x1007c0f70: mov esi, dword ptr [rip + 0x5523b2] ; 0x100d13328
0x1007c0f76: xor edx, edx
0x1007c0f78: xor ecx, ecx
0x1007c0f7a: mov rdi, rax
0x1007c0f7d: mov r8, r12
0x1007c0f80: mov r9, r14
0x1007c0f83: push 4
0x1007c0f85: push r15
0x1007c0f87: call qword ptr [rbx + 0x128]
0x1007c0f8d: add rsp, 0x10
0x1007c0f91: call 0x1007c1470 ; 0x1007c1470
0x1007c0f96: mov rbx, qword ptr [rax]
0x1007c0f99: mov esi, dword ptr [rip + 0x55238d] ; 0x100d1332c
0x1007c0f9f: xor edx, edx
0x1007c0fa1: xor ecx, ecx
0x1007c0fa3: mov rdi, rax
0x1007c0fa6: mov r8, r12
0x1007c0fa9: mov r9, r14
0x1007c0fac: push 4
0x1007c0fae: push r15
0x1007c0fb0: call qword ptr [rbx + 0x128]
0x1007c0fb6: add rsp, 0x10
0x1007c0fba: call 0x1007c1470 ; 0x1007c1470
0x1007c0fbf: mov rbx, qword ptr [rax]
0x1007c0fc2: mov esi, dword ptr [rip + 0x552364] ; 0x100d1332c
0x1007c0fc8: mov edx, 1
0x1007c0fcd: mov ecx, 0
0x1007c0fd2: mov rdi, rax
0x1007c0fd5: mov r8, r12
0x1007c0fd8: mov r9, r14
0x1007c0fdb: push 4
0x1007c0fdd: push r15
0x1007c0fdf: call qword ptr [rbx + 0x128]
0x1007c0fe5: add rsp, 0x10
0x1007c0fe9: call 0x1007c1470 ; 0x1007c1470
0x1007c0fee: mov rbx, qword ptr [rax]
0x1007c0ff1: mov esi, dword ptr [rip + 0x552335] ; 0x100d1332c
0x1007c0ff7: mov edx, 2
0x1007c0ffc: mov ecx, 0
0x1007c1001: mov rdi, rax
0x1007c1004: mov r8, r12
0x1007c1007: mov r9, r14
0x1007c100a: push 4
0x1007c100c: push r15
0x1007c100e: call qword ptr [rbx + 0x128]
0x1007c1014: add rsp, 0x10
0x1007c1018: call 0x1007c1470 ; 0x1007c1470
0x1007c101d: mov rbx, qword ptr [rax]
0x1007c1020: mov esi, dword ptr [rip + 0x552306] ; 0x100d1332c
0x1007c1026: mov edx, 3
0x1007c102b: mov ecx, 0
0x1007c1030: mov rdi, rax
0x1007c1033: mov r8, r12
0x1007c1036: mov r9, r14
0x1007c1039: push 4
0x1007c103b: push r15
0x1007c103d: call qword ptr [rbx + 0x128]
0x1007c1043: add rsp, 0x10
0x1007c1047: call 0x1007c1470 ; 0x1007c1470
0x1007c104c: mov rbx, qword ptr [rax]
0x1007c104f: mov esi, dword ptr [rip + 0x5522d7] ; 0x100d1332c
0x1007c1055: mov edx, 4
0x1007c105a: mov ecx, 0
0x1007c105f: mov rdi, rax
0x1007c1062: mov r8, r12
0x1007c1065: mov r9, r14
0x1007c1068: push 4
0x1007c106a: push r15
0x1007c106c: call qword ptr [rbx + 0x128]
0x1007c1072: add rsp, 0x10
0x1007c1076: call 0x1007c1470 ; 0x1007c1470
0x1007c107b: mov rbx, qword ptr [rax]
0x1007c107e: mov esi, dword ptr [rip + 0x5522a8] ; 0x100d1332c
0x1007c1084: mov edx, 5
0x1007c1089: mov ecx, 0
0x1007c108e: mov rdi, rax
0x1007c1091: mov r8, r12
0x1007c1094: mov r9, r14
0x1007c1097: push 4
0x1007c1099: push r15
0x1007c109b: call qword ptr [rbx + 0x128]
0x1007c10a1: add rsp, 0x10
0x1007c10a5: mov rax, qword ptr [rip + 0x44c82c] ; 0x100c0d8d8
0x1007c10ac: mov rax, qword ptr [rax]
0x1007c10af: cmp rax, qword ptr [rbp - 0x28]
0x1007c10b3: jne 0x1007c10c5
0x1007c10b5: add rsp, 0x80
0x1007c10bc: pop rbx
0x1007c10bd: pop r12
0x1007c10bf: pop r14
0x1007c10c1: pop r15
0x1007c10c3: pop rbp
0x1007c10c4: ret 
0x1007c10c5: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007c10ca: nop word ptr [rax + rax]
