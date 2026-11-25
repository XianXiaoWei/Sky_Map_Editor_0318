0x100408960: push rbp
0x100408961: mov rbp, rsp
0x100408964: mov ecx, dword ptr [rdi + 0x8f30]
0x10040896a: xor eax, eax
0x10040896c: test ecx, ecx
0x10040896e: je 0x100408992
0x100408970: add rdi, 0x2030
0x100408977: xor edx, edx
0x100408979: nop dword ptr [rax]
0x100408980: cmp dword ptr [rdi + 4], esi
0x100408983: je 0x100408994
0x100408985: inc edx
0x100408987: add rdi, 0x6f0
0x10040898e: cmp edx, ecx
0x100408990: jb 0x100408980
0x100408992: pop rbp
0x100408993: ret 
0x100408994: mov rax, rdi
0x100408997: pop rbp
0x100408998: ret 
0x100408999: nop dword ptr [rax]
