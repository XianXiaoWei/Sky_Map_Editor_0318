0x1001ad5a0: push rbp
0x1001ad5a1: mov rbp, rsp
0x1001ad5a4: push r14
0x1001ad5a6: push rbx
0x1001ad5a7: mov r14, rdi
0x1001ad5aa: mov eax, 0x891
0x1001ad5af: nop 
0x1001ad5b0: mov byte ptr [r14 + rax - 0x7e0], 0
0x1001ad5b9: mov byte ptr [r14 + rax - 0x6c0], 0
0x1001ad5c2: mov byte ptr [r14 + rax - 0x5a0], 0
0x1001ad5cb: mov byte ptr [r14 + rax - 0x480], 0
0x1001ad5d4: mov byte ptr [r14 + rax - 0x360], 0
0x1001ad5dd: mov byte ptr [r14 + rax - 0x240], 0
0x1001ad5e6: mov byte ptr [r14 + rax - 0x120], 0
0x1001ad5ef: mov byte ptr [r14 + rax], 0
0x1001ad5f4: add rax, 0x900
0x1001ad5fa: cmp rax, 0x12891
0x1001ad600: jne 0x1001ad5b0
0x1001ad602: xor ebx, ebx
0x1001ad604: xor eax, eax
0x1001ad606: call 0x100011c10 ; 0x100011c10
0x1001ad60b: lea rax, [r14 + 0x11b90]
0x1001ad612: xor ecx, ecx
0x1001ad614: nop word ptr cs:[rax + rax]
0x1001ad620: lea rdx, [rax + 0x360]
0x1001ad627: mov qword ptr [rax + 0x360], rcx
0x1001ad62e: lea ecx, [rbx + 0xfe]
0x1001ad634: and ecx, 0xfffffffe
0x1001ad637: lea rcx, [rcx + rcx*8]
0x1001ad63b: shl rcx, 5
0x1001ad63f: lea rsi, [r14 + rcx + 0x10]
0x1001ad644: mov qword ptr [r14 + rcx + 0x10], rdx
0x1001ad649: lea rcx, [rax + 0x120]
0x1001ad650: mov qword ptr [rax + 0x120], rsi
0x1001ad657: mov qword ptr [rax], rcx
0x1001ad65a: mov rcx, rax
0x1001ad65d: add rbx, -4
0x1001ad661: add rax, -0x480
0x1001ad667: cmp ebx, 0xffffff00
0x1001ad66d: jne 0x1001ad620
0x1001ad66f: lea rax, [r14 + 0x10]
0x1001ad673: mov qword ptr [r14 + 0x12010], rax
0x1001ad67a: pop rbx
0x1001ad67b: pop r14
0x1001ad67d: pop rbp
0x1001ad67e: ret 
0x1001ad67f: nop 
