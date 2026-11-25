0x100353900: push rbp
0x100353901: mov rbp, rsp
0x100353904: push r15
0x100353906: push r14
0x100353908: push r13
0x10035390a: push r12
0x10035390c: push rbx
0x10035390d: sub rsp, 0x28
0x100353911: lea rax, [rip + 0x82e18c] ; 0x100b81aa4 FlowerBarn
0x100353918: mov qword ptr [rip + 0x1aa29c9], rax ; 0x101df62e8
0x10035391f: lea rax, [rip + 0x1aa29ba] ; 0x101df62e0
0x100353926: mov qword ptr [rip + 0x1aa29bf], 0 ; 0x101df62f0
0x100353931: mov rcx, qword ptr [rip + 0x91c620] ; 0x100c6ff58
0x100353938: mov qword ptr [rip + 0x1aa29b9], rcx ; 0x101df62f8
0x10035393f: mov qword ptr [rip + 0x91c612], rax ; 0x100c6ff58
0x100353946: mov qword ptr [rip + 0x1aa29bb], rax ; 0x101df6308
0x10035394d: mov rax, qword ptr [rip + 0x8b4d5c] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x100353954: mov qword ptr [rip + 0x1aa29b5], rax ; 0x101df6310
0x10035395b: mov qword ptr [rip + 0x1aa29b2], 0xffffffffffffffff ; 0x101df6318
0x100353966: mov qword ptr [rip + 0x1aa29c7], 0 ; 0x101df6338
0x100353971: mov rax, qword ptr [rip + 0x8b7050] ; 0x100c0a9c8
0x100353978: add rax, 0x10
0x10035397c: mov qword ptr [rip + 0x1aa295d], rax ; 0x101df62e0
0x100353983: xor eax, eax
0x100353985: call 0x100011c10 ; 0x100011c10
0x10035398a: lea rax, [rip + 0x808f7b] ; 0x100b5c90c Initialize
0x100353991: mov qword ptr [rip + 0x1aa29a8], rax ; 0x101df6340
0x100353998: lea rcx, [rip + 0x1aa29a1] ; 0x101df6340
0x10035399f: mov qword ptr [rip + 0x1aa299e], 0 ; 0x101df6348
0x1003539aa: mov rax, qword ptr [rip + 0x91c5af] ; 0x100c6ff60
0x1003539b1: mov qword ptr [rip + 0x1aa2998], rax ; 0x101df6350
0x1003539b8: lea rax, [rip - 0x570f] ; 0x10034e2b0
0x1003539bf: vmovq xmm0, rax
0x1003539c4: vmovdqu xmmword ptr [rip + 0x1aa29ac], xmm0 ; 0x101df6378
0x1003539cc: mov rdx, qword ptr [rip + 0x8b19bd] ; 0x100c05390 -> 0x100351ea0 __Z12ApplyWrapperI10FlowerBarnMS0_FvP15ResourceManagerP5SceneEEvM9VoidClassFvvEPv8VariablePSB_j
0x1003539d3: mov qword ptr [rip + 0x1aa29ae], rdx ; 0x101df6388
0x1003539da: mov rsi, qword ptr [rip + 0x8b523f] ; 0x100c08c20 -> 0x100351eb0 __Z21InitFunctionSignatureIM10FlowerBarnFvP15ResourceManagerP5SceneEEvP17FunctionSignature
0x1003539e1: mov qword ptr [rip + 0x1aa29a8], rsi ; 0x101df6390
0x1003539e8: mov rax, qword ptr [rip + 0x8b3c69] ; 0x100c07658 -> 0x100351e80 __Z18GetMetaClassByTypeIP10FlowerBarnERK9MetaClassv
0x1003539ef: mov qword ptr [rip + 0x1aa29a2], rax ; 0x101df6398
0x1003539f6: lea rdi, [rip + 0x808f50] ; 0x100b5c94d Update
0x1003539fd: mov qword ptr [rip + 0x1aa299c], rdi ; 0x101df63a0
0x100353a04: lea rdi, [rip + 0x1aa2995] ; 0x101df63a0
0x100353a0b: mov qword ptr [rip + 0x1aa2992], 0 ; 0x101df63a8
0x100353a16: mov qword ptr [rip + 0x1aa2993], rcx ; 0x101df63b0
0x100353a1d: lea rcx, [rip - 0x54f4] ; 0x10034e530
0x100353a24: vmovq xmm0, rcx
0x100353a29: vmovdqu xmmword ptr [rip + 0x1aa29a7], xmm0 ; 0x101df63d8
0x100353a31: mov rcx, qword ptr [rip + 0x8b1960] ; 0x100c05398 -> 0x100352010 __Z12ApplyWrapperI10FlowerBarnMS0_FvP16CollisionGeoBarnP6CameraP10VisibilityP10DeviceInfoEEvM9VoidClassFvvEPv8VariablePSF_j
0x100353a38: mov qword ptr [rip + 0x1aa29a9], rcx ; 0x101df63e8
0x100353a3f: mov rcx, qword ptr [rip + 0x8b51e2] ; 0x100c08c28   5
0x100353a46: mov qword ptr [rip + 0x1aa29a3], rcx ; 0x101df63f0
0x100353a4d: mov qword ptr [rip + 0x1aa29a4], rax ; 0x101df63f8
0x100353a54: lea rcx, [rip + 0x80cfea] ; 0x100b60a45 OnLevelLoad
0x100353a5b: mov qword ptr [rip + 0x1aa299e], rcx ; 0x101df6400
0x100353a62: lea rcx, [rip + 0x1aa2997] ; 0x101df6400
0x100353a69: mov qword ptr [rip + 0x1aa2994], 0 ; 0x101df6408
0x100353a74: mov qword ptr [rip + 0x1aa2995], rdi ; 0x101df6410
0x100353a7b: lea rdi, [rip - 0x4a52] ; 0x10034f030
0x100353a82: vmovq xmm0, rdi
0x100353a87: vmovdqu xmmword ptr [rip + 0x1aa29a9], xmm0 ; 0x101df6438
0x100353a8f: mov qword ptr [rip + 0x1aa29b2], rdx ; 0x101df6448
0x100353a96: mov qword ptr [rip + 0x1aa29b3], rsi ; 0x101df6450
0x100353a9d: mov qword ptr [rip + 0x1aa29b4], rax ; 0x101df6458
0x100353aa4: lea rdx, [rip + 0x80cfb0] ; 0x100b60a5b OnLevelUnload
0x100353aab: mov qword ptr [rip + 0x1aa29ae], rdx ; 0x101df6460
0x100353ab2: lea rdx, [rip + 0x1aa29a7] ; 0x101df6460
0x100353ab9: mov qword ptr [rip + 0x1aa29a4], 0 ; 0x101df6468
0x100353ac4: mov qword ptr [rip + 0x1aa29a5], rcx ; 0x101df6470
0x100353acb: lea rcx, [rip - 0x4a82] ; 0x10034f050
0x100353ad2: vmovq xmm0, rcx
0x100353ad7: vmovdqu xmmword ptr [rip + 0x1aa29b9], xmm0 ; 0x101df6498
0x100353adf: mov rcx, qword ptr [rip + 0x8b18ba] ; 0x100c053a0 -> 0x100352210 __Z12ApplyWrapperI10FlowerBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x100353ae6: mov qword ptr [rip + 0x1aa29bb], rcx ; 0x101df64a8
0x100353aed: mov rsi, qword ptr [rip + 0x8b513c] ; 0x100c08c30 p"5
0x100353af4: mov qword ptr [rip + 0x1aa29b5], rsi ; 0x101df64b0
0x100353afb: mov qword ptr [rip + 0x1aa29b6], rax ; 0x101df64b8
0x100353b02: lea rdi, [rip + 0x80e304] ; 0x100b61e0d BuildScene
0x100353b09: mov qword ptr [rip + 0x1aa29b0], rdi ; 0x101df64c0
0x100353b10: lea rdi, [rip + 0x1aa29a9] ; 0x101df64c0
0x100353b17: mov qword ptr [rip + 0x1aa29a6], 0 ; 0x101df64c8
0x100353b22: mov qword ptr [rip + 0x1aa29a7], rdx ; 0x101df64d0
0x100353b29: lea rdx, [rip - 0x4aa0] ; 0x10034f090
0x100353b30: vmovq xmm0, rdx
0x100353b35: vmovdqu xmmword ptr [rip + 0x1aa29bb], xmm0 ; 0x101df64f8
0x100353b3d: mov qword ptr [rip + 0x1aa29c4], rcx ; 0x101df6508
0x100353b44: mov qword ptr [rip + 0x1aa29c5], rsi ; 0x101df6510
0x100353b4b: mov qword ptr [rip + 0x1aa29c6], rax ; 0x101df6518
0x100353b52: lea rdx, [rip + 0x80e2a8] ; 0x100b61e01 RenderFlush
0x100353b59: mov qword ptr [rip + 0x1aa29c0], rdx ; 0x101df6520
0x100353b60: lea rdx, [rip + 0x1aa29b9] ; 0x101df6520
0x100353b67: mov qword ptr [rip + 0x1aa29b6], 0 ; 0x101df6528
0x100353b72: mov qword ptr [rip + 0x1aa29b7], rdi ; 0x101df6530
0x100353b79: lea rdi, [rip - 0x4aa0] ; 0x10034f0e0
0x100353b80: vmovq xmm0, rdi
0x100353b85: vmovdqu xmmword ptr [rip + 0x1aa29cb], xmm0 ; 0x101df6558
0x100353b8d: mov qword ptr [rip + 0x1aa29d4], rcx ; 0x101df6568
0x100353b94: mov qword ptr [rip + 0x1aa29d5], rsi ; 0x101df6570
0x100353b9b: mov qword ptr [rip + 0x1aa29d6], rax ; 0x101df6578
0x100353ba2: lea rcx, [rip + 0x82df06] ; 0x100b81aaf CreateFlowerPatch
0x100353ba9: mov qword ptr [rip + 0x1aa29d0], rcx ; 0x101df6580
0x100353bb0: lea rcx, [rip + 0x1aa29c9] ; 0x101df6580
0x100353bb7: mov qword ptr [rip + 0x1aa29d2], rdx ; 0x101df6590
0x100353bbe: mov qword ptr [rip + 0x91c39b], rcx ; 0x100c6ff60
0x100353bc5: lea rcx, [rip - 0x4abc] ; 0x10034f110
0x100353bcc: vmovq xmm0, rcx
0x100353bd1: vmovdqu xmmword ptr [rip + 0x1aa29df], xmm0 ; 0x101df65b8
0x100353bd9: mov rcx, qword ptr [rip + 0x8b17a8] ; 0x100c05388 -> 0x100352290 __Z12ApplyWrapperI10FlowerBarnMS0_FP11FlowerPatchPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x100353be0: mov qword ptr [rip + 0x1aa29e1], rcx ; 0x101df65c8
0x100353be7: mov rcx, qword ptr [rip + 0x8b502a] ; 0x100c08c18 P#5
0x100353bee: mov qword ptr [rip + 0x1aa29db], rcx ; 0x101df65d0
0x100353bf5: mov qword ptr [rip + 0x1aa29dc], rax ; 0x101df65d8
0x100353bfc: lea rax, [rip + 0x82debe] ; 0x100b81ac1 FlowerPatch
0x100353c03: vmovq xmm0, rax
0x100353c08: lea rax, [rip + 0x8234b9] ; 0x100b770c8 ObjectFactory_CreatesType
0x100353c0f: vmovq xmm1, rax
0x100353c14: vpunpcklqdq xmm0, xmm1, xmm0
0x100353c18: vmovdqa xmmword ptr [rip + 0x1aa29c0], xmm0 ; 0x101df65e0
0x100353c20: lea rax, [rip + 0x1aa29b9] ; 0x101df65e0
0x100353c27: mov qword ptr [rip + 0x1aa29be], 0 ; 0x101df65f0
0x100353c32: mov qword ptr [rip + 0x1aa294f], rax ; 0x101df6588
0x100353c39: lea rax, [rip + 0x82de8d] ; 0x100b81acd FlowerPatchShape
0x100353c40: mov qword ptr [rip + 0x1aa29b9], rax ; 0x101df6600
0x100353c47: lea r12, [rip + 0x1aa29aa] ; 0x101df65f8
0x100353c4e: mov rcx, qword ptr [rip + 0x91c303] ; 0x100c6ff58
0x100353c55: mov qword ptr [rip + 0x1aa29b4], rcx ; 0x101df6610
0x100353c5c: mov qword ptr [rip + 0x91c2f5], r12 ; 0x100c6ff58
0x100353c63: mov qword ptr [rip + 0x1aa29b6], r12 ; 0x101df6620
0x100353c6a: mov rcx, qword ptr [rip + 0x8b8fc7] ; 0x100c0cc38
0x100353c71: add rcx, 0x10
0x100353c75: mov qword ptr [rip + 0x1aa297c], rcx ; 0x101df65f8
0x100353c7c: vmovq xmm0, rax
0x100353c81: lea rax, [rip + 0x8099b6] ; 0x100b5d63e Enum_Type
0x100353c88: vmovq xmm1, rax
0x100353c8d: vmovdqa xmmword ptr [rbp - 0x50], xmm1
0x100353c92: vpunpcklqdq xmm0, xmm1, xmm0
0x100353c96: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x100353c9b: vmovdqa xmmword ptr [rip + 0x1aa298d], xmm0 ; 0x101df6630
0x100353ca3: lea rax, [rip + 0x1aa2986] ; 0x101df6630
0x100353caa: mov qword ptr [rip + 0x1aa298b], 0 ; 0x101df6640
0x100353cb5: mov qword ptr [rip + 0x1aa294c], rax ; 0x101df6608
0x100353cbc: lea rax, [rip + 0x82de1b] ; 0x100b81ade kFlowerPatchShape_Sphere
0x100353cc3: mov qword ptr [rip + 0x1aa297e], rax ; 0x101df6648
0x100353cca: lea r15, [rip + 0x1aa2977] ; 0x101df6648
0x100353cd1: mov qword ptr [rip + 0x1aa2974], 0 ; 0x101df6650
0x100353cdc: mov rax, qword ptr [rip + 0x9bf3fd] ; 0x100d130e0
0x100353ce3: mov qword ptr [rip + 0x1aa296e], rax ; 0x101df6658
0x100353cea: mov qword ptr [rip + 0x9bf3ef], r15 ; 0x100d130e0
0x100353cf1: mov edi, 4
0x100353cf6: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100353cfb: mov dword ptr [rax], 1
0x100353d01: mov qword ptr [rip + 0x1aa2960], rax ; 0x101df6668
0x100353d08: mov rax, qword ptr [rip + 0x8b2f71] ; 0x100c06c80 -> 0x100352580 __Z17GetMetaTypeByTypeI16FlowerPatchShapeERK8MetaTypev
0x100353d0f: mov qword ptr [rip + 0x1aa295a], rax ; 0x101df6670
0x100353d16: mov rbx, rax
0x100353d19: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100353d1e: vmovaps xmmword ptr [rip + 0x1aa295a], xmm0 ; 0x101df6680
0x100353d26: lea rax, [rip + 0x1aa2953] ; 0x101df6680
0x100353d2d: mov qword ptr [rip + 0x1aa2958], 0 ; 0x101df6690
0x100353d38: mov qword ptr [rip + 0x1aa2911], rax ; 0x101df6650
0x100353d3f: lea rax, [rip + 0x82ddb1] ; 0x100b81af7 kFlowerPatchShape_Cube
0x100353d46: mov qword ptr [rip + 0x1aa294b], rax ; 0x101df6698
0x100353d4d: lea r14, [rip + 0x1aa2944] ; 0x101df6698
0x100353d54: mov qword ptr [rip + 0x1aa2941], 0 ; 0x101df66a0
0x100353d5f: mov qword ptr [rip + 0x1aa2942], r15 ; 0x101df66a8
0x100353d66: mov qword ptr [rip + 0x9bf373], r14 ; 0x100d130e0
0x100353d6d: mov edi, 4
0x100353d72: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100353d77: mov dword ptr [rax], 2
0x100353d7d: mov qword ptr [rip + 0x1aa2934], rax ; 0x101df66b8
0x100353d84: mov qword ptr [rip + 0x1aa2935], rbx ; 0x101df66c0
0x100353d8b: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100353d90: vmovaps xmmword ptr [rip + 0x1aa2938], xmm0 ; 0x101df66d0
0x100353d98: lea rax, [rip + 0x1aa2931] ; 0x101df66d0
0x100353d9f: mov qword ptr [rip + 0x1aa2936], 0 ; 0x101df66e0
0x100353daa: mov qword ptr [rip + 0x1aa28ef], rax ; 0x101df66a0
0x100353db1: lea rax, [rip + 0x82dd56] ; 0x100b81b0e kFlowerPatchShape_EntireLevel
0x100353db8: mov qword ptr [rip + 0x1aa2929], rax ; 0x101df66e8
0x100353dbf: lea r13, [rip + 0x1aa2922] ; 0x101df66e8
0x100353dc6: mov qword ptr [rip + 0x1aa291f], 0 ; 0x101df66f0
0x100353dd1: mov qword ptr [rip + 0x1aa2920], r14 ; 0x101df66f8
0x100353dd8: mov qword ptr [rip + 0x9bf301], r13 ; 0x100d130e0
0x100353ddf: mov edi, 4
0x100353de4: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100353de9: mov dword ptr [rax], 0
0x100353def: mov qword ptr [rip + 0x1aa2912], rax ; 0x101df6708
0x100353df6: mov qword ptr [rip + 0x1aa2913], rbx ; 0x101df6710
0x100353dfd: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100353e02: vmovaps xmmword ptr [rip + 0x1aa2916], xmm0 ; 0x101df6720
0x100353e0a: lea rax, [rip + 0x1aa290f] ; 0x101df6720
0x100353e11: mov qword ptr [rip + 0x1aa2914], 0 ; 0x101df6730
0x100353e1c: mov qword ptr [rip + 0x1aa28cd], rax ; 0x101df66f0
0x100353e23: lea rax, [rip + 0x82dd02] ; 0x100b81b2c FlowerPatchType
0x100353e2a: mov qword ptr [rip + 0x1aa290f], rax ; 0x101df6740
0x100353e31: lea r15, [rip + 0x1aa2900] ; 0x101df6738
0x100353e38: mov qword ptr [rip + 0x1aa2911], r12 ; 0x101df6750
0x100353e3f: mov qword ptr [rip + 0x91c112], r15 ; 0x100c6ff58
0x100353e46: mov qword ptr [rip + 0x1aa2913], r15 ; 0x101df6760
0x100353e4d: mov rcx, qword ptr [rip + 0x8b8dbc] ; 0x100c0cc10
0x100353e54: add rcx, 0x10
0x100353e58: mov qword ptr [rip + 0x1aa28d9], rcx ; 0x101df6738
0x100353e5f: vmovq xmm0, rax
0x100353e64: vmovdqa xmm1, xmmword ptr [rbp - 0x50]
0x100353e69: vpunpcklqdq xmm0, xmm1, xmm0
0x100353e6d: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x100353e72: vmovdqa xmmword ptr [rip + 0x1aa28f6], xmm0 ; 0x101df6770
0x100353e7a: lea rax, [rip + 0x1aa28ef] ; 0x101df6770
0x100353e81: mov qword ptr [rip + 0x1aa28f4], 0 ; 0x101df6780
0x100353e8c: mov qword ptr [rip + 0x1aa28b5], rax ; 0x101df6748
0x100353e93: lea r14, [rip + 0x82dca2] ; 0x100b81b3c kFlowerPatchType_Circle
0x100353e9a: mov qword ptr [rip + 0x1aa28e7], r14 ; 0x101df6788
0x100353ea1: lea rbx, [rip + 0x1aa28e0] ; 0x101df6788
0x100353ea8: mov qword ptr [rip + 0x1aa28dd], 0 ; 0x101df6790
0x100353eb3: mov qword ptr [rip + 0x1aa28de], r13 ; 0x101df6798
0x100353eba: mov qword ptr [rip + 0x9bf21f], rbx ; 0x100d130e0
0x100353ec1: mov edi, 4
0x100353ec6: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100353ecb: mov dword ptr [rax], 0
0x100353ed1: mov qword ptr [rip + 0x1aa28d0], rax ; 0x101df67a8
0x100353ed8: mov r12, qword ptr [rip + 0x8b2d79] ; 0x100c06c58 @'5
0x100353edf: mov qword ptr [rip + 0x1aa28ca], r12 ; 0x101df67b0
0x100353ee6: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100353eeb: vmovaps xmmword ptr [rip + 0x1aa28cd], xmm0 ; 0x101df67c0
0x100353ef3: lea rax, [rip + 0x1aa28c6] ; 0x101df67c0
0x100353efa: mov qword ptr [rip + 0x1aa28cb], 0 ; 0x101df67d0
0x100353f05: mov qword ptr [rip + 0x1aa2884], rax ; 0x101df6790
0x100353f0c: lea rax, [rip + 0x82dc41] ; 0x100b81b54 kFlowerPatchType_Blade
0x100353f13: mov qword ptr [rip + 0x1aa28be], rax ; 0x101df67d8
0x100353f1a: lea rax, [rip + 0x1aa28b7] ; 0x101df67d8
0x100353f21: mov qword ptr [rip + 0x1aa28b4], 0 ; 0x101df67e0
0x100353f2c: mov qword ptr [rip + 0x1aa28b5], rbx ; 0x101df67e8
0x100353f33: mov qword ptr [rip + 0x9bf1a6], rax ; 0x100d130e0
0x100353f3a: mov edi, 4
0x100353f3f: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100353f44: mov dword ptr [rax], 1
0x100353f4a: mov qword ptr [rip + 0x1aa28a7], rax ; 0x101df67f8
0x100353f51: mov qword ptr [rip + 0x1aa28a8], r12 ; 0x101df6800
0x100353f58: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100353f5d: vmovaps xmmword ptr [rip + 0x1aa28ab], xmm0 ; 0x101df6810
0x100353f65: lea rax, [rip + 0x1aa28a4] ; 0x101df6810
0x100353f6c: mov qword ptr [rip + 0x1aa28a9], 0 ; 0x101df6820
0x100353f77: mov qword ptr [rip + 0x1aa2862], rax ; 0x101df67e0
0x100353f7e: lea rax, [rip + 0x82db3c] ; 0x100b81ac1 FlowerPatch
0x100353f85: mov qword ptr [rip + 0x1aa28a4], rax ; 0x101df6830
0x100353f8c: lea rax, [rip + 0x1aa2895] ; 0x101df6828
0x100353f93: mov qword ptr [rip + 0x1aa289a], 0 ; 0x101df6838
0x100353f9e: mov qword ptr [rip + 0x1aa289b], r15 ; 0x101df6840
0x100353fa5: mov qword ptr [rip + 0x91bfac], rax ; 0x100c6ff58
0x100353fac: mov qword ptr [rip + 0x1aa289d], rax ; 0x101df6850
0x100353fb3: lea rax, [rip - 0x31e6fa] ; 0x1000358c0
0x100353fba: mov qword ptr [rip + 0x1aa2897], rax ; 0x101df6858
0x100353fc1: mov qword ptr [rip + 0x1aa2894], 0xffffffffffffffff ; 0x101df6860
0x100353fcc: mov qword ptr [rip + 0x1aa28a9], 0 ; 0x101df6880
0x100353fd7: mov rax, qword ptr [rip + 0x8b6d02] ; 0x100c0ace0
0x100353fde: add rax, 0x10
0x100353fe2: mov qword ptr [rip + 0x1aa283f], rax ; 0x101df6828
0x100353fe9: xor eax, eax
0x100353feb: call 0x100011c10 ; 0x100011c10
0x100353ff0: lea rax, [rip + 0x80c045] ; 0x100b6003c Tool_Export
0x100353ff7: vmovq xmm1, rax
0x100353ffc: lea rax, [rip + 0x80a9dc] ; 0x100b5e9df true
0x100354003: vmovq xmm0, rax
0x100354008: vpunpcklqdq xmm1, xmm1, xmm0
0x10035400c: vmovdqa xmmword ptr [rip + 0x1aa287c], xmm1 ; 0x101df6890
0x100354014: lea rax, [rip + 0x1aa2875] ; 0x101df6890
0x10035401b: mov rcx, qword ptr [rip + 0x1aa2816] ; 0x101df6838
0x100354022: mov qword ptr [rip + 0x1aa2877], rcx ; 0x101df68a0
0x100354029: mov qword ptr [rip + 0x1aa2808], rax ; 0x101df6838
0x100354030: lea rax, [rip + 0x80af6f] ; 0x100b5efa6 pos
0x100354037: mov qword ptr [rip + 0x95bc32], rax ; 0x100cafc70
0x10035403e: lea rsi, [rip + 0x95bc2b] ; 0x100cafc70
0x100354045: mov qword ptr [rip + 0x95bc28], 0 ; 0x100cafc78
0x100354050: mov rax, qword ptr [rip + 0x923c09] ; 0x100c77c60
0x100354057: mov qword ptr [rip + 0x95bc22], rax ; 0x100cafc80
0x10035405e: mov qword ptr [rip + 0x95bc27], 0x10 ; 0x100cafc90
0x100354069: mov rcx, qword ptr [rip + 0x8b2d60] ; 0x100c06dd0 -> 0x100066ac0 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Vector3EERK8MetaTypev
0x100354070: mov qword ptr [rip + 0x95bc21], rcx ; 0x100cafc98
0x100354077: mov rdx, qword ptr [rip + 0x8b37c2] ; 0x100c07840 -> 0x100351e90 __Z18GetMetaClassByTypeIP11FlowerPatchERK9MetaClassv
0x10035407e: mov qword ptr [rip + 0x95bc1b], rdx ; 0x100cafca0
0x100354085: mov qword ptr [rip + 0x95bc18], 0xffffffffffffffff ; 0x100cafca8
0x100354090: lea rax, [rip - 0x33a677] ; 0x100019a20
0x100354097: mov qword ptr [rip + 0x95bc12], rax ; 0x100cafcb0
0x10035409e: mov qword ptr [rip + 0x95bc0f], 0 ; 0x100cafcb8
0x1003540a9: lea rdi, [rip + 0x824bb3] ; 0x100b78c63 quat
0x1003540b0: mov qword ptr [rip + 0x95bc09], rdi ; 0x100cafcc0
0x1003540b7: lea rdi, [rip + 0x95bc02] ; 0x100cafcc0
0x1003540be: mov qword ptr [rip + 0x95bbff], 0 ; 0x100cafcc8
0x1003540c9: mov qword ptr [rip + 0x95bc00], rsi ; 0x100cafcd0
0x1003540d0: mov qword ptr [rip + 0x95bc05], 0x20 ; 0x100cafce0
0x1003540db: mov rsi, qword ptr [rip + 0x8b2cde] ; 0x100c06dc0 -> 0x1001db420 __Z17GetMetaTypeByTypeIN10Vectormath3Aos4QuatEERK8MetaTypev
0x1003540e2: mov qword ptr [rip + 0x95bbff], rsi ; 0x100cafce8
0x1003540e9: mov qword ptr [rip + 0x95bc00], rdx ; 0x100cafcf0
0x1003540f0: mov qword ptr [rip + 0x95bbfd], 0xffffffffffffffff ; 0x100cafcf8
0x1003540fb: mov qword ptr [rip + 0x95bbfe], rax ; 0x100cafd00
0x100354102: mov qword ptr [rip + 0x95bbfb], 0 ; 0x100cafd08
0x10035410d: lea rsi, [rip + 0x824b54] ; 0x100b78c68 scale
0x100354114: mov qword ptr [rip + 0x95bbf5], rsi ; 0x100cafd10
0x10035411b: lea rsi, [rip + 0x95bbee] ; 0x100cafd10
0x100354122: mov qword ptr [rip + 0x95bbeb], 0 ; 0x100cafd18
0x10035412d: mov qword ptr [rip + 0x95bbec], rdi ; 0x100cafd20
0x100354134: mov qword ptr [rip + 0x95bbf1], 0x30 ; 0x100cafd30
0x10035413f: mov qword ptr [rip + 0x95bbf2], rcx ; 0x100cafd38
0x100354146: mov qword ptr [rip + 0x95bbf3], rdx ; 0x100cafd40
0x10035414d: mov qword ptr [rip + 0x95bbf0], 0xffffffffffffffff ; 0x100cafd48
0x100354158: mov qword ptr [rip + 0x95bbf1], rax ; 0x100cafd50
0x10035415f: mov qword ptr [rip + 0x95bbee], 0 ; 0x100cafd58
0x10035416a: lea rdi, [rip + 0x82d9fa] ; 0x100b81b6b colorMin
0x100354171: mov qword ptr [rip + 0x95bbe8], rdi ; 0x100cafd60
0x100354178: lea rdi, [rip + 0x95bbe1] ; 0x100cafd60
0x10035417f: mov qword ptr [rip + 0x95bbea], rsi ; 0x100cafd70
0x100354186: mov qword ptr [rip + 0x95bbef], 0x40 ; 0x100cafd80
0x100354191: mov qword ptr [rip + 0x95bbf0], rcx ; 0x100cafd88
0x100354198: mov qword ptr [rip + 0x95bbf1], rdx ; 0x100cafd90
0x10035419f: mov qword ptr [rip + 0x95bbee], 0xffffffffffffffff ; 0x100cafd98
0x1003541aa: mov qword ptr [rip + 0x95bbef], rax ; 0x100cafda0
0x1003541b1: mov qword ptr [rip + 0x95bbec], 0 ; 0x100cafda8
0x1003541bc: lea rsi, [rip + 0x82d9b1] ; 0x100b81b74 ( 0.1975164314, 0.008373117745, 0.008373117745 )
0x1003541c3: vmovq xmm2, rsi
0x1003541c8: lea rsi, [rip + 0x80a833] ; 0x100b5ea02 Tool_DefaultValue
0x1003541cf: vmovq xmm1, rsi
0x1003541d4: vpunpcklqdq xmm2, xmm1, xmm2
0x1003541d8: vmovdqa xmmword ptr [rip + 0x1aa26d0], xmm2 ; 0x101df68b0
0x1003541e0: lea rsi, [rip + 0x1aa26c9] ; 0x101df68b0
0x1003541e7: mov qword ptr [rip + 0x1aa26ce], 0 ; 0x101df68c0
0x1003541f2: lea rbx, [rip + 0x8295a6] ; 0x100b7d79f Tool_IsColor
0x1003541f9: vmovq xmm2, rbx
0x1003541fe: vpunpcklqdq xmm2, xmm2, xmm0
0x100354202: vmovdqa xmmword ptr [rip + 0x1aa26c6], xmm2 ; 0x101df68d0
0x10035420a: lea rbx, [rip + 0x1aa26bf] ; 0x101df68d0
0x100354211: mov qword ptr [rip + 0x1aa26c8], rsi ; 0x101df68e0
0x100354218: mov qword ptr [rip + 0x95bb49], rbx ; 0x100cafd68
0x10035421f: lea rsi, [rip + 0x82d97f] ; 0x100b81ba5 colorMax
0x100354226: mov qword ptr [rip + 0x95bb83], rsi ; 0x100cafdb0
0x10035422d: lea rsi, [rip + 0x95bb7c] ; 0x100cafdb0
0x100354234: mov qword ptr [rip + 0x95bb85], rdi ; 0x100cafdc0
0x10035423b: mov qword ptr [rip + 0x95bb8a], 0x50 ; 0x100cafdd0
0x100354246: mov qword ptr [rip + 0x95bb8b], rcx ; 0x100cafdd8
0x10035424d: mov qword ptr [rip + 0x95bb8c], rdx ; 0x100cafde0
0x100354254: mov qword ptr [rip + 0x95bb89], 0xffffffffffffffff ; 0x100cafde8
0x10035425f: mov qword ptr [rip + 0x95bb8a], rax ; 0x100cafdf0
0x100354266: mov qword ptr [rip + 0x95bb87], 0 ; 0x100cafdf8
0x100354271: lea rcx, [rip + 0x82d936] ; 0x100b81bae ( 0.6592239918, 0.07176144885, 0.07176144885 )
0x100354278: vmovq xmm3, rcx
0x10035427d: vpunpcklqdq xmm3, xmm1, xmm3
0x100354281: vmovdqa xmmword ptr [rip + 0x1aa2667], xmm3 ; 0x101df68f0
0x100354289: lea rcx, [rip + 0x1aa2660] ; 0x101df68f0
0x100354290: mov qword ptr [rip + 0x1aa2665], 0 ; 0x101df6900
0x10035429b: vmovdqa xmmword ptr [rip + 0x1aa266d], xmm2 ; 0x101df6910
0x1003542a3: lea rdi, [rip + 0x1aa2666] ; 0x101df6910
0x1003542aa: mov qword ptr [rip + 0x1aa266f], rcx ; 0x101df6920
0x1003542b1: mov qword ptr [rip + 0x95bb00], rdi ; 0x100cafdb8
0x1003542b8: lea rcx, [rip + 0x82d91e] ; 0x100b81bdd sizeMin
0x1003542bf: mov qword ptr [rip + 0x95bb3a], rcx ; 0x100cafe00
0x1003542c6: lea rdi, [rip + 0x95bb33] ; 0x100cafe00
0x1003542cd: mov qword ptr [rip + 0x95bb3c], rsi ; 0x100cafe10
0x1003542d4: mov qword ptr [rip + 0x95bb41], 0x60 ; 0x100cafe20
0x1003542df: mov rcx, qword ptr [rip + 0x8b327a] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1003542e6: mov qword ptr [rip + 0x95bb3b], rcx ; 0x100cafe28
0x1003542ed: mov qword ptr [rip + 0x95bb3c], rdx ; 0x100cafe30
0x1003542f4: mov qword ptr [rip + 0x95bb39], 0xffffffffffffffff ; 0x100cafe38
0x1003542ff: mov qword ptr [rip + 0x95bb3a], rax ; 0x100cafe40
0x100354306: mov qword ptr [rip + 0x95bb37], 0 ; 0x100cafe48
0x100354311: lea rsi, [rip + 0x829095] ; 0x100b7d3ad 0.05
0x100354318: vmovq xmm2, rsi
0x10035431d: vpunpcklqdq xmm2, xmm1, xmm2
0x100354321: vmovdqa xmmword ptr [rip + 0x1aa2607], xmm2 ; 0x101df6930
0x100354329: lea rsi, [rip + 0x1aa2600] ; 0x101df6930
0x100354330: mov qword ptr [rip + 0x1aa2605], 0 ; 0x101df6940
0x10035433b: mov qword ptr [rip + 0x95bac6], rsi ; 0x100cafe08
0x100354342: lea rsi, [rip + 0x82d89c] ; 0x100b81be5 sizeMax
0x100354349: mov qword ptr [rip + 0x95bb00], rsi ; 0x100cafe50
0x100354350: lea rsi, [rip + 0x95baf9] ; 0x100cafe50
0x100354357: mov qword ptr [rip + 0x95bb02], rdi ; 0x100cafe60
0x10035435e: mov qword ptr [rip + 0x95bb07], 0x64 ; 0x100cafe70
0x100354369: mov qword ptr [rip + 0x95bb08], rcx ; 0x100cafe78
0x100354370: mov qword ptr [rip + 0x95bb09], rdx ; 0x100cafe80
0x100354377: mov qword ptr [rip + 0x95bb06], 0xffffffffffffffff ; 0x100cafe88
0x100354382: mov qword ptr [rip + 0x95bb07], rax ; 0x100cafe90
0x100354389: mov qword ptr [rip + 0x95bb04], 0 ; 0x100cafe98
0x100354394: lea rdi, [rip + 0x82d852] ; 0x100b81bed 0.10
0x10035439b: vmovq xmm3, rdi
0x1003543a0: vpunpcklqdq xmm3, xmm1, xmm3
0x1003543a4: vmovdqa xmmword ptr [rip + 0x1aa25a4], xmm3 ; 0x101df6950
0x1003543ac: lea rdi, [rip + 0x1aa259d] ; 0x101df6950
0x1003543b3: mov qword ptr [rip + 0x1aa25a2], 0 ; 0x101df6960
0x1003543be: mov qword ptr [rip + 0x95ba93], rdi ; 0x100cafe58
0x1003543c5: lea rdi, [rip + 0x82d826] ; 0x100b81bf2 heightMin
0x1003543cc: mov qword ptr [rip + 0x95bacd], rdi ; 0x100cafea0
0x1003543d3: lea rdi, [rip + 0x95bac6] ; 0x100cafea0
0x1003543da: mov qword ptr [rip + 0x95bacf], rsi ; 0x100cafeb0
0x1003543e1: mov qword ptr [rip + 0x95bad4], 0x68 ; 0x100cafec0
0x1003543ec: mov qword ptr [rip + 0x95bad5], rcx ; 0x100cafec8
0x1003543f3: mov qword ptr [rip + 0x95bad6], rdx ; 0x100cafed0
0x1003543fa: mov qword ptr [rip + 0x95bad3], 0xffffffffffffffff ; 0x100cafed8
0x100354405: mov qword ptr [rip + 0x95bad4], rax ; 0x100cafee0
0x10035440c: mov qword ptr [rip + 0x95bad1], 0 ; 0x100cafee8
0x100354417: vmovdqa xmmword ptr [rip + 0x1aa2551], xmm2 ; 0x101df6970
0x10035441f: lea rsi, [rip + 0x1aa254a] ; 0x101df6970
0x100354426: mov qword ptr [rip + 0x1aa254f], 0 ; 0x101df6980
0x100354431: mov qword ptr [rip + 0x95ba70], rsi ; 0x100cafea8
0x100354438: lea rsi, [rip + 0x82d7bd] ; 0x100b81bfc heightMax
0x10035443f: mov qword ptr [rip + 0x95baaa], rsi ; 0x100cafef0
0x100354446: lea rsi, [rip + 0x95baa3] ; 0x100cafef0
0x10035444d: mov qword ptr [rip + 0x95baac], rdi ; 0x100caff00
0x100354454: mov qword ptr [rip + 0x95bab1], 0x6c ; 0x100caff10
0x10035445f: mov qword ptr [rip + 0x95bab2], rcx ; 0x100caff18
0x100354466: mov qword ptr [rip + 0x95bab3], rdx ; 0x100caff20
0x10035446d: mov qword ptr [rip + 0x95bab0], 0xffffffffffffffff ; 0x100caff28
0x100354478: mov qword ptr [rip + 0x95bab1], rax ; 0x100caff30
0x10035447f: mov qword ptr [rip + 0x95baae], 0 ; 0x100caff38
0x10035448a: lea rdi, [rip + 0x82d775] ; 0x100b81c06 0.075
0x100354491: vmovq xmm2, rdi
0x100354496: vpunpcklqdq xmm2, xmm1, xmm2
0x10035449a: vmovdqa xmmword ptr [rip + 0x1aa24ee], xmm2 ; 0x101df6990
0x1003544a2: lea rdi, [rip + 0x1aa24e7] ; 0x101df6990
0x1003544a9: mov qword ptr [rip + 0x1aa24ec], 0 ; 0x101df69a0
0x1003544b4: mov qword ptr [rip + 0x95ba3d], rdi ; 0x100cafef8
0x1003544bb: lea rdi, [rip + 0x822e5d] ; 0x100b7731f density
0x1003544c2: mov qword ptr [rip + 0x95ba77], rdi ; 0x100caff40
0x1003544c9: lea rdi, [rip + 0x95ba70] ; 0x100caff40
0x1003544d0: mov qword ptr [rip + 0x95ba79], rsi ; 0x100caff50
0x1003544d7: mov qword ptr [rip + 0x95ba7e], 0x70 ; 0x100caff60
0x1003544e2: mov qword ptr [rip + 0x95ba7f], rcx ; 0x100caff68
0x1003544e9: mov qword ptr [rip + 0x95ba80], rdx ; 0x100caff70
0x1003544f0: mov qword ptr [rip + 0x95ba7d], 0xffffffffffffffff ; 0x100caff78
0x1003544fb: mov qword ptr [rip + 0x95ba7e], rax ; 0x100caff80
0x100354502: mov qword ptr [rip + 0x95ba7b], 0 ; 0x100caff88
0x10035450d: lea rsi, [rip + 0x82c787] ; 0x100b80c9b 30.0
0x100354514: vmovq xmm2, rsi
0x100354519: vpunpcklqdq xmm2, xmm1, xmm2
0x10035451d: vmovdqa xmmword ptr [rip + 0x1aa248b], xmm2 ; 0x101df69b0
0x100354525: lea rsi, [rip + 0x1aa2484] ; 0x101df69b0
0x10035452c: mov qword ptr [rip + 0x1aa2489], 0 ; 0x101df69c0
0x100354537: mov qword ptr [rip + 0x95ba0a], rsi ; 0x100caff48
0x10035453e: lea rsi, [rip + 0x82d6c7] ; 0x100b81c0c noisiness
0x100354545: mov qword ptr [rip + 0x95ba44], rsi ; 0x100caff90
0x10035454c: lea rsi, [rip + 0x95ba3d] ; 0x100caff90
0x100354553: mov qword ptr [rip + 0x95ba46], rdi ; 0x100caffa0
0x10035455a: mov qword ptr [rip + 0x95ba4b], 0x74 ; 0x100caffb0
0x100354565: mov qword ptr [rip + 0x95ba4c], rcx ; 0x100caffb8
0x10035456c: mov qword ptr [rip + 0x95ba4d], rdx ; 0x100caffc0
0x100354573: mov qword ptr [rip + 0x95ba4a], 0xffffffffffffffff ; 0x100caffc8
0x10035457e: mov qword ptr [rip + 0x95ba4b], rax ; 0x100caffd0
0x100354585: mov qword ptr [rip + 0x95ba48], 0 ; 0x100caffd8
0x100354590: lea rdi, [rip + 0x81fb7d] ; 0x100b74114 0.0
0x100354597: vmovq xmm2, rdi
0x10035459c: vpunpcklqdq xmm2, xmm1, xmm2
0x1003545a0: vmovdqa xmmword ptr [rip + 0x1aa2428], xmm2 ; 0x101df69d0
0x1003545a8: lea rdi, [rip + 0x1aa2421] ; 0x101df69d0
0x1003545af: mov qword ptr [rip + 0x1aa2426], 0 ; 0x101df69e0
0x1003545ba: mov qword ptr [rip + 0x95b9d7], rdi ; 0x100caff98
0x1003545c1: lea rdi, [rip + 0x822a91] ; 0x100b77059 enabled
0x1003545c8: mov qword ptr [rip + 0x95ba11], rdi ; 0x100caffe0
0x1003545cf: lea rdi, [rip + 0x95ba0a] ; 0x100caffe0
0x1003545d6: mov qword ptr [rip + 0x95ba13], rsi ; 0x100cafff0
0x1003545dd: mov qword ptr [rip + 0x95ba18], 0x78 ; 0x100cb0000
0x1003545e8: mov rsi, qword ptr [rip + 0x8b2f69] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1003545ef: mov qword ptr [rip + 0x95ba12], rsi ; 0x100cb0008
0x1003545f6: mov qword ptr [rip + 0x95ba13], rdx ; 0x100cb0010
0x1003545fd: mov qword ptr [rip + 0x95ba10], 0xffffffffffffffff ; 0x100cb0018
0x100354608: mov qword ptr [rip + 0x95ba11], rax ; 0x100cb0020
0x10035460f: mov qword ptr [rip + 0x95ba0e], 0 ; 0x100cb0028
0x10035461a: vpunpcklqdq xmm0, xmm1, xmm0
0x10035461e: vmovdqa xmmword ptr [rip + 0x1aa23ca], xmm0 ; 0x101df69f0
0x100354626: lea rbx, [rip + 0x1aa23c3] ; 0x101df69f0
0x10035462d: mov qword ptr [rip + 0x1aa23c8], 0 ; 0x101df6a00
0x100354638: mov qword ptr [rip + 0x95b9a9], rbx ; 0x100caffe8
0x10035463f: lea rbx, [rip + 0x82d5d0] ; 0x100b81c16 shape
0x100354646: mov qword ptr [rip + 0x95b9e3], rbx ; 0x100cb0030
0x10035464d: lea rbx, [rip + 0x95b9dc] ; 0x100cb0030
0x100354654: mov qword ptr [rip + 0x95b9e5], rdi ; 0x100cb0040
0x10035465b: mov qword ptr [rip + 0x95b9ea], 0x7c ; 0x100cb0050
0x100354666: mov rdi, qword ptr [rip + 0x8b2613] ; 0x100c06c80 -> 0x100352580 __Z17GetMetaTypeByTypeI16FlowerPatchShapeERK8MetaTypev
0x10035466d: mov qword ptr [rip + 0x95b9e4], rdi ; 0x100cb0058
0x100354674: mov qword ptr [rip + 0x95b9e5], rdx ; 0x100cb0060
0x10035467b: mov qword ptr [rip + 0x95b9e2], 0xffffffffffffffff ; 0x100cb0068
0x100354686: mov qword ptr [rip + 0x95b9e3], rax ; 0x100cb0070
0x10035468d: mov qword ptr [rip + 0x95b9e0], 0 ; 0x100cb0078
0x100354698: lea rdi, [rip + 0x82d458] ; 0x100b81af7 kFlowerPatchShape_Cube
0x10035469f: vmovq xmm0, rdi
0x1003546a4: vpunpcklqdq xmm0, xmm1, xmm0
0x1003546a8: vmovdqa xmmword ptr [rip + 0x1aa2360], xmm0 ; 0x101df6a10
0x1003546b0: lea rdi, [rip + 0x1aa2359] ; 0x101df6a10
0x1003546b7: mov qword ptr [rip + 0x1aa235e], 0 ; 0x101df6a20
0x1003546c2: mov qword ptr [rip + 0x95b96f], rdi ; 0x100cb0038
0x1003546c9: lea rdi, [rip + 0x809684] ; 0x100b5dd54 type
0x1003546d0: mov qword ptr [rip + 0x95b9a9], rdi ; 0x100cb0080
0x1003546d7: lea rdi, [rip + 0x95b9a2] ; 0x100cb0080
0x1003546de: mov qword ptr [rip + 0x95b9ab], rbx ; 0x100cb0090
0x1003546e5: mov qword ptr [rip + 0x95b9b0], 0x80 ; 0x100cb00a0
0x1003546f0: mov qword ptr [rip + 0x95b9b1], r12 ; 0x100cb00a8
0x1003546f7: mov qword ptr [rip + 0x95b9b2], rdx ; 0x100cb00b0
0x1003546fe: mov qword ptr [rip + 0x95b9af], 0xffffffffffffffff ; 0x100cb00b8
0x100354709: mov qword ptr [rip + 0x95b9b0], rax ; 0x100cb00c0
0x100354710: mov qword ptr [rip + 0x95b9ad], 0 ; 0x100cb00c8
0x10035471b: vmovq xmm0, r14
0x100354720: vpunpcklqdq xmm0, xmm1, xmm0
0x100354724: vmovdqa xmmword ptr [rip + 0x1aa2304], xmm0 ; 0x101df6a30
0x10035472c: lea rbx, [rip + 0x1aa22fd] ; 0x101df6a30
0x100354733: mov qword ptr [rip + 0x1aa2302], 0 ; 0x101df6a40
0x10035473e: mov qword ptr [rip + 0x95b943], rbx ; 0x100cb0088
0x100354745: lea rbx, [rip + 0x822c6e] ; 0x100b773ba material
0x10035474c: mov qword ptr [rip + 0x95b97d], rbx ; 0x100cb00d0
0x100354753: lea rbx, [rip + 0x95b976] ; 0x100cb00d0
0x10035475a: mov qword ptr [rip + 0x95b97f], rdi ; 0x100cb00e0
0x100354761: mov qword ptr [rip + 0x9234f8], rbx ; 0x100c77c60
0x100354768: mov qword ptr [rip + 0x95b97d], 0x84 ; 0x100cb00f0
0x100354773: mov rdi, qword ptr [rip + 0x8b260e] ; 0x100c06d88 -> 0x1003529a0 __Z17GetMetaTypeByTypeI8MaterialERK8MetaTypev
0x10035477a: mov qword ptr [rip + 0x95b977], rdi ; 0x100cb00f8
0x100354781: mov qword ptr [rip + 0x95b978], rdx ; 0x100cb0100
0x100354788: mov qword ptr [rip + 0x95b975], 0xffffffffffffffff ; 0x100cb0108
0x100354793: mov qword ptr [rip + 0x95b976], rax ; 0x100cb0110
0x10035479a: mov qword ptr [rip + 0x95b973], 0 ; 0x100cb0118
0x1003547a5: lea rdx, [rip + 0x82d470] ; 0x100b81c1c kMaterial_Grass
0x1003547ac: vmovq xmm0, rdx
0x1003547b1: vpunpcklqdq xmm0, xmm1, xmm0
0x1003547b5: vmovdqa xmmword ptr [rip + 0x1aa2293], xmm0 ; 0x101df6a50
0x1003547bd: lea rdx, [rip + 0x1aa228c] ; 0x101df6a50
0x1003547c4: mov qword ptr [rip + 0x1aa2291], 0 ; 0x101df6a60
0x1003547cf: mov qword ptr [rip + 0x95b902], rdx ; 0x100cb00d8
0x1003547d6: lea rdx, [rip + 0x82d44f] ; 0x100b81c2c kDebugFlowers
0x1003547dd: mov qword ptr [rip + 0x1aa228c], rdx ; 0x101df6a70
0x1003547e4: lea rdi, [rip + 0x1aa2285] ; 0x101df6a70
0x1003547eb: mov rdx, qword ptr [rip + 0x93b4ae] ; 0x100c8fca0
0x1003547f2: mov qword ptr [rip + 0x1aa2287], rdx ; 0x101df6a80
0x1003547f9: lea rdx, [rip + 0x1aa2268] ; 0x101df6a68
0x100354800: vmovq xmm0, rdx
0x100354805: lea rdx, [rip + 0x82d42e] ; 0x100b81c3a FlowerBarn.cpp
0x10035480c: vmovq xmm1, rdx
0x100354811: vpunpcklqdq xmm0, xmm1, xmm0
0x100354815: vmovdqu xmmword ptr [rip + 0x1aa2273], xmm0 ; 0x101df6a90
0x10035481d: mov qword ptr [rip + 0x1aa227c], rsi ; 0x101df6aa0
0x100354824: mov qword ptr [rip + 0x1aa2279], 0 ; 0x101df6aa8
0x10035482f: mov qword ptr [rip + 0x1aa227a], rax ; 0x101df6ab0
0x100354836: mov qword ptr [rip + 0x1aa2277], 0 ; 0x101df6ab8
0x100354841: lea rbx, [rip + 0x822417] ; 0x100b76c5f Flowers
0x100354848: vmovq xmm0, rbx
0x10035484d: lea rbx, [rip + 0x8097c9] ; 0x100b5e01d TweakCategory
0x100354854: vmovq xmm2, rbx
0x100354859: vpunpcklqdq xmm0, xmm2, xmm0
0x10035485d: vmovdqa xmmword ptr [rip + 0x1aa225b], xmm0 ; 0x101df6ac0
0x100354865: lea rbx, [rip + 0x1aa2254] ; 0x101df6ac0
0x10035486c: mov qword ptr [rip + 0x1aa2259], 0 ; 0x101df6ad0
0x100354877: mov qword ptr [rip + 0x1aa21fa], rbx ; 0x101df6a78
0x10035487e: lea rbx, [rip + 0x82d3c4] ; 0x100b81c49 kDebugFlowersShowCounts
0x100354885: mov qword ptr [rip + 0x1aa2254], rbx ; 0x101df6ae0
0x10035488c: lea rbx, [rip + 0x1aa224d] ; 0x101df6ae0
0x100354893: mov qword ptr [rip + 0x1aa2256], rdi ; 0x101df6af0
0x10035489a: lea rdi, [rip + 0x1aa2237] ; 0x101df6ad8
0x1003548a1: vmovq xmm2, rdi
0x1003548a6: vpunpcklqdq xmm2, xmm1, xmm2
0x1003548aa: vmovdqu xmmword ptr [rip + 0x1aa224e], xmm2 ; 0x101df6b00
0x1003548b2: mov qword ptr [rip + 0x1aa2257], rsi ; 0x101df6b10
0x1003548b9: mov qword ptr [rip + 0x1aa2254], 0 ; 0x101df6b18
0x1003548c4: mov qword ptr [rip + 0x1aa2255], rax ; 0x101df6b20
0x1003548cb: mov qword ptr [rip + 0x1aa2252], 0 ; 0x101df6b28
0x1003548d6: vmovdqa xmmword ptr [rip + 0x1aa2252], xmm0 ; 0x101df6b30
0x1003548de: lea rdi, [rip + 0x1aa224b] ; 0x101df6b30
0x1003548e5: mov qword ptr [rip + 0x1aa2250], 0 ; 0x101df6b40
0x1003548f0: mov qword ptr [rip + 0x1aa21f1], rdi ; 0x101df6ae8
0x1003548f7: lea rdi, [rip + 0x82d363] ; 0x100b81c61 kEnableFlowers
0x1003548fe: mov qword ptr [rip + 0x1aa2243], rdi ; 0x101df6b48
0x100354905: lea rdi, [rip + 0x1aa223c] ; 0x101df6b48
0x10035490c: mov qword ptr [rip + 0x1aa2245], rbx ; 0x101df6b58
0x100354913: lea rbx, [rip + 0x95b806] ; 0x100cb0120
0x10035491a: vmovq xmm2, rbx
0x10035491f: vpunpcklqdq xmm1, xmm1, xmm2
0x100354923: vmovdqu xmmword ptr [rip + 0x1aa223d], xmm1 ; 0x101df6b68
0x10035492b: mov qword ptr [rip + 0x1aa2246], rsi ; 0x101df6b78
0x100354932: mov qword ptr [rip + 0x1aa2243], 0 ; 0x101df6b80
0x10035493d: mov qword ptr [rip + 0x1aa2244], rax ; 0x101df6b88
0x100354944: mov qword ptr [rip + 0x1aa2241], 0 ; 0x101df6b90
0x10035494f: vmovdqa xmmword ptr [rip + 0x1aa2249], xmm0 ; 0x101df6ba0
0x100354957: lea rsi, [rip + 0x1aa2242] ; 0x101df6ba0
0x10035495e: mov qword ptr [rip + 0x1aa2247], 0 ; 0x101df6bb0
0x100354969: mov qword ptr [rip + 0x1aa21e0], rsi ; 0x101df6b50
0x100354970: lea rsi, [rip + 0x82d2f9] ; 0x100b81c70 kFlowerDensity
0x100354977: mov qword ptr [rip + 0x1aa223a], rsi ; 0x101df6bb8
0x10035497e: lea rsi, [rip + 0x1aa2233] ; 0x101df6bb8
0x100354985: mov qword ptr [rip + 0x1aa223c], rdi ; 0x101df6bc8
0x10035498c: mov qword ptr [rip + 0x1aa2245], rdx ; 0x101df6bd8
0x100354993: lea rdi, [rip + 0x95b78a] ; 0x100cb0124
0x10035499a: mov qword ptr [rip + 0x1aa223f], rdi ; 0x101df6be0
0x1003549a1: mov qword ptr [rip + 0x1aa2240], rcx ; 0x101df6be8
0x1003549a8: mov qword ptr [rip + 0x1aa223d], 0 ; 0x101df6bf0
0x1003549b3: mov qword ptr [rip + 0x1aa223e], rax ; 0x101df6bf8
0x1003549ba: mov qword ptr [rip + 0x1aa223b], 0 ; 0x101df6c00
0x1003549c5: vmovdqa xmmword ptr [rip + 0x1aa2243], xmm0 ; 0x101df6c10
0x1003549cd: lea rdi, [rip + 0x1aa223c] ; 0x101df6c10
0x1003549d4: mov qword ptr [rip + 0x1aa2241], 0 ; 0x101df6c20
0x1003549df: mov qword ptr [rip + 0x1aa21da], rdi ; 0x101df6bc0
0x1003549e6: lea rdi, [rip + 0x82d292] ; 0x100b81c7f kFlowerHeight
0x1003549ed: mov qword ptr [rip + 0x1aa2234], rdi ; 0x101df6c28
0x1003549f4: lea rdi, [rip + 0x1aa222d] ; 0x101df6c28
0x1003549fb: mov qword ptr [rip + 0x1aa2236], rsi ; 0x101df6c38
0x100354a02: mov qword ptr [rip + 0x1aa223f], rdx ; 0x101df6c48
0x100354a09: lea rsi, [rip + 0x95b718] ; 0x100cb0128
0x100354a10: mov qword ptr [rip + 0x1aa2239], rsi ; 0x101df6c50
0x100354a17: mov qword ptr [rip + 0x1aa223a], rcx ; 0x101df6c58
0x100354a1e: mov qword ptr [rip + 0x1aa2237], 0 ; 0x101df6c60
0x100354a29: mov qword ptr [rip + 0x1aa2238], rax ; 0x101df6c68
0x100354a30: mov qword ptr [rip + 0x1aa2235], 0 ; 0x101df6c70
0x100354a3b: vmovdqa xmmword ptr [rip + 0x1aa223d], xmm0 ; 0x101df6c80
0x100354a43: lea rsi, [rip + 0x1aa2236] ; 0x101df6c80
0x100354a4a: mov qword ptr [rip + 0x1aa223b], 0 ; 0x101df6c90
0x100354a55: mov qword ptr [rip + 0x1aa21d4], rsi ; 0x101df6c30
0x100354a5c: lea rsi, [rip + 0x82d22a] ; 0x100b81c8d kFlowerSize
0x100354a63: mov qword ptr [rip + 0x1aa222e], rsi ; 0x101df6c98
0x100354a6a: lea rsi, [rip + 0x1aa2227] ; 0x101df6c98
0x100354a71: mov qword ptr [rip + 0x1aa2230], rdi ; 0x101df6ca8
0x100354a78: mov qword ptr [rip + 0x93b221], rsi ; 0x100c8fca0
0x100354a7f: mov qword ptr [rip + 0x1aa2232], rdx ; 0x101df6cb8
0x100354a86: lea rdx, [rip + 0x95b69f] ; 0x100cb012c
0x100354a8d: mov qword ptr [rip + 0x1aa222c], rdx ; 0x101df6cc0
0x100354a94: mov qword ptr [rip + 0x1aa222d], rcx ; 0x101df6cc8
0x100354a9b: mov qword ptr [rip + 0x1aa222a], 0 ; 0x101df6cd0
0x100354aa6: mov qword ptr [rip + 0x1aa222b], rax ; 0x101df6cd8
0x100354aad: mov qword ptr [rip + 0x1aa2228], 0 ; 0x101df6ce0
0x100354ab8: vmovdqa xmmword ptr [rip + 0x1aa2230], xmm0 ; 0x101df6cf0
0x100354ac0: lea rax, [rip + 0x1aa2229] ; 0x101df6cf0
0x100354ac7: mov qword ptr [rip + 0x1aa222e], 0 ; 0x101df6d00
0x100354ad2: mov qword ptr [rip + 0x1aa21c7], rax ; 0x101df6ca0
0x100354ad9: mov byte ptr [rip + 0x9d7188], 0xf ; 0x100d2bc68
0x100354ae0: add rsp, 0x28
0x100354ae4: pop rbx
0x100354ae5: pop r12
0x100354ae7: pop r13
0x100354ae9: pop r14
0x100354aeb: pop r15
0x100354aed: pop rbp
0x100354aee: ret 
0x100354aef: nop 
