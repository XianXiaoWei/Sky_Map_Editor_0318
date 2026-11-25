0x10043d7a0: push rbp
0x10043d7a1: mov rbp, rsp
0x10043d7a4: push r14
0x10043d7a6: push rbx
0x10043d7a7: mov r14, rdi
0x10043d7aa: test rsi, rsi
0x10043d7ad: je 0x10043d813
0x10043d7af: mov r8, qword ptr [r14 + 0x28]
0x10043d7b3: sub rsi, r8
0x10043d7b6: cmp rsi, -0x50
0x10043d7ba: jle 0x10043d818
0x10043d7bc: sar rsi, 4
0x10043d7c0: movabs rcx, 0xcccccccccccccccd
0x10043d7ca: imul rcx, rsi
0x10043d7ce: cmp dword ptr [r14 + 0x10], ecx
0x10043d7d2: jbe 0x10043d834
0x10043d7d4: mov edx, 1
0x10043d7d9: shl edx, cl
0x10043d7db: mov ebx, ecx
0x10043d7dd: and bl, 0x1f
0x10043d7e0: mov rsi, qword ptr [r14 + 0x20]
0x10043d7e4: mov edi, ecx
0x10043d7e6: shr edi, 5
0x10043d7e9: mov eax, dword ptr [rsi + rdi*4]
0x10043d7ec: movzx ebx, bl
0x10043d7ef: bt eax, ebx
0x10043d7f2: jae 0x10043d813
0x10043d7f4: not edx
0x10043d7f6: and eax, edx
0x10043d7f8: mov dword ptr [rsi + rdi*4], eax
0x10043d7fb: mov eax, ecx
0x10043d7fd: lea rax, [rax + rax*4]
0x10043d801: shl rax, 4
0x10043d805: lea rdi, [r8 + rax]
0x10043d809: mov rax, qword ptr [r8 + rax]
0x10043d80d: call qword ptr [rax]
0x10043d80f: dec dword ptr [r14 + 0x18]
0x10043d813: pop rbx
0x10043d814: pop r14
0x10043d816: pop rbp
0x10043d817: ret 
0x10043d818: lea rdi, [rip + 0x7440ab] ; 0x100b818ca idx >= 0
0x10043d81f: lea rsi, [rip + 0x736753] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10043d826: lea r8, [rip + 0x73676c] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x10043d82d: mov edx, 0x41
0x10043d832: jmp 0x10043d84e ; 0x10043d84e
0x10043d834: lea rdi, [rip + 0x73672e] ; 0x100b73f69 idx < kCapacity
0x10043d83b: lea rsi, [rip + 0x736737] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10043d842: lea r8, [rip + 0x736750] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x10043d849: mov edx, 0x39
0x10043d84e: mov ecx, 4
0x10043d853: xor eax, eax
0x10043d855: call 0x1007e6030 ; 0x1007e6030
0x10043d85a: ud2 
0x10043d85c: nop dword ptr [rax]
