0x10033f470: push rbp
0x10033f471: mov rbp, rsp
0x10033f474: push rbx
0x10033f475: push rax
0x10033f476: mov rbx, rdi
0x10033f479: lea rdi, [rbx + 0x10]
0x10033f47d: call 0x100340550 ; 0x100340550
0x10033f482: mov ecx, dword ptr [rbx + 0x36070]
0x10033f488: lea edx, [rcx + 1]
0x10033f48b: mov dword ptr [rbx + 0x36070], edx
0x10033f491: mov dword ptr [rax + 0x150], ecx
0x10033f497: mov dword ptr [rax + 0xa4], 0x3f800000
0x10033f4a1: mov dword ptr [rax + 0x11c], 0
0x10033f4ab: mov byte ptr [rax + 0xb7], 0
0x10033f4b2: add rsp, 8
0x10033f4b6: pop rbx
0x10033f4b7: pop rbp
0x10033f4b8: ret 
0x10033f4b9: nop dword ptr [rax]
