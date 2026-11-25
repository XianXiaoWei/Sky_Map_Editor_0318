0x100407c80: mov ecx, dword ptr [rdi + 0x8f30]
0x100407c86: cmp rcx, 0x10
0x100407c8a: jae 0x100407cb4
0x100407c8c: imul rdx, rcx, 0x6f0
0x100407c93: lea rax, [rdi + rdx + 0x2030]
0x100407c9b: mov qword ptr [rdi + rdx + 0x2118], rdi
0x100407ca3: lea esi, [rcx + 1]
0x100407ca6: mov dword ptr [rdi + 0x8f30], esi
0x100407cac: mov dword ptr [rdi + rdx + 0x2110], ecx
0x100407cb3: ret 
0x100407cb4: push rbp
0x100407cb5: mov rbp, rsp
0x100407cb8: lea rdi, [rip + 0x77fbb9] ; 0x100b87878 m_levelMaterialCount < kMaxLevelMaterials
0x100407cbf: lea rsi, [rip + 0x77fb68] ; 0x100b8782e LevelModel.cpp
0x100407cc6: lea r8, [rip + 0x77fbd5] ; 0x100b878a2 Ran out of LevelMaterials
0x100407ccd: mov edx, 0xd5
0x100407cd2: mov ecx, 4
0x100407cd7: xor eax, eax
0x100407cd9: call 0x1007e6030 ; 0x1007e6030
0x100407cde: ud2 
