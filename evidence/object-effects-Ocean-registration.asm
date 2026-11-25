0x1004d82c0: push rbp
0x1004d82c1: mov rbp, rsp
0x1004d82c4: push r15
0x1004d82c6: push r14
0x1004d82c8: push r12
0x1004d82ca: push rbx
0x1004d82cb: mov dword ptr [rip + 0x8540db], 0 ; 0x100d2c3b0
0x1004d82d5: lea rdi, [rip + 0x8540dc] ; 0x100d2c3b8
0x1004d82dc: lea rsi, [rip + 0x1b3971d] ; 0x102011a00
0x1004d82e3: lea rdx, [rip + 0x6b5de7] ; 0x100b8e0d1 tag_Ocean
0x1004d82ea: call 0x1007951b0 ; 0x1007951b0
0x1004d82ef: lea rax, [rip + 0x6b5de5] ; 0x100b8e0db kWaterDrag
0x1004d82f6: mov qword ptr [rip + 0x1b3970b], rax ; 0x102011a08
0x1004d82fd: lea rdx, [rip + 0x1b39704] ; 0x102011a08
0x1004d8304: mov rax, qword ptr [rip + 0x7b7995] ; 0x100c8fca0
0x1004d830b: mov qword ptr [rip + 0x1b39706], rax ; 0x102011a18
0x1004d8312: lea rax, [rip + 0x6b5dcd] ; 0x100b8e0e6 Ocean.cpp
0x1004d8319: mov qword ptr [rip + 0x1b39708], rax ; 0x102011a28
0x1004d8320: lea rcx, [rip + 0x7fb0e9] ; 0x100cd3410
0x1004d8327: mov qword ptr [rip + 0x1b39702], rcx ; 0x102011a30
0x1004d832e: mov rcx, qword ptr [rip + 0x72f22b] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1004d8335: mov qword ptr [rip + 0x1b396fc], rcx ; 0x102011a38
0x1004d833c: mov qword ptr [rip + 0x1b396f9], 0 ; 0x102011a40
0x1004d8347: lea rbx, [rip - 0x4be92e] ; 0x100019a20
0x1004d834e: mov qword ptr [rip + 0x1b396f3], rbx ; 0x102011a48
0x1004d8355: mov qword ptr [rip + 0x1b396f0], 0 ; 0x102011a50
0x1004d8360: lea rsi, [rip + 0x6b5d89] ; 0x100b8e0f0 Ripple
0x1004d8367: vmovq xmm1, rsi
0x1004d836c: lea rsi, [rip + 0x685caa] ; 0x100b5e01d TweakCategory
0x1004d8373: vmovq xmm0, rsi
0x1004d8378: vpunpcklqdq xmm1, xmm0, xmm1
0x1004d837c: vmovdqa xmmword ptr [rip + 0x1b396dc], xmm1 ; 0x102011a60
0x1004d8384: lea rsi, [rip + 0x1b396d5] ; 0x102011a60
0x1004d838b: mov qword ptr [rip + 0x1b396da], 0 ; 0x102011a70
0x1004d8396: lea rdi, [rip + 0x6b5d5a] ; 0x100b8e0f7 0.95 1.0
0x1004d839d: vmovq xmm2, rdi
0x1004d83a2: lea rdi, [rip + 0x687da5] ; 0x100b6014e TweakRange
0x1004d83a9: vmovq xmm3, rdi
0x1004d83ae: vpunpcklqdq xmm2, xmm3, xmm2
0x1004d83b2: vmovdqa xmmword ptr [rip + 0x1b396c6], xmm2 ; 0x102011a80
0x1004d83ba: lea rdi, [rip + 0x1b396bf] ; 0x102011a80
0x1004d83c1: mov qword ptr [rip + 0x1b396c8], rsi ; 0x102011a90
0x1004d83c8: mov qword ptr [rip + 0x1b39641], rdi ; 0x102011a10
0x1004d83cf: lea rsi, [rip + 0x6b5d2a] ; 0x100b8e100 kXYSpeed
0x1004d83d6: mov qword ptr [rip + 0x1b396bb], rsi ; 0x102011a98
0x1004d83dd: lea rsi, [rip + 0x1b396b4] ; 0x102011a98
0x1004d83e4: mov qword ptr [rip + 0x1b396bd], rdx ; 0x102011aa8
0x1004d83eb: mov qword ptr [rip + 0x1b396c6], rax ; 0x102011ab8
0x1004d83f2: lea rdx, [rip + 0x7fb01b] ; 0x100cd3414
0x1004d83f9: mov qword ptr [rip + 0x1b396c0], rdx ; 0x102011ac0
0x1004d8400: mov qword ptr [rip + 0x1b396c1], rcx ; 0x102011ac8
0x1004d8407: mov qword ptr [rip + 0x1b396be], 0 ; 0x102011ad0
0x1004d8412: mov qword ptr [rip + 0x1b396bf], rbx ; 0x102011ad8
0x1004d8419: mov qword ptr [rip + 0x1b396bc], 0 ; 0x102011ae0
0x1004d8424: vmovdqa xmmword ptr [rip + 0x1b396c4], xmm1 ; 0x102011af0
0x1004d842c: lea rdx, [rip + 0x1b396bd] ; 0x102011af0
0x1004d8433: mov qword ptr [rip + 0x1b396c2], 0 ; 0x102011b00
0x1004d843e: mov qword ptr [rip + 0x1b3965b], rdx ; 0x102011aa0
0x1004d8445: lea rdx, [rip + 0x6b5cbd] ; 0x100b8e109 kXYRadius
0x1004d844c: mov qword ptr [rip + 0x1b396b5], rdx ; 0x102011b08
0x1004d8453: lea rdx, [rip + 0x1b396ae] ; 0x102011b08
0x1004d845a: mov qword ptr [rip + 0x1b396b7], rsi ; 0x102011b18
0x1004d8461: mov qword ptr [rip + 0x1b396c0], rax ; 0x102011b28
0x1004d8468: lea rsi, [rip + 0x7fafa9] ; 0x100cd3418
0x1004d846f: mov qword ptr [rip + 0x1b396ba], rsi ; 0x102011b30
0x1004d8476: mov qword ptr [rip + 0x1b396bb], rcx ; 0x102011b38
0x1004d847d: mov qword ptr [rip + 0x1b396b8], 0 ; 0x102011b40
0x1004d8488: mov qword ptr [rip + 0x1b396b9], rbx ; 0x102011b48
0x1004d848f: mov qword ptr [rip + 0x1b396b6], 0 ; 0x102011b50
0x1004d849a: vmovdqa xmmword ptr [rip + 0x1b396be], xmm1 ; 0x102011b60
0x1004d84a2: lea rcx, [rip + 0x1b396b7] ; 0x102011b60
0x1004d84a9: mov qword ptr [rip + 0x1b396bc], 0 ; 0x102011b70
0x1004d84b4: mov qword ptr [rip + 0x1b39655], rcx ; 0x102011b10
0x1004d84bb: lea rcx, [rip + 0x6b5c51] ; 0x100b8e113 kOceanCloud
0x1004d84c2: mov qword ptr [rip + 0x1b396b7], rcx ; 0x102011b80
0x1004d84c9: lea rcx, [rip + 0x1b396b0] ; 0x102011b80
0x1004d84d0: mov qword ptr [rip + 0x1b396b9], rdx ; 0x102011b90
0x1004d84d7: lea rdx, [rip + 0x1b3969a] ; 0x102011b78
0x1004d84de: vmovq xmm2, rdx
0x1004d84e3: vmovq xmm1, rax
0x1004d84e8: vpunpcklqdq xmm2, xmm1, xmm2
0x1004d84ec: vmovdqu xmmword ptr [rip + 0x1b396ac], xmm2 ; 0x102011ba0
0x1004d84f4: mov r14, qword ptr [rip + 0x72f05d] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1004d84fb: mov qword ptr [rip + 0x1b396ae], r14 ; 0x102011bb0
0x1004d8502: mov qword ptr [rip + 0x1b396ab], 0 ; 0x102011bb8
0x1004d850d: mov qword ptr [rip + 0x1b396ac], rbx ; 0x102011bc0
0x1004d8514: mov qword ptr [rip + 0x1b396a9], 0 ; 0x102011bc8
0x1004d851f: lea r12, [rip + 0x69e719] ; 0x100b76c3f Ocean
0x1004d8526: vmovq xmm2, r12
0x1004d852b: vpunpcklqdq xmm2, xmm0, xmm2
0x1004d852f: vmovdqa xmmword ptr [rip + 0x1b39699], xmm2 ; 0x102011bd0
0x1004d8537: lea rax, [rip + 0x1b39692] ; 0x102011bd0
0x1004d853e: mov qword ptr [rip + 0x1b39697], 0 ; 0x102011be0
0x1004d8549: mov qword ptr [rip + 0x1b39638], rax ; 0x102011b88
0x1004d8550: lea rax, [rip + 0x6b5bc8] ; 0x100b8e11f kDisplayOcean
0x1004d8557: mov qword ptr [rip + 0x1b3968a], rax ; 0x102011be8
0x1004d855e: lea rax, [rip + 0x1b39683] ; 0x102011be8
0x1004d8565: mov qword ptr [rip + 0x1b3968c], rcx ; 0x102011bf8
0x1004d856c: lea rcx, [rip + 0x7faea9] ; 0x100cd341c
0x1004d8573: vmovq xmm3, rcx
0x1004d8578: vpunpcklqdq xmm3, xmm1, xmm3
0x1004d857c: vmovdqu xmmword ptr [rip + 0x1b39684], xmm3 ; 0x102011c08
0x1004d8584: mov qword ptr [rip + 0x1b3968d], r14 ; 0x102011c18
0x1004d858b: mov qword ptr [rip + 0x1b3968a], 0 ; 0x102011c20
0x1004d8596: mov qword ptr [rip + 0x1b3968b], rbx ; 0x102011c28
0x1004d859d: mov qword ptr [rip + 0x1b39688], 0 ; 0x102011c30
0x1004d85a8: vmovdqa xmmword ptr [rip + 0x1b39690], xmm2 ; 0x102011c40
0x1004d85b0: lea rcx, [rip + 0x1b39689] ; 0x102011c40
0x1004d85b7: mov qword ptr [rip + 0x1b3968e], 0 ; 0x102011c50
0x1004d85c2: mov qword ptr [rip + 0x1b39627], rcx ; 0x102011bf0
0x1004d85c9: lea rcx, [rip + 0x6b5b5d] ; 0x100b8e12d kDisplayWater
0x1004d85d0: mov qword ptr [rip + 0x1b39681], rcx ; 0x102011c58
0x1004d85d7: lea rcx, [rip + 0x1b3967a] ; 0x102011c58
0x1004d85de: mov qword ptr [rip + 0x1b39683], rax ; 0x102011c68
0x1004d85e5: lea rax, [rip + 0x7fae31] ; 0x100cd341d
0x1004d85ec: vmovq xmm3, rax
0x1004d85f1: vpunpcklqdq xmm3, xmm1, xmm3
0x1004d85f5: vmovdqu xmmword ptr [rip + 0x1b3967b], xmm3 ; 0x102011c78
0x1004d85fd: mov qword ptr [rip + 0x1b39684], r14 ; 0x102011c88
0x1004d8604: mov qword ptr [rip + 0x1b39681], 0 ; 0x102011c90
0x1004d860f: mov qword ptr [rip + 0x1b39682], rbx ; 0x102011c98
0x1004d8616: mov qword ptr [rip + 0x1b3967f], 0 ; 0x102011ca0
0x1004d8621: vmovdqa xmmword ptr [rip + 0x1b39687], xmm2 ; 0x102011cb0
0x1004d8629: lea rax, [rip + 0x1b39680] ; 0x102011cb0
0x1004d8630: mov qword ptr [rip + 0x1b39685], 0 ; 0x102011cc0
0x1004d863b: mov qword ptr [rip + 0x1b3961e], rax ; 0x102011c60
0x1004d8642: lea rax, [rip + 0x6b5af2] ; 0x100b8e13b kResetWaterSim
0x1004d8649: mov qword ptr [rip + 0x1b39680], rax ; 0x102011cd0
0x1004d8650: lea rax, [rip + 0x1b39679] ; 0x102011cd0
0x1004d8657: mov qword ptr [rip + 0x1b39682], rcx ; 0x102011ce0
0x1004d865e: lea rcx, [rip + 0x1b39663] ; 0x102011cc8
0x1004d8665: vmovq xmm3, rcx
0x1004d866a: vpunpcklqdq xmm3, xmm1, xmm3
0x1004d866e: vmovdqu xmmword ptr [rip + 0x1b3967a], xmm3 ; 0x102011cf0
0x1004d8676: mov qword ptr [rip + 0x1b39683], r14 ; 0x102011d00
0x1004d867d: mov qword ptr [rip + 0x1b39680], 0 ; 0x102011d08
0x1004d8688: mov qword ptr [rip + 0x1b39681], rbx ; 0x102011d10
0x1004d868f: mov qword ptr [rip + 0x1b3967e], 0 ; 0x102011d18
0x1004d869a: vmovdqa xmmword ptr [rip + 0x1b3967e], xmm2 ; 0x102011d20
0x1004d86a2: lea rcx, [rip + 0x1b39677] ; 0x102011d20
0x1004d86a9: mov qword ptr [rip + 0x1b3967c], 0 ; 0x102011d30
0x1004d86b4: mov qword ptr [rip + 0x1b3961d], rcx ; 0x102011cd8
0x1004d86bb: lea rcx, [rip + 0x6b5a88] ; 0x100b8e14a kCloudDampsSound
0x1004d86c2: mov qword ptr [rip + 0x1b3966f], rcx ; 0x102011d38
0x1004d86c9: lea rcx, [rip + 0x1b39668] ; 0x102011d38
0x1004d86d0: mov qword ptr [rip + 0x1b39671], rax ; 0x102011d48
0x1004d86d7: mov qword ptr [rip + 0x7b75c2], rcx ; 0x100c8fca0
0x1004d86de: lea rax, [rip + 0x7fad39] ; 0x100cd341e
0x1004d86e5: vmovq xmm2, rax
0x1004d86ea: vpunpcklqdq xmm1, xmm1, xmm2
0x1004d86ee: vmovdqu xmmword ptr [rip + 0x1b39662], xmm1 ; 0x102011d58
0x1004d86f6: mov qword ptr [rip + 0x1b3966b], r14 ; 0x102011d68
0x1004d86fd: mov qword ptr [rip + 0x1b39668], 0 ; 0x102011d70
0x1004d8708: mov qword ptr [rip + 0x1b39669], rbx ; 0x102011d78
0x1004d870f: mov qword ptr [rip + 0x1b39666], 0 ; 0x102011d80
0x1004d871a: lea rax, [rip + 0x689c08] ; 0x100b62329 Audio
0x1004d8721: vmovq xmm1, rax
0x1004d8726: vpunpcklqdq xmm0, xmm0, xmm1
0x1004d872a: vmovdqa xmmword ptr [rip + 0x1b3965e], xmm0 ; 0x102011d90
0x1004d8732: lea rax, [rip + 0x1b39657] ; 0x102011d90
0x1004d8739: mov qword ptr [rip + 0x1b3965c], 0 ; 0x102011da0
0x1004d8744: mov qword ptr [rip + 0x1b395f5], rax ; 0x102011d40
0x1004d874b: lea r15, [rip + 0x69d6f1] ; 0x100b75e43 Water
0x1004d8752: mov qword ptr [rip + 0x1b39657], r15 ; 0x102011db0
0x1004d8759: lea rax, [rip + 0x1b39648] ; 0x102011da8
0x1004d8760: mov qword ptr [rip + 0x1b3964d], 0 ; 0x102011db8
0x1004d876b: mov rcx, qword ptr [rip + 0x7977e6] ; 0x100c6ff58
0x1004d8772: mov qword ptr [rip + 0x1b39647], rcx ; 0x102011dc0
0x1004d8779: mov qword ptr [rip + 0x7977d8], rax ; 0x100c6ff58
0x1004d8780: mov qword ptr [rip + 0x1b39649], rax ; 0x102011dd0
0x1004d8787: lea rax, [rip - 0x4a2ece] ; 0x1000358c0
0x1004d878e: mov qword ptr [rip + 0x1b39643], rax ; 0x102011dd8
0x1004d8795: mov dword ptr [rip + 0x1b39641], 0xffffffff ; 0x102011de0
0x1004d879f: mov dword ptr [rip + 0x1b3963b], 0xffffffff ; 0x102011de4
0x1004d87a9: mov qword ptr [rip + 0x1b3964c], 0 ; 0x102011e00
0x1004d87b4: mov rax, qword ptr [rip + 0x733ced] ; 0x100c0c4a8
0x1004d87bb: add rax, 0x10
0x1004d87bf: mov qword ptr [rip + 0x1b395e2], rax ; 0x102011da8
0x1004d87c6: xor eax, eax
0x1004d87c8: call 0x100011c10 ; 0x100011c10
0x1004d87cd: lea rax, [rip + 0x68620b] ; 0x100b5e9df true
0x1004d87d4: vmovq xmm0, rax
0x1004d87d9: lea rax, [rip + 0x68785c] ; 0x100b6003c Tool_Export
0x1004d87e0: vmovq xmm1, rax
0x1004d87e5: vpunpcklqdq xmm0, xmm1, xmm0
0x1004d87e9: vmovdqa xmmword ptr [rip + 0x1b3961f], xmm0 ; 0x102011e10
0x1004d87f1: lea rax, [rip + 0x1b39618] ; 0x102011e10
0x1004d87f8: mov rcx, qword ptr [rip + 0x1b395b9] ; 0x102011db8
0x1004d87ff: mov qword ptr [rip + 0x1b3961a], rcx ; 0x102011e20
0x1004d8806: mov qword ptr [rip + 0x1b395ab], rax ; 0x102011db8
0x1004d880d: lea rax, [rip + 0x6928ab] ; 0x100b6b0bf transform
0x1004d8814: mov qword ptr [rip + 0x7fac05], rax ; 0x100cd3420
0x1004d881b: lea rax, [rip + 0x7fabfe] ; 0x100cd3420
0x1004d8822: mov qword ptr [rip + 0x7fabfb], 0 ; 0x100cd3428
0x1004d882d: mov rcx, qword ptr [rip + 0x79f42c] ; 0x100c77c60
0x1004d8834: mov qword ptr [rip + 0x7fabf5], rcx ; 0x100cd3430
0x1004d883b: mov qword ptr [rip + 0x7fabfa], 0x10 ; 0x100cd3440
0x1004d8846: mov rcx, qword ptr [rip + 0x72e57b] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x1004d884d: mov qword ptr [rip + 0x7fabf4], rcx ; 0x100cd3448
0x1004d8854: mov rcx, qword ptr [rip + 0x72fde5] ; 0x100c08640 -> 0x1004d73e0 __Z18GetMetaClassByTypeIP5WaterERK9MetaClassv
0x1004d885b: mov qword ptr [rip + 0x7fabee], rcx ; 0x100cd3450
0x1004d8862: mov qword ptr [rip + 0x7fabeb], 0xffffffffffffffff ; 0x100cd3458
0x1004d886d: mov qword ptr [rip + 0x7fabec], rbx ; 0x100cd3460
0x1004d8874: mov qword ptr [rip + 0x7fabe9], 0 ; 0x100cd3468
0x1004d887f: lea rdx, [rip + 0x6b58d5] ; 0x100b8e15b sunShadowed
0x1004d8886: mov qword ptr [rip + 0x7fabe3], rdx ; 0x100cd3470
0x1004d888d: lea rdx, [rip + 0x7fabdc] ; 0x100cd3470
0x1004d8894: mov qword ptr [rip + 0x7fabd9], 0 ; 0x100cd3478
0x1004d889f: mov qword ptr [rip + 0x7fabda], rax ; 0x100cd3480
0x1004d88a6: mov qword ptr [rip + 0x79f3b3], rdx ; 0x100c77c60
0x1004d88ad: mov qword ptr [rip + 0x7fabd8], 0x50 ; 0x100cd3490
0x1004d88b8: mov qword ptr [rip + 0x7fabd9], r14 ; 0x100cd3498
0x1004d88bf: mov qword ptr [rip + 0x7fabda], rcx ; 0x100cd34a0
0x1004d88c6: mov qword ptr [rip + 0x7fabd7], 0xffffffffffffffff ; 0x100cd34a8
0x1004d88d1: mov qword ptr [rip + 0x7fabd8], rbx ; 0x100cd34b0
0x1004d88d8: mov qword ptr [rip + 0x7fabd5], 0 ; 0x100cd34b8
0x1004d88e3: mov qword ptr [rip + 0x1b39546], r12 ; 0x102011e30
0x1004d88ea: lea rax, [rip + 0x1b39537] ; 0x102011e28
0x1004d88f1: mov qword ptr [rip + 0x1b3953c], 0 ; 0x102011e38
0x1004d88fc: mov rcx, qword ptr [rip + 0x797655] ; 0x100c6ff58
0x1004d8903: mov qword ptr [rip + 0x1b39536], rcx ; 0x102011e40
0x1004d890a: mov qword ptr [rip + 0x797647], rax ; 0x100c6ff58
0x1004d8911: mov qword ptr [rip + 0x1b39538], rax ; 0x102011e50
0x1004d8918: mov rax, qword ptr [rip + 0x72fd91] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1004d891f: mov qword ptr [rip + 0x1b39532], rax ; 0x102011e58
0x1004d8926: mov dword ptr [rip + 0x1b39530], 0xffffffff ; 0x102011e60
0x1004d8930: mov dword ptr [rip + 0x1b3952a], 0xffffffff ; 0x102011e64
0x1004d893a: mov qword ptr [rip + 0x1b3953b], 0 ; 0x102011e80
0x1004d8945: mov rax, qword ptr [rip + 0x733b24] ; 0x100c0c470
0x1004d894c: add rax, 0x10
0x1004d8950: mov qword ptr [rip + 0x1b394d1], rax ; 0x102011e28
0x1004d8957: xor eax, eax
0x1004d8959: call 0x100011c10 ; 0x100011c10
0x1004d895e: lea rax, [rip + 0x683fa7] ; 0x100b5c90c Initialize
0x1004d8965: mov qword ptr [rip + 0x1b3951c], rax ; 0x102011e88
0x1004d896c: lea rcx, [rip + 0x1b39515] ; 0x102011e88
0x1004d8973: mov qword ptr [rip + 0x1b39512], 0 ; 0x102011e90
0x1004d897e: mov rax, qword ptr [rip + 0x7975db] ; 0x100c6ff60
0x1004d8985: mov qword ptr [rip + 0x1b3950c], rax ; 0x102011e98
0x1004d898c: lea rax, [rip - 0x4723] ; 0x1004d4270
0x1004d8993: vmovq xmm0, rax
0x1004d8998: vmovdqu xmmword ptr [rip + 0x1b39520], xmm0 ; 0x102011ec0
0x1004d89a0: mov rax, qword ptr [rip + 0x72d909] ; 0x100c062b0 0xM
0x1004d89a7: mov qword ptr [rip + 0x1b39522], rax ; 0x102011ed0
0x1004d89ae: mov rax, qword ptr [rip + 0x73118b] ; 0x100c09b40 @xM
0x1004d89b5: mov qword ptr [rip + 0x1b3951c], rax ; 0x102011ed8
0x1004d89bc: mov rax, qword ptr [rip + 0x72fc5d] ; 0x100c08620  xM
0x1004d89c3: mov qword ptr [rip + 0x1b39516], rax ; 0x102011ee0
0x1004d89ca: lea rdx, [rip + 0x688074] ; 0x100b60a45 OnLevelLoad
0x1004d89d1: mov qword ptr [rip + 0x1b39510], rdx ; 0x102011ee8
0x1004d89d8: lea rdx, [rip + 0x1b39509] ; 0x102011ee8
0x1004d89df: mov qword ptr [rip + 0x1b39512], rcx ; 0x102011ef8
0x1004d89e6: lea rcx, [rip - 0x40dd] ; 0x1004d4910
0x1004d89ed: vmovq xmm0, rcx
0x1004d89f2: vmovdqu xmmword ptr [rip + 0x1b39526], xmm0 ; 0x102011f20
0x1004d89fa: mov rcx, qword ptr [rip + 0x72d8b7] ; 0x100c062b8 0zM
0x1004d8a01: mov qword ptr [rip + 0x1b39528], rcx ; 0x102011f30
0x1004d8a08: mov rcx, qword ptr [rip + 0x731139] ; 0x100c09b48 @zM
0x1004d8a0f: mov qword ptr [rip + 0x1b39522], rcx ; 0x102011f38
0x1004d8a16: mov qword ptr [rip + 0x1b39523], rax ; 0x102011f40
0x1004d8a1d: lea rcx, [rip + 0x68802d] ; 0x100b60a51 levelName
0x1004d8a24: vmovq xmm0, rcx
0x1004d8a29: lea rcx, [rip + 0x683ee7] ; 0x100b5c917 ArgName
0x1004d8a30: vmovq xmm1, rcx
0x1004d8a35: vpunpcklqdq xmm0, xmm1, xmm0
0x1004d8a39: vmovdqa xmmword ptr [rip + 0x1b3950f], xmm0 ; 0x102011f50
0x1004d8a41: lea rcx, [rip + 0x1b39508] ; 0x102011f50
0x1004d8a48: mov qword ptr [rip + 0x1b3950d], 0 ; 0x102011f60
0x1004d8a53: mov qword ptr [rip + 0x1b39496], rcx ; 0x102011ef0
0x1004d8a5a: lea rcx, [rip + 0x687ffa] ; 0x100b60a5b OnLevelUnload
0x1004d8a61: mov qword ptr [rip + 0x1b39500], rcx ; 0x102011f68
0x1004d8a68: lea rsi, [rip + 0x1b394f9] ; 0x102011f68
0x1004d8a6f: mov qword ptr [rip + 0x1b394f6], 0 ; 0x102011f70
0x1004d8a7a: mov qword ptr [rip + 0x1b394f7], rdx ; 0x102011f78
0x1004d8a81: lea rcx, [rip - 0x39a8] ; 0x1004d50e0
0x1004d8a88: vmovq xmm0, rcx
0x1004d8a8d: vmovdqu xmmword ptr [rip + 0x1b3950b], xmm0 ; 0x102011fa0
0x1004d8a95: mov rcx, qword ptr [rip + 0x72d82c] ; 0x100c062c8 -> 0x1004d7c00 __Z12ApplyWrapperI5OceanMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1004d8a9c: mov qword ptr [rip + 0x1b3950d], rcx ; 0x102011fb0
0x1004d8aa3: mov rdx, qword ptr [rip + 0x7310ae] ; 0x100c09b58 `|M
0x1004d8aaa: mov qword ptr [rip + 0x1b39507], rdx ; 0x102011fb8
0x1004d8ab1: mov qword ptr [rip + 0x1b39508], rax ; 0x102011fc0
0x1004d8ab8: lea rdi, [rip + 0x683e79] ; 0x100b5c938 Terminate
0x1004d8abf: mov qword ptr [rip + 0x1b39502], rdi ; 0x102011fc8
0x1004d8ac6: lea rdi, [rip + 0x1b394fb] ; 0x102011fc8
0x1004d8acd: mov qword ptr [rip + 0x1b394f8], 0 ; 0x102011fd0
0x1004d8ad8: mov qword ptr [rip + 0x1b394f9], rsi ; 0x102011fd8
0x1004d8adf: lea rsi, [rip - 0x3986] ; 0x1004d5160
0x1004d8ae6: vmovq xmm0, rsi
0x1004d8aeb: vmovdqu xmmword ptr [rip + 0x1b3950d], xmm0 ; 0x102012000
0x1004d8af3: mov qword ptr [rip + 0x1b39516], rcx ; 0x102012010
0x1004d8afa: mov qword ptr [rip + 0x1b39517], rdx ; 0x102012018
0x1004d8b01: mov qword ptr [rip + 0x1b39518], rax ; 0x102012020
0x1004d8b08: lea rsi, [rip + 0x683e3e] ; 0x100b5c94d Update
0x1004d8b0f: mov qword ptr [rip + 0x1b39512], rsi ; 0x102012028
0x1004d8b16: lea rsi, [rip + 0x1b3950b] ; 0x102012028
0x1004d8b1d: mov qword ptr [rip + 0x1b39508], 0 ; 0x102012030
0x1004d8b28: mov qword ptr [rip + 0x1b39509], rdi ; 0x102012038
0x1004d8b2f: lea rdi, [rip - 0x39a6] ; 0x1004d5190
0x1004d8b36: vmovq xmm0, rdi
0x1004d8b3b: vmovdqu xmmword ptr [rip + 0x1b3951d], xmm0 ; 0x102012060
0x1004d8b43: mov rdi, qword ptr [rip + 0x72d776] ; 0x100c062c0 -> 0x1004d7c80 __Z12ApplyWrapperI5OceanMS0_FvP4GameP6CameraP10ControllerP10ShaderDataEEvM9VoidClassFvvEPv8VariablePSF_j
0x1004d8b4a: mov qword ptr [rip + 0x1b3951f], rdi ; 0x102012070
0x1004d8b51: mov rdi, qword ptr [rip + 0x730ff8] ; 0x100c09b50 -> 0x1004d7c90 __Z21InitFunctionSignatureIM5OceanFvP4GameP6CameraP10ControllerP10ShaderDataEEvP17FunctionSignature
0x1004d8b58: mov qword ptr [rip + 0x1b39519], rdi ; 0x102012078
0x1004d8b5f: mov qword ptr [rip + 0x1b3951a], rax ; 0x102012080
0x1004d8b66: lea rdi, [rip + 0x6892a0] ; 0x100b61e0d BuildScene
0x1004d8b6d: mov qword ptr [rip + 0x1b39514], rdi ; 0x102012088
0x1004d8b74: lea rdi, [rip + 0x1b3950d] ; 0x102012088
0x1004d8b7b: mov qword ptr [rip + 0x1b3950a], 0 ; 0x102012090
0x1004d8b86: mov qword ptr [rip + 0x1b3950b], rsi ; 0x102012098
0x1004d8b8d: lea rsi, [rip - 0x2d44] ; 0x1004d5e50
0x1004d8b94: vmovq xmm0, rsi
0x1004d8b99: vmovdqu xmmword ptr [rip + 0x1b3951f], xmm0 ; 0x1020120c0
0x1004d8ba1: mov qword ptr [rip + 0x1b39528], rcx ; 0x1020120d0
0x1004d8ba8: mov qword ptr [rip + 0x1b39529], rdx ; 0x1020120d8
0x1004d8baf: mov qword ptr [rip + 0x1b3952a], rax ; 0x1020120e0
0x1004d8bb6: lea rsi, [rip + 0x689244] ; 0x100b61e01 RenderFlush
0x1004d8bbd: mov qword ptr [rip + 0x1b39524], rsi ; 0x1020120e8
0x1004d8bc4: lea rsi, [rip + 0x1b3951d] ; 0x1020120e8
0x1004d8bcb: mov qword ptr [rip + 0x1b3951a], 0 ; 0x1020120f0
0x1004d8bd6: mov qword ptr [rip + 0x1b3951b], rdi ; 0x1020120f8
0x1004d8bdd: lea rdi, [rip - 0x2d64] ; 0x1004d5e80
0x1004d8be4: vmovq xmm0, rdi
0x1004d8be9: vmovdqu xmmword ptr [rip + 0x1b3952f], xmm0 ; 0x102012120
0x1004d8bf1: mov qword ptr [rip + 0x1b39538], rcx ; 0x102012130
0x1004d8bf8: mov qword ptr [rip + 0x1b39539], rdx ; 0x102012138
0x1004d8bff: mov qword ptr [rip + 0x1b3953a], rax ; 0x102012140
0x1004d8c06: lea rcx, [rip + 0x6b555a] ; 0x100b8e167 CreateWater
0x1004d8c0d: mov qword ptr [rip + 0x1b39534], rcx ; 0x102012148
0x1004d8c14: lea rcx, [rip + 0x1b3952d] ; 0x102012148
0x1004d8c1b: mov qword ptr [rip + 0x1b39536], rsi ; 0x102012158
0x1004d8c22: mov qword ptr [rip + 0x797337], rcx ; 0x100c6ff60
0x1004d8c29: lea rcx, [rip - 0x2d80] ; 0x1004d5eb0
0x1004d8c30: vmovq xmm0, rcx
0x1004d8c35: vmovdqu xmmword ptr [rip + 0x1b39543], xmm0 ; 0x102012180
0x1004d8c3d: mov rcx, qword ptr [rip + 0x72d664] ; 0x100c062a8 -> 0x1004d7e80 __Z12ApplyWrapperI5OceanMS0_FP5WaterPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x1004d8c44: mov qword ptr [rip + 0x1b39545], rcx ; 0x102012190
0x1004d8c4b: mov rcx, qword ptr [rip + 0x730ee6] ; 0x100c09b38 -> 0x1004d7f40 __Z21InitFunctionSignatureIM5OceanFP5WaterPK9MetaClassEEvP17FunctionSignature
0x1004d8c52: mov qword ptr [rip + 0x1b3953f], rcx ; 0x102012198
0x1004d8c59: mov qword ptr [rip + 0x1b39540], rax ; 0x1020121a0
0x1004d8c60: vmovq xmm0, r15
0x1004d8c65: lea rax, [rip + 0x69e45c] ; 0x100b770c8 ObjectFactory_CreatesType
0x1004d8c6c: vmovq xmm1, rax
0x1004d8c71: vpunpcklqdq xmm0, xmm1, xmm0
0x1004d8c75: vmovdqa xmmword ptr [rip + 0x1b39533], xmm0 ; 0x1020121b0
0x1004d8c7d: lea rax, [rip + 0x1b3952c] ; 0x1020121b0
0x1004d8c84: mov qword ptr [rip + 0x1b39531], 0 ; 0x1020121c0
0x1004d8c8f: mov qword ptr [rip + 0x1b394ba], rax ; 0x102012150
0x1004d8c96: lea rax, [rip + 0x6b55ec] ; 0x100b8e289 SetOceanRender
0x1004d8c9d: mov qword ptr [rip + 0x1b3952c], rax ; 0x1020121d0
0x1004d8ca4: lea rax, [rip + 0x1b3951d] ; 0x1020121c8
0x1004d8cab: mov qword ptr [rip + 0x1b39522], 0 ; 0x1020121d8
0x1004d8cb6: mov rcx, qword ptr [rip + 0x79729b] ; 0x100c6ff58
0x1004d8cbd: mov qword ptr [rip + 0x1b3951c], rcx ; 0x1020121e0
0x1004d8cc4: mov qword ptr [rip + 0x79728d], rax ; 0x100c6ff58
0x1004d8ccb: mov qword ptr [rip + 0x1b3951e], rax ; 0x1020121f0
0x1004d8cd2: mov rax, qword ptr [rip + 0x72f90f] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x1004d8cd9: mov qword ptr [rip + 0x1b39518], rax ; 0x1020121f8
0x1004d8ce0: mov dword ptr [rip + 0x1b39516], 0xffffffff ; 0x102012200
0x1004d8cea: mov dword ptr [rip + 0x1b39510], 0xffffffff ; 0x102012204
0x1004d8cf4: mov qword ptr [rip + 0x1b39521], 0 ; 0x102012220
0x1004d8cff: mov rax, qword ptr [rip + 0x7327e2] ; 0x100c0b4e8
0x1004d8d06: add rax, 0x10
0x1004d8d0a: mov qword ptr [rip + 0x1b394b7], rax ; 0x1020121c8
0x1004d8d11: xor eax, eax
0x1004d8d13: call 0x100011c10 ; 0x100011c10
0x1004d8d18: lea rax, [rip + 0x6ca30d] ; 0x100ba302c false
0x1004d8d1f: vmovq xmm0, rax
0x1004d8d24: lea rax, [rip + 0x685ca0] ; 0x100b5e9cb Tool_AutoStartEvent
0x1004d8d2b: vmovq xmm1, rax
0x1004d8d30: vpunpcklqdq xmm0, xmm1, xmm0
0x1004d8d34: vmovdqa xmmword ptr [rip + 0x1b394f4], xmm0 ; 0x102012230
0x1004d8d3c: lea rax, [rip + 0x1b394ed] ; 0x102012230
0x1004d8d43: mov rcx, qword ptr [rip + 0x1b3948e] ; 0x1020121d8
0x1004d8d4a: mov qword ptr [rip + 0x1b394ef], rcx ; 0x102012240
0x1004d8d51: mov qword ptr [rip + 0x1b39480], rax ; 0x1020121d8
0x1004d8d58: lea rax, [rip + 0x6ae485] ; 0x100b871e4 render
0x1004d8d5f: mov qword ptr [rip + 0x7fa75a], rax ; 0x100cd34c0
0x1004d8d66: lea rax, [rip + 0x7fa753] ; 0x100cd34c0
0x1004d8d6d: mov qword ptr [rip + 0x7fa750], 0 ; 0x100cd34c8
0x1004d8d78: mov rcx, qword ptr [rip + 0x79eee1] ; 0x100c77c60
0x1004d8d7f: mov qword ptr [rip + 0x7fa74a], rcx ; 0x100cd34d0
0x1004d8d86: mov qword ptr [rip + 0x79eed3], rax ; 0x100c77c60
0x1004d8d8d: mov qword ptr [rip + 0x7fa748], 0x38 ; 0x100cd34e0
0x1004d8d98: mov qword ptr [rip + 0x7fa749], r14 ; 0x100cd34e8
0x1004d8d9f: mov rax, qword ptr [rip + 0x72f002] ; 0x100c07da8 -> 0x1004d82b0 __Z18GetMetaClassByTypeIP14SetOceanRenderERK9MetaClassv
0x1004d8da6: mov qword ptr [rip + 0x7fa743], rax ; 0x100cd34f0
0x1004d8dad: mov qword ptr [rip + 0x7fa740], 0xffffffffffffffff ; 0x100cd34f8
0x1004d8db8: mov qword ptr [rip + 0x7fa741], rbx ; 0x100cd3500
0x1004d8dbf: mov qword ptr [rip + 0x7fa73e], 0 ; 0x100cd3508
0x1004d8dca: pop rbx
0x1004d8dcb: pop r12
0x1004d8dcd: pop r14
0x1004d8dcf: pop r15
0x1004d8dd1: pop rbp
0x1004d8dd2: ret 
0x1004d8dd3: nop 
0x1004d8dd4: nop 
0x1004d8dd5: nop 
0x1004d8dd6: nop 
0x1004d8dd7: nop 
0x1004d8dd8: nop 
0x1004d8dd9: nop 
0x1004d8dda: nop 
0x1004d8ddb: nop 
0x1004d8ddc: nop 
0x1004d8ddd: nop 
0x1004d8dde: nop 
0x1004d8ddf: nop 
