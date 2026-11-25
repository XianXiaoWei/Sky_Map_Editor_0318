0x10022b470: push rbp
0x10022b471: mov rbp, rsp
0x10022b474: lea rax, [rip + 0x94f770] ; 0x100b7abeb kDebugRenderCloudProbeTex
0x10022b47b: mov qword ptr [rip + 0x1bb7586], rax ; 0x101de2a08
0x10022b482: lea rax, [rip + 0x1bb757f] ; 0x101de2a08
0x10022b489: mov rcx, qword ptr [rip + 0xa64810] ; 0x100c8fca0
0x10022b490: mov qword ptr [rip + 0x1bb7581], rcx ; 0x101de2a18
0x10022b497: mov qword ptr [rip + 0xa64802], rax ; 0x100c8fca0
0x10022b49e: lea rax, [rip + 0x1bb755b] ; 0x101de2a00
0x10022b4a5: vmovq xmm0, rax
0x10022b4aa: lea rax, [rip + 0x94f754] ; 0x100b7ac05 CloudTexGen.cpp
0x10022b4b1: vmovq xmm1, rax
0x10022b4b6: vpunpcklqdq xmm0, xmm1, xmm0
0x10022b4ba: vmovdqu xmmword ptr [rip + 0x1bb7566], xmm0 ; 0x101de2a28
0x10022b4c2: mov rax, qword ptr [rip + 0x9dc08f] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10022b4c9: mov qword ptr [rip + 0x1bb7568], rax ; 0x101de2a38
0x10022b4d0: mov qword ptr [rip + 0x1bb7565], 0 ; 0x101de2a40
0x10022b4db: lea rax, [rip - 0x211ac2] ; 0x100019a20
0x10022b4e2: mov qword ptr [rip + 0x1bb755f], rax ; 0x101de2a48
0x10022b4e9: mov qword ptr [rip + 0x1bb755c], 0 ; 0x101de2a50
0x10022b4f4: lea rax, [rip + 0x936951] ; 0x100b61e4c Clouds
0x10022b4fb: vmovq xmm0, rax
0x10022b500: lea rax, [rip + 0x932b16] ; 0x100b5e01d TweakCategory
0x10022b507: vmovq xmm1, rax
0x10022b50c: vpunpcklqdq xmm0, xmm1, xmm0
0x10022b510: vmovdqa xmmword ptr [rip + 0x1bb7548], xmm0 ; 0x101de2a60
0x10022b518: lea rax, [rip + 0x1bb7541] ; 0x101de2a60
0x10022b51f: mov qword ptr [rip + 0x1bb7546], 0 ; 0x101de2a70
0x10022b52a: mov qword ptr [rip + 0x1bb74df], rax ; 0x101de2a10
0x10022b531: lea rax, [rip + 0x94f6dd] ; 0x100b7ac15 CloudTexGen
0x10022b538: mov qword ptr [rip + 0x1bb7541], rax ; 0x101de2a80
0x10022b53f: lea rax, [rip + 0x1bb7532] ; 0x101de2a78
0x10022b546: mov qword ptr [rip + 0x1bb7537], 0 ; 0x101de2a88
0x10022b551: mov rcx, qword ptr [rip + 0xa44a00] ; 0x100c6ff58
0x10022b558: mov qword ptr [rip + 0x1bb7531], rcx ; 0x101de2a90
0x10022b55f: mov qword ptr [rip + 0xa449f2], rax ; 0x100c6ff58
0x10022b566: mov qword ptr [rip + 0x1bb7533], rax ; 0x101de2aa0
0x10022b56d: mov rax, qword ptr [rip + 0x9dd13c] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x10022b574: mov qword ptr [rip + 0x1bb752d], rax ; 0x101de2aa8
0x10022b57b: mov dword ptr [rip + 0x1bb752b], 0xffffffff ; 0x101de2ab0
0x10022b585: mov dword ptr [rip + 0x1bb7525], 0xffffffff ; 0x101de2ab4
0x10022b58f: mov qword ptr [rip + 0x1bb7536], 0 ; 0x101de2ad0
0x10022b59a: mov rax, qword ptr [rip + 0x9df697] ; 0x100c0ac38
0x10022b5a1: add rax, 0x10
0x10022b5a5: mov qword ptr [rip + 0x1bb74cc], rax ; 0x101de2a78
0x10022b5ac: xor eax, eax
0x10022b5ae: call 0x100011c10 ; 0x100011c10
0x10022b5b3: lea rax, [rip + 0x931352] ; 0x100b5c90c Initialize
0x10022b5ba: mov qword ptr [rip + 0x1bb7517], rax ; 0x101de2ad8
0x10022b5c1: lea rcx, [rip + 0x1bb7510] ; 0x101de2ad8
0x10022b5c8: mov qword ptr [rip + 0x1bb750d], 0 ; 0x101de2ae0
0x10022b5d3: mov rax, qword ptr [rip + 0xa44986] ; 0x100c6ff60
0x10022b5da: mov qword ptr [rip + 0x1bb7507], rax ; 0x101de2ae8
0x10022b5e1: lea rax, [rip - 0xfb8] ; 0x10022a630
0x10022b5e8: vmovq xmm0, rax
0x10022b5ed: vmovdqu xmmword ptr [rip + 0x1bb751b], xmm0 ; 0x101de2b10
0x10022b5f5: mov rax, qword ptr [rip + 0x9d9f5c] ; 0x100c05558 -> 0x10022b110 __Z12ApplyWrapperI11CloudTexGenMS0_FvP15ResourceManagerP5SceneEEvM9VoidClassFvvEPv8VariablePSB_j
0x10022b5fc: mov qword ptr [rip + 0x1bb751d], rax ; 0x101de2b20
0x10022b603: mov rax, qword ptr [rip + 0x9dd7de] ; 0x100c08de8 -> 0x10022b120 __Z21InitFunctionSignatureIM11CloudTexGenFvP15ResourceManagerP5SceneEEvP17FunctionSignature
0x10022b60a: mov qword ptr [rip + 0x1bb7517], rax ; 0x101de2b28
0x10022b611: mov rax, qword ptr [rip + 0x9dc1d0] ; 0x100c077e8 -> 0x10022b100 __Z18GetMetaClassByTypeIP11CloudTexGenERK9MetaClassv
0x10022b618: mov qword ptr [rip + 0x1bb7511], rax ; 0x101de2b30
0x10022b61f: lea rdx, [rip + 0x931312] ; 0x100b5c938 Terminate
0x10022b626: mov qword ptr [rip + 0x1bb750b], rdx ; 0x101de2b38
0x10022b62d: lea rdx, [rip + 0x1bb7504] ; 0x101de2b38
0x10022b634: mov qword ptr [rip + 0x1bb7501], 0 ; 0x101de2b40
0x10022b63f: mov qword ptr [rip + 0x1bb7502], rcx ; 0x101de2b48
0x10022b646: lea rcx, [rip - 0xefd] ; 0x10022a750
0x10022b64d: vmovq xmm0, rcx
0x10022b652: vmovdqu xmmword ptr [rip + 0x1bb7516], xmm0 ; 0x101de2b70
0x10022b65a: mov rcx, qword ptr [rip + 0x9d9f07] ; 0x100c05568 -> 0x10022b280 __Z12ApplyWrapperI11CloudTexGenMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10022b661: mov qword ptr [rip + 0x1bb7518], rcx ; 0x101de2b80
0x10022b668: mov rsi, qword ptr [rip + 0x9dd789] ; 0x100c08df8 -> 0x10022b2e0 __Z21InitFunctionSignatureIM11CloudTexGenFvvEEvP17FunctionSignature
0x10022b66f: mov qword ptr [rip + 0x1bb7512], rsi ; 0x101de2b88
0x10022b676: mov qword ptr [rip + 0x1bb7513], rax ; 0x101de2b90
0x10022b67d: lea rdi, [rip + 0x9312c9] ; 0x100b5c94d Update
0x10022b684: mov qword ptr [rip + 0x1bb750d], rdi ; 0x101de2b98
0x10022b68b: lea rdi, [rip + 0x1bb7506] ; 0x101de2b98
0x10022b692: mov qword ptr [rip + 0x1bb7503], 0 ; 0x101de2ba0
0x10022b69d: mov qword ptr [rip + 0x1bb7504], rdx ; 0x101de2ba8
0x10022b6a4: lea rdx, [rip - 0xf2b] ; 0x10022a780
0x10022b6ab: vmovq xmm0, rdx
0x10022b6b0: vmovdqu xmmword ptr [rip + 0x1bb7518], xmm0 ; 0x101de2bd0
0x10022b6b8: mov rdx, qword ptr [rip + 0x9d9ea1] ; 0x100c05560 -> 0x10022b300 __Z12ApplyWrapperI11CloudTexGenMS0_FvP6CameraP8AmbienceEEvM9VoidClassFvvEPv8VariablePSB_j
0x10022b6bf: mov qword ptr [rip + 0x1bb751a], rdx ; 0x101de2be0
0x10022b6c6: mov rdx, qword ptr [rip + 0x9dd723] ; 0x100c08df0 -> 0x10022b310 __Z21InitFunctionSignatureIM11CloudTexGenFvP6CameraP8AmbienceEEvP17FunctionSignature
0x10022b6cd: mov qword ptr [rip + 0x1bb7514], rdx ; 0x101de2be8
0x10022b6d4: mov qword ptr [rip + 0x1bb7515], rax ; 0x101de2bf0
0x10022b6db: lea rdx, [rip + 0x93671f] ; 0x100b61e01 RenderFlush
0x10022b6e2: mov qword ptr [rip + 0x1bb750f], rdx ; 0x101de2bf8
0x10022b6e9: lea rdx, [rip + 0x1bb7508] ; 0x101de2bf8
0x10022b6f0: mov qword ptr [rip + 0x1bb7505], 0 ; 0x101de2c00
0x10022b6fb: mov qword ptr [rip + 0x1bb7506], rdi ; 0x101de2c08
0x10022b702: mov qword ptr [rip + 0xa44857], rdx ; 0x100c6ff60
0x10022b709: lea rdx, [rip - 0xf80] ; 0x10022a790
0x10022b710: vmovq xmm0, rdx
0x10022b715: vmovdqu xmmword ptr [rip + 0x1bb7513], xmm0 ; 0x101de2c30
0x10022b71d: mov qword ptr [rip + 0x1bb751c], rcx ; 0x101de2c40
0x10022b724: mov qword ptr [rip + 0x1bb751d], rsi ; 0x101de2c48
0x10022b72b: mov qword ptr [rip + 0x1bb751e], rax ; 0x101de2c50
0x10022b732: pop rbp
0x10022b733: ret 
0x10022b734: nop 
0x10022b735: nop 
0x10022b736: nop 
0x10022b737: nop 
0x10022b738: nop 
0x10022b739: nop 
0x10022b73a: nop 
0x10022b73b: nop 
0x10022b73c: nop 
0x10022b73d: nop 
0x10022b73e: nop 
0x10022b73f: nop 
