0x10019f240: push rbp
0x10019f241: mov rbp, rsp
0x10019f244: push r14
0x10019f246: push rbx
0x10019f247: mov dword ptr [rip + 0xb84d0f], 0 ; 0x100d23f60
0x10019f251: lea r14, [rip + 0x9d838a] ; 0x100b775e2 BirdFlock
0x10019f258: mov qword ptr [rip + 0x1c3a2a9], r14 ; 0x101dd9508
0x10019f25f: lea rax, [rip + 0x1c3a29a] ; 0x101dd9500
0x10019f266: mov qword ptr [rip + 0x1c3a29f], 0 ; 0x101dd9510
0x10019f271: mov rcx, qword ptr [rip + 0xad0ce0] ; 0x100c6ff58
0x10019f278: mov qword ptr [rip + 0x1c3a299], rcx ; 0x101dd9518
0x10019f27f: mov qword ptr [rip + 0xad0cd2], rax ; 0x100c6ff58
0x10019f286: mov qword ptr [rip + 0x1c3a29b], rax ; 0x101dd9528
0x10019f28d: lea rax, [rip - 0x1699d4] ; 0x1000358c0
0x10019f294: mov qword ptr [rip + 0x1c3a295], rax ; 0x101dd9530
0x10019f29b: mov qword ptr [rip + 0x1c3a292], 0xffffffffffffffff ; 0x101dd9538
0x10019f2a6: mov qword ptr [rip + 0x1c3a2a7], 0 ; 0x101dd9558
0x10019f2b1: mov rax, qword ptr [rip + 0xa6d578] ; 0x100c0c830
0x10019f2b8: add rax, 0x10
0x10019f2bc: mov qword ptr [rip + 0x1c3a23d], rax ; 0x101dd9500
0x10019f2c3: xor eax, eax
0x10019f2c5: call 0x100011c10 ; 0x100011c10
0x10019f2ca: lea rax, [rip + 0x9c0d6b] ; 0x100b6003c Tool_Export
0x10019f2d1: vmovq xmm0, rax
0x10019f2d6: lea rax, [rip + 0x9bf702] ; 0x100b5e9df true
0x10019f2dd: vmovq xmm1, rax
0x10019f2e2: vpunpcklqdq xmm0, xmm0, xmm1
0x10019f2e6: vmovdqa xmmword ptr [rip + 0x1c3a272], xmm0 ; 0x101dd9560
0x10019f2ee: lea rax, [rip + 0x1c3a26b] ; 0x101dd9560
0x10019f2f5: mov rcx, qword ptr [rip + 0x1c3a214] ; 0x101dd9510
0x10019f2fc: mov qword ptr [rip + 0x1c3a26d], rcx ; 0x101dd9570
0x10019f303: mov qword ptr [rip + 0x1c3a206], rax ; 0x101dd9510
0x10019f30a: lea rax, [rip + 0x9d7d3d] ; 0x100b7704e SetEnabled
0x10019f311: mov qword ptr [rip + 0x1c3a260], rax ; 0x101dd9578
0x10019f318: lea rcx, [rip + 0x1c3a259] ; 0x101dd9578
0x10019f31f: mov qword ptr [rip + 0x1c3a256], 0 ; 0x101dd9580
0x10019f32a: mov rax, qword ptr [rip + 0xad0c2f] ; 0x100c6ff60
0x10019f331: mov qword ptr [rip + 0x1c3a250], rax ; 0x101dd9588
0x10019f338: lea rax, [rip - 0x3e3f] ; 0x10019b500
0x10019f33f: vmovq xmm0, rax
0x10019f344: vmovdqu xmmword ptr [rip + 0x1c3a264], xmm0 ; 0x101dd95b0
0x10019f34c: mov rax, qword ptr [rip + 0xa67425] ; 0x100c06778 -> 0x10019e510 __Z12ApplyWrapperI9BirdFlockMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x10019f353: mov qword ptr [rip + 0x1c3a266], rax ; 0x101dd95c0
0x10019f35a: mov rax, qword ptr [rip + 0xa6aca7] ; 0x100c0a008 -> 0x10019e5b0 __Z21InitFunctionSignatureIM9BirdFlockFvbEEvP17FunctionSignature
0x10019f361: mov qword ptr [rip + 0x1c3a260], rax ; 0x101dd95c8
0x10019f368: mov rax, qword ptr [rip + 0xa695b1] ; 0x100c08920 -> 0x10019e490 __Z18GetMetaClassByTypeIP9BirdFlockERK9MetaClassv
0x10019f36f: mov qword ptr [rip + 0x1c3a25a], rax ; 0x101dd95d0
0x10019f376: lea rdx, [rip + 0x9d3ef6] ; 0x100b73273 GetEnabled
0x10019f37d: mov qword ptr [rip + 0x1c3a254], rdx ; 0x101dd95d8
0x10019f384: lea rdx, [rip + 0x1c3a24d] ; 0x101dd95d8
0x10019f38b: mov qword ptr [rip + 0x1c3a24a], 0 ; 0x101dd95e0
0x10019f396: mov qword ptr [rip + 0x1c3a24b], rcx ; 0x101dd95e8
0x10019f39d: mov qword ptr [rip + 0xad0bbc], rdx ; 0x100c6ff60
0x10019f3a4: lea rcx, [rip - 0x3e9b] ; 0x10019b510
0x10019f3ab: vmovq xmm0, rcx
0x10019f3b0: vmovdqu xmmword ptr [rip + 0x1c3a258], xmm0 ; 0x101dd9610
0x10019f3b8: mov rcx, qword ptr [rip + 0xa673c1] ; 0x100c06780 -> 0x10019e630 __Z12ApplyWrapperI9BirdFlockMS0_KFbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10019f3bf: mov qword ptr [rip + 0x1c3a25a], rcx ; 0x101dd9620
0x10019f3c6: mov rcx, qword ptr [rip + 0xa6ac43] ; 0x100c0a010 -> 0x10019e6b0 __Z21InitFunctionSignatureIM9BirdFlockKFbvEEvP17FunctionSignature
0x10019f3cd: mov qword ptr [rip + 0x1c3a254], rcx ; 0x101dd9628
0x10019f3d4: mov qword ptr [rip + 0x1c3a255], rax ; 0x101dd9630
0x10019f3db: lea rcx, [rip + 0x9d7c77] ; 0x100b77059 enabled
0x10019f3e2: mov qword ptr [rip + 0xae9137], rcx ; 0x100c88520
0x10019f3e9: lea rdx, [rip + 0xae9130] ; 0x100c88520
0x10019f3f0: mov rcx, qword ptr [rip + 0xad8869] ; 0x100c77c60
0x10019f3f7: mov qword ptr [rip + 0xae9132], rcx ; 0x100c88530
0x10019f3fe: mov qword ptr [rip + 0xae9137], 0xc ; 0x100c88540
0x10019f409: mov rsi, qword ptr [rip + 0xa68148] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10019f410: mov qword ptr [rip + 0xae9131], rsi ; 0x100c88548
0x10019f417: mov qword ptr [rip + 0xae9132], rax ; 0x100c88550
0x10019f41e: mov qword ptr [rip + 0xae912f], 0xffffffffffffffff ; 0x100c88558
0x10019f429: lea rcx, [rip - 0x185a10] ; 0x100019a20
0x10019f430: mov qword ptr [rip + 0xae9129], rcx ; 0x100c88560
0x10019f437: mov qword ptr [rip + 0xae9126], 0 ; 0x100c88568
0x10019f442: lea rdi, [rip + 0x9d81a3] ; 0x100b775ec prepopulate
0x10019f449: mov qword ptr [rip + 0xae9120], rdi ; 0x100c88570
0x10019f450: lea rdi, [rip + 0xae9119] ; 0x100c88570
0x10019f457: mov qword ptr [rip + 0xae9122], rdx ; 0x100c88580
0x10019f45e: mov qword ptr [rip + 0xae9127], 0xd ; 0x100c88590
0x10019f469: mov qword ptr [rip + 0xae9128], rsi ; 0x100c88598
0x10019f470: mov qword ptr [rip + 0xae9129], rax ; 0x100c885a0
0x10019f477: mov qword ptr [rip + 0xae9126], 0xffffffffffffffff ; 0x100c885a8
0x10019f482: mov qword ptr [rip + 0xae9127], rcx ; 0x100c885b0
0x10019f489: mov qword ptr [rip + 0xae9124], 0 ; 0x100c885b8
0x10019f494: lea rdx, [rip + 0x9d815d] ; 0x100b775f8 maxInstances
0x10019f49b: mov qword ptr [rip + 0xae911e], rdx ; 0x100c885c0
0x10019f4a2: lea rdx, [rip + 0xae9117] ; 0x100c885c0
0x10019f4a9: mov qword ptr [rip + 0xae9120], rdi ; 0x100c885d0
0x10019f4b0: mov qword ptr [rip + 0xae9125], 0x18 ; 0x100c885e0
0x10019f4bb: mov rsi, qword ptr [rip + 0xa680b6] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x10019f4c2: mov qword ptr [rip + 0xae911f], rsi ; 0x100c885e8
0x10019f4c9: mov qword ptr [rip + 0xae9120], rax ; 0x100c885f0
0x10019f4d0: mov qword ptr [rip + 0xae911d], 0xffffffffffffffff ; 0x100c885f8
0x10019f4db: mov qword ptr [rip + 0xae911e], rcx ; 0x100c88600
0x10019f4e2: mov qword ptr [rip + 0xae911b], 0 ; 0x100c88608
0x10019f4ed: lea rsi, [rip + 0x9d8111] ; 0x100b77605 spawnRate
0x10019f4f4: mov qword ptr [rip + 0xae9115], rsi ; 0x100c88610
0x10019f4fb: lea rsi, [rip + 0xae910e] ; 0x100c88610
0x10019f502: mov qword ptr [rip + 0xae9117], rdx ; 0x100c88620
0x10019f509: mov qword ptr [rip + 0xae911c], 0x1c ; 0x100c88630
0x10019f514: mov r8, qword ptr [rip + 0xa68045] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x10019f51b: mov qword ptr [rip + 0xae9116], r8 ; 0x100c88638
0x10019f522: mov qword ptr [rip + 0xae9117], rax ; 0x100c88640
0x10019f529: mov qword ptr [rip + 0xae9114], 0xffffffffffffffff ; 0x100c88648
0x10019f534: mov qword ptr [rip + 0xae9115], rcx ; 0x100c88650
0x10019f53b: mov qword ptr [rip + 0xae9112], 0 ; 0x100c88658
0x10019f546: lea rdi, [rip + 0x9d80c2] ; 0x100b7760f travelSpeed
0x10019f54d: mov qword ptr [rip + 0xae910c], rdi ; 0x100c88660
0x10019f554: lea rdi, [rip + 0xae9105] ; 0x100c88660
0x10019f55b: mov qword ptr [rip + 0xae910e], rsi ; 0x100c88670
0x10019f562: mov qword ptr [rip + 0xae9113], 0x20 ; 0x100c88680
0x10019f56d: mov qword ptr [rip + 0xae9114], r8 ; 0x100c88688
0x10019f574: mov qword ptr [rip + 0xae9115], rax ; 0x100c88690
0x10019f57b: mov qword ptr [rip + 0xae9112], 0xffffffffffffffff ; 0x100c88698
0x10019f586: mov qword ptr [rip + 0xae9113], rcx ; 0x100c886a0
0x10019f58d: mov qword ptr [rip + 0xae9110], 0 ; 0x100c886a8
0x10019f598: lea rsi, [rip + 0x9d807c] ; 0x100b7761b spinScalar
0x10019f59f: mov qword ptr [rip + 0xae910a], rsi ; 0x100c886b0
0x10019f5a6: lea rsi, [rip + 0xae9103] ; 0x100c886b0
0x10019f5ad: mov qword ptr [rip + 0xae910c], rdi ; 0x100c886c0
0x10019f5b4: mov qword ptr [rip + 0xae9111], 0x24 ; 0x100c886d0
0x10019f5bf: mov qword ptr [rip + 0xae9112], r8 ; 0x100c886d8
0x10019f5c6: mov qword ptr [rip + 0xae9113], rax ; 0x100c886e0
0x10019f5cd: mov qword ptr [rip + 0xae9110], 0xffffffffffffffff ; 0x100c886e8
0x10019f5d8: mov qword ptr [rip + 0xae9111], rcx ; 0x100c886f0
0x10019f5df: mov qword ptr [rip + 0xae910e], 0 ; 0x100c886f8
0x10019f5ea: lea rdi, [rip + 0x9bf411] ; 0x100b5ea02 Tool_DefaultValue
0x10019f5f1: vmovq xmm0, rdi
0x10019f5f6: vpunpcklqdq xmm2, xmm0, xmm1
0x10019f5fa: vmovdqa xmmword ptr [rip + 0x1c3a03e], xmm2 ; 0x101dd9640
0x10019f602: lea rdi, [rip + 0x1c3a037] ; 0x101dd9640
0x10019f609: mov qword ptr [rip + 0x1c3a03c], 0 ; 0x101dd9650
0x10019f614: mov qword ptr [rip + 0xae8f0d], rdi ; 0x100c88528
0x10019f61b: vmovdqa xmmword ptr [rip + 0x1c3a03d], xmm2 ; 0x101dd9660
0x10019f623: lea rdi, [rip + 0x1c3a036] ; 0x101dd9660
0x10019f62a: mov qword ptr [rip + 0x1c3a03b], 0 ; 0x101dd9670
0x10019f635: mov qword ptr [rip + 0xae8f3c], rdi ; 0x100c88578
0x10019f63c: lea rdi, [rip + 0x9d7fe3] ; 0x100b77626 1000
0x10019f643: vmovq xmm2, rdi
0x10019f648: vpunpcklqdq xmm2, xmm0, xmm2
0x10019f64c: vmovdqa xmmword ptr [rip + 0x1c3a02c], xmm2 ; 0x101dd9680
0x10019f654: lea rdi, [rip + 0x1c3a025] ; 0x101dd9680
0x10019f65b: mov qword ptr [rip + 0x1c3a02a], 0 ; 0x101dd9690
0x10019f666: mov qword ptr [rip + 0xae8f5b], rdi ; 0x100c885c8
0x10019f66d: lea rdi, [rip + 0x9c508a] ; 0x100b646fe 5.0f
0x10019f674: vmovq xmm2, rdi
0x10019f679: vpunpcklqdq xmm2, xmm0, xmm2
0x10019f67d: vmovdqa xmmword ptr [rip + 0x1c3a01b], xmm2 ; 0x101dd96a0
0x10019f685: lea rdi, [rip + 0x1c3a014] ; 0x101dd96a0
0x10019f68c: mov qword ptr [rip + 0x1c3a019], 0 ; 0x101dd96b0
0x10019f697: mov qword ptr [rip + 0xae8f7a], rdi ; 0x100c88618
0x10019f69e: lea rdi, [rip + 0x9c4f4b] ; 0x100b645f0 4.0f
0x10019f6a5: vmovq xmm2, rdi
0x10019f6aa: vpunpcklqdq xmm2, xmm0, xmm2
0x10019f6ae: vmovdqa xmmword ptr [rip + 0x1c3a00a], xmm2 ; 0x101dd96c0
0x10019f6b6: lea rdi, [rip + 0x1c3a003] ; 0x101dd96c0
0x10019f6bd: mov qword ptr [rip + 0x1c3a008], 0 ; 0x101dd96d0
0x10019f6c8: mov qword ptr [rip + 0xae8f99], rdi ; 0x100c88668
0x10019f6cf: lea rdi, [rip + 0x9c1561] ; 0x100b60c37 1.0f
0x10019f6d6: vmovq xmm2, rdi
0x10019f6db: vpunpcklqdq xmm2, xmm0, xmm2
0x10019f6df: vmovdqa xmmword ptr [rip + 0x1c39ff9], xmm2 ; 0x101dd96e0
0x10019f6e7: lea rdi, [rip + 0x1c39ff2] ; 0x101dd96e0
0x10019f6ee: mov qword ptr [rip + 0x1c39ff7], 0 ; 0x101dd96f0
0x10019f6f9: mov qword ptr [rip + 0xae8fb8], rdi ; 0x100c886b8
0x10019f700: lea rdi, [rip + 0x9d7f24] ; 0x100b7762b rail
0x10019f707: mov qword ptr [rip + 0xae8ff2], rdi ; 0x100c88700
0x10019f70e: lea rdi, [rip + 0xae8feb] ; 0x100c88700
0x10019f715: mov qword ptr [rip + 0xae8ff4], rsi ; 0x100c88710
0x10019f71c: mov qword ptr [rip + 0xae8ff9], 0x10 ; 0x100c88720
0x10019f727: mov rsi, qword ptr [rip + 0xa67b7a] ; 0x100c072a8 -> 0x1000ec410 __Z17GetMetaTypeByTypeIP4RailERK8MetaTypev
0x10019f72e: mov qword ptr [rip + 0xae8ff3], rsi ; 0x100c88728
0x10019f735: mov qword ptr [rip + 0xae8ff4], rax ; 0x100c88730
0x10019f73c: mov qword ptr [rip + 0xae8ff1], 0xffffffffffffffff ; 0x100c88738
0x10019f747: mov qword ptr [rip + 0xae8ff2], rcx ; 0x100c88740
0x10019f74e: mov qword ptr [rip + 0xae8fef], 0 ; 0x100c88748
0x10019f759: lea rsi, [rip + 0x9bf2b9] ; 0x100b5ea19 Tool_Nullable
0x10019f760: vmovq xmm2, rsi
0x10019f765: vpunpcklqdq xmm2, xmm2, xmm1
0x10019f769: vmovdqa xmmword ptr [rip + 0x1c39f8f], xmm2 ; 0x101dd9700
0x10019f771: lea rsi, [rip + 0x1c39f88] ; 0x101dd9700
0x10019f778: mov qword ptr [rip + 0x1c39f8d], 0 ; 0x101dd9710
0x10019f783: lea rbx, [rip + 0x9bf30d] ; 0x100b5ea97 null
0x10019f78a: vmovq xmm1, rbx
0x10019f78f: vpunpcklqdq xmm1, xmm0, xmm1
0x10019f793: vmovdqa xmmword ptr [rip + 0x1c39f85], xmm1 ; 0x101dd9720
0x10019f79b: lea rbx, [rip + 0x1c39f7e] ; 0x101dd9720
0x10019f7a2: mov qword ptr [rip + 0x1c39f87], rsi ; 0x101dd9730
0x10019f7a9: mov qword ptr [rip + 0xae8f58], rbx ; 0x100c88708
0x10019f7b0: lea rsi, [rip + 0x9d7e79] ; 0x100b77630 streamSound
0x10019f7b7: mov qword ptr [rip + 0xae8f92], rsi ; 0x100c88750
0x10019f7be: lea rsi, [rip + 0xae8f8b] ; 0x100c88750
0x10019f7c5: mov qword ptr [rip + 0xae8f94], rdi ; 0x100c88760
0x10019f7cc: mov qword ptr [rip + 0xae8f99], 0x28 ; 0x100c88770
0x10019f7d7: mov rdi, qword ptr [rip + 0xa6760a] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x10019f7de: mov qword ptr [rip + 0xae8f93], rdi ; 0x100c88778
0x10019f7e5: mov qword ptr [rip + 0xae8f94], rax ; 0x100c88780
0x10019f7ec: mov qword ptr [rip + 0xae8f91], 0xffffffffffffffff ; 0x100c88788
0x10019f7f7: mov qword ptr [rip + 0xae8f92], rcx ; 0x100c88790
0x10019f7fe: mov qword ptr [rip + 0xae8f8f], 0 ; 0x100c88798
0x10019f809: lea rbx, [rip + 0x9d7e2c] ; 0x100b7763c birdStreamLP
0x10019f810: vmovq xmm1, rbx
0x10019f815: vpunpcklqdq xmm1, xmm0, xmm1
0x10019f819: vmovdqa xmmword ptr [rip + 0x1c39f1f], xmm1 ; 0x101dd9740
0x10019f821: lea rbx, [rip + 0x1c39f18] ; 0x101dd9740
0x10019f828: mov qword ptr [rip + 0x1c39f1d], 0 ; 0x101dd9750
0x10019f833: lea rdx, [rip + 0x9d7e0f] ; 0x100b77649 Sound
0x10019f83a: vmovq xmm1, rdx
0x10019f83f: lea rdx, [rip + 0x9c4d49] ; 0x100b6458f Tool_Category
0x10019f846: vmovq xmm3, rdx
0x10019f84b: vpunpcklqdq xmm1, xmm3, xmm1
0x10019f84f: vmovdqa xmmword ptr [rip + 0x1c39f09], xmm1 ; 0x101dd9760
0x10019f857: lea rdx, [rip + 0x1c39f02] ; 0x101dd9760
0x10019f85e: mov qword ptr [rip + 0x1c39f0b], rbx ; 0x101dd9770
0x10019f865: mov qword ptr [rip + 0xae8eec], rdx ; 0x100c88758
0x10019f86c: lea rdx, [rip + 0x9d7ddc] ; 0x100b7764f hitSound
0x10019f873: mov qword ptr [rip + 0xae8f26], rdx ; 0x100c887a0
0x10019f87a: lea rdx, [rip + 0xae8f1f] ; 0x100c887a0
0x10019f881: mov qword ptr [rip + 0xae8f28], rsi ; 0x100c887b0
0x10019f888: mov qword ptr [rip + 0xae8f2d], 0x40 ; 0x100c887c0
0x10019f893: mov qword ptr [rip + 0xae8f2e], rdi ; 0x100c887c8
0x10019f89a: mov qword ptr [rip + 0xae8f2f], rax ; 0x100c887d0
0x10019f8a1: mov qword ptr [rip + 0xae8f2c], 0xffffffffffffffff ; 0x100c887d8
0x10019f8ac: mov qword ptr [rip + 0xae8f2d], rcx ; 0x100c887e0
0x10019f8b3: mov qword ptr [rip + 0xae8f2a], 0 ; 0x100c887e8
0x10019f8be: vmovdqa xmmword ptr [rip + 0x1c39eba], xmm1 ; 0x101dd9780
0x10019f8c6: lea rsi, [rip + 0x1c39eb3] ; 0x101dd9780
0x10019f8cd: mov qword ptr [rip + 0x1c39eb8], 0 ; 0x101dd9790
0x10019f8d8: mov qword ptr [rip + 0xae8ec9], rsi ; 0x100c887a8
0x10019f8df: lea rsi, [rip + 0x9c2481] ; 0x100b61d67 intensity
0x10019f8e6: mov qword ptr [rip + 0xae8f03], rsi ; 0x100c887f0
0x10019f8ed: lea rsi, [rip + 0xae8efc] ; 0x100c887f0
0x10019f8f4: mov qword ptr [rip + 0xae8f05], rdx ; 0x100c88800
0x10019f8fb: mov qword ptr [rip + 0xae8f0a], 0x58 ; 0x100c88810
0x10019f906: mov rdx, qword ptr [rip + 0xa679cb] ; 0x100c072d8 -> 0x10003bf40 __Z17GetMetaTypeByTypeIP5FloatERK8MetaTypev
0x10019f90d: mov qword ptr [rip + 0xae8f04], rdx ; 0x100c88818
0x10019f914: mov qword ptr [rip + 0xae8f05], rax ; 0x100c88820
0x10019f91b: mov qword ptr [rip + 0xae8f02], 0xffffffffffffffff ; 0x100c88828
0x10019f926: mov qword ptr [rip + 0xae8f03], rcx ; 0x100c88830
0x10019f92d: mov qword ptr [rip + 0xae8f00], 0 ; 0x100c88838
0x10019f938: vmovdqa xmmword ptr [rip + 0x1c39e60], xmm2 ; 0x101dd97a0
0x10019f940: lea rdx, [rip + 0x1c39e59] ; 0x101dd97a0
0x10019f947: mov qword ptr [rip + 0x1c39e5e], 0 ; 0x101dd97b0
0x10019f952: lea rdi, [rip + 0x9bf0bb] ; 0x100b5ea14 NULL
0x10019f959: vmovq xmm2, rdi
0x10019f95e: vpunpcklqdq xmm2, xmm0, xmm2
0x10019f962: vmovdqa xmmword ptr [rip + 0x1c39e56], xmm2 ; 0x101dd97c0
0x10019f96a: lea rdi, [rip + 0x1c39e4f] ; 0x101dd97c0
0x10019f971: mov qword ptr [rip + 0x1c39e58], rdx ; 0x101dd97d0
0x10019f978: vmovdqa xmmword ptr [rip + 0x1c39e60], xmm1 ; 0x101dd97e0
0x10019f980: lea rdx, [rip + 0x1c39e59] ; 0x101dd97e0
0x10019f987: mov qword ptr [rip + 0x1c39e62], rdi ; 0x101dd97f0
0x10019f98e: mov qword ptr [rip + 0xae8e63], rdx ; 0x100c887f8
0x10019f995: lea rdx, [rip + 0x9c6576] ; 0x100b65f12 minDist
0x10019f99c: mov qword ptr [rip + 0xae8e9d], rdx ; 0x100c88840
0x10019f9a3: lea rdx, [rip + 0xae8e96] ; 0x100c88840
0x10019f9aa: mov qword ptr [rip + 0xae8e9f], rsi ; 0x100c88850
0x10019f9b1: mov qword ptr [rip + 0xae8ea4], 0x60 ; 0x100c88860
0x10019f9bc: mov qword ptr [rip + 0xae8ea5], r8 ; 0x100c88868
0x10019f9c3: mov qword ptr [rip + 0xae8ea6], rax ; 0x100c88870
0x10019f9ca: mov qword ptr [rip + 0xae8ea3], 0xffffffffffffffff ; 0x100c88878
0x10019f9d5: mov qword ptr [rip + 0xae8ea4], rcx ; 0x100c88880
0x10019f9dc: mov qword ptr [rip + 0xae8ea1], 0 ; 0x100c88888
0x10019f9e7: lea rsi, [rip + 0x9c4cfc] ; 0x100b646ea 3.0f
0x10019f9ee: vmovq xmm2, rsi
0x10019f9f3: vpunpcklqdq xmm2, xmm0, xmm2
0x10019f9f7: vmovdqa xmmword ptr [rip + 0x1c39e01], xmm2 ; 0x101dd9800
0x10019f9ff: lea rsi, [rip + 0x1c39dfa] ; 0x101dd9800
0x10019fa06: mov qword ptr [rip + 0x1c39dff], 0 ; 0x101dd9810
0x10019fa11: vmovdqa xmmword ptr [rip + 0x1c39e07], xmm1 ; 0x101dd9820
0x10019fa19: lea rdi, [rip + 0x1c39e00] ; 0x101dd9820
0x10019fa20: mov qword ptr [rip + 0x1c39e09], rsi ; 0x101dd9830
0x10019fa27: mov qword ptr [rip + 0xae8e1a], rdi ; 0x100c88848
0x10019fa2e: lea rsi, [rip + 0x9c64e5] ; 0x100b65f1a maxDist
0x10019fa35: mov qword ptr [rip + 0xae8e54], rsi ; 0x100c88890
0x10019fa3c: lea rsi, [rip + 0xae8e4d] ; 0x100c88890
0x10019fa43: mov qword ptr [rip + 0xae8e56], rdx ; 0x100c888a0
0x10019fa4a: mov qword ptr [rip + 0xad820f], rsi ; 0x100c77c60
0x10019fa51: mov qword ptr [rip + 0xae8e54], 0x64 ; 0x100c888b0
0x10019fa5c: mov qword ptr [rip + 0xae8e55], r8 ; 0x100c888b8
0x10019fa63: mov qword ptr [rip + 0xae8e56], rax ; 0x100c888c0
0x10019fa6a: mov qword ptr [rip + 0xae8e53], 0xffffffffffffffff ; 0x100c888c8
0x10019fa75: mov qword ptr [rip + 0xae8e54], rcx ; 0x100c888d0
0x10019fa7c: mov qword ptr [rip + 0xae8e51], 0 ; 0x100c888d8
0x10019fa87: lea rax, [rip + 0x9d7bca] ; 0x100b77658 35.0f
0x10019fa8e: vmovq xmm2, rax
0x10019fa93: vpunpcklqdq xmm0, xmm0, xmm2
0x10019fa97: vmovdqa xmmword ptr [rip + 0x1c39da1], xmm0 ; 0x101dd9840
0x10019fa9f: lea rax, [rip + 0x1c39d9a] ; 0x101dd9840
0x10019faa6: mov qword ptr [rip + 0x1c39d9f], 0 ; 0x101dd9850
0x10019fab1: vmovdqa xmmword ptr [rip + 0x1c39da7], xmm1 ; 0x101dd9860
0x10019fab9: lea rcx, [rip + 0x1c39da0] ; 0x101dd9860
0x10019fac0: mov qword ptr [rip + 0x1c39da9], rax ; 0x101dd9870
0x10019fac7: mov qword ptr [rip + 0xae8dca], rcx ; 0x100c88898
0x10019face: lea rax, [rip + 0x9d7b89] ; 0x100b7765e BirdFlocks
0x10019fad5: mov qword ptr [rip + 0x1c39da4], rax ; 0x101dd9880
0x10019fadc: lea rax, [rip + 0x1c39d95] ; 0x101dd9878
0x10019fae3: mov qword ptr [rip + 0x1c39d9a], 0 ; 0x101dd9888
0x10019faee: mov rcx, qword ptr [rip + 0xad0463] ; 0x100c6ff58
0x10019faf5: mov qword ptr [rip + 0x1c39d94], rcx ; 0x101dd9890
0x10019fafc: mov qword ptr [rip + 0xad0455], rax ; 0x100c6ff58
0x10019fb03: mov qword ptr [rip + 0x1c39d96], rax ; 0x101dd98a0
0x10019fb0a: mov rax, qword ptr [rip + 0xa68b9f] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x10019fb11: mov qword ptr [rip + 0x1c39d90], rax ; 0x101dd98a8
0x10019fb18: mov dword ptr [rip + 0x1c39d8e], 0xffffffff ; 0x101dd98b0
0x10019fb22: mov dword ptr [rip + 0x1c39d88], 0xffffffff ; 0x101dd98b4
0x10019fb2c: mov qword ptr [rip + 0x1c39d99], 0 ; 0x101dd98d0
0x10019fb37: mov rax, qword ptr [rip + 0xa6adb2] ; 0x100c0a8f0
0x10019fb3e: add rax, 0x10
0x10019fb42: mov qword ptr [rip + 0x1c39d2f], rax ; 0x101dd9878
0x10019fb49: xor eax, eax
0x10019fb4b: call 0x100011c10 ; 0x100011c10
0x10019fb50: lea rax, [rip + 0x9bcdb5] ; 0x100b5c90c Initialize
0x10019fb57: mov qword ptr [rip + 0x1c39d7a], rax ; 0x101dd98d8
0x10019fb5e: lea rcx, [rip + 0x1c39d73] ; 0x101dd98d8
0x10019fb65: mov qword ptr [rip + 0x1c39d70], 0 ; 0x101dd98e0
0x10019fb70: mov rax, qword ptr [rip + 0xad03e9] ; 0x100c6ff60
0x10019fb77: mov qword ptr [rip + 0x1c39d6a], rax ; 0x101dd98e8
0x10019fb7e: lea rax, [rip - 0x4645] ; 0x10019b540
0x10019fb85: vmovq xmm0, rax
0x10019fb8a: vmovdqu xmmword ptr [rip + 0x1c39d7e], xmm0 ; 0x101dd9910
0x10019fb92: mov rax, qword ptr [rip + 0xa656e7] ; 0x100c05280 -> 0x10019ec50 __Z12ApplyWrapperI10BirdFlocksMS0_FvP15ResourceManagerP5SceneP14ModelInstancerP16CollisionGeoBarnEEvM9VoidClassFvvEPv8VariablePSF_j
0x10019fb99: mov qword ptr [rip + 0x1c39d80], rax ; 0x101dd9920
0x10019fba0: mov rax, qword ptr [rip + 0xa68f69] ; 0x100c08b10 -> 0x10019ec60 __Z21InitFunctionSignatureIM10BirdFlocksFvP15ResourceManagerP5SceneP14ModelInstancerP16CollisionGeoBarnEEvP17FunctionSignature
0x10019fba7: mov qword ptr [rip + 0x1c39d7a], rax ; 0x101dd9928
0x10019fbae: mov rax, qword ptr [rip + 0xa679f3] ; 0x100c075a8 -> 0x10019eb40 __Z18GetMetaClassByTypeIP10BirdFlocksERK9MetaClassv
0x10019fbb5: mov qword ptr [rip + 0x1c39d74], rax ; 0x101dd9930
0x10019fbbc: lea rdx, [rip + 0x9bcd75] ; 0x100b5c938 Terminate
0x10019fbc3: mov qword ptr [rip + 0x1c39d6e], rdx ; 0x101dd9938
0x10019fbca: lea rdx, [rip + 0x1c39d67] ; 0x101dd9938
0x10019fbd1: mov qword ptr [rip + 0x1c39d64], 0 ; 0x101dd9940
0x10019fbdc: mov qword ptr [rip + 0x1c39d65], rcx ; 0x101dd9948
0x10019fbe3: lea rcx, [rip - 0x45fa] ; 0x10019b5f0
0x10019fbea: vmovq xmm0, rcx
0x10019fbef: vmovdqu xmmword ptr [rip + 0x1c39d79], xmm0 ; 0x101dd9970
0x10019fbf7: mov rcx, qword ptr [rip + 0xa65692] ; 0x100c05290 -> 0x10019ee50 __Z12ApplyWrapperI10BirdFlocksMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10019fbfe: mov qword ptr [rip + 0x1c39d7b], rcx ; 0x101dd9980
0x10019fc05: mov rsi, qword ptr [rip + 0xa68f14] ; 0x100c08b20 -> 0x10019eeb0 __Z21InitFunctionSignatureIM10BirdFlocksFvvEEvP17FunctionSignature
0x10019fc0c: mov qword ptr [rip + 0x1c39d75], rsi ; 0x101dd9988
0x10019fc13: mov qword ptr [rip + 0x1c39d76], rax ; 0x101dd9990
0x10019fc1a: lea rdi, [rip + 0x9c0e3a] ; 0x100b60a5b OnLevelUnload
0x10019fc21: mov qword ptr [rip + 0x1c39d70], rdi ; 0x101dd9998
0x10019fc28: lea rdi, [rip + 0x1c39d69] ; 0x101dd9998
0x10019fc2f: mov qword ptr [rip + 0x1c39d66], 0 ; 0x101dd99a0
0x10019fc3a: mov qword ptr [rip + 0x1c39d67], rdx ; 0x101dd99a8
0x10019fc41: lea rdx, [rip - 0x45c8] ; 0x10019b680
0x10019fc48: vmovq xmm0, rdx
0x10019fc4d: vmovdqu xmmword ptr [rip + 0x1c39d7b], xmm0 ; 0x101dd99d0
0x10019fc55: mov qword ptr [rip + 0x1c39d84], rcx ; 0x101dd99e0
0x10019fc5c: mov qword ptr [rip + 0x1c39d85], rsi ; 0x101dd99e8
0x10019fc63: mov qword ptr [rip + 0x1c39d86], rax ; 0x101dd99f0
0x10019fc6a: lea rcx, [rip + 0x9bccdc] ; 0x100b5c94d Update
0x10019fc71: mov qword ptr [rip + 0x1c39d80], rcx ; 0x101dd99f8
0x10019fc78: lea rcx, [rip + 0x1c39d79] ; 0x101dd99f8
0x10019fc7f: mov qword ptr [rip + 0x1c39d76], 0 ; 0x101dd9a00
0x10019fc8a: mov qword ptr [rip + 0x1c39d77], rdi ; 0x101dd9a08
0x10019fc91: lea rdx, [rip - 0x45a8] ; 0x10019b6f0
0x10019fc98: vmovq xmm0, rdx
0x10019fc9d: vmovdqu xmmword ptr [rip + 0x1c39d8b], xmm0 ; 0x101dd9a30
0x10019fca5: mov rdx, qword ptr [rip + 0xa655dc] ; 0x100c05288 -> 0x10019eed0 __Z12ApplyWrapperI10BirdFlocksMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x10019fcac: mov qword ptr [rip + 0x1c39d8d], rdx ; 0x101dd9a40
0x10019fcb3: mov rdx, qword ptr [rip + 0xa68e5e] ; 0x100c08b18 -> 0x10019ef70 __Z21InitFunctionSignatureIM10BirdFlocksFvP4GameEEvP17FunctionSignature
0x10019fcba: mov qword ptr [rip + 0x1c39d87], rdx ; 0x101dd9a48
0x10019fcc1: mov qword ptr [rip + 0x1c39d88], rax ; 0x101dd9a50
0x10019fcc8: lea rdx, [rip + 0x9d799a] ; 0x100b77669 CreateFlock
0x10019fccf: mov qword ptr [rip + 0x1c39d82], rdx ; 0x101dd9a58
0x10019fcd6: lea rdx, [rip + 0x1c39d7b] ; 0x101dd9a58
0x10019fcdd: mov qword ptr [rip + 0x1c39d84], rcx ; 0x101dd9a68
0x10019fce4: mov qword ptr [rip + 0xad0275], rdx ; 0x100c6ff60
0x10019fceb: lea rcx, [rip - 0x4182] ; 0x10019bb70
0x10019fcf2: vmovq xmm0, rcx
0x10019fcf7: vmovdqu xmmword ptr [rip + 0x1c39d91], xmm0 ; 0x101dd9a90
0x10019fcff: mov rcx, qword ptr [rip + 0xa65572] ; 0x100c05278 -> 0x10019eff0 __Z12ApplyWrapperI10BirdFlocksMS0_FP9BirdFlockPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x10019fd06: mov qword ptr [rip + 0x1c39d93], rcx ; 0x101dd9aa0
0x10019fd0d: mov rcx, qword ptr [rip + 0xa68df4] ; 0x100c08b08 -> 0x10019f0b0 __Z21InitFunctionSignatureIM10BirdFlocksFP9BirdFlockPK9MetaClassEEvP17FunctionSignature
0x10019fd14: mov qword ptr [rip + 0x1c39d8d], rcx ; 0x101dd9aa8
0x10019fd1b: mov qword ptr [rip + 0x1c39d8e], rax ; 0x101dd9ab0
0x10019fd22: vmovq xmm0, r14
0x10019fd27: lea rax, [rip + 0x9d739a] ; 0x100b770c8 ObjectFactory_CreatesType
0x10019fd2e: vmovq xmm1, rax
0x10019fd33: vpunpcklqdq xmm0, xmm1, xmm0
0x10019fd37: vmovdqa xmmword ptr [rip + 0x1c39d81], xmm0 ; 0x101dd9ac0
0x10019fd3f: lea rax, [rip + 0x1c39d7a] ; 0x101dd9ac0
0x10019fd46: mov qword ptr [rip + 0x1c39d7f], 0 ; 0x101dd9ad0
0x10019fd51: mov qword ptr [rip + 0x1c39d08], rax ; 0x101dd9a60
0x10019fd58: lea rdi, [rip + 0xb84209] ; 0x100d23f68
0x10019fd5f: lea rsi, [rip + 0x1c39d72] ; 0x101dd9ad8
0x10019fd66: lea rdx, [rip + 0x9d7908] ; 0x100b77675 tag_BirdFlockCache
0x10019fd6d: call 0x1007951b0 ; 0x1007951b0
0x10019fd72: lea rdi, [rip + 0xb84207] ; 0x100d23f80
0x10019fd79: lea rsi, [rip + 0x1c39d60] ; 0x101dd9ae0
0x10019fd80: lea rdx, [rip + 0x9d7901] ; 0x100b77688 tag_BirdFlockInstances
0x10019fd87: pop rbx
0x10019fd88: pop r14
0x10019fd8a: pop rbp
0x10019fd8b: jmp 0x1007951b0 ; 0x1007951b0
