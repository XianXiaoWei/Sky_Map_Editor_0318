0x10033ac40: push rbp
0x10033ac41: mov rbp, rsp
0x10033ac44: mov byte ptr [rdi + 0xb4], sil
0x10033ac4b: test sil, sil
0x10033ac4e: jne 0x10033ac6a
0x10033ac50: cmp byte ptr [rdi + 0xb6], 0
0x10033ac57: je 0x10033ac6a
0x10033ac59: mov byte ptr [rdi + 0xb6], 1
0x10033ac60: mov dword ptr [rdi + 0x110], 0x3f800000
0x10033ac6a: pop rbp
0x10033ac6b: ret 
0x10033ac6c: nop dword ptr [rax]
