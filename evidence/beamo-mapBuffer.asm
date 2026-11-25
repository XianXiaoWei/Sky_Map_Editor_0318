0x1007950d0: push rbp
0x1007950d1: mov rbp, rsp
0x1007950d4: push rbx
0x1007950d5: push rax
0x1007950d6: mov rbx, rdi
0x1007950d9: cmp dword ptr [rbx + 0x18], 1
0x1007950dd: jne 0x100795100
0x1007950df: call 0x1007c1470 ; 0x1007c1470
0x1007950e4: mov rcx, qword ptr [rax]
0x1007950e7: mov rcx, qword ptr [rcx + 0x158]
0x1007950ee: mov edx, dword ptr [rbx + 0x14]
0x1007950f1: mov esi, dword ptr [rbx + rdx*4 + 0x1c]
0x1007950f5: mov rdi, rax
0x1007950f8: add rsp, 8
0x1007950fc: pop rbx
0x1007950fd: pop rbp
0x1007950fe: jmp rcx
0x100795100: lea rdi, [rip + 0x40bffc] ; 0x100ba1103 m_idCount == 1
0x100795107: lea rsi, [rip + 0x40bf9d] ; 0x100ba10ab GpuBuffer.cpp
0x10079510e: mov edx, 0x60
0x100795113: mov ecx, 3
0x100795118: call 0x1007e5f70 ; 0x1007e5f70
0x10079511d: ud2 
0x10079511f: nop 
