0x1002cec10: push rbp
0x1002cec11: mov rbp, rsp
0x1002cec14: push rbx
0x1002cec15: push rax
0x1002cec16: mov rbx, rsi
0x1002cec19: mov rdi, rbx
0x1002cec1c: call 0x10032eea0 ; 0x10032eea0
0x1002cec21: mov rax, qword ptr [rip + 0x1b1f938] ; 0x101dee560
0x1002cec28: mov eax, dword ptr [rax + 0x38]
0x1002cec2b: mov dword ptr [rbx + 8], eax
0x1002cec2e: lea rax, [rip + 0x94608b] ; 0x100c14cc0
0x1002cec35: mov qword ptr [rbx], rax
0x1002cec38: mov qword ptr [rbx + 0x38], 0
0x1002cec40: lea rax, [rip + 0x1d70a99] ; 0x10203f6e0
0x1002cec47: vmovaps xmm0, xmmword ptr [rax]
0x1002cec4b: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1002cec50: mov dword ptr [rbx + 0x74], 0x3f800000
0x1002cec57: mov rax, rbx
0x1002cec5a: add rsp, 8
0x1002cec5e: pop rbx
0x1002cec5f: pop rbp
0x1002cec60: ret 
