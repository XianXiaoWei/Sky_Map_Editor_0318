0x1001aaa50: push rbp
0x1001aaa51: mov rbp, rsp
0x1001aaa54: push r15
0x1001aaa56: push r14
0x1001aaa58: push r13
0x1001aaa5a: push r12
0x1001aaa5c: push rbx
0x1001aaa5d: sub rsp, 0x88
0x1001aaa64: mov dword ptr [rip + 0xb7952a], 0 ; 0x100d23f98
0x1001aaa6e: lea rax, [rip + 0x9cce5a] ; 0x100b778cf ShoutType
0x1001aaa75: mov qword ptr [rip + 0x1c2f07c], rax ; 0x101dd9af8
0x1001aaa7c: lea r15, [rip + 0x1c2f06d] ; 0x101dd9af0
0x1001aaa83: mov rcx, qword ptr [rip + 0xac54ce] ; 0x100c6ff58
0x1001aaa8a: mov qword ptr [rip + 0x1c2f077], rcx ; 0x101dd9b08
0x1001aaa91: mov qword ptr [rip + 0xac54c0], r15 ; 0x100c6ff58
0x1001aaa98: mov qword ptr [rip + 0x1c2f079], r15 ; 0x101dd9b18
0x1001aaa9f: mov rcx, qword ptr [rip + 0xa622b2] ; 0x100c0cd58
0x1001aaaa6: add rcx, 0x10
0x1001aaaaa: mov qword ptr [rip + 0x1c2f03f], rcx ; 0x101dd9af0
0x1001aaab1: vmovq xmm0, rax
0x1001aaab6: lea rax, [rip + 0x9b2b81] ; 0x100b5d63e Enum_Type
0x1001aaabd: vmovq xmm1, rax
0x1001aaac2: vpunpcklqdq xmm0, xmm1, xmm0
0x1001aaac6: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x1001aaacb: vmovdqa xmmword ptr [rip + 0x1c2f04d], xmm0 ; 0x101dd9b20
0x1001aaad3: lea rax, [rip + 0x1c2f046] ; 0x101dd9b20
0x1001aaada: mov qword ptr [rip + 0x1c2f04b], 0 ; 0x101dd9b30
0x1001aaae5: mov qword ptr [rip + 0x1c2f014], rax ; 0x101dd9b00
0x1001aaaec: lea r12, [rip + 0x9ccde6] ; 0x100b778d9 ShoutType_shoutBird
0x1001aaaf3: mov qword ptr [rip + 0x1c2f03e], r12 ; 0x101dd9b38
0x1001aaafa: lea r13, [rip + 0x1c2f037] ; 0x101dd9b38
0x1001aab01: mov qword ptr [rip + 0x1c2f034], 0 ; 0x101dd9b40
0x1001aab0c: mov rax, qword ptr [rip + 0xb685cd] ; 0x100d130e0
0x1001aab13: mov qword ptr [rip + 0x1c2f02e], rax ; 0x101dd9b48
0x1001aab1a: mov qword ptr [rip + 0xb685bf], r13 ; 0x100d130e0
0x1001aab21: mov edi, 4
0x1001aab26: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001aab2b: mov dword ptr [rax], 0
0x1001aab31: mov qword ptr [rip + 0x1c2f020], rax ; 0x101dd9b58
0x1001aab38: mov r14, qword ptr [rip + 0xa5c279] ; 0x100c06db8 -> 0x1001a70a0 __Z17GetMetaTypeByTypeI9ShoutTypeERK8MetaTypev
0x1001aab3f: mov qword ptr [rip + 0x1c2f01a], r14 ; 0x101dd9b60
0x1001aab46: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001aab4b: vmovaps xmmword ptr [rip + 0x1c2f01d], xmm0 ; 0x101dd9b70
0x1001aab53: lea rax, [rip + 0x1c2f016] ; 0x101dd9b70
0x1001aab5a: mov qword ptr [rip + 0x1c2f01b], 0 ; 0x101dd9b80
0x1001aab65: mov qword ptr [rip + 0x1c2efd4], rax ; 0x101dd9b40
0x1001aab6c: lea rax, [rip + 0x9ccd7a] ; 0x100b778ed ShoutType_shoutManta
0x1001aab73: mov qword ptr [rip + 0x1c2f00e], rax ; 0x101dd9b88
0x1001aab7a: lea rbx, [rip + 0x1c2f007] ; 0x101dd9b88
0x1001aab81: mov qword ptr [rip + 0x1c2f004], 0 ; 0x101dd9b90
0x1001aab8c: mov qword ptr [rip + 0x1c2f005], r13 ; 0x101dd9b98
0x1001aab93: mov qword ptr [rip + 0xb68546], rbx ; 0x100d130e0
0x1001aab9a: mov edi, 4
0x1001aab9f: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001aaba4: mov dword ptr [rax], 1
0x1001aabaa: mov qword ptr [rip + 0x1c2eff7], rax ; 0x101dd9ba8
0x1001aabb1: mov qword ptr [rip + 0x1c2eff8], r14 ; 0x101dd9bb0
0x1001aabb8: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001aabbd: vmovaps xmmword ptr [rip + 0x1c2effb], xmm0 ; 0x101dd9bc0
0x1001aabc5: lea rax, [rip + 0x1c2eff4] ; 0x101dd9bc0
0x1001aabcc: mov qword ptr [rip + 0x1c2eff9], 0 ; 0x101dd9bd0
0x1001aabd7: mov qword ptr [rip + 0x1c2efb2], rax ; 0x101dd9b90
0x1001aabde: lea rax, [rip + 0x9ccd1d] ; 0x100b77902 ShoutType_shoutMantaBig
0x1001aabe5: mov qword ptr [rip + 0x1c2efec], rax ; 0x101dd9bd8
0x1001aabec: lea r13, [rip + 0x1c2efe5] ; 0x101dd9bd8
0x1001aabf3: mov qword ptr [rip + 0x1c2efe2], 0 ; 0x101dd9be0
0x1001aabfe: mov qword ptr [rip + 0x1c2efe3], rbx ; 0x101dd9be8
0x1001aac05: mov qword ptr [rip + 0xb684d4], r13 ; 0x100d130e0
0x1001aac0c: mov edi, 4
0x1001aac11: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001aac16: mov dword ptr [rax], 2
0x1001aac1c: mov qword ptr [rip + 0x1c2efd5], rax ; 0x101dd9bf8
0x1001aac23: mov qword ptr [rip + 0x1c2efd6], r14 ; 0x101dd9c00
0x1001aac2a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001aac2f: vmovaps xmmword ptr [rip + 0x1c2efd9], xmm0 ; 0x101dd9c10
0x1001aac37: lea rax, [rip + 0x1c2efd2] ; 0x101dd9c10
0x1001aac3e: mov qword ptr [rip + 0x1c2efd7], 0 ; 0x101dd9c20
0x1001aac49: mov qword ptr [rip + 0x1c2ef90], rax ; 0x101dd9be0
0x1001aac50: lea rax, [rip + 0x9cccc3] ; 0x100b7791a ShoutType_shoutMantaSmall
0x1001aac57: mov qword ptr [rip + 0x1c2efca], rax ; 0x101dd9c28
0x1001aac5e: lea rax, [rip + 0x1c2efc3] ; 0x101dd9c28
0x1001aac65: mov qword ptr [rip + 0x1c2efc0], 0 ; 0x101dd9c30
0x1001aac70: mov qword ptr [rip + 0x1c2efc1], r13 ; 0x101dd9c38
0x1001aac77: mov qword ptr [rip + 0xb68462], rax ; 0x100d130e0
0x1001aac7e: mov edi, 4
0x1001aac83: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001aac88: mov dword ptr [rax], 3
0x1001aac8e: mov qword ptr [rip + 0x1c2efb3], rax ; 0x101dd9c48
0x1001aac95: mov qword ptr [rip + 0x1c2efb4], r14 ; 0x101dd9c50
0x1001aac9c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001aaca1: vmovaps xmmword ptr [rip + 0x1c2efb7], xmm0 ; 0x101dd9c60
0x1001aaca9: lea rax, [rip + 0x1c2efb0] ; 0x101dd9c60
0x1001aacb0: mov qword ptr [rip + 0x1c2efb5], 0 ; 0x101dd9c70
0x1001aacbb: mov qword ptr [rip + 0x1c2ef6e], rax ; 0x101dd9c30
0x1001aacc2: lea rax, [rip + 0x9ccc6b] ; 0x100b77934 BirdV2Params
0x1001aacc9: mov qword ptr [rip + 0x1c2efb0], rax ; 0x101dd9c80
0x1001aacd0: lea rax, [rip + 0x1c2efa1] ; 0x101dd9c78
0x1001aacd7: mov qword ptr [rip + 0x1c2efa6], 0 ; 0x101dd9c88
0x1001aace2: mov qword ptr [rip + 0x1c2efa7], r15 ; 0x101dd9c90
0x1001aace9: mov qword ptr [rip + 0xac5268], rax ; 0x100c6ff58
0x1001aacf0: mov qword ptr [rip + 0x1c2efa9], rax ; 0x101dd9ca0
0x1001aacf7: mov rax, qword ptr [rip + 0xa5d50a] ; 0x100c08208 -> 0x1001a67e0 __Z18GetMetaClassByTypeIP18LevelAllocatedDataERK9MetaClassv
0x1001aacfe: mov qword ptr [rip + 0x1c2efa3], rax ; 0x101dd9ca8
0x1001aad05: mov qword ptr [rip + 0x1c2efa0], 0xffffffffffffffff ; 0x101dd9cb0
0x1001aad10: mov qword ptr [rip + 0x1c2efb5], 0 ; 0x101dd9cd0
0x1001aad1b: mov rax, qword ptr [rip + 0xa6016e] ; 0x100c0ae90
0x1001aad22: add rax, 0x10
0x1001aad26: mov qword ptr [rip + 0x1c2ef4b], rax ; 0x101dd9c78
0x1001aad2d: xor eax, eax
0x1001aad2f: call 0x100011c10 ; 0x100011c10
0x1001aad34: lea rax, [rip + 0x9ccc06] ; 0x100b77941 startPos
0x1001aad3b: mov qword ptr [rip + 0xaddece], rax ; 0x100c88c10
0x1001aad42: lea rcx, [rip + 0xaddec7] ; 0x100c88c10
0x1001aad49: mov rax, qword ptr [rip + 0xaccf10] ; 0x100c77c60
0x1001aad50: mov qword ptr [rip + 0xaddec9], rax ; 0x100c88c20
0x1001aad57: mov qword ptr [rip + 0xaddece], 8 ; 0x100c88c30
0x1001aad62: mov rax, qword ptr [rip + 0xa5c5bf] ; 0x100c07328 -> 0x10003a510 __Z17GetMetaTypeByTypeIP6MarkerERK8MetaTypev
0x1001aad69: mov qword ptr [rip + 0xaddec8], rax ; 0x100c88c38
0x1001aad70: mov rax, qword ptr [rip + 0xa5cbf1] ; 0x100c07968 -> 0x1001a7310 __Z18GetMetaClassByTypeIP12BirdV2ParamsERK9MetaClassv
0x1001aad77: mov qword ptr [rip + 0xaddec2], rax ; 0x100c88c40
0x1001aad7e: mov qword ptr [rip + 0xaddebf], 0xffffffffffffffff ; 0x100c88c48
0x1001aad89: lea r13, [rip - 0x191370] ; 0x100019a20
0x1001aad90: mov qword ptr [rip + 0xaddeb9], r13 ; 0x100c88c50
0x1001aad97: mov qword ptr [rip + 0xaddeb6], 0 ; 0x100c88c58
0x1001aada2: lea rdx, [rip + 0x9b3c70] ; 0x100b5ea19 Tool_Nullable
0x1001aada9: vmovq xmm1, rdx
0x1001aadae: lea rdx, [rip + 0x9b3c2a] ; 0x100b5e9df true
0x1001aadb5: vmovq xmm0, rdx
0x1001aadba: vpunpcklqdq xmm1, xmm1, xmm0
0x1001aadbe: vmovdqa xmmword ptr [rip + 0x1c2ef1a], xmm1 ; 0x101dd9ce0
0x1001aadc6: vmovdqa xmm5, xmm1
0x1001aadca: lea rdx, [rip + 0x1c2ef0f] ; 0x101dd9ce0
0x1001aadd1: mov qword ptr [rip + 0x1c2ef14], 0 ; 0x101dd9cf0
0x1001aaddc: lea rsi, [rip + 0x9b3cb4] ; 0x100b5ea97 null
0x1001aade3: vmovq xmm1, rsi
0x1001aade8: lea rsi, [rip + 0x9b3c13] ; 0x100b5ea02 Tool_DefaultValue
0x1001aadef: vmovq xmm2, rsi
0x1001aadf4: vpunpcklqdq xmm1, xmm2, xmm1
0x1001aadf8: vmovdqa xmmword ptr [rip + 0x1c2ef00], xmm1 ; 0x101dd9d00
0x1001aae00: vmovdqa xmm4, xmm1
0x1001aae04: lea rsi, [rip + 0x1c2eef5] ; 0x101dd9d00
0x1001aae0b: mov qword ptr [rip + 0x1c2eefe], rdx ; 0x101dd9d10
0x1001aae12: mov qword ptr [rip + 0xadddff], rsi ; 0x100c88c18
0x1001aae19: lea rdx, [rip + 0x9ccb2a] ; 0x100b7794a meshType
0x1001aae20: mov qword ptr [rip + 0xadde39], rdx ; 0x100c88c60
0x1001aae27: lea rdx, [rip + 0xadde32] ; 0x100c88c60
0x1001aae2e: mov qword ptr [rip + 0xadde3b], rcx ; 0x100c88c70
0x1001aae35: mov qword ptr [rip + 0xadde40], 0x10 ; 0x100c88c80
0x1001aae40: mov rcx, qword ptr [rip + 0xa5c671] ; 0x100c074b8 -> 0x1000522e0 __Z17GetMetaTypeByTypeIP9LevelMeshERK8MetaTypev
0x1001aae47: mov qword ptr [rip + 0xadde3a], rcx ; 0x100c88c88
0x1001aae4e: mov qword ptr [rip + 0xadde3b], rax ; 0x100c88c90
0x1001aae55: mov qword ptr [rip + 0xadde38], 0xffffffffffffffff ; 0x100c88c98
0x1001aae60: mov qword ptr [rip + 0xadde39], r13 ; 0x100c88ca0
0x1001aae67: mov qword ptr [rip + 0xadde36], 0 ; 0x100c88ca8
0x1001aae72: vmovdqa xmmword ptr [rip + 0x1c2eea6], xmm5 ; 0x101dd9d20
0x1001aae7a: lea rcx, [rip + 0x1c2ee9f] ; 0x101dd9d20
0x1001aae81: mov qword ptr [rip + 0x1c2eea4], 0 ; 0x101dd9d30
0x1001aae8c: vmovdqa xmmword ptr [rip + 0x1c2eeac], xmm4 ; 0x101dd9d40
0x1001aae94: lea rsi, [rip + 0x1c2eea5] ; 0x101dd9d40
0x1001aae9b: mov qword ptr [rip + 0x1c2eeae], rcx ; 0x101dd9d50
0x1001aaea2: mov qword ptr [rip + 0xadddbf], rsi ; 0x100c88c68
0x1001aaea9: lea rcx, [rip + 0x9c7c8d] ; 0x100b72b3d radius
0x1001aaeb0: mov qword ptr [rip + 0xadddf9], rcx ; 0x100c88cb0
0x1001aaeb7: lea rcx, [rip + 0xadddf2] ; 0x100c88cb0
0x1001aaebe: mov qword ptr [rip + 0xadddef], 0 ; 0x100c88cb8
0x1001aaec9: mov qword ptr [rip + 0xadddf0], rdx ; 0x100c88cc0
0x1001aaed0: mov qword ptr [rip + 0xadddf5], 0x18 ; 0x100c88cd0
0x1001aaedb: mov rdx, qword ptr [rip + 0xa5c67e] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1001aaee2: mov qword ptr [rip + 0xadddef], rdx ; 0x100c88cd8
0x1001aaee9: mov r15, rdx
0x1001aaeec: mov qword ptr [rip + 0xaddded], rax ; 0x100c88ce0
0x1001aaef3: mov qword ptr [rip + 0xadddea], 0xffffffffffffffff ; 0x100c88ce8
0x1001aaefe: mov qword ptr [rip + 0xadddeb], r13 ; 0x100c88cf0
0x1001aaf05: mov qword ptr [rip + 0xaddde8], 0 ; 0x100c88cf8
0x1001aaf10: lea rdx, [rip + 0x9cca3c] ; 0x100b77953 maxSpeed
0x1001aaf17: mov qword ptr [rip + 0xaddde2], rdx ; 0x100c88d00
0x1001aaf1e: lea rdx, [rip + 0xaddddb] ; 0x100c88d00
0x1001aaf25: mov qword ptr [rip + 0xadddd8], 0 ; 0x100c88d08
0x1001aaf30: mov qword ptr [rip + 0xadddd9], rcx ; 0x100c88d10
0x1001aaf37: mov qword ptr [rip + 0xadddde], 0x1c ; 0x100c88d20
0x1001aaf42: mov qword ptr [rip + 0xaddddf], r15 ; 0x100c88d28
0x1001aaf49: mov qword ptr [rip + 0xaddde0], rax ; 0x100c88d30
0x1001aaf50: mov qword ptr [rip + 0xaddddd], 0xffffffffffffffff ; 0x100c88d38
0x1001aaf5b: mov qword ptr [rip + 0xadddde], r13 ; 0x100c88d40
0x1001aaf62: mov qword ptr [rip + 0xaddddb], 0 ; 0x100c88d48
0x1001aaf6d: lea rcx, [rip + 0x9cc9e8] ; 0x100b7795c maxAcceleration
0x1001aaf74: mov qword ptr [rip + 0xadddd5], rcx ; 0x100c88d50
0x1001aaf7b: lea rcx, [rip + 0xadddce] ; 0x100c88d50
0x1001aaf82: mov qword ptr [rip + 0xadddcb], 0 ; 0x100c88d58
0x1001aaf8d: mov qword ptr [rip + 0xadddcc], rdx ; 0x100c88d60
0x1001aaf94: mov qword ptr [rip + 0xadddd1], 0x20 ; 0x100c88d70
0x1001aaf9f: mov qword ptr [rip + 0xadddd2], r15 ; 0x100c88d78
0x1001aafa6: mov qword ptr [rip + 0xadddd3], rax ; 0x100c88d80
0x1001aafad: mov qword ptr [rip + 0xadddd0], 0xffffffffffffffff ; 0x100c88d88
0x1001aafb8: mov qword ptr [rip + 0xadddd1], r13 ; 0x100c88d90
0x1001aafbf: mov qword ptr [rip + 0xadddce], 0 ; 0x100c88d98
0x1001aafca: lea rdx, [rip + 0x9cc99b] ; 0x100b7796c gravityInfluence
0x1001aafd1: mov qword ptr [rip + 0xadddc8], rdx ; 0x100c88da0
0x1001aafd8: lea rdx, [rip + 0xadddc1] ; 0x100c88da0
0x1001aafdf: mov qword ptr [rip + 0xadddca], rcx ; 0x100c88db0
0x1001aafe6: mov qword ptr [rip + 0xadddcf], 0x24 ; 0x100c88dc0
0x1001aaff1: mov qword ptr [rip + 0xadddd0], r15 ; 0x100c88dc8
0x1001aaff8: mov qword ptr [rip + 0xadddd1], rax ; 0x100c88dd0
0x1001aafff: mov qword ptr [rip + 0xadddce], 0xffffffffffffffff ; 0x100c88dd8
0x1001ab00a: mov qword ptr [rip + 0xadddcf], r13 ; 0x100c88de0
0x1001ab011: mov qword ptr [rip + 0xadddcc], 0 ; 0x100c88de8
0x1001ab01c: lea rcx, [rip + 0x9cc95a] ; 0x100b7797d 0.3f
0x1001ab023: vmovq xmm1, rcx
0x1001ab028: vpunpcklqdq xmm1, xmm2, xmm1
0x1001ab02c: vmovdqa xmmword ptr [rip + 0x1c2ed2c], xmm1 ; 0x101dd9d60
0x1001ab034: lea rcx, [rip + 0x1c2ed25] ; 0x101dd9d60
0x1001ab03b: mov qword ptr [rip + 0x1c2ed2a], 0 ; 0x101dd9d70
0x1001ab046: mov qword ptr [rip + 0xaddd5b], rcx ; 0x100c88da8
0x1001ab04d: lea rcx, [rip + 0x9cc92e] ; 0x100b77982 hasGuide
0x1001ab054: mov qword ptr [rip + 0xaddd95], rcx ; 0x100c88df0
0x1001ab05b: lea rcx, [rip + 0xaddd8e] ; 0x100c88df0
0x1001ab062: mov qword ptr [rip + 0xaddd97], rdx ; 0x100c88e00
0x1001ab069: mov qword ptr [rip + 0xaddd9c], 0x28 ; 0x100c88e10
0x1001ab074: mov rdx, qword ptr [rip + 0xa5c4dd] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1001ab07b: mov qword ptr [rip + 0xaddd96], rdx ; 0x100c88e18
0x1001ab082: mov rsi, rdx
0x1001ab085: mov qword ptr [rip + 0xaddd94], rax ; 0x100c88e20
0x1001ab08c: mov qword ptr [rip + 0xaddd91], 0xffffffffffffffff ; 0x100c88e28
0x1001ab097: mov qword ptr [rip + 0xaddd92], r13 ; 0x100c88e30
0x1001ab09e: mov qword ptr [rip + 0xaddd8f], 0 ; 0x100c88e38
0x1001ab0a9: vpunpcklqdq xmm0, xmm2, xmm0
0x1001ab0ad: vmovdqa xmmword ptr [rip + 0x1c2eccb], xmm0 ; 0x101dd9d80
0x1001ab0b5: vmovdqa xmm1, xmm0
0x1001ab0b9: lea rdx, [rip + 0x1c2ecc0] ; 0x101dd9d80
0x1001ab0c0: mov qword ptr [rip + 0x1c2ecc5], 0 ; 0x101dd9d90
0x1001ab0cb: mov qword ptr [rip + 0xaddd26], rdx ; 0x100c88df8
0x1001ab0d2: lea rdx, [rip + 0x9cc8b2] ; 0x100b7798b usePredictiveGuide
0x1001ab0d9: mov qword ptr [rip + 0xaddd60], rdx ; 0x100c88e40
0x1001ab0e0: lea rdx, [rip + 0xaddd59] ; 0x100c88e40
0x1001ab0e7: mov qword ptr [rip + 0xaddd62], rcx ; 0x100c88e50
0x1001ab0ee: mov qword ptr [rip + 0xaddd67], 0x29 ; 0x100c88e60
0x1001ab0f9: mov qword ptr [rip + 0xaddd68], rsi ; 0x100c88e68
0x1001ab100: mov qword ptr [rip + 0xaddd69], rax ; 0x100c88e70
0x1001ab107: mov qword ptr [rip + 0xaddd66], 0xffffffffffffffff ; 0x100c88e78
0x1001ab112: mov qword ptr [rip + 0xaddd67], r13 ; 0x100c88e80
0x1001ab119: mov qword ptr [rip + 0xaddd64], 0 ; 0x100c88e88
0x1001ab124: lea rcx, [rip + 0x9f7f01] ; 0x100ba302c false
0x1001ab12b: vmovq xmm0, rcx
0x1001ab130: vpunpcklqdq xmm0, xmm2, xmm0
0x1001ab134: vmovdqa xmm3, xmm2
0x1001ab138: vmovdqa xmmword ptr [rbp - 0xa0], xmm3
0x1001ab140: vmovdqa xmmword ptr [rip + 0x1c2ec58], xmm0 ; 0x101dd9da0
0x1001ab148: vmovdqa xmm2, xmm0
0x1001ab14c: lea rcx, [rip + 0x1c2ec4d] ; 0x101dd9da0
0x1001ab153: mov qword ptr [rip + 0x1c2ec52], 0 ; 0x101dd9db0
0x1001ab15e: mov qword ptr [rip + 0xaddce3], rcx ; 0x100c88e48
0x1001ab165: lea rcx, [rip + 0x9cc832] ; 0x100b7799e guidesEnabled
0x1001ab16c: mov qword ptr [rip + 0xaddd1d], rcx ; 0x100c88e90
0x1001ab173: lea rcx, [rip + 0xaddd16] ; 0x100c88e90
0x1001ab17a: mov qword ptr [rip + 0xaddd1f], rdx ; 0x100c88ea0
0x1001ab181: mov qword ptr [rip + 0xaddd24], 0x2a ; 0x100c88eb0
0x1001ab18c: mov qword ptr [rip + 0xaddd25], rsi ; 0x100c88eb8
0x1001ab193: mov qword ptr [rip + 0xaddd26], rax ; 0x100c88ec0
0x1001ab19a: mov qword ptr [rip + 0xaddd23], 0xffffffffffffffff ; 0x100c88ec8
0x1001ab1a5: mov qword ptr [rip + 0xaddd24], r13 ; 0x100c88ed0
0x1001ab1ac: mov qword ptr [rip + 0xaddd21], 0 ; 0x100c88ed8
0x1001ab1b7: vmovdqa xmmword ptr [rip + 0x1c2ec01], xmm1 ; 0x101dd9dc0
0x1001ab1bf: lea rdx, [rip + 0x1c2ebfa] ; 0x101dd9dc0
0x1001ab1c6: mov qword ptr [rip + 0x1c2ebff], 0 ; 0x101dd9dd0
0x1001ab1d1: mov qword ptr [rip + 0xaddcc0], rdx ; 0x100c88e98
0x1001ab1d8: lea rdx, [rip + 0x9cc7cd] ; 0x100b779ac guideOnAttachRadius
0x1001ab1df: mov qword ptr [rip + 0xaddcfa], rdx ; 0x100c88ee0
0x1001ab1e6: lea rdx, [rip + 0xaddcf3] ; 0x100c88ee0
0x1001ab1ed: mov qword ptr [rip + 0xaddcfc], rcx ; 0x100c88ef0
0x1001ab1f4: mov qword ptr [rip + 0xaddd01], 0x2c ; 0x100c88f00
0x1001ab1ff: mov qword ptr [rip + 0xaddd02], r15 ; 0x100c88f08
0x1001ab206: mov qword ptr [rip + 0xaddd03], rax ; 0x100c88f10
0x1001ab20d: mov qword ptr [rip + 0xaddd00], 0xffffffffffffffff ; 0x100c88f18
0x1001ab218: mov qword ptr [rip + 0xaddd01], r13 ; 0x100c88f20
0x1001ab21f: mov qword ptr [rip + 0xaddcfe], 0 ; 0x100c88f28
0x1001ab22a: lea rcx, [rip + 0x9cc78f] ; 0x100b779c0 3.5f
0x1001ab231: vmovq xmm0, rcx
0x1001ab236: vpunpcklqdq xmm0, xmm3, xmm0
0x1001ab23a: vmovdqa xmmword ptr [rip + 0x1c2eb9e], xmm0 ; 0x101dd9de0
0x1001ab242: lea rcx, [rip + 0x1c2eb97] ; 0x101dd9de0
0x1001ab249: mov qword ptr [rip + 0x1c2eb9c], 0 ; 0x101dd9df0
0x1001ab254: mov qword ptr [rip + 0xaddc8d], rcx ; 0x100c88ee8
0x1001ab25b: lea rcx, [rip + 0x9cc763] ; 0x100b779c5 shoutType
0x1001ab262: mov qword ptr [rip + 0xaddcc7], rcx ; 0x100c88f30
0x1001ab269: lea rcx, [rip + 0xaddcc0] ; 0x100c88f30
0x1001ab270: mov qword ptr [rip + 0xaddcc9], rdx ; 0x100c88f40
0x1001ab277: mov qword ptr [rip + 0xaddcce], 0x30 ; 0x100c88f50
0x1001ab282: mov qword ptr [rip + 0xaddccf], r14 ; 0x100c88f58
0x1001ab289: mov qword ptr [rip + 0xaddcd0], rax ; 0x100c88f60
0x1001ab290: mov qword ptr [rip + 0xaddccd], 0xffffffffffffffff ; 0x100c88f68
0x1001ab29b: mov qword ptr [rip + 0xaddcce], r13 ; 0x100c88f70
0x1001ab2a2: mov qword ptr [rip + 0xaddccb], 0 ; 0x100c88f78
0x1001ab2ad: vmovq xmm0, r12
0x1001ab2b2: vpunpcklqdq xmm0, xmm3, xmm0
0x1001ab2b6: vmovdqa xmmword ptr [rip + 0x1c2eb42], xmm0 ; 0x101dd9e00
0x1001ab2be: lea rdx, [rip + 0x1c2eb3b] ; 0x101dd9e00
0x1001ab2c5: mov qword ptr [rip + 0x1c2eb40], 0 ; 0x101dd9e10
0x1001ab2d0: mov qword ptr [rip + 0xaddc61], rdx ; 0x100c88f38
0x1001ab2d7: lea rdx, [rip + 0x9cc6f1] ; 0x100b779cf randShoutsMinTime
0x1001ab2de: mov qword ptr [rip + 0xaddc9b], rdx ; 0x100c88f80
0x1001ab2e5: lea rdx, [rip + 0xaddc94] ; 0x100c88f80
0x1001ab2ec: mov qword ptr [rip + 0xaddc9d], rcx ; 0x100c88f90
0x1001ab2f3: mov qword ptr [rip + 0xaddca2], 0x34 ; 0x100c88fa0
0x1001ab2fe: mov qword ptr [rip + 0xaddca3], r15 ; 0x100c88fa8
0x1001ab305: mov qword ptr [rip + 0xaddca4], rax ; 0x100c88fb0
0x1001ab30c: mov qword ptr [rip + 0xaddca1], 0xffffffffffffffff ; 0x100c88fb8
0x1001ab317: mov qword ptr [rip + 0xaddca2], r13 ; 0x100c88fc0
0x1001ab31e: mov qword ptr [rip + 0xaddc9f], 0 ; 0x100c88fc8
0x1001ab329: lea rcx, [rip + 0x9b3709] ; 0x100b5ea39 0.0f
0x1001ab330: vmovq xmm0, rcx
0x1001ab335: vpunpcklqdq xmm0, xmm3, xmm0
0x1001ab339: vmovdqa xmmword ptr [rip + 0x1c2eadf], xmm0 ; 0x101dd9e20
0x1001ab341: lea rcx, [rip + 0x1c2ead8] ; 0x101dd9e20
0x1001ab348: mov qword ptr [rip + 0x1c2eadd], 0 ; 0x101dd9e30
0x1001ab353: mov qword ptr [rip + 0xaddc2e], rcx ; 0x100c88f88
0x1001ab35a: lea rcx, [rip + 0x9cc680] ; 0x100b779e1 randShoutsMaxTime
0x1001ab361: mov qword ptr [rip + 0xaddc68], rcx ; 0x100c88fd0
0x1001ab368: lea rcx, [rip + 0xaddc61] ; 0x100c88fd0
0x1001ab36f: mov qword ptr [rip + 0xaddc6a], rdx ; 0x100c88fe0
0x1001ab376: mov qword ptr [rip + 0xaddc6f], 0x38 ; 0x100c88ff0
0x1001ab381: mov qword ptr [rip + 0xaddc70], r15 ; 0x100c88ff8
0x1001ab388: mov qword ptr [rip + 0xaddc71], rax ; 0x100c89000
0x1001ab38f: mov qword ptr [rip + 0xaddc6e], 0xffffffffffffffff ; 0x100c89008
0x1001ab39a: mov qword ptr [rip + 0xaddc6f], r13 ; 0x100c89010
0x1001ab3a1: mov qword ptr [rip + 0xaddc6c], 0 ; 0x100c89018
0x1001ab3ac: vmovdqa xmmword ptr [rip + 0x1c2ea8c], xmm0 ; 0x101dd9e40
0x1001ab3b4: lea rdx, [rip + 0x1c2ea85] ; 0x101dd9e40
0x1001ab3bb: mov qword ptr [rip + 0x1c2ea8a], 0 ; 0x101dd9e50
0x1001ab3c6: mov qword ptr [rip + 0xaddc0b], rdx ; 0x100c88fd8
0x1001ab3cd: lea rdx, [rip + 0x9cc61f] ; 0x100b779f3 addTrailParticles
0x1001ab3d4: mov qword ptr [rip + 0xaddc45], rdx ; 0x100c89020
0x1001ab3db: lea rdx, [rip + 0xaddc3e] ; 0x100c89020
0x1001ab3e2: mov qword ptr [rip + 0xaddc47], rcx ; 0x100c89030
0x1001ab3e9: mov qword ptr [rip + 0xaddc4c], 0x3c ; 0x100c89040
0x1001ab3f4: mov qword ptr [rip + 0xaddc4d], rsi ; 0x100c89048
0x1001ab3fb: mov qword ptr [rip + 0xaddc4e], rax ; 0x100c89050
0x1001ab402: mov qword ptr [rip + 0xaddc4b], 0xffffffffffffffff ; 0x100c89058
0x1001ab40d: mov qword ptr [rip + 0xaddc4c], r13 ; 0x100c89060
0x1001ab414: mov qword ptr [rip + 0xaddc49], 0 ; 0x100c89068
0x1001ab41f: vmovdqa xmmword ptr [rbp - 0xb0], xmm2
0x1001ab427: vmovdqa xmmword ptr [rip + 0x1c2ea31], xmm2 ; 0x101dd9e60
0x1001ab42f: lea rcx, [rip + 0x1c2ea2a] ; 0x101dd9e60
0x1001ab436: mov qword ptr [rip + 0x1c2ea2f], 0 ; 0x101dd9e70
0x1001ab441: mov qword ptr [rip + 0xaddbe0], rcx ; 0x100c89028
0x1001ab448: lea rcx, [rip + 0x9cc5b6] ; 0x100b77a05 useDistanceCulling
0x1001ab44f: mov qword ptr [rip + 0xaddc1a], rcx ; 0x100c89070
0x1001ab456: lea rcx, [rip + 0xaddc13] ; 0x100c89070
0x1001ab45d: mov qword ptr [rip + 0xaddc1c], rdx ; 0x100c89080
0x1001ab464: mov qword ptr [rip + 0xaddc21], 0x3d ; 0x100c89090
0x1001ab46f: mov qword ptr [rip + 0xaddc22], rsi ; 0x100c89098
0x1001ab476: mov qword ptr [rip + 0xaddc23], rax ; 0x100c890a0
0x1001ab47d: mov qword ptr [rip + 0xaddc20], 0xffffffffffffffff ; 0x100c890a8
0x1001ab488: mov qword ptr [rip + 0xaddc21], r13 ; 0x100c890b0
0x1001ab48f: mov qword ptr [rip + 0xaddc1e], 0 ; 0x100c890b8
0x1001ab49a: vmovdqa xmmword ptr [rbp - 0x70], xmm1
0x1001ab49f: vmovdqa xmmword ptr [rip + 0x1c2e9d9], xmm1 ; 0x101dd9e80
0x1001ab4a7: lea rdx, [rip + 0x1c2e9d2] ; 0x101dd9e80
0x1001ab4ae: mov qword ptr [rip + 0x1c2e9d7], 0 ; 0x101dd9e90
0x1001ab4b9: mov qword ptr [rip + 0xaddbb8], rdx ; 0x100c89078
0x1001ab4c0: lea rdx, [rip + 0x9cc551] ; 0x100b77a18 hasBoom
0x1001ab4c7: mov qword ptr [rip + 0xaddbf2], rdx ; 0x100c890c0
0x1001ab4ce: lea rdx, [rip + 0xaddbeb] ; 0x100c890c0
0x1001ab4d5: mov qword ptr [rip + 0xaddbf4], rcx ; 0x100c890d0
0x1001ab4dc: mov qword ptr [rip + 0xaddbf9], 0x3e ; 0x100c890e0
0x1001ab4e7: mov qword ptr [rip + 0xaddbfa], rsi ; 0x100c890e8
0x1001ab4ee: mov qword ptr [rip + 0xaddbfb], rax ; 0x100c890f0
0x1001ab4f5: mov qword ptr [rip + 0xaddbf8], 0xffffffffffffffff ; 0x100c890f8
0x1001ab500: mov qword ptr [rip + 0xaddbf9], r13 ; 0x100c89100
0x1001ab507: mov qword ptr [rip + 0xaddbf6], 0 ; 0x100c89108
0x1001ab512: vmovdqa xmmword ptr [rip + 0x1c2e986], xmm2 ; 0x101dd9ea0
0x1001ab51a: lea rcx, [rip + 0x1c2e97f] ; 0x101dd9ea0
0x1001ab521: mov qword ptr [rip + 0x1c2e984], 0 ; 0x101dd9eb0
0x1001ab52c: mov qword ptr [rip + 0xaddb95], rcx ; 0x100c890c8
0x1001ab533: lea rcx, [rip + 0x9cc4e6] ; 0x100b77a20 hasCloudParticles
0x1001ab53a: mov qword ptr [rip + 0xaddbcf], rcx ; 0x100c89110
0x1001ab541: lea rcx, [rip + 0xaddbc8] ; 0x100c89110
0x1001ab548: mov qword ptr [rip + 0xaddbd1], rdx ; 0x100c89120
0x1001ab54f: mov qword ptr [rip + 0xaddbd6], 0x3f ; 0x100c89130
0x1001ab55a: mov qword ptr [rip + 0xaddbd7], rsi ; 0x100c89138
0x1001ab561: mov r14, rsi
0x1001ab564: mov qword ptr [rip + 0xaddbd5], rax ; 0x100c89140
0x1001ab56b: mov qword ptr [rip + 0xaddbd2], 0xffffffffffffffff ; 0x100c89148
0x1001ab576: mov qword ptr [rip + 0xaddbd3], r13 ; 0x100c89150
0x1001ab57d: mov qword ptr [rip + 0xaddbd0], 0 ; 0x100c89158
0x1001ab588: vmovdqa xmmword ptr [rip + 0x1c2e930], xmm2 ; 0x101dd9ec0
0x1001ab590: lea rdx, [rip + 0x1c2e929] ; 0x101dd9ec0
0x1001ab597: mov qword ptr [rip + 0x1c2e92e], 0 ; 0x101dd9ed0
0x1001ab5a2: mov qword ptr [rip + 0xaddb6f], rdx ; 0x100c89118
0x1001ab5a9: lea rdx, [rip + 0x9cc482] ; 0x100b77a32 hasResponseShout
0x1001ab5b0: mov qword ptr [rip + 0xaddba9], rdx ; 0x100c89160
0x1001ab5b7: lea rdx, [rip + 0xaddba2] ; 0x100c89160
0x1001ab5be: mov qword ptr [rip + 0xaddbab], rcx ; 0x100c89170
0x1001ab5c5: mov qword ptr [rip + 0xaddbb0], 0x40 ; 0x100c89180
0x1001ab5d0: mov qword ptr [rip + 0xaddbb1], r14 ; 0x100c89188
0x1001ab5d7: mov qword ptr [rip + 0xaddbb2], rax ; 0x100c89190
0x1001ab5de: mov qword ptr [rip + 0xaddbaf], 0xffffffffffffffff ; 0x100c89198
0x1001ab5e9: mov qword ptr [rip + 0xaddbb0], r13 ; 0x100c891a0
0x1001ab5f0: mov qword ptr [rip + 0xaddbad], 0 ; 0x100c891a8
0x1001ab5fb: vmovdqa xmmword ptr [rip + 0x1c2e8dd], xmm1 ; 0x101dd9ee0
0x1001ab603: lea rcx, [rip + 0x1c2e8d6] ; 0x101dd9ee0
0x1001ab60a: mov qword ptr [rip + 0x1c2e8db], 0 ; 0x101dd9ef0
0x1001ab615: mov qword ptr [rip + 0xaddb4c], rcx ; 0x100c89168
0x1001ab61c: lea rcx, [rip + 0x9cc420] ; 0x100b77a43 onAttach
0x1001ab623: mov qword ptr [rip + 0xaddb86], rcx ; 0x100c891b0
0x1001ab62a: lea rcx, [rip + 0xaddb7f] ; 0x100c891b0
0x1001ab631: mov qword ptr [rip + 0xaddb88], rdx ; 0x100c891c0
0x1001ab638: mov qword ptr [rip + 0xaddb8d], 0x48 ; 0x100c891d0
0x1001ab643: mov rdx, qword ptr [rip + 0xa5bc7e] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x1001ab64a: mov qword ptr [rip + 0xaddb87], rdx ; 0x100c891d8
0x1001ab651: mov rbx, rdx
0x1001ab654: mov qword ptr [rip + 0xaddb85], rax ; 0x100c891e0
0x1001ab65b: mov qword ptr [rip + 0xaddb82], 0xffffffffffffffff ; 0x100c891e8
0x1001ab666: mov qword ptr [rip + 0xaddb83], r13 ; 0x100c891f0
0x1001ab66d: mov qword ptr [rip + 0xaddb80], 0 ; 0x100c891f8
0x1001ab678: lea rdx, [rip + 0x9cc3cd] ; 0x100b77a4c Progress
0x1001ab67f: vmovq xmm0, rdx
0x1001ab684: lea rdx, [rip + 0x9b8f04] ; 0x100b6458f Tool_Category
0x1001ab68b: vmovq xmm1, rdx
0x1001ab690: vmovdqa xmmword ptr [rbp - 0x80], xmm1
0x1001ab695: vpunpcklqdq xmm0, xmm1, xmm0
0x1001ab699: vmovdqa xmmword ptr [rip + 0x1c2e85f], xmm0 ; 0x101dd9f00
0x1001ab6a1: lea rdx, [rip + 0x1c2e858] ; 0x101dd9f00
0x1001ab6a8: mov qword ptr [rip + 0x1c2e85d], 0 ; 0x101dd9f10
0x1001ab6b3: lea rsi, [rip + 0x9b3341] ; 0x100b5e9fb Object
0x1001ab6ba: vmovq xmm1, rsi
0x1001ab6bf: lea rsi, [rip + 0x9b3326] ; 0x100b5e9ec Tool_ClumpType
0x1001ab6c6: vmovq xmm2, rsi
0x1001ab6cb: vmovdqa xmmword ptr [rbp - 0x50], xmm2
0x1001ab6d0: vpunpcklqdq xmm1, xmm2, xmm1
0x1001ab6d4: vmovdqa xmmword ptr [rip + 0x1c2e844], xmm1 ; 0x101dd9f20
0x1001ab6dc: lea rsi, [rip + 0x1c2e83d] ; 0x101dd9f20
0x1001ab6e3: mov qword ptr [rip + 0x1c2e846], rdx ; 0x101dd9f30
0x1001ab6ea: vmovdqa xmmword ptr [rip + 0x1c2e84e], xmm5 ; 0x101dd9f40
0x1001ab6f2: lea rdx, [rip + 0x1c2e847] ; 0x101dd9f40
0x1001ab6f9: mov qword ptr [rip + 0x1c2e850], rsi ; 0x101dd9f50
0x1001ab700: vmovdqa xmmword ptr [rip + 0x1c2e858], xmm4 ; 0x101dd9f60
0x1001ab708: lea rsi, [rip + 0x1c2e851] ; 0x101dd9f60
0x1001ab70f: mov qword ptr [rip + 0x1c2e85a], rdx ; 0x101dd9f70
0x1001ab716: mov qword ptr [rip + 0xadda9b], rsi ; 0x100c891b8
0x1001ab71d: lea rdx, [rip + 0x9cc331] ; 0x100b77a55 onAttachLocoOnly
0x1001ab724: mov qword ptr [rip + 0xaddad5], rdx ; 0x100c89200
0x1001ab72b: lea rdx, [rip + 0xaddace] ; 0x100c89200
0x1001ab732: mov qword ptr [rip + 0xaddad7], rcx ; 0x100c89210
0x1001ab739: mov qword ptr [rip + 0xaddadc], 0x50 ; 0x100c89220
0x1001ab744: mov qword ptr [rip + 0xaddadd], rbx ; 0x100c89228
0x1001ab74b: mov qword ptr [rip + 0xaddade], rax ; 0x100c89230
0x1001ab752: mov qword ptr [rip + 0xaddadb], 0xffffffffffffffff ; 0x100c89238
0x1001ab75d: mov qword ptr [rip + 0xaddadc], r13 ; 0x100c89240
0x1001ab764: mov qword ptr [rip + 0xaddad9], 0 ; 0x100c89248
0x1001ab76f: vmovdqa xmmword ptr [rip + 0x1c2e809], xmm0 ; 0x101dd9f80
0x1001ab777: lea rcx, [rip + 0x1c2e802] ; 0x101dd9f80
0x1001ab77e: mov qword ptr [rip + 0x1c2e807], 0 ; 0x101dd9f90
0x1001ab789: vmovdqa xmmword ptr [rip + 0x1c2e80f], xmm1 ; 0x101dd9fa0
0x1001ab791: lea rsi, [rip + 0x1c2e808] ; 0x101dd9fa0
0x1001ab798: mov qword ptr [rip + 0x1c2e811], rcx ; 0x101dd9fb0
0x1001ab79f: vmovdqa xmmword ptr [rip + 0x1c2e819], xmm5 ; 0x101dd9fc0
0x1001ab7a7: vmovdqa xmmword ptr [rbp - 0x60], xmm5
0x1001ab7ac: lea rcx, [rip + 0x1c2e80d] ; 0x101dd9fc0
0x1001ab7b3: mov qword ptr [rip + 0x1c2e816], rsi ; 0x101dd9fd0
0x1001ab7ba: vmovdqa xmmword ptr [rip + 0x1c2e81e], xmm4 ; 0x101dd9fe0
0x1001ab7c2: vmovdqa xmmword ptr [rbp - 0x40], xmm4
0x1001ab7c7: lea rsi, [rip + 0x1c2e812] ; 0x101dd9fe0
0x1001ab7ce: mov qword ptr [rip + 0x1c2e81b], rcx ; 0x101dd9ff0
0x1001ab7d5: mov qword ptr [rip + 0xadda2c], rsi ; 0x100c89208
0x1001ab7dc: lea rcx, [rip + 0x9cc283] ; 0x100b77a66 onDetach
0x1001ab7e3: mov qword ptr [rip + 0xadda66], rcx ; 0x100c89250
0x1001ab7ea: lea rcx, [rip + 0xadda5f] ; 0x100c89250
0x1001ab7f1: mov qword ptr [rip + 0xadda68], rdx ; 0x100c89260
0x1001ab7f8: mov qword ptr [rip + 0xacc461], rcx ; 0x100c77c60
0x1001ab7ff: mov qword ptr [rip + 0xadda66], 0x58 ; 0x100c89270
0x1001ab80a: mov qword ptr [rip + 0xadda67], rbx ; 0x100c89278
0x1001ab811: mov qword ptr [rip + 0xadda68], rax ; 0x100c89280
0x1001ab818: mov qword ptr [rip + 0xadda65], 0xffffffffffffffff ; 0x100c89288
0x1001ab823: mov qword ptr [rip + 0xadda66], r13 ; 0x100c89290
0x1001ab82a: mov qword ptr [rip + 0xadda63], 0 ; 0x100c89298
0x1001ab835: vmovdqa xmmword ptr [rip + 0x1c2e7c3], xmm0 ; 0x101dda000
0x1001ab83d: lea rax, [rip + 0x1c2e7bc] ; 0x101dda000
0x1001ab844: mov qword ptr [rip + 0x1c2e7c1], 0 ; 0x101dda010
0x1001ab84f: vmovdqa xmmword ptr [rip + 0x1c2e7c9], xmm1 ; 0x101dda020
0x1001ab857: lea rcx, [rip + 0x1c2e7c2] ; 0x101dda020
0x1001ab85e: mov qword ptr [rip + 0x1c2e7cb], rax ; 0x101dda030
0x1001ab865: vmovdqa xmmword ptr [rip + 0x1c2e7d3], xmm5 ; 0x101dda040
0x1001ab86d: lea rax, [rip + 0x1c2e7cc] ; 0x101dda040
0x1001ab874: mov qword ptr [rip + 0x1c2e7d5], rcx ; 0x101dda050
0x1001ab87b: vmovdqa xmmword ptr [rip + 0x1c2e7dd], xmm4 ; 0x101dda060
0x1001ab883: lea rcx, [rip + 0x1c2e7d6] ; 0x101dda060
0x1001ab88a: mov qword ptr [rip + 0x1c2e7df], rax ; 0x101dda070
0x1001ab891: mov qword ptr [rip + 0xadd9c0], rcx ; 0x100c89258
0x1001ab898: lea rax, [rip + 0x9cc1d0] ; 0x100b77a6f BirdV2AiParams
0x1001ab89f: mov qword ptr [rip + 0x1c2e7da], rax ; 0x101dda080
0x1001ab8a6: lea rax, [rip + 0x1c2e7cb] ; 0x101dda078
0x1001ab8ad: mov qword ptr [rip + 0x1c2e7d0], 0 ; 0x101dda088
0x1001ab8b8: mov rcx, qword ptr [rip + 0xac4699] ; 0x100c6ff58
0x1001ab8bf: mov qword ptr [rip + 0x1c2e7ca], rcx ; 0x101dda090
0x1001ab8c6: mov qword ptr [rip + 0xac468b], rax ; 0x100c6ff58
0x1001ab8cd: mov qword ptr [rip + 0x1c2e7cc], rax ; 0x101dda0a0
0x1001ab8d4: mov rax, qword ptr [rip + 0xa5c92d] ; 0x100c08208 -> 0x1001a67e0 __Z18GetMetaClassByTypeIP18LevelAllocatedDataERK9MetaClassv
0x1001ab8db: mov qword ptr [rip + 0x1c2e7c6], rax ; 0x101dda0a8
0x1001ab8e2: mov dword ptr [rip + 0x1c2e7c4], 0xffffffff ; 0x101dda0b0
0x1001ab8ec: mov dword ptr [rip + 0x1c2e7be], 0xffffffff ; 0x101dda0b4
0x1001ab8f6: mov qword ptr [rip + 0x1c2e7cf], 0 ; 0x101dda0d0
0x1001ab901: mov rax, qword ptr [rip + 0xa5fa30] ; 0x100c0b338
0x1001ab908: add rax, 0x10
0x1001ab90c: mov qword ptr [rip + 0x1c2e765], rax ; 0x101dda078
0x1001ab913: xor eax, eax
0x1001ab915: call 0x100011c10 ; 0x100011c10
0x1001ab91a: lea rax, [rip + 0x9cc15d] ; 0x100b77a7e seekTargets
0x1001ab921: mov qword ptr [rip + 0xadd978], rax ; 0x100c892a0
0x1001ab928: lea rcx, [rip + 0xadd971] ; 0x100c892a0
0x1001ab92f: mov rax, qword ptr [rip + 0xacc32a] ; 0x100c77c60
0x1001ab936: mov qword ptr [rip + 0xadd973], rax ; 0x100c892b0
0x1001ab93d: mov qword ptr [rip + 0xadd978], 8 ; 0x100c892c0
0x1001ab948: mov qword ptr [rip + 0xadd979], rbx ; 0x100c892c8
0x1001ab94f: mov rax, qword ptr [rip + 0xa5c322] ; 0x100c07c78 -> 0x1001a7580 __Z18GetMetaClassByTypeIP14BirdV2AiParamsERK9MetaClassv
0x1001ab956: mov qword ptr [rip + 0xadd973], rax ; 0x100c892d0
0x1001ab95d: mov qword ptr [rip + 0xadd970], 0xffffffffffffffff ; 0x100c892d8
0x1001ab968: mov qword ptr [rip + 0xadd971], r13 ; 0x100c892e0
0x1001ab96f: mov qword ptr [rip + 0xadd96e], 0 ; 0x100c892e8
0x1001ab97a: vmovaps xmm1, xmmword ptr [rbp - 0x60]
0x1001ab97f: vmovaps xmmword ptr [rip + 0x1c2e759], xmm1 ; 0x101dda0e0
0x1001ab987: lea rdx, [rip + 0x1c2e752] ; 0x101dda0e0
0x1001ab98e: mov qword ptr [rip + 0x1c2e757], 0 ; 0x101dda0f0
0x1001ab999: lea rsi, [rip + 0x9b8c99] ; 0x100b64639 Marker
0x1001ab9a0: vmovq xmm0, rsi
0x1001ab9a5: vmovdqa xmm3, xmmword ptr [rbp - 0x50]
0x1001ab9aa: vpunpcklqdq xmm0, xmm3, xmm0
0x1001ab9ae: vmovdqa xmmword ptr [rip + 0x1c2e74a], xmm0 ; 0x101dda100
0x1001ab9b6: lea rsi, [rip + 0x1c2e743] ; 0x101dda100
0x1001ab9bd: mov qword ptr [rip + 0x1c2e74c], rdx ; 0x101dda110
0x1001ab9c4: mov qword ptr [rip + 0xadd8dd], rsi ; 0x100c892a8
0x1001ab9cb: lea rdx, [rip + 0x9cc0b8] ; 0x100b77a8a landTargets
0x1001ab9d2: mov qword ptr [rip + 0xadd917], rdx ; 0x100c892f0
0x1001ab9d9: lea rdx, [rip + 0xadd910] ; 0x100c892f0
0x1001ab9e0: mov qword ptr [rip + 0xadd919], rcx ; 0x100c89300
0x1001ab9e7: mov qword ptr [rip + 0xadd91e], 0x10 ; 0x100c89310
0x1001ab9f2: mov qword ptr [rip + 0xadd91f], rbx ; 0x100c89318
0x1001ab9f9: mov qword ptr [rip + 0xadd920], rax ; 0x100c89320
0x1001aba00: mov qword ptr [rip + 0xadd91d], 0xffffffffffffffff ; 0x100c89328
0x1001aba0b: mov qword ptr [rip + 0xadd91e], r13 ; 0x100c89330
0x1001aba12: mov qword ptr [rip + 0xadd91b], 0 ; 0x100c89338
0x1001aba1d: vmovaps xmmword ptr [rip + 0x1c2e6fb], xmm1 ; 0x101dda120
0x1001aba25: vmovaps xmm2, xmm1
0x1001aba29: lea rcx, [rip + 0x1c2e6f0] ; 0x101dda120
0x1001aba30: mov qword ptr [rip + 0x1c2e6f5], 0 ; 0x101dda130
0x1001aba3b: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x1001aba40: vmovaps xmmword ptr [rip + 0x1c2e6f8], xmm1 ; 0x101dda140
0x1001aba48: lea rsi, [rip + 0x1c2e6f1] ; 0x101dda140
0x1001aba4f: mov qword ptr [rip + 0x1c2e6fa], rcx ; 0x101dda150
0x1001aba56: vmovdqa xmmword ptr [rip + 0x1c2e702], xmm0 ; 0x101dda160
0x1001aba5e: lea rcx, [rip + 0x1c2e6fb] ; 0x101dda160
0x1001aba65: mov qword ptr [rip + 0x1c2e704], rsi ; 0x101dda170
0x1001aba6c: mov qword ptr [rip + 0xadd885], rcx ; 0x100c892f8
0x1001aba73: lea rcx, [rip + 0x9cc01c] ; 0x100b77a96 perchTargets
0x1001aba7a: mov qword ptr [rip + 0xadd8bf], rcx ; 0x100c89340
0x1001aba81: lea rcx, [rip + 0xadd8b8] ; 0x100c89340
0x1001aba88: mov qword ptr [rip + 0xadd8c1], rdx ; 0x100c89350
0x1001aba8f: mov qword ptr [rip + 0xadd8c6], 0x18 ; 0x100c89360
0x1001aba9a: mov qword ptr [rip + 0xadd8c7], rbx ; 0x100c89368
0x1001abaa1: mov qword ptr [rip + 0xadd8c8], rax ; 0x100c89370
0x1001abaa8: mov qword ptr [rip + 0xadd8c5], 0xffffffffffffffff ; 0x100c89378
0x1001abab3: mov qword ptr [rip + 0xadd8c6], r13 ; 0x100c89380
0x1001ababa: mov qword ptr [rip + 0xadd8c3], 0 ; 0x100c89388
0x1001abac5: vmovaps xmmword ptr [rip + 0x1c2e6b3], xmm2 ; 0x101dda180
0x1001abacd: lea rdx, [rip + 0x1c2e6ac] ; 0x101dda180
0x1001abad4: mov qword ptr [rip + 0x1c2e6b1], 0 ; 0x101dda190
0x1001abadf: vmovaps xmmword ptr [rip + 0x1c2e6b9], xmm1 ; 0x101dda1a0
0x1001abae7: vmovaps xmm4, xmm1
0x1001abaeb: lea rsi, [rip + 0x1c2e6ae] ; 0x101dda1a0
0x1001abaf2: mov qword ptr [rip + 0x1c2e6b7], rdx ; 0x101dda1b0
0x1001abaf9: vmovdqa xmmword ptr [rip + 0x1c2e6bf], xmm0 ; 0x101dda1c0
0x1001abb01: lea rdx, [rip + 0x1c2e6b8] ; 0x101dda1c0
0x1001abb08: mov qword ptr [rip + 0x1c2e6c1], rsi ; 0x101dda1d0
0x1001abb0f: mov qword ptr [rip + 0xadd832], rdx ; 0x100c89348
0x1001abb16: lea rdx, [rip + 0x9cbf86] ; 0x100b77aa3 flairRails
0x1001abb1d: mov qword ptr [rip + 0xadd86c], rdx ; 0x100c89390
0x1001abb24: lea rdx, [rip + 0xadd865] ; 0x100c89390
0x1001abb2b: mov qword ptr [rip + 0xadd86e], rcx ; 0x100c893a0
0x1001abb32: mov qword ptr [rip + 0xadd873], 0x28 ; 0x100c893b0
0x1001abb3d: mov qword ptr [rip + 0xadd874], rbx ; 0x100c893b8
0x1001abb44: mov qword ptr [rip + 0xadd875], rax ; 0x100c893c0
0x1001abb4b: mov qword ptr [rip + 0xadd872], 0xffffffffffffffff ; 0x100c893c8
0x1001abb56: mov qword ptr [rip + 0xadd873], r13 ; 0x100c893d0
0x1001abb5d: mov qword ptr [rip + 0xadd870], 0 ; 0x100c893d8
0x1001abb68: vmovaps xmmword ptr [rip + 0x1c2e670], xmm2 ; 0x101dda1e0
0x1001abb70: lea rcx, [rip + 0x1c2e669] ; 0x101dda1e0
0x1001abb77: mov qword ptr [rip + 0x1c2e66e], 0 ; 0x101dda1f0
0x1001abb82: vmovaps xmmword ptr [rip + 0x1c2e676], xmm4 ; 0x101dda200
0x1001abb8a: lea rsi, [rip + 0x1c2e66f] ; 0x101dda200
0x1001abb91: mov qword ptr [rip + 0x1c2e678], rcx ; 0x101dda210
0x1001abb98: lea rcx, [rip + 0x9cbf0f] ; 0x100b77aae Rail
0x1001abb9f: vmovq xmm1, rcx
0x1001abba4: vpunpcklqdq xmm1, xmm3, xmm1
0x1001abba8: vmovdqa xmmword ptr [rip + 0x1c2e670], xmm1 ; 0x101dda220
0x1001abbb0: lea rcx, [rip + 0x1c2e669] ; 0x101dda220
0x1001abbb7: mov qword ptr [rip + 0x1c2e672], rsi ; 0x101dda230
0x1001abbbe: mov qword ptr [rip + 0xadd7d3], rcx ; 0x100c89398
0x1001abbc5: lea rcx, [rip + 0x9cbee7] ; 0x100b77ab3 leadTargets
0x1001abbcc: mov qword ptr [rip + 0xadd80d], rcx ; 0x100c893e0
0x1001abbd3: lea rcx, [rip + 0xadd806] ; 0x100c893e0
0x1001abbda: mov qword ptr [rip + 0xadd80f], rdx ; 0x100c893f0
0x1001abbe1: mov qword ptr [rip + 0xadd814], 0x30 ; 0x100c89400
0x1001abbec: mov qword ptr [rip + 0xadd815], rbx ; 0x100c89408
0x1001abbf3: mov qword ptr [rip + 0xadd816], rax ; 0x100c89410
0x1001abbfa: mov qword ptr [rip + 0xadd813], 0xffffffffffffffff ; 0x100c89418
0x1001abc05: mov qword ptr [rip + 0xadd814], r13 ; 0x100c89420
0x1001abc0c: mov qword ptr [rip + 0xadd811], 0 ; 0x100c89428
0x1001abc17: vmovaps xmmword ptr [rip + 0x1c2e621], xmm2 ; 0x101dda240
0x1001abc1f: lea rdx, [rip + 0x1c2e61a] ; 0x101dda240
0x1001abc26: mov qword ptr [rip + 0x1c2e61f], 0 ; 0x101dda250
0x1001abc31: vmovaps xmmword ptr [rip + 0x1c2e627], xmm4 ; 0x101dda260
0x1001abc39: lea rsi, [rip + 0x1c2e620] ; 0x101dda260
0x1001abc40: mov qword ptr [rip + 0x1c2e629], rdx ; 0x101dda270
0x1001abc47: vmovdqa xmmword ptr [rip + 0x1c2e631], xmm0 ; 0x101dda280
0x1001abc4f: lea rdx, [rip + 0x1c2e62a] ; 0x101dda280
0x1001abc56: mov qword ptr [rip + 0x1c2e633], rsi ; 0x101dda290
0x1001abc5d: mov qword ptr [rip + 0xadd784], rdx ; 0x100c893e8
0x1001abc64: lea rdx, [rip + 0x9cbe54] ; 0x100b77abf endLeadTarget
0x1001abc6b: mov qword ptr [rip + 0xadd7be], rdx ; 0x100c89430
0x1001abc72: lea rdx, [rip + 0xadd7b7] ; 0x100c89430
0x1001abc79: mov qword ptr [rip + 0xadd7c0], rcx ; 0x100c89440
0x1001abc80: mov qword ptr [rip + 0xadd7c5], 0x38 ; 0x100c89450
0x1001abc8b: mov rdi, qword ptr [rip + 0xa5b696] ; 0x100c07328 -> 0x10003a510 __Z17GetMetaTypeByTypeIP6MarkerERK8MetaTypev
0x1001abc92: mov qword ptr [rip + 0xadd7bf], rdi ; 0x100c89458
0x1001abc99: mov qword ptr [rip + 0xadd7c0], rax ; 0x100c89460
0x1001abca0: mov qword ptr [rip + 0xadd7bd], 0xffffffffffffffff ; 0x100c89468
0x1001abcab: mov qword ptr [rip + 0xadd7be], r13 ; 0x100c89470
0x1001abcb2: mov qword ptr [rip + 0xadd7bb], 0 ; 0x100c89478
0x1001abcbd: vmovaps xmmword ptr [rip + 0x1c2e5db], xmm2 ; 0x101dda2a0
0x1001abcc5: lea rcx, [rip + 0x1c2e5d4] ; 0x101dda2a0
0x1001abccc: mov qword ptr [rip + 0x1c2e5d9], 0 ; 0x101dda2b0
0x1001abcd7: vmovaps xmmword ptr [rip + 0x1c2e5e1], xmm4 ; 0x101dda2c0
0x1001abcdf: lea rsi, [rip + 0x1c2e5da] ; 0x101dda2c0
0x1001abce6: mov qword ptr [rip + 0x1c2e5e3], rcx ; 0x101dda2d0
0x1001abced: mov qword ptr [rip + 0xadd744], rsi ; 0x100c89438
0x1001abcf4: lea rcx, [rip + 0x9cbdd2] ; 0x100b77acd evadeTarget
0x1001abcfb: mov qword ptr [rip + 0xadd77e], rcx ; 0x100c89480
0x1001abd02: lea rcx, [rip + 0xadd777] ; 0x100c89480
0x1001abd09: mov qword ptr [rip + 0xadd780], rdx ; 0x100c89490
0x1001abd10: mov qword ptr [rip + 0xadd785], 0x20 ; 0x100c894a0
0x1001abd1b: mov qword ptr [rip + 0xadd786], rdi ; 0x100c894a8
0x1001abd22: mov qword ptr [rip + 0xadd787], rax ; 0x100c894b0
0x1001abd29: mov qword ptr [rip + 0xadd784], 0xffffffffffffffff ; 0x100c894b8
0x1001abd34: mov qword ptr [rip + 0xadd785], r13 ; 0x100c894c0
0x1001abd3b: mov qword ptr [rip + 0xadd782], 0 ; 0x100c894c8
0x1001abd46: vmovaps xmmword ptr [rip + 0x1c2e592], xmm2 ; 0x101dda2e0
0x1001abd4e: lea rdx, [rip + 0x1c2e58b] ; 0x101dda2e0
0x1001abd55: mov qword ptr [rip + 0x1c2e590], 0 ; 0x101dda2f0
0x1001abd60: vmovaps xmmword ptr [rip + 0x1c2e598], xmm4 ; 0x101dda300
0x1001abd68: lea rsi, [rip + 0x1c2e591] ; 0x101dda300
0x1001abd6f: mov qword ptr [rip + 0x1c2e59a], rdx ; 0x101dda310
0x1001abd76: mov qword ptr [rip + 0xadd70b], rsi ; 0x100c89488
0x1001abd7d: lea rdx, [rip + 0x9cbd55] ; 0x100b77ad9 flockSeparation
0x1001abd84: mov qword ptr [rip + 0xadd745], rdx ; 0x100c894d0
0x1001abd8b: lea rdx, [rip + 0xadd73e] ; 0x100c894d0
0x1001abd92: mov qword ptr [rip + 0xadd747], rcx ; 0x100c894e0
0x1001abd99: mov qword ptr [rip + 0xadd74c], 0x44 ; 0x100c894f0
0x1001abda4: mov rbx, r15
0x1001abda7: mov qword ptr [rip + 0xadd74a], rbx ; 0x100c894f8
0x1001abdae: mov qword ptr [rip + 0xadd74b], rax ; 0x100c89500
0x1001abdb5: mov qword ptr [rip + 0xadd748], 0xffffffffffffffff ; 0x100c89508
0x1001abdc0: mov qword ptr [rip + 0xadd749], r13 ; 0x100c89510
0x1001abdc7: mov qword ptr [rip + 0xadd746], 0 ; 0x100c89518
0x1001abdd2: lea rcx, [rip + 0x9cbd10] ; 0x100b77ae9 Flocking
0x1001abdd9: vmovq xmm0, rcx
0x1001abdde: vmovdqa xmm1, xmmword ptr [rbp - 0x80]
0x1001abde3: vpunpcklqdq xmm0, xmm1, xmm0
0x1001abde7: vmovdqa xmmword ptr [rip + 0x1c2e531], xmm0 ; 0x101dda320
0x1001abdef: lea rcx, [rip + 0x1c2e52a] ; 0x101dda320
0x1001abdf6: mov qword ptr [rip + 0x1c2e52f], 0 ; 0x101dda330
0x1001abe01: mov qword ptr [rip + 0xadd6d0], rcx ; 0x100c894d8
0x1001abe08: lea rcx, [rip + 0x9cbce3] ; 0x100b77af2 flockAlignment
0x1001abe0f: mov qword ptr [rip + 0xadd70a], rcx ; 0x100c89520
0x1001abe16: lea rcx, [rip + 0xadd703] ; 0x100c89520
0x1001abe1d: mov qword ptr [rip + 0xadd70c], rdx ; 0x100c89530
0x1001abe24: mov qword ptr [rip + 0xadd711], 0x40 ; 0x100c89540
0x1001abe2f: mov qword ptr [rip + 0xadd712], rbx ; 0x100c89548
0x1001abe36: mov qword ptr [rip + 0xadd713], rax ; 0x100c89550
0x1001abe3d: mov qword ptr [rip + 0xadd710], 0xffffffffffffffff ; 0x100c89558
0x1001abe48: mov qword ptr [rip + 0xadd711], r13 ; 0x100c89560
0x1001abe4f: mov qword ptr [rip + 0xadd70e], 0 ; 0x100c89568
0x1001abe5a: vmovdqa xmmword ptr [rip + 0x1c2e4de], xmm0 ; 0x101dda340
0x1001abe62: lea rdx, [rip + 0x1c2e4d7] ; 0x101dda340
0x1001abe69: mov qword ptr [rip + 0x1c2e4dc], 0 ; 0x101dda350
0x1001abe74: mov qword ptr [rip + 0xadd6ad], rdx ; 0x100c89528
0x1001abe7b: lea rdx, [rip + 0x9cbc7f] ; 0x100b77b01 flockCohesion
0x1001abe82: mov qword ptr [rip + 0xadd6e7], rdx ; 0x100c89570
0x1001abe89: lea rdx, [rip + 0xadd6e0] ; 0x100c89570
0x1001abe90: mov qword ptr [rip + 0xadd6e9], rcx ; 0x100c89580
0x1001abe97: mov qword ptr [rip + 0xadd6ee], 0x48 ; 0x100c89590
0x1001abea2: mov qword ptr [rip + 0xadd6ef], rbx ; 0x100c89598
0x1001abea9: mov qword ptr [rip + 0xadd6f0], rax ; 0x100c895a0
0x1001abeb0: mov qword ptr [rip + 0xadd6ed], 0xffffffffffffffff ; 0x100c895a8
0x1001abebb: mov qword ptr [rip + 0xadd6ee], r13 ; 0x100c895b0
0x1001abec2: mov qword ptr [rip + 0xadd6eb], 0 ; 0x100c895b8
0x1001abecd: vmovdqa xmmword ptr [rip + 0x1c2e48b], xmm0 ; 0x101dda360
0x1001abed5: lea rcx, [rip + 0x1c2e484] ; 0x101dda360
0x1001abedc: mov qword ptr [rip + 0x1c2e489], 0 ; 0x101dda370
0x1001abee7: mov qword ptr [rip + 0xadd68a], rcx ; 0x100c89578
0x1001abeee: lea rcx, [rip + 0x9cbc1a] ; 0x100b77b0f flockRadius
0x1001abef5: mov qword ptr [rip + 0xadd6c4], rcx ; 0x100c895c0
0x1001abefc: lea rcx, [rip + 0xadd6bd] ; 0x100c895c0
0x1001abf03: mov qword ptr [rip + 0xadd6c6], rdx ; 0x100c895d0
0x1001abf0a: mov qword ptr [rip + 0xadd6cb], 0x4c ; 0x100c895e0
0x1001abf15: mov qword ptr [rip + 0xadd6cc], rbx ; 0x100c895e8
0x1001abf1c: mov qword ptr [rip + 0xadd6cd], rax ; 0x100c895f0
0x1001abf23: mov qword ptr [rip + 0xadd6ca], 0xffffffffffffffff ; 0x100c895f8
0x1001abf2e: mov qword ptr [rip + 0xadd6cb], r13 ; 0x100c89600
0x1001abf35: mov qword ptr [rip + 0xadd6c8], 0 ; 0x100c89608
0x1001abf40: vmovdqa xmmword ptr [rip + 0x1c2e438], xmm0 ; 0x101dda380
0x1001abf48: lea rdx, [rip + 0x1c2e431] ; 0x101dda380
0x1001abf4f: mov qword ptr [rip + 0x1c2e436], 0 ; 0x101dda390
0x1001abf5a: mov qword ptr [rip + 0xadd667], rdx ; 0x100c895c8
0x1001abf61: lea rdx, [rip + 0x9cbbb3] ; 0x100b77b1b wanderJitter
0x1001abf68: mov qword ptr [rip + 0xadd6a1], rdx ; 0x100c89610
0x1001abf6f: lea rdx, [rip + 0xadd69a] ; 0x100c89610
0x1001abf76: mov qword ptr [rip + 0xadd6a3], rcx ; 0x100c89620
0x1001abf7d: mov qword ptr [rip + 0xadd6a8], 0x50 ; 0x100c89630
0x1001abf88: mov qword ptr [rip + 0xadd6a9], rbx ; 0x100c89638
0x1001abf8f: mov qword ptr [rip + 0xadd6aa], rax ; 0x100c89640
0x1001abf96: mov qword ptr [rip + 0xadd6a7], 0xffffffffffffffff ; 0x100c89648
0x1001abfa1: mov qword ptr [rip + 0xadd6a8], r13 ; 0x100c89650
0x1001abfa8: mov qword ptr [rip + 0xadd6a5], 0 ; 0x100c89658
0x1001abfb3: lea rcx, [rip + 0x9cbb6e] ; 0x100b77b28 Wander
0x1001abfba: vmovq xmm0, rcx
0x1001abfbf: vpunpcklqdq xmm0, xmm1, xmm0
0x1001abfc3: vmovdqa xmmword ptr [rip + 0x1c2e3d5], xmm0 ; 0x101dda3a0
0x1001abfcb: lea rcx, [rip + 0x1c2e3ce] ; 0x101dda3a0
0x1001abfd2: mov qword ptr [rip + 0x1c2e3d3], 0 ; 0x101dda3b0
0x1001abfdd: mov qword ptr [rip + 0xadd634], rcx ; 0x100c89618
0x1001abfe4: lea rcx, [rip + 0x9cbb44] ; 0x100b77b2f wanderRadius
0x1001abfeb: mov qword ptr [rip + 0xadd66e], rcx ; 0x100c89660
0x1001abff2: lea rcx, [rip + 0xadd667] ; 0x100c89660
0x1001abff9: mov qword ptr [rip + 0xadd670], rdx ; 0x100c89670
0x1001ac000: mov qword ptr [rip + 0xadd675], 0x54 ; 0x100c89680
0x1001ac00b: mov qword ptr [rip + 0xadd676], rbx ; 0x100c89688
0x1001ac012: mov qword ptr [rip + 0xadd677], rax ; 0x100c89690
0x1001ac019: mov qword ptr [rip + 0xadd674], 0xffffffffffffffff ; 0x100c89698
0x1001ac024: mov qword ptr [rip + 0xadd675], r13 ; 0x100c896a0
0x1001ac02b: mov qword ptr [rip + 0xadd672], 0 ; 0x100c896a8
0x1001ac036: vmovdqa xmmword ptr [rip + 0x1c2e382], xmm0 ; 0x101dda3c0
0x1001ac03e: lea rdx, [rip + 0x1c2e37b] ; 0x101dda3c0
0x1001ac045: mov qword ptr [rip + 0x1c2e380], 0 ; 0x101dda3d0
0x1001ac050: mov qword ptr [rip + 0xadd611], rdx ; 0x100c89668
0x1001ac057: lea rdx, [rip + 0x9cbade] ; 0x100b77b3c wanderDistance
0x1001ac05e: mov qword ptr [rip + 0xadd64b], rdx ; 0x100c896b0
0x1001ac065: lea rdx, [rip + 0xadd644] ; 0x100c896b0
0x1001ac06c: mov qword ptr [rip + 0xadd64d], rcx ; 0x100c896c0
0x1001ac073: mov qword ptr [rip + 0xadd652], 0x58 ; 0x100c896d0
0x1001ac07e: mov qword ptr [rip + 0xadd653], rbx ; 0x100c896d8
0x1001ac085: mov qword ptr [rip + 0xadd654], rax ; 0x100c896e0
0x1001ac08c: mov qword ptr [rip + 0xadd651], 0xffffffffffffffff ; 0x100c896e8
0x1001ac097: mov qword ptr [rip + 0xadd652], r13 ; 0x100c896f0
0x1001ac09e: mov qword ptr [rip + 0xadd64f], 0 ; 0x100c896f8
0x1001ac0a9: vmovdqa xmmword ptr [rip + 0x1c2e32f], xmm0 ; 0x101dda3e0
0x1001ac0b1: lea rcx, [rip + 0x1c2e328] ; 0x101dda3e0
0x1001ac0b8: mov qword ptr [rip + 0x1c2e32d], 0 ; 0x101dda3f0
0x1001ac0c3: mov qword ptr [rip + 0xadd5ee], rcx ; 0x100c896b8
0x1001ac0ca: lea rcx, [rip + 0x9cba7a] ; 0x100b77b4b wanderYMult
0x1001ac0d1: mov qword ptr [rip + 0xadd628], rcx ; 0x100c89700
0x1001ac0d8: lea rcx, [rip + 0xadd621] ; 0x100c89700
0x1001ac0df: mov qword ptr [rip + 0xadd62a], rdx ; 0x100c89710
0x1001ac0e6: mov qword ptr [rip + 0xadd62f], 0x5c ; 0x100c89720
0x1001ac0f1: mov qword ptr [rip + 0xadd630], rbx ; 0x100c89728
0x1001ac0f8: mov qword ptr [rip + 0xadd631], rax ; 0x100c89730
0x1001ac0ff: mov qword ptr [rip + 0xadd62e], 0xffffffffffffffff ; 0x100c89738
0x1001ac10a: mov qword ptr [rip + 0xadd62f], r13 ; 0x100c89740
0x1001ac111: mov qword ptr [rip + 0xadd62c], 0 ; 0x100c89748
0x1001ac11c: vmovdqa xmmword ptr [rip + 0x1c2e2dc], xmm0 ; 0x101dda400
0x1001ac124: lea rdx, [rip + 0x1c2e2d5] ; 0x101dda400
0x1001ac12b: mov qword ptr [rip + 0x1c2e2da], 0 ; 0x101dda410
0x1001ac136: mov qword ptr [rip + 0xadd5cb], rdx ; 0x100c89708
0x1001ac13d: lea rdx, [rip + 0x9cba13] ; 0x100b77b57 arriveRadius
0x1001ac144: mov qword ptr [rip + 0xadd605], rdx ; 0x100c89750
0x1001ac14b: lea rdx, [rip + 0xadd5fe] ; 0x100c89750
0x1001ac152: mov qword ptr [rip + 0xadd607], rcx ; 0x100c89760
0x1001ac159: mov qword ptr [rip + 0xadd60c], 0x60 ; 0x100c89770
0x1001ac164: mov qword ptr [rip + 0xadd60d], rbx ; 0x100c89778
0x1001ac16b: mov qword ptr [rip + 0xadd60e], rax ; 0x100c89780
0x1001ac172: mov qword ptr [rip + 0xadd60b], 0xffffffffffffffff ; 0x100c89788
0x1001ac17d: mov qword ptr [rip + 0xadd60c], r13 ; 0x100c89790
0x1001ac184: mov qword ptr [rip + 0xadd609], 0 ; 0x100c89798
0x1001ac18f: lea rcx, [rip + 0x9cb9ce] ; 0x100b77b64 Arrive
0x1001ac196: vmovq xmm0, rcx
0x1001ac19b: vpunpcklqdq xmm0, xmm1, xmm0
0x1001ac19f: vmovdqa xmmword ptr [rip + 0x1c2e279], xmm0 ; 0x101dda420
0x1001ac1a7: lea rcx, [rip + 0x1c2e272] ; 0x101dda420
0x1001ac1ae: mov qword ptr [rip + 0x1c2e277], 0 ; 0x101dda430
0x1001ac1b9: mov qword ptr [rip + 0xadd598], rcx ; 0x100c89758
0x1001ac1c0: lea rcx, [rip + 0x9cb9a4] ; 0x100b77b6b weightSeek
0x1001ac1c7: mov qword ptr [rip + 0xadd5d2], rcx ; 0x100c897a0
0x1001ac1ce: lea rcx, [rip + 0xadd5cb] ; 0x100c897a0
0x1001ac1d5: mov qword ptr [rip + 0xadd5d4], rdx ; 0x100c897b0
0x1001ac1dc: mov qword ptr [rip + 0xadd5d9], 0x64 ; 0x100c897c0
0x1001ac1e7: mov qword ptr [rip + 0xadd5da], rbx ; 0x100c897c8
0x1001ac1ee: mov qword ptr [rip + 0xadd5db], rax ; 0x100c897d0
0x1001ac1f5: mov qword ptr [rip + 0xadd5d8], 0xffffffffffffffff ; 0x100c897d8
0x1001ac200: mov qword ptr [rip + 0xadd5d9], r13 ; 0x100c897e0
0x1001ac207: mov qword ptr [rip + 0xadd5d6], 0 ; 0x100c897e8
0x1001ac212: lea rdx, [rip + 0x9c7f35] ; 0x100b7414e 1.0
0x1001ac219: vmovq xmm0, rdx
0x1001ac21e: vmovdqa xmm2, xmmword ptr [rbp - 0xa0]
0x1001ac226: vpunpcklqdq xmm0, xmm2, xmm0
0x1001ac22a: vmovdqa xmmword ptr [rip + 0x1c2e20e], xmm0 ; 0x101dda440
0x1001ac232: vmovdqa xmm3, xmm0
0x1001ac236: lea rdx, [rip + 0x1c2e203] ; 0x101dda440
0x1001ac23d: mov qword ptr [rip + 0x1c2e208], 0 ; 0x101dda450
0x1001ac248: lea rsi, [rip + 0x9cb927] ; 0x100b77b76 SteeringWeights
0x1001ac24f: vmovq xmm0, rsi
0x1001ac254: vpunpcklqdq xmm0, xmm1, xmm0
0x1001ac258: vmovdqa xmmword ptr [rip + 0x1c2e200], xmm0 ; 0x101dda460
0x1001ac260: lea rsi, [rip + 0x1c2e1f9] ; 0x101dda460
0x1001ac267: mov qword ptr [rip + 0x1c2e202], rdx ; 0x101dda470
0x1001ac26e: mov qword ptr [rip + 0xadd533], rsi ; 0x100c897a8
0x1001ac275: lea rdx, [rip + 0x9cb90a] ; 0x100b77b86 weightWallAvoid
0x1001ac27c: mov qword ptr [rip + 0xadd56d], rdx ; 0x100c897f0
0x1001ac283: lea rdx, [rip + 0xadd566] ; 0x100c897f0
0x1001ac28a: mov qword ptr [rip + 0xadd56f], rcx ; 0x100c89800
0x1001ac291: mov qword ptr [rip + 0xadd574], 0x68 ; 0x100c89810
0x1001ac29c: mov qword ptr [rip + 0xadd575], rbx ; 0x100c89818
0x1001ac2a3: mov qword ptr [rip + 0xadd576], rax ; 0x100c89820
0x1001ac2aa: mov qword ptr [rip + 0xadd573], 0xffffffffffffffff ; 0x100c89828
0x1001ac2b5: mov qword ptr [rip + 0xadd574], r13 ; 0x100c89830
0x1001ac2bc: mov qword ptr [rip + 0xadd571], 0 ; 0x100c89838
0x1001ac2c7: lea rcx, [rip + 0x9c7e46] ; 0x100b74114 0.0
0x1001ac2ce: vmovq xmm1, rcx
0x1001ac2d3: vpunpcklqdq xmm1, xmm2, xmm1
0x1001ac2d7: vmovdqa xmmword ptr [rip + 0x1c2e1a1], xmm1 ; 0x101dda480
0x1001ac2df: lea rcx, [rip + 0x1c2e19a] ; 0x101dda480
0x1001ac2e6: mov qword ptr [rip + 0x1c2e19f], 0 ; 0x101dda490
0x1001ac2f1: vmovdqa xmmword ptr [rip + 0x1c2e1a7], xmm0 ; 0x101dda4a0
0x1001ac2f9: lea rsi, [rip + 0x1c2e1a0] ; 0x101dda4a0
0x1001ac300: mov qword ptr [rip + 0x1c2e1a9], rcx ; 0x101dda4b0
0x1001ac307: mov qword ptr [rip + 0xadd4ea], rsi ; 0x100c897f8
0x1001ac30e: lea rcx, [rip + 0x9cb881] ; 0x100b77b96 weightEvade
0x1001ac315: mov qword ptr [rip + 0xadd524], rcx ; 0x100c89840
0x1001ac31c: lea rcx, [rip + 0xadd51d] ; 0x100c89840
0x1001ac323: mov qword ptr [rip + 0xadd526], rdx ; 0x100c89850
0x1001ac32a: mov qword ptr [rip + 0xadd52b], 0x6c ; 0x100c89860
0x1001ac335: mov qword ptr [rip + 0xadd52c], rbx ; 0x100c89868
0x1001ac33c: mov qword ptr [rip + 0xadd52d], rax ; 0x100c89870
0x1001ac343: mov qword ptr [rip + 0xadd52a], 0xffffffffffffffff ; 0x100c89878
0x1001ac34e: mov qword ptr [rip + 0xadd52b], r13 ; 0x100c89880
0x1001ac355: mov qword ptr [rip + 0xadd528], 0 ; 0x100c89888
0x1001ac360: vmovdqa xmmword ptr [rip + 0x1c2e158], xmm3 ; 0x101dda4c0
0x1001ac368: lea rdx, [rip + 0x1c2e151] ; 0x101dda4c0
0x1001ac36f: mov qword ptr [rip + 0x1c2e156], 0 ; 0x101dda4d0
0x1001ac37a: vmovdqa xmmword ptr [rip + 0x1c2e15e], xmm0 ; 0x101dda4e0
0x1001ac382: lea rsi, [rip + 0x1c2e157] ; 0x101dda4e0
0x1001ac389: mov qword ptr [rip + 0x1c2e160], rdx ; 0x101dda4f0
0x1001ac390: mov qword ptr [rip + 0xadd4b1], rsi ; 0x100c89848
0x1001ac397: lea rdx, [rip + 0x9cb804] ; 0x100b77ba2 weightFlock
0x1001ac39e: mov qword ptr [rip + 0xadd4eb], rdx ; 0x100c89890
0x1001ac3a5: lea rdx, [rip + 0xadd4e4] ; 0x100c89890
0x1001ac3ac: mov qword ptr [rip + 0xadd4ed], rcx ; 0x100c898a0
0x1001ac3b3: mov qword ptr [rip + 0xadd4f2], 0x70 ; 0x100c898b0
0x1001ac3be: mov qword ptr [rip + 0xadd4f3], rbx ; 0x100c898b8
0x1001ac3c5: mov qword ptr [rip + 0xadd4f4], rax ; 0x100c898c0
0x1001ac3cc: mov qword ptr [rip + 0xadd4f1], 0xffffffffffffffff ; 0x100c898c8
0x1001ac3d7: mov qword ptr [rip + 0xadd4f2], r13 ; 0x100c898d0
0x1001ac3de: mov qword ptr [rip + 0xadd4ef], 0 ; 0x100c898d8
0x1001ac3e9: vmovdqa xmmword ptr [rip + 0x1c2e10f], xmm3 ; 0x101dda500
0x1001ac3f1: lea rcx, [rip + 0x1c2e108] ; 0x101dda500
0x1001ac3f8: mov qword ptr [rip + 0x1c2e10d], 0 ; 0x101dda510
0x1001ac403: vmovdqa xmmword ptr [rip + 0x1c2e115], xmm0 ; 0x101dda520
0x1001ac40b: lea rsi, [rip + 0x1c2e10e] ; 0x101dda520
0x1001ac412: mov qword ptr [rip + 0x1c2e117], rcx ; 0x101dda530
0x1001ac419: mov qword ptr [rip + 0xadd478], rsi ; 0x100c89898
0x1001ac420: lea rcx, [rip + 0x9cb787] ; 0x100b77bae weightWander
0x1001ac427: mov qword ptr [rip + 0xadd4b2], rcx ; 0x100c898e0
0x1001ac42e: lea rcx, [rip + 0xadd4ab] ; 0x100c898e0
0x1001ac435: mov qword ptr [rip + 0xadd4b4], rdx ; 0x100c898f0
0x1001ac43c: mov qword ptr [rip + 0xadd4b9], 0x74 ; 0x100c89900
0x1001ac447: mov qword ptr [rip + 0xadd4ba], rbx ; 0x100c89908
0x1001ac44e: mov qword ptr [rip + 0xadd4bb], rax ; 0x100c89910
0x1001ac455: mov qword ptr [rip + 0xadd4b8], 0xffffffffffffffff ; 0x100c89918
0x1001ac460: mov qword ptr [rip + 0xadd4b9], r13 ; 0x100c89920
0x1001ac467: mov qword ptr [rip + 0xadd4b6], 0 ; 0x100c89928
0x1001ac472: vmovdqa xmmword ptr [rip + 0x1c2e0c6], xmm3 ; 0x101dda540
0x1001ac47a: vmovdqa xmmword ptr [rbp - 0x90], xmm3
0x1001ac482: lea rdx, [rip + 0x1c2e0b7] ; 0x101dda540
0x1001ac489: mov qword ptr [rip + 0x1c2e0bc], 0 ; 0x101dda550
0x1001ac494: vmovdqa xmmword ptr [rip + 0x1c2e0c4], xmm0 ; 0x101dda560
0x1001ac49c: lea rsi, [rip + 0x1c2e0bd] ; 0x101dda560
0x1001ac4a3: mov qword ptr [rip + 0x1c2e0c6], rdx ; 0x101dda570
0x1001ac4aa: mov qword ptr [rip + 0xadd437], rsi ; 0x100c898e8
0x1001ac4b1: lea rdx, [rip + 0x9cb703] ; 0x100b77bbb weightArrive
0x1001ac4b8: mov qword ptr [rip + 0xadd471], rdx ; 0x100c89930
0x1001ac4bf: lea rdx, [rip + 0xadd46a] ; 0x100c89930
0x1001ac4c6: mov qword ptr [rip + 0xadd473], rcx ; 0x100c89940
0x1001ac4cd: mov qword ptr [rip + 0xadd478], 0x78 ; 0x100c89950
0x1001ac4d8: mov qword ptr [rip + 0xadd479], rbx ; 0x100c89958
0x1001ac4df: mov qword ptr [rip + 0xadd47a], rax ; 0x100c89960
0x1001ac4e6: mov qword ptr [rip + 0xadd477], 0xffffffffffffffff ; 0x100c89968
0x1001ac4f1: mov qword ptr [rip + 0xadd478], r13 ; 0x100c89970
0x1001ac4f8: mov qword ptr [rip + 0xadd475], 0 ; 0x100c89978
0x1001ac503: vmovdqa xmmword ptr [rip + 0x1c2e075], xmm1 ; 0x101dda580
0x1001ac50b: lea rcx, [rip + 0x1c2e06e] ; 0x101dda580
0x1001ac512: mov qword ptr [rip + 0x1c2e073], 0 ; 0x101dda590
0x1001ac51d: vmovdqa xmmword ptr [rip + 0x1c2e07b], xmm0 ; 0x101dda5a0
0x1001ac525: lea rsi, [rip + 0x1c2e074] ; 0x101dda5a0
0x1001ac52c: mov qword ptr [rip + 0x1c2e07d], rcx ; 0x101dda5b0
0x1001ac533: mov qword ptr [rip + 0xadd3fe], rsi ; 0x100c89938
0x1001ac53a: lea rcx, [rip + 0x9cb687] ; 0x100b77bc8 weightAvatarFollow
0x1001ac541: mov qword ptr [rip + 0xadd438], rcx ; 0x100c89980
0x1001ac548: lea rcx, [rip + 0xadd431] ; 0x100c89980
0x1001ac54f: mov qword ptr [rip + 0xadd43a], rdx ; 0x100c89990
0x1001ac556: mov qword ptr [rip + 0xadd43f], 0x7c ; 0x100c899a0
0x1001ac561: mov qword ptr [rip + 0xadd440], rbx ; 0x100c899a8
0x1001ac568: mov qword ptr [rip + 0xadd441], rax ; 0x100c899b0
0x1001ac56f: mov qword ptr [rip + 0xadd43e], 0xffffffffffffffff ; 0x100c899b8
0x1001ac57a: mov qword ptr [rip + 0xadd43f], r13 ; 0x100c899c0
0x1001ac581: mov qword ptr [rip + 0xadd43c], 0 ; 0x100c899c8
0x1001ac58c: vmovdqa xmmword ptr [rip + 0x1c2e02c], xmm1 ; 0x101dda5c0
0x1001ac594: lea rdx, [rip + 0x1c2e025] ; 0x101dda5c0
0x1001ac59b: mov qword ptr [rip + 0x1c2e02a], 0 ; 0x101dda5d0
0x1001ac5a6: vmovdqa xmmword ptr [rip + 0x1c2e032], xmm0 ; 0x101dda5e0
0x1001ac5ae: lea rsi, [rip + 0x1c2e02b] ; 0x101dda5e0
0x1001ac5b5: mov qword ptr [rip + 0x1c2e034], rdx ; 0x101dda5f0
0x1001ac5bc: mov qword ptr [rip + 0xadd3c5], rsi ; 0x100c89988
0x1001ac5c3: lea rdx, [rip + 0x9cb611] ; 0x100b77bdb weightAvatarEvade
0x1001ac5ca: mov qword ptr [rip + 0xadd3ff], rdx ; 0x100c899d0
0x1001ac5d1: lea rdx, [rip + 0xadd3f8] ; 0x100c899d0
0x1001ac5d8: mov qword ptr [rip + 0xadd401], rcx ; 0x100c899e0
0x1001ac5df: mov qword ptr [rip + 0xadd406], 0x80 ; 0x100c899f0
0x1001ac5ea: mov qword ptr [rip + 0xadd407], rbx ; 0x100c899f8
0x1001ac5f1: mov qword ptr [rip + 0xadd408], rax ; 0x100c89a00
0x1001ac5f8: mov qword ptr [rip + 0xadd405], 0xffffffffffffffff ; 0x100c89a08
0x1001ac603: mov qword ptr [rip + 0xadd406], r13 ; 0x100c89a10
0x1001ac60a: mov qword ptr [rip + 0xadd403], 0 ; 0x100c89a18
0x1001ac615: vmovdqa xmmword ptr [rip + 0x1c2dfe3], xmm3 ; 0x101dda600
0x1001ac61d: lea rcx, [rip + 0x1c2dfdc] ; 0x101dda600
0x1001ac624: mov qword ptr [rip + 0x1c2dfe1], 0 ; 0x101dda610
0x1001ac62f: vmovdqa xmmword ptr [rip + 0x1c2dfe9], xmm0 ; 0x101dda620
0x1001ac637: lea rsi, [rip + 0x1c2dfe2] ; 0x101dda620
0x1001ac63e: mov qword ptr [rip + 0x1c2dfeb], rcx ; 0x101dda630
0x1001ac645: mov qword ptr [rip + 0xadd38c], rsi ; 0x100c899d8
0x1001ac64c: lea rcx, [rip + 0x9cb59a] ; 0x100b77bed weightPerch
0x1001ac653: mov qword ptr [rip + 0xadd3c6], rcx ; 0x100c89a20
0x1001ac65a: lea rcx, [rip + 0xadd3bf] ; 0x100c89a20
0x1001ac661: mov qword ptr [rip + 0xadd3c8], rdx ; 0x100c89a30
0x1001ac668: mov qword ptr [rip + 0xadd3cd], 0x84 ; 0x100c89a40
0x1001ac673: mov qword ptr [rip + 0xadd3ce], rbx ; 0x100c89a48
0x1001ac67a: mov qword ptr [rip + 0xadd3cf], rax ; 0x100c89a50
0x1001ac681: mov qword ptr [rip + 0xadd3cc], 0xffffffffffffffff ; 0x100c89a58
0x1001ac68c: mov qword ptr [rip + 0xadd3cd], r13 ; 0x100c89a60
0x1001ac693: mov qword ptr [rip + 0xadd3ca], 0 ; 0x100c89a68
0x1001ac69e: lea rdx, [rip + 0x9c8e5a] ; 0x100b754ff 0.25
0x1001ac6a5: vmovq xmm0, rdx
0x1001ac6aa: vpunpcklqdq xmm0, xmm2, xmm0
0x1001ac6ae: vmovdqa xmmword ptr [rip + 0x1c2df8a], xmm0 ; 0x101dda640
0x1001ac6b6: lea rdx, [rip + 0x1c2df83] ; 0x101dda640
0x1001ac6bd: mov qword ptr [rip + 0x1c2df88], 0 ; 0x101dda650
0x1001ac6c8: mov qword ptr [rip + 0xadd359], rdx ; 0x100c89a28
0x1001ac6cf: lea rdx, [rip + 0x9cb523] ; 0x100b77bf9 startStuck
0x1001ac6d6: mov qword ptr [rip + 0xadd393], rdx ; 0x100c89a70
0x1001ac6dd: lea rdx, [rip + 0xadd38c] ; 0x100c89a70
0x1001ac6e4: mov qword ptr [rip + 0xadd395], rcx ; 0x100c89a80
0x1001ac6eb: mov qword ptr [rip + 0xacb56e], rdx ; 0x100c77c60
0x1001ac6f2: mov qword ptr [rip + 0xadd393], 0x88 ; 0x100c89a90
0x1001ac6fd: mov qword ptr [rip + 0xadd394], r14 ; 0x100c89a98
0x1001ac704: mov qword ptr [rip + 0xadd395], rax ; 0x100c89aa0
0x1001ac70b: mov qword ptr [rip + 0xadd392], 0xffffffffffffffff ; 0x100c89aa8
0x1001ac716: mov qword ptr [rip + 0xadd393], r13 ; 0x100c89ab0
0x1001ac71d: mov qword ptr [rip + 0xadd390], 0 ; 0x100c89ab8
0x1001ac728: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x1001ac730: vmovaps xmmword ptr [rip + 0x1c2df28], xmm0 ; 0x101dda660
0x1001ac738: lea rax, [rip + 0x1c2df21] ; 0x101dda660
0x1001ac73f: mov qword ptr [rip + 0x1c2df26], 0 ; 0x101dda670
0x1001ac74a: mov qword ptr [rip + 0xadd327], rax ; 0x100c89a78
0x1001ac751: lea rax, [rip + 0x9cb4ac] ; 0x100b77c04 BirdV2Ai
0x1001ac758: mov qword ptr [rip + 0x1c2df21], rax ; 0x101dda680
0x1001ac75f: lea rax, [rip + 0x1c2df12] ; 0x101dda678
0x1001ac766: mov qword ptr [rip + 0x1c2df17], 0 ; 0x101dda688
0x1001ac771: mov rcx, qword ptr [rip + 0xac37e0] ; 0x100c6ff58
0x1001ac778: mov qword ptr [rip + 0x1c2df11], rcx ; 0x101dda690
0x1001ac77f: mov qword ptr [rip + 0xac37d2], rax ; 0x100c6ff58
0x1001ac786: mov qword ptr [rip + 0x1c2df13], rax ; 0x101dda6a0
0x1001ac78d: lea rax, [rip - 0x176ed4] ; 0x1000358c0
0x1001ac794: mov qword ptr [rip + 0x1c2df0d], rax ; 0x101dda6a8
0x1001ac79b: mov dword ptr [rip + 0x1c2df0b], 0xffffffff ; 0x101dda6b0
0x1001ac7a5: mov dword ptr [rip + 0x1c2df05], 0xffffffff ; 0x101dda6b4
0x1001ac7af: mov qword ptr [rip + 0x1c2df16], 0 ; 0x101dda6d0
0x1001ac7ba: mov rax, qword ptr [rip + 0xa5fea7] ; 0x100c0c668
0x1001ac7c1: add rax, 0x10
0x1001ac7c5: mov qword ptr [rip + 0x1c2deac], rax ; 0x101dda678
0x1001ac7cc: xor eax, eax
0x1001ac7ce: call 0x100011c10 ; 0x100011c10
0x1001ac7d3: lea rsi, [rip + 0x9cb433] ; 0x100b77c0d HandleGo
0x1001ac7da: mov qword ptr [rip + 0x1c2def7], rsi ; 0x101dda6d8
0x1001ac7e1: lea rax, [rip + 0x1c2def0] ; 0x101dda6d8
0x1001ac7e8: mov qword ptr [rip + 0x1c2deed], 0 ; 0x101dda6e0
0x1001ac7f3: mov rcx, qword ptr [rip + 0xac3766] ; 0x100c6ff60
0x1001ac7fa: mov qword ptr [rip + 0x1c2dee7], rcx ; 0x101dda6e8
0x1001ac801: mov qword ptr [rip + 0xac3758], rax ; 0x100c6ff60
0x1001ac808: lea rcx, [rip - 0xc9ff] ; 0x10019fe10
0x1001ac80f: vmovq xmm0, rcx
0x1001ac814: vmovdqu xmmword ptr [rip + 0x1c2def4], xmm0 ; 0x101dda710
0x1001ac81c: mov rax, qword ptr [rip + 0xa59cb5] ; 0x100c064d8 -> 0x1001a7850 __Z12ApplyWrapperI8BirdV2AiMS0_FvPK13CritterMsg_GoEEvM9VoidClassFvvEPv8VariablePSA_j
0x1001ac823: mov qword ptr [rip + 0x1c2def6], rax ; 0x101dda720
0x1001ac82a: mov rax, qword ptr [rip + 0xa5d537] ; 0x100c09d68 -> 0x1001a78f0 __Z21InitFunctionSignatureIM8BirdV2AiFvPK13CritterMsg_GoEEvP17FunctionSignature
0x1001ac831: mov qword ptr [rip + 0x1c2def0], rax ; 0x101dda728
0x1001ac838: mov rbx, qword ptr [rip + 0xa5bf81] ; 0x100c087c0 -> 0x1001a7840 __Z18GetMetaClassByTypeIP8BirdV2AiERK9MetaClassv
0x1001ac83f: mov qword ptr [rip + 0x1c2deea], rbx ; 0x101dda730
0x1001ac846: lea rdi, [rip + 0x1c2deeb] ; 0x101dda738
0x1001ac84d: lea rdx, [rip + 0x9cb3c2] ; 0x100b77c16 CritterMsg_Go
0x1001ac854: xor r8d, r8d
0x1001ac857: call 0x1001a7970 ; 0x1001a7970
0x1001ac85c: lea rsi, [rip + 0x9cb3c1] ; 0x100b77c24 HandleStop
0x1001ac863: mov qword ptr [rip + 0x1c2ded6], rsi ; 0x101dda740
0x1001ac86a: lea rax, [rip + 0x1c2decf] ; 0x101dda740
0x1001ac871: mov qword ptr [rip + 0x1c2decc], 0 ; 0x101dda748
0x1001ac87c: mov rcx, qword ptr [rip + 0xac36dd] ; 0x100c6ff60
0x1001ac883: mov qword ptr [rip + 0x1c2dec6], rcx ; 0x101dda750
0x1001ac88a: mov qword ptr [rip + 0xac36cf], rax ; 0x100c6ff60
0x1001ac891: lea rcx, [rip - 0xca18] ; 0x10019fe80
0x1001ac898: vmovq xmm0, rcx
0x1001ac89d: vmovdqu xmmword ptr [rip + 0x1c2ded3], xmm0 ; 0x101dda778
0x1001ac8a5: mov rax, qword ptr [rip + 0xa59c34] ; 0x100c064e0 -> 0x1001a8270 __Z12ApplyWrapperI8BirdV2AiMS0_FvPK15CritterMsg_StopEEvM9VoidClassFvvEPv8VariablePSA_j
0x1001ac8ac: mov qword ptr [rip + 0x1c2ded5], rax ; 0x101dda788
0x1001ac8b3: mov rax, qword ptr [rip + 0xa5d4b6] ; 0x100c09d70 -> 0x1001a8310 __Z21InitFunctionSignatureIM8BirdV2AiFvPK15CritterMsg_StopEEvP17FunctionSignature
0x1001ac8ba: mov qword ptr [rip + 0x1c2decf], rax ; 0x101dda790
0x1001ac8c1: mov qword ptr [rip + 0x1c2ded0], rbx ; 0x101dda798
0x1001ac8c8: lea rdi, [rip + 0x1c2ded1] ; 0x101dda7a0
0x1001ac8cf: lea rdx, [rip + 0x9cb359] ; 0x100b77c2f CritterMsg_Stop
0x1001ac8d6: xor r8d, r8d
0x1001ac8d9: call 0x1001a8390 ; 0x1001a8390
0x1001ac8de: lea r15, [rip + 0x9cb35a] ; 0x100b77c3f BirdV2
0x1001ac8e5: mov qword ptr [rip + 0x1c2dec4], r15 ; 0x101dda7b0
0x1001ac8ec: lea rax, [rip + 0x1c2deb5] ; 0x101dda7a8
0x1001ac8f3: mov qword ptr [rip + 0x1c2deba], 0 ; 0x101dda7b8
0x1001ac8fe: mov rcx, qword ptr [rip + 0xac3653] ; 0x100c6ff58
0x1001ac905: mov qword ptr [rip + 0x1c2deb4], rcx ; 0x101dda7c0
0x1001ac90c: mov qword ptr [rip + 0xac3645], rax ; 0x100c6ff58
0x1001ac913: mov qword ptr [rip + 0x1c2deb6], rax ; 0x101dda7d0
0x1001ac91a: mov rax, qword ptr [rip + 0xa5c05f] ; 0x100c08980 -> 0x1001a85d0 __Z18GetMetaClassByTypeIP9CritterV2ERK9MetaClassv
0x1001ac921: mov qword ptr [rip + 0x1c2deb0], rax ; 0x101dda7d8
0x1001ac928: mov qword ptr [rip + 0x1c2dead], 0xffffffffffffffff ; 0x101dda7e0
0x1001ac933: mov qword ptr [rip + 0x1c2dec2], 0 ; 0x101dda800
0x1001ac93e: mov rax, qword ptr [rip + 0xa5fb83] ; 0x100c0c4c8
0x1001ac945: add rax, 0x10
0x1001ac949: mov qword ptr [rip + 0x1c2de58], rax ; 0x101dda7a8
0x1001ac950: xor eax, eax
0x1001ac952: call 0x100011c10 ; 0x100011c10
0x1001ac957: lea rax, [rip + 0x9cb2e8] ; 0x100b77c46 boidParams
0x1001ac95e: mov qword ptr [rip + 0xadd15b], rax ; 0x100c89ac0
0x1001ac965: lea rcx, [rip + 0xadd154] ; 0x100c89ac0
0x1001ac96c: mov qword ptr [rip + 0xadd151], 0 ; 0x100c89ac8
0x1001ac977: mov rax, qword ptr [rip + 0xacb2e2] ; 0x100c77c60
0x1001ac97e: mov qword ptr [rip + 0xadd14b], rax ; 0x100c89ad0
0x1001ac985: mov qword ptr [rip + 0xadd150], 0x78 ; 0x100c89ae0
0x1001ac990: mov rax, qword ptr [rip + 0xa5a5e1] ; 0x100c06f78 -> 0x1001a89f0 __Z17GetMetaTypeByTypeIP12BirdV2ParamsERK8MetaTypev
0x1001ac997: mov qword ptr [rip + 0xadd14a], rax ; 0x100c89ae8
0x1001ac99e: mov rax, qword ptr [rip + 0xa5bcbb] ; 0x100c08660 -> 0x1001a89c0 __Z18GetMetaClassByTypeIP6BirdV2ERK9MetaClassv
0x1001ac9a5: mov qword ptr [rip + 0xadd144], rax ; 0x100c89af0
0x1001ac9ac: mov qword ptr [rip + 0xadd141], 0xffffffffffffffff ; 0x100c89af8
0x1001ac9b7: mov qword ptr [rip + 0xadd142], r13 ; 0x100c89b00
0x1001ac9be: mov qword ptr [rip + 0xadd13f], 0 ; 0x100c89b08
0x1001ac9c9: lea rdx, [rip + 0x9cb281] ; 0x100b77c51 aiParams
0x1001ac9d0: mov qword ptr [rip + 0xadd139], rdx ; 0x100c89b10
0x1001ac9d7: lea rdx, [rip + 0xadd132] ; 0x100c89b10
0x1001ac9de: mov qword ptr [rip + 0xadd12f], 0 ; 0x100c89b18
0x1001ac9e9: mov qword ptr [rip + 0xadd130], rcx ; 0x100c89b20
0x1001ac9f0: mov qword ptr [rip + 0xadd135], 0x80 ; 0x100c89b30
0x1001ac9fb: mov rcx, qword ptr [rip + 0xa5a656] ; 0x100c07058 -> 0x1001a8a00 __Z17GetMetaTypeByTypeIP14BirdV2AiParamsERK8MetaTypev
0x1001aca02: mov qword ptr [rip + 0xadd12f], rcx ; 0x100c89b38
0x1001aca09: mov qword ptr [rip + 0xadd130], rax ; 0x100c89b40
0x1001aca10: mov qword ptr [rip + 0xadd12d], 0xffffffffffffffff ; 0x100c89b48
0x1001aca1b: mov qword ptr [rip + 0xadd12e], r13 ; 0x100c89b50
0x1001aca22: mov qword ptr [rip + 0xadd12b], 0 ; 0x100c89b58
0x1001aca2d: lea rcx, [rip + 0x9ca61a] ; 0x100b7704e SetEnabled
0x1001aca34: mov qword ptr [rip + 0x1c2ddcd], rcx ; 0x101dda808
0x1001aca3b: lea rsi, [rip + 0x1c2ddc6] ; 0x101dda808
0x1001aca42: mov qword ptr [rip + 0x1c2ddc3], 0 ; 0x101dda810
0x1001aca4d: mov rcx, qword ptr [rip + 0xac350c] ; 0x100c6ff60
0x1001aca54: mov qword ptr [rip + 0x1c2ddbd], rcx ; 0x101dda818
0x1001aca5b: lea rcx, [rip - 0xcbb2] ; 0x10019feb0
0x1001aca62: vmovq xmm0, rcx
0x1001aca67: vmovdqu xmmword ptr [rip + 0x1c2ddd1], xmm0 ; 0x101dda840
0x1001aca6f: mov rcx, qword ptr [rip + 0xa598c2] ; 0x100c06338 -> 0x1001a8a10 __Z12ApplyWrapperI6BirdV2MS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001aca76: mov qword ptr [rip + 0x1c2ddd3], rcx ; 0x101dda850
0x1001aca7d: mov rcx, qword ptr [rip + 0xa5d144] ; 0x100c09bc8 -> 0x1001a8ab0 __Z21InitFunctionSignatureIM6BirdV2FvbEEvP17FunctionSignature
0x1001aca84: mov qword ptr [rip + 0x1c2ddcd], rcx ; 0x101dda858
0x1001aca8b: mov qword ptr [rip + 0x1c2ddce], rax ; 0x101dda860
0x1001aca92: lea rcx, [rip + 0x9c67da] ; 0x100b73273 GetEnabled
0x1001aca99: mov qword ptr [rip + 0x1c2ddc8], rcx ; 0x101dda868
0x1001acaa0: lea rcx, [rip + 0x1c2ddc1] ; 0x101dda868
0x1001acaa7: mov qword ptr [rip + 0x1c2ddbe], 0 ; 0x101dda870
0x1001acab2: mov qword ptr [rip + 0x1c2ddbf], rsi ; 0x101dda878
0x1001acab9: lea rsi, [rip - 0xcc00] ; 0x10019fec0
0x1001acac0: vmovq xmm0, rsi
0x1001acac5: vmovdqu xmmword ptr [rip + 0x1c2ddd3], xmm0 ; 0x101dda8a0
0x1001acacd: mov rsi, qword ptr [rip + 0xa59854] ; 0x100c06328 -> 0x1001a8b30 __Z12ApplyWrapperI6BirdV2MS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001acad4: mov qword ptr [rip + 0x1c2ddd5], rsi ; 0x101dda8b0
0x1001acadb: mov rsi, qword ptr [rip + 0xa5d0d6] ; 0x100c09bb8 -> 0x1001a8bb0 __Z21InitFunctionSignatureIM6BirdV2FbvEEvP17FunctionSignature
0x1001acae2: mov qword ptr [rip + 0x1c2ddcf], rsi ; 0x101dda8b8
0x1001acae9: mov qword ptr [rip + 0x1c2ddd0], rax ; 0x101dda8c0
0x1001acaf0: lea rsi, [rip + 0x9be5c8] ; 0x100b6b0bf transform
0x1001acaf7: mov qword ptr [rip + 0xadd062], rsi ; 0x100c89b60
0x1001acafe: lea rsi, [rip + 0xadd05b] ; 0x100c89b60
0x1001acb05: mov qword ptr [rip + 0xadd058], 0 ; 0x100c89b68
0x1001acb10: mov qword ptr [rip + 0xadd059], rdx ; 0x100c89b70
0x1001acb17: mov qword ptr [rip + 0xadd05e], 0x90 ; 0x100c89b80
0x1001acb22: mov rdx, qword ptr [rip + 0xa5a29f] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x1001acb29: mov qword ptr [rip + 0xadd058], rdx ; 0x100c89b88
0x1001acb30: mov qword ptr [rip + 0xadd059], rax ; 0x100c89b90
0x1001acb37: mov qword ptr [rip + 0xadd056], 0xffffffffffffffff ; 0x100c89b98
0x1001acb42: mov qword ptr [rip + 0xadd057], r13 ; 0x100c89ba0
0x1001acb49: mov qword ptr [rip + 0xadd054], 0 ; 0x100c89ba8
0x1001acb54: lea r12, [rip + 0x9ca4fe] ; 0x100b77059 enabled
0x1001acb5b: mov qword ptr [rip + 0xadd04e], r12 ; 0x100c89bb0
0x1001acb62: lea rdx, [rip + 0xadd047] ; 0x100c89bb0
0x1001acb69: mov qword ptr [rip + 0xadd050], rsi ; 0x100c89bc0
0x1001acb70: mov qword ptr [rip + 0xacb0e9], rdx ; 0x100c77c60
0x1001acb77: mov qword ptr [rip + 0xadd04e], 0xd0 ; 0x100c89bd0
0x1001acb82: mov qword ptr [rip + 0xadd04f], r14 ; 0x100c89bd8
0x1001acb89: mov qword ptr [rip + 0xadd050], rax ; 0x100c89be0
0x1001acb90: mov qword ptr [rip + 0xadd04d], 0xffffffffffffffff ; 0x100c89be8
0x1001acb9b: mov qword ptr [rip + 0xadd04e], r13 ; 0x100c89bf0
0x1001acba2: mov qword ptr [rip + 0xadd04b], 0 ; 0x100c89bf8
0x1001acbad: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1001acbb2: vmovaps xmmword ptr [rip + 0x1c2dd16], xmm0 ; 0x101dda8d0
0x1001acbba: lea rdx, [rip + 0x1c2dd0f] ; 0x101dda8d0
0x1001acbc1: mov qword ptr [rip + 0x1c2dd14], 0 ; 0x101dda8e0
0x1001acbcc: mov qword ptr [rip + 0xadcfe5], rdx ; 0x100c89bb8
0x1001acbd3: lea rsi, [rip + 0x9cb080] ; 0x100b77c5a DefaultMessageHandler
0x1001acbda: mov qword ptr [rip + 0x1c2dd07], rsi ; 0x101dda8e8
0x1001acbe1: lea rdx, [rip + 0x1c2dd00] ; 0x101dda8e8
0x1001acbe8: mov qword ptr [rip + 0x1c2dcfd], 0 ; 0x101dda8f0
0x1001acbf3: mov qword ptr [rip + 0x1c2dcfe], rcx ; 0x101dda8f8
0x1001acbfa: mov qword ptr [rip + 0xac335f], rdx ; 0x100c6ff60
0x1001acc01: lea rcx, [rip - 0xcd38] ; 0x10019fed0
0x1001acc08: vmovq xmm0, rcx
0x1001acc0d: vmovdqu xmmword ptr [rip + 0x1c2dd0b], xmm0 ; 0x101dda920
0x1001acc15: mov rdx, qword ptr [rip + 0xa59714] ; 0x100c06330 -> 0x1001a8be0 __Z12ApplyWrapperI6BirdV2MS0_FvPK6ObjectEEvM9VoidClassFvvEPv8VariablePSA_j
0x1001acc1c: mov qword ptr [rip + 0x1c2dd0d], rdx ; 0x101dda930
0x1001acc23: mov rdx, qword ptr [rip + 0xa5cf96] ; 0x100c09bc0 -> 0x1001a8c80 __Z21InitFunctionSignatureIM6BirdV2FvPK6ObjectEEvP17FunctionSignature
0x1001acc2a: mov qword ptr [rip + 0x1c2dd07], rdx ; 0x101dda938
0x1001acc31: mov qword ptr [rip + 0x1c2dd08], rax ; 0x101dda940
0x1001acc38: lea rdi, [rip + 0x1c2dd09] ; 0x101dda948
0x1001acc3f: xor r8d, r8d
0x1001acc42: lea rdx, [rip + 0x9b1db2] ; 0x100b5e9fb Object
0x1001acc49: call 0x1001a8d00 ; 0x1001a8d00
0x1001acc4e: lea rax, [rip + 0x9cb01b] ; 0x100b77c70 BirdV2Barn
0x1001acc55: mov qword ptr [rip + 0x1c2dcfc], rax ; 0x101dda958
0x1001acc5c: lea rax, [rip + 0x1c2dced] ; 0x101dda950
0x1001acc63: mov qword ptr [rip + 0x1c2dcf2], 0 ; 0x101dda960
0x1001acc6e: mov rcx, qword ptr [rip + 0xac32e3] ; 0x100c6ff58
0x1001acc75: mov qword ptr [rip + 0x1c2dcec], rcx ; 0x101dda968
0x1001acc7c: mov qword ptr [rip + 0xac32d5], rax ; 0x100c6ff58
0x1001acc83: mov qword ptr [rip + 0x1c2dcee], rax ; 0x101dda978
0x1001acc8a: mov rax, qword ptr [rip + 0xa5ba1f] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1001acc91: mov qword ptr [rip + 0x1c2dce8], rax ; 0x101dda980
0x1001acc98: mov qword ptr [rip + 0x1c2dce5], 0xffffffffffffffff ; 0x101dda988
0x1001acca3: mov qword ptr [rip + 0x1c2dcfa], 0 ; 0x101dda9a8
0x1001accae: mov rax, qword ptr [rip + 0xa5dc43] ; 0x100c0a8f8
0x1001accb5: add rax, 0x10
0x1001accb9: mov qword ptr [rip + 0x1c2dc90], rax ; 0x101dda950
0x1001accc0: xor eax, eax
0x1001accc2: call 0x100011c10 ; 0x100011c10
0x1001accc7: lea rax, [rip + 0x9b3d77] ; 0x100b60a45 OnLevelLoad
0x1001accce: mov qword ptr [rip + 0x1c2dcdb], rax ; 0x101dda9b0
0x1001accd5: lea rax, [rip + 0x1c2dcd4] ; 0x101dda9b0
0x1001accdc: mov qword ptr [rip + 0x1c2dcd1], 0 ; 0x101dda9b8
0x1001acce7: mov rcx, qword ptr [rip + 0xac3272] ; 0x100c6ff60
0x1001accee: mov qword ptr [rip + 0x1c2dccb], rcx ; 0x101dda9c0
0x1001accf5: lea rcx, [rip - 0xcdec] ; 0x10019ff10
0x1001accfc: vmovq xmm0, rcx
0x1001acd01: vmovdqu xmmword ptr [rip + 0x1c2dcdf], xmm0 ; 0x101dda9e8
0x1001acd09: mov rcx, qword ptr [rip + 0xa58590] ; 0x100c052a0 -> 0x1001a9570 __Z12ApplyWrapperI10BirdV2BarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001acd10: mov qword ptr [rip + 0x1c2dce1], rcx ; 0x101dda9f8
0x1001acd17: mov rcx, qword ptr [rip + 0xa5be12] ; 0x100c08b30 -> 0x1001a95d0 __Z21InitFunctionSignatureIM10BirdV2BarnFvvEEvP17FunctionSignature
0x1001acd1e: mov qword ptr [rip + 0x1c2dcdb], rcx ; 0x101ddaa00
0x1001acd25: mov rcx, qword ptr [rip + 0xa5a884] ; 0x100c075b0 -> 0x1001a9560 __Z18GetMetaClassByTypeIP10BirdV2BarnERK9MetaClassv
0x1001acd2c: mov qword ptr [rip + 0x1c2dcd5], rcx ; 0x101ddaa08
0x1001acd33: lea rdx, [rip + 0x9afc13] ; 0x100b5c94d Update
0x1001acd3a: mov qword ptr [rip + 0x1c2dccf], rdx ; 0x101ddaa10
0x1001acd41: lea rdx, [rip + 0x1c2dcc8] ; 0x101ddaa10
0x1001acd48: mov qword ptr [rip + 0x1c2dcc5], 0 ; 0x101ddaa18
0x1001acd53: mov qword ptr [rip + 0x1c2dcc6], rax ; 0x101ddaa20
0x1001acd5a: mov qword ptr [rip + 0xac31ff], rdx ; 0x100c6ff60
0x1001acd61: lea rax, [rip - 0xce38] ; 0x10019ff30
0x1001acd68: vmovq xmm0, rax
0x1001acd6d: vmovdqu xmmword ptr [rip + 0x1c2dcd3], xmm0 ; 0x101ddaa48
0x1001acd75: mov rax, qword ptr [rip + 0xa5851c] ; 0x100c05298 -> 0x1001a95f0 __Z12ApplyWrapperI10BirdV2BarnMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x1001acd7c: mov qword ptr [rip + 0x1c2dcd5], rax ; 0x101ddaa58
0x1001acd83: mov rax, qword ptr [rip + 0xa5bd9e] ; 0x100c08b28 -> 0x1001a9690 __Z21InitFunctionSignatureIM10BirdV2BarnFvP4GameEEvP17FunctionSignature
0x1001acd8a: mov qword ptr [rip + 0x1c2dccf], rax ; 0x101ddaa60
0x1001acd91: mov qword ptr [rip + 0x1c2dcd0], rcx ; 0x101ddaa68
0x1001acd98: lea rax, [rip + 0x9cafc7] ; 0x100b77d66 SetBirdGuidesEnabled
0x1001acd9f: mov qword ptr [rip + 0x1c2dcd2], rax ; 0x101ddaa78
0x1001acda6: lea rax, [rip + 0x1c2dcc3] ; 0x101ddaa70
0x1001acdad: mov qword ptr [rip + 0x1c2dcc8], 0 ; 0x101ddaa80
0x1001acdb8: mov rcx, qword ptr [rip + 0xac3199] ; 0x100c6ff58
0x1001acdbf: mov qword ptr [rip + 0x1c2dcc2], rcx ; 0x101ddaa88
0x1001acdc6: mov qword ptr [rip + 0xac318b], rax ; 0x100c6ff58
0x1001acdcd: mov qword ptr [rip + 0x1c2dcc4], rax ; 0x101ddaa98
0x1001acdd4: mov rbx, qword ptr [rip + 0xa5b80d] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x1001acddb: mov qword ptr [rip + 0x1c2dcbe], rbx ; 0x101ddaaa0
0x1001acde2: mov dword ptr [rip + 0x1c2dcbc], 0xffffffff ; 0x101ddaaa8
0x1001acdec: mov dword ptr [rip + 0x1c2dcb6], 0xffffffff ; 0x101ddaaac
0x1001acdf6: mov qword ptr [rip + 0x1c2dcc7], 0 ; 0x101ddaac8
0x1001ace01: mov rax, qword ptr [rip + 0xa5f150] ; 0x100c0bf58
0x1001ace08: add rax, 0x10
0x1001ace0c: mov qword ptr [rip + 0x1c2dc5d], rax ; 0x101ddaa70
0x1001ace13: xor eax, eax
0x1001ace15: call 0x100011c10 ; 0x100011c10
0x1001ace1a: lea rax, [rip + 0x9caf5a] ; 0x100b77d7b birds
0x1001ace21: mov qword ptr [rip + 0xadcdd8], rax ; 0x100c89c00
0x1001ace28: lea rax, [rip + 0xadcdd1] ; 0x100c89c00
0x1001ace2f: mov rcx, qword ptr [rip + 0xacae2a] ; 0x100c77c60
0x1001ace36: mov qword ptr [rip + 0xadcdd3], rcx ; 0x100c89c10
0x1001ace3d: mov qword ptr [rip + 0xadcdd8], 0x38 ; 0x100c89c20
0x1001ace48: mov rcx, qword ptr [rip + 0xa5a479] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x1001ace4f: mov qword ptr [rip + 0xadcdd2], rcx ; 0x100c89c28
0x1001ace56: mov rcx, qword ptr [rip + 0xa5b513] ; 0x100c08370 -> 0x1001a9af0 __Z18GetMetaClassByTypeIP20SetBirdGuidesEnabledERK9MetaClassv
0x1001ace5d: mov qword ptr [rip + 0xadcdcc], rcx ; 0x100c89c30
0x1001ace64: mov qword ptr [rip + 0xadcdc9], 0xffffffffffffffff ; 0x100c89c38
0x1001ace6f: mov qword ptr [rip + 0xadcdca], r13 ; 0x100c89c40
0x1001ace76: mov qword ptr [rip + 0xadcdc7], 0 ; 0x100c89c48
0x1001ace81: vmovq xmm0, r15
0x1001ace86: vmovdqa xmm1, xmmword ptr [rbp - 0x50]
0x1001ace8b: vpunpcklqdq xmm0, xmm1, xmm0
0x1001ace8f: vmovdqa xmmword ptr [rbp - 0x50], xmm0
0x1001ace94: vmovdqa xmmword ptr [rip + 0x1c2dc34], xmm0 ; 0x101ddaad0
0x1001ace9c: lea rdx, [rip + 0x1c2dc2d] ; 0x101ddaad0
0x1001acea3: mov qword ptr [rip + 0x1c2dc32], 0 ; 0x101ddaae0
0x1001aceae: mov qword ptr [rip + 0xadcd53], rdx ; 0x100c89c08
0x1001aceb5: mov qword ptr [rip + 0xadcd94], r12 ; 0x100c89c50
0x1001acebc: lea rdx, [rip + 0xadcd8d] ; 0x100c89c50
0x1001acec3: mov qword ptr [rip + 0xadcd96], rax ; 0x100c89c60
0x1001aceca: mov qword ptr [rip + 0xacad8f], rdx ; 0x100c77c60
0x1001aced1: mov qword ptr [rip + 0xadcd94], 0x40 ; 0x100c89c70
0x1001acedc: mov qword ptr [rip + 0xadcd95], r14 ; 0x100c89c78
0x1001acee3: mov qword ptr [rip + 0xadcd96], rcx ; 0x100c89c80
0x1001aceea: mov qword ptr [rip + 0xadcd93], 0xffffffffffffffff ; 0x100c89c88
0x1001acef5: mov qword ptr [rip + 0xadcd94], r13 ; 0x100c89c90
0x1001acefc: mov qword ptr [rip + 0xadcd91], 0 ; 0x100c89c98
0x1001acf07: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1001acf0c: vmovaps xmmword ptr [rip + 0x1c2dbdc], xmm0 ; 0x101ddaaf0
0x1001acf14: lea rax, [rip + 0x1c2dbd5] ; 0x101ddaaf0
0x1001acf1b: mov qword ptr [rip + 0x1c2dbda], 0 ; 0x101ddab00
0x1001acf26: mov qword ptr [rip + 0xadcd2b], rax ; 0x100c89c58
0x1001acf2d: lea rax, [rip + 0x9cae4d] ; 0x100b77d81 BirdV2AiSwap
0x1001acf34: mov qword ptr [rip + 0x1c2dbd5], rax ; 0x101ddab10
0x1001acf3b: lea rax, [rip + 0x1c2dbc6] ; 0x101ddab08
0x1001acf42: mov qword ptr [rip + 0x1c2dbcb], 0 ; 0x101ddab18
0x1001acf4d: mov rcx, qword ptr [rip + 0xac3004] ; 0x100c6ff58
0x1001acf54: mov qword ptr [rip + 0x1c2dbc5], rcx ; 0x101ddab20
0x1001acf5b: mov qword ptr [rip + 0xac2ff6], rax ; 0x100c6ff58
0x1001acf62: mov qword ptr [rip + 0x1c2dbc7], rax ; 0x101ddab30
0x1001acf69: mov qword ptr [rip + 0x1c2dbc8], rbx ; 0x101ddab38
0x1001acf70: mov dword ptr [rip + 0x1c2dbc6], 0xffffffff ; 0x101ddab40
0x1001acf7a: mov dword ptr [rip + 0x1c2dbc0], 0xffffffff ; 0x101ddab44
0x1001acf84: mov qword ptr [rip + 0x1c2dbd1], 0 ; 0x101ddab60
0x1001acf8f: mov rax, qword ptr [rip + 0xa5def2] ; 0x100c0ae88
0x1001acf96: add rax, 0x10
0x1001acf9a: mov qword ptr [rip + 0x1c2db67], rax ; 0x101ddab08
0x1001acfa1: xor eax, eax
0x1001acfa3: call 0x100011c10 ; 0x100011c10
0x1001acfa8: lea r14, [rip + 0x9c5b6d] ; 0x100b72b1c target
0x1001acfaf: mov qword ptr [rip + 0xadccea], r14 ; 0x100c89ca0
0x1001acfb6: lea rax, [rip + 0xadcce3] ; 0x100c89ca0
0x1001acfbd: mov qword ptr [rip + 0xadcce0], 0 ; 0x100c89ca8
0x1001acfc8: mov rcx, qword ptr [rip + 0xacac91] ; 0x100c77c60
0x1001acfcf: mov qword ptr [rip + 0xadccda], rcx ; 0x100c89cb0
0x1001acfd6: mov qword ptr [rip + 0xadccdf], 0x40 ; 0x100c89cc0
0x1001acfe1: mov r12, qword ptr [rip + 0xa5a320] ; 0x100c07308 -> 0x1001a6830 __Z17GetMetaTypeByTypeIP6BirdV2ERK8MetaTypev
0x1001acfe8: mov qword ptr [rip + 0xadccd9], r12 ; 0x100c89cc8
0x1001acfef: mov rcx, qword ptr [rip + 0xa5a96a] ; 0x100c07960 -> 0x1001a9e90 __Z18GetMetaClassByTypeIP12BirdV2AiSwapERK9MetaClassv
0x1001acff6: mov qword ptr [rip + 0xadccd3], rcx ; 0x100c89cd0
0x1001acffd: mov qword ptr [rip + 0xadccd0], 0xffffffffffffffff ; 0x100c89cd8
0x1001ad008: mov qword ptr [rip + 0xadccd1], r13 ; 0x100c89ce0
0x1001ad00f: mov qword ptr [rip + 0xadccce], 0 ; 0x100c89ce8
0x1001ad01a: lea r15, [rip + 0x9cad6d] ; 0x100b77d8e newParams
0x1001ad021: mov qword ptr [rip + 0xadccc8], r15 ; 0x100c89cf0
0x1001ad028: lea rdx, [rip + 0xadccc1] ; 0x100c89cf0
0x1001ad02f: mov qword ptr [rip + 0xadccca], rax ; 0x100c89d00
0x1001ad036: mov qword ptr [rip + 0xadcccf], 0x38 ; 0x100c89d10
0x1001ad041: mov rax, qword ptr [rip + 0xa5a010] ; 0x100c07058 -> 0x1001a8a00 __Z17GetMetaTypeByTypeIP14BirdV2AiParamsERK8MetaTypev
0x1001ad048: mov qword ptr [rip + 0xadccc9], rax ; 0x100c89d18
0x1001ad04f: mov qword ptr [rip + 0xadccca], rcx ; 0x100c89d20
0x1001ad056: mov qword ptr [rip + 0xadccc7], 0xffffffffffffffff ; 0x100c89d28
0x1001ad061: mov qword ptr [rip + 0xadccc8], r13 ; 0x100c89d30
0x1001ad068: mov qword ptr [rip + 0xadccc5], 0 ; 0x100c89d38
0x1001ad073: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1001ad078: vmovaps xmmword ptr [rip + 0x1c2daf0], xmm0 ; 0x101ddab70
0x1001ad080: lea rax, [rip + 0x1c2dae9] ; 0x101ddab70
0x1001ad087: mov qword ptr [rip + 0x1c2daee], 0 ; 0x101ddab80
0x1001ad092: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001ad097: vmovaps xmmword ptr [rip + 0x1c2daf1], xmm0 ; 0x101ddab90
0x1001ad09f: lea rsi, [rip + 0x1c2daea] ; 0x101ddab90
0x1001ad0a6: mov qword ptr [rip + 0x1c2daf3], rax ; 0x101ddaba0
0x1001ad0ad: mov qword ptr [rip + 0xadcc44], rsi ; 0x100c89cf8
0x1001ad0b4: lea rax, [rip + 0x9cacdd] ; 0x100b77d98 modelScale
0x1001ad0bb: mov qword ptr [rip + 0xadcc7e], rax ; 0x100c89d40
0x1001ad0c2: lea rax, [rip + 0xadcc77] ; 0x100c89d40
0x1001ad0c9: mov qword ptr [rip + 0xadcc80], rdx ; 0x100c89d50
0x1001ad0d0: mov qword ptr [rip + 0xacab89], rax ; 0x100c77c60
0x1001ad0d7: mov qword ptr [rip + 0xadcc7e], 0x48 ; 0x100c89d60
0x1001ad0e2: mov rax, qword ptr [rip + 0xa5a477] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1001ad0e9: mov qword ptr [rip + 0xadcc78], rax ; 0x100c89d68
0x1001ad0f0: mov qword ptr [rip + 0xadcc79], rcx ; 0x100c89d70
0x1001ad0f7: mov qword ptr [rip + 0xadcc76], 0xffffffffffffffff ; 0x100c89d78
0x1001ad102: mov qword ptr [rip + 0xadcc77], r13 ; 0x100c89d80
0x1001ad109: mov qword ptr [rip + 0xadcc74], 0 ; 0x100c89d88
0x1001ad114: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x1001ad11c: vmovaps xmmword ptr [rip + 0x1c2da8c], xmm0 ; 0x101ddabb0
0x1001ad124: lea rax, [rip + 0x1c2da85] ; 0x101ddabb0
0x1001ad12b: mov qword ptr [rip + 0x1c2da8a], 0 ; 0x101ddabc0
0x1001ad136: mov qword ptr [rip + 0xadcc0b], rax ; 0x100c89d48
0x1001ad13d: lea rax, [rip + 0x9cac5f] ; 0x100b77da3 BirdV2ParamSwap
0x1001ad144: mov qword ptr [rip + 0x1c2da85], rax ; 0x101ddabd0
0x1001ad14b: lea rax, [rip + 0x1c2da76] ; 0x101ddabc8
0x1001ad152: mov qword ptr [rip + 0x1c2da7b], 0 ; 0x101ddabd8
0x1001ad15d: mov rcx, qword ptr [rip + 0xac2df4] ; 0x100c6ff58
0x1001ad164: mov qword ptr [rip + 0x1c2da75], rcx ; 0x101ddabe0
0x1001ad16b: mov qword ptr [rip + 0xac2de6], rax ; 0x100c6ff58
0x1001ad172: mov qword ptr [rip + 0x1c2da77], rax ; 0x101ddabf0
0x1001ad179: mov qword ptr [rip + 0x1c2da78], rbx ; 0x101ddabf8
0x1001ad180: mov dword ptr [rip + 0x1c2da76], 0xffffffff ; 0x101ddac00
0x1001ad18a: mov dword ptr [rip + 0x1c2da70], 0xffffffff ; 0x101ddac04
0x1001ad194: mov qword ptr [rip + 0x1c2da81], 0 ; 0x101ddac20
0x1001ad19f: mov rax, qword ptr [rip + 0xa5e46a] ; 0x100c0b610
0x1001ad1a6: add rax, 0x10
0x1001ad1aa: mov qword ptr [rip + 0x1c2da17], rax ; 0x101ddabc8
0x1001ad1b1: xor eax, eax
0x1001ad1b3: call 0x100011c10 ; 0x100011c10
0x1001ad1b8: mov qword ptr [rip + 0xadcbd1], r14 ; 0x100c89d90
0x1001ad1bf: lea rax, [rip + 0xadcbca] ; 0x100c89d90
0x1001ad1c6: mov qword ptr [rip + 0xadcbc7], 0 ; 0x100c89d98
0x1001ad1d1: mov rcx, qword ptr [rip + 0xacaa88] ; 0x100c77c60
0x1001ad1d8: mov qword ptr [rip + 0xadcbc1], rcx ; 0x100c89da0
0x1001ad1df: mov qword ptr [rip + 0xadcbc6], 0x40 ; 0x100c89db0
0x1001ad1ea: mov qword ptr [rip + 0xadcbc7], r12 ; 0x100c89db8
0x1001ad1f1: mov rcx, qword ptr [rip + 0xa5ac38] ; 0x100c07e30 -> 0x1001aa1b0 __Z18GetMetaClassByTypeIP15BirdV2ParamSwapERK9MetaClassv
0x1001ad1f8: mov qword ptr [rip + 0xadcbc1], rcx ; 0x100c89dc0
0x1001ad1ff: mov qword ptr [rip + 0xadcbbe], 0xffffffffffffffff ; 0x100c89dc8
0x1001ad20a: mov qword ptr [rip + 0xadcbbf], r13 ; 0x100c89dd0
0x1001ad211: mov qword ptr [rip + 0xadcbbc], 0 ; 0x100c89dd8
0x1001ad21c: mov qword ptr [rip + 0xadcbbd], r15 ; 0x100c89de0
0x1001ad223: lea rdx, [rip + 0xadcbb6] ; 0x100c89de0
0x1001ad22a: mov qword ptr [rip + 0xadcbbf], rax ; 0x100c89df0
0x1001ad231: mov qword ptr [rip + 0xacaa28], rdx ; 0x100c77c60
0x1001ad238: mov qword ptr [rip + 0xadcbbd], 0x38 ; 0x100c89e00
0x1001ad243: mov rax, qword ptr [rip + 0xa59d2e] ; 0x100c06f78 -> 0x1001a89f0 __Z17GetMetaTypeByTypeIP12BirdV2ParamsERK8MetaTypev
0x1001ad24a: mov qword ptr [rip + 0xadcbb7], rax ; 0x100c89e08
0x1001ad251: mov qword ptr [rip + 0xadcbb8], rcx ; 0x100c89e10
0x1001ad258: mov qword ptr [rip + 0xadcbb5], 0xffffffffffffffff ; 0x100c89e18
0x1001ad263: mov qword ptr [rip + 0xadcbb6], r13 ; 0x100c89e20
0x1001ad26a: mov qword ptr [rip + 0xadcbb3], 0 ; 0x100c89e28
0x1001ad275: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1001ad27a: vmovaps xmmword ptr [rip + 0x1c2d9ae], xmm0 ; 0x101ddac30
0x1001ad282: lea rax, [rip + 0x1c2d9a7] ; 0x101ddac30
0x1001ad289: mov qword ptr [rip + 0x1c2d9ac], 0 ; 0x101ddac40
0x1001ad294: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001ad299: vmovaps xmmword ptr [rip + 0x1c2d9af], xmm0 ; 0x101ddac50
0x1001ad2a1: lea rcx, [rip + 0x1c2d9a8] ; 0x101ddac50
0x1001ad2a8: mov qword ptr [rip + 0x1c2d9b1], rax ; 0x101ddac60
0x1001ad2af: mov qword ptr [rip + 0xadcb32], rcx ; 0x100c89de8
0x1001ad2b6: lea rax, [rip + 0x9caaf6] ; 0x100b77db3 DetachFromBirdGuides
0x1001ad2bd: mov qword ptr [rip + 0x1c2d9ac], rax ; 0x101ddac70
0x1001ad2c4: lea rax, [rip + 0x1c2d99d] ; 0x101ddac68
0x1001ad2cb: mov qword ptr [rip + 0x1c2d9a2], 0 ; 0x101ddac78
0x1001ad2d6: mov rcx, qword ptr [rip + 0xac2c7b] ; 0x100c6ff58
0x1001ad2dd: mov qword ptr [rip + 0x1c2d99c], rcx ; 0x101ddac80
0x1001ad2e4: mov qword ptr [rip + 0xac2c6d], rax ; 0x100c6ff58
0x1001ad2eb: mov qword ptr [rip + 0x1c2d99e], rax ; 0x101ddac90
0x1001ad2f2: mov qword ptr [rip + 0x1c2d99f], rbx ; 0x101ddac98
0x1001ad2f9: mov dword ptr [rip + 0x1c2d99d], 0xffffffff ; 0x101ddaca0
0x1001ad303: mov dword ptr [rip + 0x1c2d997], 0xffffffff ; 0x101ddaca4
0x1001ad30d: mov qword ptr [rip + 0x1c2d9a8], 0 ; 0x101ddacc0
0x1001ad318: mov rax, qword ptr [rip + 0xa5ebf9] ; 0x100c0bf18
0x1001ad31f: add rax, 0x10
0x1001ad323: mov qword ptr [rip + 0x1c2d93e], rax ; 0x101ddac68
0x1001ad32a: xor eax, eax
0x1001ad32c: call 0x100011c10 ; 0x100011c10
0x1001ad331: lea rax, [rip + 0x9caa90] ; 0x100b77dc8 bird
0x1001ad338: mov qword ptr [rip + 0xadcaf1], rax ; 0x100c89e30
0x1001ad33f: lea rax, [rip + 0xadcaea] ; 0x100c89e30
0x1001ad346: mov rcx, qword ptr [rip + 0xaca913] ; 0x100c77c60
0x1001ad34d: mov qword ptr [rip + 0xadcaec], rcx ; 0x100c89e40
0x1001ad354: mov qword ptr [rip + 0xaca905], rax ; 0x100c77c60
0x1001ad35b: mov qword ptr [rip + 0xadcaea], 0x38 ; 0x100c89e50
0x1001ad366: mov qword ptr [rip + 0xadcaeb], r12 ; 0x100c89e58
0x1001ad36d: mov rax, qword ptr [rip + 0xa5afd4] ; 0x100c08348 -> 0x1001aa580 __Z18GetMetaClassByTypeIP20DetachFromBirdGuidesERK9MetaClassv
0x1001ad374: mov qword ptr [rip + 0xadcae5], rax ; 0x100c89e60
0x1001ad37b: mov qword ptr [rip + 0xadcae2], 0xffffffffffffffff ; 0x100c89e68
0x1001ad386: mov qword ptr [rip + 0xadcae3], r13 ; 0x100c89e70
0x1001ad38d: mov qword ptr [rip + 0xadcae0], 0 ; 0x100c89e78
0x1001ad398: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1001ad39d: vmovaps xmmword ptr [rip + 0x1c2d92b], xmm0 ; 0x101ddacd0
0x1001ad3a5: lea rax, [rip + 0x1c2d924] ; 0x101ddacd0
0x1001ad3ac: mov qword ptr [rip + 0x1c2d929], 0 ; 0x101ddace0
0x1001ad3b7: mov qword ptr [rip + 0xadca7a], rax ; 0x100c89e38
0x1001ad3be: lea rax, [rip + 0x9caa08] ; 0x100b77dcd ReleaseBirds
0x1001ad3c5: mov qword ptr [rip + 0x1c2d924], rax ; 0x101ddacf0
0x1001ad3cc: lea rax, [rip + 0x1c2d915] ; 0x101ddace8
0x1001ad3d3: mov qword ptr [rip + 0x1c2d91a], 0 ; 0x101ddacf8
0x1001ad3de: mov rcx, qword ptr [rip + 0xac2b73] ; 0x100c6ff58
0x1001ad3e5: mov qword ptr [rip + 0x1c2d914], rcx ; 0x101ddad00
0x1001ad3ec: mov qword ptr [rip + 0xac2b65], rax ; 0x100c6ff58
0x1001ad3f3: mov qword ptr [rip + 0x1c2d916], rax ; 0x101ddad10
0x1001ad3fa: mov qword ptr [rip + 0x1c2d917], rbx ; 0x101ddad18
0x1001ad401: mov dword ptr [rip + 0x1c2d915], 0xffffffff ; 0x101ddad20
0x1001ad40b: mov dword ptr [rip + 0x1c2d90f], 0xffffffff ; 0x101ddad24
0x1001ad415: mov qword ptr [rip + 0x1c2d920], 0 ; 0x101ddad40
0x1001ad420: mov rax, qword ptr [rip + 0xa5dbb1] ; 0x100c0afd8
0x1001ad427: add rax, 0x10
0x1001ad42b: mov qword ptr [rip + 0x1c2d8b6], rax ; 0x101ddace8
0x1001ad432: xor eax, eax
0x1001ad434: call 0x100011c10 ; 0x100011c10
0x1001ad439: lea rax, [rip + 0x9ca93b] ; 0x100b77d7b birds
0x1001ad440: mov qword ptr [rip + 0xadca39], rax ; 0x100c89e80
0x1001ad447: lea rax, [rip + 0xadca32] ; 0x100c89e80
0x1001ad44e: mov rcx, qword ptr [rip + 0xaca80b] ; 0x100c77c60
0x1001ad455: mov qword ptr [rip + 0xadca34], rcx ; 0x100c89e90
0x1001ad45c: mov qword ptr [rip + 0xaca7fd], rax ; 0x100c77c60
0x1001ad463: mov qword ptr [rip + 0xadca32], 0x38 ; 0x100c89ea0
0x1001ad46e: mov rax, qword ptr [rip + 0xa59e53] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x1001ad475: mov qword ptr [rip + 0xadca2c], rax ; 0x100c89ea8
0x1001ad47c: mov rax, qword ptr [rip + 0xa5a5cd] ; 0x100c07a50 -> 0x1001aaa40 __Z18GetMetaClassByTypeIP12ReleaseBirdsERK9MetaClassv
0x1001ad483: mov qword ptr [rip + 0xadca26], rax ; 0x100c89eb0
0x1001ad48a: mov qword ptr [rip + 0xadca23], 0xffffffffffffffff ; 0x100c89eb8
0x1001ad495: mov qword ptr [rip + 0xadca24], r13 ; 0x100c89ec0
0x1001ad49c: mov qword ptr [rip + 0xadca21], 0 ; 0x100c89ec8
0x1001ad4a7: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1001ad4ac: vmovaps xmmword ptr [rip + 0x1c2d89c], xmm0 ; 0x101ddad50
0x1001ad4b4: lea rax, [rip + 0x1c2d895] ; 0x101ddad50
0x1001ad4bb: mov qword ptr [rip + 0x1c2d89a], 0 ; 0x101ddad60
0x1001ad4c6: mov qword ptr [rip + 0xadc9bb], rax ; 0x100c89e88
0x1001ad4cd: add rsp, 0x88
0x1001ad4d4: pop rbx
0x1001ad4d5: pop r12
0x1001ad4d7: pop r13
0x1001ad4d9: pop r14
0x1001ad4db: pop r15
0x1001ad4dd: pop rbp
0x1001ad4de: ret 
0x1001ad4df: nop 
