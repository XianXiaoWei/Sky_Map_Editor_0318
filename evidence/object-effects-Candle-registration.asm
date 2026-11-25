0x1001ee240: push rbp
0x1001ee241: mov rbp, rsp
0x1001ee244: push r15
0x1001ee246: push r14
0x1001ee248: push r13
0x1001ee24a: push r12
0x1001ee24c: push rbx
0x1001ee24d: sub rsp, 0x18
0x1001ee251: mov dword ptr [rip + 0xb35db1], 0 ; 0x100d2400c
0x1001ee25b: lea rax, [rip + 0x1bf049e] ; 0x101dde700
0x1001ee262: vmovq xmm0, rax
0x1001ee267: lea rax, [rip + 0x98b1d2] ; 0x100b79440 g_candleBarn
0x1001ee26e: vmovq xmm1, rax
0x1001ee273: vpunpcklqdq xmm0, xmm1, xmm0
0x1001ee277: vmovdqa xmmword ptr [rip + 0x1bf0491], xmm0 ; 0x101dde710
0x1001ee27f: lea rax, [rip + 0x1bf048a] ; 0x101dde710
0x1001ee286: mov qword ptr [rip + 0x1bf048f], 8 ; 0x101dde720
0x1001ee291: mov rcx, qword ptr [rip + 0xaaae48] ; 0x100c990e0
0x1001ee298: mov qword ptr [rip + 0x1bf0489], rcx ; 0x101dde728
0x1001ee29f: mov qword ptr [rip + 0xaaae3a], rax ; 0x100c990e0
0x1001ee2a6: mov qword ptr [rip + 0x1bf047f], 0 ; 0x101dde730
0x1001ee2b1: mov qword ptr [rip + 0x1bf0484], 0 ; 0x101dde740
0x1001ee2bc: lea rax, [rip + 0x98b18a] ; 0x100b7944d kFlameInHand
0x1001ee2c3: mov qword ptr [rip + 0x1bf047e], rax ; 0x101dde748
0x1001ee2ca: lea rcx, [rip + 0x1bf0477] ; 0x101dde748
0x1001ee2d1: mov rax, qword ptr [rip + 0xaa19c8] ; 0x100c8fca0
0x1001ee2d8: mov qword ptr [rip + 0x1bf0479], rax ; 0x101dde758
0x1001ee2df: lea rax, [rip + 0xaa205a] ; 0x100c90340
0x1001ee2e6: vmovq xmm0, rax
0x1001ee2eb: lea rax, [rip + 0x98b168] ; 0x100b7945a Candle.cpp
0x1001ee2f2: vmovq xmm1, rax
0x1001ee2f7: vpunpcklqdq xmm0, xmm1, xmm0
0x1001ee2fb: vmovdqu xmmword ptr [rip + 0x1bf0465], xmm0 ; 0x101dde768
0x1001ee303: mov rdx, qword ptr [rip + 0xa1924e] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1001ee30a: mov qword ptr [rip + 0x1bf0467], rdx ; 0x101dde778
0x1001ee311: mov rsi, rdx
0x1001ee314: mov qword ptr [rip + 0x1bf0461], 0 ; 0x101dde780
0x1001ee31f: lea r13, [rip - 0x1d4906] ; 0x100019a20
0x1001ee326: mov qword ptr [rip + 0x1bf045b], r13 ; 0x101dde788
0x1001ee32d: mov qword ptr [rip + 0x1bf0458], 0 ; 0x101dde790
0x1001ee338: lea rdx, [rip + 0x989c01] ; 0x100b77f40 Candle
0x1001ee33f: vmovq xmm0, rdx
0x1001ee344: lea rdx, [rip + 0x96fcd2] ; 0x100b5e01d TweakCategory
0x1001ee34b: vmovq xmm2, rdx
0x1001ee350: vpunpcklqdq xmm0, xmm2, xmm0
0x1001ee354: vmovdqa xmmword ptr [rip + 0x1bf0444], xmm0 ; 0x101dde7a0
0x1001ee35c: lea rdx, [rip + 0x1bf043d] ; 0x101dde7a0
0x1001ee363: mov qword ptr [rip + 0x1bf0442], 0 ; 0x101dde7b0
0x1001ee36e: mov qword ptr [rip + 0x1bf03db], rdx ; 0x101dde750
0x1001ee375: lea rdx, [rip + 0x98b0e9] ; 0x100b79465 kDroppableCandles
0x1001ee37c: mov qword ptr [rip + 0x1bf0435], rdx ; 0x101dde7b8
0x1001ee383: lea rdx, [rip + 0x1bf042e] ; 0x101dde7b8
0x1001ee38a: mov qword ptr [rip + 0x1bf0437], rcx ; 0x101dde7c8
0x1001ee391: lea rcx, [rip + 0xaa1fa9] ; 0x100c90341
0x1001ee398: vmovq xmm2, rcx
0x1001ee39d: vpunpcklqdq xmm2, xmm1, xmm2
0x1001ee3a1: vmovdqu xmmword ptr [rip + 0x1bf042f], xmm2 ; 0x101dde7d8
0x1001ee3a9: mov qword ptr [rip + 0x1bf0438], rsi ; 0x101dde7e8
0x1001ee3b0: mov qword ptr [rip + 0x1bf0435], 0 ; 0x101dde7f0
0x1001ee3bb: mov qword ptr [rip + 0x1bf0436], r13 ; 0x101dde7f8
0x1001ee3c2: mov qword ptr [rip + 0x1bf0433], 0 ; 0x101dde800
0x1001ee3cd: vmovdqa xmmword ptr [rip + 0x1bf043b], xmm0 ; 0x101dde810
0x1001ee3d5: lea rcx, [rip + 0x1bf0434] ; 0x101dde810
0x1001ee3dc: mov qword ptr [rip + 0x1bf0439], 0 ; 0x101dde820
0x1001ee3e7: mov qword ptr [rip + 0x1bf03d2], rcx ; 0x101dde7c0
0x1001ee3ee: lea rcx, [rip + 0x98b082] ; 0x100b79477 kPickupableCandles
0x1001ee3f5: mov qword ptr [rip + 0x1bf042c], rcx ; 0x101dde828
0x1001ee3fc: lea rcx, [rip + 0x1bf0425] ; 0x101dde828
0x1001ee403: mov qword ptr [rip + 0x1bf042e], rdx ; 0x101dde838
0x1001ee40a: lea rdx, [rip + 0xaa1f31] ; 0x100c90342
0x1001ee411: vmovq xmm2, rdx
0x1001ee416: vpunpcklqdq xmm2, xmm1, xmm2
0x1001ee41a: vmovdqu xmmword ptr [rip + 0x1bf0426], xmm2 ; 0x101dde848
0x1001ee422: mov qword ptr [rip + 0x1bf042f], rsi ; 0x101dde858
0x1001ee429: mov qword ptr [rip + 0x1bf042c], 0 ; 0x101dde860
0x1001ee434: mov qword ptr [rip + 0x1bf042d], r13 ; 0x101dde868
0x1001ee43b: mov qword ptr [rip + 0x1bf042a], 0 ; 0x101dde870
0x1001ee446: vmovdqa xmmword ptr [rip + 0x1bf0432], xmm0 ; 0x101dde880
0x1001ee44e: lea rdx, [rip + 0x1bf042b] ; 0x101dde880
0x1001ee455: mov qword ptr [rip + 0x1bf0430], 0 ; 0x101dde890
0x1001ee460: mov qword ptr [rip + 0x1bf03c9], rdx ; 0x101dde830
0x1001ee467: lea rdx, [rip + 0x98b01c] ; 0x100b7948a kDrawCandleInfo
0x1001ee46e: mov qword ptr [rip + 0x1bf042b], rdx ; 0x101dde8a0
0x1001ee475: lea rdx, [rip + 0x1bf0424] ; 0x101dde8a0
0x1001ee47c: mov qword ptr [rip + 0x1bf042d], rcx ; 0x101dde8b0
0x1001ee483: lea rcx, [rip + 0x1bf040e] ; 0x101dde898
0x1001ee48a: vmovq xmm2, rcx
0x1001ee48f: vpunpcklqdq xmm1, xmm1, xmm2
0x1001ee493: vmovdqu xmmword ptr [rip + 0x1bf0425], xmm1 ; 0x101dde8c0
0x1001ee49b: mov qword ptr [rip + 0x1bf042e], rsi ; 0x101dde8d0
0x1001ee4a2: mov qword ptr [rip + 0x1bf042b], 0 ; 0x101dde8d8
0x1001ee4ad: mov qword ptr [rip + 0x1bf042c], r13 ; 0x101dde8e0
0x1001ee4b4: mov qword ptr [rip + 0x1bf0429], 0 ; 0x101dde8e8
0x1001ee4bf: vmovdqa xmmword ptr [rip + 0x1bf0429], xmm0 ; 0x101dde8f0
0x1001ee4c7: lea rcx, [rip + 0x1bf0422] ; 0x101dde8f0
0x1001ee4ce: mov qword ptr [rip + 0x1bf0427], 0 ; 0x101dde900
0x1001ee4d9: mov qword ptr [rip + 0x1bf03c8], rcx ; 0x101dde8a8
0x1001ee4e0: lea rcx, [rip + 0x98afb3] ; 0x100b7949a kFlameToCandleScale
0x1001ee4e7: mov qword ptr [rip + 0x1bf041a], rcx ; 0x101dde908
0x1001ee4ee: lea rcx, [rip + 0x1bf0413] ; 0x101dde908
0x1001ee4f5: mov qword ptr [rip + 0x1bf041c], rdx ; 0x101dde918
0x1001ee4fc: mov qword ptr [rip + 0xaa179d], rcx ; 0x100c8fca0
0x1001ee503: mov qword ptr [rip + 0x1bf041e], rax ; 0x101dde928
0x1001ee50a: lea rax, [rip + 0xaa1e33] ; 0x100c90344
0x1001ee511: mov qword ptr [rip + 0x1bf0418], rax ; 0x101dde930
0x1001ee518: mov rax, qword ptr [rip + 0xa19041] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1001ee51f: mov qword ptr [rip + 0x1bf0412], rax ; 0x101dde938
0x1001ee526: mov qword ptr [rip + 0x1bf040f], 0 ; 0x101dde940
0x1001ee531: mov qword ptr [rip + 0x1bf0410], r13 ; 0x101dde948
0x1001ee538: mov qword ptr [rip + 0x1bf040d], 0 ; 0x101dde950
0x1001ee543: vmovdqa xmmword ptr [rip + 0x1bf0415], xmm0 ; 0x101dde960
0x1001ee54b: lea rax, [rip + 0x1bf040e] ; 0x101dde960
0x1001ee552: mov qword ptr [rip + 0x1bf0413], 0 ; 0x101dde970
0x1001ee55d: lea rcx, [rip + 0x98af4a] ; 0x100b794ae 1.0 10.0
0x1001ee564: vmovq xmm1, rcx
0x1001ee569: lea rcx, [rip + 0x971bde] ; 0x100b6014e TweakRange
0x1001ee570: vmovq xmm2, rcx
0x1001ee575: vpunpcklqdq xmm1, xmm2, xmm1
0x1001ee579: vmovdqa xmmword ptr [rip + 0x1bf03ff], xmm1 ; 0x101dde980
0x1001ee581: lea rcx, [rip + 0x1bf03f8] ; 0x101dde980
0x1001ee588: mov qword ptr [rip + 0x1bf0401], rax ; 0x101dde990
0x1001ee58f: mov qword ptr [rip + 0x1bf037a], rcx ; 0x101dde910
0x1001ee596: lea rax, [rip + 0x98af1a] ; 0x100b794b7 GiveCandles
0x1001ee59d: mov qword ptr [rip + 0x1bf03f4], rax ; 0x101dde998
0x1001ee5a4: lea rax, [rip + 0x1bf03ed] ; 0x101dde998
0x1001ee5ab: mov rcx, qword ptr [rip + 0xa8321e] ; 0x100c717d0
0x1001ee5b2: mov qword ptr [rip + 0x1bf03ef], rcx ; 0x101dde9a8
0x1001ee5b9: mov qword ptr [rip + 0xa83210], rax ; 0x100c717d0
0x1001ee5c0: lea rax, [rip - 0x5bf7] ; 0x1001e89d0
0x1001ee5c7: mov qword ptr [rip + 0x1bf0402], rax ; 0x101dde9d0
0x1001ee5ce: mov rax, qword ptr [rip + 0xa18563] ; 0x100c06b38 -> 0x100019a30 __Z12ApplyWrapperIPFvP4GameEEvPFvvE8VariablePS6_j
0x1001ee5d5: mov qword ptr [rip + 0x1bf03fc], rax ; 0x101dde9d8
0x1001ee5dc: mov rax, qword ptr [rip + 0xa1bde5] ; 0x100c0a3c8 -> 0x100019ab0 __Z21InitFunctionSignatureIPFvP4GameEEvP17FunctionSignature
0x1001ee5e3: mov qword ptr [rip + 0x1bf03f6], rax ; 0x101dde9e0
0x1001ee5ea: vmovdqa xmmword ptr [rip + 0x1bf03fe], xmm0 ; 0x101dde9f0
0x1001ee5f2: lea rax, [rip + 0x1bf03f7] ; 0x101dde9f0
0x1001ee5f9: mov qword ptr [rip + 0x1bf03fc], 0 ; 0x101ddea00
0x1001ee604: mov qword ptr [rip + 0x1bf0395], rax ; 0x101dde9a0
0x1001ee60b: lea rax, [rip + 0x98aeb1] ; 0x100b794c3 CandleCreate
0x1001ee612: mov qword ptr [rip + 0x1bf03f7], rax ; 0x101ddea10
0x1001ee619: lea rax, [rip + 0x1bf03e8] ; 0x101ddea08
0x1001ee620: mov qword ptr [rip + 0x1bf03ed], 0 ; 0x101ddea18
0x1001ee62b: mov rcx, qword ptr [rip + 0xa81926] ; 0x100c6ff58
0x1001ee632: mov qword ptr [rip + 0x1bf03e7], rcx ; 0x101ddea20
0x1001ee639: mov qword ptr [rip + 0xa81918], rax ; 0x100c6ff58
0x1001ee640: mov qword ptr [rip + 0x1bf03e9], rax ; 0x101ddea30
0x1001ee647: mov rbx, qword ptr [rip + 0xa1a06a] ; 0x100c086b8 -> 0x1000f6d40 __Z18GetMetaClassByTypeIP6NetRpcERK9MetaClassv
0x1001ee64e: mov qword ptr [rip + 0x1bf03e3], rbx ; 0x101ddea38
0x1001ee655: mov dword ptr [rip + 0x1bf03e1], 0xffffffff ; 0x101ddea40
0x1001ee65f: mov dword ptr [rip + 0x1bf03db], 0xffffffff ; 0x101ddea44
0x1001ee669: mov qword ptr [rip + 0x1bf03ec], 0 ; 0x101ddea60
0x1001ee674: mov rax, qword ptr [rip + 0xa1c835] ; 0x100c0aeb0
0x1001ee67b: add rax, 0x10
0x1001ee67f: mov qword ptr [rip + 0x1bf0382], rax ; 0x101ddea08
0x1001ee686: xor eax, eax
0x1001ee688: call 0x100011c10 ; 0x100011c10
0x1001ee68d: lea rax, [rip + 0x98ae3c] ; 0x100b794d0 CandleLight
0x1001ee694: mov qword ptr [rip + 0x1bf03d5], rax ; 0x101ddea70
0x1001ee69b: lea rax, [rip + 0x1bf03c6] ; 0x101ddea68
0x1001ee6a2: mov qword ptr [rip + 0x1bf03cb], 0 ; 0x101ddea78
0x1001ee6ad: mov rcx, qword ptr [rip + 0xa818a4] ; 0x100c6ff58
0x1001ee6b4: mov qword ptr [rip + 0x1bf03c5], rcx ; 0x101ddea80
0x1001ee6bb: mov qword ptr [rip + 0xa81896], rax ; 0x100c6ff58
0x1001ee6c2: mov qword ptr [rip + 0x1bf03c7], rax ; 0x101ddea90
0x1001ee6c9: mov qword ptr [rip + 0x1bf03c8], rbx ; 0x101ddea98
0x1001ee6d0: mov qword ptr [rip + 0x1bf03c5], 0xffffffffffffffff ; 0x101ddeaa0
0x1001ee6db: mov qword ptr [rip + 0x1bf03da], 0 ; 0x101ddeac0
0x1001ee6e6: mov rax, qword ptr [rip + 0xa1c53b] ; 0x100c0ac28
0x1001ee6ed: add rax, 0x10
0x1001ee6f1: mov qword ptr [rip + 0x1bf0370], rax ; 0x101ddea68
0x1001ee6f8: xor eax, eax
0x1001ee6fa: call 0x100011c10 ; 0x100011c10
0x1001ee6ff: lea rax, [rip + 0x98add6] ; 0x100b794dc CandleDestroy
0x1001ee706: mov qword ptr [rip + 0x1bf03c3], rax ; 0x101ddead0
0x1001ee70d: lea rax, [rip + 0x1bf03b4] ; 0x101ddeac8
0x1001ee714: mov qword ptr [rip + 0x1bf03b9], 0 ; 0x101ddead8
0x1001ee71f: mov rcx, qword ptr [rip + 0xa81832] ; 0x100c6ff58
0x1001ee726: mov qword ptr [rip + 0x1bf03b3], rcx ; 0x101ddeae0
0x1001ee72d: mov qword ptr [rip + 0xa81824], rax ; 0x100c6ff58
0x1001ee734: mov qword ptr [rip + 0x1bf03b5], rax ; 0x101ddeaf0
0x1001ee73b: mov qword ptr [rip + 0x1bf03b6], rbx ; 0x101ddeaf8
0x1001ee742: mov qword ptr [rip + 0x1bf03b3], 0xffffffffffffffff ; 0x101ddeb00
0x1001ee74d: mov qword ptr [rip + 0x1bf03c8], 0 ; 0x101ddeb20
0x1001ee758: mov rax, qword ptr [rip + 0xa1c9a1] ; 0x100c0b100
0x1001ee75f: add rax, 0x10
0x1001ee763: mov qword ptr [rip + 0x1bf035e], rax ; 0x101ddeac8
0x1001ee76a: xor eax, eax
0x1001ee76c: call 0x100011c10 ; 0x100011c10
0x1001ee771: lea rax, [rip + 0x98ad72] ; 0x100b794ea CandleMeshType
0x1001ee778: mov qword ptr [rip + 0x1bf03b1], rax ; 0x101ddeb30
0x1001ee77f: lea r12, [rip + 0x1bf03a2] ; 0x101ddeb28
0x1001ee786: mov rcx, qword ptr [rip + 0xa817cb] ; 0x100c6ff58
0x1001ee78d: mov qword ptr [rip + 0x1bf03ac], rcx ; 0x101ddeb40
0x1001ee794: mov qword ptr [rip + 0xa817bd], r12 ; 0x100c6ff58
0x1001ee79b: mov qword ptr [rip + 0x1bf03ae], r12 ; 0x101ddeb50
0x1001ee7a2: mov rcx, qword ptr [rip + 0xa1e43f] ; 0x100c0cbe8
0x1001ee7a9: add rcx, 0x10
0x1001ee7ad: mov qword ptr [rip + 0x1bf0374], rcx ; 0x101ddeb28
0x1001ee7b4: vmovq xmm0, rax
0x1001ee7b9: lea rax, [rip + 0x96ee7e] ; 0x100b5d63e Enum_Type
0x1001ee7c0: vmovq xmm1, rax
0x1001ee7c5: vpunpcklqdq xmm0, xmm1, xmm0
0x1001ee7c9: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x1001ee7ce: vmovdqa xmmword ptr [rip + 0x1bf038a], xmm0 ; 0x101ddeb60
0x1001ee7d6: lea rax, [rip + 0x1bf0383] ; 0x101ddeb60
0x1001ee7dd: mov qword ptr [rip + 0x1bf0388], 0 ; 0x101ddeb70
0x1001ee7e8: mov qword ptr [rip + 0x1bf0349], rax ; 0x101ddeb38
0x1001ee7ef: lea rax, [rip + 0x98ad03] ; 0x100b794f9 kCandleMesh_Default
0x1001ee7f6: mov qword ptr [rip + 0x1bf037b], rax ; 0x101ddeb78
0x1001ee7fd: lea rbx, [rip + 0x1bf0374] ; 0x101ddeb78
0x1001ee804: mov qword ptr [rip + 0x1bf0371], 0 ; 0x101ddeb80
0x1001ee80f: mov rax, qword ptr [rip + 0xb248ca] ; 0x100d130e0
0x1001ee816: mov qword ptr [rip + 0x1bf036b], rax ; 0x101ddeb88
0x1001ee81d: mov qword ptr [rip + 0xb248bc], rbx ; 0x100d130e0
0x1001ee824: mov edi, 4
0x1001ee829: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001ee82e: mov dword ptr [rax], 0
0x1001ee834: mov qword ptr [rip + 0x1bf035d], rax ; 0x101ddeb98
0x1001ee83b: mov r15, qword ptr [rip + 0xa183e6] ; 0x100c06c28 -> 0x1001ec4b0 __Z17GetMetaTypeByTypeI14CandleMeshTypeERK8MetaTypev
0x1001ee842: mov qword ptr [rip + 0x1bf0357], r15 ; 0x101ddeba0
0x1001ee849: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001ee84e: vmovaps xmmword ptr [rip + 0x1bf035a], xmm0 ; 0x101ddebb0
0x1001ee856: lea rax, [rip + 0x1bf0353] ; 0x101ddebb0
0x1001ee85d: mov qword ptr [rip + 0x1bf0358], 0 ; 0x101ddebc0
0x1001ee868: mov qword ptr [rip + 0x1bf0311], rax ; 0x101ddeb80
0x1001ee86f: lea rax, [rip + 0x98ac97] ; 0x100b7950d kCandleMesh_Ground
0x1001ee876: mov qword ptr [rip + 0x1bf034b], rax ; 0x101ddebc8
0x1001ee87d: lea r14, [rip + 0x1bf0344] ; 0x101ddebc8
0x1001ee884: mov qword ptr [rip + 0x1bf0341], 0 ; 0x101ddebd0
0x1001ee88f: mov qword ptr [rip + 0x1bf0342], rbx ; 0x101ddebd8
0x1001ee896: mov qword ptr [rip + 0xb24843], r14 ; 0x100d130e0
0x1001ee89d: mov edi, 4
0x1001ee8a2: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001ee8a7: mov dword ptr [rax], 1
0x1001ee8ad: mov qword ptr [rip + 0x1bf0334], rax ; 0x101ddebe8
0x1001ee8b4: mov qword ptr [rip + 0x1bf0335], r15 ; 0x101ddebf0
0x1001ee8bb: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001ee8c0: vmovaps xmmword ptr [rip + 0x1bf0338], xmm0 ; 0x101ddec00
0x1001ee8c8: lea rax, [rip + 0x1bf0331] ; 0x101ddec00
0x1001ee8cf: mov qword ptr [rip + 0x1bf0336], 0 ; 0x101ddec10
0x1001ee8da: mov qword ptr [rip + 0x1bf02ef], rax ; 0x101ddebd0
0x1001ee8e1: lea rax, [rip + 0x98ac38] ; 0x100b79520 kCandleMesh_Player
0x1001ee8e8: mov qword ptr [rip + 0x1bf0329], rax ; 0x101ddec18
0x1001ee8ef: lea rbx, [rip + 0x1bf0322] ; 0x101ddec18
0x1001ee8f6: mov qword ptr [rip + 0x1bf031f], 0 ; 0x101ddec20
0x1001ee901: mov qword ptr [rip + 0x1bf0320], r14 ; 0x101ddec28
0x1001ee908: mov qword ptr [rip + 0xb247d1], rbx ; 0x100d130e0
0x1001ee90f: mov edi, 4
0x1001ee914: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001ee919: mov dword ptr [rax], 2
0x1001ee91f: mov qword ptr [rip + 0x1bf0312], rax ; 0x101ddec38
0x1001ee926: mov qword ptr [rip + 0x1bf0313], r15 ; 0x101ddec40
0x1001ee92d: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001ee932: vmovaps xmmword ptr [rip + 0x1bf0316], xmm0 ; 0x101ddec50
0x1001ee93a: lea rax, [rip + 0x1bf030f] ; 0x101ddec50
0x1001ee941: mov qword ptr [rip + 0x1bf0314], 0 ; 0x101ddec60
0x1001ee94c: mov qword ptr [rip + 0x1bf02cd], rax ; 0x101ddec20
0x1001ee953: lea rax, [rip + 0x98abd9] ; 0x100b79533 kCandleMesh_Premium
0x1001ee95a: mov qword ptr [rip + 0x1bf0307], rax ; 0x101ddec68
0x1001ee961: lea r14, [rip + 0x1bf0300] ; 0x101ddec68
0x1001ee968: mov qword ptr [rip + 0x1bf02fd], 0 ; 0x101ddec70
0x1001ee973: mov qword ptr [rip + 0x1bf02fe], rbx ; 0x101ddec78
0x1001ee97a: mov qword ptr [rip + 0xb2475f], r14 ; 0x100d130e0
0x1001ee981: mov edi, 4
0x1001ee986: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001ee98b: mov dword ptr [rax], 3
0x1001ee991: mov qword ptr [rip + 0x1bf02f0], rax ; 0x101ddec88
0x1001ee998: mov qword ptr [rip + 0x1bf02f1], r15 ; 0x101ddec90
0x1001ee99f: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001ee9a4: vmovaps xmmword ptr [rip + 0x1bf02f4], xmm0 ; 0x101ddeca0
0x1001ee9ac: lea rax, [rip + 0x1bf02ed] ; 0x101ddeca0
0x1001ee9b3: mov qword ptr [rip + 0x1bf02f2], 0 ; 0x101ddecb0
0x1001ee9be: mov qword ptr [rip + 0x1bf02ab], rax ; 0x101ddec70
0x1001ee9c5: lea rax, [rip + 0x98ab7b] ; 0x100b79547 kCandleMesh_Ancestor
0x1001ee9cc: mov qword ptr [rip + 0x1bf02e5], rax ; 0x101ddecb8
0x1001ee9d3: lea rbx, [rip + 0x1bf02de] ; 0x101ddecb8
0x1001ee9da: mov qword ptr [rip + 0x1bf02db], 0 ; 0x101ddecc0
0x1001ee9e5: mov qword ptr [rip + 0x1bf02dc], r14 ; 0x101ddecc8
0x1001ee9ec: mov qword ptr [rip + 0xb246ed], rbx ; 0x100d130e0
0x1001ee9f3: mov edi, 4
0x1001ee9f8: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001ee9fd: mov dword ptr [rax], 4
0x1001eea03: mov qword ptr [rip + 0x1bf02ce], rax ; 0x101ddecd8
0x1001eea0a: mov qword ptr [rip + 0x1bf02cf], r15 ; 0x101ddece0
0x1001eea11: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001eea16: vmovaps xmmword ptr [rip + 0x1bf02d2], xmm0 ; 0x101ddecf0
0x1001eea1e: lea rax, [rip + 0x1bf02cb] ; 0x101ddecf0
0x1001eea25: mov qword ptr [rip + 0x1bf02d0], 0 ; 0x101dded00
0x1001eea30: mov qword ptr [rip + 0x1bf0289], rax ; 0x101ddecc0
0x1001eea37: lea rax, [rip + 0x98ab1e] ; 0x100b7955c kCandleMesh_Note
0x1001eea3e: mov qword ptr [rip + 0x1bf02c3], rax ; 0x101dded08
0x1001eea45: lea rax, [rip + 0x1bf02bc] ; 0x101dded08
0x1001eea4c: mov qword ptr [rip + 0x1bf02b9], 0 ; 0x101dded10
0x1001eea57: mov qword ptr [rip + 0x1bf02ba], rbx ; 0x101dded18
0x1001eea5e: mov qword ptr [rip + 0xb2467b], rax ; 0x100d130e0
0x1001eea65: mov edi, 4
0x1001eea6a: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001eea6f: mov dword ptr [rax], 5
0x1001eea75: mov qword ptr [rip + 0x1bf02ac], rax ; 0x101dded28
0x1001eea7c: mov qword ptr [rip + 0x1bf02ad], r15 ; 0x101dded30
0x1001eea83: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001eea88: vmovaps xmmword ptr [rip + 0x1bf02b0], xmm0 ; 0x101dded40
0x1001eea90: lea rax, [rip + 0x1bf02a9] ; 0x101dded40
0x1001eea97: mov qword ptr [rip + 0x1bf02ae], 0 ; 0x101dded50
0x1001eeaa2: mov qword ptr [rip + 0x1bf0267], rax ; 0x101dded10
0x1001eeaa9: lea rbx, [rip + 0x976622] ; 0x100b650d2 CandleObject
0x1001eeab0: mov qword ptr [rip + 0x1bf02a9], rbx ; 0x101dded60
0x1001eeab7: lea rax, [rip + 0x1bf029a] ; 0x101dded58
0x1001eeabe: mov qword ptr [rip + 0x1bf029f], 0 ; 0x101dded68
0x1001eeac9: mov qword ptr [rip + 0x1bf02a0], r12 ; 0x101dded70
0x1001eead0: mov qword ptr [rip + 0xa81481], rax ; 0x100c6ff58
0x1001eead7: mov qword ptr [rip + 0x1bf02a2], rax ; 0x101dded80
0x1001eeade: lea rax, [rip - 0x1b9225] ; 0x1000358c0
0x1001eeae5: mov qword ptr [rip + 0x1bf029c], rax ; 0x101dded88
0x1001eeaec: mov qword ptr [rip + 0x1bf0299], 0xffffffffffffffff ; 0x101dded90
0x1001eeaf7: mov qword ptr [rip + 0x1bf02ae], 0 ; 0x101ddedb0
0x1001eeb02: mov rax, qword ptr [rip + 0xa1c3af] ; 0x100c0aeb8
0x1001eeb09: add rax, 0x10
0x1001eeb0d: mov qword ptr [rip + 0x1bf0244], rax ; 0x101dded58
0x1001eeb14: xor eax, eax
0x1001eeb16: call 0x100011c10 ; 0x100011c10
0x1001eeb1b: lea rax, [rip + 0x97151a] ; 0x100b6003c Tool_Export
0x1001eeb22: vmovq xmm0, rax
0x1001eeb27: lea rax, [rip + 0x96feb1] ; 0x100b5e9df true
0x1001eeb2e: vmovq xmm1, rax
0x1001eeb33: vpunpcklqdq xmm0, xmm0, xmm1
0x1001eeb37: vmovdqa xmmword ptr [rbp - 0x40], xmm1
0x1001eeb3c: vmovdqa xmmword ptr [rip + 0x1bf027c], xmm0 ; 0x101ddedc0
0x1001eeb44: lea rax, [rip + 0x1bf0275] ; 0x101ddedc0
0x1001eeb4b: mov rcx, qword ptr [rip + 0x1bf0216] ; 0x101dded68
0x1001eeb52: mov qword ptr [rip + 0x1bf0277], rcx ; 0x101ddedd0
0x1001eeb59: mov qword ptr [rip + 0x1bf0208], rax ; 0x101dded68
0x1001eeb60: lea rax, [rip + 0x9884da] ; 0x100b77041 SetTransform
0x1001eeb67: mov qword ptr [rip + 0x1bf026a], rax ; 0x101ddedd8
0x1001eeb6e: lea rcx, [rip + 0x1bf0263] ; 0x101ddedd8
0x1001eeb75: mov qword ptr [rip + 0x1bf0260], 0 ; 0x101ddede0
0x1001eeb80: mov rax, qword ptr [rip + 0xa813d9] ; 0x100c6ff60
0x1001eeb87: mov qword ptr [rip + 0x1bf025a], rax ; 0x101ddede8
0x1001eeb8e: lea rax, [rip - 0x5f85] ; 0x1001e8c10
0x1001eeb95: vmovq xmm0, rax
0x1001eeb9a: vmovdqu xmmword ptr [rip + 0x1bf026e], xmm0 ; 0x101ddee10
0x1001eeba2: mov rax, qword ptr [rip + 0xa16b5f] ; 0x100c05708 -> 0x1001ec720 __Z12ApplyWrapperI12CandleObjectMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x1001eeba9: mov qword ptr [rip + 0x1bf0270], rax ; 0x101ddee20
0x1001eebb0: mov rax, qword ptr [rip + 0xa1a3e1] ; 0x100c08f98 -> 0x1001ec7c0 __Z21InitFunctionSignatureIM12CandleObjectFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x1001eebb7: mov qword ptr [rip + 0x1bf026a], rax ; 0x101ddee28
0x1001eebbe: mov rax, qword ptr [rip + 0xa18db3] ; 0x100c07978 -> 0x1001ec710 __Z18GetMetaClassByTypeIP12CandleObjectERK9MetaClassv
0x1001eebc5: mov qword ptr [rip + 0x1bf0264], rax ; 0x101ddee30
0x1001eebcc: lea rdx, [rip + 0x98468c] ; 0x100b7325f GetTransform
0x1001eebd3: mov qword ptr [rip + 0x1bf025e], rdx ; 0x101ddee38
0x1001eebda: lea rdx, [rip + 0x1bf0257] ; 0x101ddee38
0x1001eebe1: mov qword ptr [rip + 0x1bf0254], 0 ; 0x101ddee40
0x1001eebec: mov qword ptr [rip + 0x1bf0255], rcx ; 0x101ddee48
0x1001eebf3: lea rcx, [rip - 0x5fba] ; 0x1001e8c40
0x1001eebfa: vmovq xmm0, rcx
0x1001eebff: vmovdqu xmmword ptr [rip + 0x1bf0269], xmm0 ; 0x101ddee70
0x1001eec07: mov rcx, qword ptr [rip + 0xa16aea] ; 0x100c056f8 -> 0x1001ec840 __Z12ApplyWrapperI12CandleObjectMS0_FN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x1001eec0e: mov qword ptr [rip + 0x1bf026b], rcx ; 0x101ddee80
0x1001eec15: mov rsi, qword ptr [rip + 0xa1a36c] ; 0x100c08f88 -> 0x1001ec8d0 __Z21InitFunctionSignatureIM12CandleObjectFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x1001eec1c: mov qword ptr [rip + 0x1bf0265], rsi ; 0x101ddee88
0x1001eec23: mov qword ptr [rip + 0x1bf0266], rax ; 0x101ddee90
0x1001eec2a: lea rdi, [rip + 0x98463b] ; 0x100b7326c GetObb
0x1001eec31: mov qword ptr [rip + 0x1bf0260], rdi ; 0x101ddee98
0x1001eec38: lea rdi, [rip + 0x1bf0259] ; 0x101ddee98
0x1001eec3f: mov qword ptr [rip + 0x1bf0256], 0 ; 0x101ddeea0
0x1001eec4a: mov qword ptr [rip + 0x1bf0257], rdx ; 0x101ddeea8
0x1001eec51: lea rdx, [rip - 0x5fe8] ; 0x1001e8c70
0x1001eec58: vmovq xmm0, rdx
0x1001eec5d: vmovdqu xmmword ptr [rip + 0x1bf026b], xmm0 ; 0x101ddeed0
0x1001eec65: mov qword ptr [rip + 0x1bf0274], rcx ; 0x101ddeee0
0x1001eec6c: mov qword ptr [rip + 0x1bf0275], rsi ; 0x101ddeee8
0x1001eec73: mov qword ptr [rip + 0x1bf0276], rax ; 0x101ddeef0
0x1001eec7a: lea rcx, [rip + 0x9883cd] ; 0x100b7704e SetEnabled
0x1001eec81: mov qword ptr [rip + 0x1bf0270], rcx ; 0x101ddeef8
0x1001eec88: lea rcx, [rip + 0x1bf0269] ; 0x101ddeef8
0x1001eec8f: mov qword ptr [rip + 0x1bf0266], 0 ; 0x101ddef00
0x1001eec9a: mov qword ptr [rip + 0x1bf0267], rdi ; 0x101ddef08
0x1001eeca1: lea rdx, [rip - 0x5ff8] ; 0x1001e8cb0
0x1001eeca8: vmovq xmm0, rdx
0x1001eecad: vmovdqu xmmword ptr [rip + 0x1bf027b], xmm0 ; 0x101ddef30
0x1001eecb5: mov rdx, qword ptr [rip + 0xa16a54] ; 0x100c05710 -> 0x1001ec900 __Z12ApplyWrapperI12CandleObjectMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001eecbc: mov qword ptr [rip + 0x1bf027d], rdx ; 0x101ddef40
0x1001eecc3: mov rdx, qword ptr [rip + 0xa1a2d6] ; 0x100c08fa0 -> 0x1001ec9a0 __Z21InitFunctionSignatureIM12CandleObjectFvbEEvP17FunctionSignature
0x1001eecca: mov qword ptr [rip + 0x1bf0277], rdx ; 0x101ddef48
0x1001eecd1: mov qword ptr [rip + 0x1bf0278], rax ; 0x101ddef50
0x1001eecd8: lea rdx, [rip + 0x984594] ; 0x100b73273 GetEnabled
0x1001eecdf: mov qword ptr [rip + 0x1bf0272], rdx ; 0x101ddef58
0x1001eece6: lea rdx, [rip + 0x1bf026b] ; 0x101ddef58
0x1001eeced: mov qword ptr [rip + 0x1bf0268], 0 ; 0x101ddef60
0x1001eecf8: mov qword ptr [rip + 0x1bf0269], rcx ; 0x101ddef68
0x1001eecff: mov qword ptr [rip + 0xa8125a], rdx ; 0x100c6ff60
0x1001eed06: lea rcx, [rip - 0x603d] ; 0x1001e8cd0
0x1001eed0d: vmovq xmm0, rcx
0x1001eed12: vmovdqu xmmword ptr [rip + 0x1bf0276], xmm0 ; 0x101ddef90
0x1001eed1a: mov rcx, qword ptr [rip + 0xa169df] ; 0x100c05700 -> 0x1001eca20 __Z12ApplyWrapperI12CandleObjectMS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001eed21: mov qword ptr [rip + 0x1bf0278], rcx ; 0x101ddefa0
0x1001eed28: mov rcx, qword ptr [rip + 0xa1a261] ; 0x100c08f90 -> 0x1001ecaa0 __Z21InitFunctionSignatureIM12CandleObjectFbvEEvP17FunctionSignature
0x1001eed2f: mov qword ptr [rip + 0x1bf0272], rcx ; 0x101ddefa8
0x1001eed36: mov qword ptr [rip + 0x1bf0273], rax ; 0x101ddefb0
0x1001eed3d: lea rcx, [rip + 0x988315] ; 0x100b77059 enabled
0x1001eed44: mov qword ptr [rip + 0xaa15fd], rcx ; 0x100c90348
0x1001eed4b: lea rcx, [rip + 0xaa15f6] ; 0x100c90348
0x1001eed52: mov rdx, qword ptr [rip + 0xa88f07] ; 0x100c77c60
0x1001eed59: mov qword ptr [rip + 0xaa15f8], rdx ; 0x100c90358
0x1001eed60: mov qword ptr [rip + 0xaa15fd], 0xa0 ; 0x100c90368
0x1001eed6b: mov rsi, qword ptr [rip + 0xa187e6] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1001eed72: mov qword ptr [rip + 0xaa15f7], rsi ; 0x100c90370
0x1001eed79: mov qword ptr [rip + 0xaa15f8], rax ; 0x100c90378
0x1001eed80: mov qword ptr [rip + 0xaa15f5], 0xffffffffffffffff ; 0x100c90380
0x1001eed8b: mov qword ptr [rip + 0xaa15f6], r13 ; 0x100c90388
0x1001eed92: mov qword ptr [rip + 0xaa15f3], 0 ; 0x100c90390
0x1001eed9d: lea rdx, [rip + 0x98a7c9] ; 0x100b7956d consumable
0x1001eeda4: mov qword ptr [rip + 0xaa15ed], rdx ; 0x100c90398
0x1001eedab: lea rdx, [rip + 0xaa15e6] ; 0x100c90398
0x1001eedb2: mov qword ptr [rip + 0xaa15e3], 0 ; 0x100c903a0
0x1001eedbd: mov qword ptr [rip + 0xaa15e4], rcx ; 0x100c903a8
0x1001eedc4: mov qword ptr [rip + 0xaa15e9], 0xa3 ; 0x100c903b8
0x1001eedcf: mov qword ptr [rip + 0xaa15ea], rsi ; 0x100c903c0
0x1001eedd6: mov qword ptr [rip + 0xaa15eb], rax ; 0x100c903c8
0x1001eeddd: mov qword ptr [rip + 0xaa15e8], 0xffffffffffffffff ; 0x100c903d0
0x1001eede8: mov qword ptr [rip + 0xaa15e9], r13 ; 0x100c903d8
0x1001eedef: mov qword ptr [rip + 0xaa15e6], 0 ; 0x100c903e0
0x1001eedfa: lea rcx, [rip + 0x96fc01] ; 0x100b5ea02 Tool_DefaultValue
0x1001eee01: vmovq xmm0, rcx
0x1001eee06: vpunpcklqdq xmm1, xmm0, xmm1
0x1001eee0a: vmovdqa xmmword ptr [rip + 0x1bf01ae], xmm1 ; 0x101ddefc0
0x1001eee12: lea rcx, [rip + 0x1bf01a7] ; 0x101ddefc0
0x1001eee19: mov qword ptr [rip + 0x1bf01ac], 0 ; 0x101ddefd0
0x1001eee24: mov qword ptr [rip + 0xaa1525], rcx ; 0x100c90350
0x1001eee2b: lea rcx, [rip + 0x98a746] ; 0x100b79578 numWaxToGive
0x1001eee32: mov qword ptr [rip + 0xaa15af], rcx ; 0x100c903e8
0x1001eee39: lea rcx, [rip + 0xaa15a8] ; 0x100c903e8
0x1001eee40: mov qword ptr [rip + 0xaa15b1], rdx ; 0x100c903f8
0x1001eee47: mov qword ptr [rip + 0xaa15b6], 0xa4 ; 0x100c90408
0x1001eee52: mov rdx, qword ptr [rip + 0xa1870f] ; 0x100c07568 -> 0x10018ef60 __Z17GetMetaTypeByTypeIhERK8MetaTypev
0x1001eee59: mov qword ptr [rip + 0xaa15b0], rdx ; 0x100c90410
0x1001eee60: mov qword ptr [rip + 0xaa15b1], rax ; 0x100c90418
0x1001eee67: mov qword ptr [rip + 0xaa15ae], 0xffffffffffffffff ; 0x100c90420
0x1001eee72: mov qword ptr [rip + 0xaa15af], r13 ; 0x100c90428
0x1001eee79: mov qword ptr [rip + 0xaa15ac], 0 ; 0x100c90430
0x1001eee84: lea rdx, [rip + 0x96fc72] ; 0x100b5eafd 1
0x1001eee8b: vmovq xmm1, rdx
0x1001eee90: vpunpcklqdq xmm1, xmm0, xmm1
0x1001eee94: vmovdqa xmmword ptr [rip + 0x1bf0144], xmm1 ; 0x101ddefe0
0x1001eee9c: lea rdx, [rip + 0x1bf013d] ; 0x101ddefe0
0x1001eeea3: mov qword ptr [rip + 0x1bf0142], 0 ; 0x101ddeff0
0x1001eeeae: mov qword ptr [rip + 0xaa153b], rdx ; 0x100c903f0
0x1001eeeb5: lea rdx, [rip + 0x97c203] ; 0x100b6b0bf transform
0x1001eeebc: mov qword ptr [rip + 0xaa1575], rdx ; 0x100c90438
0x1001eeec3: lea rdx, [rip + 0xaa156e] ; 0x100c90438
0x1001eeeca: mov qword ptr [rip + 0xaa156b], 0 ; 0x100c90440
0x1001eeed5: mov qword ptr [rip + 0xaa156c], rcx ; 0x100c90448
0x1001eeedc: mov qword ptr [rip + 0xaa1571], 0x10 ; 0x100c90458
0x1001eeee7: mov rcx, qword ptr [rip + 0xa17eda] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x1001eeeee: mov qword ptr [rip + 0xaa156b], rcx ; 0x100c90460
0x1001eeef5: mov qword ptr [rip + 0xaa156c], rax ; 0x100c90468
0x1001eeefc: mov qword ptr [rip + 0xaa1569], 0xffffffffffffffff ; 0x100c90470
0x1001eef07: mov qword ptr [rip + 0xaa156a], r13 ; 0x100c90478
0x1001eef0e: mov qword ptr [rip + 0xaa1567], 0 ; 0x100c90480
0x1001eef19: lea rcx, [rip + 0x98839a] ; 0x100b772ba bstGuid
0x1001eef20: mov qword ptr [rip + 0xaa1561], rcx ; 0x100c90488
0x1001eef27: lea rcx, [rip + 0xaa155a] ; 0x100c90488
0x1001eef2e: mov qword ptr [rip + 0xaa1557], 0 ; 0x100c90490
0x1001eef39: mov qword ptr [rip + 0xaa1558], rdx ; 0x100c90498
0x1001eef40: mov qword ptr [rip + 0xaa155d], 0x98 ; 0x100c904a8
0x1001eef4b: mov rdx, qword ptr [rip + 0xa18626] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x1001eef52: mov qword ptr [rip + 0xaa1557], rdx ; 0x100c904b0
0x1001eef59: mov qword ptr [rip + 0xaa1558], rax ; 0x100c904b8
0x1001eef60: mov qword ptr [rip + 0xaa1555], 0xffffffffffffffff ; 0x100c904c0
0x1001eef6b: mov qword ptr [rip + 0xaa1556], r13 ; 0x100c904c8
0x1001eef72: mov qword ptr [rip + 0xaa1553], 0 ; 0x100c904d0
0x1001eef7d: lea rdx, [rip + 0x98a601] ; 0x100b79585 lit
0x1001eef84: mov qword ptr [rip + 0xaa154d], rdx ; 0x100c904d8
0x1001eef8b: lea rdx, [rip + 0xaa1546] ; 0x100c904d8
0x1001eef92: mov qword ptr [rip + 0xaa1543], 0 ; 0x100c904e0
0x1001eef9d: mov qword ptr [rip + 0xaa1544], rcx ; 0x100c904e8
0x1001eefa4: mov qword ptr [rip + 0xaa1549], 0xa1 ; 0x100c904f8
0x1001eefaf: mov qword ptr [rip + 0xaa154a], rsi ; 0x100c90500
0x1001eefb6: mov qword ptr [rip + 0xaa154b], rax ; 0x100c90508
0x1001eefbd: mov qword ptr [rip + 0xaa1548], 0xffffffffffffffff ; 0x100c90510
0x1001eefc8: mov qword ptr [rip + 0xaa1549], r13 ; 0x100c90518
0x1001eefcf: mov qword ptr [rip + 0xaa1546], 0 ; 0x100c90520
0x1001eefda: lea rcx, [rip + 0x98a5a8] ; 0x100b79589 lifetime
0x1001eefe1: mov qword ptr [rip + 0xaa1540], rcx ; 0x100c90528
0x1001eefe8: lea rcx, [rip + 0xaa1539] ; 0x100c90528
0x1001eefef: mov qword ptr [rip + 0xaa1536], 0 ; 0x100c90530
0x1001eeffa: mov qword ptr [rip + 0xaa1537], rdx ; 0x100c90538
0x1001ef001: mov qword ptr [rip + 0xaa153c], 0x9c ; 0x100c90548
0x1001ef00c: mov rdx, qword ptr [rip + 0xa1854d] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1001ef013: mov qword ptr [rip + 0xaa1536], rdx ; 0x100c90550
0x1001ef01a: mov qword ptr [rip + 0xaa1537], rax ; 0x100c90558
0x1001ef021: mov qword ptr [rip + 0xaa1534], 0xffffffffffffffff ; 0x100c90560
0x1001ef02c: mov qword ptr [rip + 0xaa1535], r13 ; 0x100c90568
0x1001ef033: mov qword ptr [rip + 0xaa1532], 0 ; 0x100c90570
0x1001ef03e: lea rdx, [rip + 0x988905] ; 0x100b7794a meshType
0x1001ef045: mov qword ptr [rip + 0xaa152c], rdx ; 0x100c90578
0x1001ef04c: lea rdx, [rip + 0xaa1525] ; 0x100c90578
0x1001ef053: mov qword ptr [rip + 0xaa152e], rcx ; 0x100c90588
0x1001ef05a: mov qword ptr [rip + 0xaa1533], 0xa8 ; 0x100c90598
0x1001ef065: mov qword ptr [rip + 0xaa1534], r15 ; 0x100c905a0
0x1001ef06c: mov qword ptr [rip + 0xaa1535], rax ; 0x100c905a8
0x1001ef073: mov qword ptr [rip + 0xaa1532], 0xffffffffffffffff ; 0x100c905b0
0x1001ef07e: mov qword ptr [rip + 0xaa1533], r13 ; 0x100c905b8
0x1001ef085: mov qword ptr [rip + 0xaa1530], 0 ; 0x100c905c0
0x1001ef090: lea rcx, [rip + 0x98a462] ; 0x100b794f9 kCandleMesh_Default
0x1001ef097: vmovq xmm1, rcx
0x1001ef09c: vpunpcklqdq xmm0, xmm0, xmm1
0x1001ef0a0: vmovdqa xmmword ptr [rip + 0x1beff58], xmm0 ; 0x101ddf000
0x1001ef0a8: lea rcx, [rip + 0x1beff51] ; 0x101ddf000
0x1001ef0af: mov qword ptr [rip + 0x1beff56], 0 ; 0x101ddf010
0x1001ef0ba: mov qword ptr [rip + 0xaa14bf], rcx ; 0x100c90580
0x1001ef0c1: lea rcx, [rip + 0x98a4ca] ; 0x100b79592 specialSound
0x1001ef0c8: mov qword ptr [rip + 0xaa14f9], rcx ; 0x100c905c8
0x1001ef0cf: lea rcx, [rip + 0xaa14f2] ; 0x100c905c8
0x1001ef0d6: mov qword ptr [rip + 0xaa14ef], 0 ; 0x100c905d0
0x1001ef0e1: mov qword ptr [rip + 0xaa14f0], rdx ; 0x100c905d8
0x1001ef0e8: mov qword ptr [rip + 0xa88b71], rcx ; 0x100c77c60
0x1001ef0ef: mov qword ptr [rip + 0xaa14ee], 0xa2 ; 0x100c905e8
0x1001ef0fa: mov qword ptr [rip + 0xaa14ef], rsi ; 0x100c905f0
0x1001ef101: mov qword ptr [rip + 0xaa14f0], rax ; 0x100c905f8
0x1001ef108: mov qword ptr [rip + 0xaa14ed], 0xffffffffffffffff ; 0x100c90600
0x1001ef113: mov qword ptr [rip + 0xaa14ee], r13 ; 0x100c90608
0x1001ef11a: mov qword ptr [rip + 0xaa14eb], 0 ; 0x100c90610
0x1001ef125: lea rax, [rip + 0x98a473] ; 0x100b7959f CandleBarn
0x1001ef12c: mov qword ptr [rip + 0x1befeed], rax ; 0x101ddf020
0x1001ef133: lea rax, [rip + 0x1befede] ; 0x101ddf018
0x1001ef13a: mov qword ptr [rip + 0x1befee3], 0 ; 0x101ddf028
0x1001ef145: mov rcx, qword ptr [rip + 0xa80e0c] ; 0x100c6ff58
0x1001ef14c: mov qword ptr [rip + 0x1befedd], rcx ; 0x101ddf030
0x1001ef153: mov qword ptr [rip + 0xa80dfe], rax ; 0x100c6ff58
0x1001ef15a: mov qword ptr [rip + 0x1befedf], rax ; 0x101ddf040
0x1001ef161: mov rax, qword ptr [rip + 0xa19548] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1001ef168: mov qword ptr [rip + 0x1befed9], rax ; 0x101ddf048
0x1001ef16f: mov dword ptr [rip + 0x1befed7], 0xffffffff ; 0x101ddf050
0x1001ef179: mov dword ptr [rip + 0x1befed1], 0xffffffff ; 0x101ddf054
0x1001ef183: mov qword ptr [rip + 0x1befee2], 0 ; 0x101ddf070
0x1001ef18e: mov rax, qword ptr [rip + 0xa1b793] ; 0x100c0a928
0x1001ef195: add rax, 0x10
0x1001ef199: mov qword ptr [rip + 0x1befe78], rax ; 0x101ddf018
0x1001ef1a0: xor eax, eax
0x1001ef1a2: call 0x100011c10 ; 0x100011c10
0x1001ef1a7: lea rax, [rip + 0x96d75e] ; 0x100b5c90c Initialize
0x1001ef1ae: mov qword ptr [rip + 0x1befec3], rax ; 0x101ddf078
0x1001ef1b5: lea rcx, [rip + 0x1befebc] ; 0x101ddf078
0x1001ef1bc: mov qword ptr [rip + 0x1befeb9], 0 ; 0x101ddf080
0x1001ef1c7: mov rax, qword ptr [rip + 0xa80d92] ; 0x100c6ff60
0x1001ef1ce: mov qword ptr [rip + 0x1befeb3], rax ; 0x101ddf088
0x1001ef1d5: lea rax, [rip - 0x64dc] ; 0x1001e8d00
0x1001ef1dc: vmovq xmm0, rax
0x1001ef1e1: vmovdqu xmmword ptr [rip + 0x1befec7], xmm0 ; 0x101ddf0b0
0x1001ef1e9: mov rax, qword ptr [rip + 0xa160c0] ; 0x100c052b0 -> 0x1001ed920 __Z12ApplyWrapperI10CandleBarnMS0_FvP15ResourceManagerP9FlameBarnP11EmitterBarnP12SoundManagerP5SceneEEvM9VoidClassFvvEPv8VariablePSH_j
0x1001ef1f0: mov qword ptr [rip + 0x1befec9], rax ; 0x101ddf0c0
0x1001ef1f7: mov rax, qword ptr [rip + 0xa19942] ; 0x100c08b40 -> 0x1001ed930 __Z21InitFunctionSignatureIM10CandleBarnFvP15ResourceManagerP9FlameBarnP11EmitterBarnP12SoundManagerP5SceneEEvP17FunctionSignature
0x1001ef1fe: mov qword ptr [rip + 0x1befec3], rax ; 0x101ddf0c8
0x1001ef205: mov rax, qword ptr [rip + 0xa183bc] ; 0x100c075c8 -> 0x1001ed910 __Z18GetMetaClassByTypeIP10CandleBarnERK9MetaClassv
0x1001ef20c: mov qword ptr [rip + 0x1befebd], rax ; 0x101ddf0d0
0x1001ef213: lea rdx, [rip + 0x97182b] ; 0x100b60a45 OnLevelLoad
0x1001ef21a: mov qword ptr [rip + 0x1befeb7], rdx ; 0x101ddf0d8
0x1001ef221: lea rdx, [rip + 0x1befeb0] ; 0x101ddf0d8
0x1001ef228: mov qword ptr [rip + 0x1befead], 0 ; 0x101ddf0e0
0x1001ef233: mov qword ptr [rip + 0x1befeae], rcx ; 0x101ddf0e8
0x1001ef23a: lea rcx, [rip - 0x5f21] ; 0x1001e9320
0x1001ef241: vmovq xmm0, rcx
0x1001ef246: vmovdqu xmmword ptr [rip + 0x1befec2], xmm0 ; 0x101ddf110
0x1001ef24e: mov rcx, qword ptr [rip + 0xa16063] ; 0x100c052b8 -> 0x1001edb60 __Z12ApplyWrapperI10CandleBarnMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x1001ef255: mov qword ptr [rip + 0x1befec4], rcx ; 0x101ddf120
0x1001ef25c: mov rsi, qword ptr [rip + 0xa198e5] ; 0x100c08b48 -> 0x1001edc00 __Z21InitFunctionSignatureIM10CandleBarnFvP4GameEEvP17FunctionSignature
0x1001ef263: mov qword ptr [rip + 0x1befebe], rsi ; 0x101ddf128
0x1001ef26a: mov qword ptr [rip + 0x1befebf], rax ; 0x101ddf130
0x1001ef271: lea rdi, [rip + 0x9717e3] ; 0x100b60a5b OnLevelUnload
0x1001ef278: mov qword ptr [rip + 0x1befeb9], rdi ; 0x101ddf138
0x1001ef27f: lea rdi, [rip + 0x1befeb2] ; 0x101ddf138
0x1001ef286: mov qword ptr [rip + 0x1befeaf], 0 ; 0x101ddf140
0x1001ef291: mov qword ptr [rip + 0x1befeb0], rdx ; 0x101ddf148
0x1001ef298: lea rdx, [rip - 0x58df] ; 0x1001e99c0
0x1001ef29f: vmovq xmm0, rdx
0x1001ef2a4: vmovdqu xmmword ptr [rip + 0x1befec4], xmm0 ; 0x101ddf170
0x1001ef2ac: mov qword ptr [rip + 0x1befecd], rcx ; 0x101ddf180
0x1001ef2b3: mov qword ptr [rip + 0x1befece], rsi ; 0x101ddf188
0x1001ef2ba: mov qword ptr [rip + 0x1befecf], rax ; 0x101ddf190
0x1001ef2c1: lea rdx, [rip + 0x96d685] ; 0x100b5c94d Update
0x1001ef2c8: mov qword ptr [rip + 0x1befec9], rdx ; 0x101ddf198
0x1001ef2cf: lea rdx, [rip + 0x1befec2] ; 0x101ddf198
0x1001ef2d6: mov qword ptr [rip + 0x1befebf], 0 ; 0x101ddf1a0
0x1001ef2e1: mov qword ptr [rip + 0x1befec0], rdi ; 0x101ddf1a8
0x1001ef2e8: lea rdi, [rip - 0x574f] ; 0x1001e9ba0
0x1001ef2ef: vmovq xmm0, rdi
0x1001ef2f4: vmovdqu xmmword ptr [rip + 0x1befed4], xmm0 ; 0x101ddf1d0
0x1001ef2fc: mov qword ptr [rip + 0x1befedd], rcx ; 0x101ddf1e0
0x1001ef303: mov qword ptr [rip + 0x1befede], rsi ; 0x101ddf1e8
0x1001ef30a: mov qword ptr [rip + 0x1befedf], rax ; 0x101ddf1f0
0x1001ef311: lea rdi, [rip + 0x972ae9] ; 0x100b61e01 RenderFlush
0x1001ef318: mov qword ptr [rip + 0x1befed9], rdi ; 0x101ddf1f8
0x1001ef31f: lea rdi, [rip + 0x1befed2] ; 0x101ddf1f8
0x1001ef326: mov qword ptr [rip + 0x1befecf], 0 ; 0x101ddf200
0x1001ef331: mov qword ptr [rip + 0x1befed0], rdx ; 0x101ddf208
0x1001ef338: lea rdx, [rip - 0x511f] ; 0x1001ea220
0x1001ef33f: vmovq xmm0, rdx
0x1001ef344: vmovdqu xmmword ptr [rip + 0x1befee4], xmm0 ; 0x101ddf230
0x1001ef34c: mov qword ptr [rip + 0x1befeed], rcx ; 0x101ddf240
0x1001ef353: mov qword ptr [rip + 0x1befeee], rsi ; 0x101ddf248
0x1001ef35a: mov qword ptr [rip + 0x1befeef], rax ; 0x101ddf250
0x1001ef361: lea rcx, [rip + 0x98a242] ; 0x100b795aa CreateCandleObject
0x1001ef368: mov qword ptr [rip + 0x1befee9], rcx ; 0x101ddf258
0x1001ef36f: lea rcx, [rip + 0x1befee2] ; 0x101ddf258
0x1001ef376: mov qword ptr [rip + 0x1befeeb], rdi ; 0x101ddf268
0x1001ef37d: mov qword ptr [rip + 0xa80bdc], rcx ; 0x100c6ff60
0x1001ef384: lea rcx, [rip - 0x49ab] ; 0x1001ea9e0
0x1001ef38b: vmovq xmm0, rcx
0x1001ef390: vmovdqu xmmword ptr [rip + 0x1befef8], xmm0 ; 0x101ddf290
0x1001ef398: mov rcx, qword ptr [rip + 0xa15f09] ; 0x100c052a8 -> 0x1001edc80 __Z12ApplyWrapperI10CandleBarnMS0_FP12CandleObjectPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x1001ef39f: mov qword ptr [rip + 0x1befefa], rcx ; 0x101ddf2a0
0x1001ef3a6: mov rcx, qword ptr [rip + 0xa1978b] ; 0x100c08b38 -> 0x1001edd40 __Z21InitFunctionSignatureIM10CandleBarnFP12CandleObjectPK9MetaClassEEvP17FunctionSignature
0x1001ef3ad: mov qword ptr [rip + 0x1befef4], rcx ; 0x101ddf2a8
0x1001ef3b4: mov qword ptr [rip + 0x1befef5], rax ; 0x101ddf2b0
0x1001ef3bb: vmovq xmm0, rbx
0x1001ef3c0: lea rax, [rip + 0x987d01] ; 0x100b770c8 ObjectFactory_CreatesType
0x1001ef3c7: vmovq xmm1, rax
0x1001ef3cc: vpunpcklqdq xmm0, xmm1, xmm0
0x1001ef3d0: vmovdqa xmmword ptr [rip + 0x1befee8], xmm0 ; 0x101ddf2c0
0x1001ef3d8: lea rax, [rip + 0x1befee1] ; 0x101ddf2c0
0x1001ef3df: mov qword ptr [rip + 0x1befee6], 0 ; 0x101ddf2d0
0x1001ef3ea: mov qword ptr [rip + 0x1befe6f], rax ; 0x101ddf260
0x1001ef3f1: lea rax, [rip + 0x98a293] ; 0x100b7968b CandleCalendar
0x1001ef3f8: mov qword ptr [rip + 0x1befee1], rax ; 0x101ddf2e0
0x1001ef3ff: lea rax, [rip + 0x1befed2] ; 0x101ddf2d8
0x1001ef406: mov qword ptr [rip + 0x1befed7], 0 ; 0x101ddf2e8
0x1001ef411: mov rcx, qword ptr [rip + 0xa80b40] ; 0x100c6ff58
0x1001ef418: mov qword ptr [rip + 0x1befed1], rcx ; 0x101ddf2f0
0x1001ef41f: mov qword ptr [rip + 0xa80b32], rax ; 0x100c6ff58
0x1001ef426: mov qword ptr [rip + 0x1befed3], rax ; 0x101ddf300
0x1001ef42d: mov rax, qword ptr [rip + 0xa191b4] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x1001ef434: mov qword ptr [rip + 0x1befecd], rax ; 0x101ddf308
0x1001ef43b: mov dword ptr [rip + 0x1befecb], 0xffffffff ; 0x101ddf310
0x1001ef445: mov dword ptr [rip + 0x1befec5], 0xffffffff ; 0x101ddf314
0x1001ef44f: mov qword ptr [rip + 0x1befed6], 0 ; 0x101ddf330
0x1001ef45a: mov rax, qword ptr [rip + 0xa1beff] ; 0x100c0b360
0x1001ef461: add rax, 0x10
0x1001ef465: mov qword ptr [rip + 0x1befe6c], rax ; 0x101ddf2d8
0x1001ef46c: xor eax, eax
0x1001ef46e: call 0x100011c10 ; 0x100011c10
0x1001ef473: lea rax, [rip + 0x96f551] ; 0x100b5e9cb Tool_AutoStartEvent
0x1001ef47a: vmovq xmm0, rax
0x1001ef47f: vpunpcklqdq xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x1001ef484: vmovdqa xmmword ptr [rip + 0x1befeb4], xmm0 ; 0x101ddf340
0x1001ef48c: lea rax, [rip + 0x1befead] ; 0x101ddf340
0x1001ef493: mov rcx, qword ptr [rip + 0x1befe4e] ; 0x101ddf2e8
0x1001ef49a: mov qword ptr [rip + 0x1befeaf], rcx ; 0x101ddf350
0x1001ef4a1: mov qword ptr [rip + 0x1befe40], rax ; 0x101ddf2e8
0x1001ef4a8: lea rax, [rip + 0x975bf3] ; 0x100b650a2 candles
0x1001ef4af: mov qword ptr [rip + 0xaa1162], rax ; 0x100c90618
0x1001ef4b6: lea rax, [rip + 0xaa115b] ; 0x100c90618
0x1001ef4bd: mov rcx, qword ptr [rip + 0xa8879c] ; 0x100c77c60
0x1001ef4c4: mov qword ptr [rip + 0xaa115d], rcx ; 0x100c90628
0x1001ef4cb: mov qword ptr [rip + 0xa8878e], rax ; 0x100c77c60
0x1001ef4d2: mov qword ptr [rip + 0xaa115b], 0x38 ; 0x100c90638
0x1001ef4dd: mov rax, qword ptr [rip + 0xa17de4] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x1001ef4e4: mov qword ptr [rip + 0xaa1155], rax ; 0x100c90640
0x1001ef4eb: mov rax, qword ptr [rip + 0xa187a6] ; 0x100c07c98 -> 0x1001ee230 __Z18GetMetaClassByTypeIP14CandleCalendarERK9MetaClassv
0x1001ef4f2: mov qword ptr [rip + 0xaa114f], rax ; 0x100c90648
0x1001ef4f9: mov qword ptr [rip + 0xaa114c], 0xffffffffffffffff ; 0x100c90650
0x1001ef504: mov qword ptr [rip + 0xaa114d], r13 ; 0x100c90658
0x1001ef50b: mov qword ptr [rip + 0xaa114a], 0 ; 0x100c90660
0x1001ef516: lea rax, [rip + 0x96f4de] ; 0x100b5e9fb Object
0x1001ef51d: vmovq xmm0, rax
0x1001ef522: lea rax, [rip + 0x96f4c3] ; 0x100b5e9ec Tool_ClumpType
0x1001ef529: vmovq xmm1, rax
0x1001ef52e: vpunpcklqdq xmm0, xmm1, xmm0
0x1001ef532: vmovdqa xmmword ptr [rip + 0x1befe26], xmm0 ; 0x101ddf360
0x1001ef53a: lea rax, [rip + 0x1befe1f] ; 0x101ddf360
0x1001ef541: mov qword ptr [rip + 0x1befe24], 0 ; 0x101ddf370
0x1001ef54c: mov qword ptr [rip + 0xaa10cd], rax ; 0x100c90620
0x1001ef553: add rsp, 0x18
0x1001ef557: pop rbx
0x1001ef558: pop r12
0x1001ef55a: pop r13
0x1001ef55c: pop r14
0x1001ef55e: pop r15
0x1001ef560: pop rbp
0x1001ef561: ret 
0x1001ef562: nop 
0x1001ef563: nop 
0x1001ef564: nop 
0x1001ef565: nop 
0x1001ef566: nop 
0x1001ef567: nop 
0x1001ef568: nop 
0x1001ef569: nop 
0x1001ef56a: nop 
0x1001ef56b: nop 
0x1001ef56c: nop 
0x1001ef56d: nop 
0x1001ef56e: nop 
0x1001ef56f: nop 
