0x10022a1c0: push rbp
0x10022a1c1: mov rbp, rsp
0x10022a1c4: mov dword ptr [rip + 0xaf9ef2], 0 ; 0x100d240c0
0x10022a1ce: lea rax, [rip + 0x950917] ; 0x100b7aaec kDebugCloudParticlePhysics
0x10022a1d5: mov qword ptr [rip + 0x1bb856c], rax ; 0x101de2748
0x10022a1dc: lea rax, [rip + 0x1bb8565] ; 0x101de2748
0x10022a1e3: mov rcx, qword ptr [rip + 0xa65ab6] ; 0x100c8fca0
0x10022a1ea: mov qword ptr [rip + 0x1bb8567], rcx ; 0x101de2758
0x10022a1f1: mov qword ptr [rip + 0xa65aa8], rax ; 0x100c8fca0
0x10022a1f8: lea rax, [rip + 0x1bb8541] ; 0x101de2740
0x10022a1ff: vmovq xmm0, rax
0x10022a204: lea rax, [rip + 0x9508fc] ; 0x100b7ab07 CloudParticleBarn.cpp
0x10022a20b: vmovq xmm1, rax
0x10022a210: vpunpcklqdq xmm0, xmm1, xmm0
0x10022a214: vmovdqu xmmword ptr [rip + 0x1bb854c], xmm0 ; 0x101de2768
0x10022a21c: mov rax, qword ptr [rip + 0x9dd335] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10022a223: mov qword ptr [rip + 0x1bb854e], rax ; 0x101de2778
0x10022a22a: mov qword ptr [rip + 0x1bb854b], 0 ; 0x101de2780
0x10022a235: lea rax, [rip - 0x21081c] ; 0x100019a20
0x10022a23c: mov qword ptr [rip + 0x1bb8545], rax ; 0x101de2788
0x10022a243: mov qword ptr [rip + 0x1bb8542], 0 ; 0x101de2790
0x10022a24e: lea rax, [rip + 0x937bf7] ; 0x100b61e4c Clouds
0x10022a255: vmovq xmm0, rax
0x10022a25a: lea rax, [rip + 0x933dbc] ; 0x100b5e01d TweakCategory
0x10022a261: vmovq xmm1, rax
0x10022a266: vpunpcklqdq xmm0, xmm1, xmm0
0x10022a26a: vmovdqa xmmword ptr [rip + 0x1bb852e], xmm0 ; 0x101de27a0
0x10022a272: lea rax, [rip + 0x1bb8527] ; 0x101de27a0
0x10022a279: mov qword ptr [rip + 0x1bb852c], 0 ; 0x101de27b0
0x10022a284: mov qword ptr [rip + 0x1bb84c5], rax ; 0x101de2750
0x10022a28b: movabs rax, 0x616470553a3a3143
0x10022a295: mov qword ptr [rip + 0xaf9e2c], rax ; 0x100d240c8
0x10022a29c: mov byte ptr [rip + 0xaf9e2f], 0 ; 0x100d240d2
0x10022a2a3: mov word ptr [rip + 0xaf9e24], 0x6574 ; 0x100d240d0
0x10022a2ac: mov dword ptr [rip + 0xafb112], 0 ; 0x100d253c8
0x10022a2b6: call 0x1007e8410 ; 0x1007e8410
0x10022a2bb: vmovq qword ptr [rip + 0xafb10d], xmm0 ; 0x100d253d0
0x10022a2c3: movabs rax, 0x737968503a3a3143
0x10022a2cd: mov qword ptr [rip + 0xafb104], rax ; 0x100d253d8
0x10022a2d4: mov dword ptr [rip + 0xafb102], 0x736369 ; 0x100d253e0
0x10022a2de: mov dword ptr [rip + 0xafc3f0], 0 ; 0x100d266d8
0x10022a2e8: call 0x1007e8410 ; 0x1007e8410
0x10022a2ed: vmovq qword ptr [rip + 0xafc3eb], xmm0 ; 0x100d266e0
0x10022a2f5: movabs rax, 0x74696c423a3a3143
0x10022a2ff: mov qword ptr [rip + 0xafc3e2], rax ; 0x100d266e8
0x10022a306: mov byte ptr [rip + 0xafc3e3], 0 ; 0x100d266f0
0x10022a30d: mov dword ptr [rip + 0xafd6d1], 0 ; 0x100d279e8
0x10022a317: call 0x1007e8410 ; 0x1007e8410
0x10022a31c: vmovq qword ptr [rip + 0xafd6cc], xmm0 ; 0x100d279f0
0x10022a324: movabs rax, 0x616470553a3a3243
0x10022a32e: mov qword ptr [rip + 0xafd6c3], rax ; 0x100d279f8
0x10022a335: mov byte ptr [rip + 0xafd6c6], 0 ; 0x100d27a02
0x10022a33c: mov word ptr [rip + 0xafd6bb], 0x6574 ; 0x100d27a00
0x10022a345: mov dword ptr [rip + 0xafe9a9], 0 ; 0x100d28cf8
0x10022a34f: call 0x1007e8410 ; 0x1007e8410
0x10022a354: vmovq qword ptr [rip + 0xafe9a4], xmm0 ; 0x100d28d00
0x10022a35c: movabs rax, 0x737968503a3a3243
0x10022a366: mov qword ptr [rip + 0xafe99b], rax ; 0x100d28d08
0x10022a36d: mov dword ptr [rip + 0xafe999], 0x736369 ; 0x100d28d10
0x10022a377: mov dword ptr [rip + 0xaffc87], 0 ; 0x100d2a008
0x10022a381: call 0x1007e8410 ; 0x1007e8410
0x10022a386: vmovq qword ptr [rip + 0xaffc82], xmm0 ; 0x100d2a010
0x10022a38e: movabs rax, 0x74696c423a3a3243
0x10022a398: mov qword ptr [rip + 0xaffc79], rax ; 0x100d2a018
0x10022a39f: mov byte ptr [rip + 0xaffc7a], 0 ; 0x100d2a020
0x10022a3a6: mov dword ptr [rip + 0xb00f68], 0 ; 0x100d2b318
0x10022a3b0: call 0x1007e8410 ; 0x1007e8410
0x10022a3b5: vmovq qword ptr [rip + 0xb00f63], xmm0 ; 0x100d2b320
0x10022a3bd: lea rax, [rip + 0x950799] ; 0x100b7ab5d CloudParticleBarn
0x10022a3c4: mov qword ptr [rip + 0x1bb83f5], rax ; 0x101de27c0
0x10022a3cb: lea rax, [rip + 0x1bb83e6] ; 0x101de27b8
0x10022a3d2: mov qword ptr [rip + 0x1bb83eb], 0 ; 0x101de27c8
0x10022a3dd: mov rcx, qword ptr [rip + 0xa45b74] ; 0x100c6ff58
0x10022a3e4: mov qword ptr [rip + 0x1bb83e5], rcx ; 0x101de27d0
0x10022a3eb: mov qword ptr [rip + 0xa45b66], rax ; 0x100c6ff58
0x10022a3f2: mov qword ptr [rip + 0x1bb83e7], rax ; 0x101de27e0
0x10022a3f9: mov rax, qword ptr [rip + 0x9de2b0] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x10022a400: mov qword ptr [rip + 0x1bb83e1], rax ; 0x101de27e8
0x10022a407: mov qword ptr [rip + 0x1bb83de], 0xffffffffffffffff ; 0x101de27f0
0x10022a412: mov qword ptr [rip + 0x1bb83f3], 0 ; 0x101de2810
0x10022a41d: mov rax, qword ptr [rip + 0x9e1684] ; 0x100c0baa8
0x10022a424: add rax, 0x10
0x10022a428: mov qword ptr [rip + 0x1bb8389], rax ; 0x101de27b8
0x10022a42f: xor eax, eax
0x10022a431: call 0x100011c10 ; 0x100011c10
0x10022a436: lea rax, [rip + 0x9324cf] ; 0x100b5c90c Initialize
0x10022a43d: mov qword ptr [rip + 0x1bb83d4], rax ; 0x101de2818
0x10022a444: lea rcx, [rip + 0x1bb83cd] ; 0x101de2818
0x10022a44b: mov qword ptr [rip + 0x1bb83ca], 0 ; 0x101de2820
0x10022a456: mov rax, qword ptr [rip + 0xa45b03] ; 0x100c6ff60
0x10022a45d: mov qword ptr [rip + 0x1bb83c4], rax ; 0x101de2828
0x10022a464: lea rax, [rip - 0x47ab] ; 0x100225cc0
0x10022a46b: vmovq xmm0, rax
0x10022a470: vmovdqu xmmword ptr [rip + 0x1bb83d8], xmm0 ; 0x101de2850
0x10022a478: mov rax, qword ptr [rip + 0x9db9d9] ; 0x100c05e58 -> 0x100229040 __Z12ApplyWrapperI17CloudParticleBarnMS0_FvP11CloudTexGenP14ModelInstancerP15ResourceManagerP5SceneEEvM9VoidClassFvvEPv8VariablePSF_j
0x10022a47f: mov qword ptr [rip + 0x1bb83da], rax ; 0x101de2860
0x10022a486: mov rax, qword ptr [rip + 0x9df25b] ; 0x100c096e8 -> 0x100229050 __Z21InitFunctionSignatureIM17CloudParticleBarnFvP11CloudTexGenP14ModelInstancerP15ResourceManagerP5SceneEEvP17FunctionSignature
0x10022a48d: mov qword ptr [rip + 0x1bb83d4], rax ; 0x101de2868
0x10022a494: mov rax, qword ptr [rip + 0x9ddc1d] ; 0x100c080b8 -> 0x100229030 __Z18GetMetaClassByTypeIP17CloudParticleBarnERK9MetaClassv
0x10022a49b: mov qword ptr [rip + 0x1bb83ce], rax ; 0x101de2870
0x10022a4a2: lea rdx, [rip + 0x93659c] ; 0x100b60a45 OnLevelLoad
0x10022a4a9: mov qword ptr [rip + 0x1bb83c8], rdx ; 0x101de2878
0x10022a4b0: lea rdx, [rip + 0x1bb83c1] ; 0x101de2878
0x10022a4b7: mov qword ptr [rip + 0x1bb83be], 0 ; 0x101de2880
0x10022a4c2: mov qword ptr [rip + 0x1bb83bf], rcx ; 0x101de2888
0x10022a4c9: lea rcx, [rip - 0x4640] ; 0x100225e90
0x10022a4d0: vmovq xmm0, rcx
0x10022a4d5: vmovdqu xmmword ptr [rip + 0x1bb83d3], xmm0 ; 0x101de28b0
0x10022a4dd: mov rcx, qword ptr [rip + 0x9db984] ; 0x100c05e68 -> 0x100229240 __Z12ApplyWrapperI17CloudParticleBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10022a4e4: mov qword ptr [rip + 0x1bb83d5], rcx ; 0x101de28c0
0x10022a4eb: mov rsi, qword ptr [rip + 0x9df206] ; 0x100c096f8 -> 0x1002292a0 __Z21InitFunctionSignatureIM17CloudParticleBarnFvvEEvP17FunctionSignature
0x10022a4f2: mov qword ptr [rip + 0x1bb83cf], rsi ; 0x101de28c8
0x10022a4f9: mov qword ptr [rip + 0x1bb83d0], rax ; 0x101de28d0
0x10022a500: lea rdi, [rip + 0x932431] ; 0x100b5c938 Terminate
0x10022a507: mov qword ptr [rip + 0x1bb83ca], rdi ; 0x101de28d8
0x10022a50e: lea rdi, [rip + 0x1bb83c3] ; 0x101de28d8
0x10022a515: mov qword ptr [rip + 0x1bb83c0], 0 ; 0x101de28e0
0x10022a520: mov qword ptr [rip + 0x1bb83c1], rdx ; 0x101de28e8
0x10022a527: lea rdx, [rip - 0x467e] ; 0x100225eb0
0x10022a52e: vmovq xmm0, rdx
0x10022a533: vmovdqu xmmword ptr [rip + 0x1bb83d5], xmm0 ; 0x101de2910
0x10022a53b: mov qword ptr [rip + 0x1bb83de], rcx ; 0x101de2920
0x10022a542: mov qword ptr [rip + 0x1bb83df], rsi ; 0x101de2928
0x10022a549: mov qword ptr [rip + 0x1bb83e0], rax ; 0x101de2930
0x10022a550: lea rdx, [rip + 0x932408] ; 0x100b5c95f HotLoad
0x10022a557: mov qword ptr [rip + 0x1bb83da], rdx ; 0x101de2938
0x10022a55e: lea rdx, [rip + 0x1bb83d3] ; 0x101de2938
0x10022a565: mov qword ptr [rip + 0x1bb83d0], 0 ; 0x101de2940
0x10022a570: mov qword ptr [rip + 0x1bb83d1], rdi ; 0x101de2948
0x10022a577: lea rdi, [rip - 0x469e] ; 0x100225ee0
0x10022a57e: vmovq xmm0, rdi
0x10022a583: vmovdqu xmmword ptr [rip + 0x1bb83e5], xmm0 ; 0x101de2970
0x10022a58b: mov qword ptr [rip + 0x1bb83ee], rcx ; 0x101de2980
0x10022a592: mov qword ptr [rip + 0x1bb83ef], rsi ; 0x101de2988
0x10022a599: mov qword ptr [rip + 0x1bb83f0], rax ; 0x101de2990
0x10022a5a0: lea rcx, [rip + 0x9323a6] ; 0x100b5c94d Update
0x10022a5a7: mov qword ptr [rip + 0x1bb83ea], rcx ; 0x101de2998
0x10022a5ae: lea rcx, [rip + 0x1bb83e3] ; 0x101de2998
0x10022a5b5: mov qword ptr [rip + 0x1bb83e0], 0 ; 0x101de29a0
0x10022a5c0: mov qword ptr [rip + 0x1bb83e1], rdx ; 0x101de29a8
0x10022a5c7: mov qword ptr [rip + 0xa45992], rcx ; 0x100c6ff60
0x10022a5ce: lea rcx, [rip - 0x46a5] ; 0x100225f30
0x10022a5d5: vmovq xmm0, rcx
0x10022a5da: vmovdqu xmmword ptr [rip + 0x1bb83ee], xmm0 ; 0x101de29d0
0x10022a5e2: mov rcx, qword ptr [rip + 0x9db877] ; 0x100c05e60 -> 0x1002292c0 __Z12ApplyWrapperI17CloudParticleBarnMS0_FvPK8GameTimePK6CameraPK12CameraSystemPK10CompositorPK10DeviceInfoP15ResourceManagerP10AvatarBarnP17EnvironmentForcesPS0_EEvM9VoidClassFvvEPv8VariablePST_j
0x10022a5e9: mov qword ptr [rip + 0x1bb83f0], rcx ; 0x101de29e0
0x10022a5f0: mov rcx, qword ptr [rip + 0x9df0f9] ; 0x100c096f0 -> 0x1002292d0 __Z21InitFunctionSignatureIM17CloudParticleBarnFvPK8GameTimePK6CameraPK12CameraSystemPK10CompositorPK10DeviceInfoP15ResourceManagerP10AvatarBarnP17EnvironmentForcesPS0_EEvP17FunctionSignature
0x10022a5f7: mov qword ptr [rip + 0x1bb83ea], rcx ; 0x101de29e8
0x10022a5fe: mov qword ptr [rip + 0x1bb83eb], rax ; 0x101de29f0
0x10022a605: pop rbp
0x10022a606: ret 
0x10022a607: nop 
0x10022a608: nop 
0x10022a609: nop 
0x10022a60a: nop 
0x10022a60b: nop 
0x10022a60c: nop 
0x10022a60d: nop 
0x10022a60e: nop 
0x10022a60f: nop 
