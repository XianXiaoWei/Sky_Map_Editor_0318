0x1001b2aa0: push rbp
0x1001b2aa1: mov rbp, rsp
0x1001b2aa4: push rbx
0x1001b2aa5: push rax
0x1001b2aa6: mov rbx, rdi
0x1001b2aa9: call 0x1007abbf0 ; 0x1007abbf0
0x1001b2aae: mov qword ptr [rbx], rax
0x1001b2ab1: mov al, byte ptr [rip + 0xad9109] ; 0x100c8bbc0
0x1001b2ab7: test al, al
0x1001b2ab9: jne 0x1001b2ae5
0x1001b2abb: lea rdi, [rip + 0xad90fe] ; 0x100c8bbc0
0x1001b2ac2: call 0x100aa24e0 ; 0x100aa24e0 ___cxa_guard_acquire
0x1001b2ac7: test eax, eax
0x1001b2ac9: je 0x1001b2ae5
0x1001b2acb: mov rax, qword ptr [rip + 0x1c2832e] ; 0x101ddae00
0x1001b2ad2: mov qword ptr [rip + 0xad90df], rax ; 0x100c8bbb8
0x1001b2ad9: lea rdi, [rip + 0xad90e0] ; 0x100c8bbc0
0x1001b2ae0: call 0x100aa24e6 ; 0x100aa24e6 ___cxa_guard_release
0x1001b2ae5: lea rax, [rip + 0xad90cc] ; 0x100c8bbb8
0x1001b2aec: mov qword ptr [rbx + 8], rax
0x1001b2af0: mov dword ptr [rbx + 0x10], 1
0x1001b2af7: add rsp, 8
0x1001b2afb: pop rbx
0x1001b2afc: pop rbp
0x1001b2afd: ret 
0x1001b2afe: nop 
