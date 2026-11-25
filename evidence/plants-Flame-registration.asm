0x1003439d0: push rbp
0x1003439d1: mov rbp, rsp
0x1003439d4: push r15
0x1003439d6: push r14
0x1003439d8: push r13
0x1003439da: push r12
0x1003439dc: push rbx
0x1003439dd: sub rsp, 0x38
0x1003439e1: mov dword ptr [rip + 0x9e81e5], 0 ; 0x100d2bbd0
0x1003439eb: lea rax, [rip + 0x83db7a] ; 0x100b8156c LightRpc
0x1003439f2: mov qword ptr [rip + 0x1ab174f], rax ; 0x101df5148
0x1003439f9: lea rax, [rip + 0x1ab1740] ; 0x101df5140
0x100343a00: mov qword ptr [rip + 0x1ab1745], 0 ; 0x101df5150
0x100343a0b: mov rcx, qword ptr [rip + 0x92c546] ; 0x100c6ff58
0x100343a12: mov qword ptr [rip + 0x1ab173f], rcx ; 0x101df5158
0x100343a19: mov qword ptr [rip + 0x92c538], rax ; 0x100c6ff58
0x100343a20: mov qword ptr [rip + 0x1ab1741], rax ; 0x101df5168
0x100343a27: mov rax, qword ptr [rip + 0x8c4c8a] ; 0x100c086b8 -> 0x1000f6d40 __Z18GetMetaClassByTypeIP6NetRpcERK9MetaClassv
0x100343a2e: mov qword ptr [rip + 0x1ab173b], rax ; 0x101df5170
0x100343a35: mov qword ptr [rip + 0x1ab1738], 0xffffffffffffffff ; 0x101df5178
0x100343a40: mov qword ptr [rip + 0x1ab174d], 0 ; 0x101df5198
0x100343a4b: mov rax, qword ptr [rip + 0x8c8ca6] ; 0x100c0c6f8
0x100343a52: add rax, 0x10
0x100343a56: mov qword ptr [rip + 0x1ab16e3], rax ; 0x101df5140
0x100343a5d: xor eax, eax
0x100343a5f: call 0x100011c10 ; 0x100011c10
0x100343a64: lea rax, [rip + 0x83db0a] ; 0x100b81575 FlameSound
0x100343a6b: mov qword ptr [rip + 0x1ab1736], rax ; 0x101df51a8
0x100343a72: lea rcx, [rip + 0x1ab1727] ; 0x101df51a0
0x100343a79: mov rdx, qword ptr [rip + 0x92c4d8] ; 0x100c6ff58
0x100343a80: mov qword ptr [rip + 0x1ab1731], rdx ; 0x101df51b8
0x100343a87: mov qword ptr [rip + 0x92c4ca], rcx ; 0x100c6ff58
0x100343a8e: mov qword ptr [rip + 0x1ab1733], rcx ; 0x101df51c8
0x100343a95: mov rcx, qword ptr [rip + 0x8c909c] ; 0x100c0cb38
0x100343a9c: add rcx, 0x10
0x100343aa0: mov qword ptr [rip + 0x1ab16f9], rcx ; 0x101df51a0
0x100343aa7: vmovq xmm0, rax
0x100343aac: lea rax, [rip + 0x819b8b] ; 0x100b5d63e Enum_Type
0x100343ab3: vmovq xmm1, rax
0x100343ab8: vpunpcklqdq xmm0, xmm1, xmm0
0x100343abc: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x100343ac1: vmovdqa xmmword ptr [rip + 0x1ab1707], xmm0 ; 0x101df51d0
0x100343ac9: lea rax, [rip + 0x1ab1700] ; 0x101df51d0
0x100343ad0: mov qword ptr [rip + 0x1ab1705], 0 ; 0x101df51e0
0x100343adb: mov qword ptr [rip + 0x1ab16ce], rax ; 0x101df51b0
0x100343ae2: lea rax, [rip + 0x83da97] ; 0x100b81580 FlameSound_Normal
0x100343ae9: mov qword ptr [rip + 0x1ab16f8], rax ; 0x101df51e8
0x100343af0: lea r14, [rip + 0x1ab16f1] ; 0x101df51e8
0x100343af7: mov qword ptr [rip + 0x1ab16ee], 0 ; 0x101df51f0
0x100343b02: mov rax, qword ptr [rip + 0x9cf5d7] ; 0x100d130e0
0x100343b09: mov qword ptr [rip + 0x1ab16e8], rax ; 0x101df51f8
0x100343b10: mov qword ptr [rip + 0x9cf5c9], r14 ; 0x100d130e0
0x100343b17: mov edi, 4
0x100343b1c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100343b21: mov dword ptr [rax], 0
0x100343b27: mov qword ptr [rip + 0x1ab16da], rax ; 0x101df5208
0x100343b2e: mov r12, qword ptr [rip + 0x8c3043] ; 0x100c06b78 -> 0x100341120 __Z17GetMetaTypeByTypeI10FlameSoundERK8MetaTypev
0x100343b35: mov qword ptr [rip + 0x1ab16d4], r12 ; 0x101df5210
0x100343b3c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100343b41: vmovaps xmmword ptr [rip + 0x1ab16d7], xmm0 ; 0x101df5220
0x100343b49: lea rax, [rip + 0x1ab16d0] ; 0x101df5220
0x100343b50: mov qword ptr [rip + 0x1ab16d5], 0 ; 0x101df5230
0x100343b5b: mov qword ptr [rip + 0x1ab168e], rax ; 0x101df51f0
0x100343b62: lea rax, [rip + 0x83da29] ; 0x100b81592 FlameSound_Special
0x100343b69: mov qword ptr [rip + 0x1ab16c8], rax ; 0x101df5238
0x100343b70: lea rbx, [rip + 0x1ab16c1] ; 0x101df5238
0x100343b77: mov qword ptr [rip + 0x1ab16be], 0 ; 0x101df5240
0x100343b82: mov qword ptr [rip + 0x1ab16bf], r14 ; 0x101df5248
0x100343b89: mov qword ptr [rip + 0x9cf550], rbx ; 0x100d130e0
0x100343b90: mov edi, 4
0x100343b95: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100343b9a: mov dword ptr [rax], 1
0x100343ba0: mov qword ptr [rip + 0x1ab16b1], rax ; 0x101df5258
0x100343ba7: mov qword ptr [rip + 0x1ab16b2], r12 ; 0x101df5260
0x100343bae: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100343bb3: vmovaps xmmword ptr [rip + 0x1ab16b5], xmm0 ; 0x101df5270
0x100343bbb: lea rax, [rip + 0x1ab16ae] ; 0x101df5270
0x100343bc2: mov qword ptr [rip + 0x1ab16b3], 0 ; 0x101df5280
0x100343bcd: mov qword ptr [rip + 0x1ab166c], rax ; 0x101df5240
0x100343bd4: lea rax, [rip + 0x83d9ca] ; 0x100b815a5 FlameSound_Jar
0x100343bdb: mov qword ptr [rip + 0x1ab16a6], rax ; 0x101df5288
0x100343be2: lea r14, [rip + 0x1ab169f] ; 0x101df5288
0x100343be9: mov qword ptr [rip + 0x1ab169c], 0 ; 0x101df5290
0x100343bf4: mov qword ptr [rip + 0x1ab169d], rbx ; 0x101df5298
0x100343bfb: mov qword ptr [rip + 0x9cf4de], r14 ; 0x100d130e0
0x100343c02: mov edi, 4
0x100343c07: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100343c0c: mov dword ptr [rax], 2
0x100343c12: mov qword ptr [rip + 0x1ab168f], rax ; 0x101df52a8
0x100343c19: mov qword ptr [rip + 0x1ab1690], r12 ; 0x101df52b0
0x100343c20: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100343c25: vmovaps xmmword ptr [rip + 0x1ab1693], xmm0 ; 0x101df52c0
0x100343c2d: lea rax, [rip + 0x1ab168c] ; 0x101df52c0
0x100343c34: mov qword ptr [rip + 0x1ab1691], 0 ; 0x101df52d0
0x100343c3f: mov qword ptr [rip + 0x1ab164a], rax ; 0x101df5290
0x100343c46: lea rax, [rip + 0x83d967] ; 0x100b815b4 FlameSound_Mote
0x100343c4d: mov qword ptr [rip + 0x1ab1684], rax ; 0x101df52d8
0x100343c54: lea rbx, [rip + 0x1ab167d] ; 0x101df52d8
0x100343c5b: mov qword ptr [rip + 0x1ab167a], 0 ; 0x101df52e0
0x100343c66: mov qword ptr [rip + 0x1ab167b], r14 ; 0x101df52e8
0x100343c6d: mov qword ptr [rip + 0x9cf46c], rbx ; 0x100d130e0
0x100343c74: mov edi, 4
0x100343c79: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100343c7e: mov dword ptr [rax], 3
0x100343c84: mov qword ptr [rip + 0x1ab166d], rax ; 0x101df52f8
0x100343c8b: mov qword ptr [rip + 0x1ab166e], r12 ; 0x101df5300
0x100343c92: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100343c97: vmovaps xmmword ptr [rip + 0x1ab1671], xmm0 ; 0x101df5310
0x100343c9f: lea rax, [rip + 0x1ab166a] ; 0x101df5310
0x100343ca6: mov qword ptr [rip + 0x1ab166f], 0 ; 0x101df5320
0x100343cb1: mov qword ptr [rip + 0x1ab1628], rax ; 0x101df52e0
0x100343cb8: lea rax, [rip + 0x83d905] ; 0x100b815c4 FlameSound_Fireworks
0x100343cbf: mov qword ptr [rip + 0x1ab1662], rax ; 0x101df5328
0x100343cc6: lea r14, [rip + 0x1ab165b] ; 0x101df5328
0x100343ccd: mov qword ptr [rip + 0x1ab1658], 0 ; 0x101df5330
0x100343cd8: mov qword ptr [rip + 0x1ab1659], rbx ; 0x101df5338
0x100343cdf: mov qword ptr [rip + 0x9cf3fa], r14 ; 0x100d130e0
0x100343ce6: mov edi, 4
0x100343ceb: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100343cf0: mov dword ptr [rax], 4
0x100343cf6: mov qword ptr [rip + 0x1ab164b], rax ; 0x101df5348
0x100343cfd: mov qword ptr [rip + 0x1ab164c], r12 ; 0x101df5350
0x100343d04: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100343d09: vmovaps xmmword ptr [rip + 0x1ab164f], xmm0 ; 0x101df5360
0x100343d11: lea rax, [rip + 0x1ab1648] ; 0x101df5360
0x100343d18: mov qword ptr [rip + 0x1ab164d], 0 ; 0x101df5370
0x100343d23: mov qword ptr [rip + 0x1ab1606], rax ; 0x101df5330
0x100343d2a: lea rax, [rip + 0x83d8a8] ; 0x100b815d9 FlameSound_Book
0x100343d31: mov qword ptr [rip + 0x1ab1640], rax ; 0x101df5378
0x100343d38: lea rbx, [rip + 0x1ab1639] ; 0x101df5378
0x100343d3f: mov qword ptr [rip + 0x1ab1636], 0 ; 0x101df5380
0x100343d4a: mov qword ptr [rip + 0x1ab1637], r14 ; 0x101df5388
0x100343d51: mov qword ptr [rip + 0x9cf388], rbx ; 0x100d130e0
0x100343d58: mov edi, 4
0x100343d5d: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100343d62: mov dword ptr [rax], 5
0x100343d68: mov qword ptr [rip + 0x1ab1629], rax ; 0x101df5398
0x100343d6f: mov qword ptr [rip + 0x1ab162a], r12 ; 0x101df53a0
0x100343d76: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100343d7b: vmovaps xmmword ptr [rip + 0x1ab162d], xmm0 ; 0x101df53b0
0x100343d83: lea rax, [rip + 0x1ab1626] ; 0x101df53b0
0x100343d8a: mov qword ptr [rip + 0x1ab162b], 0 ; 0x101df53c0
0x100343d95: mov qword ptr [rip + 0x1ab15e4], rax ; 0x101df5380
0x100343d9c: lea rax, [rip + 0x83d846] ; 0x100b815e9 FlameSound_Rising
0x100343da3: mov qword ptr [rip + 0x1ab161e], rax ; 0x101df53c8
0x100343daa: lea r14, [rip + 0x1ab1617] ; 0x101df53c8
0x100343db1: mov qword ptr [rip + 0x1ab1614], 0 ; 0x101df53d0
0x100343dbc: mov qword ptr [rip + 0x1ab1615], rbx ; 0x101df53d8
0x100343dc3: mov qword ptr [rip + 0x9cf316], r14 ; 0x100d130e0
0x100343dca: mov edi, 4
0x100343dcf: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100343dd4: mov dword ptr [rax], 6
0x100343dda: mov qword ptr [rip + 0x1ab1607], rax ; 0x101df53e8
0x100343de1: mov qword ptr [rip + 0x1ab1608], r12 ; 0x101df53f0
0x100343de8: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100343ded: vmovaps xmmword ptr [rip + 0x1ab160b], xmm0 ; 0x101df5400
0x100343df5: lea rax, [rip + 0x1ab1604] ; 0x101df5400
0x100343dfc: mov qword ptr [rip + 0x1ab1609], 0 ; 0x101df5410
0x100343e07: mov qword ptr [rip + 0x1ab15c2], rax ; 0x101df53d0
0x100343e0e: lea rax, [rip + 0x83d7e6] ; 0x100b815fb FlameSound_None
0x100343e15: mov qword ptr [rip + 0x1ab15fc], rax ; 0x101df5418
0x100343e1c: lea rax, [rip + 0x1ab15f5] ; 0x101df5418
0x100343e23: mov qword ptr [rip + 0x1ab15f2], 0 ; 0x101df5420
0x100343e2e: mov qword ptr [rip + 0x1ab15f3], r14 ; 0x101df5428
0x100343e35: mov qword ptr [rip + 0x9cf2a4], rax ; 0x100d130e0
0x100343e3c: mov edi, 4
0x100343e41: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100343e46: mov dword ptr [rax], 7
0x100343e4c: mov qword ptr [rip + 0x1ab15e5], rax ; 0x101df5438
0x100343e53: mov qword ptr [rip + 0x1ab15e6], r12 ; 0x101df5440
0x100343e5a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100343e5f: vmovaps xmmword ptr [rip + 0x1ab15e9], xmm0 ; 0x101df5450
0x100343e67: lea rax, [rip + 0x1ab15e2] ; 0x101df5450
0x100343e6e: mov qword ptr [rip + 0x1ab15e7], 0 ; 0x101df5460
0x100343e79: mov qword ptr [rip + 0x1ab15a0], rax ; 0x101df5420
0x100343e80: lea rax, [rip + 0x838ff0] ; 0x100b7ce77 Flame
0x100343e87: mov qword ptr [rip + 0x1ab15e2], rax ; 0x101df5470
0x100343e8e: lea rax, [rip + 0x1ab15d3] ; 0x101df5468
0x100343e95: mov qword ptr [rip + 0x1ab15d8], 0 ; 0x101df5478
0x100343ea0: mov rcx, qword ptr [rip + 0x92c0b1] ; 0x100c6ff58
0x100343ea7: mov qword ptr [rip + 0x1ab15d2], rcx ; 0x101df5480
0x100343eae: mov qword ptr [rip + 0x92c0a3], rax ; 0x100c6ff58
0x100343eb5: mov qword ptr [rip + 0x1ab15d4], rax ; 0x101df5490
0x100343ebc: mov rax, qword ptr [rip + 0x8c3a65] ; 0x100c07928 -> 0x100103d50 __Z18GetMetaClassByTypeIP11WorldObjectERK9MetaClassv
0x100343ec3: mov qword ptr [rip + 0x1ab15ce], rax ; 0x101df5498
0x100343eca: mov qword ptr [rip + 0x1ab15cb], 0xffffffffffffffff ; 0x101df54a0
0x100343ed5: mov qword ptr [rip + 0x1ab15e0], 0 ; 0x101df54c0
0x100343ee0: mov rax, qword ptr [rip + 0x8c8559] ; 0x100c0c440
0x100343ee7: add rax, 0x10
0x100343eeb: mov qword ptr [rip + 0x1ab1576], rax ; 0x101df5468
0x100343ef2: xor eax, eax
0x100343ef4: call 0x100011c10 ; 0x100011c10
0x100343ef9: lea rax, [rip + 0x81c13c] ; 0x100b6003c Tool_Export
0x100343f00: vmovq xmm1, rax
0x100343f05: lea rax, [rip + 0x81aad3] ; 0x100b5e9df true
0x100343f0c: vmovq xmm0, rax
0x100343f11: vpunpcklqdq xmm1, xmm1, xmm0
0x100343f15: vmovdqa xmmword ptr [rip + 0x1ab15b3], xmm1 ; 0x101df54d0
0x100343f1d: lea rax, [rip + 0x1ab15ac] ; 0x101df54d0
0x100343f24: mov rcx, qword ptr [rip + 0x1ab154d] ; 0x101df5478
0x100343f2b: mov qword ptr [rip + 0x1ab15ae], rcx ; 0x101df54e0
0x100343f32: mov qword ptr [rip + 0x1ab153f], rax ; 0x101df5478
0x100343f39: lea rax, [rip + 0x833101] ; 0x100b77041 SetTransform
0x100343f40: mov qword ptr [rip + 0x1ab15a1], rax ; 0x101df54e8
0x100343f47: lea rcx, [rip + 0x1ab159a] ; 0x101df54e8
0x100343f4e: mov qword ptr [rip + 0x1ab1597], 0 ; 0x101df54f0
0x100343f59: mov rax, qword ptr [rip + 0x92c000] ; 0x100c6ff60
0x100343f60: mov qword ptr [rip + 0x1ab1591], rax ; 0x101df54f8
0x100343f67: lea rax, [rip - 0x93ae] ; 0x10033abc0
0x100343f6e: vmovq xmm1, rax
0x100343f73: vmovdqu xmmword ptr [rip + 0x1ab15a5], xmm1 ; 0x101df5520
0x100343f7b: mov rax, qword ptr [rip + 0x8c22c6] ; 0x100c06248 -> 0x100341560 __Z12ApplyWrapperI5FlameMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x100343f82: mov qword ptr [rip + 0x1ab15a7], rax ; 0x101df5530
0x100343f89: mov rax, qword ptr [rip + 0x8c5b48] ; 0x100c09ad8 -> 0x100341600 __Z21InitFunctionSignatureIM5FlameFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x100343f90: mov qword ptr [rip + 0x1ab15a1], rax ; 0x101df5538
0x100343f97: mov rax, qword ptr [rip + 0x8c4652] ; 0x100c085f0 -> 0x100340cc0 __Z18GetMetaClassByTypeIP5FlameERK9MetaClassv
0x100343f9e: mov qword ptr [rip + 0x1ab159b], rax ; 0x101df5540
0x100343fa5: lea rdx, [rip + 0x82f2b3] ; 0x100b7325f GetTransform
0x100343fac: mov qword ptr [rip + 0x1ab1595], rdx ; 0x101df5548
0x100343fb3: lea rdx, [rip + 0x1ab158e] ; 0x101df5548
0x100343fba: mov qword ptr [rip + 0x1ab158b], 0 ; 0x101df5550
0x100343fc5: mov qword ptr [rip + 0x1ab158c], rcx ; 0x101df5558
0x100343fcc: mov ecx, 0x19
0x100343fd1: vmovq xmm1, rcx
0x100343fd6: vmovdqu xmmword ptr [rip + 0x1ab15a2], xmm1 ; 0x101df5580
0x100343fde: mov rcx, qword ptr [rip + 0x8c2273] ; 0x100c06258 -> 0x100341680 __Z12ApplyWrapperI5FlameMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x100343fe5: mov qword ptr [rip + 0x1ab15a4], rcx ; 0x101df5590
0x100343fec: mov rsi, qword ptr [rip + 0x8c5af5] ; 0x100c09ae8 -> 0x100341710 __Z21InitFunctionSignatureIM5FlameKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x100343ff3: mov qword ptr [rip + 0x1ab159e], rsi ; 0x101df5598
0x100343ffa: mov qword ptr [rip + 0x1ab159f], rax ; 0x101df55a0
0x100344001: lea rdi, [rip + 0x82f264] ; 0x100b7326c GetObb
0x100344008: mov qword ptr [rip + 0x1ab1599], rdi ; 0x101df55a8
0x10034400f: lea rdi, [rip + 0x1ab1592] ; 0x101df55a8
0x100344016: mov qword ptr [rip + 0x1ab158f], 0 ; 0x101df55b0
0x100344021: mov qword ptr [rip + 0x1ab1590], rdx ; 0x101df55b8
0x100344028: mov edx, 0x21
0x10034402d: vmovq xmm1, rdx
0x100344032: vmovdqu xmmword ptr [rip + 0x1ab15a6], xmm1 ; 0x101df55e0
0x10034403a: mov qword ptr [rip + 0x1ab15af], rcx ; 0x101df55f0
0x100344041: mov qword ptr [rip + 0x1ab15b0], rsi ; 0x101df55f8
0x100344048: mov qword ptr [rip + 0x1ab15b1], rax ; 0x101df5600
0x10034404f: lea rcx, [rip + 0x832ff8] ; 0x100b7704e SetEnabled
0x100344056: mov qword ptr [rip + 0x1ab15ab], rcx ; 0x101df5608
0x10034405d: lea rcx, [rip + 0x1ab15a4] ; 0x101df5608
0x100344064: mov qword ptr [rip + 0x1ab15a1], 0 ; 0x101df5610
0x10034406f: mov qword ptr [rip + 0x1ab15a2], rdi ; 0x101df5618
0x100344076: lea rdx, [rip - 0x943d] ; 0x10033ac40
0x10034407d: vmovq xmm1, rdx
0x100344082: vmovdqu xmmword ptr [rip + 0x1ab15b6], xmm1 ; 0x101df5640
0x10034408a: mov rdx, qword ptr [rip + 0x8c21bf] ; 0x100c06250 -> 0x100341740 __Z12ApplyWrapperI5FlameMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x100344091: mov qword ptr [rip + 0x1ab15b8], rdx ; 0x101df5650
0x100344098: mov rdx, qword ptr [rip + 0x8c5a41] ; 0x100c09ae0 -> 0x1003417e0 __Z21InitFunctionSignatureIM5FlameFvbEEvP17FunctionSignature
0x10034409f: mov qword ptr [rip + 0x1ab15b2], rdx ; 0x101df5658
0x1003440a6: mov qword ptr [rip + 0x1ab15b3], rax ; 0x101df5660
0x1003440ad: lea rdx, [rip + 0x82f1bf] ; 0x100b73273 GetEnabled
0x1003440b4: mov qword ptr [rip + 0x1ab15ad], rdx ; 0x101df5668
0x1003440bb: lea rdx, [rip + 0x1ab15a6] ; 0x101df5668
0x1003440c2: mov qword ptr [rip + 0x1ab15a3], 0 ; 0x101df5670
0x1003440cd: mov qword ptr [rip + 0x1ab15a4], rcx ; 0x101df5678
0x1003440d4: mov ecx, 0x11
0x1003440d9: vmovq xmm1, rcx
0x1003440de: vmovdqu xmmword ptr [rip + 0x1ab15ba], xmm1 ; 0x101df56a0
0x1003440e6: mov rcx, qword ptr [rip + 0x8c2173] ; 0x100c06260 -> 0x100341860 __Z12ApplyWrapperI5FlameMS0_KFbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1003440ed: mov qword ptr [rip + 0x1ab15bc], rcx ; 0x101df56b0
0x1003440f4: mov rsi, qword ptr [rip + 0x8c59f5] ; 0x100c09af0 -> 0x1003418e0 __Z21InitFunctionSignatureIM5FlameKFbvEEvP17FunctionSignature
0x1003440fb: mov qword ptr [rip + 0x1ab15b6], rsi ; 0x101df56b8
0x100344102: mov qword ptr [rip + 0x1ab15b7], rax ; 0x101df56c0
0x100344109: lea rdi, [rip + 0x81bf67] ; 0x100b60077 OnResumeEnabled
0x100344110: mov qword ptr [rip + 0x1ab15b1], rdi ; 0x101df56c8
0x100344117: lea rdi, [rip + 0x1ab15aa] ; 0x101df56c8
0x10034411e: mov qword ptr [rip + 0x1ab15a7], 0 ; 0x101df56d0
0x100344129: mov qword ptr [rip + 0x1ab15a8], rdx ; 0x101df56d8
0x100344130: lea rdx, [rip - 0x94c7] ; 0x10033ac70
0x100344137: vmovq xmm1, rdx
0x10034413c: vmovdqu xmmword ptr [rip + 0x1ab15bc], xmm1 ; 0x101df5700
0x100344144: mov rdx, qword ptr [rip + 0x8c20f5] ; 0x100c06240 -> 0x100341910 __Z12ApplyWrapperI5FlameMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x10034414b: mov qword ptr [rip + 0x1ab15be], rdx ; 0x101df5710
0x100344152: mov rdx, qword ptr [rip + 0x8c5977] ; 0x100c09ad0 -> 0x1003419b0 __Z21InitFunctionSignatureIM5FlameFvP4GameEEvP17FunctionSignature
0x100344159: mov qword ptr [rip + 0x1ab15b8], rdx ; 0x101df5718
0x100344160: mov qword ptr [rip + 0x1ab15b9], rax ; 0x101df5720
0x100344167: lea r13, [rip + 0x820400] ; 0x100b6456e GetResumeEnabled
0x10034416e: mov qword ptr [rip + 0x1ab15b3], r13 ; 0x101df5728
0x100344175: lea rdx, [rip + 0x1ab15ac] ; 0x101df5728
0x10034417c: mov qword ptr [rip + 0x1ab15a9], 0 ; 0x101df5730
0x100344187: mov qword ptr [rip + 0x1ab15aa], rdi ; 0x101df5738
0x10034418e: mov qword ptr [rip + 0x92bdcb], rdx ; 0x100c6ff60
0x100344195: lea rdx, [rip - 0x950c] ; 0x10033ac90
0x10034419c: vmovq xmm1, rdx
0x1003441a1: vmovdqu xmmword ptr [rip + 0x1ab15b7], xmm1 ; 0x101df5760
0x1003441a9: mov qword ptr [rip + 0x1ab15c0], rcx ; 0x101df5770
0x1003441b0: mov qword ptr [rip + 0x1ab15c1], rsi ; 0x101df5778
0x1003441b7: mov qword ptr [rip + 0x1ab15c2], rax ; 0x101df5780
0x1003441be: lea rcx, [rip + 0x832e94] ; 0x100b77059 enabled
0x1003441c5: mov qword ptr [rip + 0x96a7b4], rcx ; 0x100cae980
0x1003441cc: lea rcx, [rip + 0x96a7ad] ; 0x100cae980
0x1003441d3: mov rdx, qword ptr [rip + 0x933a86] ; 0x100c77c60
0x1003441da: mov qword ptr [rip + 0x96a7af], rdx ; 0x100cae990
0x1003441e1: mov qword ptr [rip + 0x96a7b4], 0xb4 ; 0x100cae9a0
0x1003441ec: mov r15, qword ptr [rip + 0x8c3365] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1003441f3: mov qword ptr [rip + 0x96a7ae], r15 ; 0x100cae9a8
0x1003441fa: mov qword ptr [rip + 0x96a7af], rax ; 0x100cae9b0
0x100344201: mov qword ptr [rip + 0x96a7ac], 0xffffffffffffffff ; 0x100cae9b8
0x10034420c: lea rbx, [rip - 0x32a7f3] ; 0x100019a20
0x100344213: mov qword ptr [rip + 0x96a7a6], rbx ; 0x100cae9c0
0x10034421a: mov qword ptr [rip + 0x96a7a3], 0 ; 0x100cae9c8
0x100344225: lea rdx, [rip + 0x81a7d6] ; 0x100b5ea02 Tool_DefaultValue
0x10034422c: vmovq xmm1, rdx
0x100344231: vpunpcklqdq xmm3, xmm1, xmm0
0x100344235: vmovdqa xmmword ptr [rbp - 0x50], xmm3
0x10034423a: vmovdqa xmm2, xmm1
0x10034423e: vmovdqa xmmword ptr [rip + 0x1ab154a], xmm3 ; 0x101df5790
0x100344246: lea rdx, [rip + 0x1ab1543] ; 0x101df5790
0x10034424d: mov qword ptr [rip + 0x1ab1548], 0 ; 0x101df57a0
0x100344258: mov qword ptr [rip + 0x96a729], rdx ; 0x100cae988
0x10034425f: lea rdx, [rip + 0x826e59] ; 0x100b6b0bf transform
0x100344266: mov qword ptr [rip + 0x96a763], rdx ; 0x100cae9d0
0x10034426d: lea rdx, [rip + 0x96a75c] ; 0x100cae9d0
0x100344274: mov qword ptr [rip + 0x96a759], 0 ; 0x100cae9d8
0x10034427f: mov qword ptr [rip + 0x96a75a], rcx ; 0x100cae9e0
0x100344286: mov qword ptr [rip + 0x96a75f], 0x10 ; 0x100cae9f0
0x100344291: mov rcx, qword ptr [rip + 0x8c2b30] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x100344298: mov qword ptr [rip + 0x96a759], rcx ; 0x100cae9f8
0x10034429f: mov qword ptr [rip + 0x96a75a], rax ; 0x100caea00
0x1003442a6: mov qword ptr [rip + 0x96a757], 0xffffffffffffffff ; 0x100caea08
0x1003442b1: mov qword ptr [rip + 0x96a758], rbx ; 0x100caea10
0x1003442b8: mov qword ptr [rip + 0x96a755], 0 ; 0x100caea18
0x1003442c3: lea rcx, [rip + 0x8352bb] ; 0x100b79585 lit
0x1003442ca: mov qword ptr [rip + 0x96a74f], rcx ; 0x100caea20
0x1003442d1: lea rcx, [rip + 0x96a748] ; 0x100caea20
0x1003442d8: mov qword ptr [rip + 0x96a745], 0 ; 0x100caea28
0x1003442e3: mov qword ptr [rip + 0x96a746], rdx ; 0x100caea30
0x1003442ea: mov qword ptr [rip + 0x96a74b], 0xb6 ; 0x100caea40
0x1003442f5: mov qword ptr [rip + 0x96a74c], r15 ; 0x100caea48
0x1003442fc: mov qword ptr [rip + 0x96a74d], rax ; 0x100caea50
0x100344303: mov qword ptr [rip + 0x96a74a], 0xffffffffffffffff ; 0x100caea58
0x10034430e: mov qword ptr [rip + 0x96a74b], rbx ; 0x100caea60
0x100344315: mov qword ptr [rip + 0x96a748], 0 ; 0x100caea68
0x100344320: lea rdx, [rip + 0x83d2e4] ; 0x100b8160b burnOut
0x100344327: mov qword ptr [rip + 0x96a742], rdx ; 0x100caea70
0x10034432e: lea rdx, [rip + 0x96a73b] ; 0x100caea70
0x100344335: mov qword ptr [rip + 0x96a744], rcx ; 0x100caea80
0x10034433c: mov qword ptr [rip + 0x96a749], 0xb8 ; 0x100caea90
0x100344347: mov qword ptr [rip + 0x96a74a], r15 ; 0x100caea98
0x10034434e: mov qword ptr [rip + 0x96a74b], rax ; 0x100caeaa0
0x100344355: mov qword ptr [rip + 0x96a748], 0xffffffffffffffff ; 0x100caeaa8
0x100344360: mov qword ptr [rip + 0x96a749], rbx ; 0x100caeab0
0x100344367: mov qword ptr [rip + 0x96a746], 0 ; 0x100caeab8
0x100344372: lea rcx, [rip + 0x83d29a] ; 0x100b81613 burnOutDelay
0x100344379: mov qword ptr [rip + 0x96a740], rcx ; 0x100caeac0
0x100344380: lea rcx, [rip + 0x96a739] ; 0x100caeac0
0x100344387: mov qword ptr [rip + 0x96a742], rdx ; 0x100caead0
0x10034438e: mov qword ptr [rip + 0x96a747], 0xa0 ; 0x100caeae0
0x100344399: mov rdx, qword ptr [rip + 0x8c31c0] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1003443a0: mov qword ptr [rip + 0x96a741], rdx ; 0x100caeae8
0x1003443a7: mov r14, rdx
0x1003443aa: mov qword ptr [rip + 0x96a73f], rax ; 0x100caeaf0
0x1003443b1: mov qword ptr [rip + 0x96a73c], 0xffffffffffffffff ; 0x100caeaf8
0x1003443bc: mov qword ptr [rip + 0x96a73d], rbx ; 0x100caeb00
0x1003443c3: mov qword ptr [rip + 0x96a73a], 0 ; 0x100caeb08
0x1003443ce: lea rdx, [rip + 0x85ec57] ; 0x100ba302c false
0x1003443d5: vmovq xmm1, rdx
0x1003443da: vpunpcklqdq xmm1, xmm2, xmm1
0x1003443de: vmovdqa xmmword ptr [rip + 0x1ab13ca], xmm1 ; 0x101df57b0
0x1003443e6: lea rdx, [rip + 0x1ab13c3] ; 0x101df57b0
0x1003443ed: mov qword ptr [rip + 0x1ab13c8], 0 ; 0x101df57c0
0x1003443f8: mov qword ptr [rip + 0x96a679], rdx ; 0x100caea78
0x1003443ff: lea rdx, [rip + 0x83873c] ; 0x100b7cb42 30.0f
0x100344406: vmovq xmm1, rdx
0x10034440b: vpunpcklqdq xmm1, xmm2, xmm1
0x10034440f: vmovdqa xmmword ptr [rip + 0x1ab13b9], xmm1 ; 0x101df57d0
0x100344417: lea rdx, [rip + 0x1ab13b2] ; 0x101df57d0
0x10034441e: mov qword ptr [rip + 0x1ab13b7], 0 ; 0x101df57e0
0x100344429: mov qword ptr [rip + 0x96a698], rdx ; 0x100caeac8
0x100344430: lea rdx, [rip + 0x83d1e9] ; 0x100b81620 lightSpeedMult
0x100344437: mov qword ptr [rip + 0x96a6d2], rdx ; 0x100caeb10
0x10034443e: lea rdx, [rip + 0x96a6cb] ; 0x100caeb10
0x100344445: mov qword ptr [rip + 0x96a6d4], rcx ; 0x100caeb20
0x10034444c: mov qword ptr [rip + 0x96a6d9], 0xa4 ; 0x100caeb30
0x100344457: mov qword ptr [rip + 0x96a6da], r14 ; 0x100caeb38
0x10034445e: mov qword ptr [rip + 0x96a6db], rax ; 0x100caeb40
0x100344465: mov qword ptr [rip + 0x96a6d8], 0xffffffffffffffff ; 0x100caeb48
0x100344470: mov qword ptr [rip + 0x96a6d9], rbx ; 0x100caeb50
0x100344477: mov qword ptr [rip + 0x96a6d6], 0 ; 0x100caeb58
0x100344482: lea rcx, [rip + 0x81c7ae] ; 0x100b60c37 1.0f
0x100344489: vmovq xmm1, rcx
0x10034448e: vpunpcklqdq xmm1, xmm2, xmm1
0x100344492: vmovdqa xmmword ptr [rip + 0x1ab1356], xmm1 ; 0x101df57f0
0x10034449a: lea rcx, [rip + 0x1ab134f] ; 0x101df57f0
0x1003444a1: mov qword ptr [rip + 0x1ab1354], 0 ; 0x101df5800
0x1003444ac: mov qword ptr [rip + 0x96a665], rcx ; 0x100caeb18
0x1003444b3: lea rcx, [rip + 0x83d175] ; 0x100b8162f soundRadius
0x1003444ba: mov qword ptr [rip + 0x96a69f], rcx ; 0x100caeb60
0x1003444c1: lea rcx, [rip + 0x96a698] ; 0x100caeb60
0x1003444c8: mov qword ptr [rip + 0x96a6a1], rdx ; 0x100caeb70
0x1003444cf: mov qword ptr [rip + 0x96a6a6], 0xa8 ; 0x100caeb80
0x1003444da: mov qword ptr [rip + 0x96a6a7], r14 ; 0x100caeb88
0x1003444e1: mov qword ptr [rip + 0x96a6a8], rax ; 0x100caeb90
0x1003444e8: mov qword ptr [rip + 0x96a6a5], 0xffffffffffffffff ; 0x100caeb98
0x1003444f3: mov qword ptr [rip + 0x96a6a6], rbx ; 0x100caeba0
0x1003444fa: mov qword ptr [rip + 0x96a6a3], 0 ; 0x100caeba8
0x100344505: lea rdx, [rip + 0x83d12f] ; 0x100b8163b soundEventType
0x10034450c: mov qword ptr [rip + 0x96a69d], rdx ; 0x100caebb0
0x100344513: lea rdx, [rip + 0x96a696] ; 0x100caebb0
0x10034451a: mov qword ptr [rip + 0x96a693], 0 ; 0x100caebb8
0x100344525: mov qword ptr [rip + 0x96a694], rcx ; 0x100caebc0
0x10034452c: mov qword ptr [rip + 0x96a699], 0xbc ; 0x100caebd0
0x100344537: mov qword ptr [rip + 0x96a69a], r12 ; 0x100caebd8
0x10034453e: mov qword ptr [rip + 0x96a69b], rax ; 0x100caebe0
0x100344545: mov qword ptr [rip + 0x96a698], 0xffffffffffffffff ; 0x100caebe8
0x100344550: mov qword ptr [rip + 0x96a699], rbx ; 0x100caebf0
0x100344557: mov qword ptr [rip + 0x96a696], 0 ; 0x100caebf8
0x100344562: lea rcx, [rip + 0x83d0e1] ; 0x100b8164a soundParameter
0x100344569: mov qword ptr [rip + 0x96a690], rcx ; 0x100caec00
0x100344570: lea rcx, [rip + 0x96a689] ; 0x100caec00
0x100344577: mov qword ptr [rip + 0x96a692], rdx ; 0x100caec10
0x10034457e: mov qword ptr [rip + 0x96a697], 0xac ; 0x100caec20
0x100344589: mov qword ptr [rip + 0x96a698], r14 ; 0x100caec28
0x100344590: mov qword ptr [rip + 0x96a699], rax ; 0x100caec30
0x100344597: mov qword ptr [rip + 0x96a696], 0xffffffffffffffff ; 0x100caec38
0x1003445a2: mov qword ptr [rip + 0x96a697], rbx ; 0x100caec40
0x1003445a9: mov qword ptr [rip + 0x96a694], 0 ; 0x100caec48
0x1003445b4: lea rdx, [rip + 0x83d09e] ; 0x100b81659 20.0f
0x1003445bb: vmovq xmm1, rdx
0x1003445c0: vpunpcklqdq xmm1, xmm2, xmm1
0x1003445c4: vmovdqa xmm3, xmm2
0x1003445c8: vmovdqa xmmword ptr [rbp - 0x40], xmm3
0x1003445cd: vmovdqa xmmword ptr [rip + 0x1ab123b], xmm1 ; 0x101df5810
0x1003445d5: lea rdx, [rip + 0x1ab1234] ; 0x101df5810
0x1003445dc: mov qword ptr [rip + 0x1ab1239], 0 ; 0x101df5820
0x1003445e7: mov qword ptr [rip + 0x96a57a], rdx ; 0x100caeb68
0x1003445ee: lea rdx, [rip + 0x83d06a] ; 0x100b8165f (0.0, 5.0)
0x1003445f5: vmovq xmm1, rdx
0x1003445fa: lea rdx, [rip + 0x834677] ; 0x100b78c78 Tool_MinMaxValues
0x100344601: vmovq xmm2, rdx
0x100344606: vmovdqa xmmword ptr [rbp - 0x60], xmm2
0x10034460b: vpunpcklqdq xmm1, xmm2, xmm1
0x10034460f: vmovdqa xmmword ptr [rip + 0x1ab1219], xmm1 ; 0x101df5830
0x100344617: lea rdx, [rip + 0x1ab1212] ; 0x101df5830
0x10034461e: mov qword ptr [rip + 0x1ab1217], 0 ; 0x101df5840
0x100344629: mov qword ptr [rip + 0x96a5d8], rdx ; 0x100caec08
0x100344630: lea rdx, [rip + 0x83d033] ; 0x100b8166a buttonPos
0x100344637: mov qword ptr [rip + 0x96a612], rdx ; 0x100caec50
0x10034463e: lea rdx, [rip + 0x96a60b] ; 0x100caec50
0x100344645: mov qword ptr [rip + 0x96a614], rcx ; 0x100caec60
0x10034464c: mov qword ptr [rip + 0x96a619], 0x90 ; 0x100caec70
0x100344657: mov rcx, qword ptr [rip + 0x8c2cca] ; 0x100c07328 -> 0x10003a510 __Z17GetMetaTypeByTypeIP6MarkerERK8MetaTypev
0x10034465e: mov qword ptr [rip + 0x96a613], rcx ; 0x100caec78
0x100344665: mov qword ptr [rip + 0x96a614], rax ; 0x100caec80
0x10034466c: mov qword ptr [rip + 0x96a611], 0xffffffffffffffff ; 0x100caec88
0x100344677: mov qword ptr [rip + 0x96a612], rbx ; 0x100caec90
0x10034467e: mov qword ptr [rip + 0x96a60f], 0 ; 0x100caec98
0x100344689: lea rsi, [rip + 0x81a407] ; 0x100b5ea97 null
0x100344690: vmovq xmm1, rsi
0x100344695: vpunpcklqdq xmm1, xmm3, xmm1
0x100344699: vmovdqa xmmword ptr [rip + 0x1ab11af], xmm1 ; 0x101df5850
0x1003446a1: lea rsi, [rip + 0x1ab11a8] ; 0x101df5850
0x1003446a8: mov qword ptr [rip + 0x1ab11ad], 0 ; 0x101df5860
0x1003446b3: lea rdi, [rip + 0x81a35f] ; 0x100b5ea19 Tool_Nullable
0x1003446ba: vmovq xmm2, rdi
0x1003446bf: vpunpcklqdq xmm0, xmm2, xmm0
0x1003446c3: vmovdqa xmmword ptr [rip + 0x1ab11a5], xmm0 ; 0x101df5870
0x1003446cb: lea rdi, [rip + 0x1ab119e] ; 0x101df5870
0x1003446d2: mov qword ptr [rip + 0x1ab11a7], rsi ; 0x101df5880
0x1003446d9: mov qword ptr [rip + 0x96a578], rdi ; 0x100caec58
0x1003446e0: lea rsi, [rip + 0x83cf8d] ; 0x100b81674 lightStandPos
0x1003446e7: mov qword ptr [rip + 0x96a5b2], rsi ; 0x100caeca0
0x1003446ee: lea rsi, [rip + 0x96a5ab] ; 0x100caeca0
0x1003446f5: mov qword ptr [rip + 0x96a5b4], rdx ; 0x100caecb0
0x1003446fc: mov qword ptr [rip + 0x93355d], rsi ; 0x100c77c60
0x100344703: mov qword ptr [rip + 0x96a5b2], 0x98 ; 0x100caecc0
0x10034470e: mov qword ptr [rip + 0x96a5b3], rcx ; 0x100caecc8
0x100344715: mov qword ptr [rip + 0x96a5b4], rax ; 0x100caecd0
0x10034471c: mov qword ptr [rip + 0x96a5b1], 0xffffffffffffffff ; 0x100caecd8
0x100344727: mov qword ptr [rip + 0x96a5b2], rbx ; 0x100caece0
0x10034472e: mov qword ptr [rip + 0x96a5af], 0 ; 0x100caece8
0x100344739: vmovdqa xmmword ptr [rip + 0x1ab114f], xmm1 ; 0x101df5890
0x100344741: lea rax, [rip + 0x1ab1148] ; 0x101df5890
0x100344748: mov qword ptr [rip + 0x1ab114d], 0 ; 0x101df58a0
0x100344753: vmovdqa xmmword ptr [rip + 0x1ab1155], xmm0 ; 0x101df58b0
0x10034475b: lea rcx, [rip + 0x1ab114e] ; 0x101df58b0
0x100344762: mov qword ptr [rip + 0x1ab1157], rax ; 0x101df58c0
0x100344769: mov qword ptr [rip + 0x96a538], rcx ; 0x100caeca8
0x100344770: lea rax, [rip + 0x83cf0b] ; 0x100b81682 kLogFlames
0x100344777: mov qword ptr [rip + 0x1ab1152], rax ; 0x101df58d0
0x10034477e: lea rax, [rip + 0x1ab114b] ; 0x101df58d0
0x100344785: mov rcx, qword ptr [rip + 0x94b514] ; 0x100c8fca0
0x10034478c: mov qword ptr [rip + 0x1ab114d], rcx ; 0x101df58e0
0x100344793: mov qword ptr [rip + 0x94b506], rax ; 0x100c8fca0
0x10034479a: lea rax, [rip + 0x1ab1127] ; 0x101df58c8
0x1003447a1: vmovq xmm0, rax
0x1003447a6: lea rax, [rip + 0x83cee0] ; 0x100b8168d FlameBarn.cpp
0x1003447ad: vmovq xmm1, rax
0x1003447b2: vpunpcklqdq xmm0, xmm1, xmm0
0x1003447b6: vmovdqu xmmword ptr [rip + 0x1ab1132], xmm0 ; 0x101df58f0
0x1003447be: mov qword ptr [rip + 0x1ab113b], r15 ; 0x101df5900
0x1003447c5: mov qword ptr [rip + 0x1ab1138], 0 ; 0x101df5908
0x1003447d0: mov qword ptr [rip + 0x1ab1139], rbx ; 0x101df5910
0x1003447d7: mov qword ptr [rip + 0x1ab1136], 0 ; 0x101df5918
0x1003447e2: lea rax, [rip + 0x81d649] ; 0x100b61e32 Debug
0x1003447e9: vmovq xmm0, rax
0x1003447ee: lea rax, [rip + 0x819828] ; 0x100b5e01d TweakCategory
0x1003447f5: vmovq xmm1, rax
0x1003447fa: vpunpcklqdq xmm0, xmm1, xmm0
0x1003447fe: vmovdqa xmmword ptr [rip + 0x1ab111a], xmm0 ; 0x101df5920
0x100344806: lea rax, [rip + 0x1ab1113] ; 0x101df5920
0x10034480d: mov qword ptr [rip + 0x1ab1118], 0 ; 0x101df5930
0x100344818: mov qword ptr [rip + 0x1ab10b9], rax ; 0x101df58d8
0x10034481f: lea rax, [rip + 0x83cee2] ; 0x100b81708 FlameBarn
0x100344826: mov qword ptr [rip + 0x1ab1113], rax ; 0x101df5940
0x10034482d: lea rax, [rip + 0x1ab1104] ; 0x101df5938
0x100344834: mov qword ptr [rip + 0x1ab1109], 0 ; 0x101df5948
0x10034483f: mov rcx, qword ptr [rip + 0x92b712] ; 0x100c6ff58
0x100344846: mov qword ptr [rip + 0x1ab1103], rcx ; 0x101df5950
0x10034484d: mov qword ptr [rip + 0x92b704], rax ; 0x100c6ff58
0x100344854: mov qword ptr [rip + 0x1ab1105], rax ; 0x101df5960
0x10034485b: mov rax, qword ptr [rip + 0x8c3e4e] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x100344862: mov qword ptr [rip + 0x1ab10ff], rax ; 0x101df5968
0x100344869: mov dword ptr [rip + 0x1ab10fd], 0xffffffff ; 0x101df5970
0x100344873: mov dword ptr [rip + 0x1ab10f7], 0xffffffff ; 0x101df5974
0x10034487d: mov qword ptr [rip + 0x1ab1108], 0 ; 0x101df5990
0x100344888: mov rax, qword ptr [rip + 0x8c8039] ; 0x100c0c8c8
0x10034488f: add rax, 0x10
0x100344893: mov qword ptr [rip + 0x1ab109e], rax ; 0x101df5938
0x10034489a: xor eax, eax
0x10034489c: call 0x100011c10 ; 0x100011c10
0x1003448a1: lea rax, [rip + 0x818064] ; 0x100b5c90c Initialize
0x1003448a8: mov qword ptr [rip + 0x1ab10e9], rax ; 0x101df5998
0x1003448af: lea rcx, [rip + 0x1ab10e2] ; 0x101df5998
0x1003448b6: mov qword ptr [rip + 0x1ab10df], 0 ; 0x101df59a0
0x1003448c1: mov rax, qword ptr [rip + 0x92b698] ; 0x100c6ff60
0x1003448c8: mov qword ptr [rip + 0x1ab10d9], rax ; 0x101df59a8
0x1003448cf: lea rax, [rip - 0x7436] ; 0x10033d4a0
0x1003448d6: vmovq xmm0, rax
0x1003448db: vmovdqu xmmword ptr [rip + 0x1ab10ed], xmm0 ; 0x101df59d0
0x1003448e3: mov rax, qword ptr [rip + 0x8c1fde] ; 0x100c068c8 -> 0x100341df0 __Z12ApplyWrapperI9FlameBarnMS0_FvP15ResourceManagerP5SceneEEvM9VoidClassFvvEPv8VariablePSB_j
0x1003448ea: mov qword ptr [rip + 0x1ab10ef], rax ; 0x101df59e0
0x1003448f1: mov rax, qword ptr [rip + 0x8c5860] ; 0x100c0a158 -> 0x100341e00 __Z21InitFunctionSignatureIM9FlameBarnFvP15ResourceManagerP5SceneEEvP17FunctionSignature
0x1003448f8: mov qword ptr [rip + 0x1ab10e9], rax ; 0x101df59e8
0x1003448ff: mov rax, qword ptr [rip + 0x8c40aa] ; 0x100c089b0 -> 0x100341de0 __Z18GetMetaClassByTypeIP9FlameBarnERK9MetaClassv
0x100344906: mov qword ptr [rip + 0x1ab10e3], rax ; 0x101df59f0
0x10034490d: lea rdx, [rip + 0x818039] ; 0x100b5c94d Update
0x100344914: mov qword ptr [rip + 0x1ab10dd], rdx ; 0x101df59f8
0x10034491b: lea rdx, [rip + 0x1ab10d6] ; 0x101df59f8
0x100344922: mov qword ptr [rip + 0x1ab10d3], 0 ; 0x101df5a00
0x10034492d: mov qword ptr [rip + 0x1ab10d4], rcx ; 0x101df5a08
0x100344934: lea rcx, [rip - 0x73ab] ; 0x10033d590
0x10034493b: vmovq xmm0, rcx
0x100344940: vmovdqu xmmword ptr [rip + 0x1ab10e8], xmm0 ; 0x101df5a30
0x100344948: mov rcx, qword ptr [rip + 0x8c1f99] ; 0x100c068e8 -> 0x100341f60 __Z12ApplyWrapperI9FlameBarnMS0_FvP6CameraP4GameP10LightHouseEEvM9VoidClassFvvEPv8VariablePSD_j
0x10034494f: mov qword ptr [rip + 0x1ab10ea], rcx ; 0x101df5a40
0x100344956: mov rcx, qword ptr [rip + 0x8c581b] ; 0x100c0a178 -> 0x100341f70 __Z21InitFunctionSignatureIM9FlameBarnFvP6CameraP4GameP10LightHouseEEvP17FunctionSignature
0x10034495d: mov qword ptr [rip + 0x1ab10e4], rcx ; 0x101df5a48
0x100344964: mov qword ptr [rip + 0x1ab10e5], rax ; 0x101df5a50
0x10034496b: lea rcx, [rip + 0x81c0d3] ; 0x100b60a45 OnLevelLoad
0x100344972: mov qword ptr [rip + 0x1ab10df], rcx ; 0x101df5a58
0x100344979: lea rcx, [rip + 0x1ab10d8] ; 0x101df5a58
0x100344980: mov qword ptr [rip + 0x1ab10d5], 0 ; 0x101df5a60
0x10034498b: mov qword ptr [rip + 0x1ab10d6], rdx ; 0x101df5a68
0x100344992: lea rdx, [rip - 0x5c39] ; 0x10033ed60
0x100344999: vmovq xmm0, rdx
0x10034499e: vmovdqu xmmword ptr [rip + 0x1ab10ea], xmm0 ; 0x101df5a90
0x1003449a6: mov rdx, qword ptr [rip + 0x8c1f23] ; 0x100c068d0 -> 0x100342110 __Z12ApplyWrapperI9FlameBarnMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x1003449ad: mov qword ptr [rip + 0x1ab10ec], rdx ; 0x101df5aa0
0x1003449b4: mov rdx, qword ptr [rip + 0x8c57a5] ; 0x100c0a160 -> 0x1003421b0 __Z21InitFunctionSignatureIM9FlameBarnFvP4GameEEvP17FunctionSignature
0x1003449bb: mov qword ptr [rip + 0x1ab10e6], rdx ; 0x101df5aa8
0x1003449c2: mov qword ptr [rip + 0x1ab10e7], rax ; 0x101df5ab0
0x1003449c9: lea rdx, [rip + 0x81c08b] ; 0x100b60a5b OnLevelUnload
0x1003449d0: mov qword ptr [rip + 0x1ab10e1], rdx ; 0x101df5ab8
0x1003449d7: lea rsi, [rip + 0x1ab10da] ; 0x101df5ab8
0x1003449de: mov qword ptr [rip + 0x1ab10d7], 0 ; 0x101df5ac0
0x1003449e9: mov qword ptr [rip + 0x1ab10d8], rcx ; 0x101df5ac8
0x1003449f0: lea rcx, [rip - 0x5ab7] ; 0x10033ef40
0x1003449f7: vmovq xmm0, rcx
0x1003449fc: vmovdqu xmmword ptr [rip + 0x1ab10ec], xmm0 ; 0x101df5af0
0x100344a04: mov rcx, qword ptr [rip + 0x8c1ee5] ; 0x100c068f0 0"4
0x100344a0b: mov qword ptr [rip + 0x1ab10ee], rcx ; 0x101df5b00
0x100344a12: mov rdx, qword ptr [rip + 0x8c5767] ; 0x100c0a180 -> 0x100342290 __Z21InitFunctionSignatureIM9FlameBarnFvvEEvP17FunctionSignature
0x100344a19: mov qword ptr [rip + 0x1ab10e8], rdx ; 0x101df5b08
0x100344a20: mov qword ptr [rip + 0x1ab10e9], rax ; 0x101df5b10
0x100344a27: lea rdi, [rip + 0x81d3d3] ; 0x100b61e01 RenderFlush
0x100344a2e: mov qword ptr [rip + 0x1ab10e3], rdi ; 0x101df5b18
0x100344a35: lea rdi, [rip + 0x1ab10dc] ; 0x101df5b18
0x100344a3c: mov qword ptr [rip + 0x1ab10d9], 0 ; 0x101df5b20
0x100344a47: mov qword ptr [rip + 0x1ab10da], rsi ; 0x101df5b28
0x100344a4e: lea rsi, [rip - 0x5985] ; 0x10033f0d0
0x100344a55: vmovq xmm0, rsi
0x100344a5a: vmovdqu xmmword ptr [rip + 0x1ab10ee], xmm0 ; 0x101df5b50
0x100344a62: mov rsi, qword ptr [rip + 0x8c1e77] ; 0x100c068e0 -> 0x1003422b0 __Z12ApplyWrapperI9FlameBarnMS0_FvP6CameraP4GameEEvM9VoidClassFvvEPv8VariablePSB_j
0x100344a69: mov qword ptr [rip + 0x1ab10f0], rsi ; 0x101df5b60
0x100344a70: mov rsi, qword ptr [rip + 0x8c56f9] ; 0x100c0a170 -> 0x1003422c0 __Z21InitFunctionSignatureIM9FlameBarnFvP6CameraP4GameEEvP17FunctionSignature
0x100344a77: mov qword ptr [rip + 0x1ab10ea], rsi ; 0x101df5b68
0x100344a7e: mov qword ptr [rip + 0x1ab10eb], rax ; 0x101df5b70
0x100344a85: lea rsi, [rip + 0x817eac] ; 0x100b5c938 Terminate
0x100344a8c: mov qword ptr [rip + 0x1ab10e5], rsi ; 0x101df5b78
0x100344a93: lea rsi, [rip + 0x1ab10de] ; 0x101df5b78
0x100344a9a: mov qword ptr [rip + 0x1ab10db], 0 ; 0x101df5b80
0x100344aa5: mov qword ptr [rip + 0x1ab10dc], rdi ; 0x101df5b88
0x100344aac: lea rdi, [rip - 0x5973] ; 0x10033f140
0x100344ab3: vmovq xmm0, rdi
0x100344ab8: vmovdqu xmmword ptr [rip + 0x1ab10f0], xmm0 ; 0x101df5bb0
0x100344ac0: mov qword ptr [rip + 0x1ab10f9], rcx ; 0x101df5bc0
0x100344ac7: mov qword ptr [rip + 0x1ab10fa], rdx ; 0x101df5bc8
0x100344ace: mov qword ptr [rip + 0x1ab10fb], rax ; 0x101df5bd0
0x100344ad5: lea rdi, [rip + 0x817e83] ; 0x100b5c95f HotLoad
0x100344adc: mov qword ptr [rip + 0x1ab10f5], rdi ; 0x101df5bd8
0x100344ae3: lea rdi, [rip + 0x1ab10ee] ; 0x101df5bd8
0x100344aea: mov qword ptr [rip + 0x1ab10eb], 0 ; 0x101df5be0
0x100344af5: mov qword ptr [rip + 0x1ab10ec], rsi ; 0x101df5be8
0x100344afc: lea rsi, [rip - 0x5833] ; 0x10033f2d0
0x100344b03: vmovq xmm0, rsi
0x100344b08: vmovdqu xmmword ptr [rip + 0x1ab1100], xmm0 ; 0x101df5c10
0x100344b10: mov qword ptr [rip + 0x1ab1109], rcx ; 0x101df5c20
0x100344b17: mov qword ptr [rip + 0x1ab110a], rdx ; 0x101df5c28
0x100344b1e: mov qword ptr [rip + 0x1ab110b], rax ; 0x101df5c30
0x100344b25: lea rcx, [rip + 0x83cbe6] ; 0x100b81712 CreateFlame
0x100344b2c: mov qword ptr [rip + 0x1ab1105], rcx ; 0x101df5c38
0x100344b33: lea rcx, [rip + 0x1ab10fe] ; 0x101df5c38
0x100344b3a: mov qword ptr [rip + 0x1ab1107], rdi ; 0x101df5c48
0x100344b41: lea rdx, [rip - 0x56d8] ; 0x10033f470
0x100344b48: vmovq xmm0, rdx
0x100344b4d: vmovdqu xmmword ptr [rip + 0x1ab111b], xmm0 ; 0x101df5c70
0x100344b55: mov rdx, qword ptr [rip + 0x8c1d64] ; 0x100c068c0  $4
0x100344b5c: mov qword ptr [rip + 0x1ab111d], rdx ; 0x101df5c80
0x100344b63: mov rdx, qword ptr [rip + 0x8c55e6] ; 0x100c0a150 -> 0x1003424e0 __Z21InitFunctionSignatureIM9FlameBarnFP5FlamePK9MetaClassEEvP17FunctionSignature
0x100344b6a: mov qword ptr [rip + 0x1ab1117], rdx ; 0x101df5c88
0x100344b71: mov qword ptr [rip + 0x1ab1118], rax ; 0x101df5c90
0x100344b78: lea rdx, [rip + 0x832549] ; 0x100b770c8 ObjectFactory_CreatesType
0x100344b7f: vmovq xmm0, rdx
0x100344b84: lea rdx, [rip + 0x8382ec] ; 0x100b7ce77 Flame
0x100344b8b: vmovq xmm1, rdx
0x100344b90: vpunpcklqdq xmm0, xmm0, xmm1
0x100344b94: vmovdqa xmmword ptr [rip + 0x1ab1104], xmm0 ; 0x101df5ca0
0x100344b9c: lea rdx, [rip + 0x1ab10fd] ; 0x101df5ca0
0x100344ba3: mov qword ptr [rip + 0x1ab1102], 0 ; 0x101df5cb0
0x100344bae: mov qword ptr [rip + 0x1ab108b], rdx ; 0x101df5c40
0x100344bb5: lea rdx, [rip + 0x83cb62] ; 0x100b8171e ReleaseFlame
0x100344bbc: mov qword ptr [rip + 0x1ab10f5], rdx ; 0x101df5cb8
0x100344bc3: lea rdx, [rip + 0x1ab10ee] ; 0x101df5cb8
0x100344bca: mov qword ptr [rip + 0x1ab10f7], rcx ; 0x101df5cc8
0x100344bd1: mov qword ptr [rip + 0x92b388], rdx ; 0x100c6ff60
0x100344bd8: lea rcx, [rip - 0x571f] ; 0x10033f4c0
0x100344bdf: vmovq xmm0, rcx
0x100344be4: vmovdqu xmmword ptr [rip + 0x1ab1104], xmm0 ; 0x101df5cf0
0x100344bec: mov rcx, qword ptr [rip + 0x8c1ce5] ; 0x100c068d8 `%4
0x100344bf3: mov qword ptr [rip + 0x1ab1106], rcx ; 0x101df5d00
0x100344bfa: mov rcx, qword ptr [rip + 0x8c5567] ; 0x100c0a168 -> 0x1003425f0 __Z21InitFunctionSignatureIM9FlameBarnFvP5FlameEEvP17FunctionSignature
0x100344c01: mov qword ptr [rip + 0x1ab1100], rcx ; 0x101df5d08
0x100344c08: mov qword ptr [rip + 0x1ab1101], rax ; 0x101df5d10
0x100344c0f: lea rax, [rip + 0x8324de] ; 0x100b770f4 ObjectFactory_ReleasesType
0x100344c16: vmovq xmm0, rax
0x100344c1b: vpunpcklqdq xmm0, xmm0, xmm1
0x100344c1f: vmovdqa xmmword ptr [rip + 0x1ab10f9], xmm0 ; 0x101df5d20
0x100344c27: lea rax, [rip + 0x1ab10f2] ; 0x101df5d20
0x100344c2e: mov qword ptr [rip + 0x1ab10f7], 0 ; 0x101df5d30
0x100344c39: mov qword ptr [rip + 0x1ab1080], rax ; 0x101df5cc0
0x100344c40: lea rax, [rip + 0x83cb1a] ; 0x100b81761 OnFlame
0x100344c47: mov qword ptr [rip + 0x1ab10f2], rax ; 0x101df5d40
0x100344c4e: lea rax, [rip + 0x1ab10e3] ; 0x101df5d38
0x100344c55: mov qword ptr [rip + 0x1ab10e8], 0 ; 0x101df5d48
0x100344c60: mov rcx, qword ptr [rip + 0x92b2f1] ; 0x100c6ff58
0x100344c67: mov qword ptr [rip + 0x1ab10e2], rcx ; 0x101df5d50
0x100344c6e: mov qword ptr [rip + 0x92b2e3], rax ; 0x100c6ff58
0x100344c75: mov qword ptr [rip + 0x1ab10e4], rax ; 0x101df5d60
0x100344c7c: mov rax, qword ptr [rip + 0x8c3965] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x100344c83: mov qword ptr [rip + 0x1ab10de], rax ; 0x101df5d68
0x100344c8a: mov dword ptr [rip + 0x1ab10dc], 0xffffffff ; 0x101df5d70
0x100344c94: mov dword ptr [rip + 0x1ab10d6], 0xffffffff ; 0x101df5d74
0x100344c9e: mov qword ptr [rip + 0x1ab10e7], 0 ; 0x101df5d90
0x100344ca9: mov rax, qword ptr [rip + 0x8c7968] ; 0x100c0c618
0x100344cb0: add rax, 0x10
0x100344cb4: mov qword ptr [rip + 0x1ab107d], rax ; 0x101df5d38
0x100344cbb: xor eax, eax
0x100344cbd: call 0x100011c10 ; 0x100011c10
0x100344cc2: mov qword ptr [rip + 0x1ab10cf], r13 ; 0x101df5d98
0x100344cc9: lea rcx, [rip + 0x1ab10c8] ; 0x101df5d98
0x100344cd0: mov qword ptr [rip + 0x1ab10c5], 0 ; 0x101df5da0
0x100344cdb: mov rax, qword ptr [rip + 0x92b27e] ; 0x100c6ff60
0x100344ce2: mov qword ptr [rip + 0x1ab10bf], rax ; 0x101df5da8
0x100344ce9: lea rax, [rip - 0x4190] ; 0x100340b60
0x100344cf0: vmovq xmm0, rax
0x100344cf5: vmovdqu xmmword ptr [rip + 0x1ab10d3], xmm0 ; 0x101df5dd0
0x100344cfd: mov rax, qword ptr [rip + 0x8c177c] ; 0x100c06480 -> 0x100342de0 __Z12ApplyWrapperI7OnFlameMS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x100344d04: mov qword ptr [rip + 0x1ab10d5], rax ; 0x101df5de0
0x100344d0b: mov rax, qword ptr [rip + 0x8c4ffe] ; 0x100c09d10 `.4
0x100344d12: mov qword ptr [rip + 0x1ab10cf], rax ; 0x101df5de8
0x100344d19: mov rax, qword ptr [rip + 0x8c3a68] ; 0x100c08788 -> 0x100342dd0 __Z18GetMetaClassByTypeIP7OnFlameERK9MetaClassv
0x100344d20: mov qword ptr [rip + 0x1ab10c9], rax ; 0x101df5df0
0x100344d27: lea rdx, [rip + 0x81b349] ; 0x100b60077 OnResumeEnabled
0x100344d2e: mov qword ptr [rip + 0x1ab10c3], rdx ; 0x101df5df8
0x100344d35: lea rdx, [rip + 0x1ab10bc] ; 0x101df5df8
0x100344d3c: mov qword ptr [rip + 0x1ab10b9], 0 ; 0x101df5e00
0x100344d47: mov qword ptr [rip + 0x1ab10ba], rcx ; 0x101df5e08
0x100344d4e: mov qword ptr [rip + 0x92b20b], rdx ; 0x100c6ff60
0x100344d55: lea rcx, [rip - 0x41dc] ; 0x100340b80
0x100344d5c: vmovq xmm0, rcx
0x100344d61: vmovdqu xmmword ptr [rip + 0x1ab10c7], xmm0 ; 0x101df5e30
0x100344d69: mov rcx, qword ptr [rip + 0x8c1718] ; 0x100c06488 -> 0x100342e90 __Z12ApplyWrapperI7OnFlameMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x100344d70: mov qword ptr [rip + 0x1ab10c9], rcx ; 0x101df5e40
0x100344d77: mov rcx, qword ptr [rip + 0x8c4f9a] ; 0x100c09d18 0/4
0x100344d7e: mov qword ptr [rip + 0x1ab10c3], rcx ; 0x101df5e48
0x100344d85: mov qword ptr [rip + 0x1ab10c4], rax ; 0x101df5e50
0x100344d8c: lea rcx, [rip + 0x83c9d6] ; 0x100b81769 onStoke
0x100344d93: mov qword ptr [rip + 0x969f56], rcx ; 0x100caecf0
0x100344d9a: lea rcx, [rip + 0x969f4f] ; 0x100caecf0
0x100344da1: mov qword ptr [rip + 0x969f4c], 0 ; 0x100caecf8
0x100344dac: mov rdx, qword ptr [rip + 0x932ead] ; 0x100c77c60
0x100344db3: mov qword ptr [rip + 0x969f46], rdx ; 0x100caed00
0x100344dba: mov qword ptr [rip + 0x969f4b], 0x48 ; 0x100caed10
0x100344dc5: mov qword ptr [rip + 0x969f4c], r15 ; 0x100caed18
0x100344dcc: mov qword ptr [rip + 0x969f4d], rax ; 0x100caed20
0x100344dd3: mov qword ptr [rip + 0x969f4a], 0xffffffffffffffff ; 0x100caed28
0x100344dde: mov qword ptr [rip + 0x969f4b], rbx ; 0x100caed30
0x100344de5: mov qword ptr [rip + 0x969f48], 0 ; 0x100caed38
0x100344df0: lea rdx, [rip + 0x83c97a] ; 0x100b81771 requireAll
0x100344df7: mov qword ptr [rip + 0x969f42], rdx ; 0x100caed40
0x100344dfe: lea rdx, [rip + 0x969f3b] ; 0x100caed40
0x100344e05: mov qword ptr [rip + 0x969f44], rcx ; 0x100caed50
0x100344e0c: mov qword ptr [rip + 0x969f49], 0x49 ; 0x100caed60
0x100344e17: mov qword ptr [rip + 0x969f4a], r15 ; 0x100caed68
0x100344e1e: mov qword ptr [rip + 0x969f4b], rax ; 0x100caed70
0x100344e25: mov qword ptr [rip + 0x969f48], 0xffffffffffffffff ; 0x100caed78
0x100344e30: mov qword ptr [rip + 0x969f49], rbx ; 0x100caed80
0x100344e37: mov qword ptr [rip + 0x969f46], 0 ; 0x100caed88
0x100344e42: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100344e47: vmovaps xmmword ptr [rip + 0x1ab1011], xmm0 ; 0x101df5e60
0x100344e4f: lea rcx, [rip + 0x1ab100a] ; 0x101df5e60
0x100344e56: mov qword ptr [rip + 0x1ab100f], 0 ; 0x101df5e70
0x100344e61: mov qword ptr [rip + 0x969ee0], rcx ; 0x100caed48
0x100344e68: lea rcx, [rip + 0x83047e] ; 0x100b752ed fireOnce
0x100344e6f: mov qword ptr [rip + 0x969f1a], rcx ; 0x100caed90
0x100344e76: lea rcx, [rip + 0x969f13] ; 0x100caed90
0x100344e7d: mov qword ptr [rip + 0x969f10], 0 ; 0x100caed98
0x100344e88: mov qword ptr [rip + 0x969f11], rdx ; 0x100caeda0
0x100344e8f: mov qword ptr [rip + 0x969f16], 0x4a ; 0x100caedb0
0x100344e9a: mov qword ptr [rip + 0x969f17], r15 ; 0x100caedb8
0x100344ea1: mov qword ptr [rip + 0x969f18], rax ; 0x100caedc0
0x100344ea8: mov qword ptr [rip + 0x969f15], 0xffffffffffffffff ; 0x100caedc8
0x100344eb3: mov qword ptr [rip + 0x969f16], rbx ; 0x100caedd0
0x100344eba: mov qword ptr [rip + 0x969f13], 0 ; 0x100caedd8
0x100344ec5: lea rdx, [rip + 0x83c8b0] ; 0x100b8177c onExtinguish
0x100344ecc: mov qword ptr [rip + 0x969f0d], rdx ; 0x100caede0
0x100344ed3: lea rdx, [rip + 0x969f06] ; 0x100caede0
0x100344eda: mov qword ptr [rip + 0x969f03], 0 ; 0x100caede8
0x100344ee5: mov qword ptr [rip + 0x969f04], rcx ; 0x100caedf0
0x100344eec: mov qword ptr [rip + 0x969f09], 0x4b ; 0x100caee00
0x100344ef7: mov qword ptr [rip + 0x969f0a], r15 ; 0x100caee08
0x100344efe: mov qword ptr [rip + 0x969f0b], rax ; 0x100caee10
0x100344f05: mov qword ptr [rip + 0x969f08], 0xffffffffffffffff ; 0x100caee18
0x100344f10: mov qword ptr [rip + 0x969f09], rbx ; 0x100caee20
0x100344f17: mov qword ptr [rip + 0x969f06], 0 ; 0x100caee28
0x100344f22: lea rcx, [rip + 0x83c860] ; 0x100b81789 consumeDuration
0x100344f29: mov qword ptr [rip + 0x969f00], rcx ; 0x100caee30
0x100344f30: lea rcx, [rip + 0x969ef9] ; 0x100caee30
0x100344f37: mov qword ptr [rip + 0x969f02], rdx ; 0x100caee40
0x100344f3e: mov qword ptr [rip + 0x969f07], 0x4c ; 0x100caee50
0x100344f49: mov qword ptr [rip + 0x969f08], r14 ; 0x100caee58
0x100344f50: mov qword ptr [rip + 0x969f09], rax ; 0x100caee60
0x100344f57: mov qword ptr [rip + 0x969f06], 0xffffffffffffffff ; 0x100caee68
0x100344f62: mov qword ptr [rip + 0x969f07], rbx ; 0x100caee70
0x100344f69: mov qword ptr [rip + 0x969f04], 0 ; 0x100caee78
0x100344f74: lea rdx, [rip + 0x82f199] ; 0x100b74114 0.0
0x100344f7b: vmovq xmm0, rdx
0x100344f80: vmovdqa xmm1, xmmword ptr [rbp - 0x40]
0x100344f85: vpunpcklqdq xmm0, xmm1, xmm0
0x100344f89: vmovdqa xmmword ptr [rip + 0x1ab0eef], xmm0 ; 0x101df5e80
0x100344f91: lea rdx, [rip + 0x1ab0ee8] ; 0x101df5e80
0x100344f98: mov qword ptr [rip + 0x1ab0eed], 0 ; 0x101df5e90
0x100344fa3: mov qword ptr [rip + 0x969e8e], rdx ; 0x100caee38
0x100344faa: lea rdx, [rip + 0x83c7e8] ; 0x100b81799 minComplete
0x100344fb1: mov qword ptr [rip + 0x969ec8], rdx ; 0x100caee80
0x100344fb8: lea rdx, [rip + 0x969ec1] ; 0x100caee80
0x100344fbf: mov qword ptr [rip + 0x969eca], rcx ; 0x100caee90
0x100344fc6: mov qword ptr [rip + 0x969ecf], 0x50 ; 0x100caeea0
0x100344fd1: mov qword ptr [rip + 0x969ed0], r14 ; 0x100caeea8
0x100344fd8: mov qword ptr [rip + 0x969ed1], rax ; 0x100caeeb0
0x100344fdf: mov qword ptr [rip + 0x969ece], 0xffffffffffffffff ; 0x100caeeb8
0x100344fea: mov qword ptr [rip + 0x969ecf], rbx ; 0x100caeec0
0x100344ff1: mov qword ptr [rip + 0x969ecc], 0 ; 0x100caeec8
0x100344ffc: lea rcx, [rip + 0x838c50] ; 0x100b7dc53 0.8
0x100345003: vmovq xmm0, rcx
0x100345008: vpunpcklqdq xmm0, xmm1, xmm0
0x10034500c: vmovdqa xmmword ptr [rip + 0x1ab0e8c], xmm0 ; 0x101df5ea0
0x100345014: lea rcx, [rip + 0x1ab0e85] ; 0x101df5ea0
0x10034501b: mov qword ptr [rip + 0x1ab0e8a], 0 ; 0x101df5eb0
0x100345026: lea rsi, [rip + 0x83c778] ; 0x100b817a5 (0.1, 1.0)
0x10034502d: vmovq xmm0, rsi
0x100345032: vmovdqa xmm1, xmmword ptr [rbp - 0x60]
0x100345037: vpunpcklqdq xmm0, xmm1, xmm0
0x10034503b: vmovdqa xmmword ptr [rip + 0x1ab0e7d], xmm0 ; 0x101df5ec0
0x100345043: lea rsi, [rip + 0x1ab0e76] ; 0x101df5ec0
0x10034504a: mov qword ptr [rip + 0x1ab0e7f], rcx ; 0x101df5ed0
0x100345051: mov qword ptr [rip + 0x969e30], rsi ; 0x100caee88
0x100345058: lea r13, [rip + 0x834666] ; 0x100b796c5 flames
0x10034505f: mov qword ptr [rip + 0x969e6a], r13 ; 0x100caeed0
0x100345066: lea rcx, [rip + 0x969e63] ; 0x100caeed0
0x10034506d: mov qword ptr [rip + 0x969e6c], rdx ; 0x100caeee0
0x100345074: mov qword ptr [rip + 0x969e71], 0x38 ; 0x100caeef0
0x10034507f: mov r12, qword ptr [rip + 0x8c2242] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x100345086: mov qword ptr [rip + 0x969e6b], r12 ; 0x100caeef8
0x10034508d: mov qword ptr [rip + 0x969e6c], rax ; 0x100caef00
0x100345094: mov qword ptr [rip + 0x969e69], 0xffffffffffffffff ; 0x100caef08
0x10034509f: mov qword ptr [rip + 0x969e6a], rbx ; 0x100caef10
0x1003450a6: mov qword ptr [rip + 0x969e67], 0 ; 0x100caef18
0x1003450b1: lea rdx, [rip + 0x819943] ; 0x100b5e9fb Object
0x1003450b8: vmovq xmm0, rdx
0x1003450bd: lea rdx, [rip + 0x819928] ; 0x100b5e9ec Tool_ClumpType
0x1003450c4: vmovq xmm1, rdx
0x1003450c9: vpunpcklqdq xmm0, xmm1, xmm0
0x1003450cd: vmovdqa xmmword ptr [rip + 0x1ab0e0b], xmm0 ; 0x101df5ee0
0x1003450d5: vmovdqa xmmword ptr [rbp - 0x50], xmm0
0x1003450da: lea rdx, [rip + 0x1ab0dff] ; 0x101df5ee0
0x1003450e1: mov qword ptr [rip + 0x1ab0e04], 0 ; 0x101df5ef0
0x1003450ec: mov qword ptr [rip + 0x969de5], rdx ; 0x100caeed8
0x1003450f3: lea rdx, [rip + 0x81a663] ; 0x100b5f75d events
0x1003450fa: mov qword ptr [rip + 0x969e1f], rdx ; 0x100caef20
0x100345101: lea rdx, [rip + 0x969e18] ; 0x100caef20
0x100345108: mov qword ptr [rip + 0x969e21], rcx ; 0x100caef30
0x10034510f: mov qword ptr [rip + 0x932b4a], rdx ; 0x100c77c60
0x100345116: mov qword ptr [rip + 0x969e1f], 0x40 ; 0x100caef40
0x100345121: mov qword ptr [rip + 0x969e20], r12 ; 0x100caef48
0x100345128: mov qword ptr [rip + 0x969e21], rax ; 0x100caef50
0x10034512f: mov qword ptr [rip + 0x969e1e], 0xffffffffffffffff ; 0x100caef58
0x10034513a: mov qword ptr [rip + 0x969e1f], rbx ; 0x100caef60
0x100345141: mov qword ptr [rip + 0x969e1c], 0 ; 0x100caef68
0x10034514c: vmovdqa xmmword ptr [rip + 0x1ab0dac], xmm0 ; 0x101df5f00
0x100345154: lea rax, [rip + 0x1ab0da5] ; 0x101df5f00
0x10034515b: mov qword ptr [rip + 0x1ab0daa], 0 ; 0x101df5f10
0x100345166: mov qword ptr [rip + 0x969dbb], rax ; 0x100caef28
0x10034516d: lea rax, [rip + 0x83c63c] ; 0x100b817b0 SetFlame
0x100345174: mov qword ptr [rip + 0x1ab0da5], rax ; 0x101df5f20
0x10034517b: lea rax, [rip + 0x1ab0d96] ; 0x101df5f18
0x100345182: mov qword ptr [rip + 0x1ab0d9b], 0 ; 0x101df5f28
0x10034518d: mov rcx, qword ptr [rip + 0x92adc4] ; 0x100c6ff58
0x100345194: mov qword ptr [rip + 0x1ab0d95], rcx ; 0x101df5f30
0x10034519b: mov qword ptr [rip + 0x92adb6], rax ; 0x100c6ff58
0x1003451a2: mov qword ptr [rip + 0x1ab0d97], rax ; 0x101df5f40
0x1003451a9: mov r14, qword ptr [rip + 0x8c3438] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x1003451b0: mov qword ptr [rip + 0x1ab0d91], r14 ; 0x101df5f48
0x1003451b7: mov dword ptr [rip + 0x1ab0d8f], 0xffffffff ; 0x101df5f50
0x1003451c1: mov dword ptr [rip + 0x1ab0d89], 0xffffffff ; 0x101df5f54
0x1003451cb: mov qword ptr [rip + 0x1ab0d9a], 0 ; 0x101df5f70
0x1003451d6: mov rax, qword ptr [rip + 0x8c7593] ; 0x100c0c770
0x1003451dd: add rax, 0x10
0x1003451e1: mov qword ptr [rip + 0x1ab0d30], rax ; 0x101df5f18
0x1003451e8: xor eax, eax
0x1003451ea: call 0x100011c10 ; 0x100011c10
0x1003451ef: lea rax, [rip + 0x83438f] ; 0x100b79585 lit
0x1003451f6: mov qword ptr [rip + 0x969d73], rax ; 0x100caef70
0x1003451fd: lea rax, [rip + 0x969d6c] ; 0x100caef70
0x100345204: mov qword ptr [rip + 0x969d69], 0 ; 0x100caef78
0x10034520f: mov rcx, qword ptr [rip + 0x932a4a] ; 0x100c77c60
0x100345216: mov qword ptr [rip + 0x969d63], rcx ; 0x100caef80
0x10034521d: mov qword ptr [rip + 0x969d68], 0x38 ; 0x100caef90
0x100345228: mov qword ptr [rip + 0x969d69], r15 ; 0x100caef98
0x10034522f: mov rcx, qword ptr [rip + 0x8c365a] ; 0x100c08890 -> 0x1003436d0 __Z18GetMetaClassByTypeIP8SetFlameERK9MetaClassv
0x100345236: mov qword ptr [rip + 0x969d63], rcx ; 0x100caefa0
0x10034523d: mov qword ptr [rip + 0x969d60], 0xffffffffffffffff ; 0x100caefa8
0x100345248: mov qword ptr [rip + 0x969d61], rbx ; 0x100caefb0
0x10034524f: mov qword ptr [rip + 0x969d5e], 0 ; 0x100caefb8
0x10034525a: mov qword ptr [rip + 0x969d5f], r13 ; 0x100caefc0
0x100345261: lea rdx, [rip + 0x969d58] ; 0x100caefc0
0x100345268: mov qword ptr [rip + 0x969d61], rax ; 0x100caefd0
0x10034526f: mov qword ptr [rip + 0x969d66], 0x40 ; 0x100caefe0
0x10034527a: mov qword ptr [rip + 0x969d67], r12 ; 0x100caefe8
0x100345281: mov qword ptr [rip + 0x969d68], rcx ; 0x100caeff0
0x100345288: mov qword ptr [rip + 0x969d65], 0xffffffffffffffff ; 0x100caeff8
0x100345293: mov qword ptr [rip + 0x969d66], rbx ; 0x100caf000
0x10034529a: mov qword ptr [rip + 0x969d63], 0 ; 0x100caf008
0x1003452a5: lea rax, [rip + 0x81a443] ; 0x100b5f6ef duration
0x1003452ac: mov qword ptr [rip + 0x969d5d], rax ; 0x100caf010
0x1003452b3: lea rax, [rip + 0x969d56] ; 0x100caf010
0x1003452ba: mov qword ptr [rip + 0x969d53], 0 ; 0x100caf018
0x1003452c5: mov qword ptr [rip + 0x969d54], rdx ; 0x100caf020
0x1003452cc: mov qword ptr [rip + 0x969d59], 0x3c ; 0x100caf030
0x1003452d7: mov rsi, qword ptr [rip + 0x8c2282] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1003452de: mov qword ptr [rip + 0x969d53], rsi ; 0x100caf038
0x1003452e5: mov qword ptr [rip + 0x969d54], rcx ; 0x100caf040
0x1003452ec: mov qword ptr [rip + 0x969d51], 0xffffffffffffffff ; 0x100caf048
0x1003452f7: mov qword ptr [rip + 0x969d52], rbx ; 0x100caf050
0x1003452fe: mov qword ptr [rip + 0x969d4f], 0 ; 0x100caf058
0x100345309: lea rdx, [rip + 0x82ff5c] ; 0x100b7526c delay
0x100345310: mov qword ptr [rip + 0x969d49], rdx ; 0x100caf060
0x100345317: lea rdx, [rip + 0x969d42] ; 0x100caf060
0x10034531e: mov qword ptr [rip + 0x969d3f], 0 ; 0x100caf068
0x100345329: mov qword ptr [rip + 0x969d40], rax ; 0x100caf070
0x100345330: mov qword ptr [rip + 0x932929], rdx ; 0x100c77c60
0x100345337: mov qword ptr [rip + 0x969d3e], 0x48 ; 0x100caf080
0x100345342: mov qword ptr [rip + 0x969d3f], rsi ; 0x100caf088
0x100345349: mov r15, rsi
0x10034534c: mov qword ptr [rip + 0x969d3d], rcx ; 0x100caf090
0x100345353: mov qword ptr [rip + 0x969d3a], 0xffffffffffffffff ; 0x100caf098
0x10034535e: mov qword ptr [rip + 0x969d3b], rbx ; 0x100caf0a0
0x100345365: mov qword ptr [rip + 0x969d38], 0 ; 0x100caf0a8
0x100345370: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100345375: vmovaps xmmword ptr [rip + 0x1ab0c03], xmm0 ; 0x101df5f80
0x10034537d: lea rax, [rip + 0x1ab0bfc] ; 0x101df5f80
0x100345384: mov qword ptr [rip + 0x1ab0c01], 0 ; 0x101df5f90
0x10034538f: mov qword ptr [rip + 0x969c32], rax ; 0x100caefc8
0x100345396: lea rax, [rip + 0x83c41c] ; 0x100b817b9 SetFlameOccIntensity
0x10034539d: mov qword ptr [rip + 0x1ab0bfc], rax ; 0x101df5fa0
0x1003453a4: lea rax, [rip + 0x1ab0bed] ; 0x101df5f98
0x1003453ab: mov qword ptr [rip + 0x1ab0bf2], 0 ; 0x101df5fa8
0x1003453b6: mov rcx, qword ptr [rip + 0x92ab9b] ; 0x100c6ff58
0x1003453bd: mov qword ptr [rip + 0x1ab0bec], rcx ; 0x101df5fb0
0x1003453c4: mov qword ptr [rip + 0x92ab8d], rax ; 0x100c6ff58
0x1003453cb: mov qword ptr [rip + 0x1ab0bee], rax ; 0x101df5fc0
0x1003453d2: mov qword ptr [rip + 0x1ab0bef], r14 ; 0x101df5fc8
0x1003453d9: mov dword ptr [rip + 0x1ab0bed], 0xffffffff ; 0x101df5fd0
0x1003453e3: mov dword ptr [rip + 0x1ab0be7], 0xffffffff ; 0x101df5fd4
0x1003453ed: mov qword ptr [rip + 0x1ab0bf8], 0 ; 0x101df5ff0
0x1003453f8: mov rax, qword ptr [rip + 0x8c6b61] ; 0x100c0bf60
0x1003453ff: add rax, 0x10
0x100345403: mov qword ptr [rip + 0x1ab0b8e], rax ; 0x101df5f98
0x10034540a: xor eax, eax
0x10034540c: call 0x100011c10 ; 0x100011c10
0x100345411: lea rax, [rip + 0x83c3b6] ; 0x100b817ce occIntensityMult
0x100345418: mov qword ptr [rip + 0x969c91], rax ; 0x100caf0b0
0x10034541f: lea rax, [rip + 0x969c8a] ; 0x100caf0b0
0x100345426: mov rcx, qword ptr [rip + 0x932833] ; 0x100c77c60
0x10034542d: mov qword ptr [rip + 0x969c8c], rcx ; 0x100caf0c0
0x100345434: mov qword ptr [rip + 0x932825], rax ; 0x100c77c60
0x10034543b: mov qword ptr [rip + 0x969c8a], 0x38 ; 0x100caf0d0
0x100345446: mov qword ptr [rip + 0x969c8b], r15 ; 0x100caf0d8
0x10034544d: mov rax, qword ptr [rip + 0x8c2f24] ; 0x100c08378 -> 0x1003439c0 __Z18GetMetaClassByTypeIP20SetFlameOccIntensityERK9MetaClassv
0x100345454: mov qword ptr [rip + 0x969c85], rax ; 0x100caf0e0
0x10034545b: mov qword ptr [rip + 0x969c82], 0xffffffffffffffff ; 0x100caf0e8
0x100345466: mov qword ptr [rip + 0x969c83], rbx ; 0x100caf0f0
0x10034546d: mov qword ptr [rip + 0x969c80], 0 ; 0x100caf0f8
0x100345478: lea rax, [rip + 0x83c360] ; 0x100b817df 17.6
0x10034547f: vmovq xmm0, rax
0x100345484: vmovdqa xmm1, xmmword ptr [rbp - 0x40]
0x100345489: vpunpcklqdq xmm0, xmm1, xmm0
0x10034548d: vmovdqa xmmword ptr [rip + 0x1ab0b6b], xmm0 ; 0x101df6000
0x100345495: lea rax, [rip + 0x1ab0b64] ; 0x101df6000
0x10034549c: mov qword ptr [rip + 0x1ab0b69], 0 ; 0x101df6010
0x1003454a7: mov qword ptr [rip + 0x969c0a], rax ; 0x100caf0b8
0x1003454ae: add rsp, 0x38
0x1003454b2: pop rbx
0x1003454b3: pop r12
0x1003454b5: pop r13
0x1003454b7: pop r14
0x1003454b9: pop r15
0x1003454bb: pop rbp
0x1003454bc: ret 
0x1003454bd: nop 
0x1003454be: nop 
0x1003454bf: nop 
