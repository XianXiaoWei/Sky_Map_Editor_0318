0x10045edf0: push rbp
0x10045edf1: mov rbp, rsp
0x10045edf4: mov rax, rdx
0x10045edf7: mov rcx, qword ptr [rax + 0x80]
0x10045edfe: mov edx, dword ptr [rax + 0x34]
0x10045ee01: mov r8d, dword ptr [rax + 0x38]
0x10045ee05: mov r9, qword ptr [rax + 0x98]
0x10045ee0c: mov r10d, dword ptr [rax + 0x40]
0x10045ee10: sub rsp, 8
0x10045ee14: push 0
0x10045ee16: push qword ptr [rax + 0x90]
0x10045ee1c: push r10
0x10045ee1e: call 0x10045ee30 ; 0x10045ee30
0x10045ee23: add rsp, 0x20
0x10045ee27: pop rbp
0x10045ee28: ret 
0x10045ee29: nop dword ptr [rax]
