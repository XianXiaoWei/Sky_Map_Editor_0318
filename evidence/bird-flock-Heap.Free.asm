0x100795a70: push rbp
0x100795a71: mov rbp, rsp
0x100795a74: push rbx
0x100795a75: push rax
0x100795a76: mov rbx, rdi
0x100795a79: test rsi, rsi
0x100795a7c: je 0x100795aec
0x100795a7e: mov rdi, qword ptr [rbx + 0x20]
0x100795a82: call 0x1007844b0 ; 0x1007844b0
0x100795a87: cmp byte ptr [rbx + 0x48], 0
0x100795a8b: je 0x100795aec
0x100795a8d: mov ecx, dword ptr [rbx + 0x4c]
0x100795a90: test ecx, ecx
0x100795a92: je 0x100795ab0
0x100795a94: mov rax, qword ptr [rbx + 0x50]
0x100795a98: xor edx, edx
0x100795a9a: nop word ptr [rax + rax]
0x100795aa0: cmp qword ptr [rax], 0
0x100795aa4: je 0x100795adf
0x100795aa6: inc edx
0x100795aa8: add rax, 0x10
0x100795aac: cmp edx, ecx
0x100795aae: jb 0x100795aa0
0x100795ab0: add rbx, 0x28
0x100795ab4: lea rdi, [rip + 0x40b73a] ; 0x100ba11f5 entry
0x100795abb: lea rsi, [rip + 0x40b694] ; 0x100ba1156 Heap.cpp
0x100795ac2: lea r8, [rip + 0x40b799] ; 0x100ba1262 Unable to find HeapDebugEntry during Free() for Heap "%s"
0x100795ac9: mov edx, 0xfe
0x100795ace: mov ecx, 4
0x100795ad3: xor eax, eax
0x100795ad5: mov r9, rbx
0x100795ad8: call 0x1007e6030 ; 0x1007e6030
0x100795add: ud2 
0x100795adf: test rax, rax
0x100795ae2: je 0x100795ab0
0x100795ae4: vxorps xmm0, xmm0, xmm0
0x100795ae8: vmovups xmmword ptr [rax], xmm0
0x100795aec: add rsp, 8
0x100795af0: pop rbx
0x100795af1: pop rbp
0x100795af2: ret 
0x100795af3: nop word ptr cs:[rax + rax]
