0x10071a7e0: push rbp
0x10071a7e1: mov rbp, rsp
0x10071a7e4: push r15
0x10071a7e6: push r14
0x10071a7e8: push r13
0x10071a7ea: push r12
0x10071a7ec: push rbx
0x10071a7ed: sub rsp, 0x98
0x10071a7f4: mov dword ptr [rip + 0x61760a], 0 ; 0x100d31e08
0x10071a7fe: lea r15, [rip + 0x481de5] ; 0x100b9c5ea Value
0x10071a805: mov qword ptr [rip + 0x192016c], r15 ; 0x10203a978
0x10071a80c: lea rax, [rip + 0x192015d] ; 0x10203a970
0x10071a813: mov qword ptr [rip + 0x1920162], 0 ; 0x10203a980
0x10071a81e: mov rcx, qword ptr [rip + 0x555733] ; 0x100c6ff58
0x10071a825: mov qword ptr [rip + 0x192015c], rcx ; 0x10203a988
0x10071a82c: mov qword ptr [rip + 0x555725], rax ; 0x100c6ff58
0x10071a833: mov qword ptr [rip + 0x192015e], rax ; 0x10203a998
0x10071a83a: lea rax, [rip - 0x6e4f81] ; 0x1000358c0
0x10071a841: mov qword ptr [rip + 0x1920158], rax ; 0x10203a9a0
0x10071a848: mov qword ptr [rip + 0x1920155], 0xffffffffffffffff ; 0x10203a9a8
0x10071a853: mov qword ptr [rip + 0x192016a], 0 ; 0x10203a9c8
0x10071a85e: mov rax, qword ptr [rip + 0x4f1c3b] ; 0x100c0c4a0
0x10071a865: add rax, 0x10
0x10071a869: mov qword ptr [rip + 0x1920100], rax ; 0x10203a970
0x10071a870: xor eax, eax
0x10071a872: call 0x100011c10 ; 0x100011c10
0x10071a877: lea rax, [rip + 0x4457be] ; 0x100b6003c Tool_Export
0x10071a87e: vmovq xmm0, rax
0x10071a883: lea rax, [rip + 0x444155] ; 0x100b5e9df true
0x10071a88a: vmovq xmm1, rax
0x10071a88f: vmovdqa xmmword ptr [rbp - 0x40], xmm1
0x10071a894: vpunpcklqdq xmm0, xmm0, xmm1
0x10071a898: vmovdqa xmmword ptr [rip + 0x1920130], xmm0 ; 0x10203a9d0
0x10071a8a0: lea rax, [rip + 0x1920129] ; 0x10203a9d0
0x10071a8a7: mov rcx, qword ptr [rip + 0x19200d2] ; 0x10203a980
0x10071a8ae: mov qword ptr [rip + 0x192012b], rcx ; 0x10203a9e0
0x10071a8b5: lea rcx, [rip + 0x461e06] ; 0x100b7c6c2 Tool_ExcludeOnlyMe
0x10071a8bc: vmovq xmm0, rcx
0x10071a8c1: vpunpcklqdq xmm0, xmm0, xmm1
0x10071a8c5: vmovdqa xmmword ptr [rip + 0x1920123], xmm0 ; 0x10203a9f0
0x10071a8cd: lea rcx, [rip + 0x192011c] ; 0x10203a9f0
0x10071a8d4: mov qword ptr [rip + 0x1920125], rax ; 0x10203aa00
0x10071a8db: mov qword ptr [rip + 0x192009e], rcx ; 0x10203a980
0x10071a8e2: lea rax, [rip + 0x468282] ; 0x100b82b6b Float
0x10071a8e9: mov qword ptr [rip + 0x1920120], rax ; 0x10203aa10
0x10071a8f0: lea rax, [rip + 0x1920111] ; 0x10203aa08
0x10071a8f7: mov qword ptr [rip + 0x1920116], 0 ; 0x10203aa18
0x10071a902: mov rcx, qword ptr [rip + 0x55564f] ; 0x100c6ff58
0x10071a909: mov qword ptr [rip + 0x1920110], rcx ; 0x10203aa20
0x10071a910: mov qword ptr [rip + 0x555641], rax ; 0x100c6ff58
0x10071a917: mov qword ptr [rip + 0x1920112], rax ; 0x10203aa30
0x10071a91e: mov rax, qword ptr [rip + 0x4edd13] ; 0x100c08638 -> 0x100716790 __Z18GetMetaClassByTypeIP5ValueERK9MetaClassv
0x10071a925: mov qword ptr [rip + 0x192010c], rax ; 0x10203aa38
0x10071a92c: mov qword ptr [rip + 0x1920109], 0xffffffffffffffff ; 0x10203aa40
0x10071a937: mov qword ptr [rip + 0x192011e], 0 ; 0x10203aa60
0x10071a942: mov rax, qword ptr [rip + 0x4f1aff] ; 0x100c0c448
0x10071a949: add rax, 0x10
0x10071a94d: mov qword ptr [rip + 0x19200b4], rax ; 0x10203aa08
0x10071a954: xor eax, eax
0x10071a956: call 0x100011c10 ; 0x100011c10
0x10071a95b: lea rax, [rip + 0x4433f7] ; 0x100b5dd59 value
0x10071a962: mov qword ptr [rip + 0x5efcc7], rax ; 0x100d0a630
0x10071a969: lea rax, [rip + 0x5efcc0] ; 0x100d0a630
0x10071a970: mov qword ptr [rip + 0x5efcbd], 0 ; 0x100d0a638
0x10071a97b: mov rcx, qword ptr [rip + 0x55d2de] ; 0x100c77c60
0x10071a982: mov qword ptr [rip + 0x5efcb7], rcx ; 0x100d0a640
0x10071a989: mov qword ptr [rip + 0x55d2d0], rax ; 0x100c77c60
0x10071a990: mov qword ptr [rip + 0x5efcb5], 0x10 ; 0x100d0a650
0x10071a99b: mov rax, qword ptr [rip + 0x4ecbbe] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x10071a9a2: mov qword ptr [rip + 0x5efcaf], rax ; 0x100d0a658
0x10071a9a9: mov r12, rax
0x10071a9ac: mov rax, qword ptr [rip + 0x4edc45] ; 0x100c085f8 -> 0x1007169f0 __Z18GetMetaClassByTypeIP5FloatERK9MetaClassv
0x10071a9b3: mov qword ptr [rip + 0x5efca6], rax ; 0x100d0a660
0x10071a9ba: mov qword ptr [rip + 0x5efca3], 0xffffffffffffffff ; 0x100d0a668
0x10071a9c5: lea r14, [rip - 0x700fac] ; 0x100019a20
0x10071a9cc: mov qword ptr [rip + 0x5efc9d], r14 ; 0x100d0a670
0x10071a9d3: mov qword ptr [rip + 0x5efc9a], 0 ; 0x100d0a678
0x10071a9de: lea rax, [rip + 0x481c0b] ; 0x100b9c5f0 ValueBarn
0x10071a9e5: mov qword ptr [rip + 0x1920084], rax ; 0x10203aa70
0x10071a9ec: lea rax, [rip + 0x1920075] ; 0x10203aa68
0x10071a9f3: mov qword ptr [rip + 0x192007a], 0 ; 0x10203aa78
0x10071a9fe: mov rcx, qword ptr [rip + 0x555553] ; 0x100c6ff58
0x10071aa05: mov qword ptr [rip + 0x1920074], rcx ; 0x10203aa80
0x10071aa0c: mov qword ptr [rip + 0x555545], rax ; 0x100c6ff58
0x10071aa13: mov qword ptr [rip + 0x1920076], rax ; 0x10203aa90
0x10071aa1a: mov rax, qword ptr [rip + 0x4edc8f] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x10071aa21: mov qword ptr [rip + 0x1920070], rax ; 0x10203aa98
0x10071aa28: mov dword ptr [rip + 0x192006e], 0xffffffff ; 0x10203aaa0
0x10071aa32: mov dword ptr [rip + 0x1920068], 0xffffffff ; 0x10203aaa4
0x10071aa3c: mov qword ptr [rip + 0x1920079], 0 ; 0x10203aac0
0x10071aa47: mov rax, qword ptr [rip + 0x4f1fa2] ; 0x100c0c9f0
0x10071aa4e: add rax, 0x10
0x10071aa52: mov qword ptr [rip + 0x192000f], rax ; 0x10203aa68
0x10071aa59: xor eax, eax
0x10071aa5b: call 0x100011c10 ; 0x100011c10
0x10071aa60: lea rax, [rip + 0x441ea5] ; 0x100b5c90c Initialize
0x10071aa67: mov qword ptr [rip + 0x192005a], rax ; 0x10203aac8
0x10071aa6e: lea rcx, [rip + 0x1920053] ; 0x10203aac8
0x10071aa75: mov qword ptr [rip + 0x1920050], 0 ; 0x10203aad0
0x10071aa80: mov rax, qword ptr [rip + 0x5554d9] ; 0x100c6ff60
0x10071aa87: mov qword ptr [rip + 0x192004a], rax ; 0x10203aad8
0x10071aa8e: lea rax, [rip - 0x5335] ; 0x100715760
0x10071aa95: vmovq xmm0, rax
0x10071aa9a: vmovdqu xmmword ptr [rip + 0x192005e], xmm0 ; 0x10203ab00
0x10071aaa2: mov rdx, qword ptr [rip + 0x4ec04f] ; 0x100c06af8 Pmq
0x10071aaa9: mov qword ptr [rip + 0x1920060], rdx ; 0x10203ab10
0x10071aab0: mov rsi, qword ptr [rip + 0x4ef8d1] ; 0x100c0a388 -> 0x100716db0 __Z21InitFunctionSignatureIM9ValueBarnFvvEEvP17FunctionSignature
0x10071aab7: mov qword ptr [rip + 0x192005a], rsi ; 0x10203ab18
0x10071aabe: mov rax, qword ptr [rip + 0x4edfd3] ; 0x100c08a98 @mq
0x10071aac5: mov qword ptr [rip + 0x1920054], rax ; 0x10203ab20
0x10071aacc: lea rdi, [rip + 0x445f88] ; 0x100b60a5b OnLevelUnload
0x10071aad3: mov qword ptr [rip + 0x192004e], rdi ; 0x10203ab28
0x10071aada: lea rdi, [rip + 0x1920047] ; 0x10203ab28
0x10071aae1: mov qword ptr [rip + 0x1920044], 0 ; 0x10203ab30
0x10071aaec: mov qword ptr [rip + 0x1920045], rcx ; 0x10203ab38
0x10071aaf3: lea rcx, [rip - 0x4e2a] ; 0x100715cd0
0x10071aafa: vmovq xmm0, rcx
0x10071aaff: vmovdqu xmmword ptr [rip + 0x1920059], xmm0 ; 0x10203ab60
0x10071ab07: mov qword ptr [rip + 0x1920062], rdx ; 0x10203ab70
0x10071ab0e: mov qword ptr [rip + 0x1920063], rsi ; 0x10203ab78
0x10071ab15: mov qword ptr [rip + 0x1920064], rax ; 0x10203ab80
0x10071ab1c: lea rcx, [rip + 0x481ad7] ; 0x100b9c5fa CreateValue
0x10071ab23: mov qword ptr [rip + 0x192005e], rcx ; 0x10203ab88
0x10071ab2a: lea rcx, [rip + 0x1920057] ; 0x10203ab88
0x10071ab31: mov qword ptr [rip + 0x1920060], rdi ; 0x10203ab98
0x10071ab38: lea rdx, [rip - 0x48ef] ; 0x100716250
0x10071ab3f: vmovq xmm0, rdx
0x10071ab44: vmovdqu xmmword ptr [rip + 0x1920074], xmm0 ; 0x10203abc0
0x10071ab4c: mov rdx, qword ptr [rip + 0x4ebf95] ; 0x100c06ae8 -> 0x100716dd0 __Z12ApplyWrapperI9ValueBarnMS0_FP5ValuePK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x10071ab53: mov qword ptr [rip + 0x1920076], rdx ; 0x10203abd0
0x10071ab5a: mov rdx, qword ptr [rip + 0x4ef817] ; 0x100c0a378 -> 0x100716e90 __Z21InitFunctionSignatureIM9ValueBarnFP5ValuePK9MetaClassEEvP17FunctionSignature
0x10071ab61: mov qword ptr [rip + 0x1920070], rdx ; 0x10203abd8
0x10071ab68: mov qword ptr [rip + 0x1920071], rax ; 0x10203abe0
0x10071ab6f: lea rdx, [rip + 0x45c552] ; 0x100b770c8 ObjectFactory_CreatesType
0x10071ab76: vmovq xmm0, rdx
0x10071ab7b: vmovq xmm1, r15
0x10071ab80: vpunpcklqdq xmm0, xmm0, xmm1
0x10071ab84: vmovdqa xmmword ptr [rip + 0x1920064], xmm0 ; 0x10203abf0
0x10071ab8c: lea rdx, [rip + 0x192005d] ; 0x10203abf0
0x10071ab93: mov qword ptr [rip + 0x1920062], 0 ; 0x10203ac00
0x10071ab9e: mov qword ptr [rip + 0x191ffeb], rdx ; 0x10203ab90
0x10071aba5: lea rdx, [rip + 0x481a5a] ; 0x100b9c606 ReleaseValue
0x10071abac: mov qword ptr [rip + 0x1920055], rdx ; 0x10203ac08
0x10071abb3: lea rdx, [rip + 0x192004e] ; 0x10203ac08
0x10071abba: mov qword ptr [rip + 0x1920057], rcx ; 0x10203ac18
0x10071abc1: mov qword ptr [rip + 0x555398], rdx ; 0x100c6ff60
0x10071abc8: lea rcx, [rip - 0x486f] ; 0x100716360
0x10071abcf: vmovq xmm0, rcx
0x10071abd4: vmovdqu xmmword ptr [rip + 0x1920064], xmm0 ; 0x10203ac40
0x10071abdc: mov rcx, qword ptr [rip + 0x4ebf0d] ; 0x100c06af0 -> 0x100716f10 __Z12ApplyWrapperI9ValueBarnMS0_FvP5ValueEEvM9VoidClassFvvEPv8VariablePS9_j
0x10071abe3: mov qword ptr [rip + 0x1920066], rcx ; 0x10203ac50
0x10071abea: mov rcx, qword ptr [rip + 0x4ef78f] ; 0x100c0a380 -> 0x100716fa0 __Z21InitFunctionSignatureIM9ValueBarnFvP5ValueEEvP17FunctionSignature
0x10071abf1: mov qword ptr [rip + 0x1920060], rcx ; 0x10203ac58
0x10071abf8: mov qword ptr [rip + 0x1920061], rax ; 0x10203ac60
0x10071abff: lea rax, [rip + 0x45c4ee] ; 0x100b770f4 ObjectFactory_ReleasesType
0x10071ac06: vmovq xmm0, rax
0x10071ac0b: vpunpcklqdq xmm0, xmm0, xmm1
0x10071ac0f: vmovdqa xmmword ptr [rip + 0x1920059], xmm0 ; 0x10203ac70
0x10071ac17: lea rax, [rip + 0x1920052] ; 0x10203ac70
0x10071ac1e: mov qword ptr [rip + 0x1920057], 0 ; 0x10203ac80
0x10071ac29: mov qword ptr [rip + 0x191ffe0], rax ; 0x10203ac10
0x10071ac30: lea rdi, [rip + 0x6171d9] ; 0x100d31e10
0x10071ac37: lea rsi, [rip + 0x192004a] ; 0x10203ac88
0x10071ac3e: lea rdx, [rip + 0x4819ce] ; 0x100b9c613 tag_ValueBarn
0x10071ac45: call 0x1007951b0 ; 0x1007951b0
0x10071ac4a: lea rax, [rip + 0x4819e1] ; 0x100b9c632 IncrementFloat
0x10071ac51: mov qword ptr [rip + 0x1920040], rax ; 0x10203ac98
0x10071ac58: lea rax, [rip + 0x1920031] ; 0x10203ac90
0x10071ac5f: mov qword ptr [rip + 0x1920036], 0 ; 0x10203aca0
0x10071ac6a: mov rcx, qword ptr [rip + 0x5552e7] ; 0x100c6ff58
0x10071ac71: mov qword ptr [rip + 0x1920030], rcx ; 0x10203aca8
0x10071ac78: mov qword ptr [rip + 0x5552d9], rax ; 0x100c6ff58
0x10071ac7f: mov qword ptr [rip + 0x1920032], rax ; 0x10203acb8
0x10071ac86: mov rax, qword ptr [rip + 0x4ed95b] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x10071ac8d: mov qword ptr [rip + 0x192002c], rax ; 0x10203acc0
0x10071ac94: mov rbx, rax
0x10071ac97: mov qword ptr [rip + 0x1920026], 0xffffffffffffffff ; 0x10203acc8
0x10071aca2: mov qword ptr [rip + 0x192003b], 0 ; 0x10203ace8
0x10071acad: mov rax, qword ptr [rip + 0x4f071c] ; 0x100c0b3d0
0x10071acb4: add rax, 0x10
0x10071acb8: mov qword ptr [rip + 0x191ffd1], rax ; 0x10203ac90
0x10071acbf: xor eax, eax
0x10071acc1: call 0x100011c10 ; 0x100011c10
0x10071acc6: lea rax, [rip + 0x481974] ; 0x100b9c641 numSteps
0x10071accd: mov qword ptr [rip + 0x5ef9ac], rax ; 0x100d0a680
0x10071acd4: lea rax, [rip + 0x5ef9a5] ; 0x100d0a680
0x10071acdb: mov rcx, qword ptr [rip + 0x55cf7e] ; 0x100c77c60
0x10071ace2: mov qword ptr [rip + 0x5ef9a7], rcx ; 0x100d0a690
0x10071ace9: mov qword ptr [rip + 0x5ef9ac], 0x38 ; 0x100d0a6a0
0x10071acf4: mov rcx, qword ptr [rip + 0x4ec875] ; 0x100c07570 -> 0x10003a520 __Z17GetMetaTypeByTypeIiERK8MetaTypev
0x10071acfb: mov qword ptr [rip + 0x5ef9a6], rcx ; 0x100d0a6a8
0x10071ad02: mov rcx, qword ptr [rip + 0x4ecfdf] ; 0x100c07ce8 -> 0x100717410 __Z18GetMetaClassByTypeIP14IncrementFloatERK9MetaClassv
0x10071ad09: mov qword ptr [rip + 0x5ef9a0], rcx ; 0x100d0a6b0
0x10071ad10: mov qword ptr [rip + 0x5ef99d], 0xffffffffffffffff ; 0x100d0a6b8
0x10071ad1b: mov qword ptr [rip + 0x5ef99e], r14 ; 0x100d0a6c0
0x10071ad22: mov qword ptr [rip + 0x5ef99b], 0 ; 0x100d0a6c8
0x10071ad2d: lea rdx, [rip + 0x462f41] ; 0x100b7dc75 progress01
0x10071ad34: mov qword ptr [rip + 0x5ef995], rdx ; 0x100d0a6d0
0x10071ad3b: lea rdx, [rip + 0x5ef98e] ; 0x100d0a6d0
0x10071ad42: mov qword ptr [rip + 0x5ef98b], 0 ; 0x100d0a6d8
0x10071ad4d: mov qword ptr [rip + 0x5ef98c], rax ; 0x100d0a6e0
0x10071ad54: mov qword ptr [rip + 0x5ef991], 0x40 ; 0x100d0a6f0
0x10071ad5f: mov rax, qword ptr [rip + 0x4ec572] ; 0x100c072d8 -> 0x10003bf40 __Z17GetMetaTypeByTypeIP5FloatERK8MetaTypev
0x10071ad66: mov qword ptr [rip + 0x5ef98b], rax ; 0x100d0a6f8
0x10071ad6d: mov r13, rax
0x10071ad70: mov qword ptr [rip + 0x5ef989], rcx ; 0x100d0a700
0x10071ad77: mov qword ptr [rip + 0x5ef986], 0xffffffffffffffff ; 0x100d0a708
0x10071ad82: mov qword ptr [rip + 0x5ef987], r14 ; 0x100d0a710
0x10071ad89: mov qword ptr [rip + 0x5ef984], 0 ; 0x100d0a718
0x10071ad94: lea r15, [rip + 0x45df06] ; 0x100b78ca1 snappiness
0x10071ad9b: mov qword ptr [rip + 0x5ef97e], r15 ; 0x100d0a720
0x10071ada2: lea rax, [rip + 0x5ef977] ; 0x100d0a720
0x10071ada9: mov qword ptr [rip + 0x5ef980], rdx ; 0x100d0a730
0x10071adb0: mov qword ptr [rip + 0x55cea9], rax ; 0x100c77c60
0x10071adb7: mov qword ptr [rip + 0x5ef97e], 0x48 ; 0x100d0a740
0x10071adc2: mov qword ptr [rip + 0x5ef97f], r12 ; 0x100d0a748
0x10071adc9: mov qword ptr [rip + 0x5ef980], rcx ; 0x100d0a750
0x10071add0: mov qword ptr [rip + 0x5ef97d], 0xffffffffffffffff ; 0x100d0a758
0x10071addb: mov qword ptr [rip + 0x5ef97e], r14 ; 0x100d0a760
0x10071ade2: mov qword ptr [rip + 0x5ef97b], 0 ; 0x100d0a768
0x10071aded: lea rax, [rip + 0x45935a] ; 0x100b7414e 1.0
0x10071adf4: vmovq xmm0, rax
0x10071adf9: lea rax, [rip + 0x443c02] ; 0x100b5ea02 Tool_DefaultValue
0x10071ae00: vmovq xmm1, rax
0x10071ae05: vmovdqa xmmword ptr [rbp - 0x80], xmm1
0x10071ae0a: vpunpcklqdq xmm0, xmm1, xmm0
0x10071ae0e: vmovdqa xmmword ptr [rbp - 0x70], xmm0
0x10071ae13: vmovdqa xmmword ptr [rip + 0x191fed5], xmm0 ; 0x10203acf0
0x10071ae1b: lea rax, [rip + 0x191fece] ; 0x10203acf0
0x10071ae22: mov qword ptr [rip + 0x191fed3], 0 ; 0x10203ad00
0x10071ae2d: mov qword ptr [rip + 0x5ef8f4], rax ; 0x100d0a728
0x10071ae34: lea rax, [rip + 0x443cc2] ; 0x100b5eafd 1
0x10071ae3b: vmovq xmm0, rax
0x10071ae40: vpunpcklqdq xmm0, xmm1, xmm0
0x10071ae44: vmovdqa xmmword ptr [rip + 0x191fec4], xmm0 ; 0x10203ad10
0x10071ae4c: lea rax, [rip + 0x191febd] ; 0x10203ad10
0x10071ae53: mov qword ptr [rip + 0x191fec2], 0 ; 0x10203ad20
0x10071ae5e: mov qword ptr [rip + 0x5ef823], rax ; 0x100d0a688
0x10071ae65: lea rax, [rip + 0x4817de] ; 0x100b9c64a SetFloat
0x10071ae6c: mov qword ptr [rip + 0x191febd], rax ; 0x10203ad30
0x10071ae73: lea rax, [rip + 0x191feae] ; 0x10203ad28
0x10071ae7a: mov qword ptr [rip + 0x191feb3], 0 ; 0x10203ad38
0x10071ae85: mov rcx, qword ptr [rip + 0x5550cc] ; 0x100c6ff58
0x10071ae8c: mov qword ptr [rip + 0x191fead], rcx ; 0x10203ad40
0x10071ae93: mov qword ptr [rip + 0x5550be], rax ; 0x100c6ff58
0x10071ae9a: mov qword ptr [rip + 0x191feaf], rax ; 0x10203ad50
0x10071aea1: mov qword ptr [rip + 0x191feb0], rbx ; 0x10203ad58
0x10071aea8: mov dword ptr [rip + 0x191feae], 0xffffffff ; 0x10203ad60
0x10071aeb2: mov dword ptr [rip + 0x191fea8], 0xffffffff ; 0x10203ad64
0x10071aebc: mov qword ptr [rip + 0x191feb9], 0 ; 0x10203ad80
0x10071aec7: mov rax, qword ptr [rip + 0x4f18aa] ; 0x100c0c778
0x10071aece: add rax, 0x10
0x10071aed2: mov qword ptr [rip + 0x191fe4f], rax ; 0x10203ad28
0x10071aed9: xor eax, eax
0x10071aedb: call 0x100011c10 ; 0x100011c10
0x10071aee0: lea rax, [rip + 0x48176c] ; 0x100b9c653 targetValue
0x10071aee7: mov qword ptr [rip + 0x5ef882], rax ; 0x100d0a770
0x10071aeee: lea rax, [rip + 0x5ef87b] ; 0x100d0a770
0x10071aef5: mov qword ptr [rip + 0x5ef878], 0 ; 0x100d0a778
0x10071af00: mov rcx, qword ptr [rip + 0x55cd59] ; 0x100c77c60
0x10071af07: mov qword ptr [rip + 0x5ef872], rcx ; 0x100d0a780
0x10071af0e: mov qword ptr [rip + 0x5ef877], 0x38 ; 0x100d0a790
0x10071af19: mov qword ptr [rip + 0x5ef878], r12 ; 0x100d0a798
0x10071af20: mov rcx, qword ptr [rip + 0x4ed971] ; 0x100c08898 Pxq
0x10071af27: mov qword ptr [rip + 0x5ef872], rcx ; 0x100d0a7a0
0x10071af2e: mov qword ptr [rip + 0x5ef86f], 0xffffffffffffffff ; 0x100d0a7a8
0x10071af39: mov qword ptr [rip + 0x5ef870], r14 ; 0x100d0a7b0
0x10071af40: mov qword ptr [rip + 0x5ef86d], 0 ; 0x100d0a7b8
0x10071af4b: lea rdx, [rip + 0x457bca] ; 0x100b72b1c target
0x10071af52: mov qword ptr [rip + 0x5ef867], rdx ; 0x100d0a7c0
0x10071af59: lea rdx, [rip + 0x5ef860] ; 0x100d0a7c0
0x10071af60: mov qword ptr [rip + 0x5ef85d], 0 ; 0x100d0a7c8
0x10071af6b: mov qword ptr [rip + 0x5ef85e], rax ; 0x100d0a7d0
0x10071af72: mov qword ptr [rip + 0x5ef863], 0x40 ; 0x100d0a7e0
0x10071af7d: mov qword ptr [rip + 0x5ef864], r13 ; 0x100d0a7e8
0x10071af84: mov qword ptr [rip + 0x5ef865], rcx ; 0x100d0a7f0
0x10071af8b: mov qword ptr [rip + 0x5ef862], 0xffffffffffffffff ; 0x100d0a7f8
0x10071af96: mov qword ptr [rip + 0x5ef863], r14 ; 0x100d0a800
0x10071af9d: mov qword ptr [rip + 0x5ef860], 0 ; 0x100d0a808
0x10071afa8: lea rax, [rip + 0x441af6] ; 0x100b5caa5 time
0x10071afaf: mov qword ptr [rip + 0x5ef85a], rax ; 0x100d0a810
0x10071afb6: lea rax, [rip + 0x5ef853] ; 0x100d0a810
0x10071afbd: mov qword ptr [rip + 0x5ef850], 0 ; 0x100d0a818
0x10071afc8: mov qword ptr [rip + 0x5ef851], rdx ; 0x100d0a820
0x10071afcf: mov qword ptr [rip + 0x5ef856], 0x3c ; 0x100d0a830
0x10071afda: mov qword ptr [rip + 0x5ef857], r12 ; 0x100d0a838
0x10071afe1: mov qword ptr [rip + 0x5ef858], rcx ; 0x100d0a840
0x10071afe8: mov qword ptr [rip + 0x5ef855], 0xffffffffffffffff ; 0x100d0a848
0x10071aff3: mov qword ptr [rip + 0x5ef856], r14 ; 0x100d0a850
0x10071affa: mov qword ptr [rip + 0x5ef853], 0 ; 0x100d0a858
0x10071b005: mov qword ptr [rip + 0x5ef854], r15 ; 0x100d0a860
0x10071b00c: lea rdx, [rip + 0x5ef84d] ; 0x100d0a860
0x10071b013: mov qword ptr [rip + 0x5ef856], rax ; 0x100d0a870
0x10071b01a: mov qword ptr [rip + 0x55cc3f], rdx ; 0x100c77c60
0x10071b021: mov qword ptr [rip + 0x5ef854], 0x48 ; 0x100d0a880
0x10071b02c: mov qword ptr [rip + 0x5ef855], r12 ; 0x100d0a888
0x10071b033: mov qword ptr [rip + 0x5ef856], rcx ; 0x100d0a890
0x10071b03a: mov qword ptr [rip + 0x5ef853], 0xffffffffffffffff ; 0x100d0a898
0x10071b045: mov qword ptr [rip + 0x5ef854], r14 ; 0x100d0a8a0
0x10071b04c: mov qword ptr [rip + 0x5ef851], 0 ; 0x100d0a8a8
0x10071b057: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10071b05c: vmovaps xmmword ptr [rip + 0x191fd2c], xmm0 ; 0x10203ad90
0x10071b064: lea rax, [rip + 0x191fd25] ; 0x10203ad90
0x10071b06b: mov qword ptr [rip + 0x191fd2a], 0 ; 0x10203ada0
0x10071b076: mov qword ptr [rip + 0x5ef7eb], rax ; 0x100d0a868
0x10071b07d: lea rax, [rip + 0x4815db] ; 0x100b9c65f FloatSplit
0x10071b084: mov qword ptr [rip + 0x191fd25], rax ; 0x10203adb0
0x10071b08b: lea rax, [rip + 0x191fd16] ; 0x10203ada8
0x10071b092: mov qword ptr [rip + 0x191fd1b], 0 ; 0x10203adb8
0x10071b09d: mov rcx, qword ptr [rip + 0x554eb4] ; 0x100c6ff58
0x10071b0a4: mov qword ptr [rip + 0x191fd15], rcx ; 0x10203adc0
0x10071b0ab: mov qword ptr [rip + 0x554ea6], rax ; 0x100c6ff58
0x10071b0b2: mov qword ptr [rip + 0x191fd17], rax ; 0x10203add0
0x10071b0b9: mov qword ptr [rip + 0x191fd18], rbx ; 0x10203add8
0x10071b0c0: mov dword ptr [rip + 0x191fd16], 0xffffffff ; 0x10203ade0
0x10071b0ca: mov dword ptr [rip + 0x191fd10], 0xffffffff ; 0x10203ade4
0x10071b0d4: mov qword ptr [rip + 0x191fd21], 0 ; 0x10203ae00
0x10071b0df: mov rax, qword ptr [rip + 0x4ef8da] ; 0x100c0a9c0
0x10071b0e6: add rax, 0x10
0x10071b0ea: mov qword ptr [rip + 0x191fcb7], rax ; 0x10203ada8
0x10071b0f1: xor eax, eax
0x10071b0f3: call 0x100011c10 ; 0x100011c10
0x10071b0f8: lea rax, [rip + 0x4438cc] ; 0x100b5e9cb Tool_AutoStartEvent
0x10071b0ff: vmovq xmm0, rax
0x10071b104: vpunpcklqdq xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10071b109: vmovdqa xmmword ptr [rbp - 0x50], xmm0
0x10071b10e: vmovdqa xmmword ptr [rip + 0x191fcfa], xmm0 ; 0x10203ae10
0x10071b116: lea rax, [rip + 0x191fcf3] ; 0x10203ae10
0x10071b11d: mov rcx, qword ptr [rip + 0x191fc94] ; 0x10203adb8
0x10071b124: mov qword ptr [rip + 0x191fcf5], rcx ; 0x10203ae20
0x10071b12b: mov qword ptr [rip + 0x191fc86], rax ; 0x10203adb8
0x10071b132: lea r15, [rip + 0x467ef9] ; 0x100b83032 input
0x10071b139: mov qword ptr [rip + 0x5ef770], r15 ; 0x100d0a8b0
0x10071b140: lea rax, [rip + 0x5ef769] ; 0x100d0a8b0
0x10071b147: mov qword ptr [rip + 0x5ef766], 0 ; 0x100d0a8b8
0x10071b152: mov rcx, qword ptr [rip + 0x55cb07] ; 0x100c77c60
0x10071b159: mov qword ptr [rip + 0x5ef760], rcx ; 0x100d0a8c0
0x10071b160: mov qword ptr [rip + 0x5ef765], 0x38 ; 0x100d0a8d0
0x10071b16b: mov qword ptr [rip + 0x5ef766], r13 ; 0x100d0a8d8
0x10071b172: mov rcx, qword ptr [rip + 0x4ec4d7] ; 0x100c07650 -> 0x100717cb0 __Z18GetMetaClassByTypeIP10FloatSplitERK9MetaClassv
0x10071b179: mov qword ptr [rip + 0x5ef760], rcx ; 0x100d0a8e0
0x10071b180: mov qword ptr [rip + 0x5ef75d], 0xffffffffffffffff ; 0x100d0a8e8
0x10071b18b: mov qword ptr [rip + 0x5ef75e], r14 ; 0x100d0a8f0
0x10071b192: mov qword ptr [rip + 0x5ef75b], 0 ; 0x100d0a8f8
0x10071b19d: lea rdx, [rip + 0x4814c6] ; 0x100b9c66a outputs
0x10071b1a4: mov qword ptr [rip + 0x5ef755], rdx ; 0x100d0a900
0x10071b1ab: lea rdx, [rip + 0x5ef74e] ; 0x100d0a900
0x10071b1b2: mov qword ptr [rip + 0x5ef757], rax ; 0x100d0a910
0x10071b1b9: mov qword ptr [rip + 0x55caa0], rdx ; 0x100c77c60
0x10071b1c0: mov qword ptr [rip + 0x5ef755], 0x40 ; 0x100d0a920
0x10071b1cb: mov r12, qword ptr [rip + 0x4ec0f6] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x10071b1d2: mov qword ptr [rip + 0x5ef74f], r12 ; 0x100d0a928
0x10071b1d9: mov qword ptr [rip + 0x5ef750], rcx ; 0x100d0a930
0x10071b1e0: mov qword ptr [rip + 0x5ef74d], 0xffffffffffffffff ; 0x100d0a938
0x10071b1eb: mov qword ptr [rip + 0x5ef74e], r14 ; 0x100d0a940
0x10071b1f2: mov qword ptr [rip + 0x5ef74b], 0 ; 0x100d0a948
0x10071b1fd: lea rax, [rip + 0x467967] ; 0x100b82b6b Float
0x10071b204: vmovq xmm0, rax
0x10071b209: lea rax, [rip + 0x4437dc] ; 0x100b5e9ec Tool_ClumpType
0x10071b210: vmovq xmm1, rax
0x10071b215: vmovdqa xmmword ptr [rbp - 0x60], xmm1
0x10071b21a: vpunpcklqdq xmm0, xmm1, xmm0
0x10071b21e: vmovdqa xmmword ptr [rip + 0x191fc0a], xmm0 ; 0x10203ae30
0x10071b226: lea rax, [rip + 0x191fc03] ; 0x10203ae30
0x10071b22d: mov qword ptr [rip + 0x191fc08], 0 ; 0x10203ae40
0x10071b238: mov qword ptr [rip + 0x5ef6c9], rax ; 0x100d0a908
0x10071b23f: lea rax, [rip + 0x48142c] ; 0x100b9c672 FloatEnable
0x10071b246: mov qword ptr [rip + 0x191fc03], rax ; 0x10203ae50
0x10071b24d: lea rax, [rip + 0x191fbf4] ; 0x10203ae48
0x10071b254: mov qword ptr [rip + 0x191fbf9], 0 ; 0x10203ae58
0x10071b25f: mov rcx, qword ptr [rip + 0x554cf2] ; 0x100c6ff58
0x10071b266: mov qword ptr [rip + 0x191fbf3], rcx ; 0x10203ae60
0x10071b26d: mov qword ptr [rip + 0x554ce4], rax ; 0x100c6ff58
0x10071b274: mov qword ptr [rip + 0x191fbf5], rax ; 0x10203ae70
0x10071b27b: mov qword ptr [rip + 0x191fbf6], rbx ; 0x10203ae78
0x10071b282: mov dword ptr [rip + 0x191fbf4], 0xffffffff ; 0x10203ae80
0x10071b28c: mov dword ptr [rip + 0x191fbee], 0xffffffff ; 0x10203ae84
0x10071b296: mov qword ptr [rip + 0x191fbff], 0 ; 0x10203aea0
0x10071b2a1: mov rax, qword ptr [rip + 0x4efa30] ; 0x100c0acd8
0x10071b2a8: add rax, 0x10
0x10071b2ac: mov qword ptr [rip + 0x191fb95], rax ; 0x10203ae48
0x10071b2b3: xor eax, eax
0x10071b2b5: call 0x100011c10 ; 0x100011c10
0x10071b2ba: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10071b2bf: vmovaps xmmword ptr [rip + 0x191fbe9], xmm0 ; 0x10203aeb0
0x10071b2c7: lea rax, [rip + 0x191fbe2] ; 0x10203aeb0
0x10071b2ce: mov rcx, qword ptr [rip + 0x191fb83] ; 0x10203ae58
0x10071b2d5: mov qword ptr [rip + 0x191fbe4], rcx ; 0x10203aec0
0x10071b2dc: mov qword ptr [rip + 0x191fb75], rax ; 0x10203ae58
0x10071b2e3: mov qword ptr [rip + 0x5ef666], r15 ; 0x100d0a950
0x10071b2ea: lea rax, [rip + 0x5ef65f] ; 0x100d0a950
0x10071b2f1: mov qword ptr [rip + 0x5ef65c], 0 ; 0x100d0a958
0x10071b2fc: mov rcx, qword ptr [rip + 0x55c95d] ; 0x100c77c60
0x10071b303: mov qword ptr [rip + 0x5ef656], rcx ; 0x100d0a960
0x10071b30a: mov qword ptr [rip + 0x5ef65b], 0x38 ; 0x100d0a970
0x10071b315: mov qword ptr [rip + 0x5ef65c], r13 ; 0x100d0a978
0x10071b31c: mov rcx, qword ptr [rip + 0x4ec515] ; 0x100c07838 -> 0x100718050 __Z18GetMetaClassByTypeIP11FloatEnableERK9MetaClassv
0x10071b323: mov qword ptr [rip + 0x5ef656], rcx ; 0x100d0a980
0x10071b32a: mov qword ptr [rip + 0x5ef653], 0xffffffffffffffff ; 0x100d0a988
0x10071b335: mov qword ptr [rip + 0x5ef654], r14 ; 0x100d0a990
0x10071b33c: mov qword ptr [rip + 0x5ef651], 0 ; 0x100d0a998
0x10071b347: lea rdx, [rip + 0x461322] ; 0x100b7c670 objects
0x10071b34e: mov qword ptr [rip + 0x5ef64b], rdx ; 0x100d0a9a0
0x10071b355: lea rdx, [rip + 0x5ef644] ; 0x100d0a9a0
0x10071b35c: mov qword ptr [rip + 0x5ef64d], rax ; 0x100d0a9b0
0x10071b363: mov qword ptr [rip + 0x55c8f6], rdx ; 0x100c77c60
0x10071b36a: mov qword ptr [rip + 0x5ef64b], 0x40 ; 0x100d0a9c0
0x10071b375: mov qword ptr [rip + 0x5ef64c], r12 ; 0x100d0a9c8
0x10071b37c: mov qword ptr [rip + 0x5ef64d], rcx ; 0x100d0a9d0
0x10071b383: mov qword ptr [rip + 0x5ef64a], 0xffffffffffffffff ; 0x100d0a9d8
0x10071b38e: mov qword ptr [rip + 0x5ef64b], r14 ; 0x100d0a9e0
0x10071b395: mov qword ptr [rip + 0x5ef648], 0 ; 0x100d0a9e8
0x10071b3a0: lea rax, [rip + 0x443654] ; 0x100b5e9fb Object
0x10071b3a7: vmovq xmm0, rax
0x10071b3ac: vmovdqa xmm1, xmmword ptr [rbp - 0x60]
0x10071b3b1: vpunpcklqdq xmm0, xmm1, xmm0
0x10071b3b5: vmovdqa xmmword ptr [rbp - 0x60], xmm0
0x10071b3ba: vmovdqa xmmword ptr [rip + 0x191fb0e], xmm0 ; 0x10203aed0
0x10071b3c2: lea rax, [rip + 0x191fb07] ; 0x10203aed0
0x10071b3c9: mov qword ptr [rip + 0x191fb0c], 0 ; 0x10203aee0
0x10071b3d4: mov qword ptr [rip + 0x5ef5cd], rax ; 0x100d0a9a8
0x10071b3db: lea rax, [rip + 0x48129c] ; 0x100b9c67e IfEnabled
0x10071b3e2: mov qword ptr [rip + 0x191fb07], rax ; 0x10203aef0
0x10071b3e9: lea rax, [rip + 0x191faf8] ; 0x10203aee8
0x10071b3f0: mov qword ptr [rip + 0x191fafd], 0 ; 0x10203aef8
0x10071b3fb: mov rcx, qword ptr [rip + 0x554b56] ; 0x100c6ff58
0x10071b402: mov qword ptr [rip + 0x191faf7], rcx ; 0x10203af00
0x10071b409: mov qword ptr [rip + 0x554b48], rax ; 0x100c6ff58
0x10071b410: mov qword ptr [rip + 0x191faf9], rax ; 0x10203af10
0x10071b417: mov qword ptr [rip + 0x191fafa], rbx ; 0x10203af18
0x10071b41e: mov dword ptr [rip + 0x191faf8], 0xffffffff ; 0x10203af20
0x10071b428: mov dword ptr [rip + 0x191faf2], 0xffffffff ; 0x10203af24
0x10071b432: mov qword ptr [rip + 0x191fb03], 0 ; 0x10203af40
0x10071b43d: mov rax, qword ptr [rip + 0x4f14a4] ; 0x100c0c8e8
0x10071b444: add rax, 0x10
0x10071b448: mov qword ptr [rip + 0x191fa99], rax ; 0x10203aee8
0x10071b44f: xor eax, eax
0x10071b451: call 0x100011c10 ; 0x100011c10
0x10071b456: lea rax, [rip + 0x444300] ; 0x100b5f75d events
0x10071b45d: mov qword ptr [rip + 0x5ef58c], rax ; 0x100d0a9f0
0x10071b464: lea rcx, [rip + 0x5ef585] ; 0x100d0a9f0
0x10071b46b: mov rax, qword ptr [rip + 0x55c7ee] ; 0x100c77c60
0x10071b472: mov qword ptr [rip + 0x5ef587], rax ; 0x100d0aa00
0x10071b479: mov qword ptr [rip + 0x5ef58c], 0x48 ; 0x100d0aa10
0x10071b484: mov qword ptr [rip + 0x5ef58d], r12 ; 0x100d0aa18
0x10071b48b: mov rax, qword ptr [rip + 0x4ed53e] ; 0x100c089d0 -> 0x100718400 __Z18GetMetaClassByTypeIP9IfEnabledERK9MetaClassv
0x10071b492: mov qword ptr [rip + 0x5ef587], rax ; 0x100d0aa20
0x10071b499: mov qword ptr [rip + 0x5ef584], 0xffffffffffffffff ; 0x100d0aa28
0x10071b4a4: mov qword ptr [rip + 0x5ef585], r14 ; 0x100d0aa30
0x10071b4ab: mov qword ptr [rip + 0x5ef582], 0 ; 0x100d0aa38
0x10071b4b6: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10071b4bb: vmovaps xmmword ptr [rip + 0x191fa8d], xmm0 ; 0x10203af50
0x10071b4c3: lea rdx, [rip + 0x191fa86] ; 0x10203af50
0x10071b4ca: mov qword ptr [rip + 0x191fa8b], 0 ; 0x10203af60
0x10071b4d5: mov qword ptr [rip + 0x5ef51c], rdx ; 0x100d0a9f8
0x10071b4dc: lea rdx, [rip + 0x4811a5] ; 0x100b9c688 triggerOnDisabled
0x10071b4e3: mov qword ptr [rip + 0x5ef556], rdx ; 0x100d0aa40
0x10071b4ea: lea rdx, [rip + 0x5ef54f] ; 0x100d0aa40
0x10071b4f1: mov qword ptr [rip + 0x5ef54c], 0 ; 0x100d0aa48
0x10071b4fc: mov qword ptr [rip + 0x5ef54d], rcx ; 0x100d0aa50
0x10071b503: mov qword ptr [rip + 0x5ef552], 0x40 ; 0x100d0aa60
0x10071b50e: mov rcx, qword ptr [rip + 0x4ec043] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10071b515: mov qword ptr [rip + 0x5ef54c], rcx ; 0x100d0aa68
0x10071b51c: mov r15, rcx
0x10071b51f: mov qword ptr [rip + 0x5ef54a], rax ; 0x100d0aa70
0x10071b526: mov qword ptr [rip + 0x5ef547], 0xffffffffffffffff ; 0x100d0aa78
0x10071b531: mov qword ptr [rip + 0x5ef548], r14 ; 0x100d0aa80
0x10071b538: mov qword ptr [rip + 0x5ef545], 0 ; 0x100d0aa88
0x10071b543: lea rcx, [rip + 0x481150] ; 0x100b9c69a areTheseObjectsEnabled
0x10071b54a: mov qword ptr [rip + 0x5ef53f], rcx ; 0x100d0aa90
0x10071b551: lea rcx, [rip + 0x5ef538] ; 0x100d0aa90
0x10071b558: mov qword ptr [rip + 0x5ef541], rdx ; 0x100d0aaa0
0x10071b55f: mov qword ptr [rip + 0x5ef546], 0x38 ; 0x100d0aab0
0x10071b56a: mov qword ptr [rip + 0x5ef547], r12 ; 0x100d0aab8
0x10071b571: mov qword ptr [rip + 0x5ef548], rax ; 0x100d0aac0
0x10071b578: mov qword ptr [rip + 0x5ef545], 0xffffffffffffffff ; 0x100d0aac8
0x10071b583: mov qword ptr [rip + 0x5ef546], r14 ; 0x100d0aad0
0x10071b58a: mov qword ptr [rip + 0x5ef543], 0 ; 0x100d0aad8
0x10071b595: vmovaps xmmword ptr [rip + 0x191f9d3], xmm0 ; 0x10203af70
0x10071b59d: lea rdx, [rip + 0x191f9cc] ; 0x10203af70
0x10071b5a4: mov qword ptr [rip + 0x191f9d1], 0 ; 0x10203af80
0x10071b5af: mov qword ptr [rip + 0x5ef4e2], rdx ; 0x100d0aa98
0x10071b5b6: lea rdx, [rip + 0x4730c3] ; 0x100b8e680 checkOnce
0x10071b5bd: mov qword ptr [rip + 0x5ef51c], rdx ; 0x100d0aae0
0x10071b5c4: lea rdx, [rip + 0x5ef515] ; 0x100d0aae0
0x10071b5cb: mov qword ptr [rip + 0x5ef51e], rcx ; 0x100d0aaf0
0x10071b5d2: mov qword ptr [rip + 0x55c687], rdx ; 0x100c77c60
0x10071b5d9: mov qword ptr [rip + 0x5ef51c], 0x50 ; 0x100d0ab00
0x10071b5e4: mov qword ptr [rip + 0x5ef51d], r15 ; 0x100d0ab08
0x10071b5eb: mov qword ptr [rip + 0x5ef51e], rax ; 0x100d0ab10
0x10071b5f2: mov qword ptr [rip + 0x5ef51b], 0xffffffffffffffff ; 0x100d0ab18
0x10071b5fd: mov qword ptr [rip + 0x5ef51c], r14 ; 0x100d0ab20
0x10071b604: mov qword ptr [rip + 0x5ef519], 0 ; 0x100d0ab28
0x10071b60f: lea rax, [rip + 0x487a16] ; 0x100ba302c false
0x10071b616: vmovq xmm0, rax
0x10071b61b: vmovdqa xmm1, xmmword ptr [rbp - 0x80]
0x10071b620: vpunpcklqdq xmm0, xmm1, xmm0
0x10071b624: vmovdqa xmmword ptr [rbp - 0x90], xmm0
0x10071b62c: vmovdqa xmmword ptr [rip + 0x191f95c], xmm0 ; 0x10203af90
0x10071b634: lea rax, [rip + 0x191f955] ; 0x10203af90
0x10071b63b: mov qword ptr [rip + 0x191f95a], 0 ; 0x10203afa0
0x10071b646: mov qword ptr [rip + 0x5ef49b], rax ; 0x100d0aae8
0x10071b64d: lea rax, [rip + 0x48105d] ; 0x100b9c6b1 OnChangeAnd
0x10071b654: mov qword ptr [rip + 0x191f955], rax ; 0x10203afb0
0x10071b65b: lea rax, [rip + 0x191f946] ; 0x10203afa8
0x10071b662: mov qword ptr [rip + 0x191f94b], 0 ; 0x10203afb8
0x10071b66d: mov rcx, qword ptr [rip + 0x5548e4] ; 0x100c6ff58
0x10071b674: mov qword ptr [rip + 0x191f945], rcx ; 0x10203afc0
0x10071b67b: mov qword ptr [rip + 0x5548d6], rax ; 0x100c6ff58
0x10071b682: mov qword ptr [rip + 0x191f947], rax ; 0x10203afd0
0x10071b689: mov qword ptr [rip + 0x191f948], rbx ; 0x10203afd8
0x10071b690: mov dword ptr [rip + 0x191f946], 0xffffffff ; 0x10203afe0
0x10071b69a: mov dword ptr [rip + 0x191f940], 0xffffffff ; 0x10203afe4
0x10071b6a4: mov qword ptr [rip + 0x191f951], 0 ; 0x10203b000
0x10071b6af: mov rax, qword ptr [rip + 0x4ef6aa] ; 0x100c0ad60
0x10071b6b6: add rax, 0x10
0x10071b6ba: mov qword ptr [rip + 0x191f8e7], rax ; 0x10203afa8
0x10071b6c1: xor eax, eax
0x10071b6c3: call 0x100011c10 ; 0x100011c10
0x10071b6c8: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10071b6cd: vmovaps xmmword ptr [rip + 0x191f93b], xmm0 ; 0x10203b010
0x10071b6d5: lea rax, [rip + 0x191f934] ; 0x10203b010
0x10071b6dc: mov rcx, qword ptr [rip + 0x191f8d5] ; 0x10203afb8
0x10071b6e3: mov qword ptr [rip + 0x191f936], rcx ; 0x10203b020
0x10071b6ea: mov qword ptr [rip + 0x191f8c7], rax ; 0x10203afb8
0x10071b6f1: lea rax, [rip + 0x480fc5] ; 0x100b9c6bd allEnabled
0x10071b6f8: mov qword ptr [rip + 0x5ef431], rax ; 0x100d0ab30
0x10071b6ff: lea rcx, [rip + 0x5ef42a] ; 0x100d0ab30
0x10071b706: mov rax, qword ptr [rip + 0x55c553] ; 0x100c77c60
0x10071b70d: mov qword ptr [rip + 0x5ef42c], rax ; 0x100d0ab40
0x10071b714: mov qword ptr [rip + 0x5ef431], 0x38 ; 0x100d0ab50
0x10071b71f: mov qword ptr [rip + 0x5ef432], r12 ; 0x100d0ab58
0x10071b726: mov rax, qword ptr [rip + 0x4ec16b] ; 0x100c07898 -> 0x100718810 __Z18GetMetaClassByTypeIP11OnChangeAndERK9MetaClassv
0x10071b72d: mov qword ptr [rip + 0x5ef42c], rax ; 0x100d0ab60
0x10071b734: mov qword ptr [rip + 0x5ef429], 0xffffffffffffffff ; 0x100d0ab68
0x10071b73f: mov qword ptr [rip + 0x5ef42a], r14 ; 0x100d0ab70
0x10071b746: mov qword ptr [rip + 0x5ef427], 0 ; 0x100d0ab78
0x10071b751: vmovaps xmm2, xmmword ptr [rbp - 0x60]
0x10071b756: vmovaps xmmword ptr [rip + 0x191f8d2], xmm2 ; 0x10203b030
0x10071b75e: lea rdx, [rip + 0x191f8cb] ; 0x10203b030
0x10071b765: mov qword ptr [rip + 0x191f8d0], 0 ; 0x10203b040
0x10071b770: lea rsi, [rip + 0x4432a2] ; 0x100b5ea19 Tool_Nullable
0x10071b777: vmovq xmm0, rsi
0x10071b77c: vpunpcklqdq xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10071b781: vmovdqa xmmword ptr [rip + 0x191f8c7], xmm0 ; 0x10203b050
0x10071b789: vmovdqa xmm1, xmm0
0x10071b78d: vmovdqa xmmword ptr [rbp - 0xa0], xmm1
0x10071b795: lea rsi, [rip + 0x191f8b4] ; 0x10203b050
0x10071b79c: mov qword ptr [rip + 0x191f8bd], rdx ; 0x10203b060
0x10071b7a3: mov qword ptr [rip + 0x5ef38e], rsi ; 0x100d0ab38
0x10071b7aa: lea rdx, [rip + 0x480f17] ; 0x100b9c6c8 allDisabled
0x10071b7b1: mov qword ptr [rip + 0x5ef3c8], rdx ; 0x100d0ab80
0x10071b7b8: lea rdx, [rip + 0x5ef3c1] ; 0x100d0ab80
0x10071b7bf: mov qword ptr [rip + 0x5ef3ca], rcx ; 0x100d0ab90
0x10071b7c6: mov qword ptr [rip + 0x5ef3cf], 0x40 ; 0x100d0aba0
0x10071b7d1: mov qword ptr [rip + 0x5ef3d0], r12 ; 0x100d0aba8
0x10071b7d8: mov qword ptr [rip + 0x5ef3d1], rax ; 0x100d0abb0
0x10071b7df: mov qword ptr [rip + 0x5ef3ce], 0xffffffffffffffff ; 0x100d0abb8
0x10071b7ea: mov qword ptr [rip + 0x5ef3cf], r14 ; 0x100d0abc0
0x10071b7f1: mov qword ptr [rip + 0x5ef3cc], 0 ; 0x100d0abc8
0x10071b7fc: vmovaps xmm0, xmm2
0x10071b800: vmovaps xmmword ptr [rip + 0x191f868], xmm0 ; 0x10203b070
0x10071b808: lea rcx, [rip + 0x191f861] ; 0x10203b070
0x10071b80f: mov qword ptr [rip + 0x191f866], 0 ; 0x10203b080
0x10071b81a: vmovdqa xmmword ptr [rip + 0x191f86e], xmm1 ; 0x10203b090
0x10071b822: lea rsi, [rip + 0x191f867] ; 0x10203b090
0x10071b829: mov qword ptr [rip + 0x191f870], rcx ; 0x10203b0a0
0x10071b830: mov qword ptr [rip + 0x5ef351], rsi ; 0x100d0ab88
0x10071b837: lea rcx, [rip + 0x44474f] ; 0x100b5ff8d result
0x10071b83e: mov qword ptr [rip + 0x5ef38b], rcx ; 0x100d0abd0
0x10071b845: lea rcx, [rip + 0x5ef384] ; 0x100d0abd0
0x10071b84c: mov qword ptr [rip + 0x5ef38d], rdx ; 0x100d0abe0
0x10071b853: mov qword ptr [rip + 0x5ef392], 0x48 ; 0x100d0abf0
0x10071b85e: mov qword ptr [rip + 0x5ef393], r12 ; 0x100d0abf8
0x10071b865: mov qword ptr [rip + 0x5ef394], rax ; 0x100d0ac00
0x10071b86c: mov qword ptr [rip + 0x5ef391], 0xffffffffffffffff ; 0x100d0ac08
0x10071b877: mov qword ptr [rip + 0x5ef392], r14 ; 0x100d0ac10
0x10071b87e: mov qword ptr [rip + 0x5ef38f], 0 ; 0x100d0ac18
0x10071b889: vmovaps xmmword ptr [rip + 0x191f81f], xmm0 ; 0x10203b0b0
0x10071b891: lea rdx, [rip + 0x191f818] ; 0x10203b0b0
0x10071b898: mov qword ptr [rip + 0x191f81d], 0 ; 0x10203b0c0
0x10071b8a3: mov qword ptr [rip + 0x5ef32e], rdx ; 0x100d0abd8
0x10071b8aa: lea rdx, [rip + 0x459a3c] ; 0x100b752ed fireOnce
0x10071b8b1: mov qword ptr [rip + 0x5ef368], rdx ; 0x100d0ac20
0x10071b8b8: lea rdx, [rip + 0x5ef361] ; 0x100d0ac20
0x10071b8bf: mov qword ptr [rip + 0x5ef36a], rcx ; 0x100d0ac30
0x10071b8c6: mov qword ptr [rip + 0x55c393], rdx ; 0x100c77c60
0x10071b8cd: mov qword ptr [rip + 0x5ef368], 0x50 ; 0x100d0ac40
0x10071b8d8: mov qword ptr [rip + 0x5ef369], r15 ; 0x100d0ac48
0x10071b8df: mov qword ptr [rip + 0x5ef36a], rax ; 0x100d0ac50
0x10071b8e6: mov qword ptr [rip + 0x5ef367], 0xffffffffffffffff ; 0x100d0ac58
0x10071b8f1: mov qword ptr [rip + 0x5ef368], r14 ; 0x100d0ac60
0x10071b8f8: mov qword ptr [rip + 0x5ef365], 0 ; 0x100d0ac68
0x10071b903: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10071b90b: vmovaps xmmword ptr [rip + 0x191f7bd], xmm0 ; 0x10203b0d0
0x10071b913: lea rax, [rip + 0x191f7b6] ; 0x10203b0d0
0x10071b91a: mov qword ptr [rip + 0x191f7bb], 0 ; 0x10203b0e0
0x10071b925: mov qword ptr [rip + 0x5ef2fc], rax ; 0x100d0ac28
0x10071b92c: lea rax, [rip + 0x480da1] ; 0x100b9c6d4 FloatDistancePercentage
0x10071b933: mov qword ptr [rip + 0x191f7b6], rax ; 0x10203b0f0
0x10071b93a: lea rax, [rip + 0x191f7a7] ; 0x10203b0e8
0x10071b941: mov qword ptr [rip + 0x191f7ac], 0 ; 0x10203b0f8
0x10071b94c: mov rcx, qword ptr [rip + 0x554605] ; 0x100c6ff58
0x10071b953: mov qword ptr [rip + 0x191f7a6], rcx ; 0x10203b100
0x10071b95a: mov qword ptr [rip + 0x5545f7], rax ; 0x100c6ff58
0x10071b961: mov qword ptr [rip + 0x191f7a8], rax ; 0x10203b110
0x10071b968: mov qword ptr [rip + 0x191f7a9], rbx ; 0x10203b118
0x10071b96f: mov dword ptr [rip + 0x191f7a7], 0xffffffff ; 0x10203b120
0x10071b979: mov dword ptr [rip + 0x191f7a1], 0xffffffff ; 0x10203b124
0x10071b983: mov qword ptr [rip + 0x191f7b2], 0 ; 0x10203b140
0x10071b98e: mov rax, qword ptr [rip + 0x4f07c3] ; 0x100c0c158
0x10071b995: add rax, 0x10
0x10071b999: mov qword ptr [rip + 0x191f748], rax ; 0x10203b0e8
0x10071b9a0: xor eax, eax
0x10071b9a2: call 0x100011c10 ; 0x100011c10
0x10071b9a7: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10071b9ac: vmovaps xmmword ptr [rip + 0x191f79c], xmm0 ; 0x10203b150
0x10071b9b4: lea rax, [rip + 0x191f795] ; 0x10203b150
0x10071b9bb: mov rcx, qword ptr [rip + 0x191f736] ; 0x10203b0f8
0x10071b9c2: mov qword ptr [rip + 0x191f797], rcx ; 0x10203b160
0x10071b9c9: mov qword ptr [rip + 0x191f728], rax ; 0x10203b0f8
0x10071b9d0: lea rax, [rip + 0x480d15] ; 0x100b9c6ec startMarker
0x10071b9d7: mov qword ptr [rip + 0x5ef292], rax ; 0x100d0ac70
0x10071b9de: lea rcx, [rip + 0x5ef28b] ; 0x100d0ac70
0x10071b9e5: mov qword ptr [rip + 0x5ef288], 0 ; 0x100d0ac78
0x10071b9f0: mov rax, qword ptr [rip + 0x55c269] ; 0x100c77c60
0x10071b9f7: mov qword ptr [rip + 0x5ef282], rax ; 0x100d0ac80
0x10071b9fe: mov qword ptr [rip + 0x5ef287], 0x38 ; 0x100d0ac90
0x10071ba09: mov rdx, qword ptr [rip + 0x4eb918] ; 0x100c07328 -> 0x10003a510 __Z17GetMetaTypeByTypeIP6MarkerERK8MetaTypev
0x10071ba10: mov qword ptr [rip + 0x5ef281], rdx ; 0x100d0ac98
0x10071ba17: mov rax, qword ptr [rip + 0x4eca32] ; 0x100c08450 -> 0x100718ed0 __Z18GetMetaClassByTypeIP23FloatDistancePercentageERK9MetaClassv
0x10071ba1e: mov qword ptr [rip + 0x5ef27b], rax ; 0x100d0aca0
0x10071ba25: mov qword ptr [rip + 0x5ef278], 0xffffffffffffffff ; 0x100d0aca8
0x10071ba30: mov qword ptr [rip + 0x5ef279], r14 ; 0x100d0acb0
0x10071ba37: mov qword ptr [rip + 0x5ef276], 0 ; 0x100d0acb8
0x10071ba42: lea rsi, [rip + 0x480caf] ; 0x100b9c6f8 endMarker
0x10071ba49: mov qword ptr [rip + 0x5ef270], rsi ; 0x100d0acc0
0x10071ba50: lea rsi, [rip + 0x5ef269] ; 0x100d0acc0
0x10071ba57: mov qword ptr [rip + 0x5ef266], 0 ; 0x100d0acc8
0x10071ba62: mov qword ptr [rip + 0x5ef267], rcx ; 0x100d0acd0
0x10071ba69: mov qword ptr [rip + 0x5ef26c], 0x40 ; 0x100d0ace0
0x10071ba74: mov qword ptr [rip + 0x5ef26d], rdx ; 0x100d0ace8
0x10071ba7b: mov qword ptr [rip + 0x5ef26e], rax ; 0x100d0acf0
0x10071ba82: mov qword ptr [rip + 0x5ef26b], 0xffffffffffffffff ; 0x100d0acf8
0x10071ba8d: mov qword ptr [rip + 0x5ef26c], r14 ; 0x100d0ad00
0x10071ba94: mov qword ptr [rip + 0x5ef269], 0 ; 0x100d0ad08
0x10071ba9f: lea rcx, [rip + 0x480c5c] ; 0x100b9c702 currentPosition
0x10071baa6: mov qword ptr [rip + 0x5ef263], rcx ; 0x100d0ad10
0x10071baad: lea rcx, [rip + 0x5ef25c] ; 0x100d0ad10
0x10071bab4: mov qword ptr [rip + 0x5ef259], 0 ; 0x100d0ad18
0x10071babf: mov qword ptr [rip + 0x5ef25a], rsi ; 0x100d0ad20
0x10071bac6: mov qword ptr [rip + 0x5ef25f], 0x48 ; 0x100d0ad30
0x10071bad1: mov qword ptr [rip + 0x5ef260], rdx ; 0x100d0ad38
0x10071bad8: mov qword ptr [rip + 0x5ef261], rax ; 0x100d0ad40
0x10071badf: mov qword ptr [rip + 0x5ef25e], 0xffffffffffffffff ; 0x100d0ad48
0x10071baea: mov qword ptr [rip + 0x5ef25f], r14 ; 0x100d0ad50
0x10071baf1: mov qword ptr [rip + 0x5ef25c], 0 ; 0x100d0ad58
0x10071bafc: lea rdx, [rip + 0x474ca8] ; 0x100b907ab output
0x10071bb03: mov qword ptr [rip + 0x5ef256], rdx ; 0x100d0ad60
0x10071bb0a: mov r12, rdx
0x10071bb0d: lea rdx, [rip + 0x5ef24c] ; 0x100d0ad60
0x10071bb14: mov qword ptr [rip + 0x5ef249], 0 ; 0x100d0ad68
0x10071bb1f: mov qword ptr [rip + 0x5ef24a], rcx ; 0x100d0ad70
0x10071bb26: mov qword ptr [rip + 0x5ef24f], 0x50 ; 0x100d0ad80
0x10071bb31: mov qword ptr [rip + 0x5ef250], r13 ; 0x100d0ad88
0x10071bb38: mov qword ptr [rip + 0x5ef251], rax ; 0x100d0ad90
0x10071bb3f: mov qword ptr [rip + 0x5ef24e], 0xffffffffffffffff ; 0x100d0ad98
0x10071bb4a: mov qword ptr [rip + 0x5ef24f], r14 ; 0x100d0ada0
0x10071bb51: mov qword ptr [rip + 0x5ef24c], 0 ; 0x100d0ada8
0x10071bb5c: lea rcx, [rip + 0x480baf] ; 0x100b9c712 useXDistance
0x10071bb63: mov qword ptr [rip + 0x5ef246], rcx ; 0x100d0adb0
0x10071bb6a: lea rcx, [rip + 0x5ef23f] ; 0x100d0adb0
0x10071bb71: mov qword ptr [rip + 0x5ef248], rdx ; 0x100d0adc0
0x10071bb78: mov qword ptr [rip + 0x5ef24d], 0x58 ; 0x100d0add0
0x10071bb83: mov qword ptr [rip + 0x5ef24e], r15 ; 0x100d0add8
0x10071bb8a: mov qword ptr [rip + 0x5ef24f], rax ; 0x100d0ade0
0x10071bb91: mov qword ptr [rip + 0x5ef24c], 0xffffffffffffffff ; 0x100d0ade8
0x10071bb9c: mov qword ptr [rip + 0x5ef24d], r14 ; 0x100d0adf0
0x10071bba3: mov qword ptr [rip + 0x5ef24a], 0 ; 0x100d0adf8
0x10071bbae: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10071bbb6: vmovaps xmmword ptr [rip + 0x191f5b2], xmm0 ; 0x10203b170
0x10071bbbe: lea rdx, [rip + 0x191f5ab] ; 0x10203b170
0x10071bbc5: mov qword ptr [rip + 0x191f5b0], 0 ; 0x10203b180
0x10071bbd0: mov qword ptr [rip + 0x5ef1e1], rdx ; 0x100d0adb8
0x10071bbd7: lea rdx, [rip + 0x480b41] ; 0x100b9c71f useYDistance
0x10071bbde: mov qword ptr [rip + 0x5ef21b], rdx ; 0x100d0ae00
0x10071bbe5: lea rdx, [rip + 0x5ef214] ; 0x100d0ae00
0x10071bbec: mov qword ptr [rip + 0x5ef21d], rcx ; 0x100d0ae10
0x10071bbf3: mov qword ptr [rip + 0x5ef222], 0x59 ; 0x100d0ae20
0x10071bbfe: mov qword ptr [rip + 0x5ef223], r15 ; 0x100d0ae28
0x10071bc05: mov qword ptr [rip + 0x5ef224], rax ; 0x100d0ae30
0x10071bc0c: mov qword ptr [rip + 0x5ef221], 0xffffffffffffffff ; 0x100d0ae38
0x10071bc17: mov qword ptr [rip + 0x5ef222], r14 ; 0x100d0ae40
0x10071bc1e: mov qword ptr [rip + 0x5ef21f], 0 ; 0x100d0ae48
0x10071bc29: vmovaps xmmword ptr [rip + 0x191f55f], xmm0 ; 0x10203b190
0x10071bc31: lea rcx, [rip + 0x191f558] ; 0x10203b190
0x10071bc38: mov qword ptr [rip + 0x191f55d], 0 ; 0x10203b1a0
0x10071bc43: mov qword ptr [rip + 0x5ef1be], rcx ; 0x100d0ae08
0x10071bc4a: lea rcx, [rip + 0x480adb] ; 0x100b9c72c useZDistance
0x10071bc51: mov qword ptr [rip + 0x5ef1f8], rcx ; 0x100d0ae50
0x10071bc58: lea rcx, [rip + 0x5ef1f1] ; 0x100d0ae50
0x10071bc5f: mov qword ptr [rip + 0x5ef1fa], rdx ; 0x100d0ae60
0x10071bc66: mov qword ptr [rip + 0x55bff3], rcx ; 0x100c77c60
0x10071bc6d: mov qword ptr [rip + 0x5ef1f8], 0x5a ; 0x100d0ae70
0x10071bc78: mov qword ptr [rip + 0x5ef1f9], r15 ; 0x100d0ae78
0x10071bc7f: mov qword ptr [rip + 0x5ef1fa], rax ; 0x100d0ae80
0x10071bc86: mov qword ptr [rip + 0x5ef1f7], 0xffffffffffffffff ; 0x100d0ae88
0x10071bc91: mov qword ptr [rip + 0x5ef1f8], r14 ; 0x100d0ae90
0x10071bc98: mov qword ptr [rip + 0x5ef1f5], 0 ; 0x100d0ae98
0x10071bca3: vmovaps xmmword ptr [rip + 0x191f505], xmm0 ; 0x10203b1b0
0x10071bcab: lea rax, [rip + 0x191f4fe] ; 0x10203b1b0
0x10071bcb2: mov qword ptr [rip + 0x191f503], 0 ; 0x10203b1c0
0x10071bcbd: mov qword ptr [rip + 0x5ef194], rax ; 0x100d0ae58
0x10071bcc4: lea rax, [rip + 0x480a6e] ; 0x100b9c739 FloatMult
0x10071bccb: mov qword ptr [rip + 0x191f4fe], rax ; 0x10203b1d0
0x10071bcd2: lea rax, [rip + 0x191f4ef] ; 0x10203b1c8
0x10071bcd9: mov qword ptr [rip + 0x191f4f4], 0 ; 0x10203b1d8
0x10071bce4: mov rcx, qword ptr [rip + 0x55426d] ; 0x100c6ff58
0x10071bceb: mov qword ptr [rip + 0x191f4ee], rcx ; 0x10203b1e0
0x10071bcf2: mov qword ptr [rip + 0x55425f], rax ; 0x100c6ff58
0x10071bcf9: mov qword ptr [rip + 0x191f4f0], rax ; 0x10203b1f0
0x10071bd00: mov qword ptr [rip + 0x191f4f1], rbx ; 0x10203b1f8
0x10071bd07: mov dword ptr [rip + 0x191f4ef], 0xffffffff ; 0x10203b200
0x10071bd11: mov dword ptr [rip + 0x191f4e9], 0xffffffff ; 0x10203b204
0x10071bd1b: mov qword ptr [rip + 0x191f4fa], 0 ; 0x10203b220
0x10071bd26: mov rax, qword ptr [rip + 0x4f0ba3] ; 0x100c0c8d0
0x10071bd2d: add rax, 0x10
0x10071bd31: mov qword ptr [rip + 0x191f490], rax ; 0x10203b1c8
0x10071bd38: xor eax, eax
0x10071bd3a: call 0x100011c10 ; 0x100011c10
0x10071bd3f: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10071bd44: vmovaps xmmword ptr [rip + 0x191f4e4], xmm0 ; 0x10203b230
0x10071bd4c: lea rax, [rip + 0x191f4dd] ; 0x10203b230
0x10071bd53: mov rcx, qword ptr [rip + 0x191f47e] ; 0x10203b1d8
0x10071bd5a: mov qword ptr [rip + 0x191f4df], rcx ; 0x10203b240
0x10071bd61: mov qword ptr [rip + 0x191f470], rax ; 0x10203b1d8
0x10071bd68: lea rax, [rip + 0x4688c2] ; 0x100b84631 a
0x10071bd6f: mov qword ptr [rip + 0x5ef12a], rax ; 0x100d0aea0
0x10071bd76: lea rax, [rip + 0x5ef123] ; 0x100d0aea0
0x10071bd7d: mov qword ptr [rip + 0x5ef120], 0 ; 0x100d0aea8
0x10071bd88: mov rcx, qword ptr [rip + 0x55bed1] ; 0x100c77c60
0x10071bd8f: mov qword ptr [rip + 0x5ef11a], rcx ; 0x100d0aeb0
0x10071bd96: mov qword ptr [rip + 0x5ef11f], 0x38 ; 0x100d0aec0
0x10071bda1: mov qword ptr [rip + 0x5ef120], r13 ; 0x100d0aec8
0x10071bda8: mov rcx, qword ptr [rip + 0x4ecc09] ; 0x100c089b8 -> 0x1007191d0 __Z18GetMetaClassByTypeIP9FloatMultERK9MetaClassv
0x10071bdaf: mov qword ptr [rip + 0x5ef11a], rcx ; 0x100d0aed0
0x10071bdb6: mov qword ptr [rip + 0x5ef117], 0xffffffffffffffff ; 0x100d0aed8
0x10071bdc1: mov qword ptr [rip + 0x5ef118], r14 ; 0x100d0aee0
0x10071bdc8: mov qword ptr [rip + 0x5ef115], 0 ; 0x100d0aee8
0x10071bdd3: lea rdx, [rip + 0x45c21f] ; 0x100b77ff9 b
0x10071bdda: mov qword ptr [rip + 0x5ef10f], rdx ; 0x100d0aef0
0x10071bde1: lea rdx, [rip + 0x5ef108] ; 0x100d0aef0
0x10071bde8: mov qword ptr [rip + 0x5ef105], 0 ; 0x100d0aef8
0x10071bdf3: mov qword ptr [rip + 0x5ef106], rax ; 0x100d0af00
0x10071bdfa: mov qword ptr [rip + 0x5ef10b], 0x40 ; 0x100d0af10
0x10071be05: mov qword ptr [rip + 0x5ef10c], r13 ; 0x100d0af18
0x10071be0c: mov qword ptr [rip + 0x5ef10d], rcx ; 0x100d0af20
0x10071be13: mov qword ptr [rip + 0x5ef10a], 0xffffffffffffffff ; 0x100d0af28
0x10071be1e: mov qword ptr [rip + 0x5ef10b], r14 ; 0x100d0af30
0x10071be25: mov qword ptr [rip + 0x5ef108], 0 ; 0x100d0af38
0x10071be30: mov qword ptr [rip + 0x5ef109], r12 ; 0x100d0af40
0x10071be37: lea rax, [rip + 0x5ef102] ; 0x100d0af40
0x10071be3e: mov qword ptr [rip + 0x5ef0ff], 0 ; 0x100d0af48
0x10071be49: mov qword ptr [rip + 0x5ef100], rdx ; 0x100d0af50
0x10071be50: mov qword ptr [rip + 0x55be09], rax ; 0x100c77c60
0x10071be57: mov qword ptr [rip + 0x5ef0fe], 0x48 ; 0x100d0af60
0x10071be62: mov qword ptr [rip + 0x5ef0ff], r13 ; 0x100d0af68
0x10071be69: mov qword ptr [rip + 0x5ef100], rcx ; 0x100d0af70
0x10071be70: mov qword ptr [rip + 0x5ef0fd], 0xffffffffffffffff ; 0x100d0af78
0x10071be7b: mov qword ptr [rip + 0x5ef0fe], r14 ; 0x100d0af80
0x10071be82: mov qword ptr [rip + 0x5ef0fb], 0 ; 0x100d0af88
0x10071be8d: lea rax, [rip + 0x4808af] ; 0x100b9c743 FloatAdd
0x10071be94: mov qword ptr [rip + 0x191f3b5], rax ; 0x10203b250
0x10071be9b: lea rax, [rip + 0x191f3a6] ; 0x10203b248
0x10071bea2: mov qword ptr [rip + 0x191f3ab], 0 ; 0x10203b258
0x10071bead: mov rcx, qword ptr [rip + 0x5540a4] ; 0x100c6ff58
0x10071beb4: mov qword ptr [rip + 0x191f3a5], rcx ; 0x10203b260
0x10071bebb: mov qword ptr [rip + 0x554096], rax ; 0x100c6ff58
0x10071bec2: mov qword ptr [rip + 0x191f3a7], rax ; 0x10203b270
0x10071bec9: mov qword ptr [rip + 0x191f3a8], rbx ; 0x10203b278
0x10071bed0: mov dword ptr [rip + 0x191f3a6], 0xffffffff ; 0x10203b280
0x10071beda: mov dword ptr [rip + 0x191f3a0], 0xffffffff ; 0x10203b284
0x10071bee4: mov qword ptr [rip + 0x191f3b1], 0 ; 0x10203b2a0
0x10071beef: mov rax, qword ptr [rip + 0x4f07d2] ; 0x100c0c6c8
0x10071bef6: add rax, 0x10
0x10071befa: mov qword ptr [rip + 0x191f347], rax ; 0x10203b248
0x10071bf01: xor eax, eax
0x10071bf03: call 0x100011c10 ; 0x100011c10
0x10071bf08: lea rax, [rip + 0x456c0d] ; 0x100b72b1c target
0x10071bf0f: mov qword ptr [rip + 0x5ef07a], rax ; 0x100d0af90
0x10071bf16: lea rcx, [rip + 0x5ef073] ; 0x100d0af90
0x10071bf1d: mov qword ptr [rip + 0x5ef070], 0 ; 0x100d0af98
0x10071bf28: mov rax, qword ptr [rip + 0x55bd31] ; 0x100c77c60
0x10071bf2f: mov qword ptr [rip + 0x5ef06a], rax ; 0x100d0afa0
0x10071bf36: mov qword ptr [rip + 0x5ef06f], 0x38 ; 0x100d0afb0
0x10071bf41: mov qword ptr [rip + 0x5ef070], r13 ; 0x100d0afb8
0x10071bf48: mov rax, qword ptr [rip + 0x4ec8b1] ; 0x100c08800 -> 0x100719520 __Z18GetMetaClassByTypeIP8FloatAddERK9MetaClassv
0x10071bf4f: mov qword ptr [rip + 0x5ef06a], rax ; 0x100d0afc0
0x10071bf56: mov qword ptr [rip + 0x5ef067], 0xffffffffffffffff ; 0x100d0afc8
0x10071bf61: mov qword ptr [rip + 0x5ef068], r14 ; 0x100d0afd0
0x10071bf68: mov qword ptr [rip + 0x5ef065], 0 ; 0x100d0afd8
0x10071bf73: lea rdx, [rip + 0x448394] ; 0x100b6430e amount
0x10071bf7a: mov qword ptr [rip + 0x5ef05f], rdx ; 0x100d0afe0
0x10071bf81: lea rdx, [rip + 0x5ef058] ; 0x100d0afe0
0x10071bf88: mov qword ptr [rip + 0x5ef055], 0 ; 0x100d0afe8
0x10071bf93: mov qword ptr [rip + 0x5ef056], rcx ; 0x100d0aff0
0x10071bf9a: mov qword ptr [rip + 0x5ef05b], 0x50 ; 0x100d0b000
0x10071bfa5: mov r12, qword ptr [rip + 0x4eb5b4] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x10071bfac: mov qword ptr [rip + 0x5ef055], r12 ; 0x100d0b008
0x10071bfb3: mov qword ptr [rip + 0x5ef056], rax ; 0x100d0b010
0x10071bfba: mov qword ptr [rip + 0x5ef053], 0xffffffffffffffff ; 0x100d0b018
0x10071bfc5: mov qword ptr [rip + 0x5ef054], r14 ; 0x100d0b020
0x10071bfcc: mov qword ptr [rip + 0x5ef051], 0 ; 0x100d0b028
0x10071bfd7: lea rcx, [rip + 0x48076e] ; 0x100b9c74c minClampedValue
0x10071bfde: mov qword ptr [rip + 0x5ef04b], rcx ; 0x100d0b030
0x10071bfe5: lea rcx, [rip + 0x5ef044] ; 0x100d0b030
0x10071bfec: mov qword ptr [rip + 0x5ef041], 0 ; 0x100d0b038
0x10071bff7: mov qword ptr [rip + 0x5ef042], rdx ; 0x100d0b040
0x10071bffe: mov qword ptr [rip + 0x5ef047], 0x54 ; 0x100d0b050
0x10071c009: mov qword ptr [rip + 0x5ef048], r12 ; 0x100d0b058
0x10071c010: mov qword ptr [rip + 0x5ef049], rax ; 0x100d0b060
0x10071c017: mov qword ptr [rip + 0x5ef046], 0xffffffffffffffff ; 0x100d0b068
0x10071c022: mov qword ptr [rip + 0x5ef047], r14 ; 0x100d0b070
0x10071c029: mov qword ptr [rip + 0x5ef044], 0 ; 0x100d0b078
0x10071c034: lea rdx, [rip + 0x480721] ; 0x100b9c75c maxClampedValue
0x10071c03b: mov qword ptr [rip + 0x5ef03e], rdx ; 0x100d0b080
0x10071c042: lea rdx, [rip + 0x5ef037] ; 0x100d0b080
0x10071c049: mov qword ptr [rip + 0x5ef034], 0 ; 0x100d0b088
0x10071c054: mov qword ptr [rip + 0x5ef035], rcx ; 0x100d0b090
0x10071c05b: mov qword ptr [rip + 0x5ef03a], 0x58 ; 0x100d0b0a0
0x10071c066: mov qword ptr [rip + 0x5ef03b], r12 ; 0x100d0b0a8
0x10071c06d: mov qword ptr [rip + 0x5ef03c], rax ; 0x100d0b0b0
0x10071c074: mov qword ptr [rip + 0x5ef039], 0xffffffffffffffff ; 0x100d0b0b8
0x10071c07f: mov qword ptr [rip + 0x5ef03a], r14 ; 0x100d0b0c0
0x10071c086: mov qword ptr [rip + 0x5ef037], 0 ; 0x100d0b0c8
0x10071c091: lea rcx, [rip + 0x4806d4] ; 0x100b9c76c useMinClampedValue
0x10071c098: mov qword ptr [rip + 0x5ef031], rcx ; 0x100d0b0d0
0x10071c09f: lea rcx, [rip + 0x5ef02a] ; 0x100d0b0d0
0x10071c0a6: mov qword ptr [rip + 0x5ef027], 0 ; 0x100d0b0d8
0x10071c0b1: mov qword ptr [rip + 0x5ef028], rdx ; 0x100d0b0e0
0x10071c0b8: mov qword ptr [rip + 0x5ef02d], 0x5c ; 0x100d0b0f0
0x10071c0c3: mov rbx, r15
0x10071c0c6: mov qword ptr [rip + 0x5ef02b], rbx ; 0x100d0b0f8
0x10071c0cd: mov qword ptr [rip + 0x5ef02c], rax ; 0x100d0b100
0x10071c0d4: mov qword ptr [rip + 0x5ef029], 0xffffffffffffffff ; 0x100d0b108
0x10071c0df: mov qword ptr [rip + 0x5ef02a], r14 ; 0x100d0b110
0x10071c0e6: mov qword ptr [rip + 0x5ef027], 0 ; 0x100d0b118
0x10071c0f1: lea rdx, [rip + 0x480687] ; 0x100b9c77f useMaxClampedValue
0x10071c0f8: mov qword ptr [rip + 0x5ef021], rdx ; 0x100d0b120
0x10071c0ff: lea rdx, [rip + 0x5ef01a] ; 0x100d0b120
0x10071c106: mov qword ptr [rip + 0x5ef017], 0 ; 0x100d0b128
0x10071c111: mov qword ptr [rip + 0x5ef018], rcx ; 0x100d0b130
0x10071c118: mov qword ptr [rip + 0x5ef01d], 0x5d ; 0x100d0b140
0x10071c123: mov qword ptr [rip + 0x5ef01e], rbx ; 0x100d0b148
0x10071c12a: mov qword ptr [rip + 0x5ef01f], rax ; 0x100d0b150
0x10071c131: mov qword ptr [rip + 0x5ef01c], 0xffffffffffffffff ; 0x100d0b158
0x10071c13c: mov qword ptr [rip + 0x5ef01d], r14 ; 0x100d0b160
0x10071c143: mov qword ptr [rip + 0x5ef01a], 0 ; 0x100d0b168
0x10071c14e: lea rcx, [rip + 0x48063d] ; 0x100b9c792 updateEveryFrame
0x10071c155: mov qword ptr [rip + 0x5ef014], rcx ; 0x100d0b170
0x10071c15c: lea rcx, [rip + 0x5ef00d] ; 0x100d0b170
0x10071c163: mov qword ptr [rip + 0x5ef00a], 0 ; 0x100d0b178
0x10071c16e: mov qword ptr [rip + 0x5ef00b], rdx ; 0x100d0b180
0x10071c175: mov qword ptr [rip + 0x5ef010], 0x5e ; 0x100d0b190
0x10071c180: mov qword ptr [rip + 0x5ef011], rbx ; 0x100d0b198
0x10071c187: mov qword ptr [rip + 0x5ef012], rax ; 0x100d0b1a0
0x10071c18e: mov qword ptr [rip + 0x5ef00f], 0xffffffffffffffff ; 0x100d0b1a8
0x10071c199: mov qword ptr [rip + 0x5ef010], r14 ; 0x100d0b1b0
0x10071c1a0: mov qword ptr [rip + 0x5ef00d], 0 ; 0x100d0b1b8
0x10071c1ab: lea rdx, [rip + 0x4805f1] ; 0x100b9c7a3 amountFloat
0x10071c1b2: mov qword ptr [rip + 0x5ef007], rdx ; 0x100d0b1c0
0x10071c1b9: lea rdx, [rip + 0x5ef000] ; 0x100d0b1c0
0x10071c1c0: mov qword ptr [rip + 0x5ef009], rcx ; 0x100d0b1d0
0x10071c1c7: mov qword ptr [rip + 0x5ef00e], 0x40 ; 0x100d0b1e0
0x10071c1d2: mov qword ptr [rip + 0x5ef00f], r13 ; 0x100d0b1e8
0x10071c1d9: mov qword ptr [rip + 0x5ef010], rax ; 0x100d0b1f0
0x10071c1e0: mov qword ptr [rip + 0x5ef00d], 0xffffffffffffffff ; 0x100d0b1f8
0x10071c1eb: mov qword ptr [rip + 0x5ef00e], r14 ; 0x100d0b200
0x10071c1f2: mov qword ptr [rip + 0x5ef00b], 0 ; 0x100d0b208
0x10071c1fd: vmovaps xmm1, xmmword ptr [rbp - 0xa0]
0x10071c205: vmovaps xmmword ptr [rip + 0x191f0a3], xmm1 ; 0x10203b2b0
0x10071c20d: lea rcx, [rip + 0x191f09c] ; 0x10203b2b0
0x10071c214: mov qword ptr [rip + 0x191f0a1], 0 ; 0x10203b2c0
0x10071c21f: lea rsi, [rip + 0x442871] ; 0x100b5ea97 null
0x10071c226: vmovq xmm0, rsi
0x10071c22b: vmovdqa xmm2, xmmword ptr [rbp - 0x80]
0x10071c230: vpunpcklqdq xmm0, xmm2, xmm0
0x10071c234: vmovdqa xmmword ptr [rip + 0x191f094], xmm0 ; 0x10203b2d0
0x10071c23c: vmovdqa xmmword ptr [rbp - 0xc0], xmm0
0x10071c244: lea rsi, [rip + 0x191f085] ; 0x10203b2d0
0x10071c24b: mov qword ptr [rip + 0x191f08e], rcx ; 0x10203b2e0
0x10071c252: mov qword ptr [rip + 0x5eef6f], rsi ; 0x100d0b1c8
0x10071c259: lea r15, [rip + 0x47454b] ; 0x100b907ab output
0x10071c260: mov qword ptr [rip + 0x5eefa9], r15 ; 0x100d0b210
0x10071c267: lea rcx, [rip + 0x5eefa2] ; 0x100d0b210
0x10071c26e: mov qword ptr [rip + 0x5eefab], rdx ; 0x100d0b220
0x10071c275: mov qword ptr [rip + 0x55b9e4], rcx ; 0x100c77c60
0x10071c27c: mov qword ptr [rip + 0x5eefa9], 0x48 ; 0x100d0b230
0x10071c287: mov qword ptr [rip + 0x5eefaa], r13 ; 0x100d0b238
0x10071c28e: mov qword ptr [rip + 0x5eefab], rax ; 0x100d0b240
0x10071c295: mov qword ptr [rip + 0x5eefa8], 0xffffffffffffffff ; 0x100d0b248
0x10071c2a0: mov qword ptr [rip + 0x5eefa9], r14 ; 0x100d0b250
0x10071c2a7: mov qword ptr [rip + 0x5eefa6], 0 ; 0x100d0b258
0x10071c2b2: vmovaps xmmword ptr [rip + 0x191f036], xmm1 ; 0x10203b2f0
0x10071c2ba: lea rax, [rip + 0x191f02f] ; 0x10203b2f0
0x10071c2c1: mov qword ptr [rip + 0x191f034], 0 ; 0x10203b300
0x10071c2cc: vmovdqa xmmword ptr [rip + 0x191f03c], xmm0 ; 0x10203b310
0x10071c2d4: lea rcx, [rip + 0x191f035] ; 0x10203b310
0x10071c2db: mov qword ptr [rip + 0x191f03e], rax ; 0x10203b320
0x10071c2e2: mov qword ptr [rip + 0x5eef2f], rcx ; 0x100d0b218
0x10071c2e9: lea rax, [rip + 0x4804bf] ; 0x100b9c7af FloatDistanceFade
0x10071c2f0: mov qword ptr [rip + 0x191f039], rax ; 0x10203b330
0x10071c2f7: lea rax, [rip + 0x191f02a] ; 0x10203b328
0x10071c2fe: mov qword ptr [rip + 0x191f02f], 0 ; 0x10203b338
0x10071c309: mov rcx, qword ptr [rip + 0x553c48] ; 0x100c6ff58
0x10071c310: mov qword ptr [rip + 0x191f029], rcx ; 0x10203b340
0x10071c317: mov qword ptr [rip + 0x553c3a], rax ; 0x100c6ff58
0x10071c31e: mov qword ptr [rip + 0x191f02b], rax ; 0x10203b350
0x10071c325: mov rax, qword ptr [rip + 0x4ec2bc] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x10071c32c: mov qword ptr [rip + 0x191f025], rax ; 0x10203b358
0x10071c333: mov dword ptr [rip + 0x191f023], 0xffffffff ; 0x10203b360
0x10071c33d: mov dword ptr [rip + 0x191f01d], 0xffffffff ; 0x10203b364
0x10071c347: mov qword ptr [rip + 0x191f02e], 0 ; 0x10203b380
0x10071c352: mov rax, qword ptr [rip + 0x4ef787] ; 0x100c0bae0
0x10071c359: add rax, 0x10
0x10071c35d: mov qword ptr [rip + 0x191efc4], rax ; 0x10203b328
0x10071c364: xor eax, eax
0x10071c366: call 0x100011c10 ; 0x100011c10
0x10071c36b: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10071c370: vmovaps xmmword ptr [rip + 0x191f018], xmm0 ; 0x10203b390
0x10071c378: lea rax, [rip + 0x191f011] ; 0x10203b390
0x10071c37f: mov rcx, qword ptr [rip + 0x191efb2] ; 0x10203b338
0x10071c386: mov qword ptr [rip + 0x191f013], rcx ; 0x10203b3a0
0x10071c38d: mov qword ptr [rip + 0x191efa4], rax ; 0x10203b338
0x10071c394: lea rax, [rip + 0x4715eb] ; 0x100b8d986 position
0x10071c39b: mov qword ptr [rip + 0x5eeebe], rax ; 0x100d0b260
0x10071c3a2: lea rcx, [rip + 0x5eeeb7] ; 0x100d0b260
0x10071c3a9: mov qword ptr [rip + 0x5eeeb4], 0 ; 0x100d0b268
0x10071c3b4: mov rax, qword ptr [rip + 0x55b8a5] ; 0x100c77c60
0x10071c3bb: mov qword ptr [rip + 0x5eeeae], rax ; 0x100d0b270
0x10071c3c2: mov qword ptr [rip + 0x5eeeb3], 0x38 ; 0x100d0b280
0x10071c3cd: mov rax, qword ptr [rip + 0x4eaf5c] ; 0x100c07330 -> 0x100148fe0 __Z17GetMetaTypeByTypeIP6ObjectERK8MetaTypev
0x10071c3d4: mov qword ptr [rip + 0x5eeead], rax ; 0x100d0b288
0x10071c3db: mov rax, qword ptr [rip + 0x4ebcf6] ; 0x100c080d8 -> 0x1007198e0 __Z18GetMetaClassByTypeIP17FloatDistanceFadeERK9MetaClassv
0x10071c3e2: mov qword ptr [rip + 0x5eeea7], rax ; 0x100d0b290
0x10071c3e9: mov qword ptr [rip + 0x5eeea4], 0xffffffffffffffff ; 0x100d0b298
0x10071c3f4: mov qword ptr [rip + 0x5eeea5], r14 ; 0x100d0b2a0
0x10071c3fb: mov qword ptr [rip + 0x5eeea2], 0 ; 0x100d0b2a8
0x10071c406: lea rdx, [rip + 0x4803b4] ; 0x100b9c7c1 distA
0x10071c40d: mov qword ptr [rip + 0x5eee9c], rdx ; 0x100d0b2b0
0x10071c414: lea rdx, [rip + 0x5eee95] ; 0x100d0b2b0
0x10071c41b: mov qword ptr [rip + 0x5eee9e], rcx ; 0x100d0b2c0
0x10071c422: mov qword ptr [rip + 0x5eeea3], 0x40 ; 0x100d0b2d0
0x10071c42d: mov qword ptr [rip + 0x5eeea4], r12 ; 0x100d0b2d8
0x10071c434: mov qword ptr [rip + 0x5eeea5], rax ; 0x100d0b2e0
0x10071c43b: mov qword ptr [rip + 0x5eeea2], 0xffffffffffffffff ; 0x100d0b2e8
0x10071c446: mov qword ptr [rip + 0x5eeea3], r14 ; 0x100d0b2f0
0x10071c44d: mov qword ptr [rip + 0x5eeea0], 0 ; 0x100d0b2f8
0x10071c458: lea rcx, [rip + 0x45c815] ; 0x100b78c74 5.0
0x10071c45f: vmovq xmm0, rcx
0x10071c464: vmovdqa xmm1, xmmword ptr [rbp - 0x80]
0x10071c469: vpunpcklqdq xmm0, xmm1, xmm0
0x10071c46d: vmovdqa xmmword ptr [rip + 0x191ef3b], xmm0 ; 0x10203b3b0
0x10071c475: lea rcx, [rip + 0x191ef34] ; 0x10203b3b0
0x10071c47c: mov qword ptr [rip + 0x191ef39], 0 ; 0x10203b3c0
0x10071c487: mov qword ptr [rip + 0x5eee2a], rcx ; 0x100d0b2b8
0x10071c48e: lea rcx, [rip + 0x480332] ; 0x100b9c7c7 distB
0x10071c495: mov qword ptr [rip + 0x5eee64], rcx ; 0x100d0b300
0x10071c49c: lea rcx, [rip + 0x5eee5d] ; 0x100d0b300
0x10071c4a3: mov qword ptr [rip + 0x5eee66], rdx ; 0x100d0b310
0x10071c4aa: mov qword ptr [rip + 0x5eee6b], 0x44 ; 0x100d0b320
0x10071c4b5: mov qword ptr [rip + 0x5eee6c], r12 ; 0x100d0b328
0x10071c4bc: mov qword ptr [rip + 0x5eee6d], rax ; 0x100d0b330
0x10071c4c3: mov qword ptr [rip + 0x5eee6a], 0xffffffffffffffff ; 0x100d0b338
0x10071c4ce: mov qword ptr [rip + 0x5eee6b], r14 ; 0x100d0b340
0x10071c4d5: mov qword ptr [rip + 0x5eee68], 0 ; 0x100d0b348
0x10071c4e0: lea rdx, [rip + 0x46177d] ; 0x100b7dc64 20.0
0x10071c4e7: vmovq xmm0, rdx
0x10071c4ec: vpunpcklqdq xmm0, xmm1, xmm0
0x10071c4f0: vmovdqa xmmword ptr [rip + 0x191eed8], xmm0 ; 0x10203b3d0
0x10071c4f8: lea rdx, [rip + 0x191eed1] ; 0x10203b3d0
0x10071c4ff: mov qword ptr [rip + 0x191eed6], 0 ; 0x10203b3e0
0x10071c50a: mov qword ptr [rip + 0x5eedf7], rdx ; 0x100d0b308
0x10071c511: lea rdx, [rip + 0x4802b5] ; 0x100b9c7cd valueA
0x10071c518: mov qword ptr [rip + 0x5eee31], rdx ; 0x100d0b350
0x10071c51f: lea rdx, [rip + 0x5eee2a] ; 0x100d0b350
0x10071c526: mov qword ptr [rip + 0x5eee33], rcx ; 0x100d0b360
0x10071c52d: mov qword ptr [rip + 0x5eee38], 0x48 ; 0x100d0b370
0x10071c538: mov qword ptr [rip + 0x5eee39], r12 ; 0x100d0b378
0x10071c53f: mov qword ptr [rip + 0x5eee3a], rax ; 0x100d0b380
0x10071c546: mov qword ptr [rip + 0x5eee37], 0xffffffffffffffff ; 0x100d0b388
0x10071c551: mov qword ptr [rip + 0x5eee38], r14 ; 0x100d0b390
0x10071c558: mov qword ptr [rip + 0x5eee35], 0 ; 0x100d0b398
0x10071c563: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10071c568: vmovaps xmmword ptr [rip + 0x191ee80], xmm0 ; 0x10203b3f0
0x10071c570: lea rcx, [rip + 0x191ee79] ; 0x10203b3f0
0x10071c577: mov qword ptr [rip + 0x191ee7e], 0 ; 0x10203b400
0x10071c582: mov qword ptr [rip + 0x5eedcf], rcx ; 0x100d0b358
0x10071c589: lea rcx, [rip + 0x480244] ; 0x100b9c7d4 valueB
0x10071c590: mov qword ptr [rip + 0x5eee09], rcx ; 0x100d0b3a0
0x10071c597: lea rcx, [rip + 0x5eee02] ; 0x100d0b3a0
0x10071c59e: mov qword ptr [rip + 0x5eee0b], rdx ; 0x100d0b3b0
0x10071c5a5: mov qword ptr [rip + 0x5eee10], 0x4c ; 0x100d0b3c0
0x10071c5b0: mov qword ptr [rip + 0x5eee11], r12 ; 0x100d0b3c8
0x10071c5b7: mov qword ptr [rip + 0x5eee12], rax ; 0x100d0b3d0
0x10071c5be: mov qword ptr [rip + 0x5eee0f], 0xffffffffffffffff ; 0x100d0b3d8
0x10071c5c9: mov qword ptr [rip + 0x5eee10], r14 ; 0x100d0b3e0
0x10071c5d0: mov qword ptr [rip + 0x5eee0d], 0 ; 0x100d0b3e8
0x10071c5db: lea rdx, [rip + 0x457b32] ; 0x100b74114 0.0
0x10071c5e2: vmovq xmm0, rdx
0x10071c5e7: vpunpcklqdq xmm0, xmm1, xmm0
0x10071c5eb: vmovdqa xmmword ptr [rip + 0x191ee1d], xmm0 ; 0x10203b410
0x10071c5f3: lea rdx, [rip + 0x191ee16] ; 0x10203b410
0x10071c5fa: mov qword ptr [rip + 0x191ee1b], 0 ; 0x10203b420
0x10071c605: mov qword ptr [rip + 0x5eed9c], rdx ; 0x100d0b3a8
0x10071c60c: mov qword ptr [rip + 0x5eeddd], r15 ; 0x100d0b3f0
0x10071c613: lea rdx, [rip + 0x5eedd6] ; 0x100d0b3f0
0x10071c61a: mov qword ptr [rip + 0x5eedd3], 0 ; 0x100d0b3f8
0x10071c625: mov qword ptr [rip + 0x5eedd4], rcx ; 0x100d0b400
0x10071c62c: mov qword ptr [rip + 0x5eedd9], 0x50 ; 0x100d0b410
0x10071c637: mov qword ptr [rip + 0x5eedda], r13 ; 0x100d0b418
0x10071c63e: mov qword ptr [rip + 0x5eeddb], rax ; 0x100d0b420
0x10071c645: mov qword ptr [rip + 0x5eedd8], 0xffffffffffffffff ; 0x100d0b428
0x10071c650: mov qword ptr [rip + 0x5eedd9], r14 ; 0x100d0b430
0x10071c657: mov qword ptr [rip + 0x5eedd6], 0 ; 0x100d0b438
0x10071c662: lea rcx, [rip + 0x46288d] ; 0x100b7eef6 cameraDistance
0x10071c669: mov qword ptr [rip + 0x5eedd0], rcx ; 0x100d0b440
0x10071c670: lea rcx, [rip + 0x5eedc9] ; 0x100d0b440
0x10071c677: mov qword ptr [rip + 0x5eedd2], rdx ; 0x100d0b450
0x10071c67e: mov qword ptr [rip + 0x55b5db], rcx ; 0x100c77c60
0x10071c685: mov qword ptr [rip + 0x5eedd0], 0x58 ; 0x100d0b460
0x10071c690: mov qword ptr [rip + 0x5eedd1], rbx ; 0x100d0b468
0x10071c697: mov qword ptr [rip + 0x5eedd2], rax ; 0x100d0b470
0x10071c69e: mov qword ptr [rip + 0x5eedcf], 0xffffffffffffffff ; 0x100d0b478
0x10071c6a9: mov qword ptr [rip + 0x5eedd0], r14 ; 0x100d0b480
0x10071c6b0: mov qword ptr [rip + 0x5eedcd], 0 ; 0x100d0b488
0x10071c6bb: vpunpcklqdq xmm0, xmm1, xmmword ptr [rbp - 0x40]
0x10071c6c0: vmovdqa xmmword ptr [rbp - 0x70], xmm0
0x10071c6c5: vmovdqa xmmword ptr [rip + 0x191ed63], xmm0 ; 0x10203b430
0x10071c6cd: lea rax, [rip + 0x191ed5c] ; 0x10203b430
0x10071c6d4: mov qword ptr [rip + 0x191ed61], 0 ; 0x10203b440
0x10071c6df: mov qword ptr [rip + 0x5eed62], rax ; 0x100d0b448
0x10071c6e6: lea rax, [rip + 0x4800ee] ; 0x100b9c7db OnFloatOperator
0x10071c6ed: mov qword ptr [rip + 0x191ed5c], rax ; 0x10203b450
0x10071c6f4: lea rdx, [rip + 0x191ed4d] ; 0x10203b448
0x10071c6fb: mov rcx, qword ptr [rip + 0x553856] ; 0x100c6ff58
0x10071c702: mov qword ptr [rip + 0x191ed57], rcx ; 0x10203b460
0x10071c709: mov qword ptr [rip + 0x553848], rdx ; 0x100c6ff58
0x10071c710: mov qword ptr [rip + 0x191ed59], rdx ; 0x10203b470
0x10071c717: mov rcx, qword ptr [rip + 0x4f0502] ; 0x100c0cc20
0x10071c71e: add rcx, 0x10
0x10071c722: mov qword ptr [rip + 0x191ed1f], rcx ; 0x10203b448
0x10071c729: vmovq xmm0, rax
0x10071c72e: lea rax, [rip + 0x440f09] ; 0x100b5d63e Enum_Type
0x10071c735: vmovq xmm1, rax
0x10071c73a: vmovdqa xmmword ptr [rbp - 0xb0], xmm1
0x10071c742: vpunpcklqdq xmm0, xmm1, xmm0
0x10071c746: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x10071c74b: vmovdqa xmmword ptr [rip + 0x191ed2d], xmm0 ; 0x10203b480
0x10071c753: lea rax, [rip + 0x191ed26] ; 0x10203b480
0x10071c75a: mov qword ptr [rip + 0x191ed2b], 0 ; 0x10203b490
0x10071c765: mov qword ptr [rip + 0x191ecec], rax ; 0x10203b458
0x10071c76c: lea rax, [rip + 0x480078] ; 0x100b9c7eb kOnFloatOperator_GreaterThan
0x10071c773: mov qword ptr [rip + 0x191ed1e], rax ; 0x10203b498
0x10071c77a: lea r12, [rip + 0x191ed17] ; 0x10203b498
0x10071c781: mov qword ptr [rip + 0x191ed14], 0 ; 0x10203b4a0
0x10071c78c: mov rax, qword ptr [rip + 0x5f694d] ; 0x100d130e0
0x10071c793: mov qword ptr [rip + 0x191ed0e], rax ; 0x10203b4a8
0x10071c79a: mov qword ptr [rip + 0x5f693f], r12 ; 0x100d130e0
0x10071c7a1: mov edi, 4
0x10071c7a6: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10071c7ab: mov dword ptr [rax], 0
0x10071c7b1: mov qword ptr [rip + 0x191ed00], rax ; 0x10203b4b8
0x10071c7b8: mov rax, qword ptr [rip + 0x4ea4a9] ; 0x100c06c68 -> 0x10003a800 __Z17GetMetaTypeByTypeI15OnFloatOperatorERK8MetaTypev
0x10071c7bf: mov qword ptr [rip + 0x191ecfa], rax ; 0x10203b4c0
0x10071c7c6: mov rbx, rax
0x10071c7c9: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10071c7ce: vmovaps xmmword ptr [rip + 0x191ecfa], xmm0 ; 0x10203b4d0
0x10071c7d6: lea rax, [rip + 0x191ecf3] ; 0x10203b4d0
0x10071c7dd: mov qword ptr [rip + 0x191ecf8], 0 ; 0x10203b4e0
0x10071c7e8: mov qword ptr [rip + 0x191ecb1], rax ; 0x10203b4a0
0x10071c7ef: lea rax, [rip + 0x480012] ; 0x100b9c808 kOnFloatOperator_GreaterThanEqualTo
0x10071c7f6: mov qword ptr [rip + 0x191eceb], rax ; 0x10203b4e8
0x10071c7fd: lea r13, [rip + 0x191ece4] ; 0x10203b4e8
0x10071c804: mov qword ptr [rip + 0x191ece1], 0 ; 0x10203b4f0
0x10071c80f: mov qword ptr [rip + 0x191ece2], r12 ; 0x10203b4f8
0x10071c816: mov qword ptr [rip + 0x5f68c3], r13 ; 0x100d130e0
0x10071c81d: mov edi, 4
0x10071c822: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10071c827: mov dword ptr [rax], 1
0x10071c82d: mov qword ptr [rip + 0x191ecd4], rax ; 0x10203b508
0x10071c834: mov qword ptr [rip + 0x191ecd5], rbx ; 0x10203b510
0x10071c83b: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10071c840: vmovaps xmmword ptr [rip + 0x191ecd8], xmm0 ; 0x10203b520
0x10071c848: lea rax, [rip + 0x191ecd1] ; 0x10203b520
0x10071c84f: mov qword ptr [rip + 0x191ecd6], 0 ; 0x10203b530
0x10071c85a: mov qword ptr [rip + 0x191ec8f], rax ; 0x10203b4f0
0x10071c861: lea rax, [rip + 0x47ffc4] ; 0x100b9c82c kOnFloatOperator_LessThan
0x10071c868: mov qword ptr [rip + 0x191ecc9], rax ; 0x10203b538
0x10071c86f: lea r12, [rip + 0x191ecc2] ; 0x10203b538
0x10071c876: mov qword ptr [rip + 0x191ecbf], 0 ; 0x10203b540
0x10071c881: mov qword ptr [rip + 0x191ecc0], r13 ; 0x10203b548
0x10071c888: mov qword ptr [rip + 0x5f6851], r12 ; 0x100d130e0
0x10071c88f: mov edi, 4
0x10071c894: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10071c899: mov dword ptr [rax], 2
0x10071c89f: mov qword ptr [rip + 0x191ecb2], rax ; 0x10203b558
0x10071c8a6: mov qword ptr [rip + 0x191ecb3], rbx ; 0x10203b560
0x10071c8ad: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10071c8b2: vmovaps xmmword ptr [rip + 0x191ecb6], xmm0 ; 0x10203b570
0x10071c8ba: lea rax, [rip + 0x191ecaf] ; 0x10203b570
0x10071c8c1: mov qword ptr [rip + 0x191ecb4], 0 ; 0x10203b580
0x10071c8cc: mov qword ptr [rip + 0x191ec6d], rax ; 0x10203b540
0x10071c8d3: lea rax, [rip + 0x47ff6c] ; 0x100b9c846 kOnFloatOperator_LessThanEqualTo
0x10071c8da: mov qword ptr [rip + 0x191eca7], rax ; 0x10203b588
0x10071c8e1: lea r15, [rip + 0x191eca0] ; 0x10203b588
0x10071c8e8: mov qword ptr [rip + 0x191ec9d], 0 ; 0x10203b590
0x10071c8f3: mov qword ptr [rip + 0x191ec9e], r12 ; 0x10203b598
0x10071c8fa: mov qword ptr [rip + 0x5f67df], r15 ; 0x100d130e0
0x10071c901: mov edi, 4
0x10071c906: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10071c90b: mov dword ptr [rax], 3
0x10071c911: mov qword ptr [rip + 0x191ec90], rax ; 0x10203b5a8
0x10071c918: mov qword ptr [rip + 0x191ec91], rbx ; 0x10203b5b0
0x10071c91f: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10071c924: vmovaps xmmword ptr [rip + 0x191ec94], xmm0 ; 0x10203b5c0
0x10071c92c: lea rax, [rip + 0x191ec8d] ; 0x10203b5c0
0x10071c933: mov qword ptr [rip + 0x191ec92], 0 ; 0x10203b5d0
0x10071c93e: mov qword ptr [rip + 0x191ec4b], rax ; 0x10203b590
0x10071c945: lea rax, [rip + 0x47ff1b] ; 0x100b9c867 kOnFloatOperator_Equal
0x10071c94c: mov qword ptr [rip + 0x191ec85], rax ; 0x10203b5d8
0x10071c953: lea r13, [rip + 0x191ec7e] ; 0x10203b5d8
0x10071c95a: mov qword ptr [rip + 0x191ec7b], 0 ; 0x10203b5e0
0x10071c965: mov qword ptr [rip + 0x191ec7c], r15 ; 0x10203b5e8
0x10071c96c: mov qword ptr [rip + 0x5f676d], r13 ; 0x100d130e0
0x10071c973: mov edi, 4
0x10071c978: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10071c97d: mov dword ptr [rax], 4
0x10071c983: mov qword ptr [rip + 0x191ec6e], rax ; 0x10203b5f8
0x10071c98a: mov qword ptr [rip + 0x191ec6f], rbx ; 0x10203b600
0x10071c991: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10071c996: vmovaps xmmword ptr [rip + 0x191ec72], xmm0 ; 0x10203b610
0x10071c99e: lea rax, [rip + 0x191ec6b] ; 0x10203b610
0x10071c9a5: mov qword ptr [rip + 0x191ec70], 0 ; 0x10203b620
0x10071c9b0: mov qword ptr [rip + 0x191ec29], rax ; 0x10203b5e0
0x10071c9b7: lea rax, [rip + 0x47fec0] ; 0x100b9c87e OnFloatBooleanOperator
0x10071c9be: mov qword ptr [rip + 0x191ec6b], rax ; 0x10203b630
0x10071c9c5: lea r12, [rip + 0x191ec5c] ; 0x10203b628
0x10071c9cc: lea rcx, [rip + 0x191ea75] ; 0x10203b448
0x10071c9d3: mov qword ptr [rip + 0x191ec66], rcx ; 0x10203b640
0x10071c9da: mov qword ptr [rip + 0x553577], r12 ; 0x100c6ff58
0x10071c9e1: mov qword ptr [rip + 0x191ec68], r12 ; 0x10203b650
0x10071c9e8: mov rcx, qword ptr [rip + 0x4f02d9] ; 0x100c0ccc8
0x10071c9ef: add rcx, 0x10
0x10071c9f3: mov qword ptr [rip + 0x191ec2e], rcx ; 0x10203b628
0x10071c9fa: vmovq xmm0, rax
0x10071c9ff: vmovdqa xmm1, xmmword ptr [rbp - 0xb0]
0x10071ca07: vpunpcklqdq xmm0, xmm1, xmm0
0x10071ca0b: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x10071ca10: vmovdqa xmmword ptr [rip + 0x191ec48], xmm0 ; 0x10203b660
0x10071ca18: lea rax, [rip + 0x191ec41] ; 0x10203b660
0x10071ca1f: mov qword ptr [rip + 0x191ec46], 0 ; 0x10203b670
0x10071ca2a: mov qword ptr [rip + 0x191ec07], rax ; 0x10203b638
0x10071ca31: lea rax, [rip + 0x47fe5d] ; 0x100b9c895 kOnFloatBooleanOperator_None
0x10071ca38: mov qword ptr [rip + 0x191ec39], rax ; 0x10203b678
0x10071ca3f: lea r15, [rip + 0x191ec32] ; 0x10203b678
0x10071ca46: mov qword ptr [rip + 0x191ec2f], 0 ; 0x10203b680
0x10071ca51: mov qword ptr [rip + 0x191ec30], r13 ; 0x10203b688
0x10071ca58: mov qword ptr [rip + 0x5f6681], r15 ; 0x100d130e0
0x10071ca5f: mov edi, 4
0x10071ca64: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10071ca69: mov dword ptr [rax], 0
0x10071ca6f: mov qword ptr [rip + 0x191ec22], rax ; 0x10203b698
0x10071ca76: mov r13, qword ptr [rip + 0x4ea29b] ; 0x100c06d18 -> 0x100719c50 __Z17GetMetaTypeByTypeI22OnFloatBooleanOperatorERK8MetaTypev
0x10071ca7d: mov qword ptr [rip + 0x191ec1c], r13 ; 0x10203b6a0
0x10071ca84: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10071ca89: vmovaps xmmword ptr [rip + 0x191ec1f], xmm0 ; 0x10203b6b0
0x10071ca91: lea rax, [rip + 0x191ec18] ; 0x10203b6b0
0x10071ca98: mov qword ptr [rip + 0x191ec1d], 0 ; 0x10203b6c0
0x10071caa3: mov qword ptr [rip + 0x191ebd6], rax ; 0x10203b680
0x10071caaa: lea rax, [rip + 0x47fe01] ; 0x100b9c8b2 kOnFloatBooleanOperator_And
0x10071cab1: mov qword ptr [rip + 0x191ec10], rax ; 0x10203b6c8
0x10071cab8: lea rbx, [rip + 0x191ec09] ; 0x10203b6c8
0x10071cabf: mov qword ptr [rip + 0x191ec06], 0 ; 0x10203b6d0
0x10071caca: mov qword ptr [rip + 0x191ec07], r15 ; 0x10203b6d8
0x10071cad1: mov qword ptr [rip + 0x5f6608], rbx ; 0x100d130e0
0x10071cad8: mov edi, 4
0x10071cadd: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10071cae2: mov dword ptr [rax], 1
0x10071cae8: mov qword ptr [rip + 0x191ebf9], rax ; 0x10203b6e8
0x10071caef: mov qword ptr [rip + 0x191ebfa], r13 ; 0x10203b6f0
0x10071caf6: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10071cafb: vmovaps xmmword ptr [rip + 0x191ebfd], xmm0 ; 0x10203b700
0x10071cb03: lea rax, [rip + 0x191ebf6] ; 0x10203b700
0x10071cb0a: mov qword ptr [rip + 0x191ebfb], 0 ; 0x10203b710
0x10071cb15: mov qword ptr [rip + 0x191ebb4], rax ; 0x10203b6d0
0x10071cb1c: lea rax, [rip + 0x47fdab] ; 0x100b9c8ce kOnFloatBooleanOperator_Or
0x10071cb23: mov qword ptr [rip + 0x191ebee], rax ; 0x10203b718
0x10071cb2a: lea rax, [rip + 0x191ebe7] ; 0x10203b718
0x10071cb31: mov qword ptr [rip + 0x191ebe4], 0 ; 0x10203b720
0x10071cb3c: mov qword ptr [rip + 0x191ebe5], rbx ; 0x10203b728
0x10071cb43: mov qword ptr [rip + 0x5f6596], rax ; 0x100d130e0
0x10071cb4a: mov edi, 4
0x10071cb4f: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10071cb54: mov dword ptr [rax], 2
0x10071cb5a: mov qword ptr [rip + 0x191ebd7], rax ; 0x10203b738
0x10071cb61: mov qword ptr [rip + 0x191ebd8], r13 ; 0x10203b740
0x10071cb68: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10071cb6d: vmovaps xmmword ptr [rip + 0x191ebdb], xmm0 ; 0x10203b750
0x10071cb75: lea rax, [rip + 0x191ebd4] ; 0x10203b750
0x10071cb7c: mov qword ptr [rip + 0x191ebd9], 0 ; 0x10203b760
0x10071cb87: mov qword ptr [rip + 0x191eb92], rax ; 0x10203b720
0x10071cb8e: lea rax, [rip + 0x47fd54] ; 0x100b9c8e9 OnFloat
0x10071cb95: mov qword ptr [rip + 0x191ebd4], rax ; 0x10203b770
0x10071cb9c: lea rax, [rip + 0x191ebc5] ; 0x10203b768
0x10071cba3: mov qword ptr [rip + 0x191ebca], 0 ; 0x10203b778
0x10071cbae: mov qword ptr [rip + 0x191ebcb], r12 ; 0x10203b780
0x10071cbb5: mov qword ptr [rip + 0x55339c], rax ; 0x100c6ff58
0x10071cbbc: mov qword ptr [rip + 0x191ebcd], rax ; 0x10203b790
0x10071cbc3: mov rax, qword ptr [rip + 0x4eba1e] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x10071cbca: mov qword ptr [rip + 0x191ebc7], rax ; 0x10203b798
0x10071cbd1: mov qword ptr [rip + 0x191ebc4], 0xffffffffffffffff ; 0x10203b7a0
0x10071cbdc: mov qword ptr [rip + 0x191ebd9], 0 ; 0x10203b7c0
0x10071cbe7: mov rax, qword ptr [rip + 0x4efa32] ; 0x100c0c620
0x10071cbee: add rax, 0x10
0x10071cbf2: mov qword ptr [rip + 0x191eb6f], rax ; 0x10203b768
0x10071cbf9: xor eax, eax
0x10071cbfb: call 0x100011c10 ; 0x100011c10
0x10071cc00: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10071cc05: vmovaps xmmword ptr [rip + 0x191ebc3], xmm0 ; 0x10203b7d0
0x10071cc0d: lea rax, [rip + 0x191ebbc] ; 0x10203b7d0
0x10071cc14: mov rcx, qword ptr [rip + 0x191eb5d] ; 0x10203b778
0x10071cc1b: mov qword ptr [rip + 0x191ebbe], rcx ; 0x10203b7e0
0x10071cc22: mov qword ptr [rip + 0x191eb4f], rax ; 0x10203b778
0x10071cc29: lea rax, [rip + 0x47fcc1] ; 0x100b9c8f1 notConditionOneOnFloat
0x10071cc30: mov qword ptr [rip + 0x5ee859], rax ; 0x100d0b490
0x10071cc37: lea rcx, [rip + 0x5ee852] ; 0x100d0b490
0x10071cc3e: mov rax, qword ptr [rip + 0x55b01b] ; 0x100c77c60
0x10071cc45: mov qword ptr [rip + 0x5ee854], rax ; 0x100d0b4a0
0x10071cc4c: mov qword ptr [rip + 0x5ee859], 0x98 ; 0x100d0b4b0
0x10071cc57: mov rsi, qword ptr [rip + 0x4ea8fa] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10071cc5e: mov qword ptr [rip + 0x5ee853], rsi ; 0x100d0b4b8
0x10071cc65: mov rax, qword ptr [rip + 0x4ebb24] ; 0x100c08790 -> 0x10071a130 __Z18GetMetaClassByTypeIP7OnFloatERK9MetaClassv
0x10071cc6c: mov qword ptr [rip + 0x5ee84d], rax ; 0x100d0b4c0
0x10071cc73: mov qword ptr [rip + 0x5ee84a], 0xffffffffffffffff ; 0x100d0b4c8
0x10071cc7e: mov qword ptr [rip + 0x5ee84b], r14 ; 0x100d0b4d0
0x10071cc85: mov qword ptr [rip + 0x5ee848], 0 ; 0x100d0b4d8
0x10071cc90: lea rdx, [rip + 0x47fc71] ; 0x100b9c908 Condition_One
0x10071cc97: vmovq xmm0, rdx
0x10071cc9c: lea rdx, [rip + 0x4478ec] ; 0x100b6458f Tool_Category
0x10071cca3: vmovq xmm1, rdx
0x10071cca8: vpunpcklqdq xmm0, xmm1, xmm0
0x10071ccac: lea rdx, [rip + 0x191eb3d] ; 0x10203b7f0
0x10071ccb3: mov qword ptr [rip + 0x5ee7de], rdx ; 0x100d0b498
0x10071ccba: lea rdx, [rip + 0x47fc55] ; 0x100b9c916 conditionOneValue
0x10071ccc1: mov qword ptr [rip + 0x5ee818], rdx ; 0x100d0b4e0
0x10071ccc8: lea rdx, [rip + 0x5ee811] ; 0x100d0b4e0
0x10071cccf: mov qword ptr [rip + 0x5ee81a], rcx ; 0x100d0b4f0
0x10071ccd6: mov qword ptr [rip + 0x5ee81f], 0x78 ; 0x100d0b500
0x10071cce1: mov rbx, qword ptr [rip + 0x4ea878] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x10071cce8: mov r8, rbx
0x10071cceb: mov qword ptr [rip + 0x5ee816], r8 ; 0x100d0b508
0x10071ccf2: mov qword ptr [rip + 0x5ee817], rax ; 0x100d0b510
0x10071ccf9: mov qword ptr [rip + 0x5ee814], 0xffffffffffffffff ; 0x100d0b518
0x10071cd04: mov qword ptr [rip + 0x5ee815], r14 ; 0x100d0b520
0x10071cd0b: mov qword ptr [rip + 0x5ee812], 0 ; 0x100d0b528
0x10071cd16: lea rcx, [rip + 0x191eaf3] ; 0x10203b810
0x10071cd1d: mov qword ptr [rip + 0x5ee7c4], rcx ; 0x100d0b4e8
0x10071cd24: lea rcx, [rip + 0x47fbfd] ; 0x100b9c928 conditionOneFloat
0x10071cd2b: mov qword ptr [rip + 0x5ee7fe], rcx ; 0x100d0b530
0x10071cd32: lea rcx, [rip + 0x5ee7f7] ; 0x100d0b530
0x10071cd39: mov qword ptr [rip + 0x5ee800], rdx ; 0x100d0b540
0x10071cd40: mov qword ptr [rip + 0x5ee805], 0x80 ; 0x100d0b550
0x10071cd4b: mov rdi, qword ptr [rip + 0x4ea586] ; 0x100c072d8 -> 0x10003bf40 __Z17GetMetaTypeByTypeIP5FloatERK8MetaTypev
0x10071cd52: mov qword ptr [rip + 0x5ee7ff], rdi ; 0x100d0b558
0x10071cd59: mov qword ptr [rip + 0x5ee800], rax ; 0x100d0b560
0x10071cd60: mov qword ptr [rip + 0x5ee7fd], 0xffffffffffffffff ; 0x100d0b568
0x10071cd6b: mov qword ptr [rip + 0x5ee7fe], r14 ; 0x100d0b570
0x10071cd72: mov qword ptr [rip + 0x5ee7fb], 0 ; 0x100d0b578
0x10071cd7d: lea rdx, [rip + 0x191eaac] ; 0x10203b830
0x10071cd84: vmovaps xmm2, xmmword ptr [rbp - 0xc0]
0x10071cd8c: vmovaps xmmword ptr [rip + 0x191eabc], xmm2 ; 0x10203b850
0x10071cd94: mov qword ptr [rip + 0x191eac5], rdx ; 0x10203b860
0x10071cd9b: lea rdx, [rip + 0x191eaae] ; 0x10203b850
0x10071cda2: vmovdqa xmmword ptr [rip + 0x191eac6], xmm0 ; 0x10203b870
0x10071cdaa: mov qword ptr [rip + 0x191eacf], rdx ; 0x10203b880
0x10071cdb1: lea rdx, [rip + 0x191eab8] ; 0x10203b870
0x10071cdb8: mov qword ptr [rip + 0x5ee779], rdx ; 0x100d0b538
0x10071cdbf: lea rdx, [rip + 0x47fb74] ; 0x100b9c93a conditionOneOnFloat
0x10071cdc6: mov qword ptr [rip + 0x5ee7b3], rdx ; 0x100d0b580
0x10071cdcd: mov qword ptr [rip + 0x5ee7bc], rcx ; 0x100d0b590
0x10071cdd4: mov qword ptr [rip + 0x5ee7c1], 0x90 ; 0x100d0b5a0
0x10071cddf: mov rcx, qword ptr [rip + 0x4ea58a] ; 0x100c07370 -> 0x10071a7d0 __Z17GetMetaTypeByTypeIP7OnFloatERK8MetaTypev
0x10071cde6: mov qword ptr [rip + 0x5ee7bb], rcx ; 0x100d0b5a8
0x10071cded: mov qword ptr [rip + 0x5ee7bc], rax ; 0x100d0b5b0
0x10071cdf4: mov qword ptr [rip + 0x5ee7b9], 0xffffffffffffffff ; 0x100d0b5b8
0x10071cdff: mov qword ptr [rip + 0x5ee7ba], r14 ; 0x100d0b5c0
0x10071ce06: mov qword ptr [rip + 0x5ee7b7], 0 ; 0x100d0b5c8
0x10071ce11: lea rdx, [rip + 0x191ea78] ; 0x10203b890
0x10071ce18: vmovaps xmmword ptr [rip + 0x191ea90], xmm2 ; 0x10203b8b0
0x10071ce20: vmovaps xmm5, xmm2
0x10071ce24: mov qword ptr [rip + 0x191ea95], rdx ; 0x10203b8c0
0x10071ce2b: lea rdx, [rip + 0x191ea7e] ; 0x10203b8b0
0x10071ce32: vmovdqa xmmword ptr [rip + 0x191ea96], xmm0 ; 0x10203b8d0
0x10071ce3a: mov qword ptr [rip + 0x191ea9f], rdx ; 0x10203b8e0
0x10071ce41: lea rdx, [rip + 0x191ea88] ; 0x10203b8d0
0x10071ce48: mov qword ptr [rip + 0x5ee739], rdx ; 0x100d0b588
0x10071ce4f: lea rdx, [rip + 0x47faf8] ; 0x100b9c94e conditionOneOperator
0x10071ce56: mov qword ptr [rip + 0x5ee773], rdx ; 0x100d0b5d0
0x10071ce5d: lea rdx, [rip + 0x5ee71c] ; 0x100d0b580
0x10071ce64: mov qword ptr [rip + 0x5ee775], rdx ; 0x100d0b5e0
0x10071ce6b: mov qword ptr [rip + 0x5ee77a], 0x88 ; 0x100d0b5f0
0x10071ce76: mov rbx, qword ptr [rip + 0x4e9deb] ; 0x100c06c68 -> 0x10003a800 __Z17GetMetaTypeByTypeI15OnFloatOperatorERK8MetaTypev
0x10071ce7d: mov qword ptr [rip + 0x5ee774], rbx ; 0x100d0b5f8
0x10071ce84: mov qword ptr [rip + 0x5ee775], rax ; 0x100d0b600
0x10071ce8b: mov qword ptr [rip + 0x5ee772], 0xffffffffffffffff ; 0x100d0b608
0x10071ce96: mov qword ptr [rip + 0x5ee773], r14 ; 0x100d0b610
0x10071ce9d: mov qword ptr [rip + 0x5ee770], 0 ; 0x100d0b618
0x10071cea8: lea rdx, [rip + 0x191ea41] ; 0x10203b8f0
0x10071ceaf: mov qword ptr [rip + 0x5ee722], rdx ; 0x100d0b5d8
0x10071ceb6: lea rdx, [rip + 0x47faa6] ; 0x100b9c963 notConditionTwoOnFloat
0x10071cebd: mov qword ptr [rip + 0x5ee75c], rdx ; 0x100d0b620
0x10071cec4: lea rdx, [rip + 0x5ee705] ; 0x100d0b5d0
0x10071cecb: mov qword ptr [rip + 0x5ee75e], rdx ; 0x100d0b630
0x10071ced2: mov qword ptr [rip + 0x5ee763], 0xb8 ; 0x100d0b640
0x10071cedd: mov qword ptr [rip + 0x5ee764], rsi ; 0x100d0b648
0x10071cee4: mov qword ptr [rip + 0x5ee765], rax ; 0x100d0b650
0x10071ceeb: mov qword ptr [rip + 0x5ee762], 0xffffffffffffffff ; 0x100d0b658
0x10071cef6: mov qword ptr [rip + 0x5ee763], r14 ; 0x100d0b660
0x10071cefd: mov qword ptr [rip + 0x5ee760], 0 ; 0x100d0b668
0x10071cf08: lea rdx, [rip + 0x47fa6b] ; 0x100b9c97a Condition_Two_OPTIONAL
0x10071cf0f: vmovq xmm2, rdx
0x10071cf14: lea rdx, [rip + 0x191e9f5] ; 0x10203b910
0x10071cf1b: mov qword ptr [rip + 0x5ee706], rdx ; 0x100d0b628
0x10071cf22: lea rdx, [rip + 0x47fa68] ; 0x100b9c991 conditionTwoValue
0x10071cf29: mov qword ptr [rip + 0x5ee740], rdx ; 0x100d0b670
0x10071cf30: lea rdx, [rip + 0x5ee6e9] ; 0x100d0b620
0x10071cf37: mov qword ptr [rip + 0x5ee742], rdx ; 0x100d0b680
0x10071cf3e: vpunpcklqdq xmm2, xmm1, xmm2
0x10071cf42: mov qword ptr [rip + 0x5ee743], 0x9c ; 0x100d0b690
0x10071cf4d: mov qword ptr [rip + 0x5ee744], r8 ; 0x100d0b698
0x10071cf54: mov qword ptr [rip + 0x5ee745], rax ; 0x100d0b6a0
0x10071cf5b: mov qword ptr [rip + 0x5ee742], 0xffffffffffffffff ; 0x100d0b6a8
0x10071cf66: mov qword ptr [rip + 0x5ee743], r14 ; 0x100d0b6b0
0x10071cf6d: mov qword ptr [rip + 0x5ee740], 0 ; 0x100d0b6b8
0x10071cf78: lea rdx, [rip + 0x191e9b1] ; 0x10203b930
0x10071cf7f: mov qword ptr [rip + 0x5ee6f2], rdx ; 0x100d0b678
0x10071cf86: lea rdx, [rip + 0x47fa16] ; 0x100b9c9a3 conditionTwoFloat
0x10071cf8d: mov qword ptr [rip + 0x5ee72c], rdx ; 0x100d0b6c0
0x10071cf94: lea rdx, [rip + 0x5ee6d5] ; 0x100d0b670
0x10071cf9b: mov qword ptr [rip + 0x5ee72e], rdx ; 0x100d0b6d0
0x10071cfa2: mov qword ptr [rip + 0x5ee733], 0xa0 ; 0x100d0b6e0
0x10071cfad: mov qword ptr [rip + 0x5ee734], rdi ; 0x100d0b6e8
0x10071cfb4: mov qword ptr [rip + 0x5ee735], rax ; 0x100d0b6f0
0x10071cfbb: mov qword ptr [rip + 0x5ee732], 0xffffffffffffffff ; 0x100d0b6f8
0x10071cfc6: mov qword ptr [rip + 0x5ee733], r14 ; 0x100d0b700
0x10071cfcd: mov qword ptr [rip + 0x5ee730], 0 ; 0x100d0b708
0x10071cfd8: lea rdx, [rip + 0x191e971] ; 0x10203b950
0x10071cfdf: vmovaps xmmword ptr [rip + 0x191e989], xmm5 ; 0x10203b970
0x10071cfe7: mov qword ptr [rip + 0x191e992], rdx ; 0x10203b980
0x10071cfee: lea rdx, [rip + 0x191e97b] ; 0x10203b970
0x10071cff5: vmovdqa xmmword ptr [rip + 0x191e993], xmm2 ; 0x10203b990
0x10071cffd: mov qword ptr [rip + 0x191e99c], rdx ; 0x10203b9a0
0x10071d004: lea rdx, [rip + 0x191e985] ; 0x10203b990
0x10071d00b: mov qword ptr [rip + 0x5ee6b6], rdx ; 0x100d0b6c8
0x10071d012: lea rdx, [rip + 0x47f99c] ; 0x100b9c9b5 conditionTwoOnFloat
0x10071d019: mov qword ptr [rip + 0x5ee6f0], rdx ; 0x100d0b710
0x10071d020: lea rdx, [rip + 0x5ee699] ; 0x100d0b6c0
0x10071d027: mov qword ptr [rip + 0x5ee6f2], rdx ; 0x100d0b720
0x10071d02e: mov qword ptr [rip + 0x5ee6f7], 0xb0 ; 0x100d0b730
0x10071d039: mov qword ptr [rip + 0x5ee6f8], rcx ; 0x100d0b738
0x10071d040: mov qword ptr [rip + 0x5ee6f9], rax ; 0x100d0b740
0x10071d047: mov qword ptr [rip + 0x5ee6f6], 0xffffffffffffffff ; 0x100d0b748
0x10071d052: mov qword ptr [rip + 0x5ee6f7], r14 ; 0x100d0b750
0x10071d059: mov qword ptr [rip + 0x5ee6f4], 0 ; 0x100d0b758
0x10071d064: lea rcx, [rip + 0x191e945] ; 0x10203b9b0
0x10071d06b: vmovaps xmmword ptr [rip + 0x191e95d], xmm5 ; 0x10203b9d0
0x10071d073: mov qword ptr [rip + 0x191e966], rcx ; 0x10203b9e0
0x10071d07a: lea rcx, [rip + 0x191e94f] ; 0x10203b9d0
0x10071d081: vmovdqa xmmword ptr [rip + 0x191e967], xmm2 ; 0x10203b9f0
0x10071d089: mov qword ptr [rip + 0x191e970], rcx ; 0x10203ba00
0x10071d090: lea rcx, [rip + 0x191e959] ; 0x10203b9f0
0x10071d097: mov qword ptr [rip + 0x5ee67a], rcx ; 0x100d0b718
0x10071d09e: lea rcx, [rip + 0x47f924] ; 0x100b9c9c9 conditionTwoOperator
0x10071d0a5: mov qword ptr [rip + 0x5ee6b4], rcx ; 0x100d0b760
0x10071d0ac: lea rcx, [rip + 0x5ee65d] ; 0x100d0b710
0x10071d0b3: mov qword ptr [rip + 0x5ee6b6], rcx ; 0x100d0b770
0x10071d0ba: mov qword ptr [rip + 0x5ee6bb], 0xa8 ; 0x100d0b780
0x10071d0c5: mov qword ptr [rip + 0x5ee6bc], rbx ; 0x100d0b788
0x10071d0cc: mov qword ptr [rip + 0x5ee6bd], rax ; 0x100d0b790
0x10071d0d3: mov qword ptr [rip + 0x5ee6ba], 0xffffffffffffffff ; 0x100d0b798
0x10071d0de: mov qword ptr [rip + 0x5ee6bb], r14 ; 0x100d0b7a0
0x10071d0e5: mov qword ptr [rip + 0x5ee6b8], 0 ; 0x100d0b7a8
0x10071d0f0: lea rcx, [rip + 0x191e919] ; 0x10203ba10
0x10071d0f7: mov qword ptr [rip + 0x5ee66a], rcx ; 0x100d0b768
0x10071d0fe: lea rcx, [rip + 0x47f8d9] ; 0x100b9c9de booleanOperator
0x10071d105: mov qword ptr [rip + 0x5ee6a4], rcx ; 0x100d0b7b0
0x10071d10c: lea rcx, [rip + 0x5ee64d] ; 0x100d0b760
0x10071d113: mov qword ptr [rip + 0x5ee6a6], rcx ; 0x100d0b7c0
0x10071d11a: mov qword ptr [rip + 0x5ee6ab], 0xbc ; 0x100d0b7d0
0x10071d125: mov qword ptr [rip + 0x5ee6ac], r13 ; 0x100d0b7d8
0x10071d12c: mov qword ptr [rip + 0x5ee6ad], rax ; 0x100d0b7e0
0x10071d133: mov qword ptr [rip + 0x5ee6aa], 0xffffffffffffffff ; 0x100d0b7e8
0x10071d13e: mov qword ptr [rip + 0x5ee6ab], r14 ; 0x100d0b7f0
0x10071d145: mov qword ptr [rip + 0x5ee6a8], 0 ; 0x100d0b7f8
0x10071d150: lea rcx, [rip + 0x47f73e] ; 0x100b9c895 kOnFloatBooleanOperator_None
0x10071d157: vmovq xmm3, rcx
0x10071d15c: lea rcx, [rip + 0x191e8cd] ; 0x10203ba30
0x10071d163: mov qword ptr [rip + 0x5ee64e], rcx ; 0x100d0b7b8
0x10071d16a: lea rcx, [rip + 0x440be8] ; 0x100b5dd59 value
0x10071d171: mov qword ptr [rip + 0x5ee688], rcx ; 0x100d0b800
0x10071d178: lea rcx, [rip + 0x5ee631] ; 0x100d0b7b0
0x10071d17f: mov qword ptr [rip + 0x5ee67e], 0 ; 0x100d0b808
0x10071d18a: mov qword ptr [rip + 0x5ee67f], rcx ; 0x100d0b810
0x10071d191: mov qword ptr [rip + 0x5ee684], 0x38 ; 0x100d0b820
0x10071d19c: mov qword ptr [rip + 0x5ee685], rdi ; 0x100d0b828
0x10071d1a3: lea rcx, [rip + 0x47f844] ; 0x100b9c9ee debug
0x10071d1aa: mov qword ptr [rip + 0x5ee69f], rcx ; 0x100d0b850
0x10071d1b1: lea rcx, [rip + 0x5ee648] ; 0x100d0b800
0x10071d1b8: mov qword ptr [rip + 0x5ee695], 0 ; 0x100d0b858
0x10071d1c3: mov qword ptr [rip + 0x5ee696], rcx ; 0x100d0b860
0x10071d1ca: lea rcx, [rip + 0x47dc7c] ; 0x100b9ae4d debugName
0x10071d1d1: mov qword ptr [rip + 0x5ee6c8], rcx ; 0x100d0b8a0
0x10071d1d8: lea rcx, [rip + 0x5ee671] ; 0x100d0b850
0x10071d1df: mov qword ptr [rip + 0x5ee6be], 0 ; 0x100d0b8a8
0x10071d1ea: mov qword ptr [rip + 0x5ee6bf], rcx ; 0x100d0b8b0
0x10071d1f1: mov qword ptr [rip + 0x5ee6c4], 0x60 ; 0x100d0b8c0
0x10071d1fc: mov rcx, qword ptr [rip + 0x4e9be5] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x10071d203: mov qword ptr [rip + 0x5ee6be], rcx ; 0x100d0b8c8
0x10071d20a: lea rcx, [rip + 0x47f7e3] ; 0x100b9c9f4 endOnTrigger
0x10071d211: mov qword ptr [rip + 0x5ee6d8], rcx ; 0x100d0b8f0
0x10071d218: lea rcx, [rip + 0x5ee681] ; 0x100d0b8a0
0x10071d21f: mov qword ptr [rip + 0x5ee6da], rcx ; 0x100d0b900
0x10071d226: mov qword ptr [rip + 0x5ee6df], 0x40 ; 0x100d0b910
0x10071d231: mov rdx, rsi
0x10071d234: mov qword ptr [rip + 0x5ee6dd], rdx ; 0x100d0b918
0x10071d23b: mov qword ptr [rip + 0x5ee6de], rax ; 0x100d0b920
0x10071d242: mov qword ptr [rip + 0x5ee6db], 0xffffffffffffffff ; 0x100d0b928
0x10071d24d: mov qword ptr [rip + 0x5ee6dc], r14 ; 0x100d0b930
0x10071d254: mov qword ptr [rip + 0x5ee6d9], 0 ; 0x100d0b938
0x10071d25f: lea rcx, [rip + 0x4739c2] ; 0x100b90c28 Events
0x10071d266: vmovaps xmm4, xmmword ptr [rbp - 0x70]
0x10071d26b: vmovaps xmmword ptr [rip + 0x191e7fd], xmm4 ; 0x10203ba70
0x10071d273: vmovq xmm4, rcx
0x10071d278: lea rcx, [rip + 0x191e7d1] ; 0x10203ba50
0x10071d27f: mov qword ptr [rip + 0x191e7fa], rcx ; 0x10203ba80
0x10071d286: lea rcx, [rip + 0x191e7e3] ; 0x10203ba70
0x10071d28d: mov qword ptr [rip + 0x5ee664], rcx ; 0x100d0b8f8
0x10071d294: lea rcx, [rip + 0x4713e5] ; 0x100b8e680 checkOnce
0x10071d29b: mov qword ptr [rip + 0x5ee69e], rcx ; 0x100d0b940
0x10071d2a2: lea rcx, [rip + 0x5ee647] ; 0x100d0b8f0
0x10071d2a9: mov qword ptr [rip + 0x5ee6a0], rcx ; 0x100d0b950
0x10071d2b0: vpunpcklqdq xmm1, xmm1, xmm4
0x10071d2b4: vmovaps xmm4, xmmword ptr [rbp - 0x90]
0x10071d2bc: vmovaps xmmword ptr [rip + 0x191e7ec], xmm4 ; 0x10203bab0
0x10071d2c4: mov qword ptr [rip + 0x5ee5a1], 0x58 ; 0x100d0b870
0x10071d2cf: mov rcx, rdx
0x10071d2d2: mov qword ptr [rip + 0x5ee59f], rcx ; 0x100d0b878
0x10071d2d9: mov qword ptr [rip + 0x5ee67c], 0x41 ; 0x100d0b960
0x10071d2e4: mov qword ptr [rip + 0x5ee67d], rcx ; 0x100d0b968
0x10071d2eb: mov qword ptr [rip + 0x5ee67e], rax ; 0x100d0b970
0x10071d2f2: mov qword ptr [rip + 0x5ee67b], 0xffffffffffffffff ; 0x100d0b978
0x10071d2fd: mov qword ptr [rip + 0x5ee67c], r14 ; 0x100d0b980
0x10071d304: mov qword ptr [rip + 0x5ee679], 0 ; 0x100d0b988
0x10071d30f: lea rcx, [rip + 0x191e77a] ; 0x10203ba90
0x10071d316: mov qword ptr [rip + 0x191e7a3], rcx ; 0x10203bac0
0x10071d31d: lea rcx, [rip + 0x191e78c] ; 0x10203bab0
0x10071d324: mov qword ptr [rip + 0x5ee61d], rcx ; 0x100d0b948
0x10071d32b: lea rcx, [rip + 0x471206] ; 0x100b8e538 trueEvents
0x10071d332: mov qword ptr [rip + 0x5ee657], rcx ; 0x100d0b990
0x10071d339: lea rcx, [rip + 0x5ee600] ; 0x100d0b940
0x10071d340: mov qword ptr [rip + 0x5ee659], rcx ; 0x100d0b9a0
0x10071d347: mov qword ptr [rip + 0x5ee65e], 0x48 ; 0x100d0b9b0
0x10071d352: mov rdx, qword ptr [rip + 0x4e9f6f] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x10071d359: mov qword ptr [rip + 0x5ee658], rdx ; 0x100d0b9b8
0x10071d360: mov qword ptr [rip + 0x5ee659], rax ; 0x100d0b9c0
0x10071d367: mov qword ptr [rip + 0x5ee656], 0xffffffffffffffff ; 0x100d0b9c8
0x10071d372: mov qword ptr [rip + 0x5ee657], r14 ; 0x100d0b9d0
0x10071d379: mov qword ptr [rip + 0x5ee654], 0 ; 0x100d0b9d8
0x10071d384: lea rcx, [rip + 0x191e745] ; 0x10203bad0
0x10071d38b: vmovaps xmmword ptr [rip + 0x191e75d], xmm5 ; 0x10203baf0
0x10071d393: mov qword ptr [rip + 0x191e766], rcx ; 0x10203bb00
0x10071d39a: lea rcx, [rip + 0x191e74f] ; 0x10203baf0
0x10071d3a1: vmovaps xmm4, xmmword ptr [rbp - 0x60]
0x10071d3a6: vmovaps xmmword ptr [rip + 0x191e762], xmm4 ; 0x10203bb10
0x10071d3ae: mov qword ptr [rip + 0x191e76b], rcx ; 0x10203bb20
0x10071d3b5: lea rcx, [rip + 0x191e754] ; 0x10203bb10
0x10071d3bc: vmovdqa xmmword ptr [rip + 0x191e76c], xmm1 ; 0x10203bb30
0x10071d3c4: mov qword ptr [rip + 0x191e775], rcx ; 0x10203bb40
0x10071d3cb: lea rcx, [rip + 0x191e75e] ; 0x10203bb30
0x10071d3d2: mov qword ptr [rip + 0x5ee5bf], rcx ; 0x100d0b998
0x10071d3d9: lea rcx, [rip + 0x471163] ; 0x100b8e543 falseEvents
0x10071d3e0: mov qword ptr [rip + 0x5ee5f9], rcx ; 0x100d0b9e0
0x10071d3e7: lea rcx, [rip + 0x5ee5a2] ; 0x100d0b990
0x10071d3ee: mov qword ptr [rip + 0x5ee5fb], rcx ; 0x100d0b9f0
0x10071d3f5: lea rcx, [rip + 0x5ee5e4] ; 0x100d0b9e0
0x10071d3fc: mov qword ptr [rip + 0x55a85d], rcx ; 0x100c77c60
0x10071d403: mov qword ptr [rip + 0x5ee5f2], 0x50 ; 0x100d0ba00
0x10071d40e: mov qword ptr [rip + 0x5ee5f3], rdx ; 0x100d0ba08
0x10071d415: mov qword ptr [rip + 0x5ee414], rax ; 0x100d0b830
0x10071d41c: mov qword ptr [rip + 0x5ee45d], rax ; 0x100d0b880
0x10071d423: mov qword ptr [rip + 0x5ee4a6], rax ; 0x100d0b8d0
0x10071d42a: mov qword ptr [rip + 0x5ee5df], rax ; 0x100d0ba10
0x10071d431: mov qword ptr [rip + 0x5ee3fc], 0xffffffffffffffff ; 0x100d0b838
0x10071d43c: mov qword ptr [rip + 0x5ee3fd], r14 ; 0x100d0b840
0x10071d443: mov qword ptr [rip + 0x5ee43a], 0xffffffffffffffff ; 0x100d0b888
0x10071d44e: mov qword ptr [rip + 0x5ee43b], r14 ; 0x100d0b890
0x10071d455: mov qword ptr [rip + 0x5ee478], 0xffffffffffffffff ; 0x100d0b8d8
0x10071d460: mov qword ptr [rip + 0x5ee479], r14 ; 0x100d0b8e0
0x10071d467: mov qword ptr [rip + 0x5ee5a6], 0xffffffffffffffff ; 0x100d0ba18
0x10071d472: mov qword ptr [rip + 0x5ee5a7], r14 ; 0x100d0ba20
0x10071d479: mov qword ptr [rip + 0x5ee5a4], 0 ; 0x100d0ba28
0x10071d484: lea rax, [rip + 0x191e6c5] ; 0x10203bb50
0x10071d48b: vmovaps xmmword ptr [rip + 0x191e6dd], xmm5 ; 0x10203bb70
0x10071d493: mov qword ptr [rip + 0x191e6e6], rax ; 0x10203bb80
0x10071d49a: lea rax, [rip + 0x191e6cf] ; 0x10203bb70
0x10071d4a1: vmovaps xmmword ptr [rip + 0x191e6e7], xmm4 ; 0x10203bb90
0x10071d4a9: mov qword ptr [rip + 0x191e6f0], rax ; 0x10203bba0
0x10071d4b0: lea rax, [rip + 0x191e6d9] ; 0x10203bb90
0x10071d4b7: vmovdqa xmmword ptr [rip + 0x191e6f1], xmm1 ; 0x10203bbb0
0x10071d4bf: mov qword ptr [rip + 0x191e6fa], rax ; 0x10203bbc0
0x10071d4c6: lea rax, [rip + 0x191e6e3] ; 0x10203bbb0
0x10071d4cd: mov qword ptr [rip + 0x5ee514], rax ; 0x100d0b9e8
0x10071d4d4: vmovdqa xmmword ptr [rip + 0x191e314], xmm0 ; 0x10203b7f0
0x10071d4dc: mov qword ptr [rip + 0x191e319], 0 ; 0x10203b800
0x10071d4e7: vmovdqa xmmword ptr [rip + 0x191e321], xmm0 ; 0x10203b810
0x10071d4ef: mov qword ptr [rip + 0x191e326], 0 ; 0x10203b820
0x10071d4fa: vmovaps xmm4, xmmword ptr [rbp - 0xa0]
0x10071d502: vmovaps xmmword ptr [rip + 0x191e326], xmm4 ; 0x10203b830
0x10071d50a: mov qword ptr [rip + 0x191e32b], 0 ; 0x10203b840
0x10071d515: vmovaps xmmword ptr [rip + 0x191e373], xmm4 ; 0x10203b890
0x10071d51d: mov qword ptr [rip + 0x191e378], 0 ; 0x10203b8a0
0x10071d528: vmovdqa xmmword ptr [rip + 0x191e3c0], xmm0 ; 0x10203b8f0
0x10071d530: mov qword ptr [rip + 0x191e3c5], 0 ; 0x10203b900
0x10071d53b: vmovdqa xmmword ptr [rip + 0x191e3cd], xmm2 ; 0x10203b910
0x10071d543: mov qword ptr [rip + 0x191e3d2], 0 ; 0x10203b920
0x10071d54e: vmovdqa xmmword ptr [rip + 0x191e3da], xmm2 ; 0x10203b930
0x10071d556: mov qword ptr [rip + 0x191e3df], 0 ; 0x10203b940
0x10071d561: vmovaps xmmword ptr [rip + 0x191e3e7], xmm4 ; 0x10203b950
0x10071d569: mov qword ptr [rip + 0x191e3ec], 0 ; 0x10203b960
0x10071d574: vmovaps xmmword ptr [rip + 0x191e434], xmm4 ; 0x10203b9b0
0x10071d57c: mov qword ptr [rip + 0x191e439], 0 ; 0x10203b9c0
0x10071d587: vmovdqa xmmword ptr [rip + 0x191e481], xmm2 ; 0x10203ba10
0x10071d58f: mov qword ptr [rip + 0x191e486], 0 ; 0x10203ba20
0x10071d59a: vmovdqa xmm0, xmmword ptr [rbp - 0x80]
0x10071d59f: vpunpcklqdq xmm0, xmm0, xmm3
0x10071d5a3: vmovdqa xmmword ptr [rip + 0x191e485], xmm0 ; 0x10203ba30
0x10071d5ab: mov qword ptr [rip + 0x191e48a], 0 ; 0x10203ba40
0x10071d5b6: mov qword ptr [rip + 0x5ee287], 0 ; 0x100d0b848
0x10071d5c1: mov qword ptr [rip + 0x5ee2cc], 0 ; 0x100d0b898
0x10071d5cc: mov qword ptr [rip + 0x5ee311], 0 ; 0x100d0b8e8
0x10071d5d7: vmovdqa xmmword ptr [rip + 0x191e471], xmm1 ; 0x10203ba50
0x10071d5df: mov qword ptr [rip + 0x191e476], 0 ; 0x10203ba60
0x10071d5ea: vmovdqa xmmword ptr [rip + 0x191e49e], xmm1 ; 0x10203ba90
0x10071d5f2: mov qword ptr [rip + 0x191e4a3], 0 ; 0x10203baa0
0x10071d5fd: vmovaps xmmword ptr [rip + 0x191e4cb], xmm4 ; 0x10203bad0
0x10071d605: mov qword ptr [rip + 0x191e4d0], 0 ; 0x10203bae0
0x10071d610: vmovaps xmmword ptr [rip + 0x191e538], xmm4 ; 0x10203bb50
0x10071d618: mov qword ptr [rip + 0x191e53d], 0 ; 0x10203bb60
0x10071d623: add rsp, 0x98
0x10071d62a: pop rbx
0x10071d62b: pop r12
0x10071d62d: pop r13
0x10071d62f: pop r14
0x10071d631: pop r15
0x10071d633: pop rbp
0x10071d634: ret 
0x10071d635: nop 
0x10071d636: nop 
0x10071d637: nop 
0x10071d638: nop 
0x10071d639: nop 
0x10071d63a: nop 
0x10071d63b: nop 
0x10071d63c: nop 
0x10071d63d: nop 
0x10071d63e: nop 
0x10071d63f: nop 
