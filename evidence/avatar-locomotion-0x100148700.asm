0x100148700: push rbp
0x100148701: mov rbp, rsp
0x100148704: push rbx
0x100148705: push rax
0x100148706: mov ebx, dword ptr [rdi + 0x730]
0x10014870c: cmp ebx, edx
0x10014870e: cmova ebx, edx
0x100148711: lea rax, [rdi + 0x330]
0x100148718: mov rdx, rbx
0x10014871b: shl rdx, 5
0x10014871f: mov rdi, rsi
0x100148722: mov rsi, rax
0x100148725: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10014872a: mov eax, ebx
0x10014872c: add rsp, 8
0x100148730: pop rbx
0x100148731: pop rbp
0x100148732: ret 
0x100148733: nop word ptr cs:[rax + rax]

