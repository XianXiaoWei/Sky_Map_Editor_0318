0x1001adf50: mov r8, qword ptr [rsi + 0x420]
0x1001adf57: mov r9d, dword ptr [rdi + 0x14]
0x1001adf5b: lea rax, [r8 + 0x3d8]
0x1001adf62: xor ecx, ecx
0x1001adf64: mov edx, 3
0x1001adf69: nop dword ptr [rax]
0x1001adf70: cmp dword ptr [rax - 0x360], r9d
0x1001adf77: je 0x1001adfbd
0x1001adf79: cmp dword ptr [rax - 0x240], r9d
0x1001adf80: je 0x1001adfae
0x1001adf82: cmp dword ptr [rax - 0x120], r9d
0x1001adf89: je 0x1001adfb4
0x1001adf8b: cmp dword ptr [rax], r9d
0x1001adf8e: je 0x1001adfba
0x1001adf90: add rcx, 4
0x1001adf94: add rax, 0x480
0x1001adf9a: lea r10, [rdx + 4]
0x1001adf9e: inc rdx
0x1001adfa1: cmp rdx, 0x100
0x1001adfa8: mov rdx, r10
0x1001adfab: jb 0x1001adf70
0x1001adfad: ret 
0x1001adfae: or rcx, 1
0x1001adfb2: jmp 0x1001adfbd ; 0x1001adfbd
0x1001adfb4: or rcx, 2
0x1001adfb8: jmp 0x1001adfbd ; 0x1001adfbd
0x1001adfba: mov rcx, rdx
0x1001adfbd: push rbp
0x1001adfbe: mov rbp, rsp
0x1001adfc1: sub rsp, 0x10
0x1001adfc5: lea rax, [rcx + rcx*8]
0x1001adfc9: shl rax, 5
0x1001adfcd: lea rax, [r8 + rax + 0x10]
0x1001adfd2: mov ecx, dword ptr [rdi + 0x1c]
0x1001adfd5: mov dword ptr [rbp - 8], ecx
0x1001adfd8: mov rdx, qword ptr [rsi + 0x178]
0x1001adfdf: mov rcx, qword ptr [rsi + 0x5c8]
0x1001adfe6: movzx r9d, byte ptr [rdi + 0x18]
0x1001adfeb: lea rsi, [rbp - 8]
0x1001adfef: xor r8d, r8d
0x1001adff2: mov rdi, rax
0x1001adff5: call 0x1001ae070 ; 0x1001ae070
0x1001adffa: add rsp, 0x10
0x1001adffe: pop rbp
0x1001adfff: ret 
