0x100794050: test rdx, rdx
0x100794053: je 0x10079405a
0x100794055: cmp dword ptr [rdx], -1
0x100794058: je 0x10079406b
0x10079405a: mov r8d, 1
0x100794060: mov r9d, 1
0x100794066: jmp 0x100793f30 ; 0x100793f30
0x10079406b: push rbp
0x10079406c: mov rbp, rsp
0x10079406f: lea rdi, [rip + 0x40cf4d] ; 0x100ba0fc3 !texture || texture->IsInitialized()
0x100794076: lea rsi, [rip + 0x40cee8] ; 0x100ba0f65 GlobalShaderUniforms.cpp
0x10079407d: mov edx, 0x31
0x100794082: mov ecx, 3
0x100794087: call 0x1007e5f70 ; 0x1007e5f70
0x10079408c: ud2 
0x10079408e: nop 
