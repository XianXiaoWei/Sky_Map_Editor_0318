0x1006ade10: push rbp
0x1006ade11: mov rbp, rsp
0x1006ade14: sub rsp, 0x10
0x1006ade18: mov dword ptr [rip + 0x683d86], 0 ; 0x100d31ba8
0x1006ade22: lea rax, [rip + 0x4ebba1] ; 0x100b999ca kDrawTerrainDebugLines
0x1006ade29: mov qword ptr [rip + 0x19854d8], rax ; 0x102033308
0x1006ade30: lea rsi, [rip + 0x19854d1] ; 0x102033308
0x1006ade37: mov rax, qword ptr [rip + 0x5e1e62] ; 0x100c8fca0
0x1006ade3e: mov qword ptr [rip + 0x19854d3], rax ; 0x102033318
0x1006ade45: lea rax, [rip + 0x19854b4] ; 0x102033300
0x1006ade4c: vmovq xmm1, rax
0x1006ade51: lea rdx, [rip + 0x4ebb89] ; 0x100b999e1 TerrainBarn.cpp
0x1006ade58: vmovq xmm0, rdx
0x1006ade5d: vpunpcklqdq xmm1, xmm0, xmm1
0x1006ade61: vmovdqu xmmword ptr [rip + 0x19854bf], xmm1 ; 0x102033328
0x1006ade69: mov r9, qword ptr [rip + 0x5596e8] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1006ade70: mov qword ptr [rip + 0x19854c1], r9 ; 0x102033338
0x1006ade77: mov qword ptr [rip + 0x19854be], 0 ; 0x102033340
0x1006ade82: lea rcx, [rip - 0x694469] ; 0x100019a20
0x1006ade89: mov qword ptr [rip + 0x19854b8], rcx ; 0x102033348
0x1006ade90: mov qword ptr [rip + 0x19854b5], 0 ; 0x102033350
0x1006ade9b: lea rdi, [rip + 0x4d13f5] ; 0x100b7f297 Terrain
0x1006adea2: vmovq xmm2, rdi
0x1006adea7: lea rdi, [rip + 0x4b016f] ; 0x100b5e01d TweakCategory
0x1006adeae: vmovq xmm1, rdi
0x1006adeb3: vpunpcklqdq xmm2, xmm1, xmm2
0x1006adeb7: vmovdqa xmmword ptr [rip + 0x19854a1], xmm2 ; 0x102033360
0x1006adebf: lea rdi, [rip + 0x198549a] ; 0x102033360
0x1006adec6: mov qword ptr [rip + 0x198549f], 0 ; 0x102033370
0x1006aded1: mov qword ptr [rip + 0x1985438], rdi ; 0x102033310
0x1006aded8: lea rdi, [rip + 0x4ebb12] ; 0x100b999f1 kMinLod
0x1006adedf: mov qword ptr [rip + 0x198549a], rdi ; 0x102033380
0x1006adee6: lea r8, [rip + 0x1985493] ; 0x102033380
0x1006adeed: mov qword ptr [rip + 0x198549c], rsi ; 0x102033390
0x1006adef4: mov qword ptr [rip + 0x19854a5], rdx ; 0x1020333a0
0x1006adefb: lea rsi, [rip + 0x1985476] ; 0x102033378
0x1006adf02: mov qword ptr [rip + 0x198549f], rsi ; 0x1020333a8
0x1006adf09: mov rsi, qword ptr [rip + 0x559650] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1006adf10: mov qword ptr [rip + 0x1985499], rsi ; 0x1020333b0
0x1006adf17: mov qword ptr [rip + 0x1985496], 0 ; 0x1020333b8
0x1006adf22: mov qword ptr [rip + 0x1985497], rcx ; 0x1020333c0
0x1006adf29: mov qword ptr [rip + 0x1985494], 0 ; 0x1020333c8
0x1006adf34: vmovdqa xmmword ptr [rip + 0x1985494], xmm2 ; 0x1020333d0
0x1006adf3c: vmovdqa xmm4, xmm2
0x1006adf40: lea rdi, [rip + 0x1985489] ; 0x1020333d0
0x1006adf47: mov qword ptr [rip + 0x198548e], 0 ; 0x1020333e0
0x1006adf52: lea rax, [rip + 0x4ebaa0] ; 0x100b999f9 0 3
0x1006adf59: vmovq xmm2, rax
0x1006adf5e: lea rax, [rip + 0x4b21e9] ; 0x100b6014e TweakRange
0x1006adf65: vmovq xmm3, rax
0x1006adf6a: vpunpcklqdq xmm2, xmm3, xmm2
0x1006adf6e: vmovdqa xmmword ptr [rip + 0x198547a], xmm2 ; 0x1020333f0
0x1006adf76: lea rax, [rip + 0x1985473] ; 0x1020333f0
0x1006adf7d: mov qword ptr [rip + 0x198547c], rdi ; 0x102033400
0x1006adf84: mov qword ptr [rip + 0x19853fd], rax ; 0x102033388
0x1006adf8b: lea rax, [rip + 0x4eba6b] ; 0x100b999fd kTessSmoothScale
0x1006adf92: mov qword ptr [rip + 0x198546f], rax ; 0x102033408
0x1006adf99: lea rax, [rip + 0x1985468] ; 0x102033408
0x1006adfa0: mov qword ptr [rip + 0x1985471], r8 ; 0x102033418
0x1006adfa7: mov qword ptr [rip + 0x198547a], rdx ; 0x102033428
0x1006adfae: lea rdx, [rip + 0x654aeb] ; 0x100d02aa0
0x1006adfb5: mov qword ptr [rip + 0x1985474], rdx ; 0x102033430
0x1006adfbc: mov qword ptr [rip + 0x1985475], rsi ; 0x102033438
0x1006adfc3: mov qword ptr [rip + 0x1985472], 0 ; 0x102033440
0x1006adfce: mov qword ptr [rip + 0x1985473], rcx ; 0x102033448
0x1006adfd5: mov qword ptr [rip + 0x1985470], 0 ; 0x102033450
0x1006adfe0: vmovdqa xmmword ptr [rip + 0x1985478], xmm4 ; 0x102033460
0x1006adfe8: lea rdx, [rip + 0x1985471] ; 0x102033460
0x1006adfef: mov qword ptr [rip + 0x1985476], 0 ; 0x102033470
0x1006adffa: lea rsi, [rip + 0x4c5800] ; 0x100b73801 0 1
0x1006ae001: vmovq xmm2, rsi
0x1006ae006: vpunpcklqdq xmm2, xmm3, xmm2
0x1006ae00a: vmovdqa xmmword ptr [rip + 0x198546e], xmm2 ; 0x102033480
0x1006ae012: lea rsi, [rip + 0x1985467] ; 0x102033480
0x1006ae019: mov qword ptr [rip + 0x1985470], rdx ; 0x102033490
0x1006ae020: mov qword ptr [rip + 0x19853e9], rsi ; 0x102033410
0x1006ae027: lea rdx, [rip + 0x4eb9e0] ; 0x100b99a0e kDrawTerrainBins
0x1006ae02e: mov qword ptr [rip + 0x198546b], rdx ; 0x1020334a0
0x1006ae035: lea rdx, [rip + 0x1985464] ; 0x1020334a0
0x1006ae03c: mov qword ptr [rip + 0x198546d], rax ; 0x1020334b0
0x1006ae043: lea rax, [rip + 0x198544e] ; 0x102033498
0x1006ae04a: vmovq xmm2, rax
0x1006ae04f: vpunpcklqdq xmm2, xmm0, xmm2
0x1006ae053: vmovdqu xmmword ptr [rip + 0x1985465], xmm2 ; 0x1020334c0
0x1006ae05b: mov qword ptr [rip + 0x198546e], r9 ; 0x1020334d0
0x1006ae062: mov qword ptr [rip + 0x198546b], 0 ; 0x1020334d8
0x1006ae06d: mov qword ptr [rip + 0x198546c], rcx ; 0x1020334e0
0x1006ae074: mov qword ptr [rip + 0x1985469], 0 ; 0x1020334e8
0x1006ae07f: vmovdqa xmmword ptr [rip + 0x1985469], xmm4 ; 0x1020334f0
0x1006ae087: lea rax, [rip + 0x1985462] ; 0x1020334f0
0x1006ae08e: mov qword ptr [rip + 0x1985467], 0 ; 0x102033500
0x1006ae099: mov qword ptr [rip + 0x1985408], rax ; 0x1020334a8
0x1006ae0a0: lea rax, [rip + 0x4eb978] ; 0x100b99a1f kUpdateCamera
0x1006ae0a7: mov qword ptr [rip + 0x198545a], rax ; 0x102033508
0x1006ae0ae: lea rax, [rip + 0x1985453] ; 0x102033508
0x1006ae0b5: mov qword ptr [rip + 0x198545c], rdx ; 0x102033518
0x1006ae0bc: lea rdx, [rip + 0x6549e1] ; 0x100d02aa4
0x1006ae0c3: vmovq xmm2, rdx
0x1006ae0c8: vpunpcklqdq xmm2, xmm0, xmm2
0x1006ae0cc: vmovdqu xmmword ptr [rip + 0x1985454], xmm2 ; 0x102033528
0x1006ae0d4: mov qword ptr [rip + 0x198545d], r9 ; 0x102033538
0x1006ae0db: mov qword ptr [rip + 0x198545a], 0 ; 0x102033540
0x1006ae0e6: mov qword ptr [rip + 0x198545b], rcx ; 0x102033548
0x1006ae0ed: mov qword ptr [rip + 0x1985458], 0 ; 0x102033550
0x1006ae0f8: vmovdqa xmmword ptr [rip + 0x1985460], xmm4 ; 0x102033560
0x1006ae100: vmovdqa xmmword ptr [rbp - 0x10], xmm4
0x1006ae105: lea rdx, [rip + 0x1985454] ; 0x102033560
0x1006ae10c: mov qword ptr [rip + 0x1985459], 0 ; 0x102033570
0x1006ae117: mov qword ptr [rip + 0x19853f2], rdx ; 0x102033510
0x1006ae11e: lea rdx, [rip + 0x4eb908] ; 0x100b99a2d kDrawMaterialSkirts
0x1006ae125: mov qword ptr [rip + 0x198544c], rdx ; 0x102033578
0x1006ae12c: lea rdx, [rip + 0x1985445] ; 0x102033578
0x1006ae133: mov qword ptr [rip + 0x198544e], rax ; 0x102033588
0x1006ae13a: lea rax, [rip + 0x654964] ; 0x100d02aa5
0x1006ae141: vmovq xmm2, rax
0x1006ae146: vpunpcklqdq xmm2, xmm0, xmm2
0x1006ae14a: vmovdqu xmmword ptr [rip + 0x1985446], xmm2 ; 0x102033598
0x1006ae152: mov qword ptr [rip + 0x198544f], r9 ; 0x1020335a8
0x1006ae159: mov qword ptr [rip + 0x198544c], 0 ; 0x1020335b0
0x1006ae164: mov qword ptr [rip + 0x198544d], rcx ; 0x1020335b8
0x1006ae16b: mov qword ptr [rip + 0x198544a], 0 ; 0x1020335c0
0x1006ae176: vmovdqa xmmword ptr [rip + 0x1985452], xmm4 ; 0x1020335d0
0x1006ae17e: lea rax, [rip + 0x198544b] ; 0x1020335d0
0x1006ae185: mov qword ptr [rip + 0x1985450], 0 ; 0x1020335e0
0x1006ae190: mov qword ptr [rip + 0x19853e9], rax ; 0x102033580
0x1006ae197: lea rax, [rip + 0x4eb8a3] ; 0x100b99a41 kProfileTerrain
0x1006ae19e: mov qword ptr [rip + 0x198544b], rax ; 0x1020335f0
0x1006ae1a5: lea rax, [rip + 0x1985444] ; 0x1020335f0
0x1006ae1ac: mov qword ptr [rip + 0x198544d], rdx ; 0x102033600
0x1006ae1b3: lea rdx, [rip + 0x198542e] ; 0x1020335e8
0x1006ae1ba: vmovq xmm2, rdx
0x1006ae1bf: vpunpcklqdq xmm2, xmm0, xmm2
0x1006ae1c3: vmovdqu xmmword ptr [rip + 0x1985445], xmm2 ; 0x102033610
0x1006ae1cb: mov qword ptr [rip + 0x198544e], r9 ; 0x102033620
0x1006ae1d2: mov qword ptr [rip + 0x198544b], 0 ; 0x102033628
0x1006ae1dd: mov qword ptr [rip + 0x198544c], rcx ; 0x102033630
0x1006ae1e4: mov qword ptr [rip + 0x1985449], 0 ; 0x102033638
0x1006ae1ef: lea rdx, [rip + 0x4b7414] ; 0x100b6560a Profile
0x1006ae1f6: vmovq xmm2, rdx
0x1006ae1fb: vpunpcklqdq xmm2, xmm1, xmm2
0x1006ae1ff: vmovdqa xmmword ptr [rip + 0x1985439], xmm2 ; 0x102033640
0x1006ae207: lea rdx, [rip + 0x1985432] ; 0x102033640
0x1006ae20e: mov qword ptr [rip + 0x1985437], 0 ; 0x102033650
0x1006ae219: mov qword ptr [rip + 0x19853d8], rdx ; 0x1020335f8
0x1006ae220: lea rdx, [rip + 0x4eb82a] ; 0x100b99a51 kLogTerrain
0x1006ae227: mov qword ptr [rip + 0x1985432], rdx ; 0x102033660
0x1006ae22e: lea rdx, [rip + 0x198542b] ; 0x102033660
0x1006ae235: mov qword ptr [rip + 0x1985434], rax ; 0x102033670
0x1006ae23c: mov qword ptr [rip + 0x5e1a5d], rdx ; 0x100c8fca0
0x1006ae243: lea rax, [rip + 0x198540e] ; 0x102033658
0x1006ae24a: vmovq xmm2, rax
0x1006ae24f: vpunpcklqdq xmm0, xmm0, xmm2
0x1006ae253: vmovdqu xmmword ptr [rip + 0x1985425], xmm0 ; 0x102033680
0x1006ae25b: mov qword ptr [rip + 0x198542e], r9 ; 0x102033690
0x1006ae262: mov qword ptr [rip + 0x198542b], 0 ; 0x102033698
0x1006ae26d: mov qword ptr [rip + 0x198542c], rcx ; 0x1020336a0
0x1006ae274: mov qword ptr [rip + 0x1985429], 0 ; 0x1020336a8
0x1006ae27f: lea rax, [rip + 0x4b3bac] ; 0x100b61e32 Debug
0x1006ae286: vmovq xmm0, rax
0x1006ae28b: vpunpcklqdq xmm0, xmm1, xmm0
0x1006ae28f: vmovdqa xmmword ptr [rip + 0x1985419], xmm0 ; 0x1020336b0
0x1006ae297: lea rax, [rip + 0x1985412] ; 0x1020336b0
0x1006ae29e: mov qword ptr [rip + 0x1985417], 0 ; 0x1020336c0
0x1006ae2a9: mov qword ptr [rip + 0x19853b8], rax ; 0x102033668
0x1006ae2b0: lea rax, [rip + 0x4eb7a6] ; 0x100b99a5d TerrainBarn
0x1006ae2b7: mov qword ptr [rip + 0x1985412], rax ; 0x1020336d0
0x1006ae2be: lea rax, [rip + 0x1985403] ; 0x1020336c8
0x1006ae2c5: mov qword ptr [rip + 0x1985408], 0 ; 0x1020336d8
0x1006ae2d0: mov rcx, qword ptr [rip + 0x5c1c81] ; 0x100c6ff58
0x1006ae2d7: mov qword ptr [rip + 0x1985402], rcx ; 0x1020336e0
0x1006ae2de: mov qword ptr [rip + 0x5c1c73], rax ; 0x100c6ff58
0x1006ae2e5: mov qword ptr [rip + 0x1985404], rax ; 0x1020336f0
0x1006ae2ec: mov rax, qword ptr [rip + 0x55a3bd] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1006ae2f3: mov qword ptr [rip + 0x19853fe], rax ; 0x1020336f8
0x1006ae2fa: mov dword ptr [rip + 0x19853fc], 0xffffffff ; 0x102033700
0x1006ae304: mov dword ptr [rip + 0x19853f6], 0xffffffff ; 0x102033704
0x1006ae30e: mov qword ptr [rip + 0x1985407], 0 ; 0x102033720
0x1006ae319: mov rax, qword ptr [rip + 0x55cb08] ; 0x100c0ae28
0x1006ae320: add rax, 0x10
0x1006ae324: mov qword ptr [rip + 0x198539d], rax ; 0x1020336c8
0x1006ae32b: xor eax, eax
0x1006ae32d: call 0x100011c10 ; 0x100011c10
0x1006ae332: lea rax, [rip + 0x4ae5d3] ; 0x100b5c90c Initialize
0x1006ae339: mov qword ptr [rip + 0x19853e8], rax ; 0x102033728
0x1006ae340: lea rcx, [rip + 0x19853e1] ; 0x102033728
0x1006ae347: mov rax, qword ptr [rip + 0x5c1c12] ; 0x100c6ff60
0x1006ae34e: mov qword ptr [rip + 0x19853e3], rax ; 0x102033738
0x1006ae355: lea rax, [rip - 0xc70c] ; 0x1006a1c50
0x1006ae35c: vmovq xmm0, rax
0x1006ae361: vmovdqu xmmword ptr [rip + 0x19853f7], xmm0 ; 0x102033760
0x1006ae369: mov rax, qword ptr [rip + 0x557318] ; 0x100c05688 -> 0x1006ac800 __Z12ApplyWrapperI11TerrainBarnMS0_FvP15ResourceManagerP16CollisionGeoBarnP5WorldP6CameraP4HeapP15MaterialDefBarnP5SceneEEvM9VoidClassFvvEPv8VariablePSL_j
0x1006ae370: mov qword ptr [rip + 0x19853f9], rax ; 0x102033770
0x1006ae377: mov rax, qword ptr [rip + 0x55ab9a] ; 0x100c08f18 -> 0x1006ac810 __Z21InitFunctionSignatureIM11TerrainBarnFvP15ResourceManagerP16CollisionGeoBarnP5WorldP6CameraP4HeapP15MaterialDefBarnP5SceneEEvP17FunctionSignature
0x1006ae37e: mov qword ptr [rip + 0x19853f3], rax ; 0x102033778
0x1006ae385: mov rax, qword ptr [rip + 0x559584] ; 0x100c07910 -> 0x1006ac7f0 __Z18GetMetaClassByTypeIP11TerrainBarnERK9MetaClassv
0x1006ae38c: mov qword ptr [rip + 0x19853ed], rax ; 0x102033780
0x1006ae393: lea rdx, [rip + 0x4cc28c] ; 0x100b7a626 levelHeap
0x1006ae39a: vmovq xmm0, rdx
0x1006ae39f: lea rdx, [rip + 0x4ae571] ; 0x100b5c917 ArgName
0x1006ae3a6: vmovq xmm1, rdx
0x1006ae3ab: vpunpcklqdq xmm0, xmm1, xmm0
0x1006ae3af: vmovdqa xmmword ptr [rip + 0x19853d9], xmm0 ; 0x102033790
0x1006ae3b7: lea rdx, [rip + 0x19853d2] ; 0x102033790
0x1006ae3be: mov qword ptr [rip + 0x19853d7], 0 ; 0x1020337a0
0x1006ae3c9: mov qword ptr [rip + 0x1985360], rdx ; 0x102033730
0x1006ae3d0: lea rdx, [rip + 0x4ae561] ; 0x100b5c938 Terminate
0x1006ae3d7: mov qword ptr [rip + 0x19853ca], rdx ; 0x1020337a8
0x1006ae3de: lea rdx, [rip + 0x19853c3] ; 0x1020337a8
0x1006ae3e5: mov qword ptr [rip + 0x19853c0], 0 ; 0x1020337b0
0x1006ae3f0: mov qword ptr [rip + 0x19853c1], rcx ; 0x1020337b8
0x1006ae3f7: lea rcx, [rip - 0xbfde] ; 0x1006a2420
0x1006ae3fe: vmovq xmm0, rcx
0x1006ae403: vmovdqu xmmword ptr [rip + 0x19853d5], xmm0 ; 0x1020337e0
0x1006ae40b: mov r10, qword ptr [rip + 0x557296] ; 0x100c056a8 -> 0x1006acac0 __Z12ApplyWrapperI11TerrainBarnMS0_FvP7JobBarnEEvM9VoidClassFvvEPv8VariablePS9_j
0x1006ae412: mov qword ptr [rip + 0x19853d7], r10 ; 0x1020337f0
0x1006ae419: mov r11, qword ptr [rip + 0x55ab18] ; 0x100c08f38 -> 0x1006acb60 __Z21InitFunctionSignatureIM11TerrainBarnFvP7JobBarnEEvP17FunctionSignature
0x1006ae420: mov qword ptr [rip + 0x19853d1], r11 ; 0x1020337f8
0x1006ae427: mov qword ptr [rip + 0x19853d2], rax ; 0x102033800
0x1006ae42e: lea rcx, [rip + 0x4ae52a] ; 0x100b5c95f HotLoad
0x1006ae435: mov qword ptr [rip + 0x19853cc], rcx ; 0x102033808
0x1006ae43c: lea rcx, [rip + 0x19853c5] ; 0x102033808
0x1006ae443: mov qword ptr [rip + 0x19853c2], 0 ; 0x102033810
0x1006ae44e: mov qword ptr [rip + 0x19853c3], rdx ; 0x102033818
0x1006ae455: lea rdx, [rip - 0xbfbc] ; 0x1006a24a0
0x1006ae45c: vmovq xmm0, rdx
0x1006ae461: vmovdqu xmmword ptr [rip + 0x19853d7], xmm0 ; 0x102033840
0x1006ae469: mov r8, qword ptr [rip + 0x557220] ; 0x100c05690 -> 0x1006acbe0 __Z12ApplyWrapperI11TerrainBarnMS0_FvP15ResourceManagerP6CameraEEvM9VoidClassFvvEPv8VariablePSB_j
0x1006ae470: mov qword ptr [rip + 0x19853d9], r8 ; 0x102033850
0x1006ae477: mov r9, qword ptr [rip + 0x55aaa2] ; 0x100c08f20 -> 0x1006acbf0 __Z21InitFunctionSignatureIM11TerrainBarnFvP15ResourceManagerP6CameraEEvP17FunctionSignature
0x1006ae47e: mov qword ptr [rip + 0x19853d3], r9 ; 0x102033858
0x1006ae485: mov qword ptr [rip + 0x19853d4], rax ; 0x102033860
0x1006ae48c: lea rdx, [rip + 0x4b3959] ; 0x100b61dec HotUnload
0x1006ae493: mov qword ptr [rip + 0x19853ce], rdx ; 0x102033868
0x1006ae49a: lea rdx, [rip + 0x19853c7] ; 0x102033868
0x1006ae4a1: mov qword ptr [rip + 0x19853c4], 0 ; 0x102033870
0x1006ae4ac: mov qword ptr [rip + 0x19853c5], rcx ; 0x102033878
0x1006ae4b3: lea rcx, [rip - 0xbffa] ; 0x1006a24c0
0x1006ae4ba: vmovq xmm0, rcx
0x1006ae4bf: vmovdqu xmmword ptr [rip + 0x19853d9], xmm0 ; 0x1020338a0
0x1006ae4c7: mov qword ptr [rip + 0x19853e2], r10 ; 0x1020338b0
0x1006ae4ce: mov qword ptr [rip + 0x19853e3], r11 ; 0x1020338b8
0x1006ae4d5: mov qword ptr [rip + 0x19853e4], rax ; 0x1020338c0
0x1006ae4dc: lea rcx, [rip + 0x4b2562] ; 0x100b60a45 OnLevelLoad
0x1006ae4e3: mov qword ptr [rip + 0x19853de], rcx ; 0x1020338c8
0x1006ae4ea: lea rcx, [rip + 0x19853d7] ; 0x1020338c8
0x1006ae4f1: mov qword ptr [rip + 0x19853d4], 0 ; 0x1020338d0
0x1006ae4fc: mov qword ptr [rip + 0x19853d5], rdx ; 0x1020338d8
0x1006ae503: lea rdx, [rip - 0xc03a] ; 0x1006a24d0
0x1006ae50a: vmovq xmm0, rdx
0x1006ae50f: vmovdqu xmmword ptr [rip + 0x19853e9], xmm0 ; 0x102033900
0x1006ae517: mov rdx, qword ptr [rip + 0x55717a] ; 0x100c05698 -> 0x1006acd50 __Z12ApplyWrapperI11TerrainBarnMS0_FvP15TerrainBlobBarnP13LevelDataBarnP5WorldEEvM9VoidClassFvvEPv8VariablePSD_j
0x1006ae51e: mov qword ptr [rip + 0x19853eb], rdx ; 0x102033910
0x1006ae525: mov rdx, qword ptr [rip + 0x55a9fc] ; 0x100c08f28 -> 0x1006acd60 __Z21InitFunctionSignatureIM11TerrainBarnFvP15TerrainBlobBarnP13LevelDataBarnP5WorldEEvP17FunctionSignature
0x1006ae52c: mov qword ptr [rip + 0x19853e5], rdx ; 0x102033918
0x1006ae533: mov qword ptr [rip + 0x19853e6], rax ; 0x102033920
0x1006ae53a: lea rdx, [rip + 0x4b67c9] ; 0x100b64d0a OnLevelLoadLate
0x1006ae541: mov qword ptr [rip + 0x19853e0], rdx ; 0x102033928
0x1006ae548: lea rsi, [rip + 0x19853d9] ; 0x102033928
0x1006ae54f: mov qword ptr [rip + 0x19853d6], 0 ; 0x102033930
0x1006ae55a: mov qword ptr [rip + 0x19853d7], rcx ; 0x102033938
0x1006ae561: lea rcx, [rip - 0xc088] ; 0x1006a24e0
0x1006ae568: vmovq xmm0, rcx
0x1006ae56d: vmovdqu xmmword ptr [rip + 0x19853eb], xmm0 ; 0x102033960
0x1006ae575: mov rcx, qword ptr [rip + 0x557134] ; 0x100c056b0 -> 0x1006acf00 __Z12ApplyWrapperI11TerrainBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1006ae57c: mov qword ptr [rip + 0x19853ed], rcx ; 0x102033970
0x1006ae583: mov rdx, qword ptr [rip + 0x55a9b6] ; 0x100c08f40 -> 0x1006acf60 __Z21InitFunctionSignatureIM11TerrainBarnFvvEEvP17FunctionSignature
0x1006ae58a: mov qword ptr [rip + 0x19853e7], rdx ; 0x102033978
0x1006ae591: mov qword ptr [rip + 0x19853e8], rax ; 0x102033980
0x1006ae598: lea rdi, [rip + 0x4b24bc] ; 0x100b60a5b OnLevelUnload
0x1006ae59f: mov qword ptr [rip + 0x19853e2], rdi ; 0x102033988
0x1006ae5a6: lea rdi, [rip + 0x19853db] ; 0x102033988
0x1006ae5ad: mov qword ptr [rip + 0x19853d8], 0 ; 0x102033990
0x1006ae5b8: mov qword ptr [rip + 0x19853d9], rsi ; 0x102033998
0x1006ae5bf: lea rsi, [rip - 0xc0d6] ; 0x1006a24f0
0x1006ae5c6: vmovq xmm0, rsi
0x1006ae5cb: vmovdqu xmmword ptr [rip + 0x19853ed], xmm0 ; 0x1020339c0
0x1006ae5d3: mov qword ptr [rip + 0x19853f6], r10 ; 0x1020339d0
0x1006ae5da: mov qword ptr [rip + 0x19853f7], r11 ; 0x1020339d8
0x1006ae5e1: mov qword ptr [rip + 0x19853f8], rax ; 0x1020339e0
0x1006ae5e8: lea rsi, [rip + 0x4ae35e] ; 0x100b5c94d Update
0x1006ae5ef: mov qword ptr [rip + 0x19853f2], rsi ; 0x1020339e8
0x1006ae5f6: lea rsi, [rip + 0x19853eb] ; 0x1020339e8
0x1006ae5fd: mov qword ptr [rip + 0x19853e8], 0 ; 0x1020339f0
0x1006ae608: mov qword ptr [rip + 0x19853e9], rdi ; 0x1020339f8
0x1006ae60f: lea rdi, [rip - 0xbfe6] ; 0x1006a2630
0x1006ae616: vmovq xmm0, rdi
0x1006ae61b: vmovdqu xmmword ptr [rip + 0x19853fd], xmm0 ; 0x102033a20
0x1006ae623: mov rdi, qword ptr [rip + 0x557076] ; 0x100c056a0 -> 0x1006acf80 __Z12ApplyWrapperI11TerrainBarnMS0_FvP6CameraP10VisibilityP7JobBarnEEvM9VoidClassFvvEPv8VariablePSD_j
0x1006ae62a: mov qword ptr [rip + 0x19853ff], rdi ; 0x102033a30
0x1006ae631: mov rdi, qword ptr [rip + 0x55a8f8] ; 0x100c08f30 -> 0x1006acf90 __Z21InitFunctionSignatureIM11TerrainBarnFvP6CameraP10VisibilityP7JobBarnEEvP17FunctionSignature
0x1006ae638: mov qword ptr [rip + 0x19853f9], rdi ; 0x102033a38
0x1006ae63f: mov qword ptr [rip + 0x19853fa], rax ; 0x102033a40
0x1006ae646: lea rdi, [rip + 0x4b37c0] ; 0x100b61e0d BuildScene
0x1006ae64d: mov qword ptr [rip + 0x19853f4], rdi ; 0x102033a48
0x1006ae654: lea rdi, [rip + 0x19853ed] ; 0x102033a48
0x1006ae65b: mov qword ptr [rip + 0x19853ea], 0 ; 0x102033a50
0x1006ae666: mov qword ptr [rip + 0x19853eb], rsi ; 0x102033a58
0x1006ae66d: lea rsi, [rip - 0x9fe4] ; 0x1006a4690
0x1006ae674: vmovq xmm0, rsi
0x1006ae679: vmovdqu xmmword ptr [rip + 0x19853ff], xmm0 ; 0x102033a80
0x1006ae681: mov qword ptr [rip + 0x1985408], rcx ; 0x102033a90
0x1006ae688: mov qword ptr [rip + 0x1985409], rdx ; 0x102033a98
0x1006ae68f: mov qword ptr [rip + 0x198540a], rax ; 0x102033aa0
0x1006ae696: lea rcx, [rip + 0x4b3764] ; 0x100b61e01 RenderFlush
0x1006ae69d: mov qword ptr [rip + 0x1985404], rcx ; 0x102033aa8
0x1006ae6a4: lea rcx, [rip + 0x19853fd] ; 0x102033aa8
0x1006ae6ab: mov qword ptr [rip + 0x19853fa], 0 ; 0x102033ab0
0x1006ae6b6: mov qword ptr [rip + 0x19853fb], rdi ; 0x102033ab8
0x1006ae6bd: mov qword ptr [rip + 0x5c189c], rcx ; 0x100c6ff60
0x1006ae6c4: lea rcx, [rip - 0x9f0b] ; 0x1006a47c0
0x1006ae6cb: vmovq xmm0, rcx
0x1006ae6d0: vmovdqu xmmword ptr [rip + 0x1985408], xmm0 ; 0x102033ae0
0x1006ae6d8: mov qword ptr [rip + 0x1985411], r8 ; 0x102033af0
0x1006ae6df: mov qword ptr [rip + 0x1985412], r9 ; 0x102033af8
0x1006ae6e6: mov qword ptr [rip + 0x1985413], rax ; 0x102033b00
0x1006ae6ed: lea rdi, [rip + 0x6834bc] ; 0x100d31bb0
0x1006ae6f4: lea rsi, [rip + 0x198540d] ; 0x102033b08
0x1006ae6fb: lea rdx, [rip + 0x4d83b3] ; 0x100b86ab5 tag_Terrain
0x1006ae702: call 0x1007951b0 ; 0x1007951b0
0x1006ae707: lea rdi, [rip + 0x6834ba] ; 0x100d31bc8
0x1006ae70e: lea rsi, [rip + 0x19853fb] ; 0x102033b10
0x1006ae715: lea rdx, [rip + 0x4eb34d] ; 0x100b99a69 tag_TerrainBins
0x1006ae71c: call 0x1007951b0 ; 0x1007951b0
0x1006ae721: lea rdi, [rip + 0x6834b8] ; 0x100d31be0
0x1006ae728: lea rsi, [rip + 0x19853e9] ; 0x102033b18
0x1006ae72f: lea rdx, [rip + 0x4eb343] ; 0x100b99a79 tag_TessScratch
0x1006ae736: call 0x1007951b0 ; 0x1007951b0
0x1006ae73b: lea rdi, [rip + 0x6834b6] ; 0x100d31bf8
0x1006ae742: lea rsi, [rip + 0x19853d7] ; 0x102033b20
0x1006ae749: lea rdx, [rip + 0x4eb339] ; 0x100b99a89 tag_TessVerts
0x1006ae750: call 0x1007951b0 ; 0x1007951b0
0x1006ae755: lea rdi, [rip + 0x6834b4] ; 0x100d31c10
0x1006ae75c: lea rsi, [rip + 0x19853c5] ; 0x102033b28
0x1006ae763: lea rdx, [rip + 0x4eb32d] ; 0x100b99a97 tag_TessIndices
0x1006ae76a: call 0x1007951b0 ; 0x1007951b0
0x1006ae76f: lea rdi, [rip + 0x6834b2] ; 0x100d31c28
0x1006ae776: lea rsi, [rip + 0x19853b3] ; 0x102033b30
0x1006ae77d: lea rdx, [rip + 0x4eb323] ; 0x100b99aa7 tag_TerrainMaterialBins
0x1006ae784: call 0x1007951b0 ; 0x1007951b0
0x1006ae789: lea rdi, [rip + 0x6834b0] ; 0x100d31c40
0x1006ae790: lea rsi, [rip + 0x19853a1] ; 0x102033b38
0x1006ae797: lea rdx, [rip + 0x4eb321] ; 0x100b99abf tag_Scratch
0x1006ae79e: call 0x1007951b0 ; 0x1007951b0
0x1006ae7a3: lea rax, [rip + 0x4eb55b] ; 0x100b99d05 SetDebugPos
0x1006ae7aa: mov qword ptr [rip + 0x198538f], rax ; 0x102033b40
0x1006ae7b1: lea rax, [rip + 0x1985388] ; 0x102033b40
0x1006ae7b8: mov rcx, qword ptr [rip + 0x5c3011] ; 0x100c717d0
0x1006ae7bf: mov qword ptr [rip + 0x198538a], rcx ; 0x102033b50
0x1006ae7c6: lea rcx, [rip - 0x831d] ; 0x1006a64b0
0x1006ae7cd: mov qword ptr [rip + 0x19853a4], rcx ; 0x102033b78
0x1006ae7d4: mov rcx, qword ptr [rip + 0x55835d] ; 0x100c06b38 -> 0x100019a30 __Z12ApplyWrapperIPFvP4GameEEvPFvvE8VariablePS6_j
0x1006ae7db: mov qword ptr [rip + 0x198539e], rcx ; 0x102033b80
0x1006ae7e2: mov rdx, qword ptr [rip + 0x55bbdf] ; 0x100c0a3c8 -> 0x100019ab0 __Z21InitFunctionSignatureIPFvP4GameEEvP17FunctionSignature
0x1006ae7e9: mov qword ptr [rip + 0x1985398], rdx ; 0x102033b88
0x1006ae7f0: vmovaps xmm0, xmmword ptr [rbp - 0x10]
0x1006ae7f5: vmovaps xmmword ptr [rip + 0x1985393], xmm0 ; 0x102033b90
0x1006ae7fd: lea rsi, [rip + 0x198538c] ; 0x102033b90
0x1006ae804: mov qword ptr [rip + 0x1985391], 0 ; 0x102033ba0
0x1006ae80f: mov qword ptr [rip + 0x1985332], rsi ; 0x102033b48
0x1006ae816: lea rsi, [rip + 0x4eb55d] ; 0x100b99d7a TessellationTest
0x1006ae81d: mov qword ptr [rip + 0x1985384], rsi ; 0x102033ba8
0x1006ae824: lea rsi, [rip + 0x198537d] ; 0x102033ba8
0x1006ae82b: mov qword ptr [rip + 0x1985386], rax ; 0x102033bb8
0x1006ae832: mov qword ptr [rip + 0x5c2f97], rsi ; 0x100c717d0
0x1006ae839: lea rax, [rip - 0x8030] ; 0x1006a6810
0x1006ae840: mov qword ptr [rip + 0x1985399], rax ; 0x102033be0
0x1006ae847: mov qword ptr [rip + 0x198539a], rcx ; 0x102033be8
0x1006ae84e: mov qword ptr [rip + 0x198539b], rdx ; 0x102033bf0
0x1006ae855: vmovaps xmmword ptr [rip + 0x19853a3], xmm0 ; 0x102033c00
0x1006ae85d: lea rax, [rip + 0x198539c] ; 0x102033c00
0x1006ae864: mov qword ptr [rip + 0x19853a1], 0 ; 0x102033c10
0x1006ae86f: mov qword ptr [rip + 0x198533a], rax ; 0x102033bb0
0x1006ae876: lea rax, [rip + 0x4eb535] ; 0x100b99db2 TessBinJob
0x1006ae87d: mov qword ptr [rip + 0x198539c], rax ; 0x102033c20
0x1006ae884: lea rax, [rip + 0x198538d] ; 0x102033c18
0x1006ae88b: mov qword ptr [rip + 0x1985392], 0 ; 0x102033c28
0x1006ae896: mov rcx, qword ptr [rip + 0x5c16bb] ; 0x100c6ff58
0x1006ae89d: mov qword ptr [rip + 0x198538c], rcx ; 0x102033c30
0x1006ae8a4: mov qword ptr [rip + 0x5c16ad], rax ; 0x100c6ff58
0x1006ae8ab: mov qword ptr [rip + 0x198538e], rax ; 0x102033c40
0x1006ae8b2: mov rax, qword ptr [rip + 0x559c5f] ; 0x100c08518 -> 0x100065ff0 __Z18GetMetaClassByTypeIP3JobERK9MetaClassv
0x1006ae8b9: mov qword ptr [rip + 0x1985388], rax ; 0x102033c48
0x1006ae8c0: mov dword ptr [rip + 0x1985386], 0xffffffff ; 0x102033c50
0x1006ae8ca: mov dword ptr [rip + 0x1985380], 0xffffffff ; 0x102033c54
0x1006ae8d4: mov qword ptr [rip + 0x1985391], 0 ; 0x102033c70
0x1006ae8df: mov rax, qword ptr [rip + 0x55c292] ; 0x100c0ab78
0x1006ae8e6: add rax, 0x10
0x1006ae8ea: mov qword ptr [rip + 0x1985327], rax ; 0x102033c18
0x1006ae8f1: xor eax, eax
0x1006ae8f3: add rsp, 0x10
0x1006ae8f7: pop rbp
0x1006ae8f8: jmp 0x100011c10 ; 0x100011c10
0x1006ae8fd: nop 
0x1006ae8fe: nop 
0x1006ae8ff: nop 
