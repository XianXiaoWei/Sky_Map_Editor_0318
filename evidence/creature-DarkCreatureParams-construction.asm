0x100273210: push rbp
0x100273211: mov rbp, rsp
0x100273214: push rbx
0x100273215: push rax
0x100273216: mov rbx, rsi
0x100273219: call 0x1007abc10 ; 0x1007abc10
0x10027321e: mov eax, dword ptr [rax + 0x38]
0x100273221: mov dword ptr [rbx], eax
0x100273223: call 0x1003f0590 ; 0x1003f0590
0x100273228: mov rax, qword ptr [rip + 0x1b74291] ; 0x101de74c0
0x10027322f: mov eax, dword ptr [rax + 0x38]
0x100273232: mov dword ptr [rbx], eax
0x100273234: mov word ptr [rbx + 4], 0
0x10027323a: mov byte ptr [rbx + 6], 1
0x10027323e: movabs rax, 0x40f0000041f00000
0x100273248: mov qword ptr [rbx + 8], rax
0x10027324c: mov rax, rbx
0x10027324f: add rsp, 8
0x100273253: pop rbx
0x100273254: pop rbp
0x100273255: ret 
