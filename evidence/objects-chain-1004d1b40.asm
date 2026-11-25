0x1004d1b40: push rbp
0x1004d1b41: mov rbp, rsp
0x1004d1b44: lea rax, [rip + 0x6bc108] ; 0x100b8dc53 ObjectFactory
0x1004d1b4b: mov qword ptr [rip + 0x1b3f87e], rax ; 0x1020113d0
0x1004d1b52: lea rax, [rip + 0x1b3f86f] ; 0x1020113c8
0x1004d1b59: mov qword ptr [rip + 0x1b3f874], 0 ; 0x1020113d8
0x1004d1b64: mov rcx, qword ptr [rip + 0x79e3ed] ; 0x100c6ff58
0x1004d1b6b: mov qword ptr [rip + 0x1b3f86e], rcx ; 0x1020113e0
0x1004d1b72: mov qword ptr [rip + 0x79e3df], rax ; 0x100c6ff58
0x1004d1b79: mov qword ptr [rip + 0x1b3f870], rax ; 0x1020113f0
0x1004d1b80: mov rax, qword ptr [rip + 0x736b29] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1004d1b87: mov qword ptr [rip + 0x1b3f86a], rax ; 0x1020113f8
0x1004d1b8e: mov qword ptr [rip + 0x1b3f867], 0xffffffffffffffff ; 0x102011400
0x1004d1b99: mov qword ptr [rip + 0x1b3f87c], 0 ; 0x102011420
0x1004d1ba4: mov rax, qword ptr [rip + 0x73964d] ; 0x100c0b1f8
0x1004d1bab: add rax, 0x10
0x1004d1baf: mov qword ptr [rip + 0x1b3f812], rax ; 0x1020113c8
0x1004d1bb6: xor eax, eax
0x1004d1bb8: call 0x100011c10 ; 0x100011c10
0x1004d1bbd: lea rax, [rip + 0x68ad48] ; 0x100b5c90c Initialize
0x1004d1bc4: mov qword ptr [rip + 0x1b3f85d], rax ; 0x102011428
0x1004d1bcb: lea rcx, [rip + 0x1b3f856] ; 0x102011428
0x1004d1bd2: mov qword ptr [rip + 0x1b3f853], 0 ; 0x102011430
0x1004d1bdd: mov rax, qword ptr [rip + 0x79e37c] ; 0x100c6ff60
0x1004d1be4: mov qword ptr [rip + 0x1b3f84d], rax ; 0x102011438
0x1004d1beb: lea rax, [rip - 0x1572] ; 0x1004d0680
0x1004d1bf2: vmovq xmm0, rax
0x1004d1bf7: vmovdqu xmmword ptr [rip + 0x1b3f861], xmm0 ; 0x102011460
0x1004d1bff: mov rax, qword ptr [rip + 0x733e02] ; 0x100c05a08 -> 0x1004d1550 __Z12ApplyWrapperI13ObjectFactoryMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1004d1c06: mov qword ptr [rip + 0x1b3f863], rax ; 0x102011470
0x1004d1c0d: mov rax, qword ptr [rip + 0x737684] ; 0x100c09298 -> 0x1004d15b0 __Z21InitFunctionSignatureIM13ObjectFactoryFvvEEvP17FunctionSignature
0x1004d1c14: mov qword ptr [rip + 0x1b3f85d], rax ; 0x102011478
0x1004d1c1b: mov rax, qword ptr [rip + 0x735fa6] ; 0x100c07bc8 -> 0x1004d1540 __Z18GetMetaClassByTypeIP13ObjectFactoryERK9MetaClassv
0x1004d1c22: mov qword ptr [rip + 0x1b3f857], rax ; 0x102011480
0x1004d1c29: lea rdx, [rip + 0x6bc031] ; 0x100b8dc61 CreateObject
0x1004d1c30: mov qword ptr [rip + 0x1b3f851], rdx ; 0x102011488
0x1004d1c37: lea rdx, [rip + 0x1b3f84a] ; 0x102011488
0x1004d1c3e: mov qword ptr [rip + 0x1b3f847], 0 ; 0x102011490
0x1004d1c49: mov qword ptr [rip + 0x1b3f848], rcx ; 0x102011498
0x1004d1c50: lea rcx, [rip - 0x10f7] ; 0x1004d0b60
0x1004d1c57: vmovq xmm0, rcx
0x1004d1c5c: vmovdqu xmmword ptr [rip + 0x1b3f85c], xmm0 ; 0x1020114c0
0x1004d1c64: mov rcx, qword ptr [rip + 0x733d85] ; 0x100c059f0 -> 0x1004d15d0 __Z12ApplyWrapperI13ObjectFactoryMS0_FP6ObjectPKcEEvM9VoidClassFvvEPv8VariablePSB_j
0x1004d1c6b: mov qword ptr [rip + 0x1b3f85e], rcx ; 0x1020114d0
0x1004d1c72: mov rcx, qword ptr [rip + 0x737607] ; 0x100c09280 -> 0x1004d16a0 __Z21InitFunctionSignatureIM13ObjectFactoryFP6ObjectPKcEEvP17FunctionSignature
0x1004d1c79: mov qword ptr [rip + 0x1b3f858], rcx ; 0x1020114d8
0x1004d1c80: mov qword ptr [rip + 0x1b3f859], rax ; 0x1020114e0
0x1004d1c87: lea rcx, [rip + 0x6bbfe0] ; 0x100b8dc6e ReleaseObject
0x1004d1c8e: mov qword ptr [rip + 0x1b3f853], rcx ; 0x1020114e8
0x1004d1c95: lea rcx, [rip + 0x1b3f84c] ; 0x1020114e8
0x1004d1c9c: mov qword ptr [rip + 0x1b3f849], 0 ; 0x1020114f0
0x1004d1ca7: mov qword ptr [rip + 0x1b3f84a], rdx ; 0x1020114f8
0x1004d1cae: lea rdx, [rip - 0xeb5] ; 0x1004d0e00
0x1004d1cb5: vmovq xmm0, rdx
0x1004d1cba: vmovdqu xmmword ptr [rip + 0x1b3f85e], xmm0 ; 0x102011520
0x1004d1cc2: mov rdx, qword ptr [rip + 0x733d37] ; 0x100c05a00 -> 0x1004d1720 __Z12ApplyWrapperI13ObjectFactoryMS0_FvP6ObjectEEvM9VoidClassFvvEPv8VariablePS9_j
0x1004d1cc9: mov qword ptr [rip + 0x1b3f860], rdx ; 0x102011530
0x1004d1cd0: mov rdx, qword ptr [rip + 0x7375b9] ; 0x100c09290 -> 0x1004d17c0 __Z21InitFunctionSignatureIM13ObjectFactoryFvP6ObjectEEvP17FunctionSignature
0x1004d1cd7: mov qword ptr [rip + 0x1b3f85a], rdx ; 0x102011538
0x1004d1cde: mov qword ptr [rip + 0x1b3f85b], rax ; 0x102011540
0x1004d1ce5: lea rdx, [rip + 0x6bbf90] ; 0x100b8dc7c GetObjectInitPriority
0x1004d1cec: mov qword ptr [rip + 0x1b3f855], rdx ; 0x102011548
0x1004d1cf3: lea rdx, [rip + 0x1b3f84e] ; 0x102011548
0x1004d1cfa: mov qword ptr [rip + 0x1b3f84b], 0 ; 0x102011550
0x1004d1d05: mov qword ptr [rip + 0x1b3f84c], rcx ; 0x102011558
0x1004d1d0c: mov qword ptr [rip + 0x79e24d], rdx ; 0x100c6ff60
0x1004d1d13: lea rcx, [rip - 0xd4a] ; 0x1004d0fd0
0x1004d1d1a: vmovq xmm0, rcx
0x1004d1d1f: vmovdqu xmmword ptr [rip + 0x1b3f859], xmm0 ; 0x102011580
0x1004d1d27: mov rcx, qword ptr [rip + 0x733cca] ; 0x100c059f8 -> 0x1004d1840 __Z12ApplyWrapperI13ObjectFactoryMS0_FjPK6ObjectEEvM9VoidClassFvvEPv8VariablePSA_j
0x1004d1d2e: mov qword ptr [rip + 0x1b3f85b], rcx ; 0x102011590
0x1004d1d35: mov rcx, qword ptr [rip + 0x73754c] ; 0x100c09288 -> 0x1004d1910 __Z21InitFunctionSignatureIM13ObjectFactoryFjPK6ObjectEEvP17FunctionSignature
0x1004d1d3c: mov qword ptr [rip + 0x1b3f855], rcx ; 0x102011598
0x1004d1d43: mov qword ptr [rip + 0x1b3f856], rax ; 0x1020115a0
0x1004d1d4a: pop rbp
0x1004d1d4b: ret 
0x1004d1d4c: nop 
0x1004d1d4d: nop 
0x1004d1d4e: nop 
0x1004d1d4f: nop 
