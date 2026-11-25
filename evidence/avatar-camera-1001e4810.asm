0x1001e4810: push rbp
0x1001e4811: mov rbp, rsp
0x1001e4814: push r15
0x1001e4816: push r14
0x1001e4818: push r12
0x1001e481a: push rbx
0x1001e481b: lea r14, [rip + 0x994778] ; 0x100b78f9a CameraKeyFrame
0x1001e4822: mov qword ptr [rip + 0x1bf930f], r14 ; 0x101dddb38
0x1001e4829: lea rax, [rip + 0x1bf9300] ; 0x101dddb30
0x1001e4830: mov qword ptr [rip + 0x1bf9305], 0 ; 0x101dddb40
0x1001e483b: mov rcx, qword ptr [rip + 0xa8b716] ; 0x100c6ff58
0x1001e4842: mov qword ptr [rip + 0x1bf92ff], rcx ; 0x101dddb48
0x1001e4849: mov qword ptr [rip + 0xa8b708], rax ; 0x100c6ff58
0x1001e4850: mov qword ptr [rip + 0x1bf9301], rax ; 0x101dddb58
0x1001e4857: lea r12, [rip - 0x1aef9e] ; 0x1000358c0
0x1001e485e: mov qword ptr [rip + 0x1bf92fb], r12 ; 0x101dddb60
0x1001e4865: mov qword ptr [rip + 0x1bf92f8], 0xffffffffffffffff ; 0x101dddb68
0x1001e4870: mov qword ptr [rip + 0x1bf930d], 0 ; 0x101dddb88
0x1001e487b: mov rax, qword ptr [rip + 0xa26ad6] ; 0x100c0b358
0x1001e4882: add rax, 0x10
0x1001e4886: mov qword ptr [rip + 0x1bf92a3], rax ; 0x101dddb30
0x1001e488d: xor eax, eax
0x1001e488f: call 0x100011c10 ; 0x100011c10
0x1001e4894: lea rax, [rip + 0x97a144] ; 0x100b5e9df true
0x1001e489b: vmovq xmm0, rax
0x1001e48a0: lea rax, [rip + 0x97b795] ; 0x100b6003c Tool_Export
0x1001e48a7: vmovq xmm1, rax
0x1001e48ac: vpunpcklqdq xmm0, xmm1, xmm0
0x1001e48b0: vmovdqa xmmword ptr [rip + 0x1bf92d8], xmm0 ; 0x101dddb90
0x1001e48b8: lea rax, [rip + 0x1bf92d1] ; 0x101dddb90
0x1001e48bf: mov rcx, qword ptr [rip + 0x1bf927a] ; 0x101dddb40
0x1001e48c6: mov qword ptr [rip + 0x1bf92d3], rcx ; 0x101dddba0
0x1001e48cd: mov qword ptr [rip + 0x1bf926c], rax ; 0x101dddb40
0x1001e48d4: lea rax, [rip + 0x97fca4] ; 0x100b6457f HotDate
0x1001e48db: mov qword ptr [rip + 0x1bf92c6], rax ; 0x101dddba8
0x1001e48e2: lea rcx, [rip + 0x1bf92bf] ; 0x101dddba8
0x1001e48e9: mov qword ptr [rip + 0x1bf92bc], 0 ; 0x101dddbb0
0x1001e48f4: mov rax, qword ptr [rip + 0xa8b665] ; 0x100c6ff60
0x1001e48fb: mov qword ptr [rip + 0x1bf92b6], rax ; 0x101dddbb8
0x1001e4902: lea rax, [rip - 0x69b9] ; 0x1001ddf50
0x1001e4909: vmovq xmm0, rax
0x1001e490e: vmovdqu xmmword ptr [rip + 0x1bf92ca], xmm0 ; 0x101dddbe0
0x1001e4916: mov rax, qword ptr [rip + 0xa21173] ; 0x100c05a90 -> 0x1001e2fd0 __Z12ApplyWrapperI14CameraKeyFrameMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001e491d: mov qword ptr [rip + 0x1bf92cc], rax ; 0x101dddbf0
0x1001e4924: mov rax, qword ptr [rip + 0xa249f5] ; 0x100c09320 -> 0x1001e3030 __Z21InitFunctionSignatureIM14CameraKeyFrameFvvEEvP17FunctionSignature
0x1001e492b: mov qword ptr [rip + 0x1bf92c6], rax ; 0x101dddbf8
0x1001e4932: mov rax, qword ptr [rip + 0xa23357] ; 0x100c07c90 -> 0x1001e2ca0 __Z18GetMetaClassByTypeIP14CameraKeyFrameERK9MetaClassv
0x1001e4939: mov qword ptr [rip + 0x1bf92c0], rax ; 0x101dddc00
0x1001e4940: lea rdx, [rip + 0x9926fa] ; 0x100b77041 SetTransform
0x1001e4947: mov qword ptr [rip + 0x1bf92ba], rdx ; 0x101dddc08
0x1001e494e: lea rdx, [rip + 0x1bf92b3] ; 0x101dddc08
0x1001e4955: mov qword ptr [rip + 0x1bf92b0], 0 ; 0x101dddc10
0x1001e4960: mov qword ptr [rip + 0x1bf92b1], rcx ; 0x101dddc18
0x1001e4967: lea rcx, [rip - 0x6a0e] ; 0x1001ddf60
0x1001e496e: vmovq xmm0, rcx
0x1001e4973: vmovdqu xmmword ptr [rip + 0x1bf92c5], xmm0 ; 0x101dddc40
0x1001e497b: mov rcx, qword ptr [rip + 0xa21106] ; 0x100c05a88 -> 0x1001e3050 __Z12ApplyWrapperI14CameraKeyFrameMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x1001e4982: mov qword ptr [rip + 0x1bf92c7], rcx ; 0x101dddc50
0x1001e4989: mov rcx, qword ptr [rip + 0xa24988] ; 0x100c09318 -> 0x1001e30f0 __Z21InitFunctionSignatureIM14CameraKeyFrameFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x1001e4990: mov qword ptr [rip + 0x1bf92c1], rcx ; 0x101dddc58
0x1001e4997: mov qword ptr [rip + 0x1bf92c2], rax ; 0x101dddc60
0x1001e499e: lea rcx, [rip + 0x98e8ba] ; 0x100b7325f GetTransform
0x1001e49a5: mov qword ptr [rip + 0x1bf92bc], rcx ; 0x101dddc68
0x1001e49ac: lea rcx, [rip + 0x1bf92b5] ; 0x101dddc68
0x1001e49b3: mov qword ptr [rip + 0x1bf92b2], 0 ; 0x101dddc70
0x1001e49be: mov qword ptr [rip + 0x1bf92b3], rdx ; 0x101dddc78
0x1001e49c5: mov qword ptr [rip + 0xa8b594], rcx ; 0x100c6ff60
0x1001e49cc: lea rcx, [rip - 0x6a43] ; 0x1001ddf90
0x1001e49d3: vmovq xmm0, rcx
0x1001e49d8: vmovdqu xmmword ptr [rip + 0x1bf92c0], xmm0 ; 0x101dddca0
0x1001e49e0: mov rcx, qword ptr [rip + 0xa210b1] ; 0x100c05a98 -> 0x1001e3170 __Z12ApplyWrapperI14CameraKeyFrameMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x1001e49e7: mov qword ptr [rip + 0x1bf92c2], rcx ; 0x101dddcb0
0x1001e49ee: mov rcx, qword ptr [rip + 0xa24933] ; 0x100c09328 -> 0x1001e3200 __Z21InitFunctionSignatureIM14CameraKeyFrameKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x1001e49f5: mov qword ptr [rip + 0x1bf92bc], rcx ; 0x101dddcb8
0x1001e49fc: mov qword ptr [rip + 0x1bf92bd], rax ; 0x101dddcc0
0x1001e4a03: lea rcx, [rip + 0x9866b5] ; 0x100b6b0bf transform
0x1001e4a0a: mov qword ptr [rip + 0xaaaaef], rcx ; 0x100c8f500
0x1001e4a11: lea rcx, [rip + 0xaaaae8] ; 0x100c8f500
0x1001e4a18: mov qword ptr [rip + 0xaaaae5], 0 ; 0x100c8f508
0x1001e4a23: mov rdx, qword ptr [rip + 0xa93236] ; 0x100c77c60
0x1001e4a2a: mov qword ptr [rip + 0xaaaadf], rdx ; 0x100c8f510
0x1001e4a31: mov qword ptr [rip + 0xaaaae4], 0x10 ; 0x100c8f520
0x1001e4a3c: mov rdx, qword ptr [rip + 0xa22385] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x1001e4a43: mov qword ptr [rip + 0xaaaade], rdx ; 0x100c8f528
0x1001e4a4a: mov qword ptr [rip + 0xaaaadf], rax ; 0x100c8f530
0x1001e4a51: mov qword ptr [rip + 0xaaaadc], 0xffffffffffffffff ; 0x100c8f538
0x1001e4a5c: lea rbx, [rip - 0x1cb043] ; 0x100019a20
0x1001e4a63: mov qword ptr [rip + 0xaaaad6], rbx ; 0x100c8f540
0x1001e4a6a: mov qword ptr [rip + 0xaaaad3], 0 ; 0x100c8f548
0x1001e4a75: lea rdx, [rip + 0x99421a] ; 0x100b78c96 lensPreset
0x1001e4a7c: mov qword ptr [rip + 0xaaaacd], rdx ; 0x100c8f550
0x1001e4a83: lea rdx, [rip + 0xaaaac6] ; 0x100c8f550
0x1001e4a8a: mov qword ptr [rip + 0xaaaacf], rcx ; 0x100c8f560
0x1001e4a91: mov qword ptr [rip + 0xaaaad4], 0x50 ; 0x100c8f570
0x1001e4a9c: mov rcx, qword ptr [rip + 0xa2217d] ; 0x100c06c20 -> 0x1001db1b0 __Z17GetMetaTypeByTypeI14CameraLensTypeERK8MetaTypev
0x1001e4aa3: mov qword ptr [rip + 0xaaaace], rcx ; 0x100c8f578
0x1001e4aaa: mov qword ptr [rip + 0xaaaacf], rax ; 0x100c8f580
0x1001e4ab1: mov qword ptr [rip + 0xaaaacc], 0xffffffffffffffff ; 0x100c8f588
0x1001e4abc: mov qword ptr [rip + 0xaaaacd], rbx ; 0x100c8f590
0x1001e4ac3: mov qword ptr [rip + 0xaaaaca], 0 ; 0x100c8f598
0x1001e4ace: lea rcx, [rip + 0x9940fc] ; 0x100b78bd1 kCameraLens_None
0x1001e4ad5: vmovq xmm1, rcx
0x1001e4ada: lea rcx, [rip + 0x979f21] ; 0x100b5ea02 Tool_DefaultValue
0x1001e4ae1: vmovq xmm0, rcx
0x1001e4ae6: vpunpcklqdq xmm1, xmm0, xmm1
0x1001e4aea: vmovdqa xmmword ptr [rip + 0x1bf91de], xmm1 ; 0x101dddcd0
0x1001e4af2: lea rcx, [rip + 0x1bf91d7] ; 0x101dddcd0
0x1001e4af9: mov qword ptr [rip + 0x1bf91dc], 0 ; 0x101dddce0
0x1001e4b04: mov qword ptr [rip + 0xaaaa4d], rcx ; 0x100c8f558
0x1001e4b0b: lea rcx, [rip + 0x99419a] ; 0x100b78cac fov
0x1001e4b12: mov qword ptr [rip + 0xaaaa87], rcx ; 0x100c8f5a0
0x1001e4b19: lea rcx, [rip + 0xaaaa80] ; 0x100c8f5a0
0x1001e4b20: mov qword ptr [rip + 0xaaaa89], rdx ; 0x100c8f5b0
0x1001e4b27: mov qword ptr [rip + 0xaaaa8e], 0x54 ; 0x100c8f5c0
0x1001e4b32: mov r15, qword ptr [rip + 0xa22a27] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1001e4b39: mov qword ptr [rip + 0xaaaa88], r15 ; 0x100c8f5c8
0x1001e4b40: mov qword ptr [rip + 0xaaaa89], rax ; 0x100c8f5d0
0x1001e4b47: mov qword ptr [rip + 0xaaaa86], 0xffffffffffffffff ; 0x100c8f5d8
0x1001e4b52: mov qword ptr [rip + 0xaaaa87], rbx ; 0x100c8f5e0
0x1001e4b59: mov qword ptr [rip + 0xaaaa84], 0 ; 0x100c8f5e8
0x1001e4b64: lea rdx, [rip + 0x994145] ; 0x100b78cb0 60.0
0x1001e4b6b: vmovq xmm1, rdx
0x1001e4b70: vpunpcklqdq xmm1, xmm0, xmm1
0x1001e4b74: vmovdqa xmmword ptr [rip + 0x1bf9174], xmm1 ; 0x101dddcf0
0x1001e4b7c: lea rdx, [rip + 0x1bf916d] ; 0x101dddcf0
0x1001e4b83: mov qword ptr [rip + 0x1bf9172], 0 ; 0x101dddd00
0x1001e4b8e: mov qword ptr [rip + 0xaaaa13], rdx ; 0x100c8f5a8
0x1001e4b95: lea rdx, [rip + 0x99440d] ; 0x100b78fa9 panDirection
0x1001e4b9c: mov qword ptr [rip + 0xaaaa4d], rdx ; 0x100c8f5f0
0x1001e4ba3: lea rdx, [rip + 0xaaaa46] ; 0x100c8f5f0
0x1001e4baa: mov qword ptr [rip + 0xaaaa43], 0 ; 0x100c8f5f8
0x1001e4bb5: mov qword ptr [rip + 0xaaaa44], rcx ; 0x100c8f600
0x1001e4bbc: mov qword ptr [rip + 0xaaaa49], 0x60 ; 0x100c8f610
0x1001e4bc7: mov rcx, qword ptr [rip + 0xa22202] ; 0x100c06dd0 -> 0x100066ac0 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Vector3EERK8MetaTypev
0x1001e4bce: mov qword ptr [rip + 0xaaaa43], rcx ; 0x100c8f618
0x1001e4bd5: mov qword ptr [rip + 0xaaaa44], rax ; 0x100c8f620
0x1001e4bdc: mov qword ptr [rip + 0xaaaa41], 0xffffffffffffffff ; 0x100c8f628
0x1001e4be7: mov qword ptr [rip + 0xaaaa42], rbx ; 0x100c8f630
0x1001e4bee: mov qword ptr [rip + 0xaaaa3f], 0 ; 0x100c8f638
0x1001e4bf9: lea rcx, [rip + 0x9943b6] ; 0x100b78fb6 panSpeed
0x1001e4c00: mov qword ptr [rip + 0xaaaa39], rcx ; 0x100c8f640
0x1001e4c07: lea rcx, [rip + 0xaaaa32] ; 0x100c8f640
0x1001e4c0e: mov qword ptr [rip + 0xaaaa2f], 0 ; 0x100c8f648
0x1001e4c19: mov qword ptr [rip + 0xaaaa30], rdx ; 0x100c8f650
0x1001e4c20: mov qword ptr [rip + 0xaaaa35], 0x70 ; 0x100c8f660
0x1001e4c2b: mov qword ptr [rip + 0xaaaa36], r15 ; 0x100c8f668
0x1001e4c32: mov qword ptr [rip + 0xaaaa37], rax ; 0x100c8f670
0x1001e4c39: mov qword ptr [rip + 0xaaaa34], 0xffffffffffffffff ; 0x100c8f678
0x1001e4c44: mov qword ptr [rip + 0xaaaa35], rbx ; 0x100c8f680
0x1001e4c4b: mov qword ptr [rip + 0xaaaa32], 0 ; 0x100c8f688
0x1001e4c56: lea rdx, [rip + 0x994362] ; 0x100b78fbf rollSpeed
0x1001e4c5d: mov qword ptr [rip + 0xaaaa2c], rdx ; 0x100c8f690
0x1001e4c64: lea rdx, [rip + 0xaaaa25] ; 0x100c8f690
0x1001e4c6b: mov qword ptr [rip + 0xaaaa22], 0 ; 0x100c8f698
0x1001e4c76: mov qword ptr [rip + 0xaaaa23], rcx ; 0x100c8f6a0
0x1001e4c7d: mov qword ptr [rip + 0xaaaa28], 0x74 ; 0x100c8f6b0
0x1001e4c88: mov qword ptr [rip + 0xaaaa29], r15 ; 0x100c8f6b8
0x1001e4c8f: mov qword ptr [rip + 0xaaaa2a], rax ; 0x100c8f6c0
0x1001e4c96: mov qword ptr [rip + 0xaaaa27], 0xffffffffffffffff ; 0x100c8f6c8
0x1001e4ca1: mov qword ptr [rip + 0xaaaa28], rbx ; 0x100c8f6d0
0x1001e4ca8: mov qword ptr [rip + 0xaaaa25], 0 ; 0x100c8f6d8
0x1001e4cb3: lea rcx, [rip + 0x99430f] ; 0x100b78fc9 idleShakeForce
0x1001e4cba: mov qword ptr [rip + 0xaaaa1f], rcx ; 0x100c8f6e0
0x1001e4cc1: lea rcx, [rip + 0xaaaa18] ; 0x100c8f6e0
0x1001e4cc8: mov qword ptr [rip + 0xaaaa21], rdx ; 0x100c8f6f0
0x1001e4ccf: mov qword ptr [rip + 0xaaaa26], 0x78 ; 0x100c8f700
0x1001e4cda: mov qword ptr [rip + 0xaaaa27], r15 ; 0x100c8f708
0x1001e4ce1: mov qword ptr [rip + 0xaaaa28], rax ; 0x100c8f710
0x1001e4ce8: mov qword ptr [rip + 0xaaaa25], 0xffffffffffffffff ; 0x100c8f718
0x1001e4cf3: mov qword ptr [rip + 0xaaaa26], rbx ; 0x100c8f720
0x1001e4cfa: mov qword ptr [rip + 0xaaaa23], 0 ; 0x100c8f728
0x1001e4d05: lea rdx, [rip + 0x98f408] ; 0x100b74114 0.0
0x1001e4d0c: vmovq xmm1, rdx
0x1001e4d11: vpunpcklqdq xmm0, xmm0, xmm1
0x1001e4d15: vmovdqa xmmword ptr [rip + 0x1bf8ff3], xmm0 ; 0x101dddd10
0x1001e4d1d: lea rdx, [rip + 0x1bf8fec] ; 0x101dddd10
0x1001e4d24: mov qword ptr [rip + 0x1bf8ff1], 0 ; 0x101dddd20
0x1001e4d2f: lea rsi, [rip + 0x9942a2] ; 0x100b78fd8 Shake
0x1001e4d36: vmovq xmm1, rsi
0x1001e4d3b: lea rsi, [rip + 0x97f84d] ; 0x100b6458f Tool_Category
0x1001e4d42: vmovq xmm2, rsi
0x1001e4d47: vpunpcklqdq xmm1, xmm2, xmm1
0x1001e4d4b: vmovdqa xmmword ptr [rip + 0x1bf8fdd], xmm1 ; 0x101dddd30
0x1001e4d53: lea rsi, [rip + 0x1bf8fd6] ; 0x101dddd30
0x1001e4d5a: mov qword ptr [rip + 0x1bf8fdf], rdx ; 0x101dddd40
0x1001e4d61: mov qword ptr [rip + 0xaaa980], rsi ; 0x100c8f6e8
0x1001e4d68: lea rdx, [rip + 0x99426f] ; 0x100b78fde movingShakeForce
0x1001e4d6f: mov qword ptr [rip + 0xaaa9ba], rdx ; 0x100c8f730
0x1001e4d76: lea rdx, [rip + 0xaaa9b3] ; 0x100c8f730
0x1001e4d7d: mov qword ptr [rip + 0xaaa9bc], rcx ; 0x100c8f740
0x1001e4d84: mov qword ptr [rip + 0xaaa9c1], 0x7c ; 0x100c8f750
0x1001e4d8f: mov qword ptr [rip + 0xaaa9c2], r15 ; 0x100c8f758
0x1001e4d96: mov qword ptr [rip + 0xaaa9c3], rax ; 0x100c8f760
0x1001e4d9d: mov qword ptr [rip + 0xaaa9c0], 0xffffffffffffffff ; 0x100c8f768
0x1001e4da8: mov qword ptr [rip + 0xaaa9c1], rbx ; 0x100c8f770
0x1001e4daf: mov qword ptr [rip + 0xaaa9be], 0 ; 0x100c8f778
0x1001e4dba: vmovdqa xmmword ptr [rip + 0x1bf8f8e], xmm0 ; 0x101dddd50
0x1001e4dc2: lea rcx, [rip + 0x1bf8f87] ; 0x101dddd50
0x1001e4dc9: mov qword ptr [rip + 0x1bf8f8c], 0 ; 0x101dddd60
0x1001e4dd4: vmovdqa xmmword ptr [rip + 0x1bf8f94], xmm1 ; 0x101dddd70
0x1001e4ddc: lea rsi, [rip + 0x1bf8f8d] ; 0x101dddd70
0x1001e4de3: mov qword ptr [rip + 0x1bf8f96], rcx ; 0x101dddd80
0x1001e4dea: mov qword ptr [rip + 0xaaa947], rsi ; 0x100c8f738
0x1001e4df1: lea rcx, [rip + 0x9941f7] ; 0x100b78fef shakeSpeedMult
0x1001e4df8: mov qword ptr [rip + 0xaaa981], rcx ; 0x100c8f780
0x1001e4dff: lea rcx, [rip + 0xaaa97a] ; 0x100c8f780
0x1001e4e06: mov qword ptr [rip + 0xaaa983], rdx ; 0x100c8f790
0x1001e4e0d: mov qword ptr [rip + 0xa92e4c], rcx ; 0x100c77c60
0x1001e4e14: mov qword ptr [rip + 0xaaa981], 0x80 ; 0x100c8f7a0
0x1001e4e1f: mov qword ptr [rip + 0xaaa982], r15 ; 0x100c8f7a8
0x1001e4e26: mov qword ptr [rip + 0xaaa983], rax ; 0x100c8f7b0
0x1001e4e2d: mov qword ptr [rip + 0xaaa980], 0xffffffffffffffff ; 0x100c8f7b8
0x1001e4e38: mov qword ptr [rip + 0xaaa981], rbx ; 0x100c8f7c0
0x1001e4e3f: mov qword ptr [rip + 0xaaa97e], 0 ; 0x100c8f7c8
0x1001e4e4a: vmovdqa xmmword ptr [rip + 0x1bf8f3e], xmm0 ; 0x101dddd90
0x1001e4e52: lea rax, [rip + 0x1bf8f37] ; 0x101dddd90
0x1001e4e59: mov qword ptr [rip + 0x1bf8f3c], 0 ; 0x101dddda0
0x1001e4e64: vmovdqa xmmword ptr [rip + 0x1bf8f44], xmm1 ; 0x101ddddb0
0x1001e4e6c: lea rcx, [rip + 0x1bf8f3d] ; 0x101ddddb0
0x1001e4e73: mov qword ptr [rip + 0x1bf8f46], rax ; 0x101ddddc0
0x1001e4e7a: mov qword ptr [rip + 0xaaa907], rcx ; 0x100c8f788
0x1001e4e81: lea rax, [rip + 0x994176] ; 0x100b78ffe CameraState
0x1001e4e88: mov qword ptr [rip + 0x1bf8f41], rax ; 0x101ddddd0
0x1001e4e8f: lea rax, [rip + 0x1bf8f32] ; 0x101ddddc8
0x1001e4e96: mov qword ptr [rip + 0x1bf8f37], 0 ; 0x101ddddd8
0x1001e4ea1: mov rcx, qword ptr [rip + 0xa8b0b0] ; 0x100c6ff58
0x1001e4ea8: mov qword ptr [rip + 0x1bf8f31], rcx ; 0x101dddde0
0x1001e4eaf: mov qword ptr [rip + 0xa8b0a2], rax ; 0x100c6ff58
0x1001e4eb6: mov qword ptr [rip + 0x1bf8f33], rax ; 0x101ddddf0
0x1001e4ebd: mov qword ptr [rip + 0x1bf8f34], r12 ; 0x101ddddf8
0x1001e4ec4: mov dword ptr [rip + 0x1bf8f32], 0xffffffff ; 0x101ddde00
0x1001e4ece: mov dword ptr [rip + 0x1bf8f2c], 0xffffffff ; 0x101ddde04
0x1001e4ed8: mov qword ptr [rip + 0x1bf8f3d], 0 ; 0x101ddde20
0x1001e4ee3: mov rax, qword ptr [rip + 0xa25d36] ; 0x100c0ac20
0x1001e4eea: add rax, 0x10
0x1001e4eee: mov qword ptr [rip + 0x1bf8ed3], rax ; 0x101ddddc8
0x1001e4ef5: xor eax, eax
0x1001e4ef7: call 0x100011c10 ; 0x100011c10
0x1001e4efc: lea rax, [rip + 0x994107] ; 0x100b7900a CameraNode
0x1001e4f03: mov qword ptr [rip + 0x1bf8f26], rax ; 0x101ddde30
0x1001e4f0a: lea rax, [rip + 0x1bf8f17] ; 0x101ddde28
0x1001e4f11: mov qword ptr [rip + 0x1bf8f1c], 0 ; 0x101ddde38
0x1001e4f1c: mov rcx, qword ptr [rip + 0xa8b035] ; 0x100c6ff58
0x1001e4f23: mov qword ptr [rip + 0x1bf8f16], rcx ; 0x101ddde40
0x1001e4f2a: mov qword ptr [rip + 0xa8b027], rax ; 0x100c6ff58
0x1001e4f31: mov qword ptr [rip + 0x1bf8f18], rax ; 0x101ddde50
0x1001e4f38: mov qword ptr [rip + 0x1bf8f19], r12 ; 0x101ddde58
0x1001e4f3f: mov qword ptr [rip + 0x1bf8f16], 0xffffffffffffffff ; 0x101ddde60
0x1001e4f4a: mov qword ptr [rip + 0x1bf8f2b], 0 ; 0x101ddde80
0x1001e4f55: mov rax, qword ptr [rip + 0xa259c4] ; 0x100c0a920
0x1001e4f5c: add rax, 0x10
0x1001e4f60: mov qword ptr [rip + 0x1bf8ec1], rax ; 0x101ddde28
0x1001e4f67: xor eax, eax
0x1001e4f69: call 0x100011c10 ; 0x100011c10
0x1001e4f6e: lea rax, [rip + 0x9940a0] ; 0x100b79015 CameraSystem
0x1001e4f75: mov qword ptr [rip + 0x1bf8f14], rax ; 0x101ddde90
0x1001e4f7c: lea rax, [rip + 0x1bf8f05] ; 0x101ddde88
0x1001e4f83: mov qword ptr [rip + 0x1bf8f0a], 0 ; 0x101ddde98
0x1001e4f8e: mov rcx, qword ptr [rip + 0xa8afc3] ; 0x100c6ff58
0x1001e4f95: mov qword ptr [rip + 0x1bf8f04], rcx ; 0x101dddea0
0x1001e4f9c: mov qword ptr [rip + 0xa8afb5], rax ; 0x100c6ff58
0x1001e4fa3: mov qword ptr [rip + 0x1bf8f06], rax ; 0x101dddeb0
0x1001e4faa: mov rax, qword ptr [rip + 0xa236ff] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1001e4fb1: mov qword ptr [rip + 0x1bf8f00], rax ; 0x101dddeb8
0x1001e4fb8: mov qword ptr [rip + 0x1bf8efd], 0xffffffffffffffff ; 0x101dddec0
0x1001e4fc3: mov qword ptr [rip + 0x1bf8f12], 0 ; 0x101dddee0
0x1001e4fce: mov rax, qword ptr [rip + 0xa25ed3] ; 0x100c0aea8
0x1001e4fd5: add rax, 0x10
0x1001e4fd9: mov qword ptr [rip + 0x1bf8ea8], rax ; 0x101ddde88
0x1001e4fe0: xor eax, eax
0x1001e4fe2: call 0x100011c10 ; 0x100011c10
0x1001e4fe7: lea rax, [rip + 0x97791e] ; 0x100b5c90c Initialize
0x1001e4fee: mov qword ptr [rip + 0x1bf8ef3], rax ; 0x101dddee8
0x1001e4ff5: lea rcx, [rip + 0x1bf8eec] ; 0x101dddee8
0x1001e4ffc: mov qword ptr [rip + 0x1bf8ee9], 0 ; 0x101dddef0
0x1001e5007: mov rax, qword ptr [rip + 0xa8af52] ; 0x100c6ff60
0x1001e500e: mov qword ptr [rip + 0x1bf8ee3], rax ; 0x101dddef8
0x1001e5015: lea rax, [rip - 0x6ffc] ; 0x1001de020
0x1001e501c: vmovq xmm0, rax
0x1001e5021: vmovdqu xmmword ptr [rip + 0x1bf8ef7], xmm0 ; 0x101dddf20
0x1001e5029: mov rax, qword ptr [rip + 0xa206b8] ; 0x100c056e8 -> 0x1001e3c40 __Z12ApplyWrapperI12CameraSystemMS0_FvP6CameraP10ShaderDataP4GameEEvM9VoidClassFvvEPv8VariablePSD_j
0x1001e5030: mov qword ptr [rip + 0x1bf8ef9], rax ; 0x101dddf30
0x1001e5037: mov rax, qword ptr [rip + 0xa23f3a] ; 0x100c08f78 -> 0x1001e3c50 __Z21InitFunctionSignatureIM12CameraSystemFvP6CameraP10ShaderDataP4GameEEvP17FunctionSignature
0x1001e503e: mov qword ptr [rip + 0x1bf8ef3], rax ; 0x101dddf38
0x1001e5045: mov rax, qword ptr [rip + 0xa22924] ; 0x100c07970 -> 0x1001e3c30 __Z18GetMetaClassByTypeIP12CameraSystemERK9MetaClassv
0x1001e504c: mov qword ptr [rip + 0x1bf8eed], rax ; 0x101dddf40
0x1001e5053: lea rdx, [rip + 0x9778de] ; 0x100b5c938 Terminate
0x1001e505a: mov qword ptr [rip + 0x1bf8ee7], rdx ; 0x101dddf48
0x1001e5061: lea rsi, [rip + 0x1bf8ee0] ; 0x101dddf48
0x1001e5068: mov qword ptr [rip + 0x1bf8edd], 0 ; 0x101dddf50
0x1001e5073: mov qword ptr [rip + 0x1bf8ede], rcx ; 0x101dddf58
0x1001e507a: lea rcx, [rip - 0x69f1] ; 0x1001de690
0x1001e5081: vmovq xmm0, rcx
0x1001e5086: vmovdqu xmmword ptr [rip + 0x1bf8ef2], xmm0 ; 0x101dddf80
0x1001e508e: mov rcx, qword ptr [rip + 0xa2065b] ; 0x100c056f0 -> 0x1001e3df0 __Z12ApplyWrapperI12CameraSystemMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001e5095: mov qword ptr [rip + 0x1bf8ef4], rcx ; 0x101dddf90
0x1001e509c: mov rdx, qword ptr [rip + 0xa23edd] ; 0x100c08f80 -> 0x1001e3e50 __Z21InitFunctionSignatureIM12CameraSystemFvvEEvP17FunctionSignature
0x1001e50a3: mov qword ptr [rip + 0x1bf8eee], rdx ; 0x101dddf98
0x1001e50aa: mov qword ptr [rip + 0x1bf8eef], rax ; 0x101dddfa0
0x1001e50b1: lea rdi, [rip + 0x97b98d] ; 0x100b60a45 OnLevelLoad
0x1001e50b8: mov qword ptr [rip + 0x1bf8ee9], rdi ; 0x101dddfa8
0x1001e50bf: lea rdi, [rip + 0x1bf8ee2] ; 0x101dddfa8
0x1001e50c6: mov qword ptr [rip + 0x1bf8edf], 0 ; 0x101dddfb0
0x1001e50d1: mov qword ptr [rip + 0x1bf8ee0], rsi ; 0x101dddfb8
0x1001e50d8: lea rsi, [rip - 0x69ff] ; 0x1001de6e0
0x1001e50df: vmovq xmm0, rsi
0x1001e50e4: vmovdqu xmmword ptr [rip + 0x1bf8ef4], xmm0 ; 0x101dddfe0
0x1001e50ec: mov qword ptr [rip + 0x1bf8efd], rcx ; 0x101dddff0
0x1001e50f3: mov qword ptr [rip + 0x1bf8efe], rdx ; 0x101dddff8
0x1001e50fa: mov qword ptr [rip + 0x1bf8eff], rax ; 0x101dde000
0x1001e5101: lea rsi, [rip + 0x97b953] ; 0x100b60a5b OnLevelUnload
0x1001e5108: mov qword ptr [rip + 0x1bf8ef9], rsi ; 0x101dde008
0x1001e510f: lea rsi, [rip + 0x1bf8ef2] ; 0x101dde008
0x1001e5116: mov qword ptr [rip + 0x1bf8eef], 0 ; 0x101dde010
0x1001e5121: mov qword ptr [rip + 0x1bf8ef0], rdi ; 0x101dde018
0x1001e5128: lea rdi, [rip - 0x64cf] ; 0x1001dec60
0x1001e512f: vmovq xmm0, rdi
0x1001e5134: vmovdqu xmmword ptr [rip + 0x1bf8f04], xmm0 ; 0x101dde040
0x1001e513c: mov qword ptr [rip + 0x1bf8f0d], rcx ; 0x101dde050
0x1001e5143: mov qword ptr [rip + 0x1bf8f0e], rdx ; 0x101dde058
0x1001e514a: mov qword ptr [rip + 0x1bf8f0f], rax ; 0x101dde060
0x1001e5151: lea rdi, [rip + 0x977807] ; 0x100b5c95f HotLoad
0x1001e5158: mov qword ptr [rip + 0x1bf8f09], rdi ; 0x101dde068
0x1001e515f: lea rdi, [rip + 0x1bf8f02] ; 0x101dde068
0x1001e5166: mov qword ptr [rip + 0x1bf8eff], 0 ; 0x101dde070
0x1001e5171: mov qword ptr [rip + 0x1bf8f00], rsi ; 0x101dde078
0x1001e5178: lea rsi, [rip - 0x64ff] ; 0x1001dec80
0x1001e517f: vmovq xmm0, rsi
0x1001e5184: vmovdqu xmmword ptr [rip + 0x1bf8f14], xmm0 ; 0x101dde0a0
0x1001e518c: mov qword ptr [rip + 0x1bf8f1d], rcx ; 0x101dde0b0
0x1001e5193: mov qword ptr [rip + 0x1bf8f1e], rdx ; 0x101dde0b8
0x1001e519a: mov qword ptr [rip + 0x1bf8f1f], rax ; 0x101dde0c0
0x1001e51a1: lea rsi, [rip + 0x9777a5] ; 0x100b5c94d Update
0x1001e51a8: mov qword ptr [rip + 0x1bf8f19], rsi ; 0x101dde0c8
0x1001e51af: lea rsi, [rip + 0x1bf8f12] ; 0x101dde0c8
0x1001e51b6: mov qword ptr [rip + 0x1bf8f0f], 0 ; 0x101dde0d0
0x1001e51c1: mov qword ptr [rip + 0x1bf8f10], rdi ; 0x101dde0d8
0x1001e51c8: lea rdi, [rip - 0x62bf] ; 0x1001def10
0x1001e51cf: vmovq xmm0, rdi
0x1001e51d4: vmovdqu xmmword ptr [rip + 0x1bf8f24], xmm0 ; 0x101dde100
0x1001e51dc: mov rdi, qword ptr [rip + 0xa204fd] ; 0x100c056e0 -> 0x1001e3e70 __Z12ApplyWrapperI12CameraSystemMS0_FvP4GameP8GameModeP10CompositorEEvM9VoidClassFvvEPv8VariablePSD_j
0x1001e51e3: mov qword ptr [rip + 0x1bf8f26], rdi ; 0x101dde110
0x1001e51ea: mov rdi, qword ptr [rip + 0xa23d7f] ; 0x100c08f70 -> 0x1001e3e80 __Z21InitFunctionSignatureIM12CameraSystemFvP4GameP8GameModeP10CompositorEEvP17FunctionSignature
0x1001e51f1: mov qword ptr [rip + 0x1bf8f20], rdi ; 0x101dde118
0x1001e51f8: mov qword ptr [rip + 0x1bf8f21], rax ; 0x101dde120
0x1001e51ff: lea rdi, [rip + 0x993e1c] ; 0x100b79022 UpdateBackground
0x1001e5206: mov qword ptr [rip + 0x1bf8f1b], rdi ; 0x101dde128
0x1001e520d: lea rdi, [rip + 0x1bf8f14] ; 0x101dde128
0x1001e5214: mov qword ptr [rip + 0x1bf8f11], 0 ; 0x101dde130
0x1001e521f: mov qword ptr [rip + 0x1bf8f12], rsi ; 0x101dde138
0x1001e5226: lea rsi, [rip - 0x4d5d] ; 0x1001e04d0
0x1001e522d: vmovq xmm0, rsi
0x1001e5232: vmovdqu xmmword ptr [rip + 0x1bf8f26], xmm0 ; 0x101dde160
0x1001e523a: mov qword ptr [rip + 0x1bf8f2f], rcx ; 0x101dde170
0x1001e5241: mov qword ptr [rip + 0x1bf8f30], rdx ; 0x101dde178
0x1001e5248: mov qword ptr [rip + 0x1bf8f31], rax ; 0x101dde180
0x1001e524f: lea rsi, [rip + 0x993ddd] ; 0x100b79033 Resize
0x1001e5256: mov qword ptr [rip + 0x1bf8f2b], rsi ; 0x101dde188
0x1001e525d: lea rsi, [rip + 0x1bf8f24] ; 0x101dde188
0x1001e5264: mov qword ptr [rip + 0x1bf8f21], 0 ; 0x101dde190
0x1001e526f: mov qword ptr [rip + 0x1bf8f22], rdi ; 0x101dde198
0x1001e5276: lea rdi, [rip - 0x4d8d] ; 0x1001e04f0
0x1001e527d: vmovq xmm0, rdi
0x1001e5282: vmovdqu xmmword ptr [rip + 0x1bf8f36], xmm0 ; 0x101dde1c0
0x1001e528a: mov qword ptr [rip + 0x1bf8f3f], rcx ; 0x101dde1d0
0x1001e5291: mov qword ptr [rip + 0x1bf8f40], rdx ; 0x101dde1d8
0x1001e5298: mov qword ptr [rip + 0x1bf8f41], rax ; 0x101dde1e0
0x1001e529f: lea rcx, [rip + 0x993d94] ; 0x100b7903a CreateKeyFrame
0x1001e52a6: mov qword ptr [rip + 0x1bf8f3b], rcx ; 0x101dde1e8
0x1001e52ad: lea rcx, [rip + 0x1bf8f34] ; 0x101dde1e8
0x1001e52b4: mov qword ptr [rip + 0x1bf8f3d], rsi ; 0x101dde1f8
0x1001e52bb: mov qword ptr [rip + 0xa8ac9e], rcx ; 0x100c6ff60
0x1001e52c2: lea rcx, [rip - 0x4dc9] ; 0x1001e0500
0x1001e52c9: vmovq xmm0, rcx
0x1001e52ce: vmovdqu xmmword ptr [rip + 0x1bf8f4a], xmm0 ; 0x101dde220
0x1001e52d6: mov rcx, qword ptr [rip + 0xa203fb] ; 0x100c056d8 -> 0x1001e4020 __Z12ApplyWrapperI12CameraSystemMS0_FP14CameraKeyFramePK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x1001e52dd: mov qword ptr [rip + 0x1bf8f4c], rcx ; 0x101dde230
0x1001e52e4: mov rcx, qword ptr [rip + 0xa23c7d] ; 0x100c08f68 -> 0x1001e40e0 __Z21InitFunctionSignatureIM12CameraSystemFP14CameraKeyFramePK9MetaClassEEvP17FunctionSignature
0x1001e52eb: mov qword ptr [rip + 0x1bf8f46], rcx ; 0x101dde238
0x1001e52f2: mov qword ptr [rip + 0x1bf8f47], rax ; 0x101dde240
0x1001e52f9: vmovq xmm0, r14
0x1001e52fe: lea rax, [rip + 0x991dc3] ; 0x100b770c8 ObjectFactory_CreatesType
0x1001e5305: vmovq xmm1, rax
0x1001e530a: vpunpcklqdq xmm0, xmm1, xmm0
0x1001e530e: vmovdqa xmmword ptr [rip + 0x1bf8f3a], xmm0 ; 0x101dde250
0x1001e5316: lea rax, [rip + 0x1bf8f33] ; 0x101dde250
0x1001e531d: mov qword ptr [rip + 0x1bf8f38], 0 ; 0x101dde260
0x1001e5328: mov qword ptr [rip + 0x1bf8ec1], rax ; 0x101dde1f0
0x1001e532f: lea rax, [rip + 0x993d13] ; 0x100b79049 kCameraSystem
0x1001e5336: mov qword ptr [rip + 0x1bf8f33], rax ; 0x101dde270
0x1001e533d: lea rdx, [rip + 0x1bf8f2c] ; 0x101dde270
0x1001e5344: mov rax, qword ptr [rip + 0xaaa955] ; 0x100c8fca0
0x1001e534b: mov qword ptr [rip + 0x1bf8f2e], rax ; 0x101dde280
0x1001e5352: lea rax, [rip + 0x1bf8f0f] ; 0x101dde268
0x1001e5359: vmovq xmm1, rax
0x1001e535e: lea rcx, [rip + 0x993cf2] ; 0x100b79057 CameraSystem.cpp
0x1001e5365: vmovq xmm0, rcx
0x1001e536a: vpunpcklqdq xmm1, xmm0, xmm1
0x1001e536e: vmovdqu xmmword ptr [rip + 0x1bf8f1a], xmm1 ; 0x101dde290
0x1001e5376: mov rax, qword ptr [rip + 0xa221db] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1001e537d: mov qword ptr [rip + 0x1bf8f1c], rax ; 0x101dde2a0
0x1001e5384: mov qword ptr [rip + 0x1bf8f19], 0 ; 0x101dde2a8
0x1001e538f: mov qword ptr [rip + 0x1bf8f1a], rbx ; 0x101dde2b0
0x1001e5396: mov qword ptr [rip + 0x1bf8f17], 0 ; 0x101dde2b8
0x1001e53a1: lea rsi, [rip + 0x97ca8a] ; 0x100b61e32 Debug
0x1001e53a8: vmovq xmm1, rsi
0x1001e53ad: lea rsi, [rip + 0x978c69] ; 0x100b5e01d TweakCategory
0x1001e53b4: vmovq xmm2, rsi
0x1001e53b9: vpunpcklqdq xmm1, xmm2, xmm1
0x1001e53bd: vmovdqa xmmword ptr [rip + 0x1bf8efb], xmm1 ; 0x101dde2c0
0x1001e53c5: lea rsi, [rip + 0x1bf8ef4] ; 0x101dde2c0
0x1001e53cc: mov qword ptr [rip + 0x1bf8ef9], 0 ; 0x101dde2d0
0x1001e53d7: mov qword ptr [rip + 0x1bf8e9a], rsi ; 0x101dde278
0x1001e53de: lea rsi, [rip + 0x993c83] ; 0x100b79068 kDrawCameras
0x1001e53e5: mov qword ptr [rip + 0x1bf8eec], rsi ; 0x101dde2d8
0x1001e53ec: lea rsi, [rip + 0x1bf8ee5] ; 0x101dde2d8
0x1001e53f3: mov qword ptr [rip + 0x1bf8eee], rdx ; 0x101dde2e8
0x1001e53fa: lea rdx, [rip + 0xaaa3cf] ; 0x100c8f7d0
0x1001e5401: vmovq xmm1, rdx
0x1001e5406: vpunpcklqdq xmm1, xmm0, xmm1
0x1001e540a: vmovdqu xmmword ptr [rip + 0x1bf8ee6], xmm1 ; 0x101dde2f8
0x1001e5412: mov qword ptr [rip + 0x1bf8eef], rax ; 0x101dde308
0x1001e5419: mov qword ptr [rip + 0x1bf8eec], 0 ; 0x101dde310
0x1001e5424: mov qword ptr [rip + 0x1bf8eed], rbx ; 0x101dde318
0x1001e542b: mov qword ptr [rip + 0x1bf8eea], 0 ; 0x101dde320
0x1001e5436: lea rdx, [rip + 0x9936c4] ; 0x100b78b01 Camera
0x1001e543d: vmovq xmm1, rdx
0x1001e5442: vpunpcklqdq xmm1, xmm2, xmm1
0x1001e5446: vmovdqa xmmword ptr [rip + 0x1bf8ee2], xmm1 ; 0x101dde330
0x1001e544e: lea rdx, [rip + 0x1bf8edb] ; 0x101dde330
0x1001e5455: mov qword ptr [rip + 0x1bf8ee0], 0 ; 0x101dde340
0x1001e5460: mov qword ptr [rip + 0x1bf8e79], rdx ; 0x101dde2e0
0x1001e5467: lea rdx, [rip + 0x993c07] ; 0x100b79075 kCameraSize
0x1001e546e: mov qword ptr [rip + 0x1bf8ed3], rdx ; 0x101dde348
0x1001e5475: lea rdx, [rip + 0x1bf8ecc] ; 0x101dde348
0x1001e547c: mov qword ptr [rip + 0x1bf8ed5], rsi ; 0x101dde358
0x1001e5483: mov qword ptr [rip + 0x1bf8ede], rcx ; 0x101dde368
0x1001e548a: lea rsi, [rip + 0xaaa343] ; 0x100c8f7d4
0x1001e5491: mov qword ptr [rip + 0x1bf8ed8], rsi ; 0x101dde370
0x1001e5498: mov qword ptr [rip + 0x1bf8ed9], r15 ; 0x101dde378
0x1001e549f: mov qword ptr [rip + 0x1bf8ed6], 0 ; 0x101dde380
0x1001e54aa: mov qword ptr [rip + 0x1bf8ed7], rbx ; 0x101dde388
0x1001e54b1: mov qword ptr [rip + 0x1bf8ed4], 0 ; 0x101dde390
0x1001e54bc: vmovdqa xmmword ptr [rip + 0x1bf8edc], xmm1 ; 0x101dde3a0
0x1001e54c4: lea rsi, [rip + 0x1bf8ed5] ; 0x101dde3a0
0x1001e54cb: mov qword ptr [rip + 0x1bf8eda], 0 ; 0x101dde3b0
0x1001e54d6: mov qword ptr [rip + 0x1bf8e73], rsi ; 0x101dde350
0x1001e54dd: lea rsi, [rip + 0x993b9d] ; 0x100b79081 kCameraSizeFov
0x1001e54e4: mov qword ptr [rip + 0x1bf8ecd], rsi ; 0x101dde3b8
0x1001e54eb: lea rsi, [rip + 0x1bf8ec6] ; 0x101dde3b8
0x1001e54f2: mov qword ptr [rip + 0x1bf8ecf], rdx ; 0x101dde3c8
0x1001e54f9: mov qword ptr [rip + 0x1bf8ed8], rcx ; 0x101dde3d8
0x1001e5500: lea rcx, [rip + 0xaaa2d1] ; 0x100c8f7d8
0x1001e5507: mov qword ptr [rip + 0x1bf8ed2], rcx ; 0x101dde3e0
0x1001e550e: mov qword ptr [rip + 0x1bf8ed3], r15 ; 0x101dde3e8
0x1001e5515: mov qword ptr [rip + 0x1bf8ed0], 0 ; 0x101dde3f0
0x1001e5520: mov qword ptr [rip + 0x1bf8ed1], rbx ; 0x101dde3f8
0x1001e5527: mov qword ptr [rip + 0x1bf8ece], 0 ; 0x101dde400
0x1001e5532: vmovdqa xmmword ptr [rip + 0x1bf8ed6], xmm1 ; 0x101dde410
0x1001e553a: lea rcx, [rip + 0x1bf8ecf] ; 0x101dde410
0x1001e5541: mov qword ptr [rip + 0x1bf8ed4], 0 ; 0x101dde420
0x1001e554c: mov qword ptr [rip + 0x1bf8e6d], rcx ; 0x101dde3c0
0x1001e5553: lea rcx, [rip + 0x993b36] ; 0x100b79090 kDrawSafeFrames
0x1001e555a: mov qword ptr [rip + 0x1bf8ecf], rcx ; 0x101dde430
0x1001e5561: lea rcx, [rip + 0x1bf8ec8] ; 0x101dde430
0x1001e5568: mov qword ptr [rip + 0x1bf8ed1], rsi ; 0x101dde440
0x1001e556f: lea rdx, [rip + 0x1bf8eb2] ; 0x101dde428
0x1001e5576: vmovq xmm2, rdx
0x1001e557b: vpunpcklqdq xmm2, xmm0, xmm2
0x1001e557f: vmovdqu xmmword ptr [rip + 0x1bf8ec9], xmm2 ; 0x101dde450
0x1001e5587: mov qword ptr [rip + 0x1bf8ed2], rax ; 0x101dde460
0x1001e558e: mov qword ptr [rip + 0x1bf8ecf], 0 ; 0x101dde468
0x1001e5599: mov qword ptr [rip + 0x1bf8ed0], rbx ; 0x101dde470
0x1001e55a0: mov qword ptr [rip + 0x1bf8ecd], 0 ; 0x101dde478
0x1001e55ab: vmovdqa xmmword ptr [rip + 0x1bf8ecd], xmm1 ; 0x101dde480
0x1001e55b3: lea rdx, [rip + 0x1bf8ec6] ; 0x101dde480
0x1001e55ba: mov qword ptr [rip + 0x1bf8ecb], 0 ; 0x101dde490
0x1001e55c5: mov qword ptr [rip + 0x1bf8e6c], rdx ; 0x101dde438
0x1001e55cc: lea rdx, [rip + 0x993acd] ; 0x100b790a0 kDrawDivByThreeGrids
0x1001e55d3: mov qword ptr [rip + 0x1bf8ec6], rdx ; 0x101dde4a0
0x1001e55da: lea rdx, [rip + 0x1bf8ebf] ; 0x101dde4a0
0x1001e55e1: mov qword ptr [rip + 0x1bf8ec8], rcx ; 0x101dde4b0
0x1001e55e8: lea rcx, [rip + 0x1bf8ea9] ; 0x101dde498
0x1001e55ef: vmovq xmm2, rcx
0x1001e55f4: vpunpcklqdq xmm2, xmm0, xmm2
0x1001e55f8: vmovdqu xmmword ptr [rip + 0x1bf8ec0], xmm2 ; 0x101dde4c0
0x1001e5600: mov qword ptr [rip + 0x1bf8ec9], rax ; 0x101dde4d0
0x1001e5607: mov qword ptr [rip + 0x1bf8ec6], 0 ; 0x101dde4d8
0x1001e5612: mov qword ptr [rip + 0x1bf8ec7], rbx ; 0x101dde4e0
0x1001e5619: mov qword ptr [rip + 0x1bf8ec4], 0 ; 0x101dde4e8
0x1001e5624: vmovdqa xmmword ptr [rip + 0x1bf8ec4], xmm1 ; 0x101dde4f0
0x1001e562c: lea rcx, [rip + 0x1bf8ebd] ; 0x101dde4f0
0x1001e5633: mov qword ptr [rip + 0x1bf8ec2], 0 ; 0x101dde500
0x1001e563e: mov qword ptr [rip + 0x1bf8e63], rcx ; 0x101dde4a8
0x1001e5645: lea rcx, [rip + 0x993a69] ; 0x100b790b5 kFilmLetterBox
0x1001e564c: mov qword ptr [rip + 0x1bf8eb5], rcx ; 0x101dde508
0x1001e5653: lea rcx, [rip + 0x1bf8eae] ; 0x101dde508
0x1001e565a: mov qword ptr [rip + 0x1bf8eb7], rdx ; 0x101dde518
0x1001e5661: mov qword ptr [rip + 0xaaa638], rcx ; 0x100c8fca0
0x1001e5668: lea rcx, [rip + 0xaaa16d] ; 0x100c8f7dc
0x1001e566f: vmovq xmm2, rcx
0x1001e5674: vpunpcklqdq xmm0, xmm0, xmm2
0x1001e5678: vmovdqu xmmword ptr [rip + 0x1bf8ea8], xmm0 ; 0x101dde528
0x1001e5680: mov qword ptr [rip + 0x1bf8eb1], rax ; 0x101dde538
0x1001e5687: mov qword ptr [rip + 0x1bf8eae], 0 ; 0x101dde540
0x1001e5692: mov qword ptr [rip + 0x1bf8eaf], rbx ; 0x101dde548
0x1001e5699: mov qword ptr [rip + 0x1bf8eac], 0 ; 0x101dde550
0x1001e56a4: vmovdqa xmmword ptr [rip + 0x1bf8eb4], xmm1 ; 0x101dde560
0x1001e56ac: lea rax, [rip + 0x1bf8ead] ; 0x101dde560
0x1001e56b3: mov qword ptr [rip + 0x1bf8eb2], 0 ; 0x101dde570
0x1001e56be: mov qword ptr [rip + 0x1bf8e4b], rax ; 0x101dde510
0x1001e56c5: lea rdi, [rip + 0xb3e924] ; 0x100d23ff0
0x1001e56cc: lea rsi, [rip + 0x1bf8ea5] ; 0x101dde578
0x1001e56d3: lea rdx, [rip + 0x9939ea] ; 0x100b790c4 tag_CameraSystem
0x1001e56da: call 0x1007951b0 ; 0x1007951b0
0x1001e56df: lea rax, [rip + 0x9939ef] ; 0x100b790d5 PassThruCamera
0x1001e56e6: mov qword ptr [rip + 0x1bf8e9b], rax ; 0x101dde588
0x1001e56ed: lea rax, [rip + 0x1bf8e8c] ; 0x101dde580
0x1001e56f4: mov qword ptr [rip + 0x1bf8e91], 0 ; 0x101dde590
0x1001e56ff: mov rcx, qword ptr [rip + 0xa8a852] ; 0x100c6ff58
0x1001e5706: mov qword ptr [rip + 0x1bf8e8b], rcx ; 0x101dde598
0x1001e570d: mov qword ptr [rip + 0xa8a844], rax ; 0x100c6ff58
0x1001e5714: mov qword ptr [rip + 0x1bf8e8d], rax ; 0x101dde5a8
0x1001e571b: mov rax, qword ptr [rip + 0xa21e9e] ; 0x100c075c0 -> 0x1001e4160 __Z18GetMetaClassByTypeIP10CameraNodeERK9MetaClassv
0x1001e5722: mov qword ptr [rip + 0x1bf8e87], rax ; 0x101dde5b0
0x1001e5729: mov qword ptr [rip + 0x1bf8e84], 0xffffffffffffffff ; 0x101dde5b8
0x1001e5734: mov qword ptr [rip + 0x1bf8e99], 0 ; 0x101dde5d8
0x1001e573f: mov rax, qword ptr [rip + 0xa25d4a] ; 0x100c0b490
0x1001e5746: add rax, 0x10
0x1001e574a: mov qword ptr [rip + 0x1bf8e2f], rax ; 0x101dde580
0x1001e5751: xor eax, eax
0x1001e5753: pop rbx
0x1001e5754: pop r12
0x1001e5756: pop r14
0x1001e5758: pop r15
0x1001e575a: pop rbp
0x1001e575b: jmp 0x100011c10 ; 0x100011c10
