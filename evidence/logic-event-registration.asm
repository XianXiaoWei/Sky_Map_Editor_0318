0x100332290: push rbp
0x100332291: mov rbp, rsp
0x100332294: push r14
0x100332296: push rbx
0x100332297: lea r14, [rip + 0x84b973] ; 0x100b7dc11 Event
0x10033229e: mov qword ptr [rip + 0x1ac1f43], r14 ; 0x101df41e8
0x1003322a5: lea rax, [rip + 0x1ac1f34] ; 0x101df41e0
0x1003322ac: mov qword ptr [rip + 0x1ac1f39], 0 ; 0x101df41f0
0x1003322b7: mov rcx, qword ptr [rip + 0x93dc9a] ; 0x100c6ff58
0x1003322be: mov qword ptr [rip + 0x1ac1f33], rcx ; 0x101df41f8
0x1003322c5: mov qword ptr [rip + 0x93dc8c], rax ; 0x100c6ff58
0x1003322cc: mov qword ptr [rip + 0x1ac1f35], rax ; 0x101df4208
0x1003322d3: lea rax, [rip - 0x2fca1a] ; 0x1000358c0
0x1003322da: mov qword ptr [rip + 0x1ac1f2f], rax ; 0x101df4210
0x1003322e1: mov qword ptr [rip + 0x1ac1f2c], 0xffffffffffffffff ; 0x101df4218
0x1003322ec: mov qword ptr [rip + 0x1ac1f41], 0 ; 0x101df4238
0x1003322f7: mov rax, qword ptr [rip + 0x8da13a] ; 0x100c0c438
0x1003322fe: add rax, 0x10
0x100332302: mov qword ptr [rip + 0x1ac1ed7], rax ; 0x101df41e0
0x100332309: xor eax, eax
0x10033230b: call 0x100011c10 ; 0x100011c10
0x100332310: lea rax, [rip + 0x844d37] ; 0x100b7704e SetEnabled
0x100332317: mov qword ptr [rip + 0x1ac1f22], rax ; 0x101df4240
0x10033231e: lea rcx, [rip + 0x1ac1f1b] ; 0x101df4240
0x100332325: mov qword ptr [rip + 0x1ac1f18], 0 ; 0x101df4248
0x100332330: mov rax, qword ptr [rip + 0x93dc29] ; 0x100c6ff60
0x100332337: mov qword ptr [rip + 0x1ac1f12], rax ; 0x101df4250
0x10033233e: lea rax, [rip - 0x4085] ; 0x10032e2c0
0x100332345: vmovq xmm0, rax
0x10033234a: vmovdqu xmmword ptr [rip + 0x1ac1f26], xmm0 ; 0x101df4278
0x100332352: mov rax, qword ptr [rip + 0x8d3ecf] ; 0x100c06228 -> 0x10032fd60 __Z12ApplyWrapperI5EventMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x100332359: mov qword ptr [rip + 0x1ac1f28], rax ; 0x101df4288
0x100332360: mov rax, qword ptr [rip + 0x8d7751] ; 0x100c09ab8 -> 0x10032fe00 __Z21InitFunctionSignatureIM5EventFvbEEvP17FunctionSignature
0x100332367: mov qword ptr [rip + 0x1ac1f22], rax ; 0x101df4290
0x10033236e: mov rax, qword ptr [rip + 0x8d6273] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x100332375: mov qword ptr [rip + 0x1ac1f1c], rax ; 0x101df4298
0x10033237c: lea rdx, [rip + 0x840ef0] ; 0x100b73273 GetEnabled
0x100332383: mov qword ptr [rip + 0x1ac1f16], rdx ; 0x101df42a0
0x10033238a: lea rdx, [rip + 0x1ac1f0f] ; 0x101df42a0
0x100332391: mov qword ptr [rip + 0x1ac1f0c], 0 ; 0x101df42a8
0x10033239c: mov qword ptr [rip + 0x1ac1f0d], rcx ; 0x101df42b0
0x1003323a3: lea rcx, [rip - 0x40ca] ; 0x10032e2e0
0x1003323aa: vmovq xmm0, rcx
0x1003323af: vmovdqu xmmword ptr [rip + 0x1ac1f21], xmm0 ; 0x101df42d8
0x1003323b7: mov rcx, qword ptr [rip + 0x8d3e7a] ; 0x100c06238 -> 0x10032fe80 __Z12ApplyWrapperI5EventMS0_KFbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1003323be: mov qword ptr [rip + 0x1ac1f23], rcx ; 0x101df42e8
0x1003323c5: mov rcx, qword ptr [rip + 0x8d76fc] ; 0x100c09ac8 -> 0x10032ff00 __Z21InitFunctionSignatureIM5EventKFbvEEvP17FunctionSignature
0x1003323cc: mov qword ptr [rip + 0x1ac1f1d], rcx ; 0x101df42f0
0x1003323d3: mov qword ptr [rip + 0x1ac1f1e], rax ; 0x101df42f8
0x1003323da: lea rcx, [rip + 0x84eca7] ; 0x100b81088 Start
0x1003323e1: mov qword ptr [rip + 0x1ac1f18], rcx ; 0x101df4300
0x1003323e8: lea rcx, [rip + 0x1ac1f11] ; 0x101df4300
0x1003323ef: mov qword ptr [rip + 0x1ac1f0e], 0 ; 0x101df4308
0x1003323fa: mov qword ptr [rip + 0x1ac1f0f], rdx ; 0x101df4310
0x100332401: mov qword ptr [rip + 0x93db58], rcx ; 0x100c6ff60
0x100332408: lea rcx, [rip - 0x411f] ; 0x10032e2f0
0x10033240f: vmovq xmm0, rcx
0x100332414: vmovdqu xmmword ptr [rip + 0x1ac1f1c], xmm0 ; 0x101df4338
0x10033241c: mov rcx, qword ptr [rip + 0x8d3e0d] ; 0x100c06230 -> 0x10032ff30 __Z12ApplyWrapperI5EventMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x100332423: mov qword ptr [rip + 0x1ac1f1e], rcx ; 0x101df4348
0x10033242a: mov rcx, qword ptr [rip + 0x8d768f] ; 0x100c09ac0 -> 0x10032ff90 __Z21InitFunctionSignatureIM5EventFvvEEvP17FunctionSignature
0x100332431: mov qword ptr [rip + 0x1ac1f18], rcx ; 0x101df4350
0x100332438: mov qword ptr [rip + 0x1ac1f19], rax ; 0x101df4358
0x10033243f: lea rcx, [rip + 0x82dbf6] ; 0x100b6003c Tool_Export
0x100332446: vmovq xmm0, rcx
0x10033244b: lea rcx, [rip + 0x82c58d] ; 0x100b5e9df true
0x100332452: vmovq xmm1, rcx
0x100332457: vpunpcklqdq xmm0, xmm0, xmm1
0x10033245b: vmovdqa xmmword ptr [rip + 0x1ac1efd], xmm0 ; 0x101df4360
0x100332463: lea rcx, [rip + 0x1ac1ef6] ; 0x101df4360
0x10033246a: mov rdx, qword ptr [rip + 0x1ac1d7f] ; 0x101df41f0
0x100332471: mov qword ptr [rip + 0x1ac1ef8], rdx ; 0x101df4370
0x100332478: lea rdx, [rip + 0x84a243] ; 0x100b7c6c2 Tool_ExcludeOnlyMe
0x10033247f: vmovq xmm0, rdx
0x100332484: vpunpcklqdq xmm0, xmm0, xmm1
0x100332488: vmovdqa xmmword ptr [rip + 0x1ac1ef0], xmm0 ; 0x101df4380
0x100332490: lea rdx, [rip + 0x1ac1ee9] ; 0x101df4380
0x100332497: mov qword ptr [rip + 0x1ac1ef2], rcx ; 0x101df4390
0x10033249e: mov qword ptr [rip + 0x1ac1d4b], rdx ; 0x101df41f0
0x1003324a5: lea rcx, [rip + 0x84ebe2] ; 0x100b8108e autoStart
0x1003324ac: mov qword ptr [rip + 0x97aa5d], rcx ; 0x100cacf10
0x1003324b3: lea rcx, [rip + 0x97aa56] ; 0x100cacf10
0x1003324ba: mov rdx, qword ptr [rip + 0x94579f] ; 0x100c77c60
0x1003324c1: mov qword ptr [rip + 0x97aa58], rdx ; 0x100cacf20
0x1003324c8: mov qword ptr [rip + 0x945791], rcx ; 0x100c77c60
0x1003324cf: mov qword ptr [rip + 0x97aa56], 0xc ; 0x100cacf30
0x1003324da: mov rcx, qword ptr [rip + 0x8d5077] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1003324e1: mov qword ptr [rip + 0x97aa50], rcx ; 0x100cacf38
0x1003324e8: mov qword ptr [rip + 0x97aa51], rax ; 0x100cacf40
0x1003324ef: mov qword ptr [rip + 0x97aa4e], 0xffffffffffffffff ; 0x100cacf48
0x1003324fa: lea rax, [rip - 0x318ae1] ; 0x100019a20
0x100332501: mov qword ptr [rip + 0x97aa48], rax ; 0x100cacf50
0x100332508: mov qword ptr [rip + 0x97aa45], 0 ; 0x100cacf58
0x100332513: lea rax, [rip + 0x84eb7e] ; 0x100b81098 Tool_CustomWidget
0x10033251a: vmovq xmm0, rax
0x10033251f: vpunpcklqdq xmm0, xmm0, xmm1
0x100332523: vmovdqa xmmword ptr [rip + 0x1ac1e75], xmm0 ; 0x101df43a0
0x10033252b: lea rax, [rip + 0x1ac1e6e] ; 0x101df43a0
0x100332532: mov qword ptr [rip + 0x1ac1e73], 0 ; 0x101df43b0
0x10033253d: lea rcx, [rip + 0x870ae8] ; 0x100ba302c false
0x100332544: vmovq xmm0, rcx
0x100332549: lea rcx, [rip + 0x82c4b2] ; 0x100b5ea02 Tool_DefaultValue
0x100332550: vmovq xmm1, rcx
0x100332555: vpunpcklqdq xmm0, xmm1, xmm0
0x100332559: vmovdqa xmmword ptr [rip + 0x1ac1e5f], xmm0 ; 0x101df43c0
0x100332561: lea rcx, [rip + 0x1ac1e58] ; 0x101df43c0
0x100332568: mov qword ptr [rip + 0x1ac1e61], rax ; 0x101df43d0
0x10033256f: mov qword ptr [rip + 0x97a9a2], rcx ; 0x100cacf18
0x100332576: lea rax, [rip + 0x84eb2d] ; 0x100b810aa EventBarn
0x10033257d: mov qword ptr [rip + 0x1ac1e5c], rax ; 0x101df43e0
0x100332584: lea rax, [rip + 0x1ac1e4d] ; 0x101df43d8
0x10033258b: mov qword ptr [rip + 0x1ac1e52], 0 ; 0x101df43e8
0x100332596: mov rcx, qword ptr [rip + 0x93d9bb] ; 0x100c6ff58
0x10033259d: mov qword ptr [rip + 0x1ac1e4c], rcx ; 0x101df43f0
0x1003325a4: mov qword ptr [rip + 0x93d9ad], rax ; 0x100c6ff58
0x1003325ab: mov qword ptr [rip + 0x1ac1e4e], rax ; 0x101df4400
0x1003325b2: mov rax, qword ptr [rip + 0x8d60f7] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1003325b9: mov qword ptr [rip + 0x1ac1e48], rax ; 0x101df4408
0x1003325c0: mov dword ptr [rip + 0x1ac1e46], 0xffffffff ; 0x101df4410
0x1003325ca: mov dword ptr [rip + 0x1ac1e40], 0xffffffff ; 0x101df4414
0x1003325d4: mov qword ptr [rip + 0x1ac1e51], 0 ; 0x101df4430
0x1003325df: mov rax, qword ptr [rip + 0x8da2ca] ; 0x100c0c8b0
0x1003325e6: add rax, 0x10
0x1003325ea: mov qword ptr [rip + 0x1ac1de7], rax ; 0x101df43d8
0x1003325f1: xor eax, eax
0x1003325f3: call 0x100011c10 ; 0x100011c10
0x1003325f8: lea rax, [rip + 0x82a30d] ; 0x100b5c90c Initialize
0x1003325ff: mov qword ptr [rip + 0x1ac1e32], rax ; 0x101df4438
0x100332606: lea rcx, [rip + 0x1ac1e2b] ; 0x101df4438
0x10033260d: mov rax, qword ptr [rip + 0x93d94c] ; 0x100c6ff60
0x100332614: mov qword ptr [rip + 0x1ac1e2d], rax ; 0x101df4448
0x10033261b: lea rax, [rip - 0x4182] ; 0x10032e4a0
0x100332622: vmovq xmm0, rax
0x100332627: vmovdqu xmmword ptr [rip + 0x1ac1e41], xmm0 ; 0x101df4470
0x10033262f: mov rax, qword ptr [rip + 0x8d427a] ; 0x100c068b0 -> 0x100330270 __Z12ApplyWrapperI9EventBarnMS0_FvP4HeapP10MetaSystemEEvM9VoidClassFvvEPv8VariablePSB_j
0x100332636: mov qword ptr [rip + 0x1ac1e43], rax ; 0x101df4480
0x10033263d: mov rax, qword ptr [rip + 0x8d7afc] ; 0x100c0a140 -> 0x100330280 __Z21InitFunctionSignatureIM9EventBarnFvP4HeapP10MetaSystemEEvP17FunctionSignature
0x100332644: mov qword ptr [rip + 0x1ac1e3d], rax ; 0x101df4488
0x10033264b: mov rax, qword ptr [rip + 0x8d6346] ; 0x100c08998 -> 0x10032fa20 __Z18GetMetaClassByTypeIP9EventBarnERK9MetaClassv
0x100332652: mov qword ptr [rip + 0x1ac1e37], rax ; 0x101df4490
0x100332659: lea rdx, [rip + 0x82a2e2] ; 0x100b5c942 systemHeap
0x100332660: vmovq xmm0, rdx
0x100332665: lea rdx, [rip + 0x82a2ab] ; 0x100b5c917 ArgName
0x10033266c: vmovq xmm1, rdx
0x100332671: vpunpcklqdq xmm0, xmm1, xmm0
0x100332675: vmovdqa xmmword ptr [rip + 0x1ac1e23], xmm0 ; 0x101df44a0
0x10033267d: lea rdx, [rip + 0x1ac1e1c] ; 0x101df44a0
0x100332684: mov qword ptr [rip + 0x1ac1e21], 0 ; 0x101df44b0
0x10033268f: mov qword ptr [rip + 0x1ac1daa], rdx ; 0x101df4440
0x100332696: lea rdx, [rip + 0x82e3a8] ; 0x100b60a45 OnLevelLoad
0x10033269d: mov qword ptr [rip + 0x1ac1e14], rdx ; 0x101df44b8
0x1003326a4: lea rsi, [rip + 0x1ac1e0d] ; 0x101df44b8
0x1003326ab: mov qword ptr [rip + 0x1ac1e0a], 0 ; 0x101df44c0
0x1003326b6: mov qword ptr [rip + 0x1ac1e0b], rcx ; 0x101df44c8
0x1003326bd: lea rcx, [rip - 0x4184] ; 0x10032e540
0x1003326c4: vmovq xmm1, rcx
0x1003326c9: vmovdqu xmmword ptr [rip + 0x1ac1e1f], xmm1 ; 0x101df44f0
0x1003326d1: mov r8, qword ptr [rip + 0x8d41c8] ; 0x100c068a0 -> 0x1003303e0 __Z12ApplyWrapperI9EventBarnMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x1003326d8: mov qword ptr [rip + 0x1ac1e21], r8 ; 0x101df4500
0x1003326df: mov rdx, qword ptr [rip + 0x8d7a4a] ; 0x100c0a130 -> 0x100330480 __Z21InitFunctionSignatureIM9EventBarnFvP4GameEEvP17FunctionSignature
0x1003326e6: mov qword ptr [rip + 0x1ac1e1b], rdx ; 0x101df4508
0x1003326ed: mov qword ptr [rip + 0x1ac1e1c], rax ; 0x101df4510
0x1003326f4: lea rdi, [rip + 0x82e360] ; 0x100b60a5b OnLevelUnload
0x1003326fb: mov qword ptr [rip + 0x1ac1e16], rdi ; 0x101df4518
0x100332702: lea rdi, [rip + 0x1ac1e0f] ; 0x101df4518
0x100332709: mov qword ptr [rip + 0x1ac1e0c], 0 ; 0x101df4520
0x100332714: mov qword ptr [rip + 0x1ac1e0d], rsi ; 0x101df4528
0x10033271b: lea rsi, [rip - 0x40b2] ; 0x10032e670
0x100332722: vmovq xmm1, rsi
0x100332727: vmovdqu xmmword ptr [rip + 0x1ac1e21], xmm1 ; 0x101df4550
0x10033272f: mov qword ptr [rip + 0x1ac1e2a], r8 ; 0x101df4560
0x100332736: mov qword ptr [rip + 0x1ac1e2b], rdx ; 0x101df4568
0x10033273d: mov qword ptr [rip + 0x1ac1e2c], rax ; 0x101df4570
0x100332744: lea rsi, [rip + 0x82a1ed] ; 0x100b5c938 Terminate
0x10033274b: mov qword ptr [rip + 0x1ac1e26], rsi ; 0x101df4578
0x100332752: lea rsi, [rip + 0x1ac1e1f] ; 0x101df4578
0x100332759: mov qword ptr [rip + 0x1ac1e28], rdi ; 0x101df4588
0x100332760: lea rdi, [rip - 0x3e47] ; 0x10032e920
0x100332767: vmovq xmm1, rdi
0x10033276c: vmovdqu xmmword ptr [rip + 0x1ac1e3c], xmm1 ; 0x101df45b0
0x100332774: mov rdi, qword ptr [rip + 0x8d412d] ; 0x100c068a8 -> 0x100330500 __Z12ApplyWrapperI9EventBarnMS0_FvP4GameP4HeapEEvM9VoidClassFvvEPv8VariablePSB_j
0x10033277b: mov qword ptr [rip + 0x1ac1e3e], rdi ; 0x101df45c0
0x100332782: mov rdi, qword ptr [rip + 0x8d79af] ; 0x100c0a138 -> 0x100330510 __Z21InitFunctionSignatureIM9EventBarnFvP4GameP4HeapEEvP17FunctionSignature
0x100332789: mov qword ptr [rip + 0x1ac1e38], rdi ; 0x101df45c8
0x100332790: mov qword ptr [rip + 0x1ac1e39], rax ; 0x101df45d0
0x100332797: vmovdqa xmmword ptr [rip + 0x1ac1e41], xmm0 ; 0x101df45e0
0x10033279f: lea rdi, [rip + 0x1ac1e3a] ; 0x101df45e0
0x1003327a6: mov qword ptr [rip + 0x1ac1e3f], 0 ; 0x101df45f0
0x1003327b1: mov qword ptr [rip + 0x1ac1dc8], rdi ; 0x101df4580
0x1003327b8: lea rdi, [rip + 0x82a1a0] ; 0x100b5c95f HotLoad
0x1003327bf: mov qword ptr [rip + 0x1ac1e32], rdi ; 0x101df45f8
0x1003327c6: lea rdi, [rip + 0x1ac1e2b] ; 0x101df45f8
0x1003327cd: mov qword ptr [rip + 0x1ac1e28], 0 ; 0x101df4600
0x1003327d8: mov qword ptr [rip + 0x1ac1e29], rsi ; 0x101df4608
0x1003327df: lea rsi, [rip - 0x3e06] ; 0x10032e9e0
0x1003327e6: vmovq xmm0, rsi
0x1003327eb: vmovdqu xmmword ptr [rip + 0x1ac1e3d], xmm0 ; 0x101df4630
0x1003327f3: mov rsi, qword ptr [rip + 0x8d40be] ; 0x100c068b8 -> 0x100330670 __Z12ApplyWrapperI9EventBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1003327fa: mov qword ptr [rip + 0x1ac1e3f], rsi ; 0x101df4640
0x100332801: mov rbx, qword ptr [rip + 0x8d7940] ; 0x100c0a148 -> 0x1003306d0 __Z21InitFunctionSignatureIM9EventBarnFvvEEvP17FunctionSignature
0x100332808: mov qword ptr [rip + 0x1ac1e39], rbx ; 0x101df4648
0x10033280f: mov qword ptr [rip + 0x1ac1e3a], rax ; 0x101df4650
0x100332816: lea rcx, [rip + 0x82f5cf] ; 0x100b61dec HotUnload
0x10033281d: mov qword ptr [rip + 0x1ac1e34], rcx ; 0x101df4658
0x100332824: lea rcx, [rip + 0x1ac1e2d] ; 0x101df4658
0x10033282b: mov qword ptr [rip + 0x1ac1e2a], 0 ; 0x101df4660
0x100332836: mov qword ptr [rip + 0x1ac1e2b], rdi ; 0x101df4668
0x10033283d: lea rdi, [rip - 0x3df4] ; 0x10032ea50
0x100332844: vmovq xmm0, rdi
0x100332849: vmovdqu xmmword ptr [rip + 0x1ac1e3f], xmm0 ; 0x101df4690
0x100332851: mov qword ptr [rip + 0x1ac1e48], rsi ; 0x101df46a0
0x100332858: mov qword ptr [rip + 0x1ac1e49], rbx ; 0x101df46a8
0x10033285f: mov qword ptr [rip + 0x1ac1e4a], rax ; 0x101df46b0
0x100332866: lea rsi, [rip + 0x82a0e0] ; 0x100b5c94d Update
0x10033286d: mov qword ptr [rip + 0x1ac1e44], rsi ; 0x101df46b8
0x100332874: lea rsi, [rip + 0x1ac1e3d] ; 0x101df46b8
0x10033287b: mov qword ptr [rip + 0x1ac1e3a], 0 ; 0x101df46c0
0x100332886: mov qword ptr [rip + 0x1ac1e3b], rcx ; 0x101df46c8
0x10033288d: lea rcx, [rip - 0x3e04] ; 0x10032ea90
0x100332894: vmovq xmm0, rcx
0x100332899: vmovdqu xmmword ptr [rip + 0x1ac1e4f], xmm0 ; 0x101df46f0
0x1003328a1: mov qword ptr [rip + 0x1ac1e58], r8 ; 0x101df4700
0x1003328a8: mov qword ptr [rip + 0x1ac1e59], rdx ; 0x101df4708
0x1003328af: mov qword ptr [rip + 0x1ac1e5a], rax ; 0x101df4710
0x1003328b6: lea rcx, [rip + 0x82f544] ; 0x100b61e01 RenderFlush
0x1003328bd: mov qword ptr [rip + 0x1ac1e54], rcx ; 0x101df4718
0x1003328c4: lea rcx, [rip + 0x1ac1e4d] ; 0x101df4718
0x1003328cb: mov qword ptr [rip + 0x1ac1e4a], 0 ; 0x101df4720
0x1003328d6: mov qword ptr [rip + 0x1ac1e4b], rsi ; 0x101df4728
0x1003328dd: lea rsi, [rip - 0x3c94] ; 0x10032ec50
0x1003328e4: vmovq xmm0, rsi
0x1003328e9: vmovdqu xmmword ptr [rip + 0x1ac1e5f], xmm0 ; 0x101df4750
0x1003328f1: mov qword ptr [rip + 0x1ac1e68], r8 ; 0x101df4760
0x1003328f8: mov qword ptr [rip + 0x1ac1e69], rdx ; 0x101df4768
0x1003328ff: mov qword ptr [rip + 0x1ac1e6a], rax ; 0x101df4770
0x100332906: lea rdx, [rip + 0x84e7a7] ; 0x100b810b4 AddEventByMetaName
0x10033290d: mov qword ptr [rip + 0x1ac1e64], rdx ; 0x101df4778
0x100332914: lea rdx, [rip + 0x1ac1e5d] ; 0x101df4778
0x10033291b: mov qword ptr [rip + 0x1ac1e5a], 0 ; 0x101df4780
0x100332926: mov qword ptr [rip + 0x1ac1e5b], rcx ; 0x101df4788
0x10033292d: lea rcx, [rip - 0x3c74] ; 0x10032ecc0
0x100332934: vmovq xmm0, rcx
0x100332939: vmovdqu xmmword ptr [rip + 0x1ac1e6f], xmm0 ; 0x101df47b0
0x100332941: mov rcx, qword ptr [rip + 0x8d3f50] ; 0x100c06898 -> 0x1003306f0 __Z12ApplyWrapperI9EventBarnMS0_FP5EventPKcEEvM9VoidClassFvvEPv8VariablePSB_j
0x100332948: mov qword ptr [rip + 0x1ac1e71], rcx ; 0x101df47c0
0x10033294f: mov rcx, qword ptr [rip + 0x8d77d2] ; 0x100c0a128 -> 0x1003307b0 __Z21InitFunctionSignatureIM9EventBarnFP5EventPKcEEvP17FunctionSignature
0x100332956: mov qword ptr [rip + 0x1ac1e6b], rcx ; 0x101df47c8
0x10033295d: mov qword ptr [rip + 0x1ac1e6c], rax ; 0x101df47d0
0x100332964: lea rcx, [rip + 0x84e75c] ; 0x100b810c7 CreateLevelEvent
0x10033296b: mov qword ptr [rip + 0x1ac1e66], rcx ; 0x101df47d8
0x100332972: lea rcx, [rip + 0x1ac1e5f] ; 0x101df47d8
0x100332979: mov qword ptr [rip + 0x1ac1e68], rdx ; 0x101df47e8
0x100332980: mov qword ptr [rip + 0x93d5d9], rcx ; 0x100c6ff60
0x100332987: lea rcx, [rip - 0x3c9e] ; 0x10032ecf0
0x10033298e: vmovq xmm0, rcx
0x100332993: vmovdqu xmmword ptr [rip + 0x1ac1e75], xmm0 ; 0x101df4810
0x10033299b: mov rcx, qword ptr [rip + 0x8d3eee] ; 0x100c06890 -> 0x100330840 __Z12ApplyWrapperI9EventBarnMS0_FP5EventPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x1003329a2: mov qword ptr [rip + 0x1ac1e77], rcx ; 0x101df4820
0x1003329a9: mov rcx, qword ptr [rip + 0x8d7770] ; 0x100c0a120 -> 0x100330900 __Z21InitFunctionSignatureIM9EventBarnFP5EventPK9MetaClassEEvP17FunctionSignature
0x1003329b0: mov qword ptr [rip + 0x1ac1e71], rcx ; 0x101df4828
0x1003329b7: mov qword ptr [rip + 0x1ac1e72], rax ; 0x101df4830
0x1003329be: vmovq xmm0, r14
0x1003329c3: lea rax, [rip + 0x8446fe] ; 0x100b770c8 ObjectFactory_CreatesType
0x1003329ca: vmovq xmm1, rax
0x1003329cf: vpunpcklqdq xmm0, xmm1, xmm0
0x1003329d3: vmovdqa xmmword ptr [rip + 0x1ac1e65], xmm0 ; 0x101df4840
0x1003329db: lea rax, [rip + 0x1ac1e5e] ; 0x101df4840
0x1003329e2: mov qword ptr [rip + 0x1ac1e63], 0 ; 0x101df4850
0x1003329ed: mov qword ptr [rip + 0x1ac1dec], rax ; 0x101df47e0
0x1003329f4: lea rdi, [rip + 0x9f91b5] ; 0x100d2bbb0
0x1003329fb: lea rsi, [rip + 0x1ac1e56] ; 0x101df4858
0x100332a02: lea rdx, [rip + 0x84e6cf] ; 0x100b810d8 tag_EventBarn
0x100332a09: pop rbx
0x100332a0a: pop r14
0x100332a0c: pop rbp
0x100332a0d: jmp 0x1007951b0 ; 0x1007951b0
0x100332a12: nop 
0x100332a13: nop 
0x100332a14: nop 
0x100332a15: nop 
0x100332a16: nop 
0x100332a17: nop 
0x100332a18: nop 
0x100332a19: nop 
0x100332a1a: nop 
0x100332a1b: nop 
0x100332a1c: nop 
0x100332a1d: nop 
0x100332a1e: nop 
0x100332a1f: nop 
