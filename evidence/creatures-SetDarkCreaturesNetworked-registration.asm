0x100274760: push rbp
0x100274761: mov rbp, rsp
0x100274764: push r15
0x100274766: push r14
0x100274768: push r13
0x10027476a: push r12
0x10027476c: push rbx
0x10027476d: sub rsp, 0x58
0x100274771: mov dword ptr [rip + 0xab6ca5], 0 ; 0x100d2b420
0x10027477b: lea rax, [rip + 0x9082de] ; 0x100b7ca60 DarkCreatureBarn
0x100274782: mov qword ptr [rip + 0x1b72a1f], rax ; 0x101de71a8
0x100274789: lea rax, [rip + 0x1b72a10] ; 0x101de71a0
0x100274790: mov qword ptr [rip + 0x1b72a15], 0 ; 0x101de71b0
0x10027479b: mov rcx, qword ptr [rip + 0x9fb7b6] ; 0x100c6ff58
0x1002747a2: mov qword ptr [rip + 0x1b72a0f], rcx ; 0x101de71b8
0x1002747a9: mov qword ptr [rip + 0x9fb7a8], rax ; 0x100c6ff58
0x1002747b0: mov qword ptr [rip + 0x1b72a11], rax ; 0x101de71c8
0x1002747b7: mov rax, qword ptr [rip + 0x993ef2] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1002747be: mov qword ptr [rip + 0x1b72a0b], rax ; 0x101de71d0
0x1002747c5: mov qword ptr [rip + 0x1b72a08], 0xffffffffffffffff ; 0x101de71d8
0x1002747d0: mov qword ptr [rip + 0x1b72a1d], 0 ; 0x101de71f8
0x1002747db: mov rax, qword ptr [rip + 0x997106] ; 0x100c0b8e8
0x1002747e2: add rax, 0x10
0x1002747e6: mov qword ptr [rip + 0x1b729b3], rax ; 0x101de71a0
0x1002747ed: xor eax, eax
0x1002747ef: call 0x100011c10 ; 0x100011c10
0x1002747f4: lea rax, [rip + 0x8e8152] ; 0x100b5c94d Update
0x1002747fb: mov qword ptr [rip + 0x1b729fe], rax ; 0x101de7200
0x100274802: lea rcx, [rip + 0x1b729f7] ; 0x101de7200
0x100274809: mov qword ptr [rip + 0x1b729f4], 0 ; 0x101de7208
0x100274814: mov rax, qword ptr [rip + 0x9fb745] ; 0x100c6ff60
0x10027481b: mov qword ptr [rip + 0x1b729ee], rax ; 0x101de7210
0x100274822: lea rax, [rip - 0x8c69] ; 0x10026bbc0
0x100274829: vmovq xmm0, rax
0x10027482e: vmovdqu xmmword ptr [rip + 0x1b72a02], xmm0 ; 0x101de7238
0x100274836: mov rax, qword ptr [rip + 0x99159b] ; 0x100c05dd8 -> 0x1002723f0 __Z12ApplyWrapperI16DarkCreatureBarnMS0_FvP8GameTimeP10AvatarBarnP7BubBarnP11EmitterBarnP9FlameBarnP10BirdV2BarnP9ShoutBarnP16CollisionGeoBarnP10LightHouseP12SoundManagerP15ResourceManagerP12CameraSystemP9NetModuleP14LevelStateBarnP17EnvironmentForcesP4GameEEvM9VoidClassFvvEPv8VariablePS13_j
0x10027483d: mov qword ptr [rip + 0x1b72a04], rax ; 0x101de7248
0x100274844: mov rax, qword ptr [rip + 0x994e1d] ; 0x100c09668 -> 0x100272400 __Z21InitFunctionSignatureIM16DarkCreatureBarnFvP8GameTimeP10AvatarBarnP7BubBarnP11EmitterBarnP9FlameBarnP10BirdV2BarnP9ShoutBarnP16CollisionGeoBarnP10LightHouseP12SoundManagerP15ResourceManagerP12CameraSystemP9NetModuleP14LevelStateBarnP17EnvironmentForcesP4GameEEvP17FunctionSignature
0x10027484b: mov qword ptr [rip + 0x1b729fe], rax ; 0x101de7250
0x100274852: mov rax, qword ptr [rip + 0x993797] ; 0x100c07ff0 -> 0x100272190 __Z18GetMetaClassByTypeIP16DarkCreatureBarnERK9MetaClassv
0x100274859: mov qword ptr [rip + 0x1b729f8], rax ; 0x101de7258
0x100274860: lea rdx, [rip + 0x8ec1de] ; 0x100b60a45 OnLevelLoad
0x100274867: mov qword ptr [rip + 0x1b729f2], rdx ; 0x101de7260
0x10027486e: lea rdx, [rip + 0x1b729eb] ; 0x101de7260
0x100274875: mov qword ptr [rip + 0x1b729e8], 0 ; 0x101de7268
0x100274880: mov qword ptr [rip + 0x1b729e9], rcx ; 0x101de7270
0x100274887: lea rcx, [rip - 0x867e] ; 0x10026c210
0x10027488e: vmovq xmm0, rcx
0x100274893: vmovdqu xmmword ptr [rip + 0x1b729fd], xmm0 ; 0x101de7298
0x10027489b: mov rcx, qword ptr [rip + 0x99153e] ; 0x100c05de0 P)'
0x1002748a2: mov qword ptr [rip + 0x1b729ff], rcx ; 0x101de72a8
0x1002748a9: mov rcx, qword ptr [rip + 0x994dc0] ; 0x100c09670 `)'
0x1002748b0: mov qword ptr [rip + 0x1b729f9], rcx ; 0x101de72b0
0x1002748b7: mov qword ptr [rip + 0x1b729fa], rax ; 0x101de72b8
0x1002748be: lea rcx, [rip + 0x8ec196] ; 0x100b60a5b OnLevelUnload
0x1002748c5: mov qword ptr [rip + 0x1b729f4], rcx ; 0x101de72c0
0x1002748cc: lea rcx, [rip + 0x1b729ed] ; 0x101de72c0
0x1002748d3: mov qword ptr [rip + 0x1b729ea], 0 ; 0x101de72c8
0x1002748de: mov qword ptr [rip + 0x1b729eb], rdx ; 0x101de72d0
0x1002748e5: lea rdx, [rip - 0x85dc] ; 0x10026c310
0x1002748ec: vmovq xmm0, rdx
0x1002748f1: vmovdqu xmmword ptr [rip + 0x1b729ff], xmm0 ; 0x101de72f8
0x1002748f9: mov rdx, qword ptr [rip + 0x9914e8] ; 0x100c05de8 -> 0x100272c10 __Z12ApplyWrapperI16DarkCreatureBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x100274900: mov qword ptr [rip + 0x1b72a01], rdx ; 0x101de7308
0x100274907: mov rdx, qword ptr [rip + 0x994d6a] ; 0x100c09678 p,'
0x10027490e: mov qword ptr [rip + 0x1b729fb], rdx ; 0x101de7310
0x100274915: mov qword ptr [rip + 0x1b729fc], rax ; 0x101de7318
0x10027491c: lea rdx, [rip + 0x90814e] ; 0x100b7ca71 CreateDarkCreature
0x100274923: mov qword ptr [rip + 0x1b729f6], rdx ; 0x101de7320
0x10027492a: lea rdx, [rip + 0x1b729ef] ; 0x101de7320
0x100274931: mov qword ptr [rip + 0x1b729f8], rcx ; 0x101de7330
0x100274938: lea rcx, [rip - 0x860f] ; 0x10026c330
0x10027493f: vmovq xmm0, rcx
0x100274944: vmovdqu xmmword ptr [rip + 0x1b72a0c], xmm0 ; 0x101de7358
0x10027494c: mov rcx, qword ptr [rip + 0x99146d] ; 0x100c05dc0 -> 0x100272c90 __Z12ApplyWrapperI16DarkCreatureBarnMS0_FP12DarkCreaturePK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x100274953: mov qword ptr [rip + 0x1b72a0e], rcx ; 0x101de7368
0x10027495a: mov rcx, qword ptr [rip + 0x994cef] ; 0x100c09650 P-'
0x100274961: mov qword ptr [rip + 0x1b72a08], rcx ; 0x101de7370
0x100274968: mov qword ptr [rip + 0x1b72a09], rax ; 0x101de7378
0x10027496f: lea r12, [rip + 0x90810e] ; 0x100b7ca84 DarkCreature
0x100274976: lea rcx, [rip + 0x90274b] ; 0x100b770c8 ObjectFactory_CreatesType
0x10027497d: vmovq xmm0, rcx
0x100274982: vmovq xmm1, r12
0x100274987: vmovdqa xmmword ptr [rbp - 0x60], xmm1
0x10027498c: vpunpcklqdq xmm1, xmm0, xmm1
0x100274990: vmovdqa xmmword ptr [rip + 0x1b729e8], xmm1 ; 0x101de7380
0x100274998: lea rcx, [rip + 0x1b729e1] ; 0x101de7380
0x10027499f: mov qword ptr [rip + 0x1b729e6], 0 ; 0x101de7390
0x1002749aa: mov qword ptr [rip + 0x1b72977], rcx ; 0x101de7328
0x1002749b1: lea rcx, [rip + 0x9080d9] ; 0x100b7ca91 CreateSmallDarkCreature
0x1002749b8: mov qword ptr [rip + 0x1b729d9], rcx ; 0x101de7398
0x1002749bf: lea rcx, [rip + 0x1b729d2] ; 0x101de7398
0x1002749c6: mov qword ptr [rip + 0x1b729db], rdx ; 0x101de73a8
0x1002749cd: lea rdx, [rip - 0x8664] ; 0x10026c370
0x1002749d4: vmovq xmm1, rdx
0x1002749d9: vmovdqu xmmword ptr [rip + 0x1b729ef], xmm1 ; 0x101de73d0
0x1002749e1: mov rdx, qword ptr [rip + 0x9913e0] ; 0x100c05dc8 -> 0x100272dd0 __Z12ApplyWrapperI16DarkCreatureBarnMS0_FP17SmallDarkCreaturePK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x1002749e8: mov qword ptr [rip + 0x1b729f1], rdx ; 0x101de73e0
0x1002749ef: mov rdx, qword ptr [rip + 0x994c62] ; 0x100c09658 -> 0x100272e90 __Z21InitFunctionSignatureIM16DarkCreatureBarnFP17SmallDarkCreaturePK9MetaClassEEvP17FunctionSignature
0x1002749f6: mov qword ptr [rip + 0x1b729eb], rdx ; 0x101de73e8
0x1002749fd: mov qword ptr [rip + 0x1b729ec], rax ; 0x101de73f0
0x100274a04: lea rdx, [rip + 0x90809e] ; 0x100b7caa9 SmallDarkCreature
0x100274a0b: vmovq xmm1, rdx
0x100274a10: vpunpcklqdq xmm1, xmm0, xmm1
0x100274a14: vmovdqa xmmword ptr [rip + 0x1b729e4], xmm1 ; 0x101de7400
0x100274a1c: lea rdx, [rip + 0x1b729dd] ; 0x101de7400
0x100274a23: mov qword ptr [rip + 0x1b729e2], 0 ; 0x101de7410
0x100274a2e: mov qword ptr [rip + 0x1b7296b], rdx ; 0x101de73a0
0x100274a35: lea rdx, [rip + 0x90807f] ; 0x100b7cabb CreateSmallDarkCreatureZone
0x100274a3c: mov qword ptr [rip + 0x1b729d5], rdx ; 0x101de7418
0x100274a43: lea rdx, [rip + 0x1b729ce] ; 0x101de7418
0x100274a4a: mov qword ptr [rip + 0x1b729d7], rcx ; 0x101de7428
0x100274a51: mov qword ptr [rip + 0x9fb508], rdx ; 0x100c6ff60
0x100274a58: lea rcx, [rip - 0x869f] ; 0x10026c3c0
0x100274a5f: vmovq xmm1, rcx
0x100274a64: vmovdqu xmmword ptr [rip + 0x1b729e4], xmm1 ; 0x101de7450
0x100274a6c: mov rcx, qword ptr [rip + 0x99135d] ; 0x100c05dd0 -> 0x100272f10 __Z12ApplyWrapperI16DarkCreatureBarnMS0_FP21SmallDarkCreatureZonePK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x100274a73: mov qword ptr [rip + 0x1b729e6], rcx ; 0x101de7460
0x100274a7a: mov rcx, qword ptr [rip + 0x994bdf] ; 0x100c09660 -> 0x100272fd0 __Z21InitFunctionSignatureIM16DarkCreatureBarnFP21SmallDarkCreatureZonePK9MetaClassEEvP17FunctionSignature
0x100274a81: mov qword ptr [rip + 0x1b729e0], rcx ; 0x101de7468
0x100274a88: mov qword ptr [rip + 0x1b729e1], rax ; 0x101de7470
0x100274a8f: lea rax, [rip + 0x908041] ; 0x100b7cad7 SmallDarkCreatureZone
0x100274a96: vmovq xmm1, rax
0x100274a9b: vpunpcklqdq xmm0, xmm0, xmm1
0x100274a9f: vmovdqa xmmword ptr [rip + 0x1b729d9], xmm0 ; 0x101de7480
0x100274aa7: lea rax, [rip + 0x1b729d2] ; 0x101de7480
0x100274aae: mov qword ptr [rip + 0x1b729d7], 0 ; 0x101de7490
0x100274ab9: mov qword ptr [rip + 0x1b72960], rax ; 0x101de7420
0x100274ac0: lea rax, [rip + 0x908026] ; 0x100b7caed DarkCreatureParams
0x100274ac7: mov qword ptr [rip + 0x1b729d2], rax ; 0x101de74a0
0x100274ace: lea rax, [rip + 0x1b729c3] ; 0x101de7498
0x100274ad5: mov qword ptr [rip + 0x1b729c8], 0 ; 0x101de74a8
0x100274ae0: mov rcx, qword ptr [rip + 0x9fb471] ; 0x100c6ff58
0x100274ae7: mov qword ptr [rip + 0x1b729c2], rcx ; 0x101de74b0
0x100274aee: mov qword ptr [rip + 0x9fb463], rax ; 0x100c6ff58
0x100274af5: mov qword ptr [rip + 0x1b729c4], rax ; 0x101de74c0
0x100274afc: mov rax, qword ptr [rip + 0x993705] ; 0x100c08208 -> 0x1001a67e0 __Z18GetMetaClassByTypeIP18LevelAllocatedDataERK9MetaClassv
0x100274b03: mov qword ptr [rip + 0x1b729be], rax ; 0x101de74c8
0x100274b0a: mov dword ptr [rip + 0x1b729bc], 0xffffffff ; 0x101de74d0
0x100274b14: mov dword ptr [rip + 0x1b729b6], 0xffffffff ; 0x101de74d4
0x100274b1e: mov qword ptr [rip + 0x1b729c7], 0 ; 0x101de74f0
0x100274b29: mov rax, qword ptr [rip + 0x997160] ; 0x100c0bc90
0x100274b30: add rax, 0x10
0x100274b34: mov qword ptr [rip + 0x1b7295d], rax ; 0x101de7498
0x100274b3b: xor eax, eax
0x100274b3d: call 0x100011c10 ; 0x100011c10
0x100274b42: lea rax, [rip + 0x8eb4f3] ; 0x100b6003c Tool_Export
0x100274b49: vmovq xmm1, rax
0x100274b4e: lea rax, [rip + 0x8e9e8a] ; 0x100b5e9df true
0x100274b55: vmovq xmm0, rax
0x100274b5a: vpunpcklqdq xmm1, xmm1, xmm0
0x100274b5e: vmovdqa xmmword ptr [rbp - 0x70], xmm1
0x100274b63: vmovdqa xmmword ptr [rip + 0x1b72995], xmm1 ; 0x101de7500
0x100274b6b: lea rax, [rip + 0x1b7298e] ; 0x101de7500
0x100274b72: mov rcx, qword ptr [rip + 0x1b7292f] ; 0x101de74a8
0x100274b79: mov qword ptr [rip + 0x1b72990], rcx ; 0x101de7510
0x100274b80: mov qword ptr [rip + 0x1b72921], rax ; 0x101de74a8
0x100274b87: lea rax, [rip + 0x907f72] ; 0x100b7cb00 startInRest
0x100274b8e: mov qword ptr [rip + 0xa28c5b], rax ; 0x100c9d7f0
0x100274b95: lea rcx, [rip + 0xa28c54] ; 0x100c9d7f0
0x100274b9c: mov rax, qword ptr [rip + 0xa030bd] ; 0x100c77c60
0x100274ba3: mov qword ptr [rip + 0xa28c56], rax ; 0x100c9d800
0x100274baa: mov qword ptr [rip + 0xa28c5b], 4 ; 0x100c9d810
0x100274bb5: mov r14, qword ptr [rip + 0x99299c] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x100274bbc: mov qword ptr [rip + 0xa28c55], r14 ; 0x100c9d818
0x100274bc3: mov rax, qword ptr [rip + 0x99361e] ; 0x100c081e8 -> 0x1002732f0 __Z18GetMetaClassByTypeIP18DarkCreatureParamsERK9MetaClassv
0x100274bca: mov qword ptr [rip + 0xa28c4f], rax ; 0x100c9d820
0x100274bd1: mov qword ptr [rip + 0xa28c4c], 0xffffffffffffffff ; 0x100c9d828
0x100274bdc: lea rbx, [rip - 0x25b1c3] ; 0x100019a20
0x100274be3: mov qword ptr [rip + 0xa28c46], rbx ; 0x100c9d830
0x100274bea: mov qword ptr [rip + 0xa28c43], 0 ; 0x100c9d838
0x100274bf5: lea rdx, [rip + 0x92e430] ; 0x100ba302c false
0x100274bfc: vmovq xmm2, rdx
0x100274c01: lea rdx, [rip + 0x8e9dfa] ; 0x100b5ea02 Tool_DefaultValue
0x100274c08: vmovq xmm1, rdx
0x100274c0d: vpunpcklqdq xmm2, xmm1, xmm2
0x100274c11: vmovdqa xmmword ptr [rip + 0x1b72907], xmm2 ; 0x101de7520
0x100274c19: lea rdx, [rip + 0x1b72900] ; 0x101de7520
0x100274c20: mov qword ptr [rip + 0x1b72905], 0 ; 0x101de7530
0x100274c2b: mov qword ptr [rip + 0xa28bc6], rdx ; 0x100c9d7f8
0x100274c32: lea rdx, [rip + 0x907ed3] ; 0x100b7cb0c canMoveBackwardsAlongRail
0x100274c39: mov qword ptr [rip + 0xa28c00], rdx ; 0x100c9d840
0x100274c40: lea rdx, [rip + 0xa28bf9] ; 0x100c9d840
0x100274c47: mov qword ptr [rip + 0xa28c02], rcx ; 0x100c9d850
0x100274c4e: mov qword ptr [rip + 0xa28c07], 5 ; 0x100c9d860
0x100274c59: mov qword ptr [rip + 0xa28c08], r14 ; 0x100c9d868
0x100274c60: mov qword ptr [rip + 0xa28c09], rax ; 0x100c9d870
0x100274c67: mov qword ptr [rip + 0xa28c06], 0xffffffffffffffff ; 0x100c9d878
0x100274c72: mov qword ptr [rip + 0xa28c07], rbx ; 0x100c9d880
0x100274c79: mov qword ptr [rip + 0xa28c04], 0 ; 0x100c9d888
0x100274c84: vmovdqa xmmword ptr [rip + 0x1b728b4], xmm2 ; 0x101de7540
0x100274c8c: lea rcx, [rip + 0x1b728ad] ; 0x101de7540
0x100274c93: mov qword ptr [rip + 0x1b728b2], 0 ; 0x101de7550
0x100274c9e: mov qword ptr [rip + 0xa28ba3], rcx ; 0x100c9d848
0x100274ca5: lea rcx, [rip + 0x904a20] ; 0x100b796cc networked
0x100274cac: mov qword ptr [rip + 0xa28bdd], rcx ; 0x100c9d890
0x100274cb3: lea rcx, [rip + 0xa28bd6] ; 0x100c9d890
0x100274cba: mov qword ptr [rip + 0xa28bdf], rdx ; 0x100c9d8a0
0x100274cc1: mov qword ptr [rip + 0xa28be4], 6 ; 0x100c9d8b0
0x100274ccc: mov qword ptr [rip + 0xa28be5], r14 ; 0x100c9d8b8
0x100274cd3: mov qword ptr [rip + 0xa28be6], rax ; 0x100c9d8c0
0x100274cda: mov qword ptr [rip + 0xa28be3], 0xffffffffffffffff ; 0x100c9d8c8
0x100274ce5: mov qword ptr [rip + 0xa28be4], rbx ; 0x100c9d8d0
0x100274cec: mov qword ptr [rip + 0xa28be1], 0 ; 0x100c9d8d8
0x100274cf7: vpunpcklqdq xmm2, xmm1, xmm0
0x100274cfb: vmovdqa xmmword ptr [rbp - 0x80], xmm2
0x100274d00: vmovdqa xmmword ptr [rip + 0x1b72858], xmm2 ; 0x101de7560
0x100274d08: lea rdx, [rip + 0x1b72851] ; 0x101de7560
0x100274d0f: mov qword ptr [rip + 0x1b72856], 0 ; 0x101de7570
0x100274d1a: mov qword ptr [rip + 0xa28b77], rdx ; 0x100c9d898
0x100274d21: lea rdx, [rip + 0x907dfe] ; 0x100b7cb26 cooldownTime
0x100274d28: mov qword ptr [rip + 0xa28bb1], rdx ; 0x100c9d8e0
0x100274d2f: lea rdx, [rip + 0xa28baa] ; 0x100c9d8e0
0x100274d36: mov qword ptr [rip + 0xa28bb3], rcx ; 0x100c9d8f0
0x100274d3d: mov qword ptr [rip + 0xa28bb8], 8 ; 0x100c9d900
0x100274d48: mov rcx, qword ptr [rip + 0x992811] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x100274d4f: mov qword ptr [rip + 0xa28bb2], rcx ; 0x100c9d908
0x100274d56: mov qword ptr [rip + 0xa28bb3], rax ; 0x100c9d910
0x100274d5d: mov qword ptr [rip + 0xa28bb0], 0xffffffffffffffff ; 0x100c9d918
0x100274d68: mov qword ptr [rip + 0xa28bb1], rbx ; 0x100c9d920
0x100274d6f: mov qword ptr [rip + 0xa28bae], 0 ; 0x100c9d928
0x100274d7a: lea rsi, [rip + 0x907db2] ; 0x100b7cb33 GameplayTimers
0x100274d81: vmovq xmm2, rsi
0x100274d86: lea rsi, [rip + 0x8ef802] ; 0x100b6458f Tool_Category
0x100274d8d: vmovq xmm3, rsi
0x100274d92: vpunpcklqdq xmm2, xmm3, xmm2
0x100274d96: vmovdqa xmmword ptr [rip + 0x1b727e2], xmm2 ; 0x101de7580
0x100274d9e: lea rsi, [rip + 0x1b727db] ; 0x101de7580
0x100274da5: mov qword ptr [rip + 0x1b727e0], 0 ; 0x101de7590
0x100274db0: lea rdi, [rip + 0x907d8b] ; 0x100b7cb42 30.0f
0x100274db7: vmovq xmm3, rdi
0x100274dbc: vpunpcklqdq xmm3, xmm1, xmm3
0x100274dc0: vmovdqa xmmword ptr [rip + 0x1b727d8], xmm3 ; 0x101de75a0
0x100274dc8: lea rdi, [rip + 0x1b727d1] ; 0x101de75a0
0x100274dcf: mov qword ptr [rip + 0x1b727da], rsi ; 0x101de75b0
0x100274dd6: mov qword ptr [rip + 0xa28b0b], rdi ; 0x100c9d8e8
0x100274ddd: lea rsi, [rip + 0x907d64] ; 0x100b7cb48 waitBeforeEyeOpenTime
0x100274de4: mov qword ptr [rip + 0xa28b45], rsi ; 0x100c9d930
0x100274deb: lea rsi, [rip + 0xa28b3e] ; 0x100c9d930
0x100274df2: mov qword ptr [rip + 0xa28b47], rdx ; 0x100c9d940
0x100274df9: mov qword ptr [rip + 0xa28b4c], 0xc ; 0x100c9d950
0x100274e04: mov qword ptr [rip + 0xa28b4d], rcx ; 0x100c9d958
0x100274e0b: mov qword ptr [rip + 0xa28b4e], rax ; 0x100c9d960
0x100274e12: mov qword ptr [rip + 0xa28b4b], 0xffffffffffffffff ; 0x100c9d968
0x100274e1d: mov qword ptr [rip + 0xa28b4c], rbx ; 0x100c9d970
0x100274e24: mov qword ptr [rip + 0xa28b49], 0 ; 0x100c9d978
0x100274e2f: vmovdqa xmmword ptr [rip + 0x1b72789], xmm2 ; 0x101de75c0
0x100274e37: lea rcx, [rip + 0x1b72782] ; 0x101de75c0
0x100274e3e: mov qword ptr [rip + 0x1b72787], 0 ; 0x101de75d0
0x100274e49: lea rdx, [rip + 0x907d0e] ; 0x100b7cb5e 7.5f
0x100274e50: vmovq xmm2, rdx
0x100274e55: vpunpcklqdq xmm2, xmm1, xmm2
0x100274e59: vmovdqa xmmword ptr [rip + 0x1b7277f], xmm2 ; 0x101de75e0
0x100274e61: lea rdx, [rip + 0x1b72778] ; 0x101de75e0
0x100274e68: mov qword ptr [rip + 0x1b72781], rcx ; 0x101de75f0
0x100274e6f: mov qword ptr [rip + 0xa28ac2], rdx ; 0x100c9d938
0x100274e76: lea rcx, [rip + 0x907ce6] ; 0x100b7cb63 patrolRail
0x100274e7d: mov qword ptr [rip + 0xa28afc], rcx ; 0x100c9d980
0x100274e84: lea rcx, [rip + 0xa28af5] ; 0x100c9d980
0x100274e8b: mov qword ptr [rip + 0xa28afe], rsi ; 0x100c9d990
0x100274e92: mov qword ptr [rip + 0xa28b03], 0x10 ; 0x100c9d9a0
0x100274e9d: mov rdx, qword ptr [rip + 0x992404] ; 0x100c072a8 -> 0x1000ec410 __Z17GetMetaTypeByTypeIP4RailERK8MetaTypev
0x100274ea4: mov qword ptr [rip + 0xa28afd], rdx ; 0x100c9d9a8
0x100274eab: mov qword ptr [rip + 0xa28afe], rax ; 0x100c9d9b0
0x100274eb2: mov qword ptr [rip + 0xa28afb], 0xffffffffffffffff ; 0x100c9d9b8
0x100274ebd: mov qword ptr [rip + 0xa28afc], rbx ; 0x100c9d9c0
0x100274ec4: mov qword ptr [rip + 0xa28af9], 0 ; 0x100c9d9c8
0x100274ecf: lea rsi, [rip + 0x8e9bc1] ; 0x100b5ea97 null
0x100274ed6: vmovq xmm2, rsi
0x100274edb: vpunpcklqdq xmm1, xmm1, xmm2
0x100274edf: vmovdqa xmmword ptr [rip + 0x1b72719], xmm1 ; 0x101de7600
0x100274ee7: lea rsi, [rip + 0x1b72712] ; 0x101de7600
0x100274eee: mov qword ptr [rip + 0x1b72717], 0 ; 0x101de7610
0x100274ef9: lea rdi, [rip + 0x8e9b19] ; 0x100b5ea19 Tool_Nullable
0x100274f00: vmovq xmm2, rdi
0x100274f05: vpunpcklqdq xmm0, xmm2, xmm0
0x100274f09: vmovdqa xmmword ptr [rip + 0x1b7270f], xmm0 ; 0x101de7620
0x100274f11: lea rdi, [rip + 0x1b72708] ; 0x101de7620
0x100274f18: mov qword ptr [rip + 0x1b72711], rsi ; 0x101de7630
0x100274f1f: mov qword ptr [rip + 0xa28a62], rdi ; 0x100c9d988
0x100274f26: lea rsi, [rip + 0x907c41] ; 0x100b7cb6e cooldownRail
0x100274f2d: mov qword ptr [rip + 0xa28a9c], rsi ; 0x100c9d9d0
0x100274f34: lea rsi, [rip + 0xa28a95] ; 0x100c9d9d0
0x100274f3b: mov qword ptr [rip + 0xa28a9e], rcx ; 0x100c9d9e0
0x100274f42: mov qword ptr [rip + 0xa02d17], rsi ; 0x100c77c60
0x100274f49: mov qword ptr [rip + 0xa28a9c], 0x18 ; 0x100c9d9f0
0x100274f54: mov qword ptr [rip + 0xa28a9d], rdx ; 0x100c9d9f8
0x100274f5b: mov qword ptr [rip + 0xa28a9e], rax ; 0x100c9da00
0x100274f62: mov qword ptr [rip + 0xa28a9b], 0xffffffffffffffff ; 0x100c9da08
0x100274f6d: mov qword ptr [rip + 0xa28a9c], rbx ; 0x100c9da10
0x100274f74: mov qword ptr [rip + 0xa28a99], 0 ; 0x100c9da18
0x100274f7f: vmovdqa xmmword ptr [rip + 0x1b726b9], xmm1 ; 0x101de7640
0x100274f87: lea rax, [rip + 0x1b726b2] ; 0x101de7640
0x100274f8e: mov qword ptr [rip + 0x1b726b7], 0 ; 0x101de7650
0x100274f99: vmovdqa xmmword ptr [rip + 0x1b726bf], xmm0 ; 0x101de7660
0x100274fa1: lea rcx, [rip + 0x1b726b8] ; 0x101de7660
0x100274fa8: mov qword ptr [rip + 0x1b726c1], rax ; 0x101de7670
0x100274faf: mov qword ptr [rip + 0xa28a22], rcx ; 0x100c9d9d8
0x100274fb6: mov qword ptr [rip + 0x1b726c3], r12 ; 0x101de7680
0x100274fbd: lea rax, [rip + 0x1b726b4] ; 0x101de7678
0x100274fc4: mov qword ptr [rip + 0x1b726b9], 0 ; 0x101de7688
0x100274fcf: mov rcx, qword ptr [rip + 0x9faf82] ; 0x100c6ff58
0x100274fd6: mov qword ptr [rip + 0x1b726b3], rcx ; 0x101de7690
0x100274fdd: mov qword ptr [rip + 0x9faf74], rax ; 0x100c6ff58
0x100274fe4: mov qword ptr [rip + 0x1b726b5], rax ; 0x101de76a0
0x100274feb: lea rax, [rip - 0x23f732] ; 0x1000358c0
0x100274ff2: mov qword ptr [rip + 0x1b726af], rax ; 0x101de76a8
0x100274ff9: mov dword ptr [rip + 0x1b726ad], 0xffffffff ; 0x101de76b0
0x100275003: mov dword ptr [rip + 0x1b726a7], 0xffffffff ; 0x101de76b4
0x10027500d: mov qword ptr [rip + 0x1b726b8], 0 ; 0x101de76d0
0x100275018: mov rax, qword ptr [rip + 0x995eb1] ; 0x100c0aed0
0x10027501f: add rax, 0x10
0x100275023: mov qword ptr [rip + 0x1b7264e], rax ; 0x101de7678
0x10027502a: xor eax, eax
0x10027502c: call 0x100011c10 ; 0x100011c10
0x100275031: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100275036: vmovaps xmmword ptr [rip + 0x1b726a2], xmm0 ; 0x101de76e0
0x10027503e: lea rax, [rip + 0x1b7269b] ; 0x101de76e0
0x100275045: mov rcx, qword ptr [rip + 0x1b7263c] ; 0x101de7688
0x10027504c: mov qword ptr [rip + 0x1b7269d], rcx ; 0x101de76f0
0x100275053: mov qword ptr [rip + 0x1b7262e], rax ; 0x101de7688
0x10027505a: lea rax, [rip + 0x8f605e] ; 0x100b6b0bf transform
0x100275061: mov qword ptr [rip + 0xa289b8], rax ; 0x100c9da20
0x100275068: lea rcx, [rip + 0xa289b1] ; 0x100c9da20
0x10027506f: mov qword ptr [rip + 0xa289ae], 0 ; 0x100c9da28
0x10027507a: mov rax, qword ptr [rip + 0xa02bdf] ; 0x100c77c60
0x100275081: mov qword ptr [rip + 0xa289a8], rax ; 0x100c9da30
0x100275088: mov qword ptr [rip + 0xa289ad], 0x10 ; 0x100c9da40
0x100275093: mov rax, qword ptr [rip + 0x991d2e] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x10027509a: mov qword ptr [rip + 0xa289a7], rax ; 0x100c9da48
0x1002750a1: mov rax, qword ptr [rip + 0x9928e0] ; 0x100c07988 -> 0x1002721a0 __Z18GetMetaClassByTypeIP12DarkCreatureERK9MetaClassv
0x1002750a8: mov qword ptr [rip + 0xa289a1], rax ; 0x100c9da50
0x1002750af: mov qword ptr [rip + 0xa2899e], 0xffffffffffffffff ; 0x100c9da58
0x1002750ba: mov qword ptr [rip + 0xa2899f], rbx ; 0x100c9da60
0x1002750c1: mov qword ptr [rip + 0xa2899c], 0 ; 0x100c9da68
0x1002750cc: lea rdx, [rip + 0x8ef384] ; 0x100b64457 params
0x1002750d3: mov qword ptr [rip + 0xa28996], rdx ; 0x100c9da70
0x1002750da: lea rdx, [rip + 0xa2898f] ; 0x100c9da70
0x1002750e1: mov qword ptr [rip + 0xa2898c], 0 ; 0x100c9da78
0x1002750ec: mov qword ptr [rip + 0xa2898d], rcx ; 0x100c9da80
0x1002750f3: mov qword ptr [rip + 0xa02b66], rdx ; 0x100c77c60
0x1002750fa: mov qword ptr [rip + 0xa2898b], 0x50 ; 0x100c9da90
0x100275105: mov rcx, qword ptr [rip + 0x992424] ; 0x100c07530 -> 0x1002737a0 __Z17GetMetaTypeByTypeIPK18DarkCreatureParamsERK8MetaTypev
0x10027510c: mov qword ptr [rip + 0xa28985], rcx ; 0x100c9da98
0x100275113: mov qword ptr [rip + 0xa28986], rax ; 0x100c9daa0
0x10027511a: mov qword ptr [rip + 0xa28983], 0xffffffffffffffff ; 0x100c9daa8
0x100275125: mov qword ptr [rip + 0xa28984], rbx ; 0x100c9dab0
0x10027512c: mov qword ptr [rip + 0xa28981], 0 ; 0x100c9dab8
0x100275137: lea rcx, [rip + 0x901f03] ; 0x100b77041 SetTransform
0x10027513e: mov qword ptr [rip + 0x1b725b3], rcx ; 0x101de76f8
0x100275145: lea rcx, [rip + 0x1b725ac] ; 0x101de76f8
0x10027514c: mov qword ptr [rip + 0x1b725a9], 0 ; 0x101de7700
0x100275157: mov rdx, qword ptr [rip + 0x9fae02] ; 0x100c6ff60
0x10027515e: mov qword ptr [rip + 0x1b725a3], rdx ; 0x101de7708
0x100275165: lea rdx, [rip - 0x8d1c] ; 0x10026c450
0x10027516c: vmovq xmm0, rdx
0x100275171: vmovdqu xmmword ptr [rip + 0x1b725b7], xmm0 ; 0x101de7730
0x100275179: mov rdx, qword ptr [rip + 0x9905a8] ; 0x100c05728 -> 0x1002737b0 __Z12ApplyWrapperI12DarkCreatureMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x100275180: mov qword ptr [rip + 0x1b725b9], rdx ; 0x101de7740
0x100275187: mov rdx, qword ptr [rip + 0x993e2a] ; 0x100c08fb8 P8'
0x10027518e: mov qword ptr [rip + 0x1b725b3], rdx ; 0x101de7748
0x100275195: mov qword ptr [rip + 0x1b725b4], rax ; 0x101de7750
0x10027519c: lea rdx, [rip + 0x8fe0bc] ; 0x100b7325f GetTransform
0x1002751a3: mov qword ptr [rip + 0x1b725ae], rdx ; 0x101de7758
0x1002751aa: lea rdx, [rip + 0x1b725a7] ; 0x101de7758
0x1002751b1: mov qword ptr [rip + 0x1b725a4], 0 ; 0x101de7760
0x1002751bc: mov qword ptr [rip + 0x1b725a5], rcx ; 0x101de7768
0x1002751c3: mov qword ptr [rip + 0x9fad96], rdx ; 0x100c6ff60
0x1002751ca: lea rcx, [rip - 0x8c91] ; 0x10026c540
0x1002751d1: vmovq xmm0, rcx
0x1002751d6: vmovdqu xmmword ptr [rip + 0x1b725b2], xmm0 ; 0x101de7790
0x1002751de: mov rcx, qword ptr [rip + 0x99054b] ; 0x100c05730 -> 0x1002738d0 __Z12ApplyWrapperI12DarkCreatureMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x1002751e5: mov qword ptr [rip + 0x1b725b4], rcx ; 0x101de77a0
0x1002751ec: mov rcx, qword ptr [rip + 0x993dcd] ; 0x100c08fc0 `9'
0x1002751f3: mov qword ptr [rip + 0x1b725ae], rcx ; 0x101de77a8
0x1002751fa: mov qword ptr [rip + 0x1b725af], rax ; 0x101de77b0
0x100275201: vmovaps xmm0, xmmword ptr [rip + 0x83f787] ; 0x100ab4990 333?
0x100275209: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10027520e: lea rdi, [rbp - 0x50]
0x100275212: lea rsi, [rbp - 0x40]
0x100275216: vmovss xmm0, dword ptr [rip + 0x83339a] ; 0x100aa85b8
0x10027521e: call 0x10077d310 ; 0x10077d310
0x100275223: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100275228: vmovaps xmmword ptr [rip + 0xab6200], xmm0 ; 0x100d2b430
0x100275230: vmovaps xmm0, xmmword ptr [rip + 0x83f768] ; 0x100ab49a0
0x100275238: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10027523d: lea rdi, [rbp - 0x50]
0x100275241: lea rsi, [rbp - 0x40]
0x100275245: vmovss xmm0, dword ptr [rip + 0x83336b] ; 0x100aa85b8
0x10027524d: call 0x10077d310 ; 0x10077d310
0x100275252: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100275257: vmovaps xmmword ptr [rip + 0xab61e1], xmm0 ; 0x100d2b440
0x10027525f: vmovaps xmm0, xmmword ptr [rip + 0x833799] ; 0x100aa8a00
0x100275267: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10027526c: lea rdi, [rbp - 0x50]
0x100275270: lea rsi, [rbp - 0x40]
0x100275274: vmovss xmm0, dword ptr [rip + 0x83333c] ; 0x100aa85b8
0x10027527c: call 0x10077d310 ; 0x10077d310
0x100275281: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100275286: vmovaps xmmword ptr [rip + 0xab61c2], xmm0 ; 0x100d2b450
0x10027528e: vmovaps xmm0, xmmword ptr [rip + 0x83f71a] ; 0x100ab49b0
0x100275296: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10027529b: lea rdi, [rbp - 0x50]
0x10027529f: lea rsi, [rbp - 0x40]
0x1002752a3: vmovss xmm0, dword ptr [rip + 0x83330d] ; 0x100aa85b8
0x1002752ab: call 0x10077d310 ; 0x10077d310
0x1002752b0: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1002752b5: vmovaps xmmword ptr [rip + 0xab61a3], xmm0 ; 0x100d2b460
0x1002752bd: mov dword ptr [rip + 0xab61a9], 0x3e32b8c3 ; 0x100d2b470
0x1002752c7: lea rax, [rip + 0x907abd] ; 0x100b7cd8b AwakenDarkCreatures
0x1002752ce: mov qword ptr [rip + 0x1b724eb], rax ; 0x101de77c0
0x1002752d5: lea rax, [rip + 0x1b724dc] ; 0x101de77b8
0x1002752dc: mov qword ptr [rip + 0x1b724e1], 0 ; 0x101de77c8
0x1002752e7: mov rcx, qword ptr [rip + 0x9fac6a] ; 0x100c6ff58
0x1002752ee: mov qword ptr [rip + 0x1b724db], rcx ; 0x101de77d0
0x1002752f5: mov qword ptr [rip + 0x9fac5c], rax ; 0x100c6ff58
0x1002752fc: mov qword ptr [rip + 0x1b724dd], rax ; 0x101de77e0
0x100275303: mov r15, qword ptr [rip + 0x9932de] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x10027530a: mov qword ptr [rip + 0x1b724d7], r15 ; 0x101de77e8
0x100275311: mov qword ptr [rip + 0x1b724d4], 0xffffffffffffffff ; 0x101de77f0
0x10027531c: mov qword ptr [rip + 0x1b724e9], 0 ; 0x101de7810
0x100275327: mov rax, qword ptr [rip + 0x996ab2] ; 0x100c0bde0
0x10027532e: add rax, 0x10
0x100275332: mov qword ptr [rip + 0x1b7247f], rax ; 0x101de77b8
0x100275339: xor eax, eax
0x10027533b: call 0x100011c10 ; 0x100011c10
0x100275340: lea r12, [rip + 0x907a58] ; 0x100b7cd9f creatures
0x100275347: mov qword ptr [rip + 0xa28772], r12 ; 0x100c9dac0
0x10027534e: lea rax, [rip + 0xa2876b] ; 0x100c9dac0
0x100275355: mov rcx, qword ptr [rip + 0xa02904] ; 0x100c77c60
0x10027535c: mov qword ptr [rip + 0xa2876d], rcx ; 0x100c9dad0
0x100275363: mov qword ptr [rip + 0xa028f6], rax ; 0x100c77c60
0x10027536a: mov qword ptr [rip + 0xa2876b], 0x38 ; 0x100c9dae0
0x100275375: mov r13, qword ptr [rip + 0x991f4c] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x10027537c: mov qword ptr [rip + 0xa28765], r13 ; 0x100c9dae8
0x100275383: mov rax, qword ptr [rip + 0x992f1e] ; 0x100c082a8 -> 0x100273da0 __Z18GetMetaClassByTypeIP19AwakenDarkCreaturesERK9MetaClassv
0x10027538a: mov qword ptr [rip + 0xa2875f], rax ; 0x100c9daf0
0x100275391: mov qword ptr [rip + 0xa2875c], 0xffffffffffffffff ; 0x100c9daf8
0x10027539c: mov qword ptr [rip + 0xa2875d], rbx ; 0x100c9db00
0x1002753a3: mov qword ptr [rip + 0xa2875a], 0 ; 0x100c9db08
0x1002753ae: lea rax, [rip + 0x8e9637] ; 0x100b5e9ec Tool_ClumpType
0x1002753b5: vmovq xmm0, rax
0x1002753ba: vpunpcklqdq xmm0, xmm0, xmmword ptr [rbp - 0x60]
0x1002753bf: vmovdqa xmmword ptr [rbp - 0x60], xmm0
0x1002753c4: vmovdqa xmmword ptr [rip + 0x1b72454], xmm0 ; 0x101de7820
0x1002753cc: lea rax, [rip + 0x1b7244d] ; 0x101de7820
0x1002753d3: mov qword ptr [rip + 0x1b72452], 0 ; 0x101de7830
0x1002753de: mov qword ptr [rip + 0xa286e3], rax ; 0x100c9dac8
0x1002753e5: lea rax, [rip + 0x9079bd] ; 0x100b7cda9 SetDarkCreaturesNetworked
0x1002753ec: mov qword ptr [rip + 0x1b7244d], rax ; 0x101de7840
0x1002753f3: lea rax, [rip + 0x1b7243e] ; 0x101de7838
0x1002753fa: mov qword ptr [rip + 0x1b72443], 0 ; 0x101de7848
0x100275405: mov rcx, qword ptr [rip + 0x9fab4c] ; 0x100c6ff58
0x10027540c: mov qword ptr [rip + 0x1b7243d], rcx ; 0x101de7850
0x100275413: mov qword ptr [rip + 0x9fab3e], rax ; 0x100c6ff58
0x10027541a: mov qword ptr [rip + 0x1b7243f], rax ; 0x101de7860
0x100275421: mov qword ptr [rip + 0x1b72440], r15 ; 0x101de7868
0x100275428: mov dword ptr [rip + 0x1b7243e], 0xffffffff ; 0x101de7870
0x100275432: mov dword ptr [rip + 0x1b72438], 0xffffffff ; 0x101de7874
0x10027543c: mov qword ptr [rip + 0x1b72449], 0 ; 0x101de7890
0x100275447: mov rax, qword ptr [rip + 0x996e02] ; 0x100c0c250
0x10027544e: add rax, 0x10
0x100275452: mov qword ptr [rip + 0x1b723df], rax ; 0x101de7838
0x100275459: xor eax, eax
0x10027545b: call 0x100011c10 ; 0x100011c10
0x100275460: mov qword ptr [rip + 0xa286a9], r12 ; 0x100c9db10
0x100275467: lea rax, [rip + 0xa286a2] ; 0x100c9db10
0x10027546e: mov rcx, qword ptr [rip + 0xa027eb] ; 0x100c77c60
0x100275475: mov qword ptr [rip + 0xa286a4], rcx ; 0x100c9db20
0x10027547c: mov qword ptr [rip + 0xa286a9], 0x38 ; 0x100c9db30
0x100275487: mov qword ptr [rip + 0xa286aa], r13 ; 0x100c9db38
0x10027548e: mov rcx, qword ptr [rip + 0x993033] ; 0x100c084c8 -> 0x100274190 __Z18GetMetaClassByTypeIP25SetDarkCreaturesNetworkedERK9MetaClassv
0x100275495: mov qword ptr [rip + 0xa286a4], rcx ; 0x100c9db40
0x10027549c: mov qword ptr [rip + 0xa286a1], 0xffffffffffffffff ; 0x100c9db48
0x1002754a7: mov qword ptr [rip + 0xa286a2], rbx ; 0x100c9db50
0x1002754ae: mov qword ptr [rip + 0xa2869f], 0 ; 0x100c9db58
0x1002754b9: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1002754be: vmovaps xmmword ptr [rip + 0x1b723da], xmm0 ; 0x101de78a0
0x1002754c6: lea rdx, [rip + 0x1b723d3] ; 0x101de78a0
0x1002754cd: mov qword ptr [rip + 0x1b723d8], 0 ; 0x101de78b0
0x1002754d8: mov qword ptr [rip + 0xa28639], rdx ; 0x100c9db18
0x1002754df: lea rdx, [rip + 0x9041e6] ; 0x100b796cc networked
0x1002754e6: mov qword ptr [rip + 0xa28673], rdx ; 0x100c9db60
0x1002754ed: lea rdx, [rip + 0xa2866c] ; 0x100c9db60
0x1002754f4: mov qword ptr [rip + 0xa28675], rax ; 0x100c9db70
0x1002754fb: mov qword ptr [rip + 0xa0275e], rdx ; 0x100c77c60
0x100275502: mov qword ptr [rip + 0xa28673], 0x40 ; 0x100c9db80
0x10027550d: mov qword ptr [rip + 0xa28674], r14 ; 0x100c9db88
0x100275514: mov qword ptr [rip + 0xa28675], rcx ; 0x100c9db90
0x10027551b: mov qword ptr [rip + 0xa28672], 0xffffffffffffffff ; 0x100c9db98
0x100275526: mov qword ptr [rip + 0xa28673], rbx ; 0x100c9dba0
0x10027552d: mov qword ptr [rip + 0xa28670], 0 ; 0x100c9dba8
0x100275538: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10027553d: vmovaps xmmword ptr [rip + 0x1b7237b], xmm0 ; 0x101de78c0
0x100275545: lea rax, [rip + 0x1b72374] ; 0x101de78c0
0x10027554c: mov qword ptr [rip + 0x1b72379], 0 ; 0x101de78d0
0x100275557: mov qword ptr [rip + 0xa2860a], rax ; 0x100c9db68
0x10027555e: lea rax, [rip + 0x90785e] ; 0x100b7cdc3 SetDarkCreaturesMusicFloat
0x100275565: mov qword ptr [rip + 0x1b72374], rax ; 0x101de78e0
0x10027556c: lea rax, [rip + 0x1b72365] ; 0x101de78d8
0x100275573: mov qword ptr [rip + 0x1b7236a], 0 ; 0x101de78e8
0x10027557e: mov rcx, qword ptr [rip + 0x9fa9d3] ; 0x100c6ff58
0x100275585: mov qword ptr [rip + 0x1b72364], rcx ; 0x101de78f0
0x10027558c: mov qword ptr [rip + 0x9fa9c5], rax ; 0x100c6ff58
0x100275593: mov qword ptr [rip + 0x1b72366], rax ; 0x101de7900
0x10027559a: mov qword ptr [rip + 0x1b72367], r15 ; 0x101de7908
0x1002755a1: mov dword ptr [rip + 0x1b72365], 0xffffffff ; 0x101de7910
0x1002755ab: mov dword ptr [rip + 0x1b7235f], 0xffffffff ; 0x101de7914
0x1002755b5: mov qword ptr [rip + 0x1b72370], 0 ; 0x101de7930
0x1002755c0: mov rax, qword ptr [rip + 0x996cd9] ; 0x100c0c2a0
0x1002755c7: add rax, 0x10
0x1002755cb: mov qword ptr [rip + 0x1b72306], rax ; 0x101de78d8
0x1002755d2: xor eax, eax
0x1002755d4: call 0x100011c10 ; 0x100011c10
0x1002755d9: lea rax, [rip + 0x9077fe] ; 0x100b7cdde musicValFloat
0x1002755e0: mov qword ptr [rip + 0xa285c9], rax ; 0x100c9dbb0
0x1002755e7: lea rax, [rip + 0xa285c2] ; 0x100c9dbb0
0x1002755ee: mov qword ptr [rip + 0xa285bf], 0 ; 0x100c9dbb8
0x1002755f9: mov rcx, qword ptr [rip + 0xa02660] ; 0x100c77c60
0x100275600: mov qword ptr [rip + 0xa285b9], rcx ; 0x100c9dbc0
0x100275607: mov qword ptr [rip + 0xa285be], 0x38 ; 0x100c9dbd0
0x100275612: mov rcx, qword ptr [rip + 0x991cbf] ; 0x100c072d8 -> 0x10003bf40 __Z17GetMetaTypeByTypeIP5FloatERK8MetaTypev
0x100275619: mov qword ptr [rip + 0xa285b8], rcx ; 0x100c9dbd8
0x100275620: mov rcx, qword ptr [rip + 0x992eb9] ; 0x100c084e0 PG'
0x100275627: mov qword ptr [rip + 0xa285b2], rcx ; 0x100c9dbe0
0x10027562e: mov qword ptr [rip + 0xa285af], 0xffffffffffffffff ; 0x100c9dbe8
0x100275639: mov qword ptr [rip + 0xa285b0], rbx ; 0x100c9dbf0
0x100275640: mov qword ptr [rip + 0xa285ad], 0 ; 0x100c9dbf8
0x10027564b: mov qword ptr [rip + 0xa285ae], r12 ; 0x100c9dc00
0x100275652: lea rdx, [rip + 0xa285a7] ; 0x100c9dc00
0x100275659: mov qword ptr [rip + 0xa285b0], rax ; 0x100c9dc10
0x100275660: mov qword ptr [rip + 0xa025f9], rdx ; 0x100c77c60
0x100275667: mov qword ptr [rip + 0xa285ae], 0x40 ; 0x100c9dc20
0x100275672: mov qword ptr [rip + 0xa285af], r13 ; 0x100c9dc28
0x100275679: mov qword ptr [rip + 0xa285b0], rcx ; 0x100c9dc30
0x100275680: mov qword ptr [rip + 0xa285ad], 0xffffffffffffffff ; 0x100c9dc38
0x10027568b: mov qword ptr [rip + 0xa285ae], rbx ; 0x100c9dc40
0x100275692: mov qword ptr [rip + 0xa285ab], 0 ; 0x100c9dc48
0x10027569d: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1002756a2: vmovaps xmmword ptr [rip + 0x1b72296], xmm0 ; 0x101de7940
0x1002756aa: lea rax, [rip + 0x1b7228f] ; 0x101de7940
0x1002756b1: mov qword ptr [rip + 0x1b72294], 0 ; 0x101de7950
0x1002756bc: mov qword ptr [rip + 0xa28545], rax ; 0x100c9dc08
0x1002756c3: add rsp, 0x58
0x1002756c7: pop rbx
0x1002756c8: pop r12
0x1002756ca: pop r13
0x1002756cc: pop r14
0x1002756ce: pop r15
0x1002756d0: pop rbp
0x1002756d1: ret 
0x1002756d2: nop 
0x1002756d3: nop 
0x1002756d4: nop 
0x1002756d5: nop 
0x1002756d6: nop 
0x1002756d7: nop 
0x1002756d8: nop 
0x1002756d9: nop 
0x1002756da: nop 
0x1002756db: nop 
0x1002756dc: nop 
0x1002756dd: nop 
0x1002756de: nop 
0x1002756df: nop 
