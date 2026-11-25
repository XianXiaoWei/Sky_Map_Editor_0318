0x1007bcbc0: push rbp
0x1007bcbc1: mov rbp, rsp
0x1007bcbc4: mov eax, dword ptr [rdi + 0x18724]
0x1007bcbca: lea ecx, [rax + 1]
0x1007bcbcd: mov dword ptr [rdi + 0x18724], ecx
0x1007bcbd3: shl rax, 4
0x1007bcbd7: mov dword ptr [rdi + rax + 0x18728], 1
0x1007bcbe2: mov ecx, dword ptr [rdi]
0x1007bcbe4: dec ecx
0x1007bcbe6: mov dword ptr [rdi + rax + 0x1872c], ecx
0x1007bcbed: mov dword ptr [rdi + 0x19830], 0
0x1007bcbf7: pop rbp
0x1007bcbf8: ret 
0x1007bcbf9: nop dword ptr [rax]
