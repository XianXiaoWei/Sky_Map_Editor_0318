0x10031e7c0: push rbp
0x10031e7c1: mov rbp, rsp
0x10031e7c4: push r15
0x10031e7c6: push r14
0x10031e7c8: push r13
0x10031e7ca: push r12
0x10031e7cc: push rbx
0x10031e7cd: sub rsp, 0x278
0x10031e7d4: lea rax, [rip + 0x8621a3] ; 0x100b8097e EnvVars
0x10031e7db: mov qword ptr [rip + 0x1ad1f06], rax ; 0x101df06e8
0x10031e7e2: lea rax, [rip + 0x1ad1ef7] ; 0x101df06e0
0x10031e7e9: mov qword ptr [rip + 0x1ad1efc], 0 ; 0x101df06f0
0x10031e7f4: mov rcx, qword ptr [rip + 0x95175d] ; 0x100c6ff58
0x10031e7fb: mov qword ptr [rip + 0x1ad1ef6], rcx ; 0x101df06f8
0x10031e802: mov qword ptr [rip + 0x95174f], rax ; 0x100c6ff58
0x10031e809: mov qword ptr [rip + 0x1ad1ef8], rax ; 0x101df0708
0x10031e810: lea rax, [rip - 0x2e8f57] ; 0x1000358c0
0x10031e817: mov qword ptr [rip + 0x1ad1ef2], rax ; 0x101df0710
0x10031e81e: mov qword ptr [rip + 0x1ad1eef], 0xffffffffffffffff ; 0x101df0718
0x10031e829: mov qword ptr [rip + 0x1ad1f04], 0 ; 0x101df0738
0x10031e834: mov rax, qword ptr [rip + 0x8edd85] ; 0x100c0c5c0
0x10031e83b: add rax, 0x10
0x10031e83f: mov qword ptr [rip + 0x1ad1e9a], rax ; 0x101df06e0
0x10031e846: xor eax, eax
0x10031e848: call 0x100011c10 ; 0x100011c10
0x10031e84d: lea rax, [rip + 0x843613] ; 0x100b61e67 Environment
0x10031e854: mov qword ptr [rip + 0x1ad1eed], rax ; 0x101df0748
0x10031e85b: lea rax, [rip + 0x1ad1ede] ; 0x101df0740
0x10031e862: mov qword ptr [rip + 0x1ad1ee3], 0 ; 0x101df0750
0x10031e86d: mov rcx, qword ptr [rip + 0x9516e4] ; 0x100c6ff58
0x10031e874: mov qword ptr [rip + 0x1ad1edd], rcx ; 0x101df0758
0x10031e87b: mov qword ptr [rip + 0x9516d6], rax ; 0x100c6ff58
0x10031e882: mov qword ptr [rip + 0x1ad1edf], rax ; 0x101df0768
0x10031e889: mov rax, qword ptr [rip + 0x8e9e20] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x10031e890: mov qword ptr [rip + 0x1ad1ed9], rax ; 0x101df0770
0x10031e897: mov qword ptr [rip + 0x1ad1ed6], 0xffffffffffffffff ; 0x101df0778
0x10031e8a2: mov qword ptr [rip + 0x1ad1eeb], 0 ; 0x101df0798
0x10031e8ad: mov rax, qword ptr [rip + 0x8ec404] ; 0x100c0acb8
0x10031e8b4: add rax, 0x10
0x10031e8b8: mov qword ptr [rip + 0x1ad1e81], rax ; 0x101df0740
0x10031e8bf: xor eax, eax
0x10031e8c1: call 0x100011c10 ; 0x100011c10
0x10031e8c6: lea rax, [rip + 0x83e03f] ; 0x100b5c90c Initialize
0x10031e8cd: mov qword ptr [rip + 0x1ad1ecc], rax ; 0x101df07a0
0x10031e8d4: lea rsi, [rip + 0x1ad1ec5] ; 0x101df07a0
0x10031e8db: mov qword ptr [rip + 0x1ad1ec2], 0 ; 0x101df07a8
0x10031e8e6: mov rax, qword ptr [rip + 0x951673] ; 0x100c6ff60
0x10031e8ed: mov qword ptr [rip + 0x1ad1ebc], rax ; 0x101df07b0
0x10031e8f4: lea rax, [rip - 0x50bb] ; 0x100319840
0x10031e8fb: vmovq xmm0, rax
0x10031e900: vmovdqu xmmword ptr [rip + 0x1ad1ed0], xmm0 ; 0x101df07d8
0x10031e908: mov r8, qword ptr [rip + 0x8e6ce9] ; 0x100c055f8 -> 0x10031ca60 __Z12ApplyWrapperI11EnvironmentMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10031e90f: mov qword ptr [rip + 0x1ad1ed2], r8 ; 0x101df07e8
0x10031e916: mov rdx, qword ptr [rip + 0x8ea56b] ; 0x100c08e88 -> 0x10031cac0 __Z21InitFunctionSignatureIM11EnvironmentFvvEEvP17FunctionSignature
0x10031e91d: mov qword ptr [rip + 0x1ad1ecc], rdx ; 0x101df07f0
0x10031e924: mov rax, qword ptr [rip + 0x8e8ef5] ; 0x100c07820 -> 0x10031c820 __Z18GetMetaClassByTypeIP11EnvironmentERK9MetaClassv
0x10031e92b: mov qword ptr [rip + 0x1ad1ec6], rax ; 0x101df07f8
0x10031e932: lea rdi, [rip + 0x83dfff] ; 0x100b5c938 Terminate
0x10031e939: mov qword ptr [rip + 0x1ad1ec0], rdi ; 0x101df0800
0x10031e940: lea rdi, [rip + 0x1ad1eb9] ; 0x101df0800
0x10031e947: mov qword ptr [rip + 0x1ad1ec2], rsi ; 0x101df0810
0x10031e94e: lea rsi, [rip - 0x50e5] ; 0x100319870
0x10031e955: vmovq xmm0, rsi
0x10031e95a: vmovdqu xmmword ptr [rip + 0x1ad1ed6], xmm0 ; 0x101df0838
0x10031e962: mov rsi, qword ptr [rip + 0x8e6c7f] ; 0x100c055e8 -> 0x10031cae0 __Z12ApplyWrapperI11EnvironmentMS0_FvP4HeapEEvM9VoidClassFvvEPv8VariablePS9_j
0x10031e969: mov qword ptr [rip + 0x1ad1ed8], rsi ; 0x101df0848
0x10031e970: mov rbx, qword ptr [rip + 0x8ea501] ; 0x100c08e78 -> 0x10031cb80 __Z21InitFunctionSignatureIM11EnvironmentFvP4HeapEEvP17FunctionSignature
0x10031e977: mov qword ptr [rip + 0x1ad1ed2], rbx ; 0x101df0850
0x10031e97e: mov qword ptr [rip + 0x1ad1ed3], rax ; 0x101df0858
0x10031e985: lea rcx, [rip + 0x83dfb6] ; 0x100b5c942 systemHeap
0x10031e98c: vmovq xmm1, rcx
0x10031e991: lea rcx, [rip + 0x83df7f] ; 0x100b5c917 ArgName
0x10031e998: vmovq xmm0, rcx
0x10031e99d: vpunpcklqdq xmm1, xmm0, xmm1
0x10031e9a1: vmovdqa xmmword ptr [rip + 0x1ad1eb7], xmm1 ; 0x101df0860
0x10031e9a9: lea rcx, [rip + 0x1ad1eb0] ; 0x101df0860
0x10031e9b0: mov qword ptr [rip + 0x1ad1eb5], 0 ; 0x101df0870
0x10031e9bb: mov qword ptr [rip + 0x1ad1e46], rcx ; 0x101df0808
0x10031e9c2: lea rcx, [rip + 0x84207c] ; 0x100b60a45 OnLevelLoad
0x10031e9c9: mov qword ptr [rip + 0x1ad1ea8], rcx ; 0x101df0878
0x10031e9d0: lea rcx, [rip + 0x1ad1ea1] ; 0x101df0878
0x10031e9d7: mov qword ptr [rip + 0x1ad1eaa], rdi ; 0x101df0888
0x10031e9de: lea rdi, [rip - 0x5115] ; 0x1003198d0
0x10031e9e5: vmovq xmm2, rdi
0x10031e9ea: vmovdqu xmmword ptr [rip + 0x1ad1ebe], xmm2 ; 0x101df08b0
0x10031e9f2: mov qword ptr [rip + 0x1ad1ec7], rsi ; 0x101df08c0
0x10031e9f9: mov qword ptr [rip + 0x1ad1ec8], rbx ; 0x101df08c8
0x10031ea00: mov qword ptr [rip + 0x1ad1ec9], rax ; 0x101df08d0
0x10031ea07: vmovdqa xmmword ptr [rip + 0x1ad1ed1], xmm1 ; 0x101df08e0
0x10031ea0f: lea rsi, [rip + 0x1ad1eca] ; 0x101df08e0
0x10031ea16: mov qword ptr [rip + 0x1ad1ecf], 0 ; 0x101df08f0
0x10031ea21: mov qword ptr [rip + 0x1ad1e58], rsi ; 0x101df0880
0x10031ea28: lea rsi, [rip + 0x84202c] ; 0x100b60a5b OnLevelUnload
0x10031ea2f: mov qword ptr [rip + 0x1ad1ec2], rsi ; 0x101df08f8
0x10031ea36: lea rsi, [rip + 0x1ad1ebb] ; 0x101df08f8
0x10031ea3d: mov qword ptr [rip + 0x1ad1eb8], 0 ; 0x101df0900
0x10031ea48: mov qword ptr [rip + 0x1ad1eb9], rcx ; 0x101df0908
0x10031ea4f: lea rcx, [rip - 0x5036] ; 0x100319a20
0x10031ea56: vmovq xmm1, rcx
0x10031ea5b: vmovdqu xmmword ptr [rip + 0x1ad1ecd], xmm1 ; 0x101df0930
0x10031ea63: mov qword ptr [rip + 0x1ad1ed6], r8 ; 0x101df0940
0x10031ea6a: mov qword ptr [rip + 0x1ad1ed7], rdx ; 0x101df0948
0x10031ea71: mov qword ptr [rip + 0x1ad1ed8], rax ; 0x101df0950
0x10031ea78: lea rcx, [rip + 0x83dece] ; 0x100b5c94d Update
0x10031ea7f: mov qword ptr [rip + 0x1ad1ed2], rcx ; 0x101df0958
0x10031ea86: lea rcx, [rip + 0x1ad1ecb] ; 0x101df0958
0x10031ea8d: mov qword ptr [rip + 0x1ad1ed4], rsi ; 0x101df0968
0x10031ea94: lea rdx, [rip - 0x506b] ; 0x100319a30
0x10031ea9b: vmovq xmm1, rdx
0x10031eaa0: vmovdqu xmmword ptr [rip + 0x1ad1ee8], xmm1 ; 0x101df0990
0x10031eaa8: mov rdx, qword ptr [rip + 0x8e6b41] ; 0x100c055f0 -> 0x10031cc00 __Z12ApplyWrapperI11EnvironmentMS0_FvP8GameTimeP12CameraSystemEEvM9VoidClassFvvEPv8VariablePSB_j
0x10031eaaf: mov qword ptr [rip + 0x1ad1eea], rdx ; 0x101df09a0
0x10031eab6: mov rdx, qword ptr [rip + 0x8ea3c3] ; 0x100c08e80 -> 0x10031cc10 __Z21InitFunctionSignatureIM11EnvironmentFvP8GameTimeP12CameraSystemEEvP17FunctionSignature
0x10031eabd: mov qword ptr [rip + 0x1ad1ee4], rdx ; 0x101df09a8
0x10031eac4: mov qword ptr [rip + 0x1ad1ee5], rax ; 0x101df09b0
0x10031eacb: lea rdx, [rip + 0x85a843] ; 0x100b79315 camera
0x10031ead2: vmovq xmm1, rdx
0x10031ead7: vpunpcklqdq xmm0, xmm0, xmm1
0x10031eadb: vmovdqa xmmword ptr [rip + 0x1ad1edd], xmm0 ; 0x101df09c0
0x10031eae3: lea rdx, [rip + 0x1ad1ed6] ; 0x101df09c0
0x10031eaea: mov qword ptr [rip + 0x1ad1edb], 0 ; 0x101df09d0
0x10031eaf5: mov qword ptr [rip + 0x1ad1e64], rdx ; 0x101df0960
0x10031eafc: lea rdx, [rip + 0x861e83] ; 0x100b80986 CreateEnvNode
0x10031eb03: mov qword ptr [rip + 0x1ad1ece], rdx ; 0x101df09d8
0x10031eb0a: lea rdx, [rip + 0x1ad1ec7] ; 0x101df09d8
0x10031eb11: mov qword ptr [rip + 0x1ad1ed0], rcx ; 0x101df09e8
0x10031eb18: mov qword ptr [rip + 0x951441], rdx ; 0x100c6ff60
0x10031eb1f: lea rcx, [rip - 0x4de6] ; 0x100319d40
0x10031eb26: vmovq xmm0, rcx
0x10031eb2b: vmovdqu xmmword ptr [rip + 0x1ad1edd], xmm0 ; 0x101df0a10
0x10031eb33: mov rcx, qword ptr [rip + 0x8e6aa6] ; 0x100c055e0 -> 0x10031cd70 __Z12ApplyWrapperI11EnvironmentMS0_FP7EnvNodePK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x10031eb3a: mov qword ptr [rip + 0x1ad1edf], rcx ; 0x101df0a20
0x10031eb41: mov rcx, qword ptr [rip + 0x8ea328] ; 0x100c08e70 -> 0x10031ce30 __Z21InitFunctionSignatureIM11EnvironmentFP7EnvNodePK9MetaClassEEvP17FunctionSignature
0x10031eb48: mov qword ptr [rip + 0x1ad1ed9], rcx ; 0x101df0a28
0x10031eb4f: mov qword ptr [rip + 0x1ad1eda], rax ; 0x101df0a30
0x10031eb56: lea rax, [rip + 0x861e37] ; 0x100b80994 EnvNode
0x10031eb5d: vmovq xmm0, rax
0x10031eb62: lea rax, [rip + 0x85855f] ; 0x100b770c8 ObjectFactory_CreatesType
0x10031eb69: vmovq xmm1, rax
0x10031eb6e: vpunpcklqdq xmm0, xmm1, xmm0
0x10031eb72: vmovdqa xmmword ptr [rip + 0x1ad1ec6], xmm0 ; 0x101df0a40
0x10031eb7a: lea rax, [rip + 0x1ad1ebf] ; 0x101df0a40
0x10031eb81: mov qword ptr [rip + 0x1ad1ec4], 0 ; 0x101df0a50
0x10031eb8c: mov qword ptr [rip + 0x1ad1e4d], rax ; 0x101df09e0
0x10031eb93: lea rdi, [rip + 0xa0cfb6] ; 0x100d2bb50
0x10031eb9a: lea rsi, [rip + 0x1ad1eb7] ; 0x101df0a58
0x10031eba1: lea rdx, [rip + 0x861df4] ; 0x100b8099c tag_MetaLerper
0x10031eba8: call 0x1007951b0 ; 0x1007951b0
0x10031ebad: lea rdi, [rip + 0xa0cfb4] ; 0x100d2bb68
0x10031ebb4: lea rsi, [rip + 0x1ad1ea5] ; 0x101df0a60
0x10031ebbb: lea rdx, [rip + 0x861de9] ; 0x100b809ab tag_Environment
0x10031ebc2: call 0x1007951b0 ; 0x1007951b0
0x10031ebc7: lea rax, [rip + 0x862016] ; 0x100b80be4 EnvEvent
0x10031ebce: mov qword ptr [rip + 0x1ad1ea3], rax ; 0x101df0a78
0x10031ebd5: lea rax, [rip + 0x1ad1e94] ; 0x101df0a70
0x10031ebdc: mov qword ptr [rip + 0x1ad1e99], 0 ; 0x101df0a80
0x10031ebe7: mov rcx, qword ptr [rip + 0x95136a] ; 0x100c6ff58
0x10031ebee: mov qword ptr [rip + 0x1ad1e93], rcx ; 0x101df0a88
0x10031ebf5: mov qword ptr [rip + 0x95135c], rax ; 0x100c6ff58
0x10031ebfc: mov qword ptr [rip + 0x1ad1e95], rax ; 0x101df0a98
0x10031ec03: mov rax, qword ptr [rip + 0x8e99de] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x10031ec0a: mov qword ptr [rip + 0x1ad1e8f], rax ; 0x101df0aa0
0x10031ec11: mov qword ptr [rip + 0x1ad1e8c], 0xffffffffffffffff ; 0x101df0aa8
0x10031ec1c: mov qword ptr [rip + 0x1ad1ea1], 0 ; 0x101df0ac8
0x10031ec27: mov rax, qword ptr [rip + 0x8eda82] ; 0x100c0c6b0
0x10031ec2e: add rax, 0x10
0x10031ec32: mov qword ptr [rip + 0x1ad1e37], rax ; 0x101df0a70
0x10031ec39: xor eax, eax
0x10031ec3b: call 0x100011c10 ; 0x100011c10
0x10031ec40: lea rax, [rip + 0x83fd84] ; 0x100b5e9cb Tool_AutoStartEvent
0x10031ec47: vmovq xmm0, rax
0x10031ec4c: lea rax, [rip + 0x83fd8c] ; 0x100b5e9df true
0x10031ec53: vmovq xmm1, rax
0x10031ec58: vmovdqa xmmword ptr [rbp - 0x1e0], xmm1
0x10031ec60: vpunpcklqdq xmm0, xmm0, xmm1
0x10031ec64: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x10031ec69: vmovdqa xmmword ptr [rip + 0x1ad1e5f], xmm0 ; 0x101df0ad0
0x10031ec71: lea rax, [rip + 0x1ad1e58] ; 0x101df0ad0
0x10031ec78: mov rcx, qword ptr [rip + 0x1ad1e01] ; 0x101df0a80
0x10031ec7f: mov qword ptr [rip + 0x1ad1e5a], rcx ; 0x101df0ae0
0x10031ec86: mov qword ptr [rip + 0x1ad1df3], rax ; 0x101df0a80
0x10031ec8d: lea rax, [rip + 0x861f59] ; 0x100b80bed SetEnvDefault
0x10031ec94: mov qword ptr [rip + 0x1ad1e55], rax ; 0x101df0af0
0x10031ec9b: lea rax, [rip + 0x1ad1e46] ; 0x101df0ae8
0x10031eca2: mov qword ptr [rip + 0x1ad1e4b], 0 ; 0x101df0af8
0x10031ecad: mov rcx, qword ptr [rip + 0x9512a4] ; 0x100c6ff58
0x10031ecb4: mov qword ptr [rip + 0x1ad1e45], rcx ; 0x101df0b00
0x10031ecbb: mov qword ptr [rip + 0x951296], rax ; 0x100c6ff58
0x10031ecc2: mov qword ptr [rip + 0x1ad1e47], rax ; 0x101df0b10
0x10031ecc9: mov rax, qword ptr [rip + 0x8e9b20] ; 0x100c087f0 -> 0x10031d1e0 __Z18GetMetaClassByTypeIP8EnvEventERK9MetaClassv
0x10031ecd0: mov qword ptr [rip + 0x1ad1e41], rax ; 0x101df0b18
0x10031ecd7: mov qword ptr [rip + 0x1ad1e3e], 0xffffffffffffffff ; 0x101df0b20
0x10031ece2: mov qword ptr [rip + 0x1ad1e53], 0 ; 0x101df0b40
0x10031eced: mov rax, qword ptr [rip + 0x8ec594] ; 0x100c0b288
0x10031ecf4: add rax, 0x10
0x10031ecf8: mov qword ptr [rip + 0x1ad1de9], rax ; 0x101df0ae8
0x10031ecff: xor eax, eax
0x10031ed01: call 0x100011c10 ; 0x100011c10
0x10031ed06: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10031ed0b: vmovaps xmmword ptr [rip + 0x1ad1e3d], xmm0 ; 0x101df0b50
0x10031ed13: lea rax, [rip + 0x1ad1e36] ; 0x101df0b50
0x10031ed1a: mov rcx, qword ptr [rip + 0x1ad1dd7] ; 0x101df0af8
0x10031ed21: mov qword ptr [rip + 0x1ad1e38], rcx ; 0x101df0b60
0x10031ed28: mov qword ptr [rip + 0x1ad1dc9], rax ; 0x101df0af8
0x10031ed2f: lea rax, [rip + 0x845849] ; 0x100b6457f HotDate
0x10031ed36: mov qword ptr [rip + 0x1ad1e2b], rax ; 0x101df0b68
0x10031ed3d: lea rax, [rip + 0x1ad1e24] ; 0x101df0b68
0x10031ed44: mov qword ptr [rip + 0x1ad1e21], 0 ; 0x101df0b70
0x10031ed4f: mov rcx, qword ptr [rip + 0x95120a] ; 0x100c6ff60
0x10031ed56: mov qword ptr [rip + 0x1ad1e1b], rcx ; 0x101df0b78
0x10031ed5d: mov qword ptr [rip + 0x9511fc], rax ; 0x100c6ff60
0x10031ed64: lea rax, [rip - 0x33bb] ; 0x10031b9b0
0x10031ed6b: vmovq xmm0, rax
0x10031ed70: vmovdqu xmmword ptr [rip + 0x1ad1e28], xmm0 ; 0x101df0ba0
0x10031ed78: mov rax, qword ptr [rip + 0x8e6cc1] ; 0x100c05a40 -> 0x10031d8f0 __Z12ApplyWrapperI13SetEnvDefaultMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10031ed7f: mov qword ptr [rip + 0x1ad1e2a], rax ; 0x101df0bb0
0x10031ed86: mov rax, qword ptr [rip + 0x8ea543] ; 0x100c092d0 -> 0x10031d950 __Z21InitFunctionSignatureIM13SetEnvDefaultFvvEEvP17FunctionSignature
0x10031ed8d: mov qword ptr [rip + 0x1ad1e24], rax ; 0x101df0bb8
0x10031ed94: mov rax, qword ptr [rip + 0x8e8e8d] ; 0x100c07c28 -> 0x10031d8e0 __Z18GetMetaClassByTypeIP13SetEnvDefaultERK9MetaClassv
0x10031ed9b: lea rcx, [rip + 0x842e38] ; 0x100b61bda sunAngleY
0x10031eda2: mov qword ptr [rip + 0x98a207], rcx ; 0x100ca8fb0
0x10031eda9: lea rcx, [rip + 0x98a200] ; 0x100ca8fb0
0x10031edb0: mov rdx, qword ptr [rip + 0x958ea9] ; 0x100c77c60
0x10031edb7: mov qword ptr [rip + 0x98a202], rdx ; 0x100ca8fc0
0x10031edbe: mov qword ptr [rip + 0x98a207], 0x40 ; 0x100ca8fd0
0x10031edc9: mov r14, qword ptr [rip + 0x8e8790] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x10031edd0: mov qword ptr [rip + 0x98a201], r14 ; 0x100ca8fd8
0x10031edd7: mov qword ptr [rip + 0x98a202], rax ; 0x100ca8fe0
0x10031edde: mov qword ptr [rip + 0x98a1ff], 0xffffffffffffffff ; 0x100ca8fe8
0x10031ede9: lea rbx, [rip - 0x3053d0] ; 0x100019a20
0x10031edf0: mov qword ptr [rip + 0x98a1f9], rbx ; 0x100ca8ff0
0x10031edf7: mov qword ptr [rip + 0x98a1f6], 0 ; 0x100ca8ff8
0x10031ee02: lea rdx, [rip + 0x1ad1dc7] ; 0x101df0bd0
0x10031ee09: lea rsi, [rip + 0x861deb] ; 0x100b80bfb 45.0
0x10031ee10: vmovq xmm0, rsi
0x10031ee15: lea rsi, [rip + 0x83fbe6] ; 0x100b5ea02 Tool_DefaultValue
0x10031ee1c: vmovq xmm1, rsi
0x10031ee21: vpunpcklqdq xmm0, xmm1, xmm0
0x10031ee25: vmovdqa xmm5, xmm1
0x10031ee29: vmovdqa xmmword ptr [rbp - 0x280], xmm0
0x10031ee31: vmovdqa xmmword ptr [rip + 0x1ad1db7], xmm0 ; 0x101df0bf0
0x10031ee39: lea rsi, [rip + 0x1ad1db0] ; 0x101df0bf0
0x10031ee40: mov qword ptr [rip + 0x1ad1db9], rdx ; 0x101df0c00
0x10031ee47: mov qword ptr [rip + 0x98a16a], rsi ; 0x100ca8fb8
0x10031ee4e: lea rdx, [rip + 0x842d8f] ; 0x100b61be4 sunAngleXZ
0x10031ee55: mov qword ptr [rip + 0x98a1a4], rdx ; 0x100ca9000
0x10031ee5c: lea rdx, [rip + 0x98a19d] ; 0x100ca9000
0x10031ee63: mov qword ptr [rip + 0x98a1a6], rcx ; 0x100ca9010
0x10031ee6a: mov qword ptr [rip + 0x98a1ab], 0x44 ; 0x100ca9020
0x10031ee75: mov qword ptr [rip + 0x98a1ac], r14 ; 0x100ca9028
0x10031ee7c: mov qword ptr [rip + 0x98a1ad], rax ; 0x100ca9030
0x10031ee83: mov qword ptr [rip + 0x98a1aa], 0xffffffffffffffff ; 0x100ca9038
0x10031ee8e: mov qword ptr [rip + 0x98a1ab], rbx ; 0x100ca9040
0x10031ee95: mov qword ptr [rip + 0x98a1a8], 0 ; 0x100ca9048
0x10031eea0: lea rcx, [rip + 0x1ad1d69] ; 0x101df0c10
0x10031eea7: lea rsi, [rip + 0x855266] ; 0x100b74114 0.0
0x10031eeae: vmovq xmm0, rsi
0x10031eeb3: vpunpcklqdq xmm0, xmm5, xmm0
0x10031eeb7: vmovdqa xmmword ptr [rip + 0x1ad1d71], xmm0 ; 0x101df0c30
0x10031eebf: vmovdqa xmm8, xmm0
0x10031eec3: lea rsi, [rip + 0x1ad1d66] ; 0x101df0c30
0x10031eeca: mov qword ptr [rip + 0x1ad1d6f], rcx ; 0x101df0c40
0x10031eed1: mov qword ptr [rip + 0x98a130], rsi ; 0x100ca9008
0x10031eed8: lea rcx, [rip + 0x842d10] ; 0x100b61bef sunColor
0x10031eedf: mov qword ptr [rip + 0x98a16a], rcx ; 0x100ca9050
0x10031eee6: lea rcx, [rip + 0x98a163] ; 0x100ca9050
0x10031eeed: mov qword ptr [rip + 0x98a16c], rdx ; 0x100ca9060
0x10031eef4: mov qword ptr [rip + 0x98a171], 0x50 ; 0x100ca9070
0x10031eeff: mov r15, qword ptr [rip + 0x8e7e62] ; 0x100c06d68 -> 0x1000662a0 __Z17GetMetaTypeByTypeI5ColorERK8MetaTypev
0x10031ef06: mov qword ptr [rip + 0x98a16b], r15 ; 0x100ca9078
0x10031ef0d: mov qword ptr [rip + 0x98a16c], rax ; 0x100ca9080
0x10031ef14: mov qword ptr [rip + 0x98a169], 0xffffffffffffffff ; 0x100ca9088
0x10031ef1f: mov qword ptr [rip + 0x98a16a], rbx ; 0x100ca9090
0x10031ef26: mov qword ptr [rip + 0x98a167], 0 ; 0x100ca9098
0x10031ef31: lea rdx, [rip + 0x1ad1d18] ; 0x101df0c50
0x10031ef38: lea rsi, [rip + 0x85e860] ; 0x100b7d79f Tool_IsColor
0x10031ef3f: vmovq xmm0, rsi
0x10031ef44: vpunpcklqdq xmm0, xmm0, xmmword ptr [rbp - 0x1e0]
0x10031ef4c: vmovdqa xmmword ptr [rip + 0x1ad1d1c], xmm0 ; 0x101df0c70
0x10031ef54: vmovdqa xmm3, xmm0
0x10031ef58: lea rsi, [rip + 0x1ad1d11] ; 0x101df0c70
0x10031ef5f: mov qword ptr [rip + 0x1ad1d1a], rdx ; 0x101df0c80
0x10031ef66: lea rdx, [rip + 0x861c93] ; 0x100b80c00 (1.0, 1.0, 1.0)
0x10031ef6d: vmovq xmm0, rdx
0x10031ef72: vpunpcklqdq xmm0, xmm5, xmm0
0x10031ef76: vmovdqa xmmword ptr [rbp - 0x270], xmm0
0x10031ef7e: vmovdqa xmmword ptr [rip + 0x1ad1d0a], xmm0 ; 0x101df0c90
0x10031ef86: lea rdx, [rip + 0x1ad1d03] ; 0x101df0c90
0x10031ef8d: mov qword ptr [rip + 0x1ad1d0c], rsi ; 0x101df0ca0
0x10031ef94: mov qword ptr [rip + 0x98a0bd], rdx ; 0x100ca9058
0x10031ef9b: lea rdx, [rip + 0x842c56] ; 0x100b61bf8 sunSize
0x10031efa2: mov qword ptr [rip + 0x98a0f7], rdx ; 0x100ca90a0
0x10031efa9: lea rdx, [rip + 0x98a0f0] ; 0x100ca90a0
0x10031efb0: mov qword ptr [rip + 0x98a0f9], rcx ; 0x100ca90b0
0x10031efb7: mov qword ptr [rip + 0x98a0fe], 0x60 ; 0x100ca90c0
0x10031efc2: mov qword ptr [rip + 0x98a0ff], r14 ; 0x100ca90c8
0x10031efc9: mov qword ptr [rip + 0x98a100], rax ; 0x100ca90d0
0x10031efd0: mov qword ptr [rip + 0x98a0fd], 0xffffffffffffffff ; 0x100ca90d8
0x10031efdb: mov qword ptr [rip + 0x98a0fe], rbx ; 0x100ca90e0
0x10031efe2: mov qword ptr [rip + 0x98a0fb], 0 ; 0x100ca90e8
0x10031efed: lea rcx, [rip + 0x1ad1cbc] ; 0x101df0cb0
0x10031eff4: lea rsi, [rip + 0x855153] ; 0x100b7414e 1.0
0x10031effb: vmovq xmm0, rsi
0x10031f000: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f004: vmovdqa xmmword ptr [rip + 0x1ad1cc4], xmm0 ; 0x101df0cd0
0x10031f00c: lea rsi, [rip + 0x1ad1cbd] ; 0x101df0cd0
0x10031f013: mov qword ptr [rip + 0x1ad1cc6], rcx ; 0x101df0ce0
0x10031f01a: mov qword ptr [rip + 0x98a087], rsi ; 0x100ca90a8
0x10031f021: lea rcx, [rip + 0x842bd8] ; 0x100b61c00 sunInt
0x10031f028: mov qword ptr [rip + 0x98a0c1], rcx ; 0x100ca90f0
0x10031f02f: lea rcx, [rip + 0x98a0ba] ; 0x100ca90f0
0x10031f036: mov qword ptr [rip + 0x98a0c3], rdx ; 0x100ca9100
0x10031f03d: mov qword ptr [rip + 0x98a0c8], 0x64 ; 0x100ca9110
0x10031f048: mov qword ptr [rip + 0x98a0c9], r14 ; 0x100ca9118
0x10031f04f: mov qword ptr [rip + 0x98a0ca], rax ; 0x100ca9120
0x10031f056: mov qword ptr [rip + 0x98a0c7], 0xffffffffffffffff ; 0x100ca9128
0x10031f061: mov qword ptr [rip + 0x98a0c8], rbx ; 0x100ca9130
0x10031f068: mov qword ptr [rip + 0x98a0c5], 0 ; 0x100ca9138
0x10031f073: lea rdx, [rip + 0x1ad1c76] ; 0x101df0cf0
0x10031f07a: vmovdqa xmmword ptr [rip + 0x1ad1c8e], xmm0 ; 0x101df0d10
0x10031f082: vmovdqa xmm9, xmm0
0x10031f086: mov qword ptr [rip + 0x1ad1c93], rdx ; 0x101df0d20
0x10031f08d: lea rdx, [rip + 0x1ad1c7c] ; 0x101df0d10
0x10031f094: mov qword ptr [rip + 0x98a05d], rdx ; 0x100ca90f8
0x10031f09b: lea rdx, [rip + 0x842b65] ; 0x100b61c07 sunToMoon
0x10031f0a2: mov qword ptr [rip + 0x98a097], rdx ; 0x100ca9140
0x10031f0a9: mov qword ptr [rip + 0x98a0a0], rcx ; 0x100ca9150
0x10031f0b0: mov qword ptr [rip + 0x98a0a5], 0x68 ; 0x100ca9160
0x10031f0bb: mov qword ptr [rip + 0x98a0a6], r14 ; 0x100ca9168
0x10031f0c2: mov qword ptr [rip + 0x98a0a7], rax ; 0x100ca9170
0x10031f0c9: mov qword ptr [rip + 0x98a0a4], 0xffffffffffffffff ; 0x100ca9178
0x10031f0d4: mov qword ptr [rip + 0x98a0a5], rbx ; 0x100ca9180
0x10031f0db: mov qword ptr [rip + 0x98a0a2], 0 ; 0x100ca9188
0x10031f0e6: lea rcx, [rip + 0x1ad1c43] ; 0x101df0d30
0x10031f0ed: vmovdqa xmmword ptr [rip + 0x1ad1c5b], xmm8 ; 0x101df0d50
0x10031f0f5: mov qword ptr [rip + 0x1ad1c64], rcx ; 0x101df0d60
0x10031f0fc: lea rcx, [rip + 0x1ad1c4d] ; 0x101df0d50
0x10031f103: mov qword ptr [rip + 0x98a03e], rcx ; 0x100ca9148
0x10031f10a: lea rcx, [rip + 0x842b00] ; 0x100b61c11 moonPhase
0x10031f111: mov qword ptr [rip + 0x98a078], rcx ; 0x100ca9190
0x10031f118: lea rcx, [rip + 0x98a021] ; 0x100ca9140
0x10031f11f: mov qword ptr [rip + 0x98a07a], rcx ; 0x100ca91a0
0x10031f126: lea rcx, [rip + 0x856309] ; 0x100b75436 0.5
0x10031f12d: vmovq xmm0, rcx
0x10031f132: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f136: vmovdqa xmmword ptr [rip + 0x1ad1c52], xmm0 ; 0x101df0d90
0x10031f13e: vmovdqa xmm6, xmm0
0x10031f142: vmovdqa xmmword ptr [rbp - 0x100], xmm6
0x10031f14a: lea rcx, [rip + 0x1ad1c1f] ; 0x101df0d70
0x10031f151: mov qword ptr [rip + 0x1ad1c48], rcx ; 0x101df0da0
0x10031f158: mov qword ptr [rip + 0x98a04d], 0x6c ; 0x100ca91b0
0x10031f163: mov qword ptr [rip + 0x98a04e], r14 ; 0x100ca91b8
0x10031f16a: mov qword ptr [rip + 0x98a04f], rax ; 0x100ca91c0
0x10031f171: mov qword ptr [rip + 0x98a04c], 0xffffffffffffffff ; 0x100ca91c8
0x10031f17c: mov qword ptr [rip + 0x98a04d], rbx ; 0x100ca91d0
0x10031f183: mov qword ptr [rip + 0x98a04a], 0 ; 0x100ca91d8
0x10031f18e: lea rcx, [rip + 0x1ad1bfb] ; 0x101df0d90
0x10031f195: mov qword ptr [rip + 0x989ffc], rcx ; 0x100ca9198
0x10031f19c: lea rcx, [rip + 0x842a84] ; 0x100b61c27 tintTop
0x10031f1a3: mov qword ptr [rip + 0x98a036], rcx ; 0x100ca91e0
0x10031f1aa: lea rcx, [rip + 0x989fdf] ; 0x100ca9190
0x10031f1b1: mov qword ptr [rip + 0x98a038], rcx ; 0x100ca91f0
0x10031f1b8: vmovdqa xmmword ptr [rip + 0x1ad1c10], xmm3 ; 0x101df0dd0
0x10031f1c0: lea rcx, [rip + 0x1ad1be9] ; 0x101df0db0
0x10031f1c7: mov qword ptr [rip + 0x1ad1c12], rcx ; 0x101df0de0
0x10031f1ce: lea rcx, [rip + 0x861a3f] ; 0x100b80c14 (0.0707403, 0.250495, 1.0)
0x10031f1d5: vmovq xmm0, rcx
0x10031f1da: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f1de: vmovdqa xmmword ptr [rip + 0x1ad1c0a], xmm0 ; 0x101df0df0
0x10031f1e6: vmovdqa xmm10, xmm0
0x10031f1ea: vmovdqa xmmword ptr [rbp - 0xc0], xmm10
0x10031f1f2: lea rcx, [rip + 0x1ad1bd7] ; 0x101df0dd0
0x10031f1f9: mov qword ptr [rip + 0x1ad1c00], rcx ; 0x101df0e00
0x10031f200: mov qword ptr [rip + 0x989ff5], 0x70 ; 0x100ca9200
0x10031f20b: mov qword ptr [rip + 0x989ff6], r15 ; 0x100ca9208
0x10031f212: mov qword ptr [rip + 0x989ff7], rax ; 0x100ca9210
0x10031f219: mov qword ptr [rip + 0x989ff4], 0xffffffffffffffff ; 0x100ca9218
0x10031f224: mov qword ptr [rip + 0x989ff5], rbx ; 0x100ca9220
0x10031f22b: mov qword ptr [rip + 0x989ff2], 0 ; 0x100ca9228
0x10031f236: lea rcx, [rip + 0x1ad1bb3] ; 0x101df0df0
0x10031f23d: mov qword ptr [rip + 0x989fa4], rcx ; 0x100ca91e8
0x10031f244: lea rcx, [rip + 0x8429e4] ; 0x100b61c2f tintMidTop
0x10031f24b: mov qword ptr [rip + 0x989fde], rcx ; 0x100ca9230
0x10031f252: lea rcx, [rip + 0x989f87] ; 0x100ca91e0
0x10031f259: mov qword ptr [rip + 0x989fe0], rcx ; 0x100ca9240
0x10031f260: vmovdqa xmmword ptr [rip + 0x1ad1bc8], xmm3 ; 0x101df0e30
0x10031f268: lea rcx, [rip + 0x1ad1ba1] ; 0x101df0e10
0x10031f26f: mov qword ptr [rip + 0x1ad1bca], rcx ; 0x101df0e40
0x10031f276: lea rcx, [rip + 0x8619b2] ; 0x100b80c2f (0.0707403, 0.654936, 1.0)
0x10031f27d: vmovq xmm0, rcx
0x10031f282: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f286: vmovdqa xmmword ptr [rip + 0x1ad1bc2], xmm0 ; 0x101df0e50
0x10031f28e: vmovdqa xmm11, xmm0
0x10031f292: vmovdqa xmmword ptr [rbp - 0xf0], xmm11
0x10031f29a: lea rcx, [rip + 0x1ad1b8f] ; 0x101df0e30
0x10031f2a1: mov qword ptr [rip + 0x1ad1bb8], rcx ; 0x101df0e60
0x10031f2a8: mov qword ptr [rip + 0x989f9d], 0x80 ; 0x100ca9250
0x10031f2b3: mov qword ptr [rip + 0x989f9e], r15 ; 0x100ca9258
0x10031f2ba: mov qword ptr [rip + 0x989f9f], rax ; 0x100ca9260
0x10031f2c1: mov qword ptr [rip + 0x989f9c], 0xffffffffffffffff ; 0x100ca9268
0x10031f2cc: mov qword ptr [rip + 0x989f9d], rbx ; 0x100ca9270
0x10031f2d3: mov qword ptr [rip + 0x989f9a], 0 ; 0x100ca9278
0x10031f2de: lea rcx, [rip + 0x1ad1b6b] ; 0x101df0e50
0x10031f2e5: mov qword ptr [rip + 0x989f4c], rcx ; 0x100ca9238
0x10031f2ec: lea rcx, [rip + 0x842947] ; 0x100b61c3a tintMidMid
0x10031f2f3: mov qword ptr [rip + 0x989f86], rcx ; 0x100ca9280
0x10031f2fa: lea rcx, [rip + 0x989f2f] ; 0x100ca9230
0x10031f301: mov qword ptr [rip + 0x989f88], rcx ; 0x100ca9290
0x10031f308: vmovdqa xmmword ptr [rip + 0x1ad1b80], xmm3 ; 0x101df0e90
0x10031f310: lea rcx, [rip + 0x1ad1b59] ; 0x101df0e70
0x10031f317: mov qword ptr [rip + 0x1ad1b82], rcx ; 0x101df0ea0
0x10031f31e: lea rcx, [rip + 0x861925] ; 0x100b80c4a (1.0, 1.0, 0.0707403)
0x10031f325: vmovq xmm0, rcx
0x10031f32a: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f32e: vmovdqa xmmword ptr [rip + 0x1ad1b7a], xmm0 ; 0x101df0eb0
0x10031f336: vmovdqa xmm12, xmm0
0x10031f33a: vmovdqa xmmword ptr [rbp - 0xe0], xmm12
0x10031f342: lea rcx, [rip + 0x1ad1b47] ; 0x101df0e90
0x10031f349: mov qword ptr [rip + 0x1ad1b70], rcx ; 0x101df0ec0
0x10031f350: mov qword ptr [rip + 0x989f45], 0x90 ; 0x100ca92a0
0x10031f35b: mov qword ptr [rip + 0x989f46], r15 ; 0x100ca92a8
0x10031f362: mov qword ptr [rip + 0x989f47], rax ; 0x100ca92b0
0x10031f369: mov qword ptr [rip + 0x989f44], 0xffffffffffffffff ; 0x100ca92b8
0x10031f374: mov qword ptr [rip + 0x989f45], rbx ; 0x100ca92c0
0x10031f37b: mov qword ptr [rip + 0x989f42], 0 ; 0x100ca92c8
0x10031f386: lea rcx, [rip + 0x1ad1b23] ; 0x101df0eb0
0x10031f38d: mov qword ptr [rip + 0x989ef4], rcx ; 0x100ca9288
0x10031f394: lea rcx, [rip + 0x8428aa] ; 0x100b61c45 tintMidBot
0x10031f39b: mov qword ptr [rip + 0x989f2e], rcx ; 0x100ca92d0
0x10031f3a2: lea rcx, [rip + 0x989ed7] ; 0x100ca9280
0x10031f3a9: mov qword ptr [rip + 0x989f30], rcx ; 0x100ca92e0
0x10031f3b0: vmovdqa xmmword ptr [rip + 0x1ad1b38], xmm3 ; 0x101df0ef0
0x10031f3b8: lea rcx, [rip + 0x1ad1b11] ; 0x101df0ed0
0x10031f3bf: mov qword ptr [rip + 0x1ad1b3a], rcx ; 0x101df0f00
0x10031f3c6: lea rcx, [rip + 0x861893] ; 0x100b80c60 (1.0, 0.387623, 0.0707403)
0x10031f3cd: vmovq xmm0, rcx
0x10031f3d2: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f3d6: vmovdqa xmmword ptr [rip + 0x1ad1b32], xmm0 ; 0x101df0f10
0x10031f3de: vmovdqa xmm13, xmm0
0x10031f3e2: vmovdqa xmmword ptr [rbp - 0xd0], xmm13
0x10031f3ea: lea rcx, [rip + 0x1ad1aff] ; 0x101df0ef0
0x10031f3f1: mov qword ptr [rip + 0x1ad1b28], rcx ; 0x101df0f20
0x10031f3f8: mov qword ptr [rip + 0x989eed], 0xa0 ; 0x100ca92f0
0x10031f403: mov qword ptr [rip + 0x989eee], r15 ; 0x100ca92f8
0x10031f40a: mov qword ptr [rip + 0x989eef], rax ; 0x100ca9300
0x10031f411: mov qword ptr [rip + 0x989eec], 0xffffffffffffffff ; 0x100ca9308
0x10031f41c: mov qword ptr [rip + 0x989eed], rbx ; 0x100ca9310
0x10031f423: mov qword ptr [rip + 0x989eea], 0 ; 0x100ca9318
0x10031f42e: lea rcx, [rip + 0x1ad1adb] ; 0x101df0f10
0x10031f435: mov qword ptr [rip + 0x989e9c], rcx ; 0x100ca92d8
0x10031f43c: lea rcx, [rip + 0x84280d] ; 0x100b61c50 tintBot
0x10031f443: mov qword ptr [rip + 0x989ed6], rcx ; 0x100ca9320
0x10031f44a: lea rcx, [rip + 0x989e7f] ; 0x100ca92d0
0x10031f451: mov qword ptr [rip + 0x989ed8], rcx ; 0x100ca9330
0x10031f458: vmovdqa xmmword ptr [rip + 0x1ad1af0], xmm3 ; 0x101df0f50
0x10031f460: lea rcx, [rip + 0x1ad1ac9] ; 0x101df0f30
0x10031f467: mov qword ptr [rip + 0x1ad1af2], rcx ; 0x101df0f60
0x10031f46e: lea rcx, [rip + 0x861806] ; 0x100b80c7b (1.0, 0.0707403, 0.0707403)
0x10031f475: vmovq xmm0, rcx
0x10031f47a: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f47e: vmovdqa xmmword ptr [rip + 0x1ad1aea], xmm0 ; 0x101df0f70
0x10031f486: vmovdqa xmm7, xmm0
0x10031f48a: vmovdqa xmmword ptr [rbp - 0x110], xmm7
0x10031f492: lea rcx, [rip + 0x1ad1ab7] ; 0x101df0f50
0x10031f499: mov qword ptr [rip + 0x1ad1ae0], rcx ; 0x101df0f80
0x10031f4a0: mov qword ptr [rip + 0x989e95], 0xb0 ; 0x100ca9340
0x10031f4ab: mov qword ptr [rip + 0x989e96], r15 ; 0x100ca9348
0x10031f4b2: mov qword ptr [rip + 0x989e97], rax ; 0x100ca9350
0x10031f4b9: mov qword ptr [rip + 0x989e94], 0xffffffffffffffff ; 0x100ca9358
0x10031f4c4: mov qword ptr [rip + 0x989e95], rbx ; 0x100ca9360
0x10031f4cb: mov qword ptr [rip + 0x989e92], 0 ; 0x100ca9368
0x10031f4d6: lea rcx, [rip + 0x1ad1a93] ; 0x101df0f70
0x10031f4dd: mov qword ptr [rip + 0x989e44], rcx ; 0x100ca9328
0x10031f4e4: lea rcx, [rip + 0x84276d] ; 0x100b61c58 atmosphereDensity
0x10031f4eb: mov qword ptr [rip + 0x989e7e], rcx ; 0x100ca9370
0x10031f4f2: lea rcx, [rip + 0x989e27] ; 0x100ca9320
0x10031f4f9: mov qword ptr [rip + 0x989e80], rcx ; 0x100ca9380
0x10031f500: vmovdqa xmmword ptr [rip + 0x1ad1aa8], xmm9 ; 0x101df0fb0
0x10031f508: lea rcx, [rip + 0x1ad1a81] ; 0x101df0f90
0x10031f50f: mov qword ptr [rip + 0x1ad1aaa], rcx ; 0x101df0fc0
0x10031f516: mov qword ptr [rip + 0x989e6f], 0xc0 ; 0x100ca9390
0x10031f521: mov qword ptr [rip + 0x989e70], r14 ; 0x100ca9398
0x10031f528: mov qword ptr [rip + 0x989e71], rax ; 0x100ca93a0
0x10031f52f: mov qword ptr [rip + 0x989e6e], 0xffffffffffffffff ; 0x100ca93a8
0x10031f53a: mov qword ptr [rip + 0x989e6f], rbx ; 0x100ca93b0
0x10031f541: mov qword ptr [rip + 0x989e6c], 0 ; 0x100ca93b8
0x10031f54c: lea rcx, [rip + 0x1ad1a5d] ; 0x101df0fb0
0x10031f553: mov qword ptr [rip + 0x989e1e], rcx ; 0x100ca9378
0x10031f55a: lea rcx, [rip + 0x842709] ; 0x100b61c6a cheapFogEnabled
0x10031f561: mov qword ptr [rip + 0x989e58], rcx ; 0x100ca93c0
0x10031f568: lea rcx, [rip + 0x989e01] ; 0x100ca9370
0x10031f56f: mov qword ptr [rip + 0x989e5a], rcx ; 0x100ca93d0
0x10031f576: lea rcx, [rip + 0x883aaf] ; 0x100ba302c false
0x10031f57d: vmovq xmm0, rcx
0x10031f582: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f586: vmovdqa xmmword ptr [rbp - 0x210], xmm0
0x10031f58e: vmovdqa xmmword ptr [rip + 0x1ad1a5a], xmm0 ; 0x101df0ff0
0x10031f596: lea rcx, [rip + 0x1ad1a33] ; 0x101df0fd0
0x10031f59d: mov qword ptr [rip + 0x1ad1a5c], rcx ; 0x101df1000
0x10031f5a4: mov qword ptr [rip + 0x989e31], 0xc4 ; 0x100ca93e0
0x10031f5af: mov rcx, qword ptr [rip + 0x8e7fa2] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10031f5b6: mov qword ptr [rip + 0x989e2b], rcx ; 0x100ca93e8
0x10031f5bd: mov qword ptr [rip + 0x989e2c], rax ; 0x100ca93f0
0x10031f5c4: mov qword ptr [rip + 0x989e29], 0xffffffffffffffff ; 0x100ca93f8
0x10031f5cf: mov qword ptr [rip + 0x989e2a], rbx ; 0x100ca9400
0x10031f5d6: mov qword ptr [rip + 0x989e27], 0 ; 0x100ca9408
0x10031f5e1: lea rcx, [rip + 0x1ad1a08] ; 0x101df0ff0
0x10031f5e8: mov qword ptr [rip + 0x989dd9], rcx ; 0x100ca93c8
0x10031f5ef: lea rcx, [rip + 0x84270b] ; 0x100b61d01 cheapFogNear
0x10031f5f6: mov qword ptr [rip + 0x989e13], rcx ; 0x100ca9410
0x10031f5fd: lea rcx, [rip + 0x989dbc] ; 0x100ca93c0
0x10031f604: mov qword ptr [rip + 0x989e15], rcx ; 0x100ca9420
0x10031f60b: lea rcx, [rip + 0x8616c6] ; 0x100b80cd8 0.03
0x10031f612: vmovq xmm0, rcx
0x10031f617: lea rcx, [rip + 0x8616da] ; 0x100b80cf8 (0.25, 0.5)
0x10031f61e: vmovq xmm1, rcx
0x10031f623: lea rcx, [rip + 0x85964e] ; 0x100b78c78 Tool_MinMaxValues
0x10031f62a: vmovq xmm2, rcx
0x10031f62f: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f633: vmovdqa xmmword ptr [rip + 0x1ad1e15], xmm0 ; 0x101df1450
0x10031f63b: lea rcx, [rip + 0x8616cf] ; 0x100b80d11 (0.0, 0.9)
0x10031f642: vmovq xmm0, rcx
0x10031f647: vpunpcklqdq xmm4, xmm2, xmm1
0x10031f64b: vmovdqa xmmword ptr [rbp - 0x230], xmm4
0x10031f653: vpunpcklqdq xmm1, xmm2, xmm0
0x10031f657: vmovdqa xmmword ptr [rbp - 0x250], xmm1
0x10031f65f: lea rcx, [rip + 0x861635] ; 0x100b80c9b 30.0
0x10031f666: vmovq xmm0, rcx
0x10031f66b: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f66f: vmovdqa xmmword ptr [rbp - 0x150], xmm0
0x10031f677: vmovdqa xmmword ptr [rip + 0x1ad19b1], xmm0 ; 0x101df1030
0x10031f67f: lea rcx, [rip + 0x1ad198a] ; 0x101df1010
0x10031f686: mov qword ptr [rip + 0x1ad19b3], rcx ; 0x101df1040
0x10031f68d: mov qword ptr [rip + 0x989d98], 0xc8 ; 0x100ca9430
0x10031f698: mov qword ptr [rip + 0x989d99], r14 ; 0x100ca9438
0x10031f69f: mov qword ptr [rip + 0x989d9a], rax ; 0x100ca9440
0x10031f6a6: mov qword ptr [rip + 0x989d97], 0xffffffffffffffff ; 0x100ca9448
0x10031f6b1: mov qword ptr [rip + 0x989d98], rbx ; 0x100ca9450
0x10031f6b8: mov qword ptr [rip + 0x989d95], 0 ; 0x100ca9458
0x10031f6c3: lea rcx, [rip + 0x1ad1966] ; 0x101df1030
0x10031f6ca: mov qword ptr [rip + 0x989d47], rcx ; 0x100ca9418
0x10031f6d1: lea r13, [rip + 0x842636] ; 0x100b61d0e cheapFogFar
0x10031f6d8: mov qword ptr [rip + 0x989d81], r13 ; 0x100ca9460
0x10031f6df: lea rcx, [rip + 0x989d2a] ; 0x100ca9410
0x10031f6e6: mov qword ptr [rip + 0x989d83], rcx ; 0x100ca9470
0x10031f6ed: lea rcx, [rip + 0x8615ac] ; 0x100b80ca0 3000.0
0x10031f6f4: vmovq xmm0, rcx
0x10031f6f9: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f6fd: vmovdqa xmmword ptr [rbp - 0x160], xmm0
0x10031f705: vmovdqa xmmword ptr [rip + 0x1ad1963], xmm0 ; 0x101df1070
0x10031f70d: lea rcx, [rip + 0x1ad193c] ; 0x101df1050
0x10031f714: mov qword ptr [rip + 0x1ad1965], rcx ; 0x101df1080
0x10031f71b: mov qword ptr [rip + 0x989d5a], 0xcc ; 0x100ca9480
0x10031f726: mov qword ptr [rip + 0x989d5b], r14 ; 0x100ca9488
0x10031f72d: mov qword ptr [rip + 0x989d5c], rax ; 0x100ca9490
0x10031f734: mov qword ptr [rip + 0x989d59], 0xffffffffffffffff ; 0x100ca9498
0x10031f73f: mov qword ptr [rip + 0x989d5a], rbx ; 0x100ca94a0
0x10031f746: mov qword ptr [rip + 0x989d57], 0 ; 0x100ca94a8
0x10031f751: lea rcx, [rip + 0x1ad1918] ; 0x101df1070
0x10031f758: mov qword ptr [rip + 0x989d09], rcx ; 0x100ca9468
0x10031f75f: lea r12, [rip + 0x8425b4] ; 0x100b61d1a cheapFogLumReduction
0x10031f766: mov qword ptr [rip + 0x989d43], r12 ; 0x100ca94b0
0x10031f76d: lea rcx, [rip + 0x989cec] ; 0x100ca9460
0x10031f774: mov qword ptr [rip + 0x989d45], rcx ; 0x100ca94c0
0x10031f77b: lea rcx, [rip + 0x85e4d1] ; 0x100b7dc53 0.8
0x10031f782: vmovq xmm0, rcx
0x10031f787: vpunpcklqdq xmm0, xmm5, xmm0
0x10031f78b: vmovdqa xmmword ptr [rbp - 0x170], xmm0
0x10031f793: vmovdqa xmmword ptr [rip + 0x1ad1915], xmm0 ; 0x101df10b0
0x10031f79b: lea rcx, [rip + 0x1ad18ee] ; 0x101df1090
0x10031f7a2: mov qword ptr [rip + 0x1ad1917], rcx ; 0x101df10c0
0x10031f7a9: mov qword ptr [rip + 0x989d1c], 0xd0 ; 0x100ca94d0
0x10031f7b4: mov qword ptr [rip + 0x989d1d], r14 ; 0x100ca94d8
0x10031f7bb: mov qword ptr [rip + 0x989d1e], rax ; 0x100ca94e0
0x10031f7c2: mov qword ptr [rip + 0x989d1b], 0xffffffffffffffff ; 0x100ca94e8
0x10031f7cd: mov qword ptr [rip + 0x989d1c], rbx ; 0x100ca94f0
0x10031f7d4: mov qword ptr [rip + 0x989d19], 0 ; 0x100ca94f8
0x10031f7df: lea rcx, [rip + 0x1ad18ca] ; 0x101df10b0
0x10031f7e6: mov qword ptr [rip + 0x989ccb], rcx ; 0x100ca94b8
0x10031f7ed: lea rcx, [rip + 0x84253b] ; 0x100b61d2f cheapFogHeight
0x10031f7f4: mov qword ptr [rip + 0x989d05], rcx ; 0x100ca9500
0x10031f7fb: lea rcx, [rip + 0x989cae] ; 0x100ca94b0
0x10031f802: mov qword ptr [rip + 0x989d07], rcx ; 0x100ca9510
0x10031f809: vmovdqa xmmword ptr [rip + 0x1ad18df], xmm6 ; 0x101df10f0
0x10031f811: lea rcx, [rip + 0x1ad18b8] ; 0x101df10d0
0x10031f818: mov qword ptr [rip + 0x1ad18e1], rcx ; 0x101df1100
0x10031f81f: mov qword ptr [rip + 0x989cf6], 0xd4 ; 0x100ca9520
0x10031f82a: mov qword ptr [rip + 0x989cf7], r14 ; 0x100ca9528
0x10031f831: mov qword ptr [rip + 0x989cf8], rax ; 0x100ca9530
0x10031f838: mov qword ptr [rip + 0x989cf5], 0xffffffffffffffff ; 0x100ca9538
0x10031f843: mov qword ptr [rip + 0x989cf6], rbx ; 0x100ca9540
0x10031f84a: mov qword ptr [rip + 0x989cf3], 0 ; 0x100ca9548
0x10031f855: lea rcx, [rip + 0x1ad1894] ; 0x101df10f0
0x10031f85c: mov qword ptr [rip + 0x989ca5], rcx ; 0x100ca9508
0x10031f863: lea rcx, [rip + 0x8424d4] ; 0x100b61d3e cheapFogHeightDensity
0x10031f86a: mov qword ptr [rip + 0x989cdf], rcx ; 0x100ca9550
0x10031f871: lea rcx, [rip + 0x989c88] ; 0x100ca9500
0x10031f878: mov qword ptr [rip + 0x989ce1], rcx ; 0x100ca9560
0x10031f87f: vmovdqa xmmword ptr [rbp - 0x120], xmm8
0x10031f887: vmovdqa xmmword ptr [rip + 0x1ad18a1], xmm8 ; 0x101df1130
0x10031f88f: lea rcx, [rip + 0x1ad187a] ; 0x101df1110
0x10031f896: mov qword ptr [rip + 0x1ad18a3], rcx ; 0x101df1140
0x10031f89d: mov qword ptr [rip + 0x989cc8], 0xd8 ; 0x100ca9570
0x10031f8a8: mov qword ptr [rip + 0x989cc9], r14 ; 0x100ca9578
0x10031f8af: mov qword ptr [rip + 0x989cca], rax ; 0x100ca9580
0x10031f8b6: mov qword ptr [rip + 0x989cc7], 0xffffffffffffffff ; 0x100ca9588
0x10031f8c1: mov qword ptr [rip + 0x989cc8], rbx ; 0x100ca9590
0x10031f8c8: mov qword ptr [rip + 0x989cc5], 0 ; 0x100ca9598
0x10031f8d3: lea rcx, [rip + 0x1ad1856] ; 0x101df1130
0x10031f8da: mov qword ptr [rip + 0x989c77], rcx ; 0x100ca9558
0x10031f8e1: lea rcx, [rip + 0x842392] ; 0x100b61c7a cheapFogTintTop
0x10031f8e8: mov qword ptr [rip + 0x989cb1], rcx ; 0x100ca95a0
0x10031f8ef: lea rcx, [rip + 0x989c5a] ; 0x100ca9550
0x10031f8f6: mov qword ptr [rip + 0x989cb3], rcx ; 0x100ca95b0
0x10031f8fd: vmovdqa xmmword ptr [rip + 0x1ad186b], xmm3 ; 0x101df1170
0x10031f905: lea rcx, [rip + 0x1ad1844] ; 0x101df1150
0x10031f90c: mov qword ptr [rip + 0x1ad186d], rcx ; 0x101df1180
0x10031f913: vmovdqa xmmword ptr [rip + 0x1ad1875], xmm10 ; 0x101df1190
0x10031f91b: lea rcx, [rip + 0x1ad184e] ; 0x101df1170
0x10031f922: mov qword ptr [rip + 0x1ad1877], rcx ; 0x101df11a0
0x10031f929: mov qword ptr [rip + 0x989c8c], 0xe0 ; 0x100ca95c0
0x10031f934: mov qword ptr [rip + 0x989c8d], r15 ; 0x100ca95c8
0x10031f93b: mov qword ptr [rip + 0x989c8e], rax ; 0x100ca95d0
0x10031f942: mov qword ptr [rip + 0x989c8b], 0xffffffffffffffff ; 0x100ca95d8
0x10031f94d: mov qword ptr [rip + 0x989c8c], rbx ; 0x100ca95e0
0x10031f954: mov qword ptr [rip + 0x989c89], 0 ; 0x100ca95e8
0x10031f95f: lea rcx, [rip + 0x1ad182a] ; 0x101df1190
0x10031f966: mov qword ptr [rip + 0x989c3b], rcx ; 0x100ca95a8
0x10031f96d: lea rcx, [rip + 0x842316] ; 0x100b61c8a cheapFogTintMidTop
0x10031f974: mov qword ptr [rip + 0x989c75], rcx ; 0x100ca95f0
0x10031f97b: lea rcx, [rip + 0x989c1e] ; 0x100ca95a0
0x10031f982: mov qword ptr [rip + 0x989c77], rcx ; 0x100ca9600
0x10031f989: vmovdqa xmmword ptr [rip + 0x1ad183f], xmm3 ; 0x101df11d0
0x10031f991: lea rcx, [rip + 0x1ad1818] ; 0x101df11b0
0x10031f998: mov qword ptr [rip + 0x1ad1841], rcx ; 0x101df11e0
0x10031f99f: vmovdqa xmmword ptr [rip + 0x1ad1849], xmm11 ; 0x101df11f0
0x10031f9a7: lea rcx, [rip + 0x1ad1822] ; 0x101df11d0
0x10031f9ae: mov qword ptr [rip + 0x1ad184b], rcx ; 0x101df1200
0x10031f9b5: mov qword ptr [rip + 0x989c50], 0xf0 ; 0x100ca9610
0x10031f9c0: mov qword ptr [rip + 0x989c51], r15 ; 0x100ca9618
0x10031f9c7: mov qword ptr [rip + 0x989c52], rax ; 0x100ca9620
0x10031f9ce: mov qword ptr [rip + 0x989c4f], 0xffffffffffffffff ; 0x100ca9628
0x10031f9d9: mov qword ptr [rip + 0x989c50], rbx ; 0x100ca9630
0x10031f9e0: mov qword ptr [rip + 0x989c4d], 0 ; 0x100ca9638
0x10031f9eb: lea rcx, [rip + 0x1ad17fe] ; 0x101df11f0
0x10031f9f2: mov qword ptr [rip + 0x989bff], rcx ; 0x100ca95f8
0x10031f9f9: lea rcx, [rip + 0x84229d] ; 0x100b61c9d cheapFogTintMidMid
0x10031fa00: mov qword ptr [rip + 0x989c39], rcx ; 0x100ca9640
0x10031fa07: lea rcx, [rip + 0x989be2] ; 0x100ca95f0
0x10031fa0e: mov qword ptr [rip + 0x989c3b], rcx ; 0x100ca9650
0x10031fa15: vmovdqa xmmword ptr [rip + 0x1ad1813], xmm3 ; 0x101df1230
0x10031fa1d: lea rcx, [rip + 0x1ad17ec] ; 0x101df1210
0x10031fa24: mov qword ptr [rip + 0x1ad1815], rcx ; 0x101df1240
0x10031fa2b: vmovdqa xmmword ptr [rip + 0x1ad181d], xmm12 ; 0x101df1250
0x10031fa33: lea rcx, [rip + 0x1ad17f6] ; 0x101df1230
0x10031fa3a: mov qword ptr [rip + 0x1ad181f], rcx ; 0x101df1260
0x10031fa41: mov qword ptr [rip + 0x989c14], 0x100 ; 0x100ca9660
0x10031fa4c: mov qword ptr [rip + 0x989c15], r15 ; 0x100ca9668
0x10031fa53: mov qword ptr [rip + 0x989c16], rax ; 0x100ca9670
0x10031fa5a: mov qword ptr [rip + 0x989c13], 0xffffffffffffffff ; 0x100ca9678
0x10031fa65: mov qword ptr [rip + 0x989c14], rbx ; 0x100ca9680
0x10031fa6c: mov qword ptr [rip + 0x989c11], 0 ; 0x100ca9688
0x10031fa77: lea rcx, [rip + 0x1ad17d2] ; 0x101df1250
0x10031fa7e: mov qword ptr [rip + 0x989bc3], rcx ; 0x100ca9648
0x10031fa85: lea rcx, [rip + 0x842224] ; 0x100b61cb0 cheapFogTintMidBot
0x10031fa8c: mov qword ptr [rip + 0x989bfd], rcx ; 0x100ca9690
0x10031fa93: lea rcx, [rip + 0x989ba6] ; 0x100ca9640
0x10031fa9a: mov qword ptr [rip + 0x989bff], rcx ; 0x100ca96a0
0x10031faa1: vmovdqa xmmword ptr [rip + 0x1ad17e7], xmm3 ; 0x101df1290
0x10031faa9: lea rcx, [rip + 0x1ad17c0] ; 0x101df1270
0x10031fab0: mov qword ptr [rip + 0x1ad17e9], rcx ; 0x101df12a0
0x10031fab7: vmovdqa xmmword ptr [rip + 0x1ad17f1], xmm13 ; 0x101df12b0
0x10031fabf: lea rcx, [rip + 0x1ad17ca] ; 0x101df1290
0x10031fac6: mov qword ptr [rip + 0x1ad17f3], rcx ; 0x101df12c0
0x10031facd: mov qword ptr [rip + 0x989bd8], 0x110 ; 0x100ca96b0
0x10031fad8: mov qword ptr [rip + 0x989bd9], r15 ; 0x100ca96b8
0x10031fadf: mov qword ptr [rip + 0x989bda], rax ; 0x100ca96c0
0x10031fae6: mov qword ptr [rip + 0x989bd7], 0xffffffffffffffff ; 0x100ca96c8
0x10031faf1: mov qword ptr [rip + 0x989bd8], rbx ; 0x100ca96d0
0x10031faf8: mov qword ptr [rip + 0x989bd5], 0 ; 0x100ca96d8
0x10031fb03: lea rcx, [rip + 0x1ad17a6] ; 0x101df12b0
0x10031fb0a: mov qword ptr [rip + 0x989b87], rcx ; 0x100ca9698
0x10031fb11: lea rcx, [rip + 0x8421ab] ; 0x100b61cc3 cheapFogTintBot
0x10031fb18: mov qword ptr [rip + 0x989bc1], rcx ; 0x100ca96e0
0x10031fb1f: lea rcx, [rip + 0x989b6a] ; 0x100ca9690
0x10031fb26: mov qword ptr [rip + 0x989bc3], rcx ; 0x100ca96f0
0x10031fb2d: vmovdqa xmmword ptr [rip + 0x1ad17bb], xmm3 ; 0x101df12f0
0x10031fb35: vmovdqa xmmword ptr [rbp - 0xa0], xmm3
0x10031fb3d: lea rcx, [rip + 0x1ad178c] ; 0x101df12d0
0x10031fb44: mov qword ptr [rip + 0x1ad17b5], rcx ; 0x101df1300
0x10031fb4b: vmovdqa xmmword ptr [rip + 0x1ad17bd], xmm7 ; 0x101df1310
0x10031fb53: lea rcx, [rip + 0x1ad1796] ; 0x101df12f0
0x10031fb5a: mov qword ptr [rip + 0x1ad17bf], rcx ; 0x101df1320
0x10031fb61: mov qword ptr [rip + 0x989b94], 0x120 ; 0x100ca9700
0x10031fb6c: mov qword ptr [rip + 0x989b95], r15 ; 0x100ca9708
0x10031fb73: mov qword ptr [rip + 0x989b96], rax ; 0x100ca9710
0x10031fb7a: mov qword ptr [rip + 0x989b93], 0xffffffffffffffff ; 0x100ca9718
0x10031fb85: mov qword ptr [rip + 0x989b94], rbx ; 0x100ca9720
0x10031fb8c: mov qword ptr [rip + 0x989b91], 0 ; 0x100ca9728
0x10031fb97: lea rcx, [rip + 0x1ad1772] ; 0x101df1310
0x10031fb9e: mov qword ptr [rip + 0x989b43], rcx ; 0x100ca96e8
0x10031fba5: lea rcx, [rip + 0x842133] ; 0x100b61cdf fogDensity
0x10031fbac: mov qword ptr [rip + 0x989b7d], rcx ; 0x100ca9730
0x10031fbb3: lea rcx, [rip + 0x989b26] ; 0x100ca96e0
0x10031fbba: mov qword ptr [rip + 0x989b7f], rcx ; 0x100ca9740
0x10031fbc1: vmovdqa xmmword ptr [rip + 0x1ad1787], xmm9 ; 0x101df1350
0x10031fbc9: lea rcx, [rip + 0x1ad1760] ; 0x101df1330
0x10031fbd0: mov qword ptr [rip + 0x1ad1789], rcx ; 0x101df1360
0x10031fbd7: mov qword ptr [rip + 0x989b6e], 0x130 ; 0x100ca9750
0x10031fbe2: mov qword ptr [rip + 0x989b6f], r14 ; 0x100ca9758
0x10031fbe9: mov qword ptr [rip + 0x989b70], rax ; 0x100ca9760
0x10031fbf0: mov qword ptr [rip + 0x989b6d], 0xffffffffffffffff ; 0x100ca9768
0x10031fbfb: mov qword ptr [rip + 0x989b6e], rbx ; 0x100ca9770
0x10031fc02: mov qword ptr [rip + 0x989b6b], 0 ; 0x100ca9778
0x10031fc0d: lea rcx, [rip + 0x1ad173c] ; 0x101df1350
0x10031fc14: mov qword ptr [rip + 0x989b1d], rcx ; 0x100ca9738
0x10031fc1b: lea rcx, [rip + 0x8420c8] ; 0x100b61cea fogHeight
0x10031fc22: mov qword ptr [rip + 0x989b57], rcx ; 0x100ca9780
0x10031fc29: lea rcx, [rip + 0x989b00] ; 0x100ca9730
0x10031fc30: mov qword ptr [rip + 0x989b59], rcx ; 0x100ca9790
0x10031fc37: lea rcx, [rip + 0x85dcd7] ; 0x100b7d915 0.1
0x10031fc3e: vmovq xmm0, rcx
0x10031fc43: vpunpcklqdq xmm0, xmm5, xmm0
0x10031fc47: vmovdqa xmmword ptr [rbp - 0x180], xmm0
0x10031fc4f: vmovdqa xmmword ptr [rip + 0x1ad1739], xmm0 ; 0x101df1390
0x10031fc57: lea rcx, [rip + 0x1ad1712] ; 0x101df1370
0x10031fc5e: mov qword ptr [rip + 0x1ad173b], rcx ; 0x101df13a0
0x10031fc65: mov qword ptr [rip + 0x989b30], 0x134 ; 0x100ca97a0
0x10031fc70: mov qword ptr [rip + 0x989b31], r14 ; 0x100ca97a8
0x10031fc77: mov qword ptr [rip + 0x989b32], rax ; 0x100ca97b0
0x10031fc7e: mov qword ptr [rip + 0x989b2f], 0xffffffffffffffff ; 0x100ca97b8
0x10031fc89: mov qword ptr [rip + 0x989b30], rbx ; 0x100ca97c0
0x10031fc90: mov qword ptr [rip + 0x989b2d], 0 ; 0x100ca97c8
0x10031fc9b: lea rcx, [rip + 0x1ad16ee] ; 0x101df1390
0x10031fca2: mov qword ptr [rip + 0x989adf], rcx ; 0x100ca9788
0x10031fca9: lea rcx, [rip + 0x842044] ; 0x100b61cf4 drawDistance
0x10031fcb0: mov qword ptr [rip + 0x989b19], rcx ; 0x100ca97d0
0x10031fcb7: lea rcx, [rip + 0x989ac2] ; 0x100ca9780
0x10031fcbe: mov qword ptr [rip + 0x989b1b], rcx ; 0x100ca97e0
0x10031fcc5: lea rcx, [rip + 0x860fdb] ; 0x100b80ca7 15000
0x10031fccc: vmovq xmm0, rcx
0x10031fcd1: vpunpcklqdq xmm0, xmm5, xmm0
0x10031fcd5: vmovdqa xmmword ptr [rbp - 0x190], xmm0
0x10031fcdd: vmovdqa xmmword ptr [rip + 0x1ad16eb], xmm0 ; 0x101df13d0
0x10031fce5: lea rcx, [rip + 0x1ad16c4] ; 0x101df13b0
0x10031fcec: mov qword ptr [rip + 0x1ad16ed], rcx ; 0x101df13e0
0x10031fcf3: mov qword ptr [rip + 0x989af2], 0x138 ; 0x100ca97f0
0x10031fcfe: mov qword ptr [rip + 0x989af3], r14 ; 0x100ca97f8
0x10031fd05: mov qword ptr [rip + 0x989af4], rax ; 0x100ca9800
0x10031fd0c: mov qword ptr [rip + 0x989af1], 0xffffffffffffffff ; 0x100ca9808
0x10031fd17: mov qword ptr [rip + 0x989af2], rbx ; 0x100ca9810
0x10031fd1e: mov qword ptr [rip + 0x989aef], 0 ; 0x100ca9818
0x10031fd29: lea rcx, [rip + 0x1ad16a0] ; 0x101df13d0
0x10031fd30: mov qword ptr [rip + 0x989aa1], rcx ; 0x100ca97d8
0x10031fd37: lea rcx, [rip + 0x860f6f] ; 0x100b80cad bloomTint
0x10031fd3e: mov qword ptr [rip + 0x989adb], rcx ; 0x100ca9820
0x10031fd45: lea rcx, [rip + 0x989a84] ; 0x100ca97d0
0x10031fd4c: mov qword ptr [rip + 0x989add], rcx ; 0x100ca9830
0x10031fd53: lea rcx, [rip + 0x860f5d] ; 0x100b80cb7 ( 1.1, 1.0, 0.9 )
0x10031fd5a: vmovq xmm0, rcx
0x10031fd5f: vpunpcklqdq xmm0, xmm5, xmm0
0x10031fd63: vmovdqa xmmword ptr [rbp - 0x1a0], xmm0
0x10031fd6b: vmovdqa xmmword ptr [rip + 0x1ad169d], xmm0 ; 0x101df1410
0x10031fd73: lea rcx, [rip + 0x1ad1676] ; 0x101df13f0
0x10031fd7a: mov qword ptr [rip + 0x1ad169f], rcx ; 0x101df1420
0x10031fd81: mov qword ptr [rip + 0x989ab4], 0x140 ; 0x100ca9840
0x10031fd8c: mov rcx, qword ptr [rip + 0x8e703d] ; 0x100c06dd0 -> 0x100066ac0 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Vector3EERK8MetaTypev
0x10031fd93: mov qword ptr [rip + 0x989aae], rcx ; 0x100ca9848
0x10031fd9a: mov rsi, rcx
0x10031fd9d: mov qword ptr [rip + 0x989aac], rax ; 0x100ca9850
0x10031fda4: mov qword ptr [rip + 0x989aa9], 0xffffffffffffffff ; 0x100ca9858
0x10031fdaf: mov qword ptr [rip + 0x989aaa], rbx ; 0x100ca9860
0x10031fdb6: mov qword ptr [rip + 0x989aa7], 0 ; 0x100ca9868
0x10031fdc1: lea rcx, [rip + 0x1ad1648] ; 0x101df1410
0x10031fdc8: mov qword ptr [rip + 0x989a59], rcx ; 0x100ca9828
0x10031fdcf: lea rcx, [rip + 0x860ef3] ; 0x100b80cc9 bloomIntensity
0x10031fdd6: mov qword ptr [rip + 0x989a93], rcx ; 0x100ca9870
0x10031fddd: lea rcx, [rip + 0x989a3c] ; 0x100ca9820
0x10031fde4: mov qword ptr [rip + 0x989a95], rcx ; 0x100ca9880
0x10031fdeb: lea rcx, [rip + 0x1ad163e] ; 0x101df1430
0x10031fdf2: mov qword ptr [rip + 0x1ad1667], rcx ; 0x101df1460
0x10031fdf9: mov qword ptr [rip + 0x989a8c], 0x150 ; 0x100ca9890
0x10031fe04: mov qword ptr [rip + 0x989a8d], r14 ; 0x100ca9898
0x10031fe0b: mov qword ptr [rip + 0x989a8e], rax ; 0x100ca98a0
0x10031fe12: mov qword ptr [rip + 0x989a8b], 0xffffffffffffffff ; 0x100ca98a8
0x10031fe1d: mov qword ptr [rip + 0x989a8c], rbx ; 0x100ca98b0
0x10031fe24: mov qword ptr [rip + 0x989a89], 0 ; 0x100ca98b8
0x10031fe2f: lea rcx, [rip + 0x1ad161a] ; 0x101df1450
0x10031fe36: mov qword ptr [rip + 0x989a3b], rcx ; 0x100ca9878
0x10031fe3d: lea rcx, [rip + 0x860e99] ; 0x100b80cdd bloomOverbright
0x10031fe44: mov qword ptr [rip + 0x989a75], rcx ; 0x100ca98c0
0x10031fe4b: lea rcx, [rip + 0x989a1e] ; 0x100ca9870
0x10031fe52: mov qword ptr [rip + 0x989a77], rcx ; 0x100ca98d0
0x10031fe59: vmovdqa xmmword ptr [rip + 0x1ad162f], xmm8 ; 0x101df1490
0x10031fe61: lea rcx, [rip + 0x1ad1608] ; 0x101df1470
0x10031fe68: mov qword ptr [rip + 0x1ad1631], rcx ; 0x101df14a0
0x10031fe6f: mov qword ptr [rip + 0x989a66], 0x154 ; 0x100ca98e0
0x10031fe7a: mov qword ptr [rip + 0x989a67], r14 ; 0x100ca98e8
0x10031fe81: mov qword ptr [rip + 0x989a68], rax ; 0x100ca98f0
0x10031fe88: mov qword ptr [rip + 0x989a65], 0xffffffffffffffff ; 0x100ca98f8
0x10031fe93: mov qword ptr [rip + 0x989a66], rbx ; 0x100ca9900
0x10031fe9a: mov qword ptr [rip + 0x989a63], 0 ; 0x100ca9908
0x10031fea5: lea rcx, [rip + 0x1ad15e4] ; 0x101df1490
0x10031feac: mov qword ptr [rip + 0x989a15], rcx ; 0x100ca98c8
0x10031feb3: lea rcx, [rip + 0x860e33] ; 0x100b80ced bloomGhost
0x10031feba: mov qword ptr [rip + 0x989a4f], rcx ; 0x100ca9910
0x10031fec1: lea rcx, [rip + 0x9899f8] ; 0x100ca98c0
0x10031fec8: mov qword ptr [rip + 0x989a51], rcx ; 0x100ca9920
0x10031fecf: lea rcx, [rip + 0x855629] ; 0x100b754ff 0.25
0x10031fed6: vmovq xmm0, rcx
0x10031fedb: vpunpcklqdq xmm0, xmm5, xmm0
0x10031fedf: vmovdqa xmmword ptr [rbp - 0x240], xmm0
0x10031fee7: vmovdqa xmmword ptr [rip + 0x1ad15e1], xmm0 ; 0x101df14d0
0x10031feef: lea rcx, [rip + 0x1ad15ba] ; 0x101df14b0
0x10031fef6: mov qword ptr [rip + 0x1ad15e3], rcx ; 0x101df14e0
0x10031fefd: vmovdqa xmmword ptr [rip + 0x1ad15eb], xmm4 ; 0x101df14f0
0x10031ff05: lea rcx, [rip + 0x1ad15c4] ; 0x101df14d0
0x10031ff0c: mov qword ptr [rip + 0x1ad15ed], rcx ; 0x101df1500
0x10031ff13: mov qword ptr [rip + 0x989a12], 0x158 ; 0x100ca9930
0x10031ff1e: mov qword ptr [rip + 0x989a13], r14 ; 0x100ca9938
0x10031ff25: mov qword ptr [rip + 0x989a14], rax ; 0x100ca9940
0x10031ff2c: mov qword ptr [rip + 0x989a11], 0xffffffffffffffff ; 0x100ca9948
0x10031ff37: mov qword ptr [rip + 0x989a12], rbx ; 0x100ca9950
0x10031ff3e: mov qword ptr [rip + 0x989a0f], 0 ; 0x100ca9958
0x10031ff49: lea rcx, [rip + 0x1ad15a0] ; 0x101df14f0
0x10031ff50: mov qword ptr [rip + 0x9899c1], rcx ; 0x100ca9918
0x10031ff57: lea rcx, [rip + 0x860da6] ; 0x100b80d04 bloomFalloff
0x10031ff5e: mov qword ptr [rip + 0x9899fb], rcx ; 0x100ca9960
0x10031ff65: lea rcx, [rip + 0x9899a4] ; 0x100ca9910
0x10031ff6c: mov qword ptr [rip + 0x9899fd], rcx ; 0x100ca9970
0x10031ff73: lea rcx, [rip + 0x85d96d] ; 0x100b7d8e7 0.4
0x10031ff7a: vmovq xmm0, rcx
0x10031ff7f: vpunpcklqdq xmm0, xmm5, xmm0
0x10031ff83: vmovdqa xmmword ptr [rbp - 0x260], xmm0
0x10031ff8b: vmovdqa xmmword ptr [rip + 0x1ad159d], xmm0 ; 0x101df1530
0x10031ff93: lea rcx, [rip + 0x1ad1576] ; 0x101df1510
0x10031ff9a: mov qword ptr [rip + 0x1ad159f], rcx ; 0x101df1540
0x10031ffa1: vmovdqa xmmword ptr [rip + 0x1ad15a7], xmm1 ; 0x101df1550
0x10031ffa9: lea rcx, [rip + 0x1ad1580] ; 0x101df1530
0x10031ffb0: mov qword ptr [rip + 0x1ad15a9], rcx ; 0x101df1560
0x10031ffb7: mov qword ptr [rip + 0x9899be], 0x15c ; 0x100ca9980
0x10031ffc2: mov qword ptr [rip + 0x9899bf], r14 ; 0x100ca9988
0x10031ffc9: mov qword ptr [rip + 0x9899c0], rax ; 0x100ca9990
0x10031ffd0: mov qword ptr [rip + 0x9899bd], 0xffffffffffffffff ; 0x100ca9998
0x10031ffdb: mov qword ptr [rip + 0x9899be], rbx ; 0x100ca99a0
0x10031ffe2: mov qword ptr [rip + 0x9899bb], 0 ; 0x100ca99a8
0x10031ffed: lea rcx, [rip + 0x1ad155c] ; 0x101df1550
0x10031fff4: mov qword ptr [rip + 0x98996d], rcx ; 0x100ca9968
0x10031fffb: lea rcx, [rip + 0x841d8a] ; 0x100b61d8c exposure
0x100320002: mov qword ptr [rip + 0x9899a7], rcx ; 0x100ca99b0
0x100320009: lea rcx, [rip + 0x989950] ; 0x100ca9960
0x100320010: mov qword ptr [rip + 0x9899a9], rcx ; 0x100ca99c0
0x100320017: vmovdqa xmmword ptr [rbp - 0xb0], xmm9
0x10032001f: vmovdqa xmmword ptr [rip + 0x1ad1569], xmm9 ; 0x101df1590
0x100320027: lea rcx, [rip + 0x1ad1542] ; 0x101df1570
0x10032002e: mov qword ptr [rip + 0x1ad156b], rcx ; 0x101df15a0
0x100320035: mov qword ptr [rip + 0x989990], 0x160 ; 0x100ca99d0
0x100320040: mov qword ptr [rip + 0x989991], r14 ; 0x100ca99d8
0x100320047: mov qword ptr [rip + 0x989992], rax ; 0x100ca99e0
0x10032004e: mov qword ptr [rip + 0x98998f], 0xffffffffffffffff ; 0x100ca99e8
0x100320059: mov qword ptr [rip + 0x989990], rbx ; 0x100ca99f0
0x100320060: mov qword ptr [rip + 0x98998d], 0 ; 0x100ca99f8
0x10032006b: lea rcx, [rip + 0x1ad151e] ; 0x101df1590
0x100320072: mov qword ptr [rip + 0x98993f], rcx ; 0x100ca99b8
0x100320079: lea rcx, [rip + 0x860ca4] ; 0x100b80d24 pointColor
0x100320080: mov qword ptr [rip + 0x989979], rcx ; 0x100ca9a00
0x100320087: lea rcx, [rip + 0x989922] ; 0x100ca99b0
0x10032008e: mov qword ptr [rip + 0x98997b], rcx ; 0x100ca9a10
0x100320095: lea rcx, [rip + 0x8444f3] ; 0x100b6458f Tool_Category
0x10032009c: lea rdx, [rip + 0x860c8c] ; 0x100b80d2f PointLights
0x1003200a3: vmovq xmm4, rcx
0x1003200a8: vmovq xmm0, rdx
0x1003200ad: vpunpcklqdq xmm0, xmm4, xmm0
0x1003200b1: vmovdqa xmmword ptr [rip + 0x1ad1517], xmm0 ; 0x101df15d0
0x1003200b9: vmovdqa xmm2, xmm0
0x1003200bd: vmovdqa xmmword ptr [rbp - 0x140], xmm2
0x1003200c5: lea rcx, [rip + 0x1ad14e4] ; 0x101df15b0
0x1003200cc: mov qword ptr [rip + 0x1ad150d], rcx ; 0x101df15e0
0x1003200d3: lea rcx, [rip + 0x860c61] ; 0x100b80d3b (1.0, 0.48, 0.2825)
0x1003200da: vmovq xmm0, rcx
0x1003200df: vpunpcklqdq xmm0, xmm5, xmm0
0x1003200e3: vmovdqa xmmword ptr [rbp - 0x220], xmm0
0x1003200eb: vmovdqa xmmword ptr [rip + 0x1ad14fd], xmm0 ; 0x101df15f0
0x1003200f3: lea rcx, [rip + 0x1ad14d6] ; 0x101df15d0
0x1003200fa: mov qword ptr [rip + 0x1ad14ff], rcx ; 0x101df1600
0x100320101: mov qword ptr [rip + 0x989914], 0x170 ; 0x100ca9a20
0x10032010c: mov qword ptr [rip + 0x989915], rsi ; 0x100ca9a28
0x100320113: mov qword ptr [rip + 0x989916], rax ; 0x100ca9a30
0x10032011a: mov qword ptr [rip + 0x989913], 0xffffffffffffffff ; 0x100ca9a38
0x100320125: mov qword ptr [rip + 0x989914], rbx ; 0x100ca9a40
0x10032012c: mov qword ptr [rip + 0x989911], 0 ; 0x100ca9a48
0x100320137: lea rcx, [rip + 0x1ad14b2] ; 0x101df15f0
0x10032013e: mov qword ptr [rip + 0x9898c3], rcx ; 0x100ca9a08
0x100320145: lea rcx, [rip + 0x860c03] ; 0x100b80d4f pointIntensity
0x10032014c: mov qword ptr [rip + 0x9898fd], rcx ; 0x100ca9a50
0x100320153: lea rcx, [rip + 0x9898a6] ; 0x100ca9a00
0x10032015a: mov qword ptr [rip + 0x9898ff], rcx ; 0x100ca9a60
0x100320161: lea rcx, [rip + 0x860bf6] ; 0x100b80d5e 100.0
0x100320168: vmovq xmm0, rcx
0x10032016d: vpunpcklqdq xmm0, xmm5, xmm0
0x100320171: vmovdqa xmmword ptr [rbp - 0x60], xmm5
0x100320176: vmovdqa xmmword ptr [rbp - 0x200], xmm0
0x10032017e: vmovdqa xmmword ptr [rip + 0x1ad14aa], xmm0 ; 0x101df1630
0x100320186: lea rcx, [rip + 0x1ad1483] ; 0x101df1610
0x10032018d: mov qword ptr [rip + 0x1ad14ac], rcx ; 0x101df1640
0x100320194: mov qword ptr [rip + 0x9898d1], 0x180 ; 0x100ca9a70
0x10032019f: mov qword ptr [rip + 0x9898d2], r14 ; 0x100ca9a78
0x1003201a6: mov qword ptr [rip + 0x9898d3], rax ; 0x100ca9a80
0x1003201ad: mov qword ptr [rip + 0x9898d0], 0xffffffffffffffff ; 0x100ca9a88
0x1003201b8: mov qword ptr [rip + 0x9898d1], rbx ; 0x100ca9a90
0x1003201bf: mov qword ptr [rip + 0x9898ce], 0 ; 0x100ca9a98
0x1003201ca: lea rcx, [rip + 0x1ad145f] ; 0x101df1630
0x1003201d1: mov qword ptr [rip + 0x989880], rcx ; 0x100ca9a58
0x1003201d8: lea rcx, [rip + 0x85a460] ; 0x100b7a63f undulationScale
0x1003201df: mov qword ptr [rip + 0x9898ba], rcx ; 0x100ca9aa0
0x1003201e6: lea rcx, [rip + 0x989863] ; 0x100ca9a50
0x1003201ed: mov qword ptr [rip + 0x9898bc], rcx ; 0x100ca9ab0
0x1003201f4: vmovdqa xmmword ptr [rip + 0x1ad1474], xmm9 ; 0x101df1670
0x1003201fc: lea rcx, [rip + 0x1ad144d] ; 0x101df1650
0x100320203: mov qword ptr [rip + 0x1ad1476], rcx ; 0x101df1680
0x10032020a: mov qword ptr [rip + 0x9898ab], 0x184 ; 0x100ca9ac0
0x100320215: mov qword ptr [rip + 0x9898ac], r14 ; 0x100ca9ac8
0x10032021c: mov qword ptr [rip + 0x9898ad], rax ; 0x100ca9ad0
0x100320223: mov qword ptr [rip + 0x9898aa], 0xffffffffffffffff ; 0x100ca9ad8
0x10032022e: mov qword ptr [rip + 0x9898ab], rbx ; 0x100ca9ae0
0x100320235: mov qword ptr [rip + 0x9898a8], 0 ; 0x100ca9ae8
0x100320240: lea rcx, [rip + 0x1ad1429] ; 0x101df1670
0x100320247: mov qword ptr [rip + 0x98985a], rcx ; 0x100ca9aa8
0x10032024e: lea rcx, [rip + 0x860b0f] ; 0x100b80d64 fogVolumeIntensity
0x100320255: mov qword ptr [rip + 0x989894], rcx ; 0x100ca9af0
0x10032025c: lea rcx, [rip + 0x98983d] ; 0x100ca9aa0
0x100320263: mov qword ptr [rip + 0x989896], rcx ; 0x100ca9b00
0x10032026a: lea rcx, [rip + 0x98987f] ; 0x100ca9af0
0x100320271: mov qword ptr [rip + 0x9579e8], rcx ; 0x100c77c60
0x100320278: mov qword ptr [rip + 0x1ad0941], rax ; 0x101df0bc0
0x10032027f: mov qword ptr [rip + 0x989886], 0x188 ; 0x100ca9b10
0x10032028a: mov qword ptr [rip + 0x989887], r14 ; 0x100ca9b18
0x100320291: mov qword ptr [rip + 0x989888], rax ; 0x100ca9b20
0x100320298: lea rax, [rip + 0x860ad8] ; 0x100b80d77 -0.7
0x10032029f: vmovq xmm0, rax
0x1003202a4: vpunpcklqdq xmm0, xmm5, xmm0
0x1003202a8: vmovdqa xmmword ptr [rbp - 0x1f0], xmm0
0x1003202b0: vmovdqa xmmword ptr [rip + 0x1ad13f8], xmm0 ; 0x101df16b0
0x1003202b8: lea rax, [rip + 0x1ad13d1] ; 0x101df1690
0x1003202bf: mov qword ptr [rip + 0x1ad13fa], rax ; 0x101df16c0
0x1003202c6: mov qword ptr [rip + 0x989857], 0xffffffffffffffff ; 0x100ca9b28
0x1003202d1: mov qword ptr [rip + 0x989858], rbx ; 0x100ca9b30
0x1003202d8: mov qword ptr [rip + 0x989855], 0 ; 0x100ca9b38
0x1003202e3: lea rax, [rip + 0x1ad13c6] ; 0x101df16b0
0x1003202ea: mov qword ptr [rip + 0x989807], rax ; 0x100ca9af8
0x1003202f1: lea rax, [rip + 0x860a84] ; 0x100b80d7c SetEnvHull
0x1003202f8: mov qword ptr [rip + 0x1ad13d1], rax ; 0x101df16d0
0x1003202ff: mov qword ptr [rip + 0x1ad13ce], 0 ; 0x101df16d8
0x10032030a: mov rax, qword ptr [rip + 0x94fc47] ; 0x100c6ff58
0x100320311: mov qword ptr [rip + 0x1ad13c8], rax ; 0x101df16e0
0x100320318: lea rax, [rip + 0x1ad13a9] ; 0x101df16c8
0x10032031f: mov qword ptr [rip + 0x94fc32], rax ; 0x100c6ff58
0x100320326: mov qword ptr [rip + 0x1ad13c3], rax ; 0x101df16f0
0x10032032d: mov rax, qword ptr [rip + 0x8e84bc] ; 0x100c087f0 -> 0x10031d1e0 __Z18GetMetaClassByTypeIP8EnvEventERK9MetaClassv
0x100320334: mov qword ptr [rip + 0x1ad13bd], rax ; 0x101df16f8
0x10032033b: mov dword ptr [rip + 0x1ad13bb], 0xffffffff ; 0x101df1700
0x100320345: mov dword ptr [rip + 0x1ad13b5], 0xffffffff ; 0x101df1704
0x10032034f: mov qword ptr [rip + 0x1ad13c6], 0 ; 0x101df1720
0x10032035a: mov rax, qword ptr [rip + 0x8ea797] ; 0x100c0aaf8
0x100320361: add rax, 0x10
0x100320365: mov qword ptr [rip + 0x1ad135c], rax ; 0x101df16c8
0x10032036c: lea rax, [rip + 0x841c60] ; 0x100b61fd3 Sun
0x100320373: vmovq xmm0, rax
0x100320378: vpunpcklqdq xmm0, xmm4, xmm0
0x10032037c: vmovdqa xmmword ptr [rbp - 0x90], xmm0
0x100320384: vmovdqa xmmword ptr [rip + 0x1ad0844], xmm0 ; 0x101df0bd0
0x10032038c: mov qword ptr [rip + 0x1ad0849], 0 ; 0x101df0be0
0x100320397: vmovdqa xmmword ptr [rip + 0x1ad0871], xmm0 ; 0x101df0c10
0x10032039f: mov qword ptr [rip + 0x1ad0876], 0 ; 0x101df0c20
0x1003203aa: vmovdqa xmmword ptr [rip + 0x1ad089e], xmm0 ; 0x101df0c50
0x1003203b2: mov qword ptr [rip + 0x1ad08a3], 0 ; 0x101df0c60
0x1003203bd: vmovdqa xmmword ptr [rip + 0x1ad08eb], xmm0 ; 0x101df0cb0
0x1003203c5: mov qword ptr [rip + 0x1ad08f0], 0 ; 0x101df0cc0
0x1003203d0: vmovdqa xmmword ptr [rip + 0x1ad0918], xmm0 ; 0x101df0cf0
0x1003203d8: mov qword ptr [rip + 0x1ad091d], 0 ; 0x101df0d00
0x1003203e3: vmovdqa xmmword ptr [rip + 0x1ad0945], xmm0 ; 0x101df0d30
0x1003203eb: mov qword ptr [rip + 0x1ad094a], 0 ; 0x101df0d40
0x1003203f6: vmovdqa xmmword ptr [rip + 0x1ad0972], xmm0 ; 0x101df0d70
0x1003203fe: mov qword ptr [rip + 0x1ad0977], 0 ; 0x101df0d80
0x100320409: lea rax, [rip + 0x860800] ; 0x100b80c10 Sky
0x100320410: vmovq xmm0, rax
0x100320415: vpunpcklqdq xmm1, xmm4, xmm0
0x100320419: vmovdqa xmmword ptr [rbp - 0x70], xmm1
0x10032041e: vmovdqa xmmword ptr [rip + 0x1ad098a], xmm1 ; 0x101df0db0
0x100320426: mov qword ptr [rip + 0x1ad098f], 0 ; 0x101df0dc0
0x100320431: vmovdqa xmmword ptr [rip + 0x1ad09d7], xmm1 ; 0x101df0e10
0x100320439: mov qword ptr [rip + 0x1ad09dc], 0 ; 0x101df0e20
0x100320444: vmovdqa xmmword ptr [rip + 0x1ad0a24], xmm1 ; 0x101df0e70
0x10032044c: mov qword ptr [rip + 0x1ad0a29], 0 ; 0x101df0e80
0x100320457: vmovdqa xmmword ptr [rip + 0x1ad0a71], xmm1 ; 0x101df0ed0
0x10032045f: mov qword ptr [rip + 0x1ad0a76], 0 ; 0x101df0ee0
0x10032046a: vmovdqa xmmword ptr [rip + 0x1ad0abe], xmm1 ; 0x101df0f30
0x100320472: mov qword ptr [rip + 0x1ad0ac3], 0 ; 0x101df0f40
0x10032047d: vmovdqa xmmword ptr [rip + 0x1ad0b0b], xmm1 ; 0x101df0f90
0x100320485: mov qword ptr [rip + 0x1ad0b10], 0 ; 0x101df0fa0
0x100320490: lea rax, [rip + 0x860800] ; 0x100b80c97 Fog
0x100320497: vmovq xmm0, rax
0x10032049c: vpunpcklqdq xmm0, xmm4, xmm0
0x1003204a0: vmovdqa xmmword ptr [rbp - 0x80], xmm0
0x1003204a5: vmovdqa xmmword ptr [rip + 0x1ad0b23], xmm0 ; 0x101df0fd0
0x1003204ad: mov qword ptr [rip + 0x1ad0b28], 0 ; 0x101df0fe0
0x1003204b8: vmovdqa xmmword ptr [rip + 0x1ad0b50], xmm0 ; 0x101df1010
0x1003204c0: mov qword ptr [rip + 0x1ad0b55], 0 ; 0x101df1020
0x1003204cb: vmovdqa xmmword ptr [rip + 0x1ad0b7d], xmm0 ; 0x101df1050
0x1003204d3: mov qword ptr [rip + 0x1ad0b82], 0 ; 0x101df1060
0x1003204de: vmovdqa xmmword ptr [rip + 0x1ad0baa], xmm0 ; 0x101df1090
0x1003204e6: mov qword ptr [rip + 0x1ad0baf], 0 ; 0x101df10a0
0x1003204f1: vmovdqa xmmword ptr [rip + 0x1ad0bd7], xmm0 ; 0x101df10d0
0x1003204f9: mov qword ptr [rip + 0x1ad0bdc], 0 ; 0x101df10e0
0x100320504: vmovdqa xmmword ptr [rip + 0x1ad0c04], xmm0 ; 0x101df1110
0x10032050c: mov qword ptr [rip + 0x1ad0c09], 0 ; 0x101df1120
0x100320517: vmovdqa xmmword ptr [rip + 0x1ad0c31], xmm1 ; 0x101df1150
0x10032051f: mov qword ptr [rip + 0x1ad0c36], 0 ; 0x101df1160
0x10032052a: vmovdqa xmmword ptr [rip + 0x1ad0c7e], xmm1 ; 0x101df11b0
0x100320532: mov qword ptr [rip + 0x1ad0c83], 0 ; 0x101df11c0
0x10032053d: vmovdqa xmmword ptr [rip + 0x1ad0ccb], xmm1 ; 0x101df1210
0x100320545: mov qword ptr [rip + 0x1ad0cd0], 0 ; 0x101df1220
0x100320550: vmovdqa xmmword ptr [rip + 0x1ad0d18], xmm1 ; 0x101df1270
0x100320558: mov qword ptr [rip + 0x1ad0d1d], 0 ; 0x101df1280
0x100320563: vmovdqa xmmword ptr [rip + 0x1ad0d65], xmm1 ; 0x101df12d0
0x10032056b: mov qword ptr [rip + 0x1ad0d6a], 0 ; 0x101df12e0
0x100320576: vmovdqa xmmword ptr [rip + 0x1ad0db2], xmm0 ; 0x101df1330
0x10032057e: mov qword ptr [rip + 0x1ad0db7], 0 ; 0x101df1340
0x100320589: vmovdqa xmmword ptr [rip + 0x1ad0ddf], xmm0 ; 0x101df1370
0x100320591: mov qword ptr [rip + 0x1ad0de4], 0 ; 0x101df1380
0x10032059c: vmovdqa xmmword ptr [rip + 0x1ad0e0c], xmm0 ; 0x101df13b0
0x1003205a4: mov qword ptr [rip + 0x1ad0e11], 0 ; 0x101df13c0
0x1003205af: lea rax, [rip + 0x85b4f5] ; 0x100b7baab Bloom
0x1003205b6: vmovq xmm0, rax
0x1003205bb: vmovdqa xmmword ptr [rbp - 0x50], xmm4
0x1003205c0: vpunpcklqdq xmm0, xmm4, xmm0
0x1003205c4: vmovdqa xmmword ptr [rbp - 0x130], xmm0
0x1003205cc: vmovdqa xmmword ptr [rip + 0x1ad0e1c], xmm0 ; 0x101df13f0
0x1003205d4: mov qword ptr [rip + 0x1ad0e21], 0 ; 0x101df1400
0x1003205df: vmovdqa xmmword ptr [rip + 0x1ad0e49], xmm0 ; 0x101df1430
0x1003205e7: mov qword ptr [rip + 0x1ad0e4e], 0 ; 0x101df1440
0x1003205f2: vmovdqa xmmword ptr [rip + 0x1ad0e76], xmm0 ; 0x101df1470
0x1003205fa: mov qword ptr [rip + 0x1ad0e7b], 0 ; 0x101df1480
0x100320605: vmovdqa xmmword ptr [rip + 0x1ad0ea3], xmm0 ; 0x101df14b0
0x10032060d: mov qword ptr [rip + 0x1ad0ea8], 0 ; 0x101df14c0
0x100320618: vmovdqa xmmword ptr [rip + 0x1ad0ef0], xmm0 ; 0x101df1510
0x100320620: mov qword ptr [rip + 0x1ad0ef5], 0 ; 0x101df1520
0x10032062b: lea rax, [rip + 0x8606ea] ; 0x100b80d1c ToneMap
0x100320632: vmovq xmm0, rax
0x100320637: vpunpcklqdq xmm0, xmm4, xmm0
0x10032063b: vmovdqa xmmword ptr [rbp - 0x1b0], xmm0
0x100320643: vmovdqa xmmword ptr [rip + 0x1ad0f25], xmm0 ; 0x101df1570
0x10032064b: mov qword ptr [rip + 0x1ad0f2a], 0 ; 0x101df1580
0x100320656: vmovdqa xmmword ptr [rip + 0x1ad0f52], xmm3 ; 0x101df15b0
0x10032065e: mov qword ptr [rip + 0x1ad0f57], 0 ; 0x101df15c0
0x100320669: vmovdqa xmmword ptr [rip + 0x1ad0f9f], xmm2 ; 0x101df1610
0x100320671: mov qword ptr [rip + 0x1ad0fa4], 0 ; 0x101df1620
0x10032067c: lea rax, [rip + 0x8417c9] ; 0x100b61e4c Clouds
0x100320683: vmovq xmm0, rax
0x100320688: vpunpcklqdq xmm0, xmm4, xmm0
0x10032068c: vmovdqa xmmword ptr [rbp - 0x1c0], xmm0
0x100320694: vmovdqa xmmword ptr [rip + 0x1ad0fb4], xmm0 ; 0x101df1650
0x10032069c: mov qword ptr [rip + 0x1ad0fb9], 0 ; 0x101df1660
0x1003206a7: lea rax, [rip + 0x8565c7] ; 0x100b76c75 FogVolume
0x1003206ae: vmovq xmm0, rax
0x1003206b3: vpunpcklqdq xmm0, xmm4, xmm0
0x1003206b7: vmovdqa xmmword ptr [rbp - 0x1d0], xmm0
0x1003206bf: vmovdqa xmmword ptr [rip + 0x1ad0fc9], xmm0 ; 0x101df1690
0x1003206c7: mov qword ptr [rip + 0x1ad0fce], 0 ; 0x101df16a0
0x1003206d2: xor eax, eax
0x1003206d4: call 0x100011c10 ; 0x100011c10
0x1003206d9: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1003206de: vmovaps xmmword ptr [rip + 0x1ad104a], xmm0 ; 0x101df1730
0x1003206e6: lea rax, [rip + 0x1ad1043] ; 0x101df1730
0x1003206ed: mov rcx, qword ptr [rip + 0x1ad0fe4] ; 0x101df16d8
0x1003206f4: mov qword ptr [rip + 0x1ad1045], rcx ; 0x101df1740
0x1003206fb: mov qword ptr [rip + 0x1ad0fd6], rax ; 0x101df16d8
0x100320702: lea rax, [rip + 0x843e76] ; 0x100b6457f HotDate
0x100320709: mov qword ptr [rip + 0x1ad1038], rax ; 0x101df1748
0x100320710: lea rcx, [rip + 0x1ad1031] ; 0x101df1748
0x100320717: mov qword ptr [rip + 0x1ad102e], 0 ; 0x101df1750
0x100320722: mov rax, qword ptr [rip + 0x94f837] ; 0x100c6ff60
0x100320729: mov qword ptr [rip + 0x1ad1028], rax ; 0x101df1758
0x100320730: lea rax, [rip - 0x4d57] ; 0x10031b9e0
0x100320737: vmovq xmm0, rax
0x10032073c: vmovdqu xmmword ptr [rip + 0x1ad103c], xmm0 ; 0x101df1780
0x100320744: mov rax, qword ptr [rip + 0x8e4d3d] ; 0x100c05488 -> 0x10031e0b0 __Z12ApplyWrapperI10SetEnvHullMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10032074b: mov qword ptr [rip + 0x1ad103e], rax ; 0x101df1790
0x100320752: mov rax, qword ptr [rip + 0x8e85bf] ; 0x100c08d18 -> 0x10031e110 __Z21InitFunctionSignatureIM10SetEnvHullFvvEEvP17FunctionSignature
0x100320759: mov qword ptr [rip + 0x1ad1038], rax ; 0x101df1798
0x100320760: mov rax, qword ptr [rip + 0x8e6fe1] ; 0x100c07748 -> 0x10031e0a0 __Z18GetMetaClassByTypeIP10SetEnvHullERK9MetaClassv
0x100320767: lea rdx, [rip + 0x852af1] ; 0x100b7325f GetTransform
0x10032076e: mov qword ptr [rip + 0x1ad1033], rdx ; 0x101df17a8
0x100320775: lea rdx, [rip + 0x1ad102c] ; 0x101df17a8
0x10032077c: mov qword ptr [rip + 0x1ad1029], 0 ; 0x101df17b0
0x100320787: mov qword ptr [rip + 0x1ad102a], rcx ; 0x101df17b8
0x10032078e: lea rcx, [rip - 0x4d05] ; 0x10031ba90
0x100320795: vmovq xmm0, rcx
0x10032079a: vmovdqu xmmword ptr [rip + 0x1ad103e], xmm0 ; 0x101df17e0
0x1003207a2: mov rcx, qword ptr [rip + 0x8e4ce7] ; 0x100c05490 -> 0x10031e130 __Z12ApplyWrapperI10SetEnvHullMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x1003207a9: mov qword ptr [rip + 0x1ad1040], rcx ; 0x101df17f0
0x1003207b0: mov rcx, qword ptr [rip + 0x8e8569] ; 0x100c08d20 -> 0x10031e1c0 __Z21InitFunctionSignatureIM10SetEnvHullKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x1003207b7: mov qword ptr [rip + 0x1ad103a], rcx ; 0x101df17f8
0x1003207be: lea rcx, [rip + 0x85687c] ; 0x100b77041 SetTransform
0x1003207c5: mov qword ptr [rip + 0x1ad103c], rcx ; 0x101df1808
0x1003207cc: lea rcx, [rip + 0x1ad1035] ; 0x101df1808
0x1003207d3: mov qword ptr [rip + 0x1ad1032], 0 ; 0x101df1810
0x1003207de: mov qword ptr [rip + 0x1ad1033], rdx ; 0x101df1818
0x1003207e5: mov qword ptr [rip + 0x94f774], rcx ; 0x100c6ff60
0x1003207ec: lea rcx, [rip - 0x4d23] ; 0x10031bad0
0x1003207f3: vmovq xmm0, rcx
0x1003207f8: vmovdqu xmmword ptr [rip + 0x1ad1040], xmm0 ; 0x101df1840
0x100320800: mov rcx, qword ptr [rip + 0x8e4c79] ; 0x100c05480 -> 0x10031e1f0 __Z12ApplyWrapperI10SetEnvHullMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x100320807: mov qword ptr [rip + 0x1ad1042], rcx ; 0x101df1850
0x10032080e: mov rcx, qword ptr [rip + 0x8e84fb] ; 0x100c08d10 -> 0x10031e290 __Z21InitFunctionSignatureIM10SetEnvHullFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x100320815: mov qword ptr [rip + 0x1ad103c], rcx ; 0x101df1858
0x10032081c: lea rcx, [rip + 0x860564] ; 0x100b80d87 hull
0x100320823: mov qword ptr [rip + 0x989316], rcx ; 0x100ca9b40
0x10032082a: lea rcx, [rip + 0x98930f] ; 0x100ca9b40
0x100320831: mov rdx, qword ptr [rip + 0x957428] ; 0x100c77c60
0x100320838: mov qword ptr [rip + 0x989311], rdx ; 0x100ca9b50
0x10032083f: mov qword ptr [rip + 0x989316], 0x40 ; 0x100ca9b60
0x10032084a: mov rdx, qword ptr [rip + 0x8e6a77] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x100320851: mov qword ptr [rip + 0x989310], rdx ; 0x100ca9b68
0x100320858: mov qword ptr [rip + 0x989311], rax ; 0x100ca9b70
0x10032085f: mov qword ptr [rip + 0x98930e], 0xffffffffffffffff ; 0x100ca9b78
0x10032086a: mov qword ptr [rip + 0x98930f], rbx ; 0x100ca9b80
0x100320871: mov qword ptr [rip + 0x98930c], 0 ; 0x100ca9b88
0x10032087c: lea rdx, [rip + 0x860509] ; 0x100b80d8c Basic
0x100320883: vmovq xmm0, rdx
0x100320888: vmovdqa xmm1, xmmword ptr [rbp - 0x50]
0x10032088d: vpunpcklqdq xmm10, xmm1, xmm0
0x100320891: lea rdx, [rip + 0x1ad0fd8] ; 0x101df1870
0x100320898: lea rsi, [rip + 0x843d9a] ; 0x100b64639 Marker
0x10032089f: vmovq xmm0, rsi
0x1003208a4: lea rsi, [rip + 0x83e141] ; 0x100b5e9ec Tool_ClumpType
0x1003208ab: vmovq xmm1, rsi
0x1003208b0: vpunpcklqdq xmm0, xmm1, xmm0
0x1003208b4: vmovdqa xmmword ptr [rip + 0x1ad0fd4], xmm0 ; 0x101df1890
0x1003208bc: lea rsi, [rip + 0x1ad0fcd] ; 0x101df1890
0x1003208c3: mov qword ptr [rip + 0x1ad0fd6], rdx ; 0x101df18a0
0x1003208ca: mov qword ptr [rip + 0x989277], rsi ; 0x100ca9b48
0x1003208d1: lea rdx, [rip + 0x8604ba] ; 0x100b80d92 falloff
0x1003208d8: mov qword ptr [rip + 0x9892b1], rdx ; 0x100ca9b90
0x1003208df: lea rdx, [rip + 0x9892aa] ; 0x100ca9b90
0x1003208e6: mov qword ptr [rip + 0x9892b3], rcx ; 0x100ca9ba0
0x1003208ed: mov qword ptr [rip + 0x9892b8], 0x48 ; 0x100ca9bb0
0x1003208f8: mov qword ptr [rip + 0x9892b9], r14 ; 0x100ca9bb8
0x1003208ff: mov qword ptr [rip + 0x9892ba], rax ; 0x100ca9bc0
0x100320906: mov qword ptr [rip + 0x9892b7], 0xffffffffffffffff ; 0x100ca9bc8
0x100320911: mov qword ptr [rip + 0x9892b8], rbx ; 0x100ca9bd0
0x100320918: mov qword ptr [rip + 0x9892b5], 0 ; 0x100ca9bd8
0x100320923: lea rcx, [rip + 0x1ad0f86] ; 0x101df18b0
0x10032092a: lea rsi, [rip + 0x85cffb] ; 0x100b7d92c 10
0x100320931: vmovq xmm0, rsi
0x100320936: vmovdqa xmm1, xmmword ptr [rbp - 0x60]
0x10032093b: vpunpcklqdq xmm0, xmm1, xmm0
0x10032093f: vmovdqa xmmword ptr [rbp - 0x2a0], xmm0
0x100320947: vmovdqa xmmword ptr [rip + 0x1ad0f81], xmm0 ; 0x101df18d0
0x10032094f: lea rsi, [rip + 0x1ad0f7a] ; 0x101df18d0
0x100320956: mov qword ptr [rip + 0x1ad0f83], rcx ; 0x101df18e0
0x10032095d: mov qword ptr [rip + 0x989234], rsi ; 0x100ca9b98
0x100320964: lea rcx, [rip + 0x86042f] ; 0x100b80d9a layer
0x10032096b: mov qword ptr [rip + 0x98926e], rcx ; 0x100ca9be0
0x100320972: lea rcx, [rip + 0x989267] ; 0x100ca9be0
0x100320979: mov qword ptr [rip + 0x989270], rdx ; 0x100ca9bf0
0x100320980: mov qword ptr [rip + 0x989275], 0x4c ; 0x100ca9c00
0x10032098b: mov rdx, qword ptr [rip + 0x8e6be6] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x100320992: mov qword ptr [rip + 0x98926f], rdx ; 0x100ca9c08
0x100320999: mov qword ptr [rip + 0x989270], rax ; 0x100ca9c10
0x1003209a0: mov qword ptr [rip + 0x98926d], 0xffffffffffffffff ; 0x100ca9c18
0x1003209ab: mov qword ptr [rip + 0x98926e], rbx ; 0x100ca9c20
0x1003209b2: mov qword ptr [rip + 0x98926b], 0 ; 0x100ca9c28
0x1003209bd: lea rdx, [rip + 0x1ad0f2c] ; 0x101df18f0
0x1003209c4: lea rsi, [rip + 0x8843f5] ; 0x100ba4dc0 0
0x1003209cb: vmovq xmm0, rsi
0x1003209d0: vpunpcklqdq xmm0, xmm1, xmm0
0x1003209d4: vmovdqa xmmword ptr [rbp - 0x50], xmm0
0x1003209d9: vmovdqa xmm11, xmm1
0x1003209dd: vmovdqa xmmword ptr [rip + 0x1ad0f2b], xmm0 ; 0x101df1910
0x1003209e5: lea rsi, [rip + 0x1ad0f24] ; 0x101df1910
0x1003209ec: mov qword ptr [rip + 0x1ad0f2d], rdx ; 0x101df1920
0x1003209f3: mov qword ptr [rip + 0x9891ee], rsi ; 0x100ca9be8
0x1003209fa: lea rdx, [rip + 0x85e8e0] ; 0x100b7f2e1 fadeInTime
0x100320a01: mov qword ptr [rip + 0x989228], rdx ; 0x100ca9c30
0x100320a08: lea rdx, [rip + 0x989221] ; 0x100ca9c30
0x100320a0f: mov qword ptr [rip + 0x98922a], rcx ; 0x100ca9c40
0x100320a16: mov qword ptr [rip + 0x98922f], 0x50 ; 0x100ca9c50
0x100320a21: mov qword ptr [rip + 0x989230], r14 ; 0x100ca9c58
0x100320a28: mov qword ptr [rip + 0x989231], rax ; 0x100ca9c60
0x100320a2f: mov qword ptr [rip + 0x98922e], 0xffffffffffffffff ; 0x100ca9c68
0x100320a3a: mov qword ptr [rip + 0x98922f], rbx ; 0x100ca9c70
0x100320a41: mov qword ptr [rip + 0x98922c], 0 ; 0x100ca9c78
0x100320a4c: lea rcx, [rip + 0x1ad0edd] ; 0x101df1930
0x100320a53: vmovdqa xmmword ptr [rip + 0x1ad0ef5], xmm0 ; 0x101df1950
0x100320a5b: lea rsi, [rip + 0x1ad0eee] ; 0x101df1950
0x100320a62: mov qword ptr [rip + 0x1ad0ef7], rcx ; 0x101df1960
0x100320a69: mov qword ptr [rip + 0x9891c8], rsi ; 0x100ca9c38
0x100320a70: lea rcx, [rip + 0x85e875] ; 0x100b7f2ec fadeOutTime
0x100320a77: mov qword ptr [rip + 0x989202], rcx ; 0x100ca9c80
0x100320a7e: lea rcx, [rip + 0x9891fb] ; 0x100ca9c80
0x100320a85: mov qword ptr [rip + 0x989204], rdx ; 0x100ca9c90
0x100320a8c: mov qword ptr [rip + 0x989209], 0x54 ; 0x100ca9ca0
0x100320a97: mov qword ptr [rip + 0x98920a], r14 ; 0x100ca9ca8
0x100320a9e: mov qword ptr [rip + 0x98920b], rax ; 0x100ca9cb0
0x100320aa5: mov qword ptr [rip + 0x989208], 0xffffffffffffffff ; 0x100ca9cb8
0x100320ab0: mov qword ptr [rip + 0x989209], rbx ; 0x100ca9cc0
0x100320ab7: mov qword ptr [rip + 0x989206], 0 ; 0x100ca9cc8
0x100320ac2: lea rdx, [rip + 0x1ad0ea7] ; 0x101df1970
0x100320ac9: vmovdqa xmmword ptr [rip + 0x1ad0ebf], xmm0 ; 0x101df1990
0x100320ad1: mov qword ptr [rip + 0x1ad0ec8], rdx ; 0x101df19a0
0x100320ad8: lea rdx, [rip + 0x1ad0eb1] ; 0x101df1990
0x100320adf: mov qword ptr [rip + 0x9891a2], rdx ; 0x100ca9c88
0x100320ae6: lea rdx, [rip + 0x83ec02] ; 0x100b5f6ef duration
0x100320aed: mov qword ptr [rip + 0x9891dc], rdx ; 0x100ca9cd0
0x100320af4: mov qword ptr [rip + 0x9891e5], rcx ; 0x100ca9ce0
0x100320afb: mov qword ptr [rip + 0x9891ea], 0x58 ; 0x100ca9cf0
0x100320b06: mov qword ptr [rip + 0x9891eb], r14 ; 0x100ca9cf8
0x100320b0d: mov qword ptr [rip + 0x9891ec], rax ; 0x100ca9d00
0x100320b14: mov qword ptr [rip + 0x9891e9], 0xffffffffffffffff ; 0x100ca9d08
0x100320b1f: mov qword ptr [rip + 0x9891ea], rbx ; 0x100ca9d10
0x100320b26: mov qword ptr [rip + 0x9891e7], 0 ; 0x100ca9d18
0x100320b31: lea rcx, [rip + 0x1ad0e78] ; 0x101df19b0
0x100320b38: vmovdqa xmmword ptr [rip + 0x1ad0e90], xmm0 ; 0x101df19d0
0x100320b40: mov qword ptr [rip + 0x1ad0e99], rcx ; 0x101df19e0
0x100320b47: lea rcx, [rip + 0x1ad0e82] ; 0x101df19d0
0x100320b4e: mov qword ptr [rip + 0x989183], rcx ; 0x100ca9cd8
0x100320b55: lea rcx, [rip + 0x989174] ; 0x100ca9cd0
0x100320b5c: lea rdx, [rip + 0x841077] ; 0x100b61bda sunAngleY
0x100320b63: mov qword ptr [rip + 0x9891b6], rdx ; 0x100ca9d20
0x100320b6a: mov qword ptr [rip + 0x9891bf], rcx ; 0x100ca9d30
0x100320b71: mov qword ptr [rip + 0x9891c4], 0x5c ; 0x100ca9d40
0x100320b7c: mov qword ptr [rip + 0x9891c5], r14 ; 0x100ca9d48
0x100320b83: mov qword ptr [rip + 0x9891c6], rax ; 0x100ca9d50
0x100320b8a: mov qword ptr [rip + 0x9891c3], 0xffffffffffffffff ; 0x100ca9d58
0x100320b95: mov qword ptr [rip + 0x9891c4], rbx ; 0x100ca9d60
0x100320b9c: mov qword ptr [rip + 0x9891c1], 0 ; 0x100ca9d68
0x100320ba7: lea rcx, [rip + 0x1ad0e42] ; 0x101df19f0
0x100320bae: vmovaps xmm0, xmmword ptr [rbp - 0x280]
0x100320bb6: vmovaps xmmword ptr [rip + 0x1ad0e52], xmm0 ; 0x101df1a10
0x100320bbe: mov qword ptr [rip + 0x1ad0e5b], rcx ; 0x101df1a20
0x100320bc5: lea rcx, [rip + 0x1ad0e44] ; 0x101df1a10
0x100320bcc: mov qword ptr [rip + 0x989155], rcx ; 0x100ca9d28
0x100320bd3: lea rcx, [rip + 0x989146] ; 0x100ca9d20
0x100320bda: lea rdx, [rip + 0x841003] ; 0x100b61be4 sunAngleXZ
0x100320be1: mov qword ptr [rip + 0x989188], rdx ; 0x100ca9d70
0x100320be8: mov qword ptr [rip + 0x989191], rcx ; 0x100ca9d80
0x100320bef: mov qword ptr [rip + 0x989196], 0x60 ; 0x100ca9d90
0x100320bfa: mov qword ptr [rip + 0x989197], r14 ; 0x100ca9d98
0x100320c01: mov qword ptr [rip + 0x989198], rax ; 0x100ca9da0
0x100320c08: mov qword ptr [rip + 0x989195], 0xffffffffffffffff ; 0x100ca9da8
0x100320c13: mov qword ptr [rip + 0x989196], rbx ; 0x100ca9db0
0x100320c1a: mov qword ptr [rip + 0x989193], 0 ; 0x100ca9db8
0x100320c25: lea rcx, [rip + 0x1ad0e04] ; 0x101df1a30
0x100320c2c: vmovaps xmm0, xmmword ptr [rbp - 0x120]
0x100320c34: vmovaps xmmword ptr [rip + 0x1ad0e14], xmm0 ; 0x101df1a50
0x100320c3c: mov qword ptr [rip + 0x1ad0e1d], rcx ; 0x101df1a60
0x100320c43: lea rcx, [rip + 0x1ad0e06] ; 0x101df1a50
0x100320c4a: mov qword ptr [rip + 0x989127], rcx ; 0x100ca9d78
0x100320c51: lea rcx, [rip + 0x989118] ; 0x100ca9d70
0x100320c58: lea rdx, [rip + 0x840f90] ; 0x100b61bef sunColor
0x100320c5f: mov qword ptr [rip + 0x98915a], rdx ; 0x100ca9dc0
0x100320c66: mov qword ptr [rip + 0x989163], rcx ; 0x100ca9dd0
0x100320c6d: mov qword ptr [rip + 0x989168], 0x70 ; 0x100ca9de0
0x100320c78: mov qword ptr [rip + 0x989169], r15 ; 0x100ca9de8
0x100320c7f: mov qword ptr [rip + 0x98916a], rax ; 0x100ca9df0
0x100320c86: mov qword ptr [rip + 0x989167], 0xffffffffffffffff ; 0x100ca9df8
0x100320c91: mov qword ptr [rip + 0x989168], rbx ; 0x100ca9e00
0x100320c98: mov qword ptr [rip + 0x989165], 0 ; 0x100ca9e08
0x100320ca3: lea rcx, [rip + 0x1ad0dc6] ; 0x101df1a70
0x100320caa: vmovaps xmm3, xmmword ptr [rbp - 0xa0]
0x100320cb2: vmovaps xmmword ptr [rip + 0x1ad0dd6], xmm3 ; 0x101df1a90
0x100320cba: mov qword ptr [rip + 0x1ad0ddf], rcx ; 0x101df1aa0
0x100320cc1: lea rcx, [rip + 0x1ad0dc8] ; 0x101df1a90
0x100320cc8: vmovaps xmm1, xmmword ptr [rbp - 0x270]
0x100320cd0: vmovaps xmmword ptr [rip + 0x1ad0dd8], xmm1 ; 0x101df1ab0
0x100320cd8: mov qword ptr [rip + 0x1ad0de1], rcx ; 0x101df1ac0
0x100320cdf: lea rcx, [rip + 0x1ad0dca] ; 0x101df1ab0
0x100320ce6: mov qword ptr [rip + 0x9890db], rcx ; 0x100ca9dc8
0x100320ced: lea rcx, [rip + 0x9890cc] ; 0x100ca9dc0
0x100320cf4: lea rdx, [rip + 0x840efd] ; 0x100b61bf8 sunSize
0x100320cfb: mov qword ptr [rip + 0x98910e], rdx ; 0x100ca9e10
0x100320d02: mov qword ptr [rip + 0x989117], rcx ; 0x100ca9e20
0x100320d09: mov qword ptr [rip + 0x98911c], 0x80 ; 0x100ca9e30
0x100320d14: mov qword ptr [rip + 0x98911d], r14 ; 0x100ca9e38
0x100320d1b: mov qword ptr [rip + 0x98911e], rax ; 0x100ca9e40
0x100320d22: mov qword ptr [rip + 0x98911b], 0xffffffffffffffff ; 0x100ca9e48
0x100320d2d: mov qword ptr [rip + 0x98911c], rbx ; 0x100ca9e50
0x100320d34: mov qword ptr [rip + 0x989119], 0 ; 0x100ca9e58
0x100320d3f: lea rcx, [rip + 0x1ad0d8a] ; 0x101df1ad0
0x100320d46: vmovaps xmm1, xmmword ptr [rbp - 0xb0]
0x100320d4e: vmovaps xmmword ptr [rip + 0x1ad0d9a], xmm1 ; 0x101df1af0
0x100320d56: mov qword ptr [rip + 0x1ad0da3], rcx ; 0x101df1b00
0x100320d5d: lea rcx, [rip + 0x1ad0d8c] ; 0x101df1af0
0x100320d64: mov qword ptr [rip + 0x9890ad], rcx ; 0x100ca9e18
0x100320d6b: lea rcx, [rip + 0x98909e] ; 0x100ca9e10
0x100320d72: lea rdx, [rip + 0x840e87] ; 0x100b61c00 sunInt
0x100320d79: mov qword ptr [rip + 0x9890e0], rdx ; 0x100ca9e60
0x100320d80: mov qword ptr [rip + 0x9890e9], rcx ; 0x100ca9e70
0x100320d87: mov qword ptr [rip + 0x9890ee], 0x88 ; 0x100ca9e80
0x100320d92: mov qword ptr [rip + 0x9890ef], r14 ; 0x100ca9e88
0x100320d99: mov qword ptr [rip + 0x9890f0], rax ; 0x100ca9e90
0x100320da0: mov qword ptr [rip + 0x9890ed], 0xffffffffffffffff ; 0x100ca9e98
0x100320dab: mov qword ptr [rip + 0x9890ee], rbx ; 0x100ca9ea0
0x100320db2: mov qword ptr [rip + 0x9890eb], 0 ; 0x100ca9ea8
0x100320dbd: lea rcx, [rip + 0x1ad0d4c] ; 0x101df1b10
0x100320dc4: vmovaps xmmword ptr [rip + 0x1ad0d64], xmm1 ; 0x101df1b30
0x100320dcc: vmovaps xmm6, xmm1
0x100320dd0: mov qword ptr [rip + 0x1ad0d69], rcx ; 0x101df1b40
0x100320dd7: lea rcx, [rip + 0x1ad0d52] ; 0x101df1b30
0x100320dde: mov qword ptr [rip + 0x989083], rcx ; 0x100ca9e68
0x100320de5: lea rcx, [rip + 0x989074] ; 0x100ca9e60
0x100320dec: lea rdx, [rip + 0x840e14] ; 0x100b61c07 sunToMoon
0x100320df3: mov qword ptr [rip + 0x9890b6], rdx ; 0x100ca9eb0
0x100320dfa: mov qword ptr [rip + 0x9890bf], rcx ; 0x100ca9ec0
0x100320e01: mov qword ptr [rip + 0x9890c4], 0x8c ; 0x100ca9ed0
0x100320e0c: mov qword ptr [rip + 0x9890c5], r14 ; 0x100ca9ed8
0x100320e13: mov qword ptr [rip + 0x9890c6], rax ; 0x100ca9ee0
0x100320e1a: mov qword ptr [rip + 0x9890c3], 0xffffffffffffffff ; 0x100ca9ee8
0x100320e25: mov qword ptr [rip + 0x9890c4], rbx ; 0x100ca9ef0
0x100320e2c: mov qword ptr [rip + 0x9890c1], 0 ; 0x100ca9ef8
0x100320e37: lea rcx, [rip + 0x1ad0d12] ; 0x101df1b50
0x100320e3e: vmovaps xmmword ptr [rip + 0x1ad0d2a], xmm0 ; 0x101df1b70
0x100320e46: vmovaps xmm7, xmm0
0x100320e4a: mov qword ptr [rip + 0x1ad0d2f], rcx ; 0x101df1b80
0x100320e51: lea rcx, [rip + 0x1ad0d18] ; 0x101df1b70
0x100320e58: mov qword ptr [rip + 0x989059], rcx ; 0x100ca9eb8
0x100320e5f: lea rcx, [rip + 0x98904a] ; 0x100ca9eb0
0x100320e66: lea rdx, [rip + 0x840da4] ; 0x100b61c11 moonPhase
0x100320e6d: mov qword ptr [rip + 0x98908c], rdx ; 0x100ca9f00
0x100320e74: mov qword ptr [rip + 0x989095], rcx ; 0x100ca9f10
0x100320e7b: mov qword ptr [rip + 0x98909a], 0x90 ; 0x100ca9f20
0x100320e86: mov qword ptr [rip + 0x98909b], r14 ; 0x100ca9f28
0x100320e8d: mov qword ptr [rip + 0x98909c], rax ; 0x100ca9f30
0x100320e94: mov qword ptr [rip + 0x989099], 0xffffffffffffffff ; 0x100ca9f38
0x100320e9f: mov qword ptr [rip + 0x98909a], rbx ; 0x100ca9f40
0x100320ea6: mov qword ptr [rip + 0x989097], 0 ; 0x100ca9f48
0x100320eb1: lea rcx, [rip + 0x1ad0cd8] ; 0x101df1b90
0x100320eb8: vmovaps xmm2, xmmword ptr [rbp - 0x100]
0x100320ec0: vmovaps xmmword ptr [rip + 0x1ad0ce8], xmm2 ; 0x101df1bb0
0x100320ec8: mov qword ptr [rip + 0x1ad0cf1], rcx ; 0x101df1bc0
0x100320ecf: lea rcx, [rip + 0x1ad0cda] ; 0x101df1bb0
0x100320ed6: mov qword ptr [rip + 0x98902b], rcx ; 0x100ca9f08
0x100320edd: lea rcx, [rip + 0x98901c] ; 0x100ca9f00
0x100320ee4: lea rdx, [rip + 0x840d3c] ; 0x100b61c27 tintTop
0x100320eeb: mov qword ptr [rip + 0x98905e], rdx ; 0x100ca9f50
0x100320ef2: mov qword ptr [rip + 0x989067], rcx ; 0x100ca9f60
0x100320ef9: mov qword ptr [rip + 0x98906c], 0xa0 ; 0x100ca9f70
0x100320f04: mov qword ptr [rip + 0x98906d], r15 ; 0x100ca9f78
0x100320f0b: mov qword ptr [rip + 0x98906e], rax ; 0x100ca9f80
0x100320f12: mov qword ptr [rip + 0x98906b], 0xffffffffffffffff ; 0x100ca9f88
0x100320f1d: mov qword ptr [rip + 0x98906c], rbx ; 0x100ca9f90
0x100320f24: mov qword ptr [rip + 0x989069], 0 ; 0x100ca9f98
0x100320f2f: lea rcx, [rip + 0x1ad0c9a] ; 0x101df1bd0
0x100320f36: vmovaps xmm0, xmm3
0x100320f3a: vmovaps xmmword ptr [rip + 0x1ad0cae], xmm0 ; 0x101df1bf0
0x100320f42: mov qword ptr [rip + 0x1ad0cb7], rcx ; 0x101df1c00
0x100320f49: lea rcx, [rip + 0x1ad0ca0] ; 0x101df1bf0
0x100320f50: vmovaps xmm5, xmmword ptr [rbp - 0xc0]
0x100320f58: vmovaps xmmword ptr [rip + 0x1ad0cb0], xmm5 ; 0x101df1c10
0x100320f60: mov qword ptr [rip + 0x1ad0cb9], rcx ; 0x101df1c20
0x100320f67: lea rcx, [rip + 0x1ad0ca2] ; 0x101df1c10
0x100320f6e: mov qword ptr [rip + 0x988fe3], rcx ; 0x100ca9f58
0x100320f75: lea rcx, [rip + 0x988fd4] ; 0x100ca9f50
0x100320f7c: lea rdx, [rip + 0x840cac] ; 0x100b61c2f tintMidTop
0x100320f83: mov qword ptr [rip + 0x989016], rdx ; 0x100ca9fa0
0x100320f8a: mov qword ptr [rip + 0x98901f], rcx ; 0x100ca9fb0
0x100320f91: mov qword ptr [rip + 0x989024], 0xb0 ; 0x100ca9fc0
0x100320f9c: mov qword ptr [rip + 0x989025], r15 ; 0x100ca9fc8
0x100320fa3: mov qword ptr [rip + 0x989026], rax ; 0x100ca9fd0
0x100320faa: mov qword ptr [rip + 0x989023], 0xffffffffffffffff ; 0x100ca9fd8
0x100320fb5: mov qword ptr [rip + 0x989024], rbx ; 0x100ca9fe0
0x100320fbc: mov qword ptr [rip + 0x989021], 0 ; 0x100ca9fe8
0x100320fc7: lea rcx, [rip + 0x1ad0c62] ; 0x101df1c30
0x100320fce: vmovaps xmmword ptr [rip + 0x1ad0c7a], xmm0 ; 0x101df1c50
0x100320fd6: mov qword ptr [rip + 0x1ad0c83], rcx ; 0x101df1c60
0x100320fdd: lea rcx, [rip + 0x1ad0c6c] ; 0x101df1c50
0x100320fe4: vmovaps xmm1, xmmword ptr [rbp - 0xf0]
0x100320fec: vmovaps xmmword ptr [rip + 0x1ad0c7c], xmm1 ; 0x101df1c70
0x100320ff4: mov qword ptr [rip + 0x1ad0c85], rcx ; 0x101df1c80
0x100320ffb: lea rcx, [rip + 0x1ad0c6e] ; 0x101df1c70
0x100321002: mov qword ptr [rip + 0x988f9f], rcx ; 0x100ca9fa8
0x100321009: lea rcx, [rip + 0x988f90] ; 0x100ca9fa0
0x100321010: lea rdx, [rip + 0x840c23] ; 0x100b61c3a tintMidMid
0x100321017: mov qword ptr [rip + 0x988fd2], rdx ; 0x100ca9ff0
0x10032101e: mov qword ptr [rip + 0x988fdb], rcx ; 0x100caa000
0x100321025: mov qword ptr [rip + 0x988fe0], 0xc0 ; 0x100caa010
0x100321030: mov qword ptr [rip + 0x988fe1], r15 ; 0x100caa018
0x100321037: mov qword ptr [rip + 0x988fe2], rax ; 0x100caa020
0x10032103e: mov qword ptr [rip + 0x988fdf], 0xffffffffffffffff ; 0x100caa028
0x100321049: mov qword ptr [rip + 0x988fe0], rbx ; 0x100caa030
0x100321050: mov qword ptr [rip + 0x988fdd], 0 ; 0x100caa038
0x10032105b: lea rcx, [rip + 0x1ad0c2e] ; 0x101df1c90
0x100321062: vmovaps xmmword ptr [rip + 0x1ad0c46], xmm0 ; 0x101df1cb0
0x10032106a: mov qword ptr [rip + 0x1ad0c4f], rcx ; 0x101df1cc0
0x100321071: lea rcx, [rip + 0x1ad0c38] ; 0x101df1cb0
0x100321078: vmovaps xmm3, xmmword ptr [rbp - 0xe0]
0x100321080: vmovaps xmmword ptr [rip + 0x1ad0c48], xmm3 ; 0x101df1cd0
0x100321088: mov qword ptr [rip + 0x1ad0c51], rcx ; 0x101df1ce0
0x10032108f: lea rcx, [rip + 0x1ad0c3a] ; 0x101df1cd0
0x100321096: mov qword ptr [rip + 0x988f5b], rcx ; 0x100ca9ff8
0x10032109d: lea rcx, [rip + 0x988f4c] ; 0x100ca9ff0
0x1003210a4: lea rdx, [rip + 0x840b9a] ; 0x100b61c45 tintMidBot
0x1003210ab: mov qword ptr [rip + 0x988f8e], rdx ; 0x100caa040
0x1003210b2: mov qword ptr [rip + 0x988f97], rcx ; 0x100caa050
0x1003210b9: mov qword ptr [rip + 0x988f9c], 0xd0 ; 0x100caa060
0x1003210c4: mov qword ptr [rip + 0x988f9d], r15 ; 0x100caa068
0x1003210cb: mov qword ptr [rip + 0x988f9e], rax ; 0x100caa070
0x1003210d2: mov qword ptr [rip + 0x988f9b], 0xffffffffffffffff ; 0x100caa078
0x1003210dd: mov qword ptr [rip + 0x988f9c], rbx ; 0x100caa080
0x1003210e4: mov qword ptr [rip + 0x988f99], 0 ; 0x100caa088
0x1003210ef: lea rcx, [rip + 0x1ad0bfa] ; 0x101df1cf0
0x1003210f6: vmovaps xmmword ptr [rip + 0x1ad0c12], xmm0 ; 0x101df1d10
0x1003210fe: mov qword ptr [rip + 0x1ad0c1b], rcx ; 0x101df1d20
0x100321105: lea rcx, [rip + 0x1ad0c04] ; 0x101df1d10
0x10032110c: vmovaps xmm4, xmmword ptr [rbp - 0xd0]
0x100321114: vmovaps xmmword ptr [rip + 0x1ad0c14], xmm4 ; 0x101df1d30
0x10032111c: mov qword ptr [rip + 0x1ad0c1d], rcx ; 0x101df1d40
0x100321123: lea rcx, [rip + 0x1ad0c06] ; 0x101df1d30
0x10032112a: mov qword ptr [rip + 0x988f17], rcx ; 0x100caa048
0x100321131: lea rcx, [rip + 0x988f08] ; 0x100caa040
0x100321138: lea rdx, [rip + 0x840b11] ; 0x100b61c50 tintBot
0x10032113f: mov qword ptr [rip + 0x988f4a], rdx ; 0x100caa090
0x100321146: mov qword ptr [rip + 0x988f53], rcx ; 0x100caa0a0
0x10032114d: mov qword ptr [rip + 0x988f58], 0xe0 ; 0x100caa0b0
0x100321158: mov qword ptr [rip + 0x988f59], r15 ; 0x100caa0b8
0x10032115f: mov qword ptr [rip + 0x988f5a], rax ; 0x100caa0c0
0x100321166: mov qword ptr [rip + 0x988f57], 0xffffffffffffffff ; 0x100caa0c8
0x100321171: mov qword ptr [rip + 0x988f58], rbx ; 0x100caa0d0
0x100321178: mov qword ptr [rip + 0x988f55], 0 ; 0x100caa0d8
0x100321183: lea rcx, [rip + 0x1ad0bc6] ; 0x101df1d50
0x10032118a: vmovaps xmmword ptr [rip + 0x1ad0bde], xmm0 ; 0x101df1d70
0x100321192: mov qword ptr [rip + 0x1ad0be7], rcx ; 0x101df1d80
0x100321199: lea rcx, [rip + 0x1ad0bd0] ; 0x101df1d70
0x1003211a0: vmovaps xmm8, xmmword ptr [rbp - 0x110]
0x1003211a8: vmovaps xmmword ptr [rip + 0x1ad0be0], xmm8 ; 0x101df1d90
0x1003211b0: mov qword ptr [rip + 0x1ad0be9], rcx ; 0x101df1da0
0x1003211b7: lea rcx, [rip + 0x1ad0bd2] ; 0x101df1d90
0x1003211be: mov qword ptr [rip + 0x988ed3], rcx ; 0x100caa098
0x1003211c5: lea rcx, [rip + 0x988ec4] ; 0x100caa090
0x1003211cc: lea rdx, [rip + 0x840a85] ; 0x100b61c58 atmosphereDensity
0x1003211d3: mov qword ptr [rip + 0x988f06], rdx ; 0x100caa0e0
0x1003211da: mov qword ptr [rip + 0x988f0f], rcx ; 0x100caa0f0
0x1003211e1: mov qword ptr [rip + 0x988f14], 0xf0 ; 0x100caa100
0x1003211ec: mov qword ptr [rip + 0x988f15], r14 ; 0x100caa108
0x1003211f3: mov qword ptr [rip + 0x988f16], rax ; 0x100caa110
0x1003211fa: mov qword ptr [rip + 0x988f13], 0xffffffffffffffff ; 0x100caa118
0x100321205: mov qword ptr [rip + 0x988f14], rbx ; 0x100caa120
0x10032120c: mov qword ptr [rip + 0x988f11], 0 ; 0x100caa128
0x100321217: lea rcx, [rip + 0x1ad0b92] ; 0x101df1db0
0x10032121e: vmovaps xmmword ptr [rip + 0x1ad0baa], xmm6 ; 0x101df1dd0
0x100321226: vmovaps xmm9, xmm6
0x10032122a: mov qword ptr [rip + 0x1ad0baf], rcx ; 0x101df1de0
0x100321231: lea rcx, [rip + 0x1ad0b98] ; 0x101df1dd0
0x100321238: mov qword ptr [rip + 0x988ea9], rcx ; 0x100caa0e8
0x10032123f: lea rcx, [rip + 0x988e9a] ; 0x100caa0e0
0x100321246: lea rdx, [rip + 0x840a1d] ; 0x100b61c6a cheapFogEnabled
0x10032124d: mov qword ptr [rip + 0x988edc], rdx ; 0x100caa130
0x100321254: mov qword ptr [rip + 0x988ee5], rcx ; 0x100caa140
0x10032125b: mov qword ptr [rip + 0x988eea], 0xf4 ; 0x100caa150
0x100321266: mov rcx, qword ptr [rip + 0x8e62eb] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10032126d: mov qword ptr [rip + 0x988ee4], rcx ; 0x100caa158
0x100321274: mov qword ptr [rip + 0x988ee5], rax ; 0x100caa160
0x10032127b: mov qword ptr [rip + 0x988ee2], 0xffffffffffffffff ; 0x100caa168
0x100321286: mov qword ptr [rip + 0x988ee3], rbx ; 0x100caa170
0x10032128d: mov qword ptr [rip + 0x988ee0], 0 ; 0x100caa178
0x100321298: lea rcx, [rip + 0x1ad0b51] ; 0x101df1df0
0x10032129f: vmovaps xmm6, xmmword ptr [rbp - 0x210]
0x1003212a7: vmovaps xmmword ptr [rip + 0x1ad0b61], xmm6 ; 0x101df1e10
0x1003212af: mov qword ptr [rip + 0x1ad0b6a], rcx ; 0x101df1e20
0x1003212b6: lea rcx, [rip + 0x1ad0b53] ; 0x101df1e10
0x1003212bd: mov qword ptr [rip + 0x988e74], rcx ; 0x100caa138
0x1003212c4: lea rcx, [rip + 0x988e65] ; 0x100caa130
0x1003212cb: lea rdx, [rip + 0x840a2f] ; 0x100b61d01 cheapFogNear
0x1003212d2: mov qword ptr [rip + 0x988ea7], rdx ; 0x100caa180
0x1003212d9: mov qword ptr [rip + 0x988eb0], rcx ; 0x100caa190
0x1003212e0: mov qword ptr [rip + 0x988eb5], 0xf8 ; 0x100caa1a0
0x1003212eb: mov qword ptr [rip + 0x988eb6], r14 ; 0x100caa1a8
0x1003212f2: mov qword ptr [rip + 0x988eb7], rax ; 0x100caa1b0
0x1003212f9: mov qword ptr [rip + 0x988eb4], 0xffffffffffffffff ; 0x100caa1b8
0x100321304: mov qword ptr [rip + 0x988eb5], rbx ; 0x100caa1c0
0x10032130b: mov qword ptr [rip + 0x988eb2], 0 ; 0x100caa1c8
0x100321316: lea rcx, [rip + 0x1ad0b13] ; 0x101df1e30
0x10032131d: vmovaps xmm6, xmmword ptr [rbp - 0x150]
0x100321325: vmovaps xmmword ptr [rip + 0x1ad0b23], xmm6 ; 0x101df1e50
0x10032132d: mov qword ptr [rip + 0x1ad0b2c], rcx ; 0x101df1e60
0x100321334: lea rcx, [rip + 0x1ad0b15] ; 0x101df1e50
0x10032133b: mov qword ptr [rip + 0x988e46], rcx ; 0x100caa188
0x100321342: lea rcx, [rip + 0x988e37] ; 0x100caa180
0x100321349: mov qword ptr [rip + 0x988e80], r13 ; 0x100caa1d0
0x100321350: mov qword ptr [rip + 0x988e89], rcx ; 0x100caa1e0
0x100321357: mov qword ptr [rip + 0x988e8e], 0xfc ; 0x100caa1f0
0x100321362: mov qword ptr [rip + 0x988e8f], r14 ; 0x100caa1f8
0x100321369: mov qword ptr [rip + 0x988e90], rax ; 0x100caa200
0x100321370: mov qword ptr [rip + 0x988e8d], 0xffffffffffffffff ; 0x100caa208
0x10032137b: mov qword ptr [rip + 0x988e8e], rbx ; 0x100caa210
0x100321382: mov qword ptr [rip + 0x988e8b], 0 ; 0x100caa218
0x10032138d: lea rcx, [rip + 0x1ad0adc] ; 0x101df1e70
0x100321394: vmovaps xmm6, xmmword ptr [rbp - 0x160]
0x10032139c: vmovaps xmmword ptr [rip + 0x1ad0aec], xmm6 ; 0x101df1e90
0x1003213a4: mov qword ptr [rip + 0x1ad0af5], rcx ; 0x101df1ea0
0x1003213ab: lea rcx, [rip + 0x1ad0ade] ; 0x101df1e90
0x1003213b2: mov qword ptr [rip + 0x988e1f], rcx ; 0x100caa1d8
0x1003213b9: lea rcx, [rip + 0x988e10] ; 0x100caa1d0
0x1003213c0: mov qword ptr [rip + 0x988e59], r12 ; 0x100caa220
0x1003213c7: mov qword ptr [rip + 0x988e62], rcx ; 0x100caa230
0x1003213ce: mov qword ptr [rip + 0x988e67], 0x100 ; 0x100caa240
0x1003213d9: mov qword ptr [rip + 0x988e68], r14 ; 0x100caa248
0x1003213e0: mov qword ptr [rip + 0x988e69], rax ; 0x100caa250
0x1003213e7: mov qword ptr [rip + 0x988e66], 0xffffffffffffffff ; 0x100caa258
0x1003213f2: mov qword ptr [rip + 0x988e67], rbx ; 0x100caa260
0x1003213f9: mov qword ptr [rip + 0x988e64], 0 ; 0x100caa268
0x100321404: lea rcx, [rip + 0x1ad0aa5] ; 0x101df1eb0
0x10032140b: vmovaps xmm6, xmmword ptr [rbp - 0x170]
0x100321413: vmovaps xmmword ptr [rip + 0x1ad0ab5], xmm6 ; 0x101df1ed0
0x10032141b: mov qword ptr [rip + 0x1ad0abe], rcx ; 0x101df1ee0
0x100321422: lea rcx, [rip + 0x1ad0aa7] ; 0x101df1ed0
0x100321429: mov qword ptr [rip + 0x988df8], rcx ; 0x100caa228
0x100321430: lea rcx, [rip + 0x988de9] ; 0x100caa220
0x100321437: lea rdx, [rip + 0x8408f1] ; 0x100b61d2f cheapFogHeight
0x10032143e: mov qword ptr [rip + 0x988e2b], rdx ; 0x100caa270
0x100321445: mov qword ptr [rip + 0x988e34], rcx ; 0x100caa280
0x10032144c: mov qword ptr [rip + 0x988e39], 0x104 ; 0x100caa290
0x100321457: mov qword ptr [rip + 0x988e3a], r14 ; 0x100caa298
0x10032145e: mov qword ptr [rip + 0x988e3b], rax ; 0x100caa2a0
0x100321465: mov qword ptr [rip + 0x988e38], 0xffffffffffffffff ; 0x100caa2a8
0x100321470: mov qword ptr [rip + 0x988e39], rbx ; 0x100caa2b0
0x100321477: mov qword ptr [rip + 0x988e36], 0 ; 0x100caa2b8
0x100321482: lea rcx, [rip + 0x1ad0a67] ; 0x101df1ef0
0x100321489: vmovaps xmmword ptr [rip + 0x1ad0a7f], xmm2 ; 0x101df1f10
0x100321491: mov qword ptr [rip + 0x1ad0a88], rcx ; 0x101df1f20
0x100321498: lea rcx, [rip + 0x1ad0a71] ; 0x101df1f10
0x10032149f: mov qword ptr [rip + 0x988dd2], rcx ; 0x100caa278
0x1003214a6: lea rcx, [rip + 0x988dc3] ; 0x100caa270
0x1003214ad: lea rdx, [rip + 0x84088a] ; 0x100b61d3e cheapFogHeightDensity
0x1003214b4: mov qword ptr [rip + 0x988e05], rdx ; 0x100caa2c0
0x1003214bb: mov qword ptr [rip + 0x988e0e], rcx ; 0x100caa2d0
0x1003214c2: mov qword ptr [rip + 0x988e13], 0x108 ; 0x100caa2e0
0x1003214cd: mov qword ptr [rip + 0x988e14], r14 ; 0x100caa2e8
0x1003214d4: mov qword ptr [rip + 0x988e15], rax ; 0x100caa2f0
0x1003214db: mov qword ptr [rip + 0x988e12], 0xffffffffffffffff ; 0x100caa2f8
0x1003214e6: mov qword ptr [rip + 0x988e13], rbx ; 0x100caa300
0x1003214ed: mov qword ptr [rip + 0x988e10], 0 ; 0x100caa308
0x1003214f8: lea rcx, [rip + 0x1ad0a31] ; 0x101df1f30
0x1003214ff: vmovaps xmmword ptr [rip + 0x1ad0a49], xmm7 ; 0x101df1f50
0x100321507: mov qword ptr [rip + 0x1ad0a52], rcx ; 0x101df1f60
0x10032150e: lea rcx, [rip + 0x1ad0a3b] ; 0x101df1f50
0x100321515: mov qword ptr [rip + 0x988dac], rcx ; 0x100caa2c8
0x10032151c: lea rcx, [rip + 0x988d9d] ; 0x100caa2c0
0x100321523: lea rdx, [rip + 0x840750] ; 0x100b61c7a cheapFogTintTop
0x10032152a: mov qword ptr [rip + 0x988ddf], rdx ; 0x100caa310
0x100321531: mov qword ptr [rip + 0x988de8], rcx ; 0x100caa320
0x100321538: mov qword ptr [rip + 0x988ded], 0x110 ; 0x100caa330
0x100321543: mov qword ptr [rip + 0x988dee], r15 ; 0x100caa338
0x10032154a: mov qword ptr [rip + 0x988def], rax ; 0x100caa340
0x100321551: mov qword ptr [rip + 0x988dec], 0xffffffffffffffff ; 0x100caa348
0x10032155c: mov qword ptr [rip + 0x988ded], rbx ; 0x100caa350
0x100321563: mov qword ptr [rip + 0x988dea], 0 ; 0x100caa358
0x10032156e: lea rcx, [rip + 0x1ad09fb] ; 0x101df1f70
0x100321575: vmovaps xmmword ptr [rip + 0x1ad0a13], xmm0 ; 0x101df1f90
0x10032157d: mov qword ptr [rip + 0x1ad0a1c], rcx ; 0x101df1fa0
0x100321584: lea rcx, [rip + 0x1ad0a05] ; 0x101df1f90
0x10032158b: vmovaps xmmword ptr [rip + 0x1ad0a1d], xmm5 ; 0x101df1fb0
0x100321593: mov qword ptr [rip + 0x1ad0a26], rcx ; 0x101df1fc0
0x10032159a: lea rcx, [rip + 0x1ad0a0f] ; 0x101df1fb0
0x1003215a1: mov qword ptr [rip + 0x988d70], rcx ; 0x100caa318
0x1003215a8: lea rcx, [rip + 0x988d61] ; 0x100caa310
0x1003215af: lea rdx, [rip + 0x8406d4] ; 0x100b61c8a cheapFogTintMidTop
0x1003215b6: mov qword ptr [rip + 0x988da3], rdx ; 0x100caa360
0x1003215bd: mov qword ptr [rip + 0x988dac], rcx ; 0x100caa370
0x1003215c4: mov qword ptr [rip + 0x988db1], 0x120 ; 0x100caa380
0x1003215cf: mov qword ptr [rip + 0x988db2], r15 ; 0x100caa388
0x1003215d6: mov qword ptr [rip + 0x988db3], rax ; 0x100caa390
0x1003215dd: mov qword ptr [rip + 0x988db0], 0xffffffffffffffff ; 0x100caa398
0x1003215e8: mov qword ptr [rip + 0x988db1], rbx ; 0x100caa3a0
0x1003215ef: mov qword ptr [rip + 0x988dae], 0 ; 0x100caa3a8
0x1003215fa: lea rcx, [rip + 0x1ad09cf] ; 0x101df1fd0
0x100321601: vmovaps xmmword ptr [rip + 0x1ad09e7], xmm0 ; 0x101df1ff0
0x100321609: mov qword ptr [rip + 0x1ad09f0], rcx ; 0x101df2000
0x100321610: lea rcx, [rip + 0x1ad09d9] ; 0x101df1ff0
0x100321617: vmovaps xmmword ptr [rip + 0x1ad09f1], xmm1 ; 0x101df2010
0x10032161f: mov qword ptr [rip + 0x1ad09fa], rcx ; 0x101df2020
0x100321626: lea rcx, [rip + 0x1ad09e3] ; 0x101df2010
0x10032162d: mov qword ptr [rip + 0x988d34], rcx ; 0x100caa368
0x100321634: lea rcx, [rip + 0x988d25] ; 0x100caa360
0x10032163b: lea rdx, [rip + 0x84065b] ; 0x100b61c9d cheapFogTintMidMid
0x100321642: mov qword ptr [rip + 0x988d67], rdx ; 0x100caa3b0
0x100321649: mov qword ptr [rip + 0x988d70], rcx ; 0x100caa3c0
0x100321650: mov qword ptr [rip + 0x988d75], 0x130 ; 0x100caa3d0
0x10032165b: mov qword ptr [rip + 0x988d76], r15 ; 0x100caa3d8
0x100321662: mov qword ptr [rip + 0x988d77], rax ; 0x100caa3e0
0x100321669: mov qword ptr [rip + 0x988d74], 0xffffffffffffffff ; 0x100caa3e8
0x100321674: mov qword ptr [rip + 0x988d75], rbx ; 0x100caa3f0
0x10032167b: mov qword ptr [rip + 0x988d72], 0 ; 0x100caa3f8
0x100321686: lea rcx, [rip + 0x1ad09a3] ; 0x101df2030
0x10032168d: vmovaps xmmword ptr [rip + 0x1ad09bb], xmm0 ; 0x101df2050
0x100321695: mov qword ptr [rip + 0x1ad09c4], rcx ; 0x101df2060
0x10032169c: lea rcx, [rip + 0x1ad09ad] ; 0x101df2050
0x1003216a3: vmovaps xmmword ptr [rip + 0x1ad09c5], xmm3 ; 0x101df2070
0x1003216ab: mov qword ptr [rip + 0x1ad09ce], rcx ; 0x101df2080
0x1003216b2: lea rcx, [rip + 0x1ad09b7] ; 0x101df2070
0x1003216b9: mov qword ptr [rip + 0x988cf8], rcx ; 0x100caa3b8
0x1003216c0: lea rcx, [rip + 0x988ce9] ; 0x100caa3b0
0x1003216c7: lea rdx, [rip + 0x8405e2] ; 0x100b61cb0 cheapFogTintMidBot
0x1003216ce: mov qword ptr [rip + 0x988d2b], rdx ; 0x100caa400
0x1003216d5: mov qword ptr [rip + 0x988d34], rcx ; 0x100caa410
0x1003216dc: mov qword ptr [rip + 0x988d39], 0x140 ; 0x100caa420
0x1003216e7: mov qword ptr [rip + 0x988d3a], r15 ; 0x100caa428
0x1003216ee: mov qword ptr [rip + 0x988d3b], rax ; 0x100caa430
0x1003216f5: mov qword ptr [rip + 0x988d38], 0xffffffffffffffff ; 0x100caa438
0x100321700: mov qword ptr [rip + 0x988d39], rbx ; 0x100caa440
0x100321707: mov qword ptr [rip + 0x988d36], 0 ; 0x100caa448
0x100321712: lea rcx, [rip + 0x1ad0977] ; 0x101df2090
0x100321719: vmovaps xmmword ptr [rip + 0x1ad098f], xmm0 ; 0x101df20b0
0x100321721: mov qword ptr [rip + 0x1ad0998], rcx ; 0x101df20c0
0x100321728: lea rcx, [rip + 0x1ad0981] ; 0x101df20b0
0x10032172f: vmovaps xmmword ptr [rip + 0x1ad0999], xmm4 ; 0x101df20d0
0x100321737: mov qword ptr [rip + 0x1ad09a2], rcx ; 0x101df20e0
0x10032173e: lea rcx, [rip + 0x1ad098b] ; 0x101df20d0
0x100321745: mov qword ptr [rip + 0x988cbc], rcx ; 0x100caa408
0x10032174c: lea rcx, [rip + 0x988cad] ; 0x100caa400
0x100321753: lea rdx, [rip + 0x840569] ; 0x100b61cc3 cheapFogTintBot
0x10032175a: mov qword ptr [rip + 0x988cef], rdx ; 0x100caa450
0x100321761: mov qword ptr [rip + 0x988cf8], rcx ; 0x100caa460
0x100321768: mov qword ptr [rip + 0x988cfd], 0x150 ; 0x100caa470
0x100321773: mov qword ptr [rip + 0x988cfe], r15 ; 0x100caa478
0x10032177a: mov qword ptr [rip + 0x988cff], rax ; 0x100caa480
0x100321781: mov qword ptr [rip + 0x988cfc], 0xffffffffffffffff ; 0x100caa488
0x10032178c: mov qword ptr [rip + 0x988cfd], rbx ; 0x100caa490
0x100321793: mov qword ptr [rip + 0x988cfa], 0 ; 0x100caa498
0x10032179e: lea rcx, [rip + 0x1ad094b] ; 0x101df20f0
0x1003217a5: vmovaps xmmword ptr [rip + 0x1ad0963], xmm0 ; 0x101df2110
0x1003217ad: vmovaps xmm3, xmm0
0x1003217b1: mov qword ptr [rip + 0x1ad0968], rcx ; 0x101df2120
0x1003217b8: lea rcx, [rip + 0x1ad0951] ; 0x101df2110
0x1003217bf: vmovaps xmmword ptr [rip + 0x1ad0969], xmm8 ; 0x101df2130
0x1003217c7: mov qword ptr [rip + 0x1ad0972], rcx ; 0x101df2140
0x1003217ce: lea rcx, [rip + 0x1ad095b] ; 0x101df2130
0x1003217d5: mov qword ptr [rip + 0x988c7c], rcx ; 0x100caa458
0x1003217dc: lea rcx, [rip + 0x988c6d] ; 0x100caa450
0x1003217e3: lea rdx, [rip + 0x8404f5] ; 0x100b61cdf fogDensity
0x1003217ea: mov qword ptr [rip + 0x988caf], rdx ; 0x100caa4a0
0x1003217f1: mov qword ptr [rip + 0x988cb8], rcx ; 0x100caa4b0
0x1003217f8: mov qword ptr [rip + 0x988cbd], 0x160 ; 0x100caa4c0
0x100321803: mov qword ptr [rip + 0x988cbe], r14 ; 0x100caa4c8
0x10032180a: mov qword ptr [rip + 0x988cbf], rax ; 0x100caa4d0
0x100321811: mov qword ptr [rip + 0x988cbc], 0xffffffffffffffff ; 0x100caa4d8
0x10032181c: mov qword ptr [rip + 0x988cbd], rbx ; 0x100caa4e0
0x100321823: mov qword ptr [rip + 0x988cba], 0 ; 0x100caa4e8
0x10032182e: lea rcx, [rip + 0x1ad091b] ; 0x101df2150
0x100321835: vmovaps xmmword ptr [rip + 0x1ad0933], xmm9 ; 0x101df2170
0x10032183d: mov qword ptr [rip + 0x1ad093c], rcx ; 0x101df2180
0x100321844: lea rcx, [rip + 0x1ad0925] ; 0x101df2170
0x10032184b: mov qword ptr [rip + 0x988c56], rcx ; 0x100caa4a8
0x100321852: lea rcx, [rip + 0x988c47] ; 0x100caa4a0
0x100321859: lea rdx, [rip + 0x84048a] ; 0x100b61cea fogHeight
0x100321860: mov qword ptr [rip + 0x988c89], rdx ; 0x100caa4f0
0x100321867: mov qword ptr [rip + 0x988c92], rcx ; 0x100caa500
0x10032186e: mov qword ptr [rip + 0x988c97], 0x164 ; 0x100caa510
0x100321879: mov qword ptr [rip + 0x988c98], r14 ; 0x100caa518
0x100321880: mov qword ptr [rip + 0x988c99], rax ; 0x100caa520
0x100321887: mov qword ptr [rip + 0x988c96], 0xffffffffffffffff ; 0x100caa528
0x100321892: mov qword ptr [rip + 0x988c97], rbx ; 0x100caa530
0x100321899: mov qword ptr [rip + 0x988c94], 0 ; 0x100caa538
0x1003218a4: lea rcx, [rip + 0x1ad08e5] ; 0x101df2190
0x1003218ab: vmovaps xmm0, xmmword ptr [rbp - 0x180]
0x1003218b3: vmovaps xmmword ptr [rip + 0x1ad08f5], xmm0 ; 0x101df21b0
0x1003218bb: mov qword ptr [rip + 0x1ad08fe], rcx ; 0x101df21c0
0x1003218c2: lea rcx, [rip + 0x1ad08e7] ; 0x101df21b0
0x1003218c9: mov qword ptr [rip + 0x988c28], rcx ; 0x100caa4f8
0x1003218d0: lea rcx, [rip + 0x988c19] ; 0x100caa4f0
0x1003218d7: lea rdx, [rip + 0x840416] ; 0x100b61cf4 drawDistance
0x1003218de: mov qword ptr [rip + 0x988c5b], rdx ; 0x100caa540
0x1003218e5: mov qword ptr [rip + 0x988c64], rcx ; 0x100caa550
0x1003218ec: mov qword ptr [rip + 0x988c69], 0x168 ; 0x100caa560
0x1003218f7: mov qword ptr [rip + 0x988c6a], r14 ; 0x100caa568
0x1003218fe: mov qword ptr [rip + 0x988c6b], rax ; 0x100caa570
0x100321905: mov qword ptr [rip + 0x988c68], 0xffffffffffffffff ; 0x100caa578
0x100321910: mov qword ptr [rip + 0x988c69], rbx ; 0x100caa580
0x100321917: mov qword ptr [rip + 0x988c66], 0 ; 0x100caa588
0x100321922: lea rcx, [rip + 0x1ad08a7] ; 0x101df21d0
0x100321929: vmovaps xmm0, xmmword ptr [rbp - 0x190]
0x100321931: vmovaps xmmword ptr [rip + 0x1ad08b7], xmm0 ; 0x101df21f0
0x100321939: mov qword ptr [rip + 0x1ad08c0], rcx ; 0x101df2200
0x100321940: lea rcx, [rip + 0x1ad08a9] ; 0x101df21f0
0x100321947: mov qword ptr [rip + 0x988bfa], rcx ; 0x100caa548
0x10032194e: lea rcx, [rip + 0x988beb] ; 0x100caa540
0x100321955: lea rdx, [rip + 0x85f351] ; 0x100b80cad bloomTint
0x10032195c: mov qword ptr [rip + 0x988c2d], rdx ; 0x100caa590
0x100321963: mov qword ptr [rip + 0x988c36], rcx ; 0x100caa5a0
0x10032196a: mov qword ptr [rip + 0x988c3b], 0x170 ; 0x100caa5b0
0x100321975: mov r13, qword ptr [rip + 0x8e5454] ; 0x100c06dd0 -> 0x100066ac0 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Vector3EERK8MetaTypev
0x10032197c: mov qword ptr [rip + 0x988c35], r13 ; 0x100caa5b8
0x100321983: mov qword ptr [rip + 0x988c36], rax ; 0x100caa5c0
0x10032198a: mov qword ptr [rip + 0x988c33], 0xffffffffffffffff ; 0x100caa5c8
0x100321995: mov qword ptr [rip + 0x988c34], rbx ; 0x100caa5d0
0x10032199c: mov qword ptr [rip + 0x988c31], 0 ; 0x100caa5d8
0x1003219a7: lea rcx, [rip + 0x1ad0862] ; 0x101df2210
0x1003219ae: vmovaps xmm0, xmmword ptr [rbp - 0x1a0]
0x1003219b6: vmovaps xmmword ptr [rip + 0x1ad0872], xmm0 ; 0x101df2230
0x1003219be: mov qword ptr [rip + 0x1ad087b], rcx ; 0x101df2240
0x1003219c5: lea rcx, [rip + 0x1ad0864] ; 0x101df2230
0x1003219cc: mov qword ptr [rip + 0x988bc5], rcx ; 0x100caa598
0x1003219d3: lea rcx, [rip + 0x988bb6] ; 0x100caa590
0x1003219da: lea rdx, [rip + 0x85f2e8] ; 0x100b80cc9 bloomIntensity
0x1003219e1: mov qword ptr [rip + 0x988bf8], rdx ; 0x100caa5e0
0x1003219e8: mov qword ptr [rip + 0x988c01], rcx ; 0x100caa5f0
0x1003219ef: mov qword ptr [rip + 0x988c06], 0x180 ; 0x100caa600
0x1003219fa: mov qword ptr [rip + 0x988c07], r14 ; 0x100caa608
0x100321a01: mov qword ptr [rip + 0x988c08], rax ; 0x100caa610
0x100321a08: mov qword ptr [rip + 0x988c05], 0xffffffffffffffff ; 0x100caa618
0x100321a13: mov qword ptr [rip + 0x988c06], rbx ; 0x100caa620
0x100321a1a: mov qword ptr [rip + 0x988c03], 0 ; 0x100caa628
0x100321a25: lea rcx, [rip + 0x85f374] ; 0x100b80da0 0.2
0x100321a2c: vmovq xmm0, rcx
0x100321a31: lea rcx, [rip + 0x1ad0818] ; 0x101df2250
0x100321a38: vpunpcklqdq xmm0, xmm11, xmm0
0x100321a3c: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x100321a41: vmovdqa xmmword ptr [rip + 0x1ad0827], xmm0 ; 0x101df2270
0x100321a49: mov qword ptr [rip + 0x1ad0830], rcx ; 0x101df2280
0x100321a50: lea rcx, [rip + 0x1ad0819] ; 0x101df2270
0x100321a57: mov qword ptr [rip + 0x988b8a], rcx ; 0x100caa5e8
0x100321a5e: lea rcx, [rip + 0x988b7b] ; 0x100caa5e0
0x100321a65: lea rdx, [rip + 0x85f271] ; 0x100b80cdd bloomOverbright
0x100321a6c: mov qword ptr [rip + 0x988bbd], rdx ; 0x100caa630
0x100321a73: mov qword ptr [rip + 0x988bc6], rcx ; 0x100caa640
0x100321a7a: mov qword ptr [rip + 0x988bcb], 0x184 ; 0x100caa650
0x100321a85: mov qword ptr [rip + 0x988bcc], r14 ; 0x100caa658
0x100321a8c: mov qword ptr [rip + 0x988bcd], rax ; 0x100caa660
0x100321a93: mov qword ptr [rip + 0x988bca], 0xffffffffffffffff ; 0x100caa668
0x100321a9e: mov qword ptr [rip + 0x988bcb], rbx ; 0x100caa670
0x100321aa5: mov qword ptr [rip + 0x988bc8], 0 ; 0x100caa678
0x100321ab0: lea rcx, [rip + 0x1ad07d9] ; 0x101df2290
0x100321ab7: vmovaps xmmword ptr [rip + 0x1ad07f1], xmm7 ; 0x101df22b0
0x100321abf: mov qword ptr [rip + 0x1ad07fa], rcx ; 0x101df22c0
0x100321ac6: lea rcx, [rip + 0x1ad07e3] ; 0x101df22b0
0x100321acd: mov qword ptr [rip + 0x988b64], rcx ; 0x100caa638
0x100321ad4: lea rcx, [rip + 0x988b55] ; 0x100caa630
0x100321adb: lea rdx, [rip + 0x85f20b] ; 0x100b80ced bloomGhost
0x100321ae2: mov qword ptr [rip + 0x988b97], rdx ; 0x100caa680
0x100321ae9: mov qword ptr [rip + 0x988ba0], rcx ; 0x100caa690
0x100321af0: mov qword ptr [rip + 0x988ba5], 0x188 ; 0x100caa6a0
0x100321afb: mov qword ptr [rip + 0x988ba6], r14 ; 0x100caa6a8
0x100321b02: mov qword ptr [rip + 0x988ba7], rax ; 0x100caa6b0
0x100321b09: mov qword ptr [rip + 0x988ba4], 0xffffffffffffffff ; 0x100caa6b8
0x100321b14: mov qword ptr [rip + 0x988ba5], rbx ; 0x100caa6c0
0x100321b1b: mov qword ptr [rip + 0x988ba2], 0 ; 0x100caa6c8
0x100321b26: lea rcx, [rip + 0x1ad07a3] ; 0x101df22d0
0x100321b2d: vmovaps xmm0, xmmword ptr [rbp - 0x240]
0x100321b35: vmovaps xmmword ptr [rip + 0x1ad07b3], xmm0 ; 0x101df22f0
0x100321b3d: mov qword ptr [rip + 0x1ad07bc], rcx ; 0x101df2300
0x100321b44: lea rcx, [rip + 0x1ad07a5] ; 0x101df22f0
0x100321b4b: vmovaps xmm0, xmmword ptr [rbp - 0x230]
0x100321b53: vmovaps xmmword ptr [rip + 0x1ad07b5], xmm0 ; 0x101df2310
0x100321b5b: mov qword ptr [rip + 0x1ad07be], rcx ; 0x101df2320
0x100321b62: lea rcx, [rip + 0x1ad07a7] ; 0x101df2310
0x100321b69: mov qword ptr [rip + 0x988b18], rcx ; 0x100caa688
0x100321b70: lea rcx, [rip + 0x988b09] ; 0x100caa680
0x100321b77: lea rdx, [rip + 0x85f186] ; 0x100b80d04 bloomFalloff
0x100321b7e: mov qword ptr [rip + 0x988b4b], rdx ; 0x100caa6d0
0x100321b85: mov qword ptr [rip + 0x988b54], rcx ; 0x100caa6e0
0x100321b8c: mov qword ptr [rip + 0x988b59], 0x18c ; 0x100caa6f0
0x100321b97: mov qword ptr [rip + 0x988b5a], r14 ; 0x100caa6f8
0x100321b9e: mov qword ptr [rip + 0x988b5b], rax ; 0x100caa700
0x100321ba5: mov qword ptr [rip + 0x988b58], 0xffffffffffffffff ; 0x100caa708
0x100321bb0: mov qword ptr [rip + 0x988b59], rbx ; 0x100caa710
0x100321bb7: mov qword ptr [rip + 0x988b56], 0 ; 0x100caa718
0x100321bc2: lea rcx, [rip + 0x1ad0767] ; 0x101df2330
0x100321bc9: vmovaps xmm0, xmmword ptr [rbp - 0x260]
0x100321bd1: vmovaps xmmword ptr [rip + 0x1ad0777], xmm0 ; 0x101df2350
0x100321bd9: mov qword ptr [rip + 0x1ad0780], rcx ; 0x101df2360
0x100321be0: lea rcx, [rip + 0x1ad0769] ; 0x101df2350
0x100321be7: vmovaps xmm0, xmmword ptr [rbp - 0x250]
0x100321bef: vmovaps xmmword ptr [rip + 0x1ad0779], xmm0 ; 0x101df2370
0x100321bf7: mov qword ptr [rip + 0x1ad0782], rcx ; 0x101df2380
0x100321bfe: lea rcx, [rip + 0x1ad076b] ; 0x101df2370
0x100321c05: mov qword ptr [rip + 0x988acc], rcx ; 0x100caa6d8
0x100321c0c: lea rcx, [rip + 0x988abd] ; 0x100caa6d0
0x100321c13: lea rdx, [rip + 0x840172] ; 0x100b61d8c exposure
0x100321c1a: mov qword ptr [rip + 0x988aff], rdx ; 0x100caa720
0x100321c21: mov qword ptr [rip + 0x988b08], rcx ; 0x100caa730
0x100321c28: mov qword ptr [rip + 0x988b0d], 0x190 ; 0x100caa740
0x100321c33: mov qword ptr [rip + 0x988b0e], r14 ; 0x100caa748
0x100321c3a: mov qword ptr [rip + 0x988b0f], rax ; 0x100caa750
0x100321c41: mov qword ptr [rip + 0x988b0c], 0xffffffffffffffff ; 0x100caa758
0x100321c4c: mov qword ptr [rip + 0x988b0d], rbx ; 0x100caa760
0x100321c53: mov qword ptr [rip + 0x988b0a], 0 ; 0x100caa768
0x100321c5e: lea rcx, [rip + 0x1ad072b] ; 0x101df2390
0x100321c65: vmovaps xmmword ptr [rip + 0x1ad0743], xmm9 ; 0x101df23b0
0x100321c6d: mov qword ptr [rip + 0x1ad074c], rcx ; 0x101df23c0
0x100321c74: lea rcx, [rip + 0x1ad0735] ; 0x101df23b0
0x100321c7b: mov qword ptr [rip + 0x988aa6], rcx ; 0x100caa728
0x100321c82: lea rcx, [rip + 0x988a97] ; 0x100caa720
0x100321c89: lea rdx, [rip + 0x85f094] ; 0x100b80d24 pointColor
0x100321c90: mov qword ptr [rip + 0x988ad9], rdx ; 0x100caa770
0x100321c97: mov qword ptr [rip + 0x988ae2], rcx ; 0x100caa780
0x100321c9e: mov qword ptr [rip + 0x988ae7], 0x1a0 ; 0x100caa790
0x100321ca9: mov qword ptr [rip + 0x988ae8], r13 ; 0x100caa798
0x100321cb0: mov qword ptr [rip + 0x988ae9], rax ; 0x100caa7a0
0x100321cb7: mov qword ptr [rip + 0x988ae6], 0xffffffffffffffff ; 0x100caa7a8
0x100321cc2: mov qword ptr [rip + 0x988ae7], rbx ; 0x100caa7b0
0x100321cc9: mov qword ptr [rip + 0x988ae4], 0 ; 0x100caa7b8
0x100321cd4: lea rcx, [rip + 0x1ad06f5] ; 0x101df23d0
0x100321cdb: vmovaps xmm0, xmmword ptr [rbp - 0x140]
0x100321ce3: vmovaps xmmword ptr [rip + 0x1ad0705], xmm0 ; 0x101df23f0
0x100321ceb: mov qword ptr [rip + 0x1ad070e], rcx ; 0x101df2400
0x100321cf2: lea rcx, [rip + 0x1ad06f7] ; 0x101df23f0
0x100321cf9: vmovaps xmm1, xmmword ptr [rbp - 0x220]
0x100321d01: vmovaps xmmword ptr [rip + 0x1ad0707], xmm1 ; 0x101df2410
0x100321d09: mov qword ptr [rip + 0x1ad0710], rcx ; 0x101df2420
0x100321d10: lea rcx, [rip + 0x1ad06f9] ; 0x101df2410
0x100321d17: mov qword ptr [rip + 0x988a5a], rcx ; 0x100caa778
0x100321d1e: lea rcx, [rip + 0x988a4b] ; 0x100caa770
0x100321d25: lea rdx, [rip + 0x85f023] ; 0x100b80d4f pointIntensity
0x100321d2c: mov qword ptr [rip + 0x988a8d], rdx ; 0x100caa7c0
0x100321d33: mov qword ptr [rip + 0x988a96], rcx ; 0x100caa7d0
0x100321d3a: mov qword ptr [rip + 0x988a9b], 0x1b0 ; 0x100caa7e0
0x100321d45: mov qword ptr [rip + 0x988a9c], r14 ; 0x100caa7e8
0x100321d4c: mov qword ptr [rip + 0x988a9d], rax ; 0x100caa7f0
0x100321d53: mov qword ptr [rip + 0x988a9a], 0xffffffffffffffff ; 0x100caa7f8
0x100321d5e: mov qword ptr [rip + 0x988a9b], rbx ; 0x100caa800
0x100321d65: mov qword ptr [rip + 0x988a98], 0 ; 0x100caa808
0x100321d70: lea rcx, [rip + 0x1ad06b9] ; 0x101df2430
0x100321d77: vmovaps xmm1, xmmword ptr [rbp - 0x200]
0x100321d7f: vmovaps xmmword ptr [rip + 0x1ad06c9], xmm1 ; 0x101df2450
0x100321d87: mov qword ptr [rip + 0x1ad06d2], rcx ; 0x101df2460
0x100321d8e: lea rcx, [rip + 0x1ad06bb] ; 0x101df2450
0x100321d95: mov qword ptr [rip + 0x988a2c], rcx ; 0x100caa7c8
0x100321d9c: lea rcx, [rip + 0x988a1d] ; 0x100caa7c0
0x100321da3: lea rdx, [rip + 0x858895] ; 0x100b7a63f undulationScale
0x100321daa: mov qword ptr [rip + 0x988a5f], rdx ; 0x100caa810
0x100321db1: mov qword ptr [rip + 0x988a68], rcx ; 0x100caa820
0x100321db8: mov qword ptr [rip + 0x988a6d], 0x1b4 ; 0x100caa830
0x100321dc3: mov qword ptr [rip + 0x988a6e], r14 ; 0x100caa838
0x100321dca: mov qword ptr [rip + 0x988a6f], rax ; 0x100caa840
0x100321dd1: mov qword ptr [rip + 0x988a6c], 0xffffffffffffffff ; 0x100caa848
0x100321ddc: mov qword ptr [rip + 0x988a6d], rbx ; 0x100caa850
0x100321de3: mov qword ptr [rip + 0x988a6a], 0 ; 0x100caa858
0x100321dee: lea rcx, [rip + 0x1ad067b] ; 0x101df2470
0x100321df5: vmovaps xmmword ptr [rip + 0x1ad0693], xmm9 ; 0x101df2490
0x100321dfd: mov qword ptr [rip + 0x1ad069c], rcx ; 0x101df24a0
0x100321e04: lea rcx, [rip + 0x1ad0685] ; 0x101df2490
0x100321e0b: mov qword ptr [rip + 0x988a06], rcx ; 0x100caa818
0x100321e12: lea rcx, [rip + 0x9889f7] ; 0x100caa810
0x100321e19: lea rdx, [rip + 0x85ef44] ; 0x100b80d64 fogVolumeIntensity
0x100321e20: mov qword ptr [rip + 0x988a39], rdx ; 0x100caa860
0x100321e27: mov qword ptr [rip + 0x988a42], rcx ; 0x100caa870
0x100321e2e: lea rcx, [rip + 0x988a2b] ; 0x100caa860
0x100321e35: mov qword ptr [rip + 0x955e24], rcx ; 0x100c77c60
0x100321e3c: mov qword ptr [rip + 0x1acf95d], rax ; 0x101df17a0
0x100321e43: mov qword ptr [rip + 0x1acf9b6], rax ; 0x101df1800
0x100321e4a: mov qword ptr [rip + 0x1acfa0f], rax ; 0x101df1860
0x100321e51: mov qword ptr [rip + 0x988a24], 0x1b8 ; 0x100caa880
0x100321e5c: mov qword ptr [rip + 0x988a25], r14 ; 0x100caa888
0x100321e63: mov qword ptr [rip + 0x988a26], rax ; 0x100caa890
0x100321e6a: mov qword ptr [rip + 0x988a23], 0xffffffffffffffff ; 0x100caa898
0x100321e75: mov qword ptr [rip + 0x988a24], rbx ; 0x100caa8a0
0x100321e7c: mov qword ptr [rip + 0x988a21], 0 ; 0x100caa8a8
0x100321e87: lea rax, [rip + 0x1ad0622] ; 0x101df24b0
0x100321e8e: vmovaps xmm1, xmmword ptr [rbp - 0x1f0]
0x100321e96: vmovaps xmmword ptr [rip + 0x1ad0632], xmm1 ; 0x101df24d0
0x100321e9e: mov qword ptr [rip + 0x1ad063b], rax ; 0x101df24e0
0x100321ea5: lea rax, [rip + 0x1ad0624] ; 0x101df24d0
0x100321eac: mov qword ptr [rip + 0x9889b5], rax ; 0x100caa868
0x100321eb3: lea rax, [rip + 0x85eada] ; 0x100b80994 EnvNode
0x100321eba: mov qword ptr [rip + 0x1ad062f], rax ; 0x101df24f0
0x100321ec1: mov qword ptr [rip + 0x1ad062c], 0 ; 0x101df24f8
0x100321ecc: mov rax, qword ptr [rip + 0x94e085] ; 0x100c6ff58
0x100321ed3: mov qword ptr [rip + 0x1ad0626], rax ; 0x101df2500
0x100321eda: lea rax, [rip + 0x1ad0607] ; 0x101df24e8
0x100321ee1: mov qword ptr [rip + 0x94e070], rax ; 0x100c6ff58
0x100321ee8: mov qword ptr [rip + 0x1ad0621], rax ; 0x101df2510
0x100321eef: lea rax, [rip - 0x2ec636] ; 0x1000358c0
0x100321ef6: mov qword ptr [rip + 0x1ad061b], rax ; 0x101df2518
0x100321efd: mov dword ptr [rip + 0x1ad0619], 0xffffffff ; 0x101df2520
0x100321f07: mov dword ptr [rip + 0x1ad0613], 0xffffffff ; 0x101df2524
0x100321f11: mov qword ptr [rip + 0x1ad0624], 0 ; 0x101df2540
0x100321f1c: mov rax, qword ptr [rip + 0x8ea695] ; 0x100c0c5b8
0x100321f23: add rax, 0x10
0x100321f27: mov qword ptr [rip + 0x1ad05ba], rax ; 0x101df24e8
0x100321f2e: vmovdqa xmmword ptr [rbp - 0x290], xmm10
0x100321f36: vmovdqa xmmword ptr [rip + 0x1acf932], xmm10 ; 0x101df1870
0x100321f3e: mov qword ptr [rip + 0x1acf937], 0 ; 0x101df1880
0x100321f49: vmovdqa xmmword ptr [rip + 0x1acf95f], xmm10 ; 0x101df18b0
0x100321f51: mov qword ptr [rip + 0x1acf964], 0 ; 0x101df18c0
0x100321f5c: vmovdqa xmmword ptr [rip + 0x1acf98c], xmm10 ; 0x101df18f0
0x100321f64: mov qword ptr [rip + 0x1acf991], 0 ; 0x101df1900
0x100321f6f: vmovdqa xmmword ptr [rip + 0x1acf9b9], xmm10 ; 0x101df1930
0x100321f77: mov qword ptr [rip + 0x1acf9be], 0 ; 0x101df1940
0x100321f82: vmovdqa xmmword ptr [rip + 0x1acf9e6], xmm10 ; 0x101df1970
0x100321f8a: mov qword ptr [rip + 0x1acf9eb], 0 ; 0x101df1980
0x100321f95: vmovdqa xmmword ptr [rip + 0x1acfa13], xmm10 ; 0x101df19b0
0x100321f9d: mov qword ptr [rip + 0x1acfa18], 0 ; 0x101df19c0
0x100321fa8: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x100321fb0: vmovaps xmmword ptr [rip + 0x1acfa38], xmm1 ; 0x101df19f0
0x100321fb8: mov qword ptr [rip + 0x1acfa3d], 0 ; 0x101df1a00
0x100321fc3: vmovaps xmmword ptr [rip + 0x1acfa65], xmm1 ; 0x101df1a30
0x100321fcb: mov qword ptr [rip + 0x1acfa6a], 0 ; 0x101df1a40
0x100321fd6: vmovaps xmmword ptr [rip + 0x1acfa92], xmm1 ; 0x101df1a70
0x100321fde: mov qword ptr [rip + 0x1acfa97], 0 ; 0x101df1a80
0x100321fe9: vmovaps xmmword ptr [rip + 0x1acfadf], xmm1 ; 0x101df1ad0
0x100321ff1: mov qword ptr [rip + 0x1acfae4], 0 ; 0x101df1ae0
0x100321ffc: vmovaps xmmword ptr [rip + 0x1acfb0c], xmm1 ; 0x101df1b10
0x100322004: mov qword ptr [rip + 0x1acfb11], 0 ; 0x101df1b20
0x10032200f: vmovaps xmmword ptr [rip + 0x1acfb39], xmm1 ; 0x101df1b50
0x100322017: mov qword ptr [rip + 0x1acfb3e], 0 ; 0x101df1b60
0x100322022: vmovaps xmmword ptr [rip + 0x1acfb66], xmm1 ; 0x101df1b90
0x10032202a: mov qword ptr [rip + 0x1acfb6b], 0 ; 0x101df1ba0
0x100322035: vmovaps xmm2, xmmword ptr [rbp - 0x70]
0x10032203a: vmovaps xmmword ptr [rip + 0x1acfb8e], xmm2 ; 0x101df1bd0
0x100322042: mov qword ptr [rip + 0x1acfb93], 0 ; 0x101df1be0
0x10032204d: vmovaps xmmword ptr [rip + 0x1acfbdb], xmm2 ; 0x101df1c30
0x100322055: mov qword ptr [rip + 0x1acfbe0], 0 ; 0x101df1c40
0x100322060: vmovaps xmmword ptr [rip + 0x1acfc28], xmm2 ; 0x101df1c90
0x100322068: mov qword ptr [rip + 0x1acfc2d], 0 ; 0x101df1ca0
0x100322073: vmovaps xmmword ptr [rip + 0x1acfc75], xmm2 ; 0x101df1cf0
0x10032207b: mov qword ptr [rip + 0x1acfc7a], 0 ; 0x101df1d00
0x100322086: vmovaps xmmword ptr [rip + 0x1acfcc2], xmm2 ; 0x101df1d50
0x10032208e: mov qword ptr [rip + 0x1acfcc7], 0 ; 0x101df1d60
0x100322099: vmovaps xmmword ptr [rip + 0x1acfd0f], xmm2 ; 0x101df1db0
0x1003220a1: mov qword ptr [rip + 0x1acfd14], 0 ; 0x101df1dc0
0x1003220ac: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x1003220b1: vmovaps xmmword ptr [rip + 0x1acfd37], xmm1 ; 0x101df1df0
0x1003220b9: mov qword ptr [rip + 0x1acfd3c], 0 ; 0x101df1e00
0x1003220c4: vmovaps xmmword ptr [rip + 0x1acfd64], xmm1 ; 0x101df1e30
0x1003220cc: mov qword ptr [rip + 0x1acfd69], 0 ; 0x101df1e40
0x1003220d7: vmovaps xmmword ptr [rip + 0x1acfd91], xmm1 ; 0x101df1e70
0x1003220df: mov qword ptr [rip + 0x1acfd96], 0 ; 0x101df1e80
0x1003220ea: vmovaps xmmword ptr [rip + 0x1acfdbe], xmm1 ; 0x101df1eb0
0x1003220f2: mov qword ptr [rip + 0x1acfdc3], 0 ; 0x101df1ec0
0x1003220fd: vmovaps xmmword ptr [rip + 0x1acfdeb], xmm1 ; 0x101df1ef0
0x100322105: mov qword ptr [rip + 0x1acfdf0], 0 ; 0x101df1f00
0x100322110: vmovaps xmmword ptr [rip + 0x1acfe18], xmm1 ; 0x101df1f30
0x100322118: mov qword ptr [rip + 0x1acfe1d], 0 ; 0x101df1f40
0x100322123: vmovaps xmmword ptr [rip + 0x1acfe45], xmm2 ; 0x101df1f70
0x10032212b: mov qword ptr [rip + 0x1acfe4a], 0 ; 0x101df1f80
0x100322136: vmovaps xmmword ptr [rip + 0x1acfe92], xmm2 ; 0x101df1fd0
0x10032213e: mov qword ptr [rip + 0x1acfe97], 0 ; 0x101df1fe0
0x100322149: vmovaps xmmword ptr [rip + 0x1acfedf], xmm2 ; 0x101df2030
0x100322151: mov qword ptr [rip + 0x1acfee4], 0 ; 0x101df2040
0x10032215c: vmovaps xmmword ptr [rip + 0x1acff2c], xmm2 ; 0x101df2090
0x100322164: mov qword ptr [rip + 0x1acff31], 0 ; 0x101df20a0
0x10032216f: vmovaps xmmword ptr [rip + 0x1acff79], xmm2 ; 0x101df20f0
0x100322177: mov qword ptr [rip + 0x1acff7e], 0 ; 0x101df2100
0x100322182: vmovaps xmmword ptr [rip + 0x1acffc6], xmm1 ; 0x101df2150
0x10032218a: mov qword ptr [rip + 0x1acffcb], 0 ; 0x101df2160
0x100322195: vmovaps xmmword ptr [rip + 0x1acfff3], xmm1 ; 0x101df2190
0x10032219d: mov qword ptr [rip + 0x1acfff8], 0 ; 0x101df21a0
0x1003221a8: vmovaps xmmword ptr [rip + 0x1ad0020], xmm1 ; 0x101df21d0
0x1003221b0: mov qword ptr [rip + 0x1ad0025], 0 ; 0x101df21e0
0x1003221bb: vmovaps xmm1, xmmword ptr [rbp - 0x130]
0x1003221c3: vmovaps xmmword ptr [rip + 0x1ad0045], xmm1 ; 0x101df2210
0x1003221cb: mov qword ptr [rip + 0x1ad004a], 0 ; 0x101df2220
0x1003221d6: vmovaps xmmword ptr [rip + 0x1ad0072], xmm1 ; 0x101df2250
0x1003221de: mov qword ptr [rip + 0x1ad0077], 0 ; 0x101df2260
0x1003221e9: vmovaps xmmword ptr [rip + 0x1ad009f], xmm1 ; 0x101df2290
0x1003221f1: mov qword ptr [rip + 0x1ad00a4], 0 ; 0x101df22a0
0x1003221fc: vmovaps xmmword ptr [rip + 0x1ad00cc], xmm1 ; 0x101df22d0
0x100322204: mov qword ptr [rip + 0x1ad00d1], 0 ; 0x101df22e0
0x10032220f: vmovaps xmmword ptr [rip + 0x1ad0119], xmm1 ; 0x101df2330
0x100322217: mov qword ptr [rip + 0x1ad011e], 0 ; 0x101df2340
0x100322222: vmovaps xmm1, xmmword ptr [rbp - 0x1b0]
0x10032222a: vmovaps xmmword ptr [rip + 0x1ad015e], xmm1 ; 0x101df2390
0x100322232: mov qword ptr [rip + 0x1ad0163], 0 ; 0x101df23a0
0x10032223d: vmovaps xmmword ptr [rip + 0x1ad018b], xmm3 ; 0x101df23d0
0x100322245: mov qword ptr [rip + 0x1ad0190], 0 ; 0x101df23e0
0x100322250: vmovaps xmmword ptr [rip + 0x1ad01d8], xmm0 ; 0x101df2430
0x100322258: mov qword ptr [rip + 0x1ad01dd], 0 ; 0x101df2440
0x100322263: vmovaps xmm0, xmmword ptr [rbp - 0x1c0]
0x10032226b: vmovaps xmmword ptr [rip + 0x1ad01fd], xmm0 ; 0x101df2470
0x100322273: mov qword ptr [rip + 0x1ad0202], 0 ; 0x101df2480
0x10032227e: vmovaps xmm0, xmmword ptr [rbp - 0x1d0]
0x100322286: vmovaps xmmword ptr [rip + 0x1ad0222], xmm0 ; 0x101df24b0
0x10032228e: mov qword ptr [rip + 0x1ad0227], 0 ; 0x101df24c0
0x100322299: xor eax, eax
0x10032229b: call 0x100011c10 ; 0x100011c10
0x1003222a0: lea rax, [rip + 0x83dd95] ; 0x100b6003c Tool_Export
0x1003222a7: vmovq xmm0, rax
0x1003222ac: vmovdqa xmm1, xmmword ptr [rbp - 0x1e0]
0x1003222b4: vpunpcklqdq xmm0, xmm0, xmm1
0x1003222b8: vmovdqa xmmword ptr [rip + 0x1ad0290], xmm0 ; 0x101df2550
0x1003222c0: vmovdqa xmm0, xmmword ptr [rbp - 0x60]
0x1003222c5: vpunpcklqdq xmm0, xmm0, xmm1
0x1003222c9: vmovdqa xmmword ptr [rip + 0x1ad029f], xmm0 ; 0x101df2570
0x1003222d1: lea rax, [rip + 0x854d76] ; 0x100b7704e SetEnabled
0x1003222d8: mov qword ptr [rip + 0x1ad02a9], rax ; 0x101df2588
0x1003222df: mov qword ptr [rip + 0x1ad02a6], 0 ; 0x101df2590
0x1003222ea: mov rax, qword ptr [rip + 0x94dc6f] ; 0x100c6ff60
0x1003222f1: mov qword ptr [rip + 0x1ad02a0], rax ; 0x101df2598
0x1003222f8: lea rax, [rip - 0x7c1f] ; 0x10031a6e0
0x1003222ff: vmovq xmm0, rax
0x100322304: vmovdqu xmmword ptr [rip + 0x1ad02b4], xmm0 ; 0x101df25c0
0x10032230c: lea rax, [rip + 0x850f60] ; 0x100b73273 GetEnabled
0x100322313: mov qword ptr [rip + 0x1ad02ce], rax ; 0x101df25e8
0x10032231a: mov qword ptr [rip + 0x1ad02cb], 0 ; 0x101df25f0
0x100322325: lea rax, [rip + 0x1ad025c] ; 0x101df2588
0x10032232c: mov qword ptr [rip + 0x1ad02c5], rax ; 0x101df25f8
0x100322333: lea rax, [rip - 0x7c6a] ; 0x10031a6d0
0x10032233a: vmovq xmm0, rax
0x10032233f: vmovdqu xmmword ptr [rip + 0x1ad02d9], xmm0 ; 0x101df2620
0x100322347: lea rax, [rip + 0x842231] ; 0x100b6457f HotDate
0x10032234e: mov qword ptr [rip + 0x1ad02f3], rax ; 0x101df2648
0x100322355: mov qword ptr [rip + 0x1ad02f0], 0 ; 0x101df2650
0x100322360: lea rax, [rip + 0x1ad0281] ; 0x101df25e8
0x100322367: mov qword ptr [rip + 0x1ad02ea], rax ; 0x101df2658
0x10032236e: lea rax, [rip - 0x6605] ; 0x10031bd70
0x100322375: vmovq xmm0, rax
0x10032237a: vmovdqu xmmword ptr [rip + 0x1ad02fe], xmm0 ; 0x101df2680
0x100322382: vmovaps xmm0, xmmword ptr [rbp - 0x2a0]
0x10032238a: vmovaps xmmword ptr [rip + 0x1ad033e], xmm0 ; 0x101df26d0
0x100322392: vmovaps xmm0, xmmword ptr [rbp - 0x290]
0x10032239a: vmovaps xmmword ptr [rip + 0x1ad030e], xmm0 ; 0x101df26b0
0x1003223a2: vmovaps xmmword ptr [rip + 0x1ad0346], xmm0 ; 0x101df26f0
0x1003223aa: vmovaps xmmword ptr [rip + 0x1ad037e], xmm0 ; 0x101df2730
0x1003223b2: vmovaps xmmword ptr [rip + 0x1ad03b6], xmm0 ; 0x101df2770
0x1003223ba: vmovaps xmmword ptr [rip + 0x1ad03ee], xmm0 ; 0x101df27b0
0x1003223c2: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1003223c7: vmovaps xmmword ptr [rip + 0x1ad0341], xmm0 ; 0x101df2710
0x1003223cf: vmovaps xmmword ptr [rip + 0x1ad0379], xmm0 ; 0x101df2750
0x1003223d7: vmovaps xmmword ptr [rip + 0x1ad03b1], xmm0 ; 0x101df2790
0x1003223df: vmovaps xmmword ptr [rip + 0x1ad03e9], xmm0 ; 0x101df27d0
0x1003223e7: vmovaps xmm0, xmmword ptr [rbp - 0x280]
0x1003223ef: vmovaps xmmword ptr [rip + 0x1ad0419], xmm0 ; 0x101df2810
0x1003223f7: vmovaps xmm0, xmmword ptr [rbp - 0x270]
0x1003223ff: vmovaps xmmword ptr [rip + 0x1ad04a9], xmm0 ; 0x101df28b0
0x100322407: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10032240f: vmovaps xmmword ptr [rip + 0x1ad03d9], xmm0 ; 0x101df27f0
0x100322417: vmovaps xmmword ptr [rip + 0x1ad0411], xmm0 ; 0x101df2830
0x10032241f: vmovaps xmmword ptr [rip + 0x1ad0449], xmm0 ; 0x101df2870
0x100322427: vmovaps xmmword ptr [rip + 0x1ad04a1], xmm0 ; 0x101df28d0
0x10032242f: vmovaps xmmword ptr [rip + 0x1ad04d9], xmm0 ; 0x101df2910
0x100322437: vmovaps xmmword ptr [rip + 0x1ad0511], xmm0 ; 0x101df2950
0x10032243f: vmovaps xmmword ptr [rip + 0x1ad0549], xmm0 ; 0x101df2990
0x100322447: vmovaps xmm0, xmmword ptr [rbp - 0x210]
0x10032244f: vmovaps xmmword ptr [rip + 0x1ad07b9], xmm0 ; 0x101df2c10
0x100322457: vmovaps xmm0, xmmword ptr [rbp - 0x150]
0x10032245f: vmovaps xmmword ptr [rip + 0x1ad07e9], xmm0 ; 0x101df2c50
0x100322467: vmovaps xmm0, xmmword ptr [rbp - 0x160]
0x10032246f: vmovaps xmmword ptr [rip + 0x1ad0819], xmm0 ; 0x101df2c90
0x100322477: vmovaps xmm0, xmmword ptr [rbp - 0x170]
0x10032247f: vmovaps xmmword ptr [rip + 0x1ad0849], xmm0 ; 0x101df2cd0
0x100322487: vmovaps xmm0, xmmword ptr [rbp - 0x100]
0x10032248f: vmovaps xmmword ptr [rip + 0x1ad0519], xmm0 ; 0x101df29b0
0x100322497: vmovaps xmmword ptr [rip + 0x1ad0871], xmm0 ; 0x101df2d10
0x10032249f: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x1003224a7: vmovaps xmmword ptr [rip + 0x1ad0561], xmm0 ; 0x101df2a10
0x1003224af: vmovaps xmmword ptr [rip + 0x1ad08f9], xmm0 ; 0x101df2db0
0x1003224b7: vmovaps xmm0, xmmword ptr [rbp - 0xf0]
0x1003224bf: vmovaps xmmword ptr [rip + 0x1ad05a9], xmm0 ; 0x101df2a70
0x1003224c7: vmovaps xmmword ptr [rip + 0x1ad0941], xmm0 ; 0x101df2e10
0x1003224cf: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x1003224d7: vmovaps xmmword ptr [rip + 0x1ad05f1], xmm0 ; 0x101df2ad0
0x1003224df: vmovaps xmmword ptr [rip + 0x1ad0989], xmm0 ; 0x101df2e70
0x1003224e7: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1003224ef: vmovaps xmmword ptr [rip + 0x1ad0639], xmm0 ; 0x101df2b30
0x1003224f7: vmovaps xmmword ptr [rip + 0x1ad09d1], xmm0 ; 0x101df2ed0
0x1003224ff: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100322504: vmovaps xmmword ptr [rip + 0x1ad04c4], xmm0 ; 0x101df29d0
0x10032250c: vmovaps xmmword ptr [rip + 0x1ad051c], xmm0 ; 0x101df2a30
0x100322514: vmovaps xmmword ptr [rip + 0x1ad0574], xmm0 ; 0x101df2a90
0x10032251c: vmovaps xmmword ptr [rip + 0x1ad05cc], xmm0 ; 0x101df2af0
0x100322524: vmovaps xmmword ptr [rip + 0x1ad0624], xmm0 ; 0x101df2b50
0x10032252c: vmovaps xmmword ptr [rip + 0x1ad067c], xmm0 ; 0x101df2bb0
0x100322534: vmovaps xmmword ptr [rip + 0x1ad0834], xmm0 ; 0x101df2d70
0x10032253c: vmovaps xmmword ptr [rip + 0x1ad088c], xmm0 ; 0x101df2dd0
0x100322544: vmovaps xmmword ptr [rip + 0x1ad08e4], xmm0 ; 0x101df2e30
0x10032254c: vmovaps xmmword ptr [rip + 0x1ad093c], xmm0 ; 0x101df2e90
0x100322554: vmovaps xmmword ptr [rip + 0x1ad0994], xmm0 ; 0x101df2ef0
0x10032255c: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x100322564: vmovaps xmmword ptr [rip + 0x1ad0624], xmm0 ; 0x101df2b90
0x10032256c: vmovaps xmmword ptr [rip + 0x1ad09bc], xmm0 ; 0x101df2f30
0x100322574: vmovaps xmm0, xmmword ptr [rbp - 0x180]
0x10032257c: vmovaps xmmword ptr [rip + 0x1ad0a2c], xmm0 ; 0x101df2fb0
0x100322584: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x100322589: vmovaps xmmword ptr [rip + 0x1ad065f], xmm0 ; 0x101df2bf0
0x100322591: vmovaps xmmword ptr [rip + 0x1ad0697], xmm0 ; 0x101df2c30
0x100322599: vmovaps xmmword ptr [rip + 0x1ad06cf], xmm0 ; 0x101df2c70
0x1003225a1: vmovaps xmmword ptr [rip + 0x1ad0707], xmm0 ; 0x101df2cb0
0x1003225a9: vmovaps xmmword ptr [rip + 0x1ad073f], xmm0 ; 0x101df2cf0
0x1003225b1: vmovaps xmmword ptr [rip + 0x1ad0777], xmm0 ; 0x101df2d30
0x1003225b9: vmovaps xmmword ptr [rip + 0x1ad098f], xmm0 ; 0x101df2f50
0x1003225c1: vmovaps xmmword ptr [rip + 0x1ad09c7], xmm0 ; 0x101df2f90
0x1003225c9: vmovaps xmmword ptr [rip + 0x1ad09ff], xmm0 ; 0x101df2fd0
0x1003225d1: vmovaps xmm0, xmmword ptr [rbp - 0x190]
0x1003225d9: vmovaps xmmword ptr [rip + 0x1ad0a0f], xmm0 ; 0x101df2ff0
0x1003225e1: vmovaps xmm0, xmmword ptr [rbp - 0x1a0]
0x1003225e9: vmovaps xmmword ptr [rip + 0x1ad0a3f], xmm0 ; 0x101df3030
0x1003225f1: mov rax, qword ptr [rip + 0x1acff00] ; 0x101df24f8
0x1003225f8: mov qword ptr [rip + 0x1acff61], rax ; 0x101df2560
0x1003225ff: lea rax, [rip + 0x1acff4a] ; 0x101df2550
0x100322606: mov qword ptr [rip + 0x1acfeeb], rax ; 0x101df24f8
0x10032260d: lea rax, [rip + 0x848aab] ; 0x100b6b0bf transform
0x100322614: mov qword ptr [rip + 0x988295], rax ; 0x100caa8b0
0x10032261b: mov qword ptr [rip + 0x988292], 0 ; 0x100caa8b8
0x100322626: mov rax, qword ptr [rip + 0x955633] ; 0x100c77c60
0x10032262d: mov qword ptr [rip + 0x98828c], rax ; 0x100caa8c0
0x100322634: mov qword ptr [rip + 0x988291], 0x10 ; 0x100caa8d0
0x10032263f: mov rax, qword ptr [rip + 0x8e4782] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x100322646: mov qword ptr [rip + 0x98828b], rax ; 0x100caa8d8
0x10032264d: lea rax, [rip + 0x854a05] ; 0x100b77059 enabled
0x100322654: mov qword ptr [rip + 0x9882a5], rax ; 0x100caa900
0x10032265b: lea rax, [rip + 0x98824e] ; 0x100caa8b0
0x100322662: mov qword ptr [rip + 0x9882a7], rax ; 0x100caa910
0x100322669: mov qword ptr [rip + 0x9882ac], 0x50 ; 0x100caa920
0x100322674: mov rdx, qword ptr [rip + 0x8e4edd] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10032267b: mov qword ptr [rip + 0x9882a6], rdx ; 0x100caa928
0x100322682: mov rax, qword ptr [rip + 0x8e60a7] ; 0x100c08730 -> 0x10031ca50 __Z18GetMetaClassByTypeIP7EnvNodeERK9MetaClassv
0x100322689: mov qword ptr [rip + 0x9882a0], rax ; 0x100caa930
0x100322690: mov qword ptr [rip + 0x98829d], 0xffffffffffffffff ; 0x100caa938
0x10032269b: mov qword ptr [rip + 0x98829e], rbx ; 0x100caa940
0x1003226a2: mov qword ptr [rip + 0x98829b], 0 ; 0x100caa948
0x1003226ad: lea rcx, [rip + 0x1acfebc] ; 0x101df2570
0x1003226b4: mov qword ptr [rip + 0x98824d], rcx ; 0x100caa908
0x1003226bb: mov rcx, qword ptr [rip + 0x8e3d56] ; 0x100c06418 -> 0x10031e570 __Z12ApplyWrapperI7EnvNodeMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x1003226c2: mov qword ptr [rip + 0x1acff07], rcx ; 0x101df25d0
0x1003226c9: mov rcx, qword ptr [rip + 0x8e75d8] ; 0x100c09ca8 -> 0x10031e610 __Z21InitFunctionSignatureIM7EnvNodeFvbEEvP17FunctionSignature
0x1003226d0: mov qword ptr [rip + 0x1acff01], rcx ; 0x101df25d8
0x1003226d7: mov rcx, qword ptr [rip + 0x8e3d32] ; 0x100c06410 -> 0x10031e690 __Z12ApplyWrapperI7EnvNodeMS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1003226de: mov qword ptr [rip + 0x1acff4b], rcx ; 0x101df2630
0x1003226e5: mov rcx, qword ptr [rip + 0x8e75b4] ; 0x100c09ca0 -> 0x10031e710 __Z21InitFunctionSignatureIM7EnvNodeFbvEEvP17FunctionSignature
0x1003226ec: mov qword ptr [rip + 0x1acff45], rcx ; 0x101df2638
0x1003226f3: lea rcx, [rip + 0x1acff4e] ; 0x101df2648
0x1003226fa: mov qword ptr [rip + 0x94d85f], rcx ; 0x100c6ff60
0x100322701: mov rcx, qword ptr [rip + 0x8e3d18] ; 0x100c06420 -> 0x10031e740 __Z12ApplyWrapperI7EnvNodeMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x100322708: mov qword ptr [rip + 0x1acff81], rcx ; 0x101df2690
0x10032270f: mov rcx, qword ptr [rip + 0x8e759a] ; 0x100c09cb0 -> 0x10031e7a0 __Z21InitFunctionSignatureIM7EnvNodeFvvEEvP17FunctionSignature
0x100322716: mov qword ptr [rip + 0x1acff7b], rcx ; 0x101df2698
0x10032271d: lea rcx, [rip + 0x83c882] ; 0x100b5efa6 pos
0x100322724: mov qword ptr [rip + 0x988225], rcx ; 0x100caa950
0x10032272b: mov qword ptr [rip + 0x988222], 0 ; 0x100caa958
0x100322736: lea rcx, [rip + 0x9881c3] ; 0x100caa900
0x10032273d: mov qword ptr [rip + 0x98821c], rcx ; 0x100caa960
0x100322744: lea rcx, [rip + 0x856518] ; 0x100b78c63 quat
0x10032274b: mov qword ptr [rip + 0x98824e], rcx ; 0x100caa9a0
0x100322752: mov qword ptr [rip + 0x98824b], 0 ; 0x100caa9a8
0x10032275d: lea rcx, [rip + 0x9881ec] ; 0x100caa950
0x100322764: mov qword ptr [rip + 0x988245], rcx ; 0x100caa9b0
0x10032276b: mov qword ptr [rip + 0x98824a], 0x70 ; 0x100caa9c0
0x100322776: mov rcx, qword ptr [rip + 0x8e4643] ; 0x100c06dc0 -> 0x1001db420 __Z17GetMetaTypeByTypeIN10Vectormath3Aos4QuatEERK8MetaTypev
0x10032277d: mov qword ptr [rip + 0x988244], rcx ; 0x100caa9c8
0x100322784: lea rcx, [rip + 0x8564dd] ; 0x100b78c68 scale
0x10032278b: mov qword ptr [rip + 0x98825e], rcx ; 0x100caa9f0
0x100322792: mov qword ptr [rip + 0x98825b], 0 ; 0x100caa9f8
0x10032279d: lea rcx, [rip + 0x9881fc] ; 0x100caa9a0
0x1003227a4: mov qword ptr [rip + 0x988255], rcx ; 0x100caaa00
0x1003227ab: lea rcx, [rip + 0x85e5e0] ; 0x100b80d92 falloff
0x1003227b2: mov qword ptr [rip + 0x988287], rcx ; 0x100caaa40
0x1003227b9: lea rcx, [rip + 0x988230] ; 0x100caa9f0
0x1003227c0: mov qword ptr [rip + 0x988289], rcx ; 0x100caaa50
0x1003227c7: lea rcx, [rip + 0x1acfee2] ; 0x101df26b0
0x1003227ce: mov qword ptr [rip + 0x1acff0b], rcx ; 0x101df26e0
0x1003227d5: mov qword ptr [rip + 0x988280], 0x90 ; 0x100caaa60
0x1003227e0: mov qword ptr [rip + 0x988281], r14 ; 0x100caaa68
0x1003227e7: mov qword ptr [rip + 0x988282], rax ; 0x100caaa70
0x1003227ee: mov qword ptr [rip + 0x98827f], 0xffffffffffffffff ; 0x100caaa78
0x1003227f9: mov qword ptr [rip + 0x988280], rbx ; 0x100caaa80
0x100322800: mov qword ptr [rip + 0x98827d], 0 ; 0x100caaa88
0x10032280b: lea rcx, [rip + 0x1acfebe] ; 0x101df26d0
0x100322812: mov qword ptr [rip + 0x98822f], rcx ; 0x100caaa48
0x100322819: lea rcx, [rip + 0x85e57a] ; 0x100b80d9a layer
0x100322820: mov qword ptr [rip + 0x988269], rcx ; 0x100caaa90
0x100322827: lea rcx, [rip + 0x988212] ; 0x100caaa40
0x10032282e: mov qword ptr [rip + 0x98826b], rcx ; 0x100caaaa0
0x100322835: mov qword ptr [rip + 0x988270], 0x94 ; 0x100caaab0
0x100322840: mov rcx, qword ptr [rip + 0x8e4d31] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x100322847: mov qword ptr [rip + 0x98826a], rcx ; 0x100caaab8
0x10032284e: lea rcx, [rip + 0x1acfe9b] ; 0x101df26f0
0x100322855: mov qword ptr [rip + 0x1acfec4], rcx ; 0x101df2720
0x10032285c: mov qword ptr [rip + 0x98825d], rax ; 0x100caaac0
0x100322863: mov qword ptr [rip + 0x98825a], 0xffffffffffffffff ; 0x100caaac8
0x10032286e: mov qword ptr [rip + 0x98825b], rbx ; 0x100caaad0
0x100322875: mov qword ptr [rip + 0x988258], 0 ; 0x100caaad8
0x100322880: lea rcx, [rip + 0x1acfe89] ; 0x101df2710
0x100322887: mov qword ptr [rip + 0x98820a], rcx ; 0x100caaa98
0x10032288e: lea rcx, [rip + 0x85ca4c] ; 0x100b7f2e1 fadeInTime
0x100322895: mov qword ptr [rip + 0x988244], rcx ; 0x100caaae0
0x10032289c: lea rcx, [rip + 0x9881ed] ; 0x100caaa90
0x1003228a3: mov qword ptr [rip + 0x988246], rcx ; 0x100caaaf0
0x1003228aa: lea rcx, [rip + 0x1acfe7f] ; 0x101df2730
0x1003228b1: mov qword ptr [rip + 0x1acfea8], rcx ; 0x101df2760
0x1003228b8: mov qword ptr [rip + 0x98823d], 0x98 ; 0x100caab00
0x1003228c3: mov qword ptr [rip + 0x98823e], r14 ; 0x100caab08
0x1003228ca: mov qword ptr [rip + 0x98823f], rax ; 0x100caab10
0x1003228d1: mov qword ptr [rip + 0x98823c], 0xffffffffffffffff ; 0x100caab18
0x1003228dc: mov qword ptr [rip + 0x98823d], rbx ; 0x100caab20
0x1003228e3: mov qword ptr [rip + 0x98823a], 0 ; 0x100caab28
0x1003228ee: lea rcx, [rip + 0x1acfe5b] ; 0x101df2750
0x1003228f5: mov qword ptr [rip + 0x9881ec], rcx ; 0x100caaae8
0x1003228fc: lea rcx, [rip + 0x85c9e9] ; 0x100b7f2ec fadeOutTime
0x100322903: mov qword ptr [rip + 0x988226], rcx ; 0x100caab30
0x10032290a: lea rcx, [rip + 0x9881cf] ; 0x100caaae0
0x100322911: mov qword ptr [rip + 0x988228], rcx ; 0x100caab40
0x100322918: lea rcx, [rip + 0x1acfe51] ; 0x101df2770
0x10032291f: mov qword ptr [rip + 0x1acfe7a], rcx ; 0x101df27a0
0x100322926: mov qword ptr [rip + 0x98821f], 0x9c ; 0x100caab50
0x100322931: mov qword ptr [rip + 0x988220], r14 ; 0x100caab58
0x100322938: mov qword ptr [rip + 0x988221], rax ; 0x100caab60
0x10032293f: mov qword ptr [rip + 0x98821e], 0xffffffffffffffff ; 0x100caab68
0x10032294a: mov qword ptr [rip + 0x98821f], rbx ; 0x100caab70
0x100322951: mov qword ptr [rip + 0x98821c], 0 ; 0x100caab78
0x10032295c: lea rcx, [rip + 0x1acfe2d] ; 0x101df2790
0x100322963: mov qword ptr [rip + 0x9881ce], rcx ; 0x100caab38
0x10032296a: lea rcx, [rip + 0x83cd7e] ; 0x100b5f6ef duration
0x100322971: mov qword ptr [rip + 0x988208], rcx ; 0x100caab80
0x100322978: lea rcx, [rip + 0x9881b1] ; 0x100caab30
0x10032297f: mov qword ptr [rip + 0x98820a], rcx ; 0x100caab90
0x100322986: lea rcx, [rip + 0x1acfe23] ; 0x101df27b0
0x10032298d: mov qword ptr [rip + 0x1acfe4c], rcx ; 0x101df27e0
0x100322994: mov qword ptr [rip + 0x988201], 0xa0 ; 0x100caaba0
0x10032299f: mov qword ptr [rip + 0x988202], r14 ; 0x100caaba8
0x1003229a6: mov qword ptr [rip + 0x988203], rax ; 0x100caabb0
0x1003229ad: mov qword ptr [rip + 0x988200], 0xffffffffffffffff ; 0x100caabb8
0x1003229b8: mov qword ptr [rip + 0x988201], rbx ; 0x100caabc0
0x1003229bf: mov qword ptr [rip + 0x9881fe], 0 ; 0x100caabc8
0x1003229ca: lea rcx, [rip + 0x1acfdff] ; 0x101df27d0
0x1003229d1: mov qword ptr [rip + 0x9881b0], rcx ; 0x100caab88
0x1003229d8: lea rcx, [rip + 0x83f1fb] ; 0x100b61bda sunAngleY
0x1003229df: mov qword ptr [rip + 0x9881ea], rcx ; 0x100caabd0
0x1003229e6: lea rcx, [rip + 0x988193] ; 0x100caab80
0x1003229ed: mov qword ptr [rip + 0x9881ec], rcx ; 0x100caabe0
0x1003229f4: lea rcx, [rip + 0x1acfdf5] ; 0x101df27f0
0x1003229fb: mov qword ptr [rip + 0x1acfe1e], rcx ; 0x101df2820
0x100322a02: mov qword ptr [rip + 0x9881e3], 0xa4 ; 0x100caabf0
0x100322a0d: mov qword ptr [rip + 0x9881e4], r14 ; 0x100caabf8
0x100322a14: mov qword ptr [rip + 0x9881e5], rax ; 0x100caac00
0x100322a1b: mov qword ptr [rip + 0x9881e2], 0xffffffffffffffff ; 0x100caac08
0x100322a26: mov qword ptr [rip + 0x9881e3], rbx ; 0x100caac10
0x100322a2d: mov qword ptr [rip + 0x9881e0], 0 ; 0x100caac18
0x100322a38: lea rcx, [rip + 0x1acfdd1] ; 0x101df2810
0x100322a3f: mov qword ptr [rip + 0x988192], rcx ; 0x100caabd8
0x100322a46: lea rcx, [rip + 0x83f197] ; 0x100b61be4 sunAngleXZ
0x100322a4d: mov qword ptr [rip + 0x9881cc], rcx ; 0x100caac20
0x100322a54: lea rcx, [rip + 0x988175] ; 0x100caabd0
0x100322a5b: mov qword ptr [rip + 0x9881ce], rcx ; 0x100caac30
0x100322a62: vmovaps xmm1, xmmword ptr [rbp - 0x120]
0x100322a6a: vmovaps xmmword ptr [rip + 0x1acfdde], xmm1 ; 0x101df2850
0x100322a72: lea rcx, [rip + 0x1acfdb7] ; 0x101df2830
0x100322a79: mov qword ptr [rip + 0x1acfde0], rcx ; 0x101df2860
0x100322a80: mov qword ptr [rip + 0x9881b5], 0xa8 ; 0x100caac40
0x100322a8b: mov qword ptr [rip + 0x9881b6], r14 ; 0x100caac48
0x100322a92: mov qword ptr [rip + 0x9881b7], rax ; 0x100caac50
0x100322a99: mov qword ptr [rip + 0x9881b4], 0xffffffffffffffff ; 0x100caac58
0x100322aa4: mov qword ptr [rip + 0x9881b5], rbx ; 0x100caac60
0x100322aab: mov qword ptr [rip + 0x9881b2], 0 ; 0x100caac68
0x100322ab6: lea rcx, [rip + 0x1acfd93] ; 0x101df2850
0x100322abd: mov qword ptr [rip + 0x988164], rcx ; 0x100caac28
0x100322ac4: lea rcx, [rip + 0x83f124] ; 0x100b61bef sunColor
0x100322acb: mov qword ptr [rip + 0x98819e], rcx ; 0x100caac70
0x100322ad2: lea rcx, [rip + 0x988147] ; 0x100caac20
0x100322ad9: mov qword ptr [rip + 0x9881a0], rcx ; 0x100caac80
0x100322ae0: vmovaps xmm2, xmmword ptr [rbp - 0xa0]
0x100322ae8: vmovaps xmmword ptr [rip + 0x1acfda0], xmm2 ; 0x101df2890
0x100322af0: lea rcx, [rip + 0x1acfd79] ; 0x101df2870
0x100322af7: mov qword ptr [rip + 0x1acfda2], rcx ; 0x101df28a0
0x100322afe: lea rcx, [rip + 0x1acfd8b] ; 0x101df2890
0x100322b05: mov qword ptr [rip + 0x1acfdb4], rcx ; 0x101df28c0
0x100322b0c: mov qword ptr [rip + 0x988179], 0xb0 ; 0x100caac90
0x100322b17: mov qword ptr [rip + 0x98817a], r15 ; 0x100caac98
0x100322b1e: mov qword ptr [rip + 0x98817b], rax ; 0x100caaca0
0x100322b25: mov qword ptr [rip + 0x988178], 0xffffffffffffffff ; 0x100caaca8
0x100322b30: mov qword ptr [rip + 0x988179], rbx ; 0x100caacb0
0x100322b37: mov qword ptr [rip + 0x988176], 0 ; 0x100caacb8
0x100322b42: lea rcx, [rip + 0x1acfd67] ; 0x101df28b0
0x100322b49: mov qword ptr [rip + 0x988128], rcx ; 0x100caac78
0x100322b50: lea rcx, [rip + 0x83f0a1] ; 0x100b61bf8 sunSize
0x100322b57: mov qword ptr [rip + 0x988162], rcx ; 0x100caacc0
0x100322b5e: lea rcx, [rip + 0x98810b] ; 0x100caac70
0x100322b65: mov qword ptr [rip + 0x988164], rcx ; 0x100caacd0
0x100322b6c: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x100322b74: vmovaps xmmword ptr [rip + 0x1acfd74], xmm0 ; 0x101df28f0
0x100322b7c: lea rcx, [rip + 0x1acfd4d] ; 0x101df28d0
0x100322b83: mov qword ptr [rip + 0x1acfd76], rcx ; 0x101df2900
0x100322b8a: mov qword ptr [rip + 0x98814b], 0xc0 ; 0x100caace0
0x100322b95: mov qword ptr [rip + 0x98814c], r14 ; 0x100caace8
0x100322b9c: mov qword ptr [rip + 0x98814d], rax ; 0x100caacf0
0x100322ba3: mov qword ptr [rip + 0x98814a], 0xffffffffffffffff ; 0x100caacf8
0x100322bae: mov qword ptr [rip + 0x98814b], rbx ; 0x100caad00
0x100322bb5: mov qword ptr [rip + 0x988148], 0 ; 0x100caad08
0x100322bc0: lea rcx, [rip + 0x1acfd29] ; 0x101df28f0
0x100322bc7: mov qword ptr [rip + 0x9880fa], rcx ; 0x100caacc8
0x100322bce: lea rcx, [rip + 0x83f02b] ; 0x100b61c00 sunInt
0x100322bd5: mov qword ptr [rip + 0x988134], rcx ; 0x100caad10
0x100322bdc: lea rcx, [rip + 0x9880dd] ; 0x100caacc0
0x100322be3: mov qword ptr [rip + 0x988136], rcx ; 0x100caad20
0x100322bea: vmovaps xmmword ptr [rip + 0x1acfd3e], xmm0 ; 0x101df2930
0x100322bf2: lea rcx, [rip + 0x1acfd17] ; 0x101df2910
0x100322bf9: mov qword ptr [rip + 0x1acfd40], rcx ; 0x101df2940
0x100322c00: mov qword ptr [rip + 0x988125], 0xc8 ; 0x100caad30
0x100322c0b: mov qword ptr [rip + 0x988126], r14 ; 0x100caad38
0x100322c12: mov qword ptr [rip + 0x988127], rax ; 0x100caad40
0x100322c19: mov qword ptr [rip + 0x988124], 0xffffffffffffffff ; 0x100caad48
0x100322c24: mov qword ptr [rip + 0x988125], rbx ; 0x100caad50
0x100322c2b: mov qword ptr [rip + 0x988122], 0 ; 0x100caad58
0x100322c36: lea rcx, [rip + 0x1acfcf3] ; 0x101df2930
0x100322c3d: mov qword ptr [rip + 0x9880d4], rcx ; 0x100caad18
0x100322c44: lea rcx, [rip + 0x83efbc] ; 0x100b61c07 sunToMoon
0x100322c4b: mov qword ptr [rip + 0x98810e], rcx ; 0x100caad60
0x100322c52: lea rcx, [rip + 0x9880b7] ; 0x100caad10
0x100322c59: mov qword ptr [rip + 0x988110], rcx ; 0x100caad70
0x100322c60: vmovaps xmmword ptr [rip + 0x1acfd08], xmm1 ; 0x101df2970
0x100322c68: lea rcx, [rip + 0x1acfce1] ; 0x101df2950
0x100322c6f: mov qword ptr [rip + 0x1acfd0a], rcx ; 0x101df2980
0x100322c76: mov qword ptr [rip + 0x9880ff], 0xcc ; 0x100caad80
0x100322c81: mov qword ptr [rip + 0x988100], r14 ; 0x100caad88
0x100322c88: mov qword ptr [rip + 0x988101], rax ; 0x100caad90
0x100322c8f: mov qword ptr [rip + 0x9880fe], 0xffffffffffffffff ; 0x100caad98
0x100322c9a: mov qword ptr [rip + 0x9880ff], rbx ; 0x100caada0
0x100322ca1: mov qword ptr [rip + 0x9880fc], 0 ; 0x100caada8
0x100322cac: lea rcx, [rip + 0x1acfcbd] ; 0x101df2970
0x100322cb3: mov qword ptr [rip + 0x9880ae], rcx ; 0x100caad68
0x100322cba: lea rcx, [rip + 0x83ef50] ; 0x100b61c11 moonPhase
0x100322cc1: mov qword ptr [rip + 0x9880e8], rcx ; 0x100caadb0
0x100322cc8: lea rcx, [rip + 0x988091] ; 0x100caad60
0x100322ccf: mov qword ptr [rip + 0x9880ea], rcx ; 0x100caadc0
0x100322cd6: lea rcx, [rip + 0x1acfcb3] ; 0x101df2990
0x100322cdd: mov qword ptr [rip + 0x1acfcdc], rcx ; 0x101df29c0
0x100322ce4: mov qword ptr [rip + 0x9880e1], 0xd0 ; 0x100caadd0
0x100322cef: mov qword ptr [rip + 0x9880e2], r14 ; 0x100caadd8
0x100322cf6: mov qword ptr [rip + 0x9880e3], rax ; 0x100caade0
0x100322cfd: mov qword ptr [rip + 0x9880e0], 0xffffffffffffffff ; 0x100caade8
0x100322d08: mov qword ptr [rip + 0x9880e1], rbx ; 0x100caadf0
0x100322d0f: mov qword ptr [rip + 0x9880de], 0 ; 0x100caadf8
0x100322d1a: lea rcx, [rip + 0x1acfc8f] ; 0x101df29b0
0x100322d21: mov qword ptr [rip + 0x988090], rcx ; 0x100caadb8
0x100322d28: lea rcx, [rip + 0x83eef8] ; 0x100b61c27 tintTop
0x100322d2f: mov qword ptr [rip + 0x9880ca], rcx ; 0x100caae00
0x100322d36: lea rcx, [rip + 0x988073] ; 0x100caadb0
0x100322d3d: mov qword ptr [rip + 0x9880cc], rcx ; 0x100caae10
0x100322d44: vmovaps xmmword ptr [rip + 0x1acfca4], xmm2 ; 0x101df29f0
0x100322d4c: lea rcx, [rip + 0x1acfc7d] ; 0x101df29d0
0x100322d53: mov qword ptr [rip + 0x1acfca6], rcx ; 0x101df2a00
0x100322d5a: lea rcx, [rip + 0x1acfc8f] ; 0x101df29f0
0x100322d61: mov qword ptr [rip + 0x1acfcb8], rcx ; 0x101df2a20
0x100322d68: mov qword ptr [rip + 0x9880ad], 0xe0 ; 0x100caae20
0x100322d73: mov qword ptr [rip + 0x9880ae], r15 ; 0x100caae28
0x100322d7a: mov qword ptr [rip + 0x9880af], rax ; 0x100caae30
0x100322d81: mov qword ptr [rip + 0x9880ac], 0xffffffffffffffff ; 0x100caae38
0x100322d8c: mov qword ptr [rip + 0x9880ad], rbx ; 0x100caae40
0x100322d93: mov qword ptr [rip + 0x9880aa], 0 ; 0x100caae48
0x100322d9e: lea rcx, [rip + 0x1acfc6b] ; 0x101df2a10
0x100322da5: mov qword ptr [rip + 0x98805c], rcx ; 0x100caae08
0x100322dac: lea rcx, [rip + 0x83ee7c] ; 0x100b61c2f tintMidTop
0x100322db3: mov qword ptr [rip + 0x988096], rcx ; 0x100caae50
0x100322dba: lea rcx, [rip + 0x98803f] ; 0x100caae00
0x100322dc1: mov qword ptr [rip + 0x988098], rcx ; 0x100caae60
0x100322dc8: vmovaps xmmword ptr [rip + 0x1acfc80], xmm2 ; 0x101df2a50
0x100322dd0: lea rcx, [rip + 0x1acfc59] ; 0x101df2a30
0x100322dd7: mov qword ptr [rip + 0x1acfc82], rcx ; 0x101df2a60
0x100322dde: lea rcx, [rip + 0x1acfc6b] ; 0x101df2a50
0x100322de5: mov qword ptr [rip + 0x1acfc94], rcx ; 0x101df2a80
0x100322dec: mov qword ptr [rip + 0x988079], 0xf0 ; 0x100caae70
0x100322df7: mov qword ptr [rip + 0x98807a], r15 ; 0x100caae78
0x100322dfe: mov qword ptr [rip + 0x98807b], rax ; 0x100caae80
0x100322e05: mov qword ptr [rip + 0x988078], 0xffffffffffffffff ; 0x100caae88
0x100322e10: mov qword ptr [rip + 0x988079], rbx ; 0x100caae90
0x100322e17: mov qword ptr [rip + 0x988076], 0 ; 0x100caae98
0x100322e22: lea rcx, [rip + 0x1acfc47] ; 0x101df2a70
0x100322e29: mov qword ptr [rip + 0x988028], rcx ; 0x100caae58
0x100322e30: lea rcx, [rip + 0x83ee03] ; 0x100b61c3a tintMidMid
0x100322e37: mov qword ptr [rip + 0x988062], rcx ; 0x100caaea0
0x100322e3e: lea rcx, [rip + 0x98800b] ; 0x100caae50
0x100322e45: mov qword ptr [rip + 0x988064], rcx ; 0x100caaeb0
0x100322e4c: vmovaps xmmword ptr [rip + 0x1acfc5c], xmm2 ; 0x101df2ab0
0x100322e54: lea rcx, [rip + 0x1acfc35] ; 0x101df2a90
0x100322e5b: mov qword ptr [rip + 0x1acfc5e], rcx ; 0x101df2ac0
0x100322e62: lea rcx, [rip + 0x1acfc47] ; 0x101df2ab0
0x100322e69: mov qword ptr [rip + 0x1acfc70], rcx ; 0x101df2ae0
0x100322e70: mov qword ptr [rip + 0x988045], 0x100 ; 0x100caaec0
0x100322e7b: mov qword ptr [rip + 0x988046], r15 ; 0x100caaec8
0x100322e82: mov qword ptr [rip + 0x988047], rax ; 0x100caaed0
0x100322e89: mov qword ptr [rip + 0x988044], 0xffffffffffffffff ; 0x100caaed8
0x100322e94: mov qword ptr [rip + 0x988045], rbx ; 0x100caaee0
0x100322e9b: mov qword ptr [rip + 0x988042], 0 ; 0x100caaee8
0x100322ea6: lea rcx, [rip + 0x1acfc23] ; 0x101df2ad0
0x100322ead: mov qword ptr [rip + 0x987ff4], rcx ; 0x100caaea8
0x100322eb4: lea rcx, [rip + 0x83ed8a] ; 0x100b61c45 tintMidBot
0x100322ebb: mov qword ptr [rip + 0x98802e], rcx ; 0x100caaef0
0x100322ec2: lea rcx, [rip + 0x987fd7] ; 0x100caaea0
0x100322ec9: mov qword ptr [rip + 0x988030], rcx ; 0x100caaf00
0x100322ed0: vmovaps xmmword ptr [rip + 0x1acfc38], xmm2 ; 0x101df2b10
0x100322ed8: lea rcx, [rip + 0x1acfc11] ; 0x101df2af0
0x100322edf: mov qword ptr [rip + 0x1acfc3a], rcx ; 0x101df2b20
0x100322ee6: lea rcx, [rip + 0x1acfc23] ; 0x101df2b10
0x100322eed: mov qword ptr [rip + 0x1acfc4c], rcx ; 0x101df2b40
0x100322ef4: mov qword ptr [rip + 0x988011], 0x110 ; 0x100caaf10
0x100322eff: mov qword ptr [rip + 0x988012], r15 ; 0x100caaf18
0x100322f06: mov qword ptr [rip + 0x988013], rax ; 0x100caaf20
0x100322f0d: mov qword ptr [rip + 0x988010], 0xffffffffffffffff ; 0x100caaf28
0x100322f18: mov qword ptr [rip + 0x988011], rbx ; 0x100caaf30
0x100322f1f: mov qword ptr [rip + 0x98800e], 0 ; 0x100caaf38
0x100322f2a: lea rcx, [rip + 0x1acfbff] ; 0x101df2b30
0x100322f31: mov qword ptr [rip + 0x987fc0], rcx ; 0x100caaef8
0x100322f38: lea rcx, [rip + 0x83ed11] ; 0x100b61c50 tintBot
0x100322f3f: mov qword ptr [rip + 0x987ffa], rcx ; 0x100caaf40
0x100322f46: lea rcx, [rip + 0x987fa3] ; 0x100caaef0
0x100322f4d: mov qword ptr [rip + 0x987ffc], rcx ; 0x100caaf50
0x100322f54: vmovaps xmmword ptr [rip + 0x1acfc14], xmm2 ; 0x101df2b70
0x100322f5c: lea rcx, [rip + 0x1acfbed] ; 0x101df2b50
0x100322f63: mov qword ptr [rip + 0x1acfc16], rcx ; 0x101df2b80
0x100322f6a: lea rcx, [rip + 0x1acfbff] ; 0x101df2b70
0x100322f71: mov qword ptr [rip + 0x1acfc28], rcx ; 0x101df2ba0
0x100322f78: mov qword ptr [rip + 0x987fdd], 0x120 ; 0x100caaf60
0x100322f83: mov qword ptr [rip + 0x987fde], r15 ; 0x100caaf68
0x100322f8a: mov qword ptr [rip + 0x987fdf], rax ; 0x100caaf70
0x100322f91: mov qword ptr [rip + 0x987fdc], 0xffffffffffffffff ; 0x100caaf78
0x100322f9c: mov qword ptr [rip + 0x987fdd], rbx ; 0x100caaf80
0x100322fa3: mov qword ptr [rip + 0x987fda], 0 ; 0x100caaf88
0x100322fae: lea rcx, [rip + 0x1acfbdb] ; 0x101df2b90
0x100322fb5: mov qword ptr [rip + 0x987f8c], rcx ; 0x100caaf48
0x100322fbc: lea rcx, [rip + 0x83ec95] ; 0x100b61c58 atmosphereDensity
0x100322fc3: mov qword ptr [rip + 0x987fc6], rcx ; 0x100caaf90
0x100322fca: lea rcx, [rip + 0x987f6f] ; 0x100caaf40
0x100322fd1: mov qword ptr [rip + 0x987fc8], rcx ; 0x100caafa0
0x100322fd8: vmovaps xmmword ptr [rip + 0x1acfbf0], xmm0 ; 0x101df2bd0
0x100322fe0: lea rcx, [rip + 0x1acfbc9] ; 0x101df2bb0
0x100322fe7: mov qword ptr [rip + 0x1acfbf2], rcx ; 0x101df2be0
0x100322fee: mov qword ptr [rip + 0x987fb7], 0x130 ; 0x100caafb0
0x100322ff9: mov qword ptr [rip + 0x987fb8], r14 ; 0x100caafb8
0x100323000: mov qword ptr [rip + 0x987fb9], rax ; 0x100caafc0
0x100323007: mov qword ptr [rip + 0x987fb6], 0xffffffffffffffff ; 0x100caafc8
0x100323012: mov qword ptr [rip + 0x987fb7], rbx ; 0x100caafd0
0x100323019: mov qword ptr [rip + 0x987fb4], 0 ; 0x100caafd8
0x100323024: lea rcx, [rip + 0x1acfba5] ; 0x101df2bd0
0x10032302b: mov qword ptr [rip + 0x987f66], rcx ; 0x100caaf98
0x100323032: lea rcx, [rip + 0x83ec31] ; 0x100b61c6a cheapFogEnabled
0x100323039: mov qword ptr [rip + 0x987fa0], rcx ; 0x100caafe0
0x100323040: lea rcx, [rip + 0x987f49] ; 0x100caaf90
0x100323047: mov qword ptr [rip + 0x987fa2], rcx ; 0x100caaff0
0x10032304e: mov qword ptr [rip + 0x987fa7], 0x140 ; 0x100cab000
0x100323059: mov qword ptr [rip + 0x987fa8], rdx ; 0x100cab008
0x100323060: lea rcx, [rip + 0x1acfb89] ; 0x101df2bf0
0x100323067: mov qword ptr [rip + 0x1acfbb2], rcx ; 0x101df2c20
0x10032306e: mov qword ptr [rip + 0x987f9b], rax ; 0x100cab010
0x100323075: mov qword ptr [rip + 0x987f98], 0xffffffffffffffff ; 0x100cab018
0x100323080: mov qword ptr [rip + 0x987f99], rbx ; 0x100cab020
0x100323087: mov qword ptr [rip + 0x987f96], 0 ; 0x100cab028
0x100323092: lea rcx, [rip + 0x1acfb77] ; 0x101df2c10
0x100323099: mov qword ptr [rip + 0x987f48], rcx ; 0x100caafe8
0x1003230a0: lea rcx, [rip + 0x83ec5a] ; 0x100b61d01 cheapFogNear
0x1003230a7: mov qword ptr [rip + 0x987f82], rcx ; 0x100cab030
0x1003230ae: lea rcx, [rip + 0x987f2b] ; 0x100caafe0
0x1003230b5: mov qword ptr [rip + 0x987f84], rcx ; 0x100cab040
0x1003230bc: lea rcx, [rip + 0x1acfb6d] ; 0x101df2c30
0x1003230c3: mov qword ptr [rip + 0x1acfb96], rcx ; 0x101df2c60
0x1003230ca: mov qword ptr [rip + 0x987f7b], 0x14c ; 0x100cab050
0x1003230d5: mov qword ptr [rip + 0x987f7c], r14 ; 0x100cab058
0x1003230dc: mov qword ptr [rip + 0x987f7d], rax ; 0x100cab060
0x1003230e3: mov qword ptr [rip + 0x987f7a], 0xffffffffffffffff ; 0x100cab068
0x1003230ee: mov qword ptr [rip + 0x987f7b], rbx ; 0x100cab070
0x1003230f5: mov qword ptr [rip + 0x987f78], 0 ; 0x100cab078
0x100323100: lea rcx, [rip + 0x1acfb49] ; 0x101df2c50
0x100323107: mov qword ptr [rip + 0x987f2a], rcx ; 0x100cab038
0x10032310e: lea rcx, [rip + 0x83ebf9] ; 0x100b61d0e cheapFogFar
0x100323115: mov qword ptr [rip + 0x987f64], rcx ; 0x100cab080
0x10032311c: lea rcx, [rip + 0x987f0d] ; 0x100cab030
0x100323123: mov qword ptr [rip + 0x987f66], rcx ; 0x100cab090
0x10032312a: lea rcx, [rip + 0x1acfb3f] ; 0x101df2c70
0x100323131: mov qword ptr [rip + 0x1acfb68], rcx ; 0x101df2ca0
0x100323138: mov qword ptr [rip + 0x987f5d], 0x150 ; 0x100cab0a0
0x100323143: mov qword ptr [rip + 0x987f5e], r14 ; 0x100cab0a8
0x10032314a: mov qword ptr [rip + 0x987f5f], rax ; 0x100cab0b0
0x100323151: mov qword ptr [rip + 0x987f5c], 0xffffffffffffffff ; 0x100cab0b8
0x10032315c: mov qword ptr [rip + 0x987f5d], rbx ; 0x100cab0c0
0x100323163: mov qword ptr [rip + 0x987f5a], 0 ; 0x100cab0c8
0x10032316e: lea rcx, [rip + 0x1acfb1b] ; 0x101df2c90
0x100323175: mov qword ptr [rip + 0x987f0c], rcx ; 0x100cab088
0x10032317c: mov qword ptr [rip + 0x987f4d], r12 ; 0x100cab0d0
0x100323183: lea rcx, [rip + 0x987ef6] ; 0x100cab080
0x10032318a: mov qword ptr [rip + 0x987f4f], rcx ; 0x100cab0e0
0x100323191: lea rcx, [rip + 0x1acfb18] ; 0x101df2cb0
0x100323198: mov qword ptr [rip + 0x1acfb41], rcx ; 0x101df2ce0
0x10032319f: mov qword ptr [rip + 0x987f46], 0x154 ; 0x100cab0f0
0x1003231aa: mov qword ptr [rip + 0x987f47], r14 ; 0x100cab0f8
0x1003231b1: mov qword ptr [rip + 0x987f48], rax ; 0x100cab100
0x1003231b8: mov qword ptr [rip + 0x987f45], 0xffffffffffffffff ; 0x100cab108
0x1003231c3: mov qword ptr [rip + 0x987f46], rbx ; 0x100cab110
0x1003231ca: mov qword ptr [rip + 0x987f43], 0 ; 0x100cab118
0x1003231d5: lea rcx, [rip + 0x1acfaf4] ; 0x101df2cd0
0x1003231dc: mov qword ptr [rip + 0x987ef5], rcx ; 0x100cab0d8
0x1003231e3: lea rcx, [rip + 0x83eb45] ; 0x100b61d2f cheapFogHeight
0x1003231ea: mov qword ptr [rip + 0x987f2f], rcx ; 0x100cab120
0x1003231f1: lea rcx, [rip + 0x987ed8] ; 0x100cab0d0
0x1003231f8: mov qword ptr [rip + 0x987f31], rcx ; 0x100cab130
0x1003231ff: lea rcx, [rip + 0x1acfaea] ; 0x101df2cf0
0x100323206: mov qword ptr [rip + 0x1acfb13], rcx ; 0x101df2d20
0x10032320d: mov qword ptr [rip + 0x987f28], 0x158 ; 0x100cab140
0x100323218: mov qword ptr [rip + 0x987f29], r14 ; 0x100cab148
0x10032321f: mov qword ptr [rip + 0x987f2a], rax ; 0x100cab150
0x100323226: mov qword ptr [rip + 0x987f27], 0xffffffffffffffff ; 0x100cab158
0x100323231: mov qword ptr [rip + 0x987f28], rbx ; 0x100cab160
0x100323238: mov qword ptr [rip + 0x987f25], 0 ; 0x100cab168
0x100323243: lea rcx, [rip + 0x1acfac6] ; 0x101df2d10
0x10032324a: mov qword ptr [rip + 0x987ed7], rcx ; 0x100cab128
0x100323251: lea rcx, [rip + 0x83eae6] ; 0x100b61d3e cheapFogHeightDensity
0x100323258: mov qword ptr [rip + 0x987f11], rcx ; 0x100cab170
0x10032325f: lea rcx, [rip + 0x987eba] ; 0x100cab120
0x100323266: mov qword ptr [rip + 0x987f13], rcx ; 0x100cab180
0x10032326d: vmovaps xmmword ptr [rip + 0x1acfadb], xmm1 ; 0x101df2d50
0x100323275: lea rcx, [rip + 0x1acfab4] ; 0x101df2d30
0x10032327c: mov qword ptr [rip + 0x1acfadd], rcx ; 0x101df2d60
0x100323283: mov qword ptr [rip + 0x987f02], 0x15c ; 0x100cab190
0x10032328e: mov qword ptr [rip + 0x987f03], r14 ; 0x100cab198
0x100323295: mov qword ptr [rip + 0x987f04], rax ; 0x100cab1a0
0x10032329c: mov qword ptr [rip + 0x987f01], 0xffffffffffffffff ; 0x100cab1a8
0x1003232a7: mov qword ptr [rip + 0x987f02], rbx ; 0x100cab1b0
0x1003232ae: mov qword ptr [rip + 0x987eff], 0 ; 0x100cab1b8
0x1003232b9: lea rcx, [rip + 0x1acfa90] ; 0x101df2d50
0x1003232c0: mov qword ptr [rip + 0x987eb1], rcx ; 0x100cab178
0x1003232c7: lea rcx, [rip + 0x83e9ac] ; 0x100b61c7a cheapFogTintTop
0x1003232ce: mov qword ptr [rip + 0x987eeb], rcx ; 0x100cab1c0
0x1003232d5: lea rcx, [rip + 0x987e94] ; 0x100cab170
0x1003232dc: mov qword ptr [rip + 0x987eed], rcx ; 0x100cab1d0
0x1003232e3: vmovaps xmmword ptr [rip + 0x1acfaa5], xmm2 ; 0x101df2d90
0x1003232eb: lea rcx, [rip + 0x1acfa7e] ; 0x101df2d70
0x1003232f2: mov qword ptr [rip + 0x1acfaa7], rcx ; 0x101df2da0
0x1003232f9: lea rcx, [rip + 0x1acfa90] ; 0x101df2d90
0x100323300: mov qword ptr [rip + 0x1acfab9], rcx ; 0x101df2dc0
0x100323307: mov qword ptr [rip + 0x987ece], 0x160 ; 0x100cab1e0
0x100323312: mov qword ptr [rip + 0x987ecf], r15 ; 0x100cab1e8
0x100323319: mov qword ptr [rip + 0x987ed0], rax ; 0x100cab1f0
0x100323320: mov qword ptr [rip + 0x987ecd], 0xffffffffffffffff ; 0x100cab1f8
0x10032332b: mov qword ptr [rip + 0x987ece], rbx ; 0x100cab200
0x100323332: mov qword ptr [rip + 0x987ecb], 0 ; 0x100cab208
0x10032333d: lea rcx, [rip + 0x1acfa6c] ; 0x101df2db0
0x100323344: mov qword ptr [rip + 0x987e7d], rcx ; 0x100cab1c8
0x10032334b: lea rcx, [rip + 0x83e938] ; 0x100b61c8a cheapFogTintMidTop
0x100323352: mov qword ptr [rip + 0x987eb7], rcx ; 0x100cab210
0x100323359: lea rcx, [rip + 0x987e60] ; 0x100cab1c0
0x100323360: mov qword ptr [rip + 0x987eb9], rcx ; 0x100cab220
0x100323367: vmovaps xmmword ptr [rip + 0x1acfa81], xmm2 ; 0x101df2df0
0x10032336f: lea rcx, [rip + 0x1acfa5a] ; 0x101df2dd0
0x100323376: mov qword ptr [rip + 0x1acfa83], rcx ; 0x101df2e00
0x10032337d: lea rcx, [rip + 0x1acfa6c] ; 0x101df2df0
0x100323384: mov qword ptr [rip + 0x1acfa95], rcx ; 0x101df2e20
0x10032338b: mov qword ptr [rip + 0x987e9a], 0x170 ; 0x100cab230
0x100323396: mov qword ptr [rip + 0x987e9b], r15 ; 0x100cab238
0x10032339d: mov qword ptr [rip + 0x987e9c], rax ; 0x100cab240
0x1003233a4: mov qword ptr [rip + 0x987e99], 0xffffffffffffffff ; 0x100cab248
0x1003233af: mov qword ptr [rip + 0x987e9a], rbx ; 0x100cab250
0x1003233b6: mov qword ptr [rip + 0x987e97], 0 ; 0x100cab258
0x1003233c1: lea rcx, [rip + 0x1acfa48] ; 0x101df2e10
0x1003233c8: mov qword ptr [rip + 0x987e49], rcx ; 0x100cab218
0x1003233cf: lea rcx, [rip + 0x83e8c7] ; 0x100b61c9d cheapFogTintMidMid
0x1003233d6: mov qword ptr [rip + 0x987e83], rcx ; 0x100cab260
0x1003233dd: lea rcx, [rip + 0x987e2c] ; 0x100cab210
0x1003233e4: mov qword ptr [rip + 0x987e85], rcx ; 0x100cab270
0x1003233eb: vmovaps xmmword ptr [rip + 0x1acfa5d], xmm2 ; 0x101df2e50
0x1003233f3: lea rcx, [rip + 0x1acfa36] ; 0x101df2e30
0x1003233fa: mov qword ptr [rip + 0x1acfa5f], rcx ; 0x101df2e60
0x100323401: lea rcx, [rip + 0x1acfa48] ; 0x101df2e50
0x100323408: mov qword ptr [rip + 0x1acfa71], rcx ; 0x101df2e80
0x10032340f: mov qword ptr [rip + 0x987e66], 0x180 ; 0x100cab280
0x10032341a: mov qword ptr [rip + 0x987e67], r15 ; 0x100cab288
0x100323421: mov qword ptr [rip + 0x987e68], rax ; 0x100cab290
0x100323428: mov qword ptr [rip + 0x987e65], 0xffffffffffffffff ; 0x100cab298
0x100323433: mov qword ptr [rip + 0x987e66], rbx ; 0x100cab2a0
0x10032343a: mov qword ptr [rip + 0x987e63], 0 ; 0x100cab2a8
0x100323445: lea rcx, [rip + 0x1acfa24] ; 0x101df2e70
0x10032344c: mov qword ptr [rip + 0x987e15], rcx ; 0x100cab268
0x100323453: lea rcx, [rip + 0x83e856] ; 0x100b61cb0 cheapFogTintMidBot
0x10032345a: mov qword ptr [rip + 0x987e4f], rcx ; 0x100cab2b0
0x100323461: lea rcx, [rip + 0x987df8] ; 0x100cab260
0x100323468: mov qword ptr [rip + 0x987e51], rcx ; 0x100cab2c0
0x10032346f: vmovaps xmmword ptr [rip + 0x1acfa39], xmm2 ; 0x101df2eb0
0x100323477: lea rcx, [rip + 0x1acfa12] ; 0x101df2e90
0x10032347e: mov qword ptr [rip + 0x1acfa3b], rcx ; 0x101df2ec0
0x100323485: lea rcx, [rip + 0x1acfa24] ; 0x101df2eb0
0x10032348c: mov qword ptr [rip + 0x1acfa4d], rcx ; 0x101df2ee0
0x100323493: mov qword ptr [rip + 0x987e32], 0x190 ; 0x100cab2d0
0x10032349e: mov qword ptr [rip + 0x987e33], r15 ; 0x100cab2d8
0x1003234a5: mov qword ptr [rip + 0x987e34], rax ; 0x100cab2e0
0x1003234ac: mov qword ptr [rip + 0x987e31], 0xffffffffffffffff ; 0x100cab2e8
0x1003234b7: mov qword ptr [rip + 0x987e32], rbx ; 0x100cab2f0
0x1003234be: mov qword ptr [rip + 0x987e2f], 0 ; 0x100cab2f8
0x1003234c9: lea rcx, [rip + 0x1acfa00] ; 0x101df2ed0
0x1003234d0: mov qword ptr [rip + 0x987de1], rcx ; 0x100cab2b8
0x1003234d7: lea rcx, [rip + 0x83e7e5] ; 0x100b61cc3 cheapFogTintBot
0x1003234de: mov qword ptr [rip + 0x987e1b], rcx ; 0x100cab300
0x1003234e5: lea rcx, [rip + 0x987dc4] ; 0x100cab2b0
0x1003234ec: mov qword ptr [rip + 0x987e1d], rcx ; 0x100cab310
0x1003234f3: mov qword ptr [rip + 0x987e22], 0x1a0 ; 0x100cab320
0x1003234fe: mov qword ptr [rip + 0x987e23], r15 ; 0x100cab328
0x100323505: vmovaps xmmword ptr [rip + 0x1acfa03], xmm2 ; 0x101df2f10
0x10032350d: lea rcx, [rip + 0x1acf9dc] ; 0x101df2ef0
0x100323514: mov qword ptr [rip + 0x1acfa05], rcx ; 0x101df2f20
0x10032351b: lea rcx, [rip + 0x1acf9ee] ; 0x101df2f10
0x100323522: mov qword ptr [rip + 0x1acfa17], rcx ; 0x101df2f40
0x100323529: mov qword ptr [rip + 0x987e00], rax ; 0x100cab330
0x100323530: mov qword ptr [rip + 0x987dfd], 0xffffffffffffffff ; 0x100cab338
0x10032353b: mov qword ptr [rip + 0x987dfe], rbx ; 0x100cab340
0x100323542: mov qword ptr [rip + 0x987dfb], 0 ; 0x100cab348
0x10032354d: lea rcx, [rip + 0x1acf9dc] ; 0x101df2f30
0x100323554: mov qword ptr [rip + 0x987dad], rcx ; 0x100cab308
0x10032355b: lea rcx, [rip + 0x83e77d] ; 0x100b61cdf fogDensity
0x100323562: mov qword ptr [rip + 0x987de7], rcx ; 0x100cab350
0x100323569: lea rcx, [rip + 0x987d90] ; 0x100cab300
0x100323570: mov qword ptr [rip + 0x987de9], rcx ; 0x100cab360
0x100323577: vmovaps xmmword ptr [rip + 0x1acf9f1], xmm0 ; 0x101df2f70
0x10032357f: lea rcx, [rip + 0x1acf9ca] ; 0x101df2f50
0x100323586: mov qword ptr [rip + 0x1acf9f3], rcx ; 0x101df2f80
0x10032358d: mov qword ptr [rip + 0x987dd8], 0x134 ; 0x100cab370
0x100323598: mov qword ptr [rip + 0x987dd9], r14 ; 0x100cab378
0x10032359f: mov qword ptr [rip + 0x987dda], rax ; 0x100cab380
0x1003235a6: mov qword ptr [rip + 0x987dd7], 0xffffffffffffffff ; 0x100cab388
0x1003235b1: mov qword ptr [rip + 0x987dd8], rbx ; 0x100cab390
0x1003235b8: mov qword ptr [rip + 0x987dd5], 0 ; 0x100cab398
0x1003235c3: lea rcx, [rip + 0x1acf9a6] ; 0x101df2f70
0x1003235ca: mov qword ptr [rip + 0x987d87], rcx ; 0x100cab358
0x1003235d1: lea rcx, [rip + 0x83e712] ; 0x100b61cea fogHeight
0x1003235d8: mov qword ptr [rip + 0x987dc1], rcx ; 0x100cab3a0
0x1003235df: lea rcx, [rip + 0x987d6a] ; 0x100cab350
0x1003235e6: mov qword ptr [rip + 0x987dc3], rcx ; 0x100cab3b0
0x1003235ed: lea rcx, [rip + 0x1acf99c] ; 0x101df2f90
0x1003235f4: mov qword ptr [rip + 0x1acf9c5], rcx ; 0x101df2fc0
0x1003235fb: mov qword ptr [rip + 0x987dba], 0x138 ; 0x100cab3c0
0x100323606: mov qword ptr [rip + 0x987dbb], r14 ; 0x100cab3c8
0x10032360d: mov qword ptr [rip + 0x987dbc], rax ; 0x100cab3d0
0x100323614: mov qword ptr [rip + 0x987db9], 0xffffffffffffffff ; 0x100cab3d8
0x10032361f: mov qword ptr [rip + 0x987dba], rbx ; 0x100cab3e0
0x100323626: mov qword ptr [rip + 0x987db7], 0 ; 0x100cab3e8
0x100323631: lea rcx, [rip + 0x1acf978] ; 0x101df2fb0
0x100323638: mov qword ptr [rip + 0x987d69], rcx ; 0x100cab3a8
0x10032363f: lea rcx, [rip + 0x83e6ae] ; 0x100b61cf4 drawDistance
0x100323646: mov qword ptr [rip + 0x987da3], rcx ; 0x100cab3f0
0x10032364d: lea rcx, [rip + 0x987d4c] ; 0x100cab3a0
0x100323654: mov qword ptr [rip + 0x987da5], rcx ; 0x100cab400
0x10032365b: lea rcx, [rip + 0x1acf96e] ; 0x101df2fd0
0x100323662: mov qword ptr [rip + 0x1acf997], rcx ; 0x101df3000
0x100323669: mov qword ptr [rip + 0x987d9c], 0x13c ; 0x100cab410
0x100323674: mov qword ptr [rip + 0x987d9d], r14 ; 0x100cab418
0x10032367b: mov qword ptr [rip + 0x987d9e], rax ; 0x100cab420
0x100323682: mov qword ptr [rip + 0x987d9b], 0xffffffffffffffff ; 0x100cab428
0x10032368d: mov qword ptr [rip + 0x987d9c], rbx ; 0x100cab430
0x100323694: mov qword ptr [rip + 0x987d99], 0 ; 0x100cab438
0x10032369f: lea rcx, [rip + 0x1acf94a] ; 0x101df2ff0
0x1003236a6: mov qword ptr [rip + 0x987d4b], rcx ; 0x100cab3f8
0x1003236ad: lea rcx, [rip + 0x85d5f9] ; 0x100b80cad bloomTint
0x1003236b4: mov qword ptr [rip + 0x987d85], rcx ; 0x100cab440
0x1003236bb: lea rcx, [rip + 0x987d2e] ; 0x100cab3f0
0x1003236c2: mov qword ptr [rip + 0x987d87], rcx ; 0x100cab450
0x1003236c9: lea rcx, [rip + 0x1acf940] ; 0x101df3010
0x1003236d0: mov qword ptr [rip + 0x1acf969], rcx ; 0x101df3040
0x1003236d7: mov qword ptr [rip + 0x987d7e], 0x1b0 ; 0x100cab460
0x1003236e2: mov qword ptr [rip + 0x987d7f], r13 ; 0x100cab468
0x1003236e9: mov qword ptr [rip + 0x987d80], rax ; 0x100cab470
0x1003236f0: mov qword ptr [rip + 0x987d7d], 0xffffffffffffffff ; 0x100cab478
0x1003236fb: mov qword ptr [rip + 0x987d7e], rbx ; 0x100cab480
0x100323702: mov qword ptr [rip + 0x987d7b], 0 ; 0x100cab488
0x10032370d: lea rcx, [rip + 0x1acf91c] ; 0x101df3030
0x100323714: mov qword ptr [rip + 0x987d2d], rcx ; 0x100cab448
0x10032371b: vmovaps xmm3, xmmword ptr [rbp - 0x40]
0x100323720: vmovaps xmmword ptr [rip + 0x1acf948], xmm3 ; 0x101df3070
0x100323728: vmovaps xmmword ptr [rip + 0x1acf980], xmm1 ; 0x101df30b0
0x100323730: vmovaps xmm1, xmmword ptr [rbp - 0x240]
0x100323738: vmovaps xmmword ptr [rip + 0x1acf9b0], xmm1 ; 0x101df30f0
0x100323740: vmovaps xmm1, xmmword ptr [rbp - 0x230]
0x100323748: vmovaps xmmword ptr [rip + 0x1acf9c0], xmm1 ; 0x101df3110
0x100323750: vmovaps xmm1, xmmword ptr [rbp - 0x130]
0x100323758: vmovaps xmmword ptr [rip + 0x1acf8b0], xmm1 ; 0x101df3010
0x100323760: vmovaps xmmword ptr [rip + 0x1acf8e8], xmm1 ; 0x101df3050
0x100323768: vmovaps xmmword ptr [rip + 0x1acf920], xmm1 ; 0x101df3090
0x100323770: vmovaps xmmword ptr [rip + 0x1acf958], xmm1 ; 0x101df30d0
0x100323778: vmovaps xmmword ptr [rip + 0x1acf9b0], xmm1 ; 0x101df3130
0x100323780: vmovaps xmm1, xmmword ptr [rbp - 0x260]
0x100323788: vmovaps xmmword ptr [rip + 0x1acf9c0], xmm1 ; 0x101df3150
0x100323790: vmovaps xmm1, xmmword ptr [rbp - 0x250]
0x100323798: vmovaps xmmword ptr [rip + 0x1acf9d0], xmm1 ; 0x101df3170
0x1003237a0: vmovaps xmm1, xmmword ptr [rbp - 0x1b0]
0x1003237a8: vmovaps xmmword ptr [rip + 0x1acf9e0], xmm1 ; 0x101df3190
0x1003237b0: vmovaps xmmword ptr [rip + 0x1acfa18], xmm2 ; 0x101df31d0
0x1003237b8: vmovaps xmm1, xmmword ptr [rbp - 0x220]
0x1003237c0: vmovaps xmmword ptr [rip + 0x1acfa48], xmm1 ; 0x101df3210
0x1003237c8: vmovaps xmm1, xmmword ptr [rbp - 0x140]
0x1003237d0: vmovaps xmmword ptr [rip + 0x1acfa18], xmm1 ; 0x101df31f0
0x1003237d8: vmovaps xmmword ptr [rip + 0x1acfa50], xmm1 ; 0x101df3230
0x1003237e0: vmovaps xmm1, xmmword ptr [rbp - 0x200]
0x1003237e8: vmovaps xmmword ptr [rip + 0x1acfa60], xmm1 ; 0x101df3250
0x1003237f0: vmovaps xmm1, xmmword ptr [rbp - 0x1c0]
0x1003237f8: vmovaps xmmword ptr [rip + 0x1acfa70], xmm1 ; 0x101df3270
0x100323800: vmovaps xmmword ptr [rip + 0x1acf9a8], xmm0 ; 0x101df31b0
0x100323808: vmovaps xmmword ptr [rip + 0x1acfa80], xmm0 ; 0x101df3290
0x100323810: vmovaps xmm0, xmmword ptr [rbp - 0x1d0]
0x100323818: vmovaps xmmword ptr [rip + 0x1acfa90], xmm0 ; 0x101df32b0
0x100323820: vmovaps xmm0, xmmword ptr [rbp - 0x1f0]
0x100323828: vmovaps xmmword ptr [rip + 0x1acfaa0], xmm0 ; 0x101df32d0
0x100323830: lea rcx, [rip + 0x85d492] ; 0x100b80cc9 bloomIntensity
0x100323837: mov qword ptr [rip + 0x987c52], rcx ; 0x100cab490
0x10032383e: lea rcx, [rip + 0x987bfb] ; 0x100cab440
0x100323845: mov qword ptr [rip + 0x987c54], rcx ; 0x100cab4a0
0x10032384c: mov qword ptr [rip + 0x987c59], 0x1c0 ; 0x100cab4b0
0x100323857: mov qword ptr [rip + 0x987c5a], r14 ; 0x100cab4b8
0x10032385e: mov qword ptr [rip + 0x987c5b], rax ; 0x100cab4c0
0x100323865: mov qword ptr [rip + 0x987c58], 0xffffffffffffffff ; 0x100cab4c8
0x100323870: mov qword ptr [rip + 0x987c59], rbx ; 0x100cab4d0
0x100323877: mov qword ptr [rip + 0x987c56], 0 ; 0x100cab4d8
0x100323882: lea rcx, [rip + 0x1acf7c7] ; 0x101df3050
0x100323889: mov qword ptr [rip + 0x1acf7f0], rcx ; 0x101df3080
0x100323890: lea rcx, [rip + 0x1acf7d9] ; 0x101df3070
0x100323897: mov qword ptr [rip + 0x987bfa], rcx ; 0x100cab498
0x10032389e: lea rcx, [rip + 0x85d438] ; 0x100b80cdd bloomOverbright
0x1003238a5: mov qword ptr [rip + 0x987c34], rcx ; 0x100cab4e0
0x1003238ac: lea rcx, [rip + 0x987bdd] ; 0x100cab490
0x1003238b3: mov qword ptr [rip + 0x987c36], rcx ; 0x100cab4f0
0x1003238ba: mov qword ptr [rip + 0x987c3b], 0x1c4 ; 0x100cab500
0x1003238c5: mov qword ptr [rip + 0x987c3c], r14 ; 0x100cab508
0x1003238cc: mov qword ptr [rip + 0x987c3d], rax ; 0x100cab510
0x1003238d3: mov qword ptr [rip + 0x987c3a], 0xffffffffffffffff ; 0x100cab518
0x1003238de: mov qword ptr [rip + 0x987c3b], rbx ; 0x100cab520
0x1003238e5: mov qword ptr [rip + 0x987c38], 0 ; 0x100cab528
0x1003238f0: lea rcx, [rip + 0x1acf799] ; 0x101df3090
0x1003238f7: mov qword ptr [rip + 0x1acf7c2], rcx ; 0x101df30c0
0x1003238fe: lea rcx, [rip + 0x1acf7ab] ; 0x101df30b0
0x100323905: mov qword ptr [rip + 0x987bdc], rcx ; 0x100cab4e8
0x10032390c: lea rcx, [rip + 0x85d3da] ; 0x100b80ced bloomGhost
0x100323913: mov qword ptr [rip + 0x987c16], rcx ; 0x100cab530
0x10032391a: lea rcx, [rip + 0x987bbf] ; 0x100cab4e0
0x100323921: mov qword ptr [rip + 0x987c18], rcx ; 0x100cab540
0x100323928: mov qword ptr [rip + 0x987c1d], 0x1c8 ; 0x100cab550
0x100323933: mov qword ptr [rip + 0x987c1e], r14 ; 0x100cab558
0x10032393a: mov qword ptr [rip + 0x987c1f], rax ; 0x100cab560
0x100323941: mov qword ptr [rip + 0x987c1c], 0xffffffffffffffff ; 0x100cab568
0x10032394c: mov qword ptr [rip + 0x987c1d], rbx ; 0x100cab570
0x100323953: mov qword ptr [rip + 0x987c1a], 0 ; 0x100cab578
0x10032395e: lea rcx, [rip + 0x1acf76b] ; 0x101df30d0
0x100323965: mov qword ptr [rip + 0x1acf794], rcx ; 0x101df3100
0x10032396c: lea rcx, [rip + 0x1acf77d] ; 0x101df30f0
0x100323973: mov qword ptr [rip + 0x1acf7a6], rcx ; 0x101df3120
0x10032397a: lea rcx, [rip + 0x1acf78f] ; 0x101df3110
0x100323981: mov qword ptr [rip + 0x987bb0], rcx ; 0x100cab538
0x100323988: lea rcx, [rip + 0x85d375] ; 0x100b80d04 bloomFalloff
0x10032398f: mov qword ptr [rip + 0x987bea], rcx ; 0x100cab580
0x100323996: lea rcx, [rip + 0x987b93] ; 0x100cab530
0x10032399d: mov qword ptr [rip + 0x987bec], rcx ; 0x100cab590
0x1003239a4: mov qword ptr [rip + 0x987bf1], 0x1cc ; 0x100cab5a0
0x1003239af: mov qword ptr [rip + 0x987bf2], r14 ; 0x100cab5a8
0x1003239b6: mov qword ptr [rip + 0x987bf3], rax ; 0x100cab5b0
0x1003239bd: mov qword ptr [rip + 0x987bf0], 0xffffffffffffffff ; 0x100cab5b8
0x1003239c8: mov qword ptr [rip + 0x987bf1], rbx ; 0x100cab5c0
0x1003239cf: mov qword ptr [rip + 0x987bee], 0 ; 0x100cab5c8
0x1003239da: lea rcx, [rip + 0x1acf74f] ; 0x101df3130
0x1003239e1: mov qword ptr [rip + 0x1acf778], rcx ; 0x101df3160
0x1003239e8: lea rcx, [rip + 0x1acf761] ; 0x101df3150
0x1003239ef: mov qword ptr [rip + 0x1acf78a], rcx ; 0x101df3180
0x1003239f6: lea rcx, [rip + 0x1acf773] ; 0x101df3170
0x1003239fd: mov qword ptr [rip + 0x987b84], rcx ; 0x100cab588
0x100323a04: lea rcx, [rip + 0x83e381] ; 0x100b61d8c exposure
0x100323a0b: mov qword ptr [rip + 0x987bbe], rcx ; 0x100cab5d0
0x100323a12: lea rcx, [rip + 0x987b67] ; 0x100cab580
0x100323a19: mov qword ptr [rip + 0x987bc0], rcx ; 0x100cab5e0
0x100323a20: mov qword ptr [rip + 0x987bc5], 0x1d0 ; 0x100cab5f0
0x100323a2b: mov qword ptr [rip + 0x987bc6], r14 ; 0x100cab5f8
0x100323a32: mov qword ptr [rip + 0x987bc7], rax ; 0x100cab600
0x100323a39: mov qword ptr [rip + 0x987bc4], 0xffffffffffffffff ; 0x100cab608
0x100323a44: mov qword ptr [rip + 0x987bc5], rbx ; 0x100cab610
0x100323a4b: mov qword ptr [rip + 0x987bc2], 0 ; 0x100cab618
0x100323a56: lea rcx, [rip + 0x1acf733] ; 0x101df3190
0x100323a5d: mov qword ptr [rip + 0x1acf75c], rcx ; 0x101df31c0
0x100323a64: lea rcx, [rip + 0x1acf745] ; 0x101df31b0
0x100323a6b: mov qword ptr [rip + 0x987b66], rcx ; 0x100cab5d8
0x100323a72: lea rcx, [rip + 0x85d2ab] ; 0x100b80d24 pointColor
0x100323a79: mov qword ptr [rip + 0x987ba0], rcx ; 0x100cab620
0x100323a80: lea rcx, [rip + 0x987b49] ; 0x100cab5d0
0x100323a87: mov qword ptr [rip + 0x987ba2], rcx ; 0x100cab630
0x100323a8e: mov qword ptr [rip + 0x986ed7], 0x60 ; 0x100caa970
0x100323a99: mov qword ptr [rip + 0x986ed8], r13 ; 0x100caa978
0x100323aa0: mov qword ptr [rip + 0x986f65], 0x80 ; 0x100caaa10
0x100323aab: mov qword ptr [rip + 0x986f66], r13 ; 0x100caaa18
0x100323ab2: mov qword ptr [rip + 0x987b83], 0x1e0 ; 0x100cab640
0x100323abd: mov qword ptr [rip + 0x987b84], r13 ; 0x100cab648
0x100323ac4: mov qword ptr [rip + 0x987b85], rax ; 0x100cab650
0x100323acb: mov qword ptr [rip + 0x987b82], 0xffffffffffffffff ; 0x100cab658
0x100323ad6: mov qword ptr [rip + 0x987b83], rbx ; 0x100cab660
0x100323add: mov qword ptr [rip + 0x987b80], 0 ; 0x100cab668
0x100323ae8: lea rcx, [rip + 0x1acf6e1] ; 0x101df31d0
0x100323aef: mov qword ptr [rip + 0x1acf70a], rcx ; 0x101df3200
0x100323af6: lea rcx, [rip + 0x1acf6f3] ; 0x101df31f0
0x100323afd: mov qword ptr [rip + 0x1acf71c], rcx ; 0x101df3220
0x100323b04: lea rcx, [rip + 0x1acf705] ; 0x101df3210
0x100323b0b: mov qword ptr [rip + 0x987b16], rcx ; 0x100cab628
0x100323b12: lea rcx, [rip + 0x85d236] ; 0x100b80d4f pointIntensity
0x100323b19: mov qword ptr [rip + 0x987b50], rcx ; 0x100cab670
0x100323b20: lea rcx, [rip + 0x987af9] ; 0x100cab620
0x100323b27: mov qword ptr [rip + 0x987b52], rcx ; 0x100cab680
0x100323b2e: mov qword ptr [rip + 0x987b57], 0x1f0 ; 0x100cab690
0x100323b39: mov qword ptr [rip + 0x987b58], r14 ; 0x100cab698
0x100323b40: mov qword ptr [rip + 0x987b59], rax ; 0x100cab6a0
0x100323b47: mov qword ptr [rip + 0x987b56], 0xffffffffffffffff ; 0x100cab6a8
0x100323b52: mov qword ptr [rip + 0x987b57], rbx ; 0x100cab6b0
0x100323b59: mov qword ptr [rip + 0x987b54], 0 ; 0x100cab6b8
0x100323b64: lea rcx, [rip + 0x1acf6c5] ; 0x101df3230
0x100323b6b: mov qword ptr [rip + 0x1acf6ee], rcx ; 0x101df3260
0x100323b72: lea rcx, [rip + 0x1acf6d7] ; 0x101df3250
0x100323b79: mov qword ptr [rip + 0x987af8], rcx ; 0x100cab678
0x100323b80: lea rcx, [rip + 0x856ab8] ; 0x100b7a63f undulationScale
0x100323b87: mov qword ptr [rip + 0x987b32], rcx ; 0x100cab6c0
0x100323b8e: lea rcx, [rip + 0x987adb] ; 0x100cab670
0x100323b95: mov qword ptr [rip + 0x987b34], rcx ; 0x100cab6d0
0x100323b9c: mov qword ptr [rip + 0x987b39], 0x1f4 ; 0x100cab6e0
0x100323ba7: mov qword ptr [rip + 0x987b3a], r14 ; 0x100cab6e8
0x100323bae: mov qword ptr [rip + 0x987b3b], rax ; 0x100cab6f0
0x100323bb5: mov qword ptr [rip + 0x987b38], 0xffffffffffffffff ; 0x100cab6f8
0x100323bc0: mov qword ptr [rip + 0x987b39], rbx ; 0x100cab700
0x100323bc7: mov qword ptr [rip + 0x987b36], 0 ; 0x100cab708
0x100323bd2: lea rcx, [rip + 0x1acf697] ; 0x101df3270
0x100323bd9: mov qword ptr [rip + 0x1acf6c0], rcx ; 0x101df32a0
0x100323be0: lea rcx, [rip + 0x1acf6a9] ; 0x101df3290
0x100323be7: mov qword ptr [rip + 0x987ada], rcx ; 0x100cab6c8
0x100323bee: lea rcx, [rip + 0x85d16f] ; 0x100b80d64 fogVolumeIntensity
0x100323bf5: mov qword ptr [rip + 0x987b14], rcx ; 0x100cab710
0x100323bfc: lea rcx, [rip + 0x987abd] ; 0x100cab6c0
0x100323c03: mov qword ptr [rip + 0x987b16], rcx ; 0x100cab720
0x100323c0a: lea rcx, [rip + 0x987aff] ; 0x100cab710
0x100323c11: mov qword ptr [rip + 0x954048], rcx ; 0x100c77c60
0x100323c18: mov qword ptr [rip + 0x987b0d], 0x1f8 ; 0x100cab730
0x100323c23: mov qword ptr [rip + 0x987b0e], r14 ; 0x100cab738
0x100323c2a: mov qword ptr [rip + 0x986caf], rax ; 0x100caa8e0
0x100323c31: mov qword ptr [rip + 0x1ace9a8], rax ; 0x101df25e0
0x100323c38: mov qword ptr [rip + 0x1acea01], rax ; 0x101df2640
0x100323c3f: mov qword ptr [rip + 0x1acea5a], rax ; 0x101df26a0
0x100323c46: mov qword ptr [rip + 0x986d33], rax ; 0x100caa980
0x100323c4d: mov qword ptr [rip + 0x986d7c], rax ; 0x100caa9d0
0x100323c54: mov qword ptr [rip + 0x986dc5], rax ; 0x100caaa20
0x100323c5b: mov qword ptr [rip + 0x987ade], rax ; 0x100cab740
0x100323c62: mov qword ptr [rip + 0x986c7b], 0xffffffffffffffff ; 0x100caa8e8
0x100323c6d: mov qword ptr [rip + 0x986c7c], rbx ; 0x100caa8f0
0x100323c74: mov qword ptr [rip + 0x986d09], 0xffffffffffffffff ; 0x100caa988
0x100323c7f: mov qword ptr [rip + 0x986d0a], rbx ; 0x100caa990
0x100323c86: mov qword ptr [rip + 0x986d47], 0xffffffffffffffff ; 0x100caa9d8
0x100323c91: mov qword ptr [rip + 0x986d48], rbx ; 0x100caa9e0
0x100323c98: mov qword ptr [rip + 0x986d85], 0xffffffffffffffff ; 0x100caaa28
0x100323ca3: mov qword ptr [rip + 0x986d86], rbx ; 0x100caaa30
0x100323caa: mov qword ptr [rip + 0x987a93], 0xffffffffffffffff ; 0x100cab748
0x100323cb5: mov qword ptr [rip + 0x987a94], rbx ; 0x100cab750
0x100323cbc: mov qword ptr [rip + 0x987a91], 0 ; 0x100cab758
0x100323cc7: lea rax, [rip + 0x1acf5e2] ; 0x101df32b0
0x100323cce: mov qword ptr [rip + 0x1acf60b], rax ; 0x101df32e0
0x100323cd5: lea rax, [rip + 0x1acf5f4] ; 0x101df32d0
0x100323cdc: mov qword ptr [rip + 0x987a35], rax ; 0x100cab718
0x100323ce3: mov qword ptr [rip + 0x986c0a], 0 ; 0x100caa8f8
0x100323cee: mov qword ptr [rip + 0x1ace887], 0 ; 0x101df2580
0x100323cf9: mov qword ptr [rip + 0x986c94], 0 ; 0x100caa998
0x100323d04: mov qword ptr [rip + 0x986cd9], 0 ; 0x100caa9e8
0x100323d0f: mov qword ptr [rip + 0x986d1e], 0 ; 0x100caaa38
0x100323d1a: mov qword ptr [rip + 0x1ace99b], 0 ; 0x101df26c0
0x100323d25: mov qword ptr [rip + 0x1ace9d0], 0 ; 0x101df2700
0x100323d30: mov qword ptr [rip + 0x1acea05], 0 ; 0x101df2740
0x100323d3b: mov qword ptr [rip + 0x1acea3a], 0 ; 0x101df2780
0x100323d46: mov qword ptr [rip + 0x1acea6f], 0 ; 0x101df27c0
0x100323d51: mov qword ptr [rip + 0x1aceaa4], 0 ; 0x101df2800
0x100323d5c: mov qword ptr [rip + 0x1acead9], 0 ; 0x101df2840
0x100323d67: mov qword ptr [rip + 0x1aceb0e], 0 ; 0x101df2880
0x100323d72: mov qword ptr [rip + 0x1aceb63], 0 ; 0x101df28e0
0x100323d7d: mov qword ptr [rip + 0x1aceb98], 0 ; 0x101df2920
0x100323d88: mov qword ptr [rip + 0x1acebcd], 0 ; 0x101df2960
0x100323d93: mov qword ptr [rip + 0x1acec02], 0 ; 0x101df29a0
0x100323d9e: mov qword ptr [rip + 0x1acec37], 0 ; 0x101df29e0
0x100323da9: mov qword ptr [rip + 0x1acec8c], 0 ; 0x101df2a40
0x100323db4: mov qword ptr [rip + 0x1acece1], 0 ; 0x101df2aa0
0x100323dbf: mov qword ptr [rip + 0x1aced36], 0 ; 0x101df2b00
0x100323dca: mov qword ptr [rip + 0x1aced8b], 0 ; 0x101df2b60
0x100323dd5: mov qword ptr [rip + 0x1acede0], 0 ; 0x101df2bc0
0x100323de0: mov qword ptr [rip + 0x1acee15], 0 ; 0x101df2c00
0x100323deb: mov qword ptr [rip + 0x1acee4a], 0 ; 0x101df2c40
0x100323df6: mov qword ptr [rip + 0x1acee7f], 0 ; 0x101df2c80
0x100323e01: mov qword ptr [rip + 0x1aceeb4], 0 ; 0x101df2cc0
0x100323e0c: mov qword ptr [rip + 0x1aceee9], 0 ; 0x101df2d00
0x100323e17: mov qword ptr [rip + 0x1acef1e], 0 ; 0x101df2d40
0x100323e22: mov qword ptr [rip + 0x1acef53], 0 ; 0x101df2d80
0x100323e2d: mov qword ptr [rip + 0x1acefa8], 0 ; 0x101df2de0
0x100323e38: mov qword ptr [rip + 0x1aceffd], 0 ; 0x101df2e40
0x100323e43: mov qword ptr [rip + 0x1acf052], 0 ; 0x101df2ea0
0x100323e4e: mov qword ptr [rip + 0x1acf0a7], 0 ; 0x101df2f00
0x100323e59: mov qword ptr [rip + 0x1acf0fc], 0 ; 0x101df2f60
0x100323e64: mov qword ptr [rip + 0x1acf131], 0 ; 0x101df2fa0
0x100323e6f: mov qword ptr [rip + 0x1acf166], 0 ; 0x101df2fe0
0x100323e7a: mov qword ptr [rip + 0x1acf19b], 0 ; 0x101df3020
0x100323e85: mov qword ptr [rip + 0x1acf1d0], 0 ; 0x101df3060
0x100323e90: mov qword ptr [rip + 0x1acf205], 0 ; 0x101df30a0
0x100323e9b: mov qword ptr [rip + 0x1acf23a], 0 ; 0x101df30e0
0x100323ea6: mov qword ptr [rip + 0x1acf28f], 0 ; 0x101df3140
0x100323eb1: mov qword ptr [rip + 0x1acf2e4], 0 ; 0x101df31a0
0x100323ebc: mov qword ptr [rip + 0x1acf319], 0 ; 0x101df31e0
0x100323ec7: mov qword ptr [rip + 0x1acf36e], 0 ; 0x101df3240
0x100323ed2: mov qword ptr [rip + 0x1acf3a3], 0 ; 0x101df3280
0x100323edd: mov qword ptr [rip + 0x1acf3d8], 0 ; 0x101df32c0
0x100323ee8: add rsp, 0x278
0x100323eef: pop rbx
0x100323ef0: pop r12
0x100323ef2: pop r13
0x100323ef4: pop r14
0x100323ef6: pop r15
0x100323ef8: pop rbp
0x100323ef9: ret 
0x100323efa: nop 
0x100323efb: nop 
0x100323efc: nop 
0x100323efd: nop 
0x100323efe: nop 
0x100323eff: nop 
