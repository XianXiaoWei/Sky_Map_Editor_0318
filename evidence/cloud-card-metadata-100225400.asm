0x100225400: push rbp
0x100225401: mov rbp, rsp
0x100225404: push rbx
0x100225405: push rax
0x100225406: lea rax, [rip + 0x955630] ; 0x100b7aa3d kSortCloudCards
0x10022540d: mov qword ptr [rip + 0x1bbcd1c], rax ; 0x101de2130
0x100225414: lea rcx, [rip + 0x1bbcd15] ; 0x101de2130
0x10022541b: mov rax, qword ptr [rip + 0xa6a87e] ; 0x100c8fca0
0x100225422: mov qword ptr [rip + 0x1bbcd17], rax ; 0x101de2140
0x100225429: lea rax, [rip + 0xa70d50] ; 0x100c96180
0x100225430: vmovq xmm1, rax
0x100225435: lea rax, [rip + 0x955611] ; 0x100b7aa4d CloudCard.cpp
0x10022543c: vmovq xmm0, rax
0x100225441: vpunpcklqdq xmm1, xmm0, xmm1
0x100225445: vmovdqu xmmword ptr [rip + 0x1bbcd03], xmm1 ; 0x101de2150
0x10022544d: mov rax, qword ptr [rip + 0x9e2104] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x100225454: mov qword ptr [rip + 0x1bbcd05], rax ; 0x101de2160
0x10022545b: mov qword ptr [rip + 0x1bbcd02], 0 ; 0x101de2168
0x100225466: lea rbx, [rip - 0x20ba4d] ; 0x100019a20
0x10022546d: mov qword ptr [rip + 0x1bbccfc], rbx ; 0x101de2170
0x100225474: mov qword ptr [rip + 0x1bbccf9], 0 ; 0x101de2178
0x10022547f: lea rdx, [rip + 0x93c9c6] ; 0x100b61e4c Clouds
0x100225486: vmovq xmm1, rdx
0x10022548b: lea rdx, [rip + 0x938b8b] ; 0x100b5e01d TweakCategory
0x100225492: vmovq xmm2, rdx
0x100225497: vpunpcklqdq xmm1, xmm2, xmm1
0x10022549b: vmovdqa xmmword ptr [rip + 0x1bbccdd], xmm1 ; 0x101de2180
0x1002254a3: lea rdx, [rip + 0x1bbccd6] ; 0x101de2180
0x1002254aa: mov qword ptr [rip + 0x1bbccdb], 0 ; 0x101de2190
0x1002254b5: mov qword ptr [rip + 0x1bbcc7c], rdx ; 0x101de2138
0x1002254bc: lea rdx, [rip + 0x955598] ; 0x100b7aa5b kDebugCloudCards
0x1002254c3: mov qword ptr [rip + 0x1bbccd6], rdx ; 0x101de21a0
0x1002254ca: lea rdx, [rip + 0x1bbcccf] ; 0x101de21a0
0x1002254d1: mov qword ptr [rip + 0x1bbccd8], rcx ; 0x101de21b0
0x1002254d8: lea rcx, [rip + 0x1bbccb9] ; 0x101de2198
0x1002254df: vmovq xmm2, rcx
0x1002254e4: vpunpcklqdq xmm2, xmm0, xmm2
0x1002254e8: vmovdqu xmmword ptr [rip + 0x1bbccd0], xmm2 ; 0x101de21c0
0x1002254f0: mov qword ptr [rip + 0x1bbccd9], rax ; 0x101de21d0
0x1002254f7: mov qword ptr [rip + 0x1bbccd6], 0 ; 0x101de21d8
0x100225502: mov qword ptr [rip + 0x1bbccd7], rbx ; 0x101de21e0
0x100225509: mov qword ptr [rip + 0x1bbccd4], 0 ; 0x101de21e8
0x100225514: vmovdqa xmmword ptr [rip + 0x1bbccd4], xmm1 ; 0x101de21f0
0x10022551c: lea rcx, [rip + 0x1bbcccd] ; 0x101de21f0
0x100225523: mov qword ptr [rip + 0x1bbccd2], 0 ; 0x101de2200
0x10022552e: mov qword ptr [rip + 0x1bbcc73], rcx ; 0x101de21a8
0x100225535: lea rcx, [rip + 0x955530] ; 0x100b7aa6c kRenderCloudCards
0x10022553c: mov qword ptr [rip + 0x1bbccc5], rcx ; 0x101de2208
0x100225543: lea rcx, [rip + 0x1bbccbe] ; 0x101de2208
0x10022554a: mov qword ptr [rip + 0x1bbccc7], rdx ; 0x101de2218
0x100225551: mov qword ptr [rip + 0xa6a748], rcx ; 0x100c8fca0
0x100225558: lea rcx, [rip + 0xa70c22] ; 0x100c96181
0x10022555f: vmovq xmm2, rcx
0x100225564: vpunpcklqdq xmm0, xmm0, xmm2
0x100225568: vmovdqu xmmword ptr [rip + 0x1bbccb8], xmm0 ; 0x101de2228
0x100225570: mov qword ptr [rip + 0x1bbccc1], rax ; 0x101de2238
0x100225577: mov qword ptr [rip + 0x1bbccbe], 0 ; 0x101de2240
0x100225582: mov qword ptr [rip + 0x1bbccbf], rbx ; 0x101de2248
0x100225589: mov qword ptr [rip + 0x1bbccbc], 0 ; 0x101de2250
0x100225594: vmovdqa xmmword ptr [rip + 0x1bbccc4], xmm1 ; 0x101de2260
0x10022559c: lea rax, [rip + 0x1bbccbd] ; 0x101de2260
0x1002255a3: mov qword ptr [rip + 0x1bbccc2], 0 ; 0x101de2270
0x1002255ae: mov qword ptr [rip + 0x1bbcc5b], rax ; 0x101de2210
0x1002255b5: lea rax, [rip + 0x94e9a3] ; 0x100b73f5f CloudCard
0x1002255bc: mov qword ptr [rip + 0x1bbccbd], rax ; 0x101de2280
0x1002255c3: lea rax, [rip + 0x1bbccae] ; 0x101de2278
0x1002255ca: mov qword ptr [rip + 0x1bbccb3], 0 ; 0x101de2288
0x1002255d5: mov rcx, qword ptr [rip + 0xa4a97c] ; 0x100c6ff58
0x1002255dc: mov qword ptr [rip + 0x1bbccad], rcx ; 0x101de2290
0x1002255e3: mov qword ptr [rip + 0xa4a96e], rax ; 0x100c6ff58
0x1002255ea: mov qword ptr [rip + 0x1bbccaf], rax ; 0x101de22a0
0x1002255f1: mov rax, qword ptr [rip + 0x9e20a0] ; 0x100c07698 -> 0x100198820 __Z18GetMetaClassByTypeIP10LevelModelERK9MetaClassv
0x1002255f8: mov qword ptr [rip + 0x1bbcca9], rax ; 0x101de22a8
0x1002255ff: mov dword ptr [rip + 0x1bbcca7], 0xffffffff ; 0x101de22b0
0x100225609: mov dword ptr [rip + 0x1bbcca1], 0xffffffff ; 0x101de22b4
0x100225613: mov qword ptr [rip + 0x1bbccb2], 0 ; 0x101de22d0
0x10022561e: mov rax, qword ptr [rip + 0x9e724b] ; 0x100c0c870
0x100225625: add rax, 0x10
0x100225629: mov qword ptr [rip + 0x1bbcc48], rax ; 0x101de2278
0x100225630: xor eax, eax
0x100225632: call 0x100011c10 ; 0x100011c10
0x100225637: lea rax, [rip + 0x9393a1] ; 0x100b5e9df true
0x10022563e: vmovq xmm0, rax
0x100225643: lea rax, [rip + 0x93a9f2] ; 0x100b6003c Tool_Export
0x10022564a: vmovq xmm1, rax
0x10022564f: vpunpcklqdq xmm0, xmm1, xmm0
0x100225653: vmovdqa xmmword ptr [rip + 0x1bbcc85], xmm0 ; 0x101de22e0
0x10022565b: lea rax, [rip + 0x1bbcc7e] ; 0x101de22e0
0x100225662: mov rcx, qword ptr [rip + 0x1bbcc1f] ; 0x101de2288
0x100225669: mov qword ptr [rip + 0x1bbcc80], rcx ; 0x101de22f0
0x100225670: mov qword ptr [rip + 0x1bbcc11], rax ; 0x101de2288
0x100225677: lea rax, [rip + 0x93ef01] ; 0x100b6457f HotDate
0x10022567e: mov qword ptr [rip + 0x1bbcc73], rax ; 0x101de22f8
0x100225685: lea rcx, [rip + 0x1bbcc6c] ; 0x101de22f8
0x10022568c: mov qword ptr [rip + 0x1bbcc69], 0 ; 0x101de2300
0x100225697: mov rax, qword ptr [rip + 0xa4a8c2] ; 0x100c6ff60
0x10022569e: mov qword ptr [rip + 0x1bbcc63], rax ; 0x101de2308
0x1002256a5: lea rax, [rip - 0x5e5c] ; 0x10021f850
0x1002256ac: vmovq xmm0, rax
0x1002256b1: vmovdqu xmmword ptr [rip + 0x1bbcc77], xmm0 ; 0x101de2330
0x1002256b9: mov rax, qword ptr [rip + 0x9e1150] ; 0x100c06810 -> 0x100221c90 __Z12ApplyWrapperI9CloudCardMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1002256c0: mov qword ptr [rip + 0x1bbcc79], rax ; 0x101de2340
0x1002256c7: mov rax, qword ptr [rip + 0x9e49d2] ; 0x100c0a0a0 -> 0x100221cf0 __Z21InitFunctionSignatureIM9CloudCardFvvEEvP17FunctionSignature
0x1002256ce: mov qword ptr [rip + 0x1bbcc73], rax ; 0x101de2348
0x1002256d5: mov rax, qword ptr [rip + 0x9e3284] ; 0x100c08960 -> 0x100221990 __Z18GetMetaClassByTypeIP9CloudCardERK9MetaClassv
0x1002256dc: mov qword ptr [rip + 0x1bbcc6d], rax ; 0x101de2350
0x1002256e3: lea rdx, [rip + 0x951957] ; 0x100b77041 SetTransform
0x1002256ea: mov qword ptr [rip + 0x1bbcc67], rdx ; 0x101de2358
0x1002256f1: lea rdx, [rip + 0x1bbcc60] ; 0x101de2358
0x1002256f8: mov qword ptr [rip + 0x1bbcc5d], 0 ; 0x101de2360
0x100225703: mov qword ptr [rip + 0x1bbcc5e], rcx ; 0x101de2368
0x10022570a: lea rcx, [rip - 0x5eb1] ; 0x10021f860
0x100225711: vmovq xmm0, rcx
0x100225716: vmovdqu xmmword ptr [rip + 0x1bbcc72], xmm0 ; 0x101de2390
0x10022571e: mov rcx, qword ptr [rip + 0x9e10e3] ; 0x100c06808 -> 0x100221d10 __Z12ApplyWrapperI9CloudCardMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x100225725: mov qword ptr [rip + 0x1bbcc74], rcx ; 0x101de23a0
0x10022572c: mov rcx, qword ptr [rip + 0x9e4965] ; 0x100c0a098 -> 0x100221db0 __Z21InitFunctionSignatureIM9CloudCardFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x100225733: mov qword ptr [rip + 0x1bbcc6e], rcx ; 0x101de23a8
0x10022573a: mov qword ptr [rip + 0x1bbcc6f], rax ; 0x101de23b0
0x100225741: lea rcx, [rip + 0x94db17] ; 0x100b7325f GetTransform
0x100225748: mov qword ptr [rip + 0x1bbcc69], rcx ; 0x101de23b8
0x10022574f: lea rcx, [rip + 0x1bbcc62] ; 0x101de23b8
0x100225756: mov qword ptr [rip + 0x1bbcc5f], 0 ; 0x101de23c0
0x100225761: mov qword ptr [rip + 0x1bbcc60], rdx ; 0x101de23c8
0x100225768: mov qword ptr [rip + 0xa4a7f1], rcx ; 0x100c6ff60
0x10022576f: mov ecx, 0x19
0x100225774: vmovq xmm0, rcx
0x100225779: vmovdqu xmmword ptr [rip + 0x1bbcc6f], xmm0 ; 0x101de23f0
0x100225781: mov rcx, qword ptr [rip + 0x9e1090] ; 0x100c06818 -> 0x100221e30 __Z12ApplyWrapperI9CloudCardMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x100225788: mov qword ptr [rip + 0x1bbcc71], rcx ; 0x101de2400
0x10022578f: mov rcx, qword ptr [rip + 0x9e4912] ; 0x100c0a0a8 -> 0x100221ec0 __Z21InitFunctionSignatureIM9CloudCardKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x100225796: mov qword ptr [rip + 0x1bbcc6b], rcx ; 0x101de2408
0x10022579d: mov qword ptr [rip + 0x1bbcc6c], rax ; 0x101de2410
0x1002257a4: lea rcx, [rip + 0x945914] ; 0x100b6b0bf transform
0x1002257ab: mov qword ptr [rip + 0xa709d6], rcx ; 0x100c96188
0x1002257b2: lea rcx, [rip + 0xa709cf] ; 0x100c96188
0x1002257b9: mov qword ptr [rip + 0xa709cc], 0 ; 0x100c96190
0x1002257c4: mov rdx, qword ptr [rip + 0xa52495] ; 0x100c77c60
0x1002257cb: mov qword ptr [rip + 0xa709c6], rdx ; 0x100c96198
0x1002257d2: mov qword ptr [rip + 0xa709cb], 0x10 ; 0x100c961a8
0x1002257dd: mov rdx, qword ptr [rip + 0x9e15e4] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x1002257e4: mov qword ptr [rip + 0xa709c5], rdx ; 0x100c961b0
0x1002257eb: mov qword ptr [rip + 0xa709c6], rax ; 0x100c961b8
0x1002257f2: mov qword ptr [rip + 0xa709c3], 0xffffffffffffffff ; 0x100c961c0
0x1002257fd: mov qword ptr [rip + 0xa709c4], rbx ; 0x100c961c8
0x100225804: mov qword ptr [rip + 0xa709c1], 0 ; 0x100c961d0
0x10022580f: lea rdx, [rip + 0x951aa4] ; 0x100b772ba bstGuid
0x100225816: mov qword ptr [rip + 0xa709bb], rdx ; 0x100c961d8
0x10022581d: lea rdx, [rip + 0xa709b4] ; 0x100c961d8
0x100225824: mov qword ptr [rip + 0xa709b1], 0 ; 0x100c961e0
0x10022582f: mov qword ptr [rip + 0xa709b2], rcx ; 0x100c961e8
0x100225836: mov qword ptr [rip + 0xa709b7], 0x50 ; 0x100c961f8
0x100225841: mov rcx, qword ptr [rip + 0x9e1d30] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x100225848: mov qword ptr [rip + 0xa709b1], rcx ; 0x100c96200
0x10022584f: mov qword ptr [rip + 0xa709b2], rax ; 0x100c96208
0x100225856: mov qword ptr [rip + 0xa709af], 0xffffffffffffffff ; 0x100c96210
0x100225861: mov qword ptr [rip + 0xa709b0], rbx ; 0x100c96218
0x100225868: mov qword ptr [rip + 0xa709ad], 0 ; 0x100c96220
0x100225873: lea rcx, [rip + 0x951a71] ; 0x100b772eb meshName
0x10022587a: mov qword ptr [rip + 0xa709a7], rcx ; 0x100c96228
0x100225881: lea rcx, [rip + 0xa709a0] ; 0x100c96228
0x100225888: mov qword ptr [rip + 0xa709a9], rdx ; 0x100c96238
0x10022588f: mov qword ptr [rip + 0xa709ae], 0x58 ; 0x100c96248
0x10022589a: mov rdx, qword ptr [rip + 0x9e1547] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x1002258a1: mov qword ptr [rip + 0xa709a8], rdx ; 0x100c96250
0x1002258a8: mov qword ptr [rip + 0xa709a9], rax ; 0x100c96258
0x1002258af: mov qword ptr [rip + 0xa709a6], 0xffffffffffffffff ; 0x100c96260
0x1002258ba: mov qword ptr [rip + 0xa709a7], rbx ; 0x100c96268
0x1002258c1: mov qword ptr [rip + 0xa709a4], 0 ; 0x100c96270
0x1002258cc: lea rdx, [rip + 0x951a21] ; 0x100b772f4 Sheep1
0x1002258d3: vmovq xmm0, rdx
0x1002258d8: lea rdx, [rip + 0x939123] ; 0x100b5ea02 Tool_DefaultValue
0x1002258df: vmovq xmm1, rdx
0x1002258e4: vpunpcklqdq xmm0, xmm1, xmm0
0x1002258e8: vmovdqa xmmword ptr [rip + 0x1bbcb30], xmm0 ; 0x101de2420
0x1002258f0: lea rdx, [rip + 0x1bbcb29] ; 0x101de2420
0x1002258f7: mov qword ptr [rip + 0x1bbcb2e], 0 ; 0x101de2430
0x100225902: mov qword ptr [rip + 0xa70927], rdx ; 0x100c96230
0x100225909: lea rdx, [rip + 0x95516e] ; 0x100b7aa7e alphaMult
0x100225910: mov qword ptr [rip + 0xa70961], rdx ; 0x100c96278
0x100225917: lea rdx, [rip + 0xa7095a] ; 0x100c96278
0x10022591e: mov qword ptr [rip + 0xa70963], rcx ; 0x100c96288
0x100225925: mov qword ptr [rip + 0xa52334], rdx ; 0x100c77c60
0x10022592c: mov qword ptr [rip + 0xa70961], 0x70 ; 0x100c96298
0x100225937: mov rcx, qword ptr [rip + 0x9e1c22] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x10022593e: mov qword ptr [rip + 0xa7095b], rcx ; 0x100c962a0
0x100225945: mov qword ptr [rip + 0xa7095c], rax ; 0x100c962a8
0x10022594c: mov qword ptr [rip + 0xa70959], 0xffffffffffffffff ; 0x100c962b0
0x100225957: mov qword ptr [rip + 0xa7095a], rbx ; 0x100c962b8
0x10022595e: mov qword ptr [rip + 0xa70957], 0 ; 0x100c962c0
0x100225969: lea rax, [rip + 0x94e7de] ; 0x100b7414e 1.0
0x100225970: vmovq xmm0, rax
0x100225975: vpunpcklqdq xmm0, xmm1, xmm0
0x100225979: vmovdqa xmmword ptr [rip + 0x1bbcabf], xmm0 ; 0x101de2440
0x100225981: lea rax, [rip + 0x1bbcab8] ; 0x101de2440
0x100225988: mov qword ptr [rip + 0x1bbcabd], 0 ; 0x101de2450
0x100225993: mov qword ptr [rip + 0xa708e6], rax ; 0x100c96280
0x10022599a: lea rax, [rip + 0x9550e7] ; 0x100b7aa88 CloudCardBarn
0x1002259a1: mov qword ptr [rip + 0x1bbcab8], rax ; 0x101de2460
0x1002259a8: lea rax, [rip + 0x1bbcaa9] ; 0x101de2458
0x1002259af: mov qword ptr [rip + 0x1bbcaae], 0 ; 0x101de2468
0x1002259ba: mov rcx, qword ptr [rip + 0xa4a597] ; 0x100c6ff58
0x1002259c1: mov qword ptr [rip + 0x1bbcaa8], rcx ; 0x101de2470
0x1002259c8: mov qword ptr [rip + 0xa4a589], rax ; 0x100c6ff58
0x1002259cf: mov qword ptr [rip + 0x1bbcaaa], rax ; 0x101de2480
0x1002259d6: mov rax, qword ptr [rip + 0x9e2cd3] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1002259dd: mov qword ptr [rip + 0x1bbcaa4], rax ; 0x101de2488
0x1002259e4: mov dword ptr [rip + 0x1bbcaa2], 0xffffffff ; 0x101de2490
0x1002259ee: mov dword ptr [rip + 0x1bbca9c], 0xffffffff ; 0x101de2494
0x1002259f8: mov qword ptr [rip + 0x1bbcaad], 0 ; 0x101de24b0
0x100225a03: mov rax, qword ptr [rip + 0x9e570e] ; 0x100c0b118
0x100225a0a: add rax, 0x10
0x100225a0e: mov qword ptr [rip + 0x1bbca43], rax ; 0x101de2458
0x100225a15: xor eax, eax
0x100225a17: call 0x100011c10 ; 0x100011c10
0x100225a1c: lea rax, [rip + 0x936ee9] ; 0x100b5c90c Initialize
0x100225a23: mov qword ptr [rip + 0x1bbca8e], rax ; 0x101de24b8
0x100225a2a: lea rcx, [rip + 0x1bbca87] ; 0x101de24b8
0x100225a31: mov qword ptr [rip + 0x1bbca84], 0 ; 0x101de24c0
0x100225a3c: mov rax, qword ptr [rip + 0xa4a51d] ; 0x100c6ff60
0x100225a43: mov qword ptr [rip + 0x1bbca7e], rax ; 0x101de24c8
0x100225a4a: lea rax, [rip - 0x61a1] ; 0x10021f8b0
0x100225a51: vmovq xmm0, rax
0x100225a56: vmovdqu xmmword ptr [rip + 0x1bbca92], xmm0 ; 0x101de24f0
0x100225a5e: mov rax, qword ptr [rip + 0x9dfe53] ; 0x100c058b8 p#"
0x100225a65: mov qword ptr [rip + 0x1bbca94], rax ; 0x101de2500
0x100225a6c: mov rax, qword ptr [rip + 0x9e36d5] ; 0x100c09148 -> 0x100222410 __Z21InitFunctionSignatureIM13CloudCardBarnFvP15ResourceManagerEEvP17FunctionSignature
0x100225a73: mov qword ptr [rip + 0x1bbca8e], rax ; 0x101de2508
0x100225a7a: mov rax, qword ptr [rip + 0x9e209f] ; 0x100c07b20 `#"
0x100225a81: mov qword ptr [rip + 0x1bbca88], rax ; 0x101de2510
0x100225a88: lea rdx, [rip + 0x936ea9] ; 0x100b5c938 Terminate
0x100225a8f: mov qword ptr [rip + 0x1bbca82], rdx ; 0x101de2518
0x100225a96: lea rdx, [rip + 0x1bbca7b] ; 0x101de2518
0x100225a9d: mov qword ptr [rip + 0x1bbca78], 0 ; 0x101de2520
0x100225aa8: mov qword ptr [rip + 0x1bbca79], rcx ; 0x101de2528
0x100225aaf: lea rcx, [rip - 0x61c6] ; 0x10021f8f0
0x100225ab6: vmovq xmm0, rcx
0x100225abb: vmovdqu xmmword ptr [rip + 0x1bbca8d], xmm0 ; 0x101de2550
0x100225ac3: mov rsi, qword ptr [rip + 0x9dfe06] ; 0x100c058d0 -> 0x100222490 __Z12ApplyWrapperI13CloudCardBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x100225aca: mov qword ptr [rip + 0x1bbca8f], rsi ; 0x101de2560
0x100225ad1: mov rdi, qword ptr [rip + 0x9e3688] ; 0x100c09160 -> 0x1002224f0 __Z21InitFunctionSignatureIM13CloudCardBarnFvvEEvP17FunctionSignature
0x100225ad8: mov qword ptr [rip + 0x1bbca89], rdi ; 0x101de2568
0x100225adf: mov qword ptr [rip + 0x1bbca8a], rax ; 0x101de2570
0x100225ae6: lea rcx, [rip + 0x93af58] ; 0x100b60a45 OnLevelLoad
0x100225aed: mov qword ptr [rip + 0x1bbca84], rcx ; 0x101de2578
0x100225af4: lea r8, [rip + 0x1bbca7d] ; 0x101de2578
0x100225afb: mov qword ptr [rip + 0x1bbca86], rdx ; 0x101de2588
0x100225b02: lea rcx, [rip - 0x6209] ; 0x10021f900
0x100225b09: vmovq xmm0, rcx
0x100225b0e: vmovdqu xmmword ptr [rip + 0x1bbca9a], xmm0 ; 0x101de25b0
0x100225b16: mov r9, qword ptr [rip + 0x9dfda3] ; 0x100c058c0 -> 0x100222510 __Z12ApplyWrapperI13CloudCardBarnMS0_FvP15ResourceManagerP5SceneP13LevelDataBarnEEvM9VoidClassFvvEPv8VariablePSD_j
0x100225b1d: mov qword ptr [rip + 0x1bbca9c], r9 ; 0x101de25c0
0x100225b24: mov rdx, qword ptr [rip + 0x9e3625] ; 0x100c09150  %"
0x100225b2b: mov qword ptr [rip + 0x1bbca96], rdx ; 0x101de25c8
0x100225b32: mov qword ptr [rip + 0x1bbca97], rax ; 0x101de25d0
0x100225b39: lea rbx, [rip + 0x93af11] ; 0x100b60a51 levelName
0x100225b40: vmovq xmm0, rbx
0x100225b45: lea rbx, [rip + 0x936dcb] ; 0x100b5c917 ArgName
0x100225b4c: vmovq xmm1, rbx
0x100225b51: vpunpcklqdq xmm0, xmm1, xmm0
0x100225b55: vmovdqa xmmword ptr [rip + 0x1bbca83], xmm0 ; 0x101de25e0
0x100225b5d: lea rbx, [rip + 0x1bbca7c] ; 0x101de25e0
0x100225b64: mov qword ptr [rip + 0x1bbca81], 0 ; 0x101de25f0
0x100225b6f: mov qword ptr [rip + 0x1bbca0a], rbx ; 0x101de2580
0x100225b76: lea rbx, [rip + 0x93aede] ; 0x100b60a5b OnLevelUnload
0x100225b7d: mov qword ptr [rip + 0x1bbca74], rbx ; 0x101de25f8
0x100225b84: lea rbx, [rip + 0x1bbca6d] ; 0x101de25f8
0x100225b8b: mov qword ptr [rip + 0x1bbca6a], 0 ; 0x101de2600
0x100225b96: mov qword ptr [rip + 0x1bbca6b], r8 ; 0x101de2608
0x100225b9d: lea rcx, [rip - 0x6284] ; 0x10021f920
0x100225ba4: vmovq xmm1, rcx
0x100225ba9: vmovdqu xmmword ptr [rip + 0x1bbca7f], xmm1 ; 0x101de2630
0x100225bb1: mov qword ptr [rip + 0x1bbca88], rsi ; 0x101de2640
0x100225bb8: mov qword ptr [rip + 0x1bbca89], rdi ; 0x101de2648
0x100225bbf: mov qword ptr [rip + 0x1bbca8a], rax ; 0x101de2650
0x100225bc6: lea rcx, [rip + 0x936d80] ; 0x100b5c94d Update
0x100225bcd: mov qword ptr [rip + 0x1bbca84], rcx ; 0x101de2658
0x100225bd4: lea rcx, [rip + 0x1bbca7d] ; 0x101de2658
0x100225bdb: mov qword ptr [rip + 0x1bbca86], rbx ; 0x101de2668
0x100225be2: lea rsi, [rip - 0x6259] ; 0x10021f990
0x100225be9: vmovq xmm1, rsi
0x100225bee: vmovdqu xmmword ptr [rip + 0x1bbca9a], xmm1 ; 0x101de2690
0x100225bf6: mov rsi, qword ptr [rip + 0x9dfccb] ; 0x100c058c8 -> 0x1002226c0 __Z12ApplyWrapperI13CloudCardBarnMS0_FvP6CameraP10VisibilityEEvM9VoidClassFvvEPv8VariablePSB_j
0x100225bfd: mov qword ptr [rip + 0x1bbca9c], rsi ; 0x101de26a0
0x100225c04: mov rsi, qword ptr [rip + 0x9e354d] ; 0x100c09158 -> 0x1002226d0 __Z21InitFunctionSignatureIM13CloudCardBarnFvP6CameraP10VisibilityEEvP17FunctionSignature
0x100225c0b: mov qword ptr [rip + 0x1bbca96], rsi ; 0x101de26a8
0x100225c12: mov qword ptr [rip + 0x1bbca97], rax ; 0x101de26b0
0x100225c19: lea rsi, [rip + 0x93c1e1] ; 0x100b61e01 RenderFlush
0x100225c20: mov qword ptr [rip + 0x1bbca91], rsi ; 0x101de26b8
0x100225c27: lea rsi, [rip + 0x1bbca8a] ; 0x101de26b8
0x100225c2e: mov qword ptr [rip + 0x1bbca87], 0 ; 0x101de26c0
0x100225c39: mov qword ptr [rip + 0x1bbca88], rcx ; 0x101de26c8
0x100225c40: mov qword ptr [rip + 0xa4a319], rsi ; 0x100c6ff60
0x100225c47: lea rcx, [rip - 0x629e] ; 0x10021f9b0
0x100225c4e: vmovq xmm1, rcx
0x100225c53: vmovdqu xmmword ptr [rip + 0x1bbca95], xmm1 ; 0x101de26f0
0x100225c5b: mov qword ptr [rip + 0x1bbca9e], r9 ; 0x101de2700
0x100225c62: mov qword ptr [rip + 0x1bbca9f], rdx ; 0x101de2708
0x100225c69: mov qword ptr [rip + 0x1bbcaa0], rax ; 0x101de2710
0x100225c70: vmovdqa xmmword ptr [rip + 0x1bbcaa8], xmm0 ; 0x101de2720
0x100225c78: lea rax, [rip + 0x1bbcaa1] ; 0x101de2720
0x100225c7f: mov qword ptr [rip + 0x1bbcaa6], 0 ; 0x101de2730
0x100225c8a: mov qword ptr [rip + 0x1bbc9cf], rax ; 0x101de2660
0x100225c91: add rsp, 8
0x100225c95: pop rbx
0x100225c96: pop rbp
0x100225c97: ret 
0x100225c98: nop 
0x100225c99: nop 
0x100225c9a: nop 
0x100225c9b: nop 
0x100225c9c: nop 
0x100225c9d: nop 
0x100225c9e: nop 
0x100225c9f: nop 
