0x10022d430: push rbp
0x10022d431: mov rbp, rsp
0x10022d434: push r14
0x10022d436: push rbx
0x10022d437: lea r14, [rip + 0x946af2] ; 0x100b73f30 Clump
0x10022d43e: mov qword ptr [rip + 0x1bb5823], r14 ; 0x101de2c68
0x10022d445: lea rax, [rip + 0x1bb5814] ; 0x101de2c60
0x10022d44c: mov qword ptr [rip + 0x1bb5819], 0 ; 0x101de2c70
0x10022d457: mov rcx, qword ptr [rip + 0xa42afa] ; 0x100c6ff58
0x10022d45e: mov qword ptr [rip + 0x1bb5813], rcx ; 0x101de2c78
0x10022d465: mov qword ptr [rip + 0xa42aec], rax ; 0x100c6ff58
0x10022d46c: mov qword ptr [rip + 0x1bb5815], rax ; 0x101de2c88
0x10022d473: lea rax, [rip - 0x1f7bba] ; 0x1000358c0
0x10022d47a: mov qword ptr [rip + 0x1bb580f], rax ; 0x101de2c90
0x10022d481: mov qword ptr [rip + 0x1bb580c], 0xffffffffffffffff ; 0x101de2c98
0x10022d48c: mov qword ptr [rip + 0x1bb5821], 0 ; 0x101de2cb8
0x10022d497: mov rax, qword ptr [rip + 0x9def82] ; 0x100c0c420
0x10022d49e: add rax, 0x10
0x10022d4a2: mov qword ptr [rip + 0x1bb57b7], rax ; 0x101de2c60
0x10022d4a9: xor eax, eax
0x10022d4ab: call 0x100011c10 ; 0x100011c10
0x10022d4b0: lea rax, [rip + 0x931528] ; 0x100b5e9df true
0x10022d4b7: vmovq xmm0, rax
0x10022d4bc: lea rax, [rip + 0x932b79] ; 0x100b6003c Tool_Export
0x10022d4c3: vmovq xmm1, rax
0x10022d4c8: vpunpcklqdq xmm0, xmm1, xmm0
0x10022d4cc: vmovdqa xmmword ptr [rip + 0x1bb57ec], xmm0 ; 0x101de2cc0
0x10022d4d4: lea r8, [rip + 0x1bb57e5] ; 0x101de2cc0
0x10022d4db: mov rcx, qword ptr [rip + 0x1bb578e] ; 0x101de2c70
0x10022d4e2: mov qword ptr [rip + 0x1bb57e7], rcx ; 0x101de2cd0
0x10022d4e9: lea rcx, [rip + 0x94d745] ; 0x100b7ac35 SetAt
0x10022d4f0: mov qword ptr [rip + 0x1bb57e1], rcx ; 0x101de2cd8
0x10022d4f7: lea rdx, [rip + 0x1bb57da] ; 0x101de2cd8
0x10022d4fe: mov qword ptr [rip + 0x1bb57d7], 0 ; 0x101de2ce0
0x10022d509: mov rcx, qword ptr [rip + 0xa42a50] ; 0x100c6ff60
0x10022d510: mov qword ptr [rip + 0x1bb57d1], rcx ; 0x101de2ce8
0x10022d517: lea rcx, [rip - 0x1dbe] ; 0x10022b760
0x10022d51e: vmovq xmm0, rcx
0x10022d523: vmovdqu xmmword ptr [rip + 0x1bb57e5], xmm0 ; 0x101de2d10
0x10022d52b: mov rcx, qword ptr [rip + 0x9d8cbe] ; 0x100c061f0 -> 0x10022c3b0 __Z12ApplyWrapperI5ClumpMS0_FvjP6ObjectEEvM9VoidClassFvvEPv8VariablePS9_j
0x10022d532: mov qword ptr [rip + 0x1bb57e7], rcx ; 0x101de2d20
0x10022d539: mov rcx, qword ptr [rip + 0x9dc540] ; 0x100c09a80 -> 0x10022c3c0 __Z21InitFunctionSignatureIM5ClumpFvjP6ObjectEEvP17FunctionSignature
0x10022d540: mov qword ptr [rip + 0x1bb57e1], rcx ; 0x101de2d28
0x10022d547: mov rcx, qword ptr [rip + 0x9db082] ; 0x100c085d0 -> 0x10022c3a0 __Z18GetMetaClassByTypeIP5ClumpERK9MetaClassv
0x10022d54e: mov qword ptr [rip + 0x1bb57db], rcx ; 0x101de2d30
0x10022d555: lea rsi, [rip + 0x94d6df] ; 0x100b7ac3b GetAt
0x10022d55c: mov qword ptr [rip + 0x1bb57d5], rsi ; 0x101de2d38
0x10022d563: lea rsi, [rip + 0x1bb57ce] ; 0x101de2d38
0x10022d56a: mov qword ptr [rip + 0x1bb57cb], 0 ; 0x101de2d40
0x10022d575: mov qword ptr [rip + 0x1bb57cc], rdx ; 0x101de2d48
0x10022d57c: lea rdx, [rip - 0x1de3] ; 0x10022b7a0
0x10022d583: vmovq xmm0, rdx
0x10022d588: vmovdqu xmmword ptr [rip + 0x1bb57e0], xmm0 ; 0x101de2d70
0x10022d590: mov rdx, qword ptr [rip + 0x9d8c31] ; 0x100c061c8 -> 0x10022c530 __Z12ApplyWrapperI5ClumpMS0_FP6ObjectjEEvM9VoidClassFvvEPv8VariablePS9_j
0x10022d597: mov qword ptr [rip + 0x1bb57e2], rdx ; 0x101de2d80
0x10022d59e: mov rdx, qword ptr [rip + 0x9dc4b3] ; 0x100c09a58 -> 0x10022c5f0 __Z21InitFunctionSignatureIM5ClumpFP6ObjectjEEvP17FunctionSignature
0x10022d5a5: mov qword ptr [rip + 0x1bb57dc], rdx ; 0x101de2d88
0x10022d5ac: mov qword ptr [rip + 0x1bb57dd], rcx ; 0x101de2d90
0x10022d5b3: lea rdx, [rip + 0x94d687] ; 0x100b7ac41 Size
0x10022d5ba: mov qword ptr [rip + 0x1bb57d7], rdx ; 0x101de2d98
0x10022d5c1: lea rdx, [rip + 0x1bb57d0] ; 0x101de2d98
0x10022d5c8: mov qword ptr [rip + 0x1bb57cd], 0 ; 0x101de2da0
0x10022d5d3: mov qword ptr [rip + 0x1bb57ce], rsi ; 0x101de2da8
0x10022d5da: lea rsi, [rip - 0x1e01] ; 0x10022b7e0
0x10022d5e1: vmovq xmm0, rsi
0x10022d5e6: vmovdqu xmmword ptr [rip + 0x1bb57e2], xmm0 ; 0x101de2dd0
0x10022d5ee: mov rsi, qword ptr [rip + 0x9d8c0b] ; 0x100c06200 -> 0x10022c670 __Z12ApplyWrapperI5ClumpMS0_KFjvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10022d5f5: mov qword ptr [rip + 0x1bb57e4], rsi ; 0x101de2de0
0x10022d5fc: mov rsi, qword ptr [rip + 0x9dc48d] ; 0x100c09a90 -> 0x10022c6f0 __Z21InitFunctionSignatureIM5ClumpKFjvEEvP17FunctionSignature
0x10022d603: mov qword ptr [rip + 0x1bb57de], rsi ; 0x101de2de8
0x10022d60a: mov qword ptr [rip + 0x1bb57df], rcx ; 0x101de2df0
0x10022d611: lea rsi, [rip + 0x949a36] ; 0x100b7704e SetEnabled
0x10022d618: mov qword ptr [rip + 0x1bb57d9], rsi ; 0x101de2df8
0x10022d61f: lea rsi, [rip + 0x1bb57d2] ; 0x101de2df8
0x10022d626: mov qword ptr [rip + 0x1bb57cf], 0 ; 0x101de2e00
0x10022d631: mov qword ptr [rip + 0x1bb57d0], rdx ; 0x101de2e08
0x10022d638: lea rdx, [rip - 0x1e4f] ; 0x10022b7f0
0x10022d63f: vmovq xmm0, rdx
0x10022d644: vmovdqu xmmword ptr [rip + 0x1bb57e4], xmm0 ; 0x101de2e30
0x10022d64c: mov rdx, qword ptr [rip + 0x9d8b8d] ; 0x100c061e0 -> 0x10022c720 __Z12ApplyWrapperI5ClumpMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x10022d653: mov qword ptr [rip + 0x1bb57e6], rdx ; 0x101de2e40
0x10022d65a: mov rdx, qword ptr [rip + 0x9dc40f] ; 0x100c09a70 -> 0x10022c7c0 __Z21InitFunctionSignatureIM5ClumpFvbEEvP17FunctionSignature
0x10022d661: mov qword ptr [rip + 0x1bb57e0], rdx ; 0x101de2e48
0x10022d668: mov qword ptr [rip + 0x1bb57e1], rcx ; 0x101de2e50
0x10022d66f: lea rdx, [rip + 0x94d5d0] ; 0x100b7ac46 AllocateClumpData
0x10022d676: mov qword ptr [rip + 0x1bb57db], rdx ; 0x101de2e58
0x10022d67d: lea rdi, [rip + 0x1bb57d4] ; 0x101de2e58
0x10022d684: mov qword ptr [rip + 0x1bb57d1], 0 ; 0x101de2e60
0x10022d68f: mov qword ptr [rip + 0x1bb57d2], rsi ; 0x101de2e68
0x10022d696: lea rsi, [rip - 0x1e5d] ; 0x10022b840
0x10022d69d: vmovq xmm0, rsi
0x10022d6a2: vmovdqu xmmword ptr [rip + 0x1bb57e6], xmm0 ; 0x101de2e90
0x10022d6aa: mov rsi, qword ptr [rip + 0x9d8b37] ; 0x100c061e8 -> 0x10022c840 __Z12ApplyWrapperI5ClumpMS0_FvjEEvM9VoidClassFvvEPv8VariablePS7_j
0x10022d6b1: mov qword ptr [rip + 0x1bb57e8], rsi ; 0x101de2ea0
0x10022d6b8: mov rsi, qword ptr [rip + 0x9dc3b9] ; 0x100c09a78 -> 0x10022c8e0 __Z21InitFunctionSignatureIM5ClumpFvjEEvP17FunctionSignature
0x10022d6bf: mov qword ptr [rip + 0x1bb57e2], rsi ; 0x101de2ea8
0x10022d6c6: mov qword ptr [rip + 0x1bb57e3], rcx ; 0x101de2eb0
0x10022d6cd: lea rsi, [rip + 0x94d584] ; 0x100b7ac58 Compact
0x10022d6d4: mov qword ptr [rip + 0x1bb57dd], rsi ; 0x101de2eb8
0x10022d6db: lea rsi, [rip + 0x1bb57d6] ; 0x101de2eb8
0x10022d6e2: mov qword ptr [rip + 0x1bb57d3], 0 ; 0x101de2ec0
0x10022d6ed: mov qword ptr [rip + 0x1bb57d4], rdi ; 0x101de2ec8
0x10022d6f4: lea rdi, [rip - 0x1e2b] ; 0x10022b8d0
0x10022d6fb: vmovq xmm0, rdi
0x10022d700: vmovdqu xmmword ptr [rip + 0x1bb57e8], xmm0 ; 0x101de2ef0
0x10022d708: mov rdi, qword ptr [rip + 0x9d8ae9] ; 0x100c061f8 -> 0x10022c960 __Z12ApplyWrapperI5ClumpMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10022d70f: mov qword ptr [rip + 0x1bb57ea], rdi ; 0x101de2f00
0x10022d716: mov rbx, qword ptr [rip + 0x9dc36b] ; 0x100c09a88 -> 0x10022c9c0 __Z21InitFunctionSignatureIM5ClumpFvvEEvP17FunctionSignature
0x10022d71d: mov qword ptr [rip + 0x1bb57e4], rbx ; 0x101de2f08
0x10022d724: mov qword ptr [rip + 0x1bb57e5], rcx ; 0x101de2f10
0x10022d72b: lea rax, [rip + 0x936e4d] ; 0x100b6457f HotDate
0x10022d732: mov qword ptr [rip + 0x1bb57df], rax ; 0x101de2f18
0x10022d739: lea rax, [rip + 0x1bb57d8] ; 0x101de2f18
0x10022d740: mov qword ptr [rip + 0x1bb57d5], 0 ; 0x101de2f20
0x10022d74b: mov qword ptr [rip + 0x1bb57d6], rsi ; 0x101de2f28
0x10022d752: lea rsi, [rip - 0x1d89] ; 0x10022b9d0
0x10022d759: vmovq xmm0, rsi
0x10022d75e: vmovdqu xmmword ptr [rip + 0x1bb57ea], xmm0 ; 0x101de2f50
0x10022d766: mov qword ptr [rip + 0x1bb57f3], rdi ; 0x101de2f60
0x10022d76d: mov qword ptr [rip + 0x1bb57f4], rbx ; 0x101de2f68
0x10022d774: mov qword ptr [rip + 0x1bb57f5], rcx ; 0x101de2f70
0x10022d77b: lea rsi, [rip + 0x94d4de] ; 0x100b7ac60 ClumpHash
0x10022d782: mov qword ptr [rip + 0x1bb57ef], rsi ; 0x101de2f78
0x10022d789: lea rdi, [rip + 0x1bb57e8] ; 0x101de2f78
0x10022d790: mov qword ptr [rip + 0x1bb57e5], 0 ; 0x101de2f80
0x10022d79b: mov qword ptr [rip + 0x1bb57e6], rax ; 0x101de2f88
0x10022d7a2: lea rax, [rip - 0x1cd9] ; 0x10022bad0
0x10022d7a9: vmovq xmm0, rax
0x10022d7ae: vmovdqu xmmword ptr [rip + 0x1bb57fa], xmm0 ; 0x101de2fb0
0x10022d7b6: mov rax, qword ptr [rip + 0x9d8a13] ; 0x100c061d0 -> 0x10022c9e0 __Z12ApplyWrapperI5ClumpMS0_FjjP19VariableHashContextEEvM9VoidClassFvvEPv8VariablePS9_j
0x10022d7bd: mov qword ptr [rip + 0x1bb57fc], rax ; 0x101de2fc0
0x10022d7c4: mov rax, qword ptr [rip + 0x9dc295] ; 0x100c09a60 -> 0x10022c9f0 __Z21InitFunctionSignatureIM5ClumpFjjP19VariableHashContextEEvP17FunctionSignature
0x10022d7cb: mov qword ptr [rip + 0x1bb57f6], rax ; 0x101de2fc8
0x10022d7d2: mov qword ptr [rip + 0x1bb57f7], rcx ; 0x101de2fd0
0x10022d7d9: lea rax, [rip + 0x932897] ; 0x100b60077 OnResumeEnabled
0x10022d7e0: mov qword ptr [rip + 0x1bb57f1], rax ; 0x101de2fd8
0x10022d7e7: lea rax, [rip + 0x1bb57ea] ; 0x101de2fd8
0x10022d7ee: mov qword ptr [rip + 0x1bb57e7], 0 ; 0x101de2fe0
0x10022d7f9: mov qword ptr [rip + 0x1bb57e8], rdi ; 0x101de2fe8
0x10022d800: mov qword ptr [rip + 0xa42759], rax ; 0x100c6ff60
0x10022d807: lea rax, [rip - 0x1c6e] ; 0x10022bba0
0x10022d80e: vmovq xmm0, rax
0x10022d813: vmovdqu xmmword ptr [rip + 0x1bb57f5], xmm0 ; 0x101de3010
0x10022d81b: mov rax, qword ptr [rip + 0x9d89b6] ; 0x100c061d8 -> 0x10022cba0 __Z12ApplyWrapperI5ClumpMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x10022d822: mov qword ptr [rip + 0x1bb57f7], rax ; 0x101de3020
0x10022d829: mov rax, qword ptr [rip + 0x9dc238] ; 0x100c09a68 -> 0x10022cc40 __Z21InitFunctionSignatureIM5ClumpFvP4GameEEvP17FunctionSignature
0x10022d830: mov qword ptr [rip + 0x1bb57f1], rax ; 0x101de3028
0x10022d837: mov qword ptr [rip + 0x1bb57f2], rcx ; 0x101de3030
0x10022d83e: vmovq xmm0, rsi
0x10022d843: lea rax, [rip + 0x94d420] ; 0x100b7ac6a VariableHash_Custom
0x10022d84a: vmovq xmm1, rax
0x10022d84f: vpunpcklqdq xmm0, xmm1, xmm0
0x10022d853: vmovdqa xmmword ptr [rip + 0x1bb57e5], xmm0 ; 0x101de3040
0x10022d85b: lea rax, [rip + 0x1bb57de] ; 0x101de3040
0x10022d862: mov qword ptr [rip + 0x1bb57e7], r8 ; 0x101de3050
0x10022d869: mov qword ptr [rip + 0x1bb5400], rax ; 0x101de2c70
0x10022d870: lea rax, [rip + 0x92f23b] ; 0x100b5cab2 data
0x10022d877: mov qword ptr [rip + 0xa69022], rax ; 0x100c968a0
0x10022d87e: lea rax, [rip + 0xa6901b] ; 0x100c968a0
0x10022d885: mov rsi, qword ptr [rip + 0xa4a3d4] ; 0x100c77c60
0x10022d88c: mov qword ptr [rip + 0xa6901d], rsi ; 0x100c968b0
0x10022d893: mov qword ptr [rip + 0xa4a3c6], rax ; 0x100c77c60
0x10022d89a: mov qword ptr [rip + 0xa6901b], 8 ; 0x100c968c0
0x10022d8a5: mov rax, qword ptr [rip + 0x9d9a84] ; 0x100c07330 -> 0x100148fe0 __Z17GetMetaTypeByTypeIP6ObjectERK8MetaTypev
0x10022d8ac: mov qword ptr [rip + 0xa69015], rax ; 0x100c968c8
0x10022d8b3: mov qword ptr [rip + 0xa69016], rcx ; 0x100c968d0
0x10022d8ba: mov qword ptr [rip + 0xa69013], 0x10 ; 0x100c968d8
0x10022d8c5: mov rax, qword ptr [rip + 0x9d9cac] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x10022d8cc: mov qword ptr [rip + 0xa6900d], rax ; 0x100c968e0
0x10022d8d3: mov qword ptr [rip + 0xa6900a], 0 ; 0x100c968e8
0x10022d8de: vmovq xmm0, rdx
0x10022d8e3: lea rax, [rip + 0x94d394] ; 0x100b7ac7e ArrayAllocator
0x10022d8ea: vmovq xmm1, rax
0x10022d8ef: vpunpcklqdq xmm0, xmm1, xmm0
0x10022d8f3: vmovdqa xmmword ptr [rip + 0x1bb5765], xmm0 ; 0x101de3060
0x10022d8fb: lea rax, [rip + 0x1bb575e] ; 0x101de3060
0x10022d902: mov qword ptr [rip + 0x1bb5763], 0 ; 0x101de3070
0x10022d90d: mov qword ptr [rip + 0xa68f94], rax ; 0x100c968a8
0x10022d914: lea rdi, [rip + 0xafda0d] ; 0x100d2b328
0x10022d91b: lea rsi, [rip + 0x1bb5756] ; 0x101de3078
0x10022d922: lea rdx, [rip + 0x94d364] ; 0x100b7ac8d tag_Clump
0x10022d929: call 0x1007951b0 ; 0x1007951b0
0x10022d92e: lea rax, [rip + 0x94d394] ; 0x100b7acc9 ClumpBarn
0x10022d935: mov qword ptr [rip + 0x1bb574c], rax ; 0x101de3088
0x10022d93c: lea rax, [rip + 0x1bb573d] ; 0x101de3080
0x10022d943: mov qword ptr [rip + 0x1bb5742], 0 ; 0x101de3090
0x10022d94e: mov rcx, qword ptr [rip + 0xa42603] ; 0x100c6ff58
0x10022d955: mov qword ptr [rip + 0x1bb573c], rcx ; 0x101de3098
0x10022d95c: mov qword ptr [rip + 0xa425f5], rax ; 0x100c6ff58
0x10022d963: mov qword ptr [rip + 0x1bb573e], rax ; 0x101de30a8
0x10022d96a: mov rax, qword ptr [rip + 0x9dad3f] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x10022d971: mov qword ptr [rip + 0x1bb5738], rax ; 0x101de30b0
0x10022d978: mov qword ptr [rip + 0x1bb5735], 0xffffffffffffffff ; 0x101de30b8
0x10022d983: mov qword ptr [rip + 0x1bb574a], 0 ; 0x101de30d8
0x10022d98e: mov rax, qword ptr [rip + 0x9deee3] ; 0x100c0c878
0x10022d995: add rax, 0x10
0x10022d999: mov qword ptr [rip + 0x1bb56e0], rax ; 0x101de3080
0x10022d9a0: xor eax, eax
0x10022d9a2: call 0x100011c10 ; 0x100011c10
0x10022d9a7: lea rax, [rip + 0x92ef5e] ; 0x100b5c90c Initialize
0x10022d9ae: mov qword ptr [rip + 0x1bb572b], rax ; 0x101de30e0
0x10022d9b5: lea rsi, [rip + 0x1bb5724] ; 0x101de30e0
0x10022d9bc: mov qword ptr [rip + 0x1bb5721], 0 ; 0x101de30e8
0x10022d9c7: mov rax, qword ptr [rip + 0xa42592] ; 0x100c6ff60
0x10022d9ce: mov qword ptr [rip + 0x1bb571b], rax ; 0x101de30f0
0x10022d9d5: lea rax, [rip - 0x1c1c] ; 0x10022bdc0
0x10022d9dc: vmovq xmm0, rax
0x10022d9e1: vmovdqu xmmword ptr [rip + 0x1bb572f], xmm0 ; 0x101de3118
0x10022d9e9: mov rcx, qword ptr [rip + 0x9d8e48] ; 0x100c06838 -> 0x10022d040 __Z12ApplyWrapperI9ClumpBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10022d9f0: mov qword ptr [rip + 0x1bb5731], rcx ; 0x101de3128
0x10022d9f7: mov rdx, qword ptr [rip + 0x9dc6ca] ; 0x100c0a0c8 -> 0x10022d0a0 __Z21InitFunctionSignatureIM9ClumpBarnFvvEEvP17FunctionSignature
0x10022d9fe: mov qword ptr [rip + 0x1bb572b], rdx ; 0x101de3130
0x10022da05: mov rax, qword ptr [rip + 0x9daf5c] ; 0x100c08968 -> 0x10022d030 __Z18GetMetaClassByTypeIP9ClumpBarnERK9MetaClassv
0x10022da0c: mov qword ptr [rip + 0x1bb5725], rax ; 0x101de3138
0x10022da13: lea rdi, [rip + 0x92ef1e] ; 0x100b5c938 Terminate
0x10022da1a: mov qword ptr [rip + 0x1bb571f], rdi ; 0x101de3140
0x10022da21: lea rdi, [rip + 0x1bb5718] ; 0x101de3140
0x10022da28: mov qword ptr [rip + 0x1bb5715], 0 ; 0x101de3148
0x10022da33: mov qword ptr [rip + 0x1bb5716], rsi ; 0x101de3150
0x10022da3a: lea rsi, [rip - 0x1b81] ; 0x10022bec0
0x10022da41: vmovq xmm0, rsi
0x10022da46: vmovdqu xmmword ptr [rip + 0x1bb572a], xmm0 ; 0x101de3178
0x10022da4e: mov qword ptr [rip + 0x1bb5733], rcx ; 0x101de3188
0x10022da55: mov qword ptr [rip + 0x1bb5734], rdx ; 0x101de3190
0x10022da5c: mov qword ptr [rip + 0x1bb5735], rax ; 0x101de3198
0x10022da63: lea rsi, [rip + 0x932fdb] ; 0x100b60a45 OnLevelLoad
0x10022da6a: mov qword ptr [rip + 0x1bb572f], rsi ; 0x101de31a0
0x10022da71: lea rsi, [rip + 0x1bb5728] ; 0x101de31a0
0x10022da78: mov qword ptr [rip + 0x1bb5725], 0 ; 0x101de31a8
0x10022da83: mov qword ptr [rip + 0x1bb5726], rdi ; 0x101de31b0
0x10022da8a: lea rdi, [rip - 0x1bc1] ; 0x10022bed0
0x10022da91: vmovq xmm0, rdi
0x10022da96: vmovdqu xmmword ptr [rip + 0x1bb573a], xmm0 ; 0x101de31d8
0x10022da9e: mov qword ptr [rip + 0x1bb5743], rcx ; 0x101de31e8
0x10022daa5: mov qword ptr [rip + 0x1bb5744], rdx ; 0x101de31f0
0x10022daac: mov qword ptr [rip + 0x1bb5745], rax ; 0x101de31f8
0x10022dab3: lea rdi, [rip + 0x932fa1] ; 0x100b60a5b OnLevelUnload
0x10022daba: mov qword ptr [rip + 0x1bb573f], rdi ; 0x101de3200
0x10022dac1: lea rdi, [rip + 0x1bb5738] ; 0x101de3200
0x10022dac8: mov qword ptr [rip + 0x1bb5735], 0 ; 0x101de3208
0x10022dad3: mov qword ptr [rip + 0x1bb5736], rsi ; 0x101de3210
0x10022dada: lea rsi, [rip - 0x1c01] ; 0x10022bee0
0x10022dae1: vmovq xmm0, rsi
0x10022dae6: vmovdqu xmmword ptr [rip + 0x1bb574a], xmm0 ; 0x101de3238
0x10022daee: mov qword ptr [rip + 0x1bb5753], rcx ; 0x101de3248
0x10022daf5: mov qword ptr [rip + 0x1bb5754], rdx ; 0x101de3250
0x10022dafc: mov qword ptr [rip + 0x1bb5755], rax ; 0x101de3258
0x10022db03: lea rcx, [rip + 0x94d1c9] ; 0x100b7acd3 CreateClump
0x10022db0a: mov qword ptr [rip + 0x1bb574f], rcx ; 0x101de3260
0x10022db11: lea rcx, [rip + 0x1bb5748] ; 0x101de3260
0x10022db18: mov qword ptr [rip + 0x1bb5751], rdi ; 0x101de3270
0x10022db1f: lea rdx, [rip - 0x1ba6] ; 0x10022bf80
0x10022db26: vmovq xmm0, rdx
0x10022db2b: vmovdqu xmmword ptr [rip + 0x1bb5765], xmm0 ; 0x101de3298
0x10022db33: mov rdx, qword ptr [rip + 0x9d8ce6] ; 0x100c06820 -> 0x10022d0c0 __Z12ApplyWrapperI9ClumpBarnMS0_FP5ClumpPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x10022db3a: mov qword ptr [rip + 0x1bb5767], rdx ; 0x101de32a8
0x10022db41: mov rdx, qword ptr [rip + 0x9dc568] ; 0x100c0a0b0 -> 0x10022d180 __Z21InitFunctionSignatureIM9ClumpBarnFP5ClumpPK9MetaClassEEvP17FunctionSignature
0x10022db48: mov qword ptr [rip + 0x1bb5761], rdx ; 0x101de32b0
0x10022db4f: mov qword ptr [rip + 0x1bb5762], rax ; 0x101de32b8
0x10022db56: lea rdx, [rip + 0x94956b] ; 0x100b770c8 ObjectFactory_CreatesType
0x10022db5d: vmovq xmm1, rdx
0x10022db62: vmovq xmm0, r14
0x10022db67: vpunpcklqdq xmm1, xmm1, xmm0
0x10022db6b: vmovdqa xmmword ptr [rip + 0x1bb574d], xmm1 ; 0x101de32c0
0x10022db73: lea rdx, [rip + 0x1bb5746] ; 0x101de32c0
0x10022db7a: mov qword ptr [rip + 0x1bb574b], 0 ; 0x101de32d0
0x10022db85: mov qword ptr [rip + 0x1bb56dc], rdx ; 0x101de3268
0x10022db8c: lea rdx, [rip + 0x94d14c] ; 0x100b7acdf CreateClumpWithSize
0x10022db93: mov qword ptr [rip + 0x1bb573e], rdx ; 0x101de32d8
0x10022db9a: lea rdx, [rip + 0x1bb5737] ; 0x101de32d8
0x10022dba1: mov qword ptr [rip + 0x1bb5734], 0 ; 0x101de32e0
0x10022dbac: mov qword ptr [rip + 0x1bb5735], rcx ; 0x101de32e8
0x10022dbb3: lea rcx, [rip - 0x1bba] ; 0x10022c000
0x10022dbba: vmovq xmm1, rcx
0x10022dbbf: vmovdqu xmmword ptr [rip + 0x1bb5749], xmm1 ; 0x101de3310
0x10022dbc7: mov rcx, qword ptr [rip + 0x9d8c5a] ; 0x100c06828 -> 0x10022d200 __Z12ApplyWrapperI9ClumpBarnMS0_FP5ClumpjEEvM9VoidClassFvvEPv8VariablePS9_j
0x10022dbce: mov qword ptr [rip + 0x1bb574b], rcx ; 0x101de3320
0x10022dbd5: mov rcx, qword ptr [rip + 0x9dc4dc] ; 0x100c0a0b8 -> 0x10022d2c0 __Z21InitFunctionSignatureIM9ClumpBarnFP5ClumpjEEvP17FunctionSignature
0x10022dbdc: mov qword ptr [rip + 0x1bb5745], rcx ; 0x101de3328
0x10022dbe3: mov qword ptr [rip + 0x1bb5746], rax ; 0x101de3330
0x10022dbea: lea rcx, [rip + 0x94d102] ; 0x100b7acf3 ReleaseClump
0x10022dbf1: mov qword ptr [rip + 0x1bb5740], rcx ; 0x101de3338
0x10022dbf8: lea rcx, [rip + 0x1bb5739] ; 0x101de3338
0x10022dbff: mov qword ptr [rip + 0x1bb5742], rdx ; 0x101de3348
0x10022dc06: mov qword ptr [rip + 0xa42353], rcx ; 0x100c6ff60
0x10022dc0d: lea rcx, [rip - 0x1b54] ; 0x10022c0c0
0x10022dc14: vmovq xmm1, rcx
0x10022dc19: vmovdqu xmmword ptr [rip + 0x1bb574f], xmm1 ; 0x101de3370
0x10022dc21: mov rcx, qword ptr [rip + 0x9d8c08] ; 0x100c06830 -> 0x10022d340 __Z12ApplyWrapperI9ClumpBarnMS0_FvP5ClumpEEvM9VoidClassFvvEPv8VariablePS9_j
0x10022dc28: mov qword ptr [rip + 0x1bb5751], rcx ; 0x101de3380
0x10022dc2f: mov rcx, qword ptr [rip + 0x9dc48a] ; 0x100c0a0c0 -> 0x10022d3d0 __Z21InitFunctionSignatureIM9ClumpBarnFvP5ClumpEEvP17FunctionSignature
0x10022dc36: mov qword ptr [rip + 0x1bb574b], rcx ; 0x101de3388
0x10022dc3d: mov qword ptr [rip + 0x1bb574c], rax ; 0x101de3390
0x10022dc44: lea rax, [rip + 0x9494a9] ; 0x100b770f4 ObjectFactory_ReleasesType
0x10022dc4b: vmovq xmm1, rax
0x10022dc50: vpunpcklqdq xmm0, xmm1, xmm0
0x10022dc54: vmovdqa xmmword ptr [rip + 0x1bb5744], xmm0 ; 0x101de33a0
0x10022dc5c: lea rax, [rip + 0x1bb573d] ; 0x101de33a0
0x10022dc63: mov qword ptr [rip + 0x1bb5742], 0 ; 0x101de33b0
0x10022dc6e: mov qword ptr [rip + 0x1bb56cb], rax ; 0x101de3340
0x10022dc75: pop rbx
0x10022dc76: pop r14
0x10022dc78: pop rbp
0x10022dc79: ret 
0x10022dc7a: nop 
0x10022dc7b: nop 
0x10022dc7c: nop 
0x10022dc7d: nop 
0x10022dc7e: nop 
0x10022dc7f: nop 
