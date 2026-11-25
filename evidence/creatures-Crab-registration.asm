0x100261540: push rbp
0x100261541: mov rbp, rsp
0x100261544: push r14
0x100261546: push rbx
0x100261547: sub rsp, 0x20
0x10026154b: mov dword ptr [rip + 0xac9e5b], 0 ; 0x100d2b3b0
0x100261555: lea rax, [rip + 0x91af72] ; 0x100b7c4ce CrabAi
0x10026155c: mov qword ptr [rip + 0x1b84365], rax ; 0x101de58c8
0x100261563: lea rax, [rip + 0x1b84356] ; 0x101de58c0
0x10026156a: mov qword ptr [rip + 0x1b8435b], 0 ; 0x101de58d0
0x100261575: mov rcx, qword ptr [rip + 0xa0e9dc] ; 0x100c6ff58
0x10026157c: mov qword ptr [rip + 0x1b84355], rcx ; 0x101de58d8
0x100261583: mov qword ptr [rip + 0xa0e9ce], rax ; 0x100c6ff58
0x10026158a: mov qword ptr [rip + 0x1b84357], rax ; 0x101de58e8
0x100261591: lea rax, [rip - 0x22bcd8] ; 0x1000358c0
0x100261598: mov qword ptr [rip + 0x1b84351], rax ; 0x101de58f0
0x10026159f: mov qword ptr [rip + 0x1b8434e], 0xffffffffffffffff ; 0x101de58f8
0x1002615aa: mov qword ptr [rip + 0x1b84363], 0 ; 0x101de5918
0x1002615b5: mov rax, qword ptr [rip + 0x9aaf2c] ; 0x100c0c4e8
0x1002615bc: add rax, 0x10
0x1002615c0: mov qword ptr [rip + 0x1b842f9], rax ; 0x101de58c0
0x1002615c7: xor eax, eax
0x1002615c9: call 0x100011c10 ; 0x100011c10
0x1002615ce: lea rax, [rip + 0x91af00] ; 0x100b7c4d5 CrabParams
0x1002615d5: mov qword ptr [rip + 0x1b8434c], rax ; 0x101de5928
0x1002615dc: lea rax, [rip + 0x1b8433d] ; 0x101de5920
0x1002615e3: mov qword ptr [rip + 0x1b84342], 0 ; 0x101de5930
0x1002615ee: mov rcx, qword ptr [rip + 0xa0e963] ; 0x100c6ff58
0x1002615f5: mov qword ptr [rip + 0x1b8433c], rcx ; 0x101de5938
0x1002615fc: mov qword ptr [rip + 0xa0e955], rax ; 0x100c6ff58
0x100261603: mov qword ptr [rip + 0x1b8433e], rax ; 0x101de5948
0x10026160a: mov rax, qword ptr [rip + 0x9a6bf7] ; 0x100c08208 -> 0x1001a67e0 __Z18GetMetaClassByTypeIP18LevelAllocatedDataERK9MetaClassv
0x100261611: mov qword ptr [rip + 0x1b84338], rax ; 0x101de5950
0x100261618: mov qword ptr [rip + 0x1b84335], 0xffffffffffffffff ; 0x101de5958
0x100261623: mov qword ptr [rip + 0x1b8434a], 0 ; 0x101de5978
0x10026162e: mov rax, qword ptr [rip + 0x9a9333] ; 0x100c0a968
0x100261635: add rax, 0x10
0x100261639: mov qword ptr [rip + 0x1b842e0], rax ; 0x101de5920
0x100261640: xor eax, eax
0x100261642: call 0x100011c10 ; 0x100011c10
0x100261647: lea rax, [rip + 0x9162fc] ; 0x100b7794a meshType
0x10026164e: mov qword ptr [rip + 0xa3914b], rax ; 0x100c9a7a0
0x100261655: lea rcx, [rip + 0xa39144] ; 0x100c9a7a0
0x10026165c: mov rax, qword ptr [rip + 0xa165fd] ; 0x100c77c60
0x100261663: mov qword ptr [rip + 0xa39146], rax ; 0x100c9a7b0
0x10026166a: mov qword ptr [rip + 0xa3914b], 8 ; 0x100c9a7c0
0x100261675: mov rax, qword ptr [rip + 0x9a5e3c] ; 0x100c074b8 -> 0x1000522e0 __Z17GetMetaTypeByTypeIP9LevelMeshERK8MetaTypev
0x10026167c: mov qword ptr [rip + 0xa39145], rax ; 0x100c9a7c8
0x100261683: mov rax, qword ptr [rip + 0x9a5f7e] ; 0x100c07608 -> 0x10025fc20 __Z18GetMetaClassByTypeIP10CrabParamsERK9MetaClassv
0x10026168a: mov qword ptr [rip + 0xa3913f], rax ; 0x100c9a7d0
0x100261691: mov qword ptr [rip + 0xa3913c], 0xffffffffffffffff ; 0x100c9a7d8
0x10026169c: lea rbx, [rip - 0x247c83] ; 0x100019a20
0x1002616a3: mov qword ptr [rip + 0xa39136], rbx ; 0x100c9a7e0
0x1002616aa: mov qword ptr [rip + 0xa39133], 0 ; 0x100c9a7e8
0x1002616b5: lea rdx, [rip + 0x8fd35d] ; 0x100b5ea19 Tool_Nullable
0x1002616bc: vmovq xmm0, rdx
0x1002616c1: lea rdx, [rip + 0x8fd317] ; 0x100b5e9df true
0x1002616c8: vmovq xmm1, rdx
0x1002616cd: vmovdqa xmmword ptr [rbp - 0x30], xmm1
0x1002616d2: vpunpcklqdq xmm0, xmm0, xmm1
0x1002616d6: vmovdqa xmmword ptr [rip + 0x1b842a2], xmm0 ; 0x101de5980
0x1002616de: lea rdx, [rip + 0x1b8429b] ; 0x101de5980
0x1002616e5: mov qword ptr [rip + 0x1b842a0], 0 ; 0x101de5990
0x1002616f0: lea rsi, [rip + 0x8fd3a0] ; 0x100b5ea97 null
0x1002616f7: vmovq xmm0, rsi
0x1002616fc: lea rsi, [rip + 0x8fd2ff] ; 0x100b5ea02 Tool_DefaultValue
0x100261703: vmovq xmm1, rsi
0x100261708: vpunpcklqdq xmm0, xmm1, xmm0
0x10026170c: vmovdqa xmm3, xmm1
0x100261710: vmovdqa xmmword ptr [rip + 0x1b84288], xmm0 ; 0x101de59a0
0x100261718: lea rsi, [rip + 0x1b84281] ; 0x101de59a0
0x10026171f: mov qword ptr [rip + 0x1b8428a], rdx ; 0x101de59b0
0x100261726: mov qword ptr [rip + 0xa3907b], rsi ; 0x100c9a7a8
0x10026172d: lea rdx, [rip + 0x911409] ; 0x100b72b3d radius
0x100261734: mov qword ptr [rip + 0xa390b5], rdx ; 0x100c9a7f0
0x10026173b: lea rdx, [rip + 0xa390ae] ; 0x100c9a7f0
0x100261742: mov qword ptr [rip + 0xa390ab], 0 ; 0x100c9a7f8
0x10026174d: mov qword ptr [rip + 0xa390ac], rcx ; 0x100c9a800
0x100261754: mov qword ptr [rip + 0xa390b1], 0x10 ; 0x100c9a810
0x10026175f: mov rcx, qword ptr [rip + 0x9a5dfa] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x100261766: mov qword ptr [rip + 0xa390ab], rcx ; 0x100c9a818
0x10026176d: mov qword ptr [rip + 0xa390ac], rax ; 0x100c9a820
0x100261774: mov qword ptr [rip + 0xa390a9], 0xffffffffffffffff ; 0x100c9a828
0x10026177f: mov qword ptr [rip + 0xa390aa], rbx ; 0x100c9a830
0x100261786: mov qword ptr [rip + 0xa390a7], 0 ; 0x100c9a838
0x100261791: lea rsi, [rip + 0x91702c] ; 0x100b787c4 walkSpeed
0x100261798: mov qword ptr [rip + 0xa390a1], rsi ; 0x100c9a840
0x10026179f: lea rsi, [rip + 0xa3909a] ; 0x100c9a840
0x1002617a6: mov qword ptr [rip + 0xa39097], 0 ; 0x100c9a848
0x1002617b1: mov qword ptr [rip + 0xa39098], rdx ; 0x100c9a850
0x1002617b8: mov qword ptr [rip + 0xa3909d], 0x14 ; 0x100c9a860
0x1002617c3: mov qword ptr [rip + 0xa3909e], rcx ; 0x100c9a868
0x1002617ca: mov qword ptr [rip + 0xa3909f], rax ; 0x100c9a870
0x1002617d1: mov qword ptr [rip + 0xa3909c], 0xffffffffffffffff ; 0x100c9a878
0x1002617dc: mov qword ptr [rip + 0xa3909d], rbx ; 0x100c9a880
0x1002617e3: mov qword ptr [rip + 0xa3909a], 0 ; 0x100c9a888
0x1002617ee: lea rdx, [rip + 0x916fd9] ; 0x100b787ce runSpeed
0x1002617f5: mov qword ptr [rip + 0xa39094], rdx ; 0x100c9a890
0x1002617fc: lea rdx, [rip + 0xa3908d] ; 0x100c9a890
0x100261803: mov qword ptr [rip + 0xa3908a], 0 ; 0x100c9a898
0x10026180e: mov qword ptr [rip + 0xa3908b], rsi ; 0x100c9a8a0
0x100261815: mov qword ptr [rip + 0xa39090], 0x18 ; 0x100c9a8b0
0x100261820: mov qword ptr [rip + 0xa39091], rcx ; 0x100c9a8b8
0x100261827: mov qword ptr [rip + 0xa39092], rax ; 0x100c9a8c0
0x10026182e: mov qword ptr [rip + 0xa3908f], 0xffffffffffffffff ; 0x100c9a8c8
0x100261839: mov qword ptr [rip + 0xa39090], rbx ; 0x100c9a8d0
0x100261840: mov qword ptr [rip + 0xa3908d], 0 ; 0x100c9a8d8
0x10026184b: lea rcx, [rip + 0x91ac8e] ; 0x100b7c4e0 darkCrab
0x100261852: mov qword ptr [rip + 0xa39087], rcx ; 0x100c9a8e0
0x100261859: lea rcx, [rip + 0xa39080] ; 0x100c9a8e0
0x100261860: mov qword ptr [rip + 0xa3907d], 0 ; 0x100c9a8e8
0x10026186b: mov qword ptr [rip + 0xa3907e], rdx ; 0x100c9a8f0
0x100261872: mov qword ptr [rip + 0xa39083], 0x1c ; 0x100c9a900
0x10026187d: mov r14, qword ptr [rip + 0x9a5cd4] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x100261884: mov qword ptr [rip + 0xa3907d], r14 ; 0x100c9a908
0x10026188b: mov qword ptr [rip + 0xa3907e], rax ; 0x100c9a910
0x100261892: mov qword ptr [rip + 0xa3907b], 0xffffffffffffffff ; 0x100c9a918
0x10026189d: mov qword ptr [rip + 0xa3907c], rbx ; 0x100c9a920
0x1002618a4: mov qword ptr [rip + 0xa39079], 0 ; 0x100c9a928
0x1002618af: lea rdx, [rip + 0x916f21] ; 0x100b787d7 chase
0x1002618b6: mov qword ptr [rip + 0xa39073], rdx ; 0x100c9a930
0x1002618bd: lea rdx, [rip + 0xa3906c] ; 0x100c9a930
0x1002618c4: mov qword ptr [rip + 0xa39075], rcx ; 0x100c9a940
0x1002618cb: mov qword ptr [rip + 0xa3907a], 0x20 ; 0x100c9a950
0x1002618d6: mov rcx, qword ptr [rip + 0x9a54f3] ; 0x100c06dd0 -> 0x100066ac0 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Vector3EERK8MetaTypev
0x1002618dd: mov qword ptr [rip + 0xa39074], rcx ; 0x100c9a958
0x1002618e4: mov qword ptr [rip + 0xa39075], rax ; 0x100c9a960
0x1002618eb: mov qword ptr [rip + 0xa39072], 0xffffffffffffffff ; 0x100c9a968
0x1002618f6: mov qword ptr [rip + 0xa39073], rbx ; 0x100c9a970
0x1002618fd: mov qword ptr [rip + 0xa39070], 0 ; 0x100c9a978
0x100261908: lea rsi, [rip + 0x916ece] ; 0x100b787dd PersonalityModes
0x10026190f: vmovq xmm0, rsi
0x100261914: lea rsi, [rip + 0x902c74] ; 0x100b6458f Tool_Category
0x10026191b: vmovq xmm1, rsi
0x100261920: vpunpcklqdq xmm0, xmm1, xmm0
0x100261924: vmovdqa xmmword ptr [rip + 0x1b84094], xmm0 ; 0x101de59c0
0x10026192c: lea rsi, [rip + 0x1b8408d] ; 0x101de59c0
0x100261933: mov qword ptr [rip + 0x1b84092], 0 ; 0x101de59d0
0x10026193e: lea rdi, [rip + 0x91aba4] ; 0x100b7c4e9 ( 20.0, 5.0, 3.0 )
0x100261945: vmovq xmm1, rdi
0x10026194a: vpunpcklqdq xmm1, xmm3, xmm1
0x10026194e: vmovdqa xmmword ptr [rip + 0x1b8408a], xmm1 ; 0x101de59e0
0x100261956: lea rdi, [rip + 0x1b84083] ; 0x101de59e0
0x10026195d: mov qword ptr [rip + 0x1b8408c], rsi ; 0x101de59f0
0x100261964: mov qword ptr [rip + 0xa38fcd], rdi ; 0x100c9a938
0x10026196b: lea rsi, [rip + 0x91ab8a] ; 0x100b7c4fc flee
0x100261972: mov qword ptr [rip + 0xa39007], rsi ; 0x100c9a980
0x100261979: lea rsi, [rip + 0xa39000] ; 0x100c9a980
0x100261980: mov qword ptr [rip + 0xa39009], rdx ; 0x100c9a990
0x100261987: mov qword ptr [rip + 0xa3900e], 0x30 ; 0x100c9a9a0
0x100261992: mov qword ptr [rip + 0xa3900f], rcx ; 0x100c9a9a8
0x100261999: mov qword ptr [rip + 0xa39010], rax ; 0x100c9a9b0
0x1002619a0: mov qword ptr [rip + 0xa3900d], 0xffffffffffffffff ; 0x100c9a9b8
0x1002619ab: mov qword ptr [rip + 0xa3900e], rbx ; 0x100c9a9c0
0x1002619b2: mov qword ptr [rip + 0xa3900b], 0 ; 0x100c9a9c8
0x1002619bd: vmovdqa xmmword ptr [rip + 0x1b8403b], xmm0 ; 0x101de5a00
0x1002619c5: lea rdx, [rip + 0x1b84034] ; 0x101de5a00
0x1002619cc: mov qword ptr [rip + 0x1b84039], 0 ; 0x101de5a10
0x1002619d7: lea rdi, [rip + 0x91ab23] ; 0x100b7c501 ( 30.0, 5.0, 3.0 )
0x1002619de: vmovq xmm2, rdi
0x1002619e3: vpunpcklqdq xmm2, xmm3, xmm2
0x1002619e7: vmovdqa xmmword ptr [rip + 0x1b84031], xmm2 ; 0x101de5a20
0x1002619ef: lea rdi, [rip + 0x1b8402a] ; 0x101de5a20
0x1002619f6: mov qword ptr [rip + 0x1b84033], rdx ; 0x101de5a30
0x1002619fd: mov qword ptr [rip + 0xa38f84], rdi ; 0x100c9a988
0x100261a04: lea rdx, [rip + 0x909517] ; 0x100b6af22 hide
0x100261a0b: mov qword ptr [rip + 0xa38fbe], rdx ; 0x100c9a9d0
0x100261a12: lea rdx, [rip + 0xa38fb7] ; 0x100c9a9d0
0x100261a19: mov qword ptr [rip + 0xa38fc0], rsi ; 0x100c9a9e0
0x100261a20: mov qword ptr [rip + 0xa38fc5], 0x40 ; 0x100c9a9f0
0x100261a2b: mov qword ptr [rip + 0xa38fc6], rcx ; 0x100c9a9f8
0x100261a32: mov qword ptr [rip + 0xa38fc7], rax ; 0x100c9aa00
0x100261a39: mov qword ptr [rip + 0xa38fc4], 0xffffffffffffffff ; 0x100c9aa08
0x100261a44: mov qword ptr [rip + 0xa38fc5], rbx ; 0x100c9aa10
0x100261a4b: mov qword ptr [rip + 0xa38fc2], 0 ; 0x100c9aa18
0x100261a56: vmovdqa xmmword ptr [rip + 0x1b83fe2], xmm0 ; 0x101de5a40
0x100261a5e: lea rsi, [rip + 0x1b83fdb] ; 0x101de5a40
0x100261a65: mov qword ptr [rip + 0x1b83fe0], 0 ; 0x101de5a50
0x100261a70: vmovdqa xmmword ptr [rip + 0x1b83fe8], xmm1 ; 0x101de5a60
0x100261a78: lea rdi, [rip + 0x1b83fe1] ; 0x101de5a60
0x100261a7f: mov qword ptr [rip + 0x1b83fea], rsi ; 0x101de5a70
0x100261a86: mov qword ptr [rip + 0xa38f4b], rdi ; 0x100c9a9d8
0x100261a8d: lea rsi, [rip + 0x91aa80] ; 0x100b7c514 home
0x100261a94: mov qword ptr [rip + 0xa38f85], rsi ; 0x100c9aa20
0x100261a9b: lea rsi, [rip + 0xa38f7e] ; 0x100c9aa20
0x100261aa2: mov qword ptr [rip + 0xa38f87], rdx ; 0x100c9aa30
0x100261aa9: mov qword ptr [rip + 0xa38f8c], 0x50 ; 0x100c9aa40
0x100261ab4: mov qword ptr [rip + 0xa38f8d], rcx ; 0x100c9aa48
0x100261abb: mov qword ptr [rip + 0xa38f8e], rax ; 0x100c9aa50
0x100261ac2: mov qword ptr [rip + 0xa38f8b], 0xffffffffffffffff ; 0x100c9aa58
0x100261acd: mov qword ptr [rip + 0xa38f8c], rbx ; 0x100c9aa60
0x100261ad4: mov qword ptr [rip + 0xa38f89], 0 ; 0x100c9aa68
0x100261adf: vmovdqa xmmword ptr [rip + 0x1b83f99], xmm0 ; 0x101de5a80
0x100261ae7: lea rdx, [rip + 0x1b83f92] ; 0x101de5a80
0x100261aee: mov qword ptr [rip + 0x1b83f97], 0 ; 0x101de5a90
0x100261af9: lea rdi, [rip + 0x91aa19] ; 0x100b7c519 ( 3.0, 5.0, 10.0 )
0x100261b00: vmovq xmm1, rdi
0x100261b05: vpunpcklqdq xmm1, xmm3, xmm1
0x100261b09: vmovdqa xmmword ptr [rip + 0x1b83f8f], xmm1 ; 0x101de5aa0
0x100261b11: lea rdi, [rip + 0x1b83f88] ; 0x101de5aa0
0x100261b18: mov qword ptr [rip + 0x1b83f91], rdx ; 0x101de5ab0
0x100261b1f: mov qword ptr [rip + 0xa38f02], rdi ; 0x100c9aa28
0x100261b26: lea rdx, [rip + 0x908df3] ; 0x100b6a920 idle
0x100261b2d: mov qword ptr [rip + 0xa38f3c], rdx ; 0x100c9aa70
0x100261b34: lea rdx, [rip + 0xa38f35] ; 0x100c9aa70
0x100261b3b: mov qword ptr [rip + 0xa38f3e], rsi ; 0x100c9aa80
0x100261b42: mov qword ptr [rip + 0xa38f43], 0x60 ; 0x100c9aa90
0x100261b4d: mov qword ptr [rip + 0xa38f44], rcx ; 0x100c9aa98
0x100261b54: mov qword ptr [rip + 0xa38f45], rax ; 0x100c9aaa0
0x100261b5b: mov qword ptr [rip + 0xa38f42], 0xffffffffffffffff ; 0x100c9aaa8
0x100261b66: mov qword ptr [rip + 0xa38f43], rbx ; 0x100c9aab0
0x100261b6d: mov qword ptr [rip + 0xa38f40], 0 ; 0x100c9aab8
0x100261b78: vmovdqa xmmword ptr [rip + 0x1b83f40], xmm0 ; 0x101de5ac0
0x100261b80: lea rsi, [rip + 0x1b83f39] ; 0x101de5ac0
0x100261b87: mov qword ptr [rip + 0x1b83f3e], 0 ; 0x101de5ad0
0x100261b92: lea rdi, [rip + 0x91a993] ; 0x100b7c52c ( 0.0, 2.0, 10.0 )
0x100261b99: vmovq xmm1, rdi
0x100261b9e: vpunpcklqdq xmm1, xmm3, xmm1
0x100261ba2: vmovdqa xmmword ptr [rip + 0x1b83f36], xmm1 ; 0x101de5ae0
0x100261baa: lea rdi, [rip + 0x1b83f2f] ; 0x101de5ae0
0x100261bb1: mov qword ptr [rip + 0x1b83f38], rsi ; 0x101de5af0
0x100261bb8: mov qword ptr [rip + 0xa38eb9], rdi ; 0x100c9aa78
0x100261bbf: lea rsi, [rip + 0x916c6c] ; 0x100b78832 inspect
0x100261bc6: mov qword ptr [rip + 0xa38ef3], rsi ; 0x100c9aac0
0x100261bcd: lea rsi, [rip + 0xa38eec] ; 0x100c9aac0
0x100261bd4: mov qword ptr [rip + 0xa38ef5], rdx ; 0x100c9aad0
0x100261bdb: mov qword ptr [rip + 0xa38efa], 0x70 ; 0x100c9aae0
0x100261be6: mov qword ptr [rip + 0xa38efb], rcx ; 0x100c9aae8
0x100261bed: mov qword ptr [rip + 0xa38efc], rax ; 0x100c9aaf0
0x100261bf4: mov qword ptr [rip + 0xa38ef9], 0xffffffffffffffff ; 0x100c9aaf8
0x100261bff: mov qword ptr [rip + 0xa38efa], rbx ; 0x100c9ab00
0x100261c06: mov qword ptr [rip + 0xa38ef7], 0 ; 0x100c9ab08
0x100261c11: vmovdqa xmmword ptr [rip + 0x1b83ee7], xmm0 ; 0x101de5b00
0x100261c19: lea rdx, [rip + 0x1b83ee0] ; 0x101de5b00
0x100261c20: mov qword ptr [rip + 0x1b83ee5], 0 ; 0x101de5b10
0x100261c2b: lea rdi, [rip + 0x91a90d] ; 0x100b7c53f ( 0.0, 4.0, 10.0 )
0x100261c32: vmovq xmm1, rdi
0x100261c37: vpunpcklqdq xmm1, xmm3, xmm1
0x100261c3b: vmovdqa xmmword ptr [rip + 0x1b83edd], xmm1 ; 0x101de5b20
0x100261c43: lea rdi, [rip + 0x1b83ed6] ; 0x101de5b20
0x100261c4a: mov qword ptr [rip + 0x1b83edf], rdx ; 0x101de5b30
0x100261c51: mov qword ptr [rip + 0xa38e70], rdi ; 0x100c9aac8
0x100261c58: lea rdx, [rip + 0x908ccb] ; 0x100b6a92a rest
0x100261c5f: mov qword ptr [rip + 0xa38eaa], rdx ; 0x100c9ab10
0x100261c66: lea rdx, [rip + 0xa38ea3] ; 0x100c9ab10
0x100261c6d: mov qword ptr [rip + 0xa38eac], rsi ; 0x100c9ab20
0x100261c74: mov qword ptr [rip + 0xa38eb1], 0x80 ; 0x100c9ab30
0x100261c7f: mov qword ptr [rip + 0xa38eb2], rcx ; 0x100c9ab38
0x100261c86: mov qword ptr [rip + 0xa38eb3], rax ; 0x100c9ab40
0x100261c8d: mov qword ptr [rip + 0xa38eb0], 0xffffffffffffffff ; 0x100c9ab48
0x100261c98: mov qword ptr [rip + 0xa38eb1], rbx ; 0x100c9ab50
0x100261c9f: mov qword ptr [rip + 0xa38eae], 0 ; 0x100c9ab58
0x100261caa: vmovdqa xmmword ptr [rip + 0x1b83e8e], xmm0 ; 0x101de5b40
0x100261cb2: lea rsi, [rip + 0x1b83e87] ; 0x101de5b40
0x100261cb9: mov qword ptr [rip + 0x1b83e8c], 0 ; 0x101de5b50
0x100261cc4: lea rdi, [rip + 0x91a887] ; 0x100b7c552 ( 1.0, 20.0, 80.0 )
0x100261ccb: vmovq xmm2, rdi
0x100261cd0: vpunpcklqdq xmm2, xmm3, xmm2
0x100261cd4: vmovdqa xmmword ptr [rbp - 0x20], xmm3
0x100261cd9: vmovdqa xmmword ptr [rip + 0x1b83e7f], xmm2 ; 0x101de5b60
0x100261ce1: lea rdi, [rip + 0x1b83e78] ; 0x101de5b60
0x100261ce8: mov qword ptr [rip + 0x1b83e81], rsi ; 0x101de5b70
0x100261cef: mov qword ptr [rip + 0xa38e22], rdi ; 0x100c9ab18
0x100261cf6: lea rsi, [rip + 0x916b63] ; 0x100b78860 wander
0x100261cfd: mov qword ptr [rip + 0xa38e5c], rsi ; 0x100c9ab60
0x100261d04: lea rsi, [rip + 0xa38e55] ; 0x100c9ab60
0x100261d0b: mov qword ptr [rip + 0xa38e5e], rdx ; 0x100c9ab70
0x100261d12: mov qword ptr [rip + 0xa38e63], 0x90 ; 0x100c9ab80
0x100261d1d: mov qword ptr [rip + 0xa38e64], rcx ; 0x100c9ab88
0x100261d24: mov qword ptr [rip + 0xa38e65], rax ; 0x100c9ab90
0x100261d2b: mov qword ptr [rip + 0xa38e62], 0xffffffffffffffff ; 0x100c9ab98
0x100261d36: mov qword ptr [rip + 0xa38e63], rbx ; 0x100c9aba0
0x100261d3d: mov qword ptr [rip + 0xa38e60], 0 ; 0x100c9aba8
0x100261d48: vmovdqa xmmword ptr [rip + 0x1b83e30], xmm0 ; 0x101de5b80
0x100261d50: lea rdx, [rip + 0x1b83e29] ; 0x101de5b80
0x100261d57: mov qword ptr [rip + 0x1b83e2e], 0 ; 0x101de5b90
0x100261d62: vmovdqa xmmword ptr [rip + 0x1b83e36], xmm1 ; 0x101de5ba0
0x100261d6a: lea rdi, [rip + 0x1b83e2f] ; 0x101de5ba0
0x100261d71: mov qword ptr [rip + 0x1b83e38], rdx ; 0x101de5bb0
0x100261d78: mov qword ptr [rip + 0xa38de9], rdi ; 0x100c9ab68
0x100261d7f: lea rdx, [rip + 0x91a7e0] ; 0x100b7c566 mote
0x100261d86: mov qword ptr [rip + 0xa38e23], rdx ; 0x100c9abb0
0x100261d8d: lea rdx, [rip + 0xa38e1c] ; 0x100c9abb0
0x100261d94: mov qword ptr [rip + 0xa38e25], rsi ; 0x100c9abc0
0x100261d9b: mov qword ptr [rip + 0xa38e2a], 0xa0 ; 0x100c9abd0
0x100261da6: mov qword ptr [rip + 0xa38e2b], rcx ; 0x100c9abd8
0x100261dad: mov qword ptr [rip + 0xa38e2c], rax ; 0x100c9abe0
0x100261db4: mov qword ptr [rip + 0xa38e29], 0xffffffffffffffff ; 0x100c9abe8
0x100261dbf: mov qword ptr [rip + 0xa38e2a], rbx ; 0x100c9abf0
0x100261dc6: mov qword ptr [rip + 0xa38e27], 0 ; 0x100c9abf8
0x100261dd1: vmovdqa xmmword ptr [rip + 0x1b83de7], xmm0 ; 0x101de5bc0
0x100261dd9: lea rsi, [rip + 0x1b83de0] ; 0x101de5bc0
0x100261de0: mov qword ptr [rip + 0x1b83de5], 0 ; 0x101de5bd0
0x100261deb: lea rdi, [rip + 0x91a779] ; 0x100b7c56b ( 15.0, 4.0, 3.0 )
0x100261df2: vmovq xmm1, rdi
0x100261df7: vpunpcklqdq xmm1, xmm3, xmm1
0x100261dfb: vmovdqa xmmword ptr [rip + 0x1b83ddd], xmm1 ; 0x101de5be0
0x100261e03: lea rdi, [rip + 0x1b83dd6] ; 0x101de5be0
0x100261e0a: mov qword ptr [rip + 0x1b83ddf], rsi ; 0x101de5bf0
0x100261e11: mov qword ptr [rip + 0xa38da0], rdi ; 0x100c9abb8
0x100261e18: lea rsi, [rip + 0x91a75f] ; 0x100b7c57e rescueCrab
0x100261e1f: mov qword ptr [rip + 0xa38dda], rsi ; 0x100c9ac00
0x100261e26: lea rsi, [rip + 0xa38dd3] ; 0x100c9ac00
0x100261e2d: mov qword ptr [rip + 0xa38ddc], rdx ; 0x100c9ac10
0x100261e34: mov qword ptr [rip + 0xa15e25], rsi ; 0x100c77c60
0x100261e3b: mov qword ptr [rip + 0xa38dda], 0xb0 ; 0x100c9ac20
0x100261e46: mov qword ptr [rip + 0xa38ddb], rcx ; 0x100c9ac28
0x100261e4d: mov qword ptr [rip + 0xa38ddc], rax ; 0x100c9ac30
0x100261e54: mov qword ptr [rip + 0xa38dd9], 0xffffffffffffffff ; 0x100c9ac38
0x100261e5f: mov qword ptr [rip + 0xa38dda], rbx ; 0x100c9ac40
0x100261e66: mov qword ptr [rip + 0xa38dd7], 0 ; 0x100c9ac48
0x100261e71: vmovdqa xmmword ptr [rip + 0x1b83d87], xmm0 ; 0x101de5c00
0x100261e79: lea rax, [rip + 0x1b83d80] ; 0x101de5c00
0x100261e80: mov qword ptr [rip + 0x1b83d85], 0 ; 0x101de5c10
0x100261e8b: vmovdqa xmmword ptr [rip + 0x1b83d8d], xmm1 ; 0x101de5c20
0x100261e93: lea rcx, [rip + 0x1b83d86] ; 0x101de5c20
0x100261e9a: mov qword ptr [rip + 0x1b83d8f], rax ; 0x101de5c30
0x100261ea1: mov qword ptr [rip + 0xa38d60], rcx ; 0x100c9ac08
0x100261ea8: lea rax, [rip + 0x91a6da] ; 0x100b7c589 Crab
0x100261eaf: mov qword ptr [rip + 0x1b83d8a], rax ; 0x101de5c40
0x100261eb6: lea rax, [rip + 0x1b83d7b] ; 0x101de5c38
0x100261ebd: mov qword ptr [rip + 0x1b83d80], 0 ; 0x101de5c48
0x100261ec8: mov rcx, qword ptr [rip + 0xa0e089] ; 0x100c6ff58
0x100261ecf: mov qword ptr [rip + 0x1b83d7a], rcx ; 0x101de5c50
0x100261ed6: mov qword ptr [rip + 0xa0e07b], rax ; 0x100c6ff58
0x100261edd: mov qword ptr [rip + 0x1b83d7c], rax ; 0x101de5c60
0x100261ee4: mov rax, qword ptr [rip + 0x9a6a95] ; 0x100c08980 -> 0x1001a85d0 __Z18GetMetaClassByTypeIP9CritterV2ERK9MetaClassv
0x100261eeb: mov qword ptr [rip + 0x1b83d76], rax ; 0x101de5c68
0x100261ef2: mov dword ptr [rip + 0x1b83d74], 0xffffffff ; 0x101de5c70
0x100261efc: mov dword ptr [rip + 0x1b83d6e], 0xffffffff ; 0x101de5c74
0x100261f06: mov qword ptr [rip + 0x1b83d7f], 0 ; 0x101de5c90
0x100261f11: mov rax, qword ptr [rip + 0x9aa470] ; 0x100c0c388
0x100261f18: add rax, 0x10
0x100261f1c: mov qword ptr [rip + 0x1b83d15], rax ; 0x101de5c38
0x100261f23: xor eax, eax
0x100261f25: call 0x100011c10 ; 0x100011c10
0x100261f2a: lea rax, [rip + 0x902526] ; 0x100b64457 params
0x100261f31: mov qword ptr [rip + 0xa38d18], rax ; 0x100c9ac50
0x100261f38: lea rdx, [rip + 0xa38d11] ; 0x100c9ac50
0x100261f3f: mov qword ptr [rip + 0xa38d0e], 0 ; 0x100c9ac58
0x100261f4a: mov rax, qword ptr [rip + 0xa15d0f] ; 0x100c77c60
0x100261f51: mov qword ptr [rip + 0xa38d08], rax ; 0x100c9ac60
0x100261f58: mov qword ptr [rip + 0xa38d0d], 0x80 ; 0x100c9ac70
0x100261f63: mov rax, qword ptr [rip + 0x9a4ebe] ; 0x100c06e28 -> 0x100260000 __Z17GetMetaTypeByTypeIP10CrabParamsERK8MetaTypev
0x100261f6a: mov qword ptr [rip + 0xa38d07], rax ; 0x100c9ac78
0x100261f71: mov rax, qword ptr [rip + 0x9a65c8] ; 0x100c08540 -> 0x10025fff0 __Z18GetMetaClassByTypeIP4CrabERK9MetaClassv
0x100261f78: mov qword ptr [rip + 0xa38d01], rax ; 0x100c9ac80
0x100261f7f: mov qword ptr [rip + 0xa38cfe], 0xffffffffffffffff ; 0x100c9ac88
0x100261f8a: mov qword ptr [rip + 0xa38cff], rbx ; 0x100c9ac90
0x100261f91: mov qword ptr [rip + 0xa38cfc], 0 ; 0x100c9ac98
0x100261f9c: lea rcx, [rip + 0x9150b6] ; 0x100b77059 enabled
0x100261fa3: mov qword ptr [rip + 0xa38cf6], rcx ; 0x100c9aca0
0x100261faa: lea rcx, [rip + 0xa38cef] ; 0x100c9aca0
0x100261fb1: mov qword ptr [rip + 0xa38cf8], rdx ; 0x100c9acb0
0x100261fb8: mov qword ptr [rip + 0xa38cfd], 0xd8 ; 0x100c9acc0
0x100261fc3: mov qword ptr [rip + 0xa38cfe], r14 ; 0x100c9acc8
0x100261fca: mov qword ptr [rip + 0xa38cff], rax ; 0x100c9acd0
0x100261fd1: mov qword ptr [rip + 0xa38cfc], 0xffffffffffffffff ; 0x100c9acd8
0x100261fdc: mov qword ptr [rip + 0xa38cfd], rbx ; 0x100c9ace0
0x100261fe3: mov qword ptr [rip + 0xa38cfa], 0 ; 0x100c9ace8
0x100261fee: vmovdqa xmm0, xmmword ptr [rbp - 0x20]
0x100261ff3: vpunpcklqdq xmm0, xmm0, xmmword ptr [rbp - 0x30]
0x100261ff8: vmovdqa xmmword ptr [rip + 0x1b83ca0], xmm0 ; 0x101de5ca0
0x100262000: lea rdx, [rip + 0x1b83c99] ; 0x101de5ca0
0x100262007: mov qword ptr [rip + 0x1b83c9e], 0 ; 0x101de5cb0
0x100262012: mov qword ptr [rip + 0xa38c8f], rdx ; 0x100c9aca8
0x100262019: lea rdx, [rip + 0x91502e] ; 0x100b7704e SetEnabled
0x100262020: mov qword ptr [rip + 0x1b83c91], rdx ; 0x101de5cb8
0x100262027: lea rdx, [rip + 0x1b83c8a] ; 0x101de5cb8
0x10026202e: mov qword ptr [rip + 0x1b83c87], 0 ; 0x101de5cc0
0x100262039: mov rsi, qword ptr [rip + 0xa0df20] ; 0x100c6ff60
0x100262040: mov qword ptr [rip + 0x1b83c81], rsi ; 0x101de5cc8
0x100262047: lea rsi, [rip - 0x9dde] ; 0x100258270
0x10026204e: vmovq xmm0, rsi
0x100262053: vmovdqu xmmword ptr [rip + 0x1b83c95], xmm0 ; 0x101de5cf0
0x10026205b: mov rsi, qword ptr [rip + 0x9a4066] ; 0x100c060c8 -> 0x100260010 __Z12ApplyWrapperI4CrabMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x100262062: mov qword ptr [rip + 0x1b83c97], rsi ; 0x101de5d00
0x100262069: mov rsi, qword ptr [rip + 0x9a78e8] ; 0x100c09958 -> 0x1002600b0 __Z21InitFunctionSignatureIM4CrabFvbEEvP17FunctionSignature
0x100262070: mov qword ptr [rip + 0x1b83c91], rsi ; 0x101de5d08
0x100262077: mov qword ptr [rip + 0x1b83c92], rax ; 0x101de5d10
0x10026207e: lea rsi, [rip + 0x9111ee] ; 0x100b73273 GetEnabled
0x100262085: mov qword ptr [rip + 0x1b83c8c], rsi ; 0x101de5d18
0x10026208c: lea rdi, [rip + 0x1b83c85] ; 0x101de5d18
0x100262093: mov qword ptr [rip + 0x1b83c82], 0 ; 0x101de5d20
0x10026209e: mov qword ptr [rip + 0x1b83c83], rdx ; 0x101de5d28
0x1002620a5: lea rdx, [rip - 0x9e2c] ; 0x100258280
0x1002620ac: vmovq xmm0, rdx
0x1002620b1: vmovdqu xmmword ptr [rip + 0x1b83c97], xmm0 ; 0x101de5d50
0x1002620b9: mov rdx, qword ptr [rip + 0x9a3ff8] ; 0x100c060b8 -> 0x100260130 __Z12ApplyWrapperI4CrabMS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1002620c0: mov qword ptr [rip + 0x1b83c99], rdx ; 0x101de5d60
0x1002620c7: mov rdx, qword ptr [rip + 0x9a787a] ; 0x100c09948 -> 0x1002601b0 __Z21InitFunctionSignatureIM4CrabFbvEEvP17FunctionSignature
0x1002620ce: mov qword ptr [rip + 0x1b83c93], rdx ; 0x101de5d68
0x1002620d5: mov qword ptr [rip + 0x1b83c94], rax ; 0x101de5d70
0x1002620dc: lea rdx, [rip + 0x908fdc] ; 0x100b6b0bf transform
0x1002620e3: mov qword ptr [rip + 0xa38c06], rdx ; 0x100c9acf0
0x1002620ea: lea rdx, [rip + 0xa38bff] ; 0x100c9acf0
0x1002620f1: mov qword ptr [rip + 0xa38bfc], 0 ; 0x100c9acf8
0x1002620fc: mov qword ptr [rip + 0xa38bfd], rcx ; 0x100c9ad00
0x100262103: mov qword ptr [rip + 0xa15b56], rdx ; 0x100c77c60
0x10026210a: mov qword ptr [rip + 0xa38bfb], 0x90 ; 0x100c9ad10
0x100262115: mov rcx, qword ptr [rip + 0x9a4cac] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x10026211c: mov qword ptr [rip + 0xa38bf5], rcx ; 0x100c9ad18
0x100262123: mov qword ptr [rip + 0xa38bf6], rax ; 0x100c9ad20
0x10026212a: mov qword ptr [rip + 0xa38bf3], 0xffffffffffffffff ; 0x100c9ad28
0x100262135: mov qword ptr [rip + 0xa38bf4], rbx ; 0x100c9ad30
0x10026213c: mov qword ptr [rip + 0xa38bf1], 0 ; 0x100c9ad38
0x100262147: lea rsi, [rip + 0x915b0c] ; 0x100b77c5a DefaultMessageHandler
0x10026214e: mov qword ptr [rip + 0x1b83c23], rsi ; 0x101de5d78
0x100262155: lea rcx, [rip + 0x1b83c1c] ; 0x101de5d78
0x10026215c: mov qword ptr [rip + 0x1b83c19], 0 ; 0x101de5d80
0x100262167: mov qword ptr [rip + 0x1b83c1a], rdi ; 0x101de5d88
0x10026216e: mov qword ptr [rip + 0xa0ddeb], rcx ; 0x100c6ff60
0x100262175: lea rcx, [rip - 0x9eec] ; 0x100258290
0x10026217c: vmovq xmm0, rcx
0x100262181: vmovdqu xmmword ptr [rip + 0x1b83c27], xmm0 ; 0x101de5db0
0x100262189: mov rdx, qword ptr [rip + 0x9a3f30] ; 0x100c060c0 -> 0x1002601e0 __Z12ApplyWrapperI4CrabMS0_FvPK6ObjectEEvM9VoidClassFvvEPv8VariablePSA_j
0x100262190: mov qword ptr [rip + 0x1b83c29], rdx ; 0x101de5dc0
0x100262197: mov rdx, qword ptr [rip + 0x9a77b2] ; 0x100c09950 -> 0x100260280 __Z21InitFunctionSignatureIM4CrabFvPK6ObjectEEvP17FunctionSignature
0x10026219e: mov qword ptr [rip + 0x1b83c23], rdx ; 0x101de5dc8
0x1002621a5: mov qword ptr [rip + 0x1b83c24], rax ; 0x101de5dd0
0x1002621ac: lea rdi, [rip + 0x1b83c25] ; 0x101de5dd8
0x1002621b3: lea rdx, [rip + 0x8fc841] ; 0x100b5e9fb Object
0x1002621ba: xor r8d, r8d
0x1002621bd: call 0x100260300 ; 0x100260300
0x1002621c2: lea rax, [rip + 0x91a3c5] ; 0x100b7c58e CrabImpulseRpc
0x1002621c9: mov qword ptr [rip + 0x1b83c18], rax ; 0x101de5de8
0x1002621d0: lea rax, [rip + 0x1b83c09] ; 0x101de5de0
0x1002621d7: mov qword ptr [rip + 0x1b83c0e], 0 ; 0x101de5df0
0x1002621e2: mov rcx, qword ptr [rip + 0xa0dd6f] ; 0x100c6ff58
0x1002621e9: mov qword ptr [rip + 0x1b83c08], rcx ; 0x101de5df8
0x1002621f0: mov qword ptr [rip + 0xa0dd61], rax ; 0x100c6ff58
0x1002621f7: mov qword ptr [rip + 0x1b83c0a], rax ; 0x101de5e08
0x1002621fe: mov rbx, qword ptr [rip + 0x9a64b3] ; 0x100c086b8 -> 0x1000f6d40 __Z18GetMetaClassByTypeIP6NetRpcERK9MetaClassv
0x100262205: mov qword ptr [rip + 0x1b83c04], rbx ; 0x101de5e10
0x10026220c: mov qword ptr [rip + 0x1b83c01], 0xffffffffffffffff ; 0x101de5e18
0x100262217: mov qword ptr [rip + 0x1b83c16], 0 ; 0x101de5e38
0x100262222: mov rax, qword ptr [rip + 0x9a9167] ; 0x100c0b390
0x100262229: add rax, 0x10
0x10026222d: mov qword ptr [rip + 0x1b83bac], rax ; 0x101de5de0
0x100262234: xor eax, eax
0x100262236: call 0x100011c10 ; 0x100011c10
0x10026223b: lea rax, [rip + 0x91a35b] ; 0x100b7c59d CrabChangeAuthorityRpc
0x100262242: mov qword ptr [rip + 0x1b83bff], rax ; 0x101de5e48
0x100262249: lea rax, [rip + 0x1b83bf0] ; 0x101de5e40
0x100262250: mov qword ptr [rip + 0x1b83bf5], 0 ; 0x101de5e50
0x10026225b: mov rcx, qword ptr [rip + 0xa0dcf6] ; 0x100c6ff58
0x100262262: mov qword ptr [rip + 0x1b83bef], rcx ; 0x101de5e58
0x100262269: mov qword ptr [rip + 0xa0dce8], rax ; 0x100c6ff58
0x100262270: mov qword ptr [rip + 0x1b83bf1], rax ; 0x101de5e68
0x100262277: mov qword ptr [rip + 0x1b83bf2], rbx ; 0x101de5e70
0x10026227e: mov qword ptr [rip + 0x1b83bef], 0xffffffffffffffff ; 0x101de5e78
0x100262289: mov qword ptr [rip + 0x1b83c04], 0 ; 0x101de5e98
0x100262294: mov rax, qword ptr [rip + 0x9a9e05] ; 0x100c0c0a0
0x10026229b: add rax, 0x10
0x10026229f: mov qword ptr [rip + 0x1b83b9a], rax ; 0x101de5e40
0x1002622a6: xor eax, eax
0x1002622a8: call 0x100011c10 ; 0x100011c10
0x1002622ad: lea rax, [rip + 0x91a300] ; 0x100b7c5b4 CrabEatMoteRpc
0x1002622b4: mov qword ptr [rip + 0x1b83bed], rax ; 0x101de5ea8
0x1002622bb: lea rax, [rip + 0x1b83bde] ; 0x101de5ea0
0x1002622c2: mov qword ptr [rip + 0x1b83be3], 0 ; 0x101de5eb0
0x1002622cd: mov rcx, qword ptr [rip + 0xa0dc84] ; 0x100c6ff58
0x1002622d4: mov qword ptr [rip + 0x1b83bdd], rcx ; 0x101de5eb8
0x1002622db: mov qword ptr [rip + 0xa0dc76], rax ; 0x100c6ff58
0x1002622e2: mov qword ptr [rip + 0x1b83bdf], rax ; 0x101de5ec8
0x1002622e9: mov qword ptr [rip + 0x1b83be0], rbx ; 0x101de5ed0
0x1002622f0: mov qword ptr [rip + 0x1b83bdd], 0xffffffffffffffff ; 0x101de5ed8
0x1002622fb: mov qword ptr [rip + 0x1b83bf2], 0 ; 0x101de5ef8
0x100262306: mov rax, qword ptr [rip + 0x9a907b] ; 0x100c0b388
0x10026230d: add rax, 0x10
0x100262311: mov qword ptr [rip + 0x1b83b88], rax ; 0x101de5ea0
0x100262318: xor eax, eax
0x10026231a: call 0x100011c10 ; 0x100011c10
0x10026231f: lea rax, [rip + 0x91a2e2] ; 0x100b7c608 CrabBarn
0x100262326: mov qword ptr [rip + 0x1b83bdb], rax ; 0x101de5f08
0x10026232d: lea rax, [rip + 0x1b83bcc] ; 0x101de5f00
0x100262334: mov qword ptr [rip + 0x1b83bd1], 0 ; 0x101de5f10
0x10026233f: mov rcx, qword ptr [rip + 0xa0dc12] ; 0x100c6ff58
0x100262346: mov qword ptr [rip + 0x1b83bcb], rcx ; 0x101de5f18
0x10026234d: mov qword ptr [rip + 0xa0dc04], rax ; 0x100c6ff58
0x100262354: mov qword ptr [rip + 0x1b83bcd], rax ; 0x101de5f28
0x10026235b: mov rax, qword ptr [rip + 0x9a634e] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x100262362: mov qword ptr [rip + 0x1b83bc7], rax ; 0x101de5f30
0x100262369: mov qword ptr [rip + 0x1b83bc4], 0xffffffffffffffff ; 0x101de5f38
0x100262374: mov qword ptr [rip + 0x1b83bd9], 0 ; 0x101de5f58
0x10026237f: mov rax, qword ptr [rip + 0x9aa312] ; 0x100c0c698
0x100262386: add rax, 0x10
0x10026238a: mov qword ptr [rip + 0x1b83b6f], rax ; 0x101de5f00
0x100262391: xor eax, eax
0x100262393: call 0x100011c10 ; 0x100011c10
0x100262398: lea rax, [rip + 0x8fa56d] ; 0x100b5c90c Initialize
0x10026239f: mov qword ptr [rip + 0x1b83bba], rax ; 0x101de5f60
0x1002623a6: lea rax, [rip + 0x1b83bb3] ; 0x101de5f60
0x1002623ad: mov qword ptr [rip + 0x1b83bb0], 0 ; 0x101de5f68
0x1002623b8: mov rcx, qword ptr [rip + 0xa0dba1] ; 0x100c6ff60
0x1002623bf: mov qword ptr [rip + 0x1b83baa], rcx ; 0x101de5f70
0x1002623c6: lea rcx, [rip - 0x367d] ; 0x10025ed50
0x1002623cd: vmovq xmm0, rcx
0x1002623d2: vmovdqu xmmword ptr [rip + 0x1b83bbe], xmm0 ; 0x101de5f98
0x1002623da: mov rcx, qword ptr [rip + 0x9a412f] ; 0x100c06510 -> 0x100261350 __Z12ApplyWrapperI8CrabBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1002623e1: mov qword ptr [rip + 0x1b83bc0], rcx ; 0x101de5fa8
0x1002623e8: mov rdx, qword ptr [rip + 0x9a79b1] ; 0x100c09da0 -> 0x1002613b0 __Z21InitFunctionSignatureIM8CrabBarnFvvEEvP17FunctionSignature
0x1002623ef: mov qword ptr [rip + 0x1b83bba], rdx ; 0x101de5fb0
0x1002623f6: mov rsi, qword ptr [rip + 0x9a63e3] ; 0x100c087e0 -> 0x100261340 __Z18GetMetaClassByTypeIP8CrabBarnERK9MetaClassv
0x1002623fd: mov qword ptr [rip + 0x1b83bb4], rsi ; 0x101de5fb8
0x100262404: lea rdi, [rip + 0x8fe650] ; 0x100b60a5b OnLevelUnload
0x10026240b: mov qword ptr [rip + 0x1b83bae], rdi ; 0x101de5fc0
0x100262412: lea rdi, [rip + 0x1b83ba7] ; 0x101de5fc0
0x100262419: mov qword ptr [rip + 0x1b83ba4], 0 ; 0x101de5fc8
0x100262424: mov qword ptr [rip + 0x1b83ba5], rax ; 0x101de5fd0
0x10026242b: lea rax, [rip - 0x36c2] ; 0x10025ed70
0x100262432: vmovq xmm0, rax
0x100262437: vmovdqu xmmword ptr [rip + 0x1b83bb9], xmm0 ; 0x101de5ff8
0x10026243f: mov qword ptr [rip + 0x1b83bc2], rcx ; 0x101de6008
0x100262446: mov qword ptr [rip + 0x1b83bc3], rdx ; 0x101de6010
0x10026244d: mov qword ptr [rip + 0x1b83bc4], rsi ; 0x101de6018
0x100262454: lea rax, [rip + 0x8fa4f2] ; 0x100b5c94d Update
0x10026245b: mov qword ptr [rip + 0x1b83bbe], rax ; 0x101de6020
0x100262462: lea rax, [rip + 0x1b83bb7] ; 0x101de6020
0x100262469: mov qword ptr [rip + 0x1b83bb4], 0 ; 0x101de6028
0x100262474: mov qword ptr [rip + 0x1b83bb5], rdi ; 0x101de6030
0x10026247b: mov qword ptr [rip + 0xa0dade], rax ; 0x100c6ff60
0x100262482: lea rax, [rip - 0x3709] ; 0x10025ed80
0x100262489: vmovq xmm0, rax
0x10026248e: vmovdqu xmmword ptr [rip + 0x1b83bc2], xmm0 ; 0x101de6058
0x100262496: mov rax, qword ptr [rip + 0x9a406b] ; 0x100c06508 -> 0x1002613d0 __Z12ApplyWrapperI8CrabBarnMS0_FvP4GameP15GameCaptureBarnEEvM9VoidClassFvvEPv8VariablePSB_j
0x10026249d: mov qword ptr [rip + 0x1b83bc4], rax ; 0x101de6068
0x1002624a4: mov rax, qword ptr [rip + 0x9a78ed] ; 0x100c09d98 -> 0x1002613e0 __Z21InitFunctionSignatureIM8CrabBarnFvP4GameP15GameCaptureBarnEEvP17FunctionSignature
0x1002624ab: mov qword ptr [rip + 0x1b83bbe], rax ; 0x101de6070
0x1002624b2: mov qword ptr [rip + 0x1b83bbf], rsi ; 0x101de6078
0x1002624b9: add rsp, 0x20
0x1002624bd: pop rbx
0x1002624be: pop r14
0x1002624c0: pop rbp
0x1002624c1: ret 
0x1002624c2: nop 
0x1002624c3: nop 
0x1002624c4: nop 
0x1002624c5: nop 
0x1002624c6: nop 
0x1002624c7: nop 
0x1002624c8: nop 
0x1002624c9: nop 
0x1002624ca: nop 
0x1002624cb: nop 
0x1002624cc: nop 
0x1002624cd: nop 
0x1002624ce: nop 
0x1002624cf: nop 
