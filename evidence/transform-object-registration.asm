0x1006dc260: push rbp
0x1006dc261: mov rbp, rsp
0x1006dc264: push r15
0x1006dc266: push r14
0x1006dc268: push r13
0x1006dc26a: push r12
0x1006dc26c: push rbx
0x1006dc26d: sub rsp, 0x98
0x1006dc274: mov dword ptr [rip + 0x655a32], 0 ; 0x100d31cb0
0x1006dc27e: lea rdi, [rip + 0x655a33] ; 0x100d31cb8
0x1006dc285: lea rsi, [rip + 0x195a9b4] ; 0x102036c40
0x1006dc28c: lea rdx, [rip + 0x4befed] ; 0x100b9b280 tag_TransformObject
0x1006dc293: call 0x1007951b0 ; 0x1007951b0
0x1006dc298: lea rax, [rip + 0x4bf084] ; 0x100b9b323 TransformObject
0x1006dc29f: mov qword ptr [rip + 0x195a9aa], rax ; 0x102036c50
0x1006dc2a6: lea rax, [rip + 0x195a99b] ; 0x102036c48
0x1006dc2ad: mov qword ptr [rip + 0x195a9a0], 0 ; 0x102036c58
0x1006dc2b8: mov rcx, qword ptr [rip + 0x593c99] ; 0x100c6ff58
0x1006dc2bf: mov qword ptr [rip + 0x195a99a], rcx ; 0x102036c60
0x1006dc2c6: mov qword ptr [rip + 0x593c8b], rax ; 0x100c6ff58
0x1006dc2cd: mov qword ptr [rip + 0x195a99c], rax ; 0x102036c70
0x1006dc2d4: mov rax, qword ptr [rip + 0x52c30d] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x1006dc2db: mov qword ptr [rip + 0x195a996], rax ; 0x102036c78
0x1006dc2e2: mov r12, rax
0x1006dc2e5: mov qword ptr [rip + 0x195a990], 0xffffffffffffffff ; 0x102036c80
0x1006dc2f0: mov qword ptr [rip + 0x195a9a5], 0 ; 0x102036ca0
0x1006dc2fb: mov rax, qword ptr [rip + 0x52f526] ; 0x100c0b828
0x1006dc302: add rax, 0x10
0x1006dc306: mov qword ptr [rip + 0x195a93b], rax ; 0x102036c48
0x1006dc30d: xor eax, eax
0x1006dc30f: call 0x100011c10 ; 0x100011c10
0x1006dc314: lea rax, [rip + 0x488253] ; 0x100b6456e GetResumeEnabled
0x1006dc31b: mov qword ptr [rip + 0x195a986], rax ; 0x102036ca8
0x1006dc322: lea rcx, [rip + 0x195a97f] ; 0x102036ca8
0x1006dc329: mov qword ptr [rip + 0x195a97c], 0 ; 0x102036cb0
0x1006dc334: mov rax, qword ptr [rip + 0x593c25] ; 0x100c6ff60
0x1006dc33b: mov qword ptr [rip + 0x195a976], rax ; 0x102036cb8
0x1006dc342: lea rax, [rip - 0x31f9] ; 0x1006d9150
0x1006dc349: vmovq xmm0, rax
0x1006dc34e: vmovdqu xmmword ptr [rip + 0x195a98a], xmm0 ; 0x102036ce0
0x1006dc356: mov rax, qword ptr [rip + 0x5299e3] ; 0x100c05d40 -> 0x1006d9600 __Z12ApplyWrapperI15TransformObjectMS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1006dc35d: mov qword ptr [rip + 0x195a98c], rax ; 0x102036cf0
0x1006dc364: mov rax, qword ptr [rip + 0x52d265] ; 0x100c095d0 -> 0x1006d9680 __Z21InitFunctionSignatureIM15TransformObjectFbvEEvP17FunctionSignature
0x1006dc36b: mov qword ptr [rip + 0x195a986], rax ; 0x102036cf8
0x1006dc372: mov rax, qword ptr [rip + 0x52bbff] ; 0x100c07f78 -> 0x1006d95f0 __Z18GetMetaClassByTypeIP15TransformObjectERK9MetaClassv
0x1006dc379: mov qword ptr [rip + 0x195a980], rax ; 0x102036d00
0x1006dc380: lea rdx, [rip + 0x483cf0] ; 0x100b60077 OnResumeEnabled
0x1006dc387: mov qword ptr [rip + 0x195a97a], rdx ; 0x102036d08
0x1006dc38e: lea rdx, [rip + 0x195a973] ; 0x102036d08
0x1006dc395: mov qword ptr [rip + 0x195a970], 0 ; 0x102036d10
0x1006dc3a0: mov qword ptr [rip + 0x195a971], rcx ; 0x102036d18
0x1006dc3a7: mov qword ptr [rip + 0x593bb2], rdx ; 0x100c6ff60
0x1006dc3ae: lea rcx, [rip - 0x3255] ; 0x1006d9160
0x1006dc3b5: vmovq xmm0, rcx
0x1006dc3ba: vmovdqu xmmword ptr [rip + 0x195a97e], xmm0 ; 0x102036d40
0x1006dc3c2: mov rcx, qword ptr [rip + 0x52997f] ; 0x100c05d48 -> 0x1006d96b0 __Z12ApplyWrapperI15TransformObjectMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x1006dc3c9: mov qword ptr [rip + 0x195a980], rcx ; 0x102036d50
0x1006dc3d0: mov rcx, qword ptr [rip + 0x52d201] ; 0x100c095d8 -> 0x1006d9750 __Z21InitFunctionSignatureIM15TransformObjectFvP4GameEEvP17FunctionSignature
0x1006dc3d7: mov qword ptr [rip + 0x195a97a], rcx ; 0x102036d58
0x1006dc3de: mov qword ptr [rip + 0x195a97b], rax ; 0x102036d60
0x1006dc3e5: lea rcx, [rip + 0x4bef47] ; 0x100b9b333 dragSound
0x1006dc3ec: mov qword ptr [rip + 0x62994d], rcx ; 0x100d05d40
0x1006dc3f3: lea rcx, [rip + 0x629946] ; 0x100d05d40
0x1006dc3fa: mov rdx, qword ptr [rip + 0x59b85f] ; 0x100c77c60
0x1006dc401: mov qword ptr [rip + 0x629948], rdx ; 0x100d05d50
0x1006dc408: mov qword ptr [rip + 0x62994d], 0x80 ; 0x100d05d60
0x1006dc413: mov rdx, qword ptr [rip + 0x52a9ce] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x1006dc41a: mov qword ptr [rip + 0x629947], rdx ; 0x100d05d68
0x1006dc421: mov qword ptr [rip + 0x629948], rax ; 0x100d05d70
0x1006dc428: mov qword ptr [rip + 0x629945], 0xffffffffffffffff ; 0x100d05d78
0x1006dc433: lea rbx, [rip - 0x6c2a1a] ; 0x100019a20
0x1006dc43a: mov qword ptr [rip + 0x62993f], rbx ; 0x100d05d80
0x1006dc441: mov qword ptr [rip + 0x62993c], 0 ; 0x100d05d88
0x1006dc44c: lea rdx, [rip + 0x49b1f6] ; 0x100b77649 Sound
0x1006dc453: vmovq xmm0, rdx
0x1006dc458: lea rdx, [rip + 0x488130] ; 0x100b6458f Tool_Category
0x1006dc45f: vmovq xmm1, rdx
0x1006dc464: vmovdqa xmmword ptr [rbp - 0xc0], xmm1
0x1006dc46c: vpunpcklqdq xmm0, xmm1, xmm0
0x1006dc470: vmovdqa xmmword ptr [rip + 0x195a8f8], xmm0 ; 0x102036d70
0x1006dc478: lea rdx, [rip + 0x195a8f1] ; 0x102036d70
0x1006dc47f: mov qword ptr [rip + 0x195a8f6], 0 ; 0x102036d80
0x1006dc48a: mov qword ptr [rip + 0x6298b7], rdx ; 0x100d05d48
0x1006dc491: lea rdx, [rip + 0x4beea5] ; 0x100b9b33d dragSoundScale
0x1006dc498: mov qword ptr [rip + 0x6298f1], rdx ; 0x100d05d90
0x1006dc49f: lea rdx, [rip + 0x6298ea] ; 0x100d05d90
0x1006dc4a6: mov qword ptr [rip + 0x6298f3], rcx ; 0x100d05da0
0x1006dc4ad: mov qword ptr [rip + 0x6298f8], 0x70 ; 0x100d05db0
0x1006dc4b8: mov rcx, qword ptr [rip + 0x52b0a1] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1006dc4bf: mov qword ptr [rip + 0x6298f2], rcx ; 0x100d05db8
0x1006dc4c6: mov r9, rcx
0x1006dc4c9: mov qword ptr [rip + 0x6298f0], rax ; 0x100d05dc0
0x1006dc4d0: mov qword ptr [rip + 0x6298ed], 0xffffffffffffffff ; 0x100d05dc8
0x1006dc4db: mov qword ptr [rip + 0x6298ee], rbx ; 0x100d05dd0
0x1006dc4e2: mov qword ptr [rip + 0x6298eb], 0 ; 0x100d05dd8
0x1006dc4ed: lea rcx, [rip + 0x497c5a] ; 0x100b7414e 1.0
0x1006dc4f4: vmovq xmm1, rcx
0x1006dc4f9: lea rcx, [rip + 0x482502] ; 0x100b5ea02 Tool_DefaultValue
0x1006dc500: vmovq xmm2, rcx
0x1006dc505: vpunpcklqdq xmm1, xmm2, xmm1
0x1006dc509: vmovdqa xmmword ptr [rbp - 0xa0], xmm1
0x1006dc511: vmovdqa xmm3, xmm2
0x1006dc515: vmovdqa xmmword ptr [rip + 0x195a873], xmm1 ; 0x102036d90
0x1006dc51d: lea rcx, [rip + 0x195a86c] ; 0x102036d90
0x1006dc524: mov qword ptr [rip + 0x195a871], 0 ; 0x102036da0
0x1006dc52f: lea rsi, [rip + 0x4bee16] ; 0x100b9b34c (1.0, 20.0)
0x1006dc536: vmovq xmm1, rsi
0x1006dc53b: lea rsi, [rip + 0x49c736] ; 0x100b78c78 Tool_MinMaxValues
0x1006dc542: vmovq xmm2, rsi
0x1006dc547: vpunpcklqdq xmm1, xmm2, xmm1
0x1006dc54b: vmovdqa xmmword ptr [rip + 0x195a85d], xmm1 ; 0x102036db0
0x1006dc553: lea rsi, [rip + 0x195a856] ; 0x102036db0
0x1006dc55a: mov qword ptr [rip + 0x195a85f], rcx ; 0x102036dc0
0x1006dc561: vmovdqa xmmword ptr [rip + 0x195a867], xmm0 ; 0x102036dd0
0x1006dc569: lea rcx, [rip + 0x195a860] ; 0x102036dd0
0x1006dc570: mov qword ptr [rip + 0x195a869], rsi ; 0x102036de0
0x1006dc577: mov qword ptr [rip + 0x62981a], rcx ; 0x100d05d98
0x1006dc57e: lea rcx, [rip + 0x4bedd3] ; 0x100b9b358 playDragSound
0x1006dc585: mov qword ptr [rip + 0x629854], rcx ; 0x100d05de0
0x1006dc58c: lea rcx, [rip + 0x62984d] ; 0x100d05de0
0x1006dc593: mov qword ptr [rip + 0x629856], rdx ; 0x100d05df0
0x1006dc59a: mov qword ptr [rip + 0x62985b], 0x98 ; 0x100d05e00
0x1006dc5a5: mov rdx, qword ptr [rip + 0x52afac] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1006dc5ac: mov qword ptr [rip + 0x629855], rdx ; 0x100d05e08
0x1006dc5b3: mov r8, rdx
0x1006dc5b6: mov qword ptr [rip + 0x629853], rax ; 0x100d05e10
0x1006dc5bd: mov qword ptr [rip + 0x629850], 0xffffffffffffffff ; 0x100d05e18
0x1006dc5c8: mov qword ptr [rip + 0x629851], rbx ; 0x100d05e20
0x1006dc5cf: mov qword ptr [rip + 0x62984e], 0 ; 0x100d05e28
0x1006dc5da: vmovdqa xmmword ptr [rip + 0x195a80e], xmm0 ; 0x102036df0
0x1006dc5e2: lea rdx, [rip + 0x195a807] ; 0x102036df0
0x1006dc5e9: mov qword ptr [rip + 0x195a80c], 0 ; 0x102036e00
0x1006dc5f4: mov qword ptr [rip + 0x6297ed], rdx ; 0x100d05de8
0x1006dc5fb: lea rdx, [rip + 0x49651a] ; 0x100b72b1c target
0x1006dc602: mov qword ptr [rip + 0x629827], rdx ; 0x100d05e30
0x1006dc609: lea rdx, [rip + 0x629820] ; 0x100d05e30
0x1006dc610: mov qword ptr [rip + 0x629829], rcx ; 0x100d05e40
0x1006dc617: mov qword ptr [rip + 0x62982e], 0x38 ; 0x100d05e50
0x1006dc622: mov rcx, qword ptr [rip + 0x52ad07] ; 0x100c07330 -> 0x100148fe0 __Z17GetMetaTypeByTypeIP6ObjectERK8MetaTypev
0x1006dc629: mov qword ptr [rip + 0x629828], rcx ; 0x100d05e58
0x1006dc630: mov qword ptr [rip + 0x629829], rax ; 0x100d05e60
0x1006dc637: mov qword ptr [rip + 0x629826], 0xffffffffffffffff ; 0x100d05e68
0x1006dc642: mov qword ptr [rip + 0x629827], rbx ; 0x100d05e70
0x1006dc649: mov qword ptr [rip + 0x629824], 0 ; 0x100d05e78
0x1006dc654: lea rcx, [rip + 0x482384] ; 0x100b5e9df true
0x1006dc65b: vmovq xmm0, rcx
0x1006dc660: lea rcx, [rip + 0x4823b2] ; 0x100b5ea19 Tool_Nullable
0x1006dc667: vmovq xmm1, rcx
0x1006dc66c: vpunpcklqdq xmm1, xmm1, xmm0
0x1006dc670: vmovdqa xmmword ptr [rip + 0x195a798], xmm1 ; 0x102036e10
0x1006dc678: vmovdqa xmm4, xmm1
0x1006dc67c: lea rcx, [rip + 0x195a78d] ; 0x102036e10
0x1006dc683: mov qword ptr [rip + 0x195a792], 0 ; 0x102036e20
0x1006dc68e: mov qword ptr [rip + 0x6297a3], rcx ; 0x100d05e38
0x1006dc695: lea rcx, [rip + 0x4964fe] ; 0x100b72b9a targets
0x1006dc69c: mov qword ptr [rip + 0x6297dd], rcx ; 0x100d05e80
0x1006dc6a3: lea rcx, [rip + 0x6297d6] ; 0x100d05e80
0x1006dc6aa: mov qword ptr [rip + 0x6297df], rdx ; 0x100d05e90
0x1006dc6b1: mov qword ptr [rip + 0x6297e4], 0x40 ; 0x100d05ea0
0x1006dc6bc: mov rdx, qword ptr [rip + 0x52ac05] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x1006dc6c3: mov qword ptr [rip + 0x6297de], rdx ; 0x100d05ea8
0x1006dc6ca: mov rdi, rdx
0x1006dc6cd: mov qword ptr [rip + 0x6297dc], rax ; 0x100d05eb0
0x1006dc6d4: mov qword ptr [rip + 0x6297d9], 0xffffffffffffffff ; 0x100d05eb8
0x1006dc6df: mov qword ptr [rip + 0x6297da], rbx ; 0x100d05ec0
0x1006dc6e6: mov qword ptr [rip + 0x6297d7], 0 ; 0x100d05ec8
0x1006dc6f1: lea rdx, [rip + 0x482303] ; 0x100b5e9fb Object
0x1006dc6f8: vmovq xmm1, rdx
0x1006dc6fd: lea rdx, [rip + 0x4822e8] ; 0x100b5e9ec Tool_ClumpType
0x1006dc704: vmovq xmm2, rdx
0x1006dc709: vpunpcklqdq xmm1, xmm2, xmm1
0x1006dc70d: vmovdqa xmmword ptr [rip + 0x195a71b], xmm1 ; 0x102036e30
0x1006dc715: vmovdqa xmm2, xmm1
0x1006dc719: lea rdx, [rip + 0x195a710] ; 0x102036e30
0x1006dc720: mov qword ptr [rip + 0x195a715], 0 ; 0x102036e40
0x1006dc72b: vmovdqa xmmword ptr [rip + 0x195a71d], xmm4 ; 0x102036e50
0x1006dc733: lea rsi, [rip + 0x195a716] ; 0x102036e50
0x1006dc73a: mov qword ptr [rip + 0x195a71f], rdx ; 0x102036e60
0x1006dc741: lea rdx, [rip + 0x48234f] ; 0x100b5ea97 null
0x1006dc748: vmovq xmm1, rdx
0x1006dc74d: vpunpcklqdq xmm1, xmm3, xmm1
0x1006dc751: vmovdqa xmmword ptr [rip + 0x195a717], xmm1 ; 0x102036e70
0x1006dc759: vmovdqa xmm5, xmm1
0x1006dc75d: lea rdx, [rip + 0x195a70c] ; 0x102036e70
0x1006dc764: mov qword ptr [rip + 0x195a715], rsi ; 0x102036e80
0x1006dc76b: mov qword ptr [rip + 0x629716], rdx ; 0x100d05e88
0x1006dc772: lea rdx, [rip + 0x4bebed] ; 0x100b9b366 staggeredDelay
0x1006dc779: mov qword ptr [rip + 0x629750], rdx ; 0x100d05ed0
0x1006dc780: lea rdx, [rip + 0x629749] ; 0x100d05ed0
0x1006dc787: mov qword ptr [rip + 0x629752], rcx ; 0x100d05ee0
0x1006dc78e: mov qword ptr [rip + 0x629757], 0x6c ; 0x100d05ef0
0x1006dc799: mov qword ptr [rip + 0x629758], r9 ; 0x100d05ef8
0x1006dc7a0: mov qword ptr [rip + 0x629759], rax ; 0x100d05f00
0x1006dc7a7: mov qword ptr [rip + 0x629756], 0xffffffffffffffff ; 0x100d05f08
0x1006dc7b2: mov qword ptr [rip + 0x629757], rbx ; 0x100d05f10
0x1006dc7b9: mov qword ptr [rip + 0x629754], 0 ; 0x100d05f18
0x1006dc7c4: lea rcx, [rip + 0x4c85f5] ; 0x100ba4dc0 0
0x1006dc7cb: vmovq xmm1, rcx
0x1006dc7d0: vpunpcklqdq xmm1, xmm3, xmm1
0x1006dc7d4: vmovdqa xmmword ptr [rip + 0x195a6b4], xmm1 ; 0x102036e90
0x1006dc7dc: lea rcx, [rip + 0x195a6ad] ; 0x102036e90
0x1006dc7e3: mov qword ptr [rip + 0x195a6b2], 0 ; 0x102036ea0
0x1006dc7ee: mov qword ptr [rip + 0x6296e3], rcx ; 0x100d05ed8
0x1006dc7f5: lea rcx, [rip + 0x49fe74] ; 0x100b7c670 objects
0x1006dc7fc: mov qword ptr [rip + 0x62971d], rcx ; 0x100d05f20
0x1006dc803: mov r14, rcx
0x1006dc806: lea rcx, [rip + 0x629713] ; 0x100d05f20
0x1006dc80d: mov qword ptr [rip + 0x62971c], rdx ; 0x100d05f30
0x1006dc814: mov qword ptr [rip + 0x629721], 0x48 ; 0x100d05f40
0x1006dc81f: mov qword ptr [rip + 0x629722], rdi ; 0x100d05f48
0x1006dc826: mov qword ptr [rip + 0x629723], rax ; 0x100d05f50
0x1006dc82d: mov qword ptr [rip + 0x629720], 0xffffffffffffffff ; 0x100d05f58
0x1006dc838: mov qword ptr [rip + 0x629721], rbx ; 0x100d05f60
0x1006dc83f: mov qword ptr [rip + 0x62971e], 0 ; 0x100d05f68
0x1006dc84a: vmovdqa xmmword ptr [rbp - 0x50], xmm2
0x1006dc84f: vmovdqa xmmword ptr [rip + 0x195a659], xmm2 ; 0x102036eb0
0x1006dc857: lea rdx, [rip + 0x195a652] ; 0x102036eb0
0x1006dc85e: mov qword ptr [rip + 0x195a657], 0 ; 0x102036ec0
0x1006dc869: mov qword ptr [rip + 0x6296b8], rdx ; 0x100d05f28
0x1006dc870: lea rdx, [rip + 0x4beafe] ; 0x100b9b375 finishEvents
0x1006dc877: mov qword ptr [rip + 0x6296f2], rdx ; 0x100d05f70
0x1006dc87e: lea rdx, [rip + 0x6296eb] ; 0x100d05f70
0x1006dc885: mov qword ptr [rip + 0x6296f4], rcx ; 0x100d05f80
0x1006dc88c: mov qword ptr [rip + 0x6296f9], 0x50 ; 0x100d05f90
0x1006dc897: mov qword ptr [rip + 0x6296fa], rdi ; 0x100d05f98
0x1006dc89e: mov r15, rdi
0x1006dc8a1: mov qword ptr [rip + 0x6296f8], rax ; 0x100d05fa0
0x1006dc8a8: mov qword ptr [rip + 0x6296f5], 0xffffffffffffffff ; 0x100d05fa8
0x1006dc8b3: mov qword ptr [rip + 0x6296f6], rbx ; 0x100d05fb0
0x1006dc8ba: mov qword ptr [rip + 0x6296f3], 0 ; 0x100d05fb8
0x1006dc8c5: vmovdqa xmmword ptr [rip + 0x195a603], xmm2 ; 0x102036ed0
0x1006dc8cd: lea rcx, [rip + 0x195a5fc] ; 0x102036ed0
0x1006dc8d4: mov qword ptr [rip + 0x195a601], 0 ; 0x102036ee0
0x1006dc8df: vmovdqa xmmword ptr [rip + 0x195a609], xmm4 ; 0x102036ef0
0x1006dc8e7: lea rsi, [rip + 0x195a602] ; 0x102036ef0
0x1006dc8ee: mov qword ptr [rip + 0x195a60b], rcx ; 0x102036f00
0x1006dc8f5: vmovdqa xmmword ptr [rip + 0x195a613], xmm5 ; 0x102036f10
0x1006dc8fd: lea rcx, [rip + 0x195a60c] ; 0x102036f10
0x1006dc904: mov qword ptr [rip + 0x195a615], rsi ; 0x102036f20
0x1006dc90b: mov qword ptr [rip + 0x629666], rcx ; 0x100d05f78
0x1006dc912: lea rcx, [rip + 0x4be671] ; 0x100b9af8a timeline
0x1006dc919: mov qword ptr [rip + 0x6296a0], rcx ; 0x100d05fc0
0x1006dc920: lea rcx, [rip + 0x629699] ; 0x100d05fc0
0x1006dc927: mov qword ptr [rip + 0x6296a2], rdx ; 0x100d05fd0
0x1006dc92e: mov qword ptr [rip + 0x6296a7], 0x58 ; 0x100d05fe0
0x1006dc939: mov rdx, qword ptr [rip + 0x52aad8] ; 0x100c07418 -> 0x100088f80 __Z17GetMetaTypeByTypeIP8TimelineERK8MetaTypev
0x1006dc940: mov qword ptr [rip + 0x6296a1], rdx ; 0x100d05fe8
0x1006dc947: mov qword ptr [rip + 0x6296a2], rax ; 0x100d05ff0
0x1006dc94e: mov qword ptr [rip + 0x62969f], 0xffffffffffffffff ; 0x100d05ff8
0x1006dc959: mov qword ptr [rip + 0x6296a0], rbx ; 0x100d06000
0x1006dc960: mov qword ptr [rip + 0x62969d], 0 ; 0x100d06008
0x1006dc96b: vmovdqa xmmword ptr [rip + 0x195a5bd], xmm4 ; 0x102036f30
0x1006dc973: vmovdqa xmmword ptr [rbp - 0x80], xmm4
0x1006dc978: lea rdx, [rip + 0x195a5b1] ; 0x102036f30
0x1006dc97f: mov qword ptr [rip + 0x195a5b6], 0 ; 0x102036f40
0x1006dc98a: vmovdqa xmmword ptr [rip + 0x195a5be], xmm5 ; 0x102036f50
0x1006dc992: vmovdqa xmmword ptr [rbp - 0x70], xmm5
0x1006dc997: lea rsi, [rip + 0x195a5b2] ; 0x102036f50
0x1006dc99e: mov qword ptr [rip + 0x195a5bb], rdx ; 0x102036f60
0x1006dc9a5: mov qword ptr [rip + 0x62961c], rsi ; 0x100d05fc8
0x1006dc9ac: lea rdx, [rip + 0x4800f2] ; 0x100b5caa5 time
0x1006dc9b3: mov qword ptr [rip + 0x629656], rdx ; 0x100d06010
0x1006dc9ba: lea rdx, [rip + 0x62964f] ; 0x100d06010
0x1006dc9c1: mov qword ptr [rip + 0x62964c], 0 ; 0x100d06018
0x1006dc9cc: mov qword ptr [rip + 0x62964d], rcx ; 0x100d06020
0x1006dc9d3: mov qword ptr [rip + 0x629652], 0x68 ; 0x100d06030
0x1006dc9de: mov qword ptr [rip + 0x629653], r9 ; 0x100d06038
0x1006dc9e5: mov r13, r9
0x1006dc9e8: mov qword ptr [rip + 0x629651], rax ; 0x100d06040
0x1006dc9ef: mov qword ptr [rip + 0x62964e], 0xffffffffffffffff ; 0x100d06048
0x1006dc9fa: mov qword ptr [rip + 0x62964f], rbx ; 0x100d06050
0x1006dca01: mov qword ptr [rip + 0x62964c], 0 ; 0x100d06058
0x1006dca0c: lea rcx, [rip + 0x4be96f] ; 0x100b9b382 reverse
0x1006dca13: mov qword ptr [rip + 0x629646], rcx ; 0x100d06060
0x1006dca1a: lea rcx, [rip + 0x62963f] ; 0x100d06060
0x1006dca21: mov qword ptr [rip + 0x62963c], 0 ; 0x100d06068
0x1006dca2c: mov qword ptr [rip + 0x62963d], rdx ; 0x100d06070
0x1006dca33: mov qword ptr [rip + 0x629642], 0x74 ; 0x100d06080
0x1006dca3e: mov rdi, r8
0x1006dca41: mov qword ptr [rip + 0x629640], rdi ; 0x100d06088
0x1006dca48: mov qword ptr [rip + 0x629641], rax ; 0x100d06090
0x1006dca4f: mov qword ptr [rip + 0x62963e], 0xffffffffffffffff ; 0x100d06098
0x1006dca5a: mov qword ptr [rip + 0x62963f], rbx ; 0x100d060a0
0x1006dca61: mov qword ptr [rip + 0x62963c], 0 ; 0x100d060a8
0x1006dca6c: lea rdx, [rip + 0x4be917] ; 0x100b9b38a transformPos
0x1006dca73: mov qword ptr [rip + 0x629636], rdx ; 0x100d060b0
0x1006dca7a: lea rdx, [rip + 0x62962f] ; 0x100d060b0
0x1006dca81: mov qword ptr [rip + 0x62962c], 0 ; 0x100d060b8
0x1006dca8c: mov qword ptr [rip + 0x62962d], rcx ; 0x100d060c0
0x1006dca93: mov qword ptr [rip + 0x629632], 0x75 ; 0x100d060d0
0x1006dca9e: mov qword ptr [rip + 0x629633], rdi ; 0x100d060d8
0x1006dcaa5: mov qword ptr [rip + 0x629634], rax ; 0x100d060e0
0x1006dcaac: mov qword ptr [rip + 0x629631], 0xffffffffffffffff ; 0x100d060e8
0x1006dcab7: mov qword ptr [rip + 0x629632], rbx ; 0x100d060f0
0x1006dcabe: mov qword ptr [rip + 0x62962f], 0 ; 0x100d060f8
0x1006dcac9: lea rcx, [rip + 0x4be8c7] ; 0x100b9b397 transformRot
0x1006dcad0: mov qword ptr [rip + 0x629629], rcx ; 0x100d06100
0x1006dcad7: lea rcx, [rip + 0x629622] ; 0x100d06100
0x1006dcade: mov qword ptr [rip + 0x62961f], 0 ; 0x100d06108
0x1006dcae9: mov qword ptr [rip + 0x629620], rdx ; 0x100d06110
0x1006dcaf0: mov qword ptr [rip + 0x629625], 0x76 ; 0x100d06120
0x1006dcafb: mov qword ptr [rip + 0x629626], rdi ; 0x100d06128
0x1006dcb02: mov qword ptr [rip + 0x629627], rax ; 0x100d06130
0x1006dcb09: mov qword ptr [rip + 0x629624], 0xffffffffffffffff ; 0x100d06138
0x1006dcb14: mov qword ptr [rip + 0x629625], rbx ; 0x100d06140
0x1006dcb1b: mov qword ptr [rip + 0x629622], 0 ; 0x100d06148
0x1006dcb26: lea rdx, [rip + 0x4be877] ; 0x100b9b3a4 transformScale
0x1006dcb2d: mov qword ptr [rip + 0x62961c], rdx ; 0x100d06150
0x1006dcb34: lea rdx, [rip + 0x629615] ; 0x100d06150
0x1006dcb3b: mov qword ptr [rip + 0x629612], 0 ; 0x100d06158
0x1006dcb46: mov qword ptr [rip + 0x629613], rcx ; 0x100d06160
0x1006dcb4d: mov qword ptr [rip + 0x629618], 0x77 ; 0x100d06170
0x1006dcb58: mov qword ptr [rip + 0x629619], rdi ; 0x100d06178
0x1006dcb5f: mov qword ptr [rip + 0x62961a], rax ; 0x100d06180
0x1006dcb66: mov qword ptr [rip + 0x629617], 0xffffffffffffffff ; 0x100d06188
0x1006dcb71: mov qword ptr [rip + 0x629618], rbx ; 0x100d06190
0x1006dcb78: mov qword ptr [rip + 0x629615], 0 ; 0x100d06198
0x1006dcb83: lea rcx, [rip + 0x4be829] ; 0x100b9b3b3 continuous
0x1006dcb8a: mov qword ptr [rip + 0x62960f], rcx ; 0x100d061a0
0x1006dcb91: lea rcx, [rip + 0x629608] ; 0x100d061a0
0x1006dcb98: mov qword ptr [rip + 0x629611], rdx ; 0x100d061b0
0x1006dcb9f: mov qword ptr [rip + 0x629616], 0x78 ; 0x100d061c0
0x1006dcbaa: mov qword ptr [rip + 0x629617], rdi ; 0x100d061c8
0x1006dcbb1: mov qword ptr [rip + 0x629618], rax ; 0x100d061d0
0x1006dcbb8: mov qword ptr [rip + 0x629615], 0xffffffffffffffff ; 0x100d061d8
0x1006dcbc3: mov qword ptr [rip + 0x629616], rbx ; 0x100d061e0
0x1006dcbca: mov qword ptr [rip + 0x629613], 0 ; 0x100d061e8
0x1006dcbd5: lea rdx, [rip + 0x4be7e2] ; 0x100b9b3be stepped
0x1006dcbdc: mov qword ptr [rip + 0x62960d], rdx ; 0x100d061f0
0x1006dcbe3: lea rdx, [rip + 0x629606] ; 0x100d061f0
0x1006dcbea: mov qword ptr [rip + 0x62960f], rcx ; 0x100d06200
0x1006dcbf1: mov qword ptr [rip + 0x629614], 0x7a ; 0x100d06210
0x1006dcbfc: mov qword ptr [rip + 0x629615], rdi ; 0x100d06218
0x1006dcc03: mov qword ptr [rip + 0x629616], rax ; 0x100d06220
0x1006dcc0a: mov qword ptr [rip + 0x629613], 0xffffffffffffffff ; 0x100d06228
0x1006dcc15: mov qword ptr [rip + 0x629614], rbx ; 0x100d06230
0x1006dcc1c: mov qword ptr [rip + 0x629611], 0 ; 0x100d06238
0x1006dcc27: lea rcx, [rip + 0x4be798] ; 0x100b9b3c6 smooth
0x1006dcc2e: mov qword ptr [rip + 0x62960b], rcx ; 0x100d06240
0x1006dcc35: lea rcx, [rip + 0x629604] ; 0x100d06240
0x1006dcc3c: mov qword ptr [rip + 0x629601], 0 ; 0x100d06248
0x1006dcc47: mov qword ptr [rip + 0x629602], rdx ; 0x100d06250
0x1006dcc4e: mov qword ptr [rip + 0x629607], 0x79 ; 0x100d06260
0x1006dcc59: mov qword ptr [rip + 0x629608], rdi ; 0x100d06268
0x1006dcc60: mov qword ptr [rip + 0x629609], rax ; 0x100d06270
0x1006dcc67: mov qword ptr [rip + 0x629606], 0xffffffffffffffff ; 0x100d06278
0x1006dcc72: mov qword ptr [rip + 0x629607], rbx ; 0x100d06280
0x1006dcc79: mov qword ptr [rip + 0x629604], 0 ; 0x100d06288
0x1006dcc84: lea rdx, [rip + 0x4c63a1] ; 0x100ba302c false
0x1006dcc8b: vmovq xmm1, rdx
0x1006dcc90: vmovdqa xmmword ptr [rbp - 0x60], xmm3
0x1006dcc95: vpunpcklqdq xmm1, xmm3, xmm1
0x1006dcc99: vmovdqa xmmword ptr [rip + 0x195a2cf], xmm1 ; 0x102036f70
0x1006dcca1: lea rdx, [rip + 0x195a2c8] ; 0x102036f70
0x1006dcca8: mov qword ptr [rip + 0x195a2cd], 0 ; 0x102036f80
0x1006dccb3: mov qword ptr [rip + 0x6294ee], rdx ; 0x100d061a8
0x1006dccba: vmovdqa xmmword ptr [rip + 0x195a2ce], xmm1 ; 0x102036f90
0x1006dccc2: lea rdx, [rip + 0x195a2c7] ; 0x102036f90
0x1006dccc9: mov qword ptr [rip + 0x195a2cc], 0 ; 0x102036fa0
0x1006dccd4: mov qword ptr [rip + 0x62951d], rdx ; 0x100d061f8
0x1006dccdb: lea rdx, [rip + 0x4a0f93] ; 0x100b7dc75 progress01
0x1006dcce2: mov qword ptr [rip + 0x6295a7], rdx ; 0x100d06290
0x1006dcce9: lea rdx, [rip + 0x6295a0] ; 0x100d06290
0x1006dccf0: mov qword ptr [rip + 0x6295a9], rcx ; 0x100d062a0
0x1006dccf7: mov qword ptr [rip + 0x6295ae], 0x60 ; 0x100d062b0
0x1006dcd02: mov rcx, qword ptr [rip + 0x52a5cf] ; 0x100c072d8 -> 0x10003bf40 __Z17GetMetaTypeByTypeIP5FloatERK8MetaTypev
0x1006dcd09: mov qword ptr [rip + 0x6295a8], rcx ; 0x100d062b8
0x1006dcd10: mov qword ptr [rip + 0x6295a9], rax ; 0x100d062c0
0x1006dcd17: mov qword ptr [rip + 0x6295a6], 0xffffffffffffffff ; 0x100d062c8
0x1006dcd22: mov qword ptr [rip + 0x6295a7], rbx ; 0x100d062d0
0x1006dcd29: mov qword ptr [rip + 0x6295a4], 0 ; 0x100d062d8
0x1006dcd34: vmovdqa xmmword ptr [rip + 0x195a274], xmm4 ; 0x102036fb0
0x1006dcd3c: lea rcx, [rip + 0x195a26d] ; 0x102036fb0
0x1006dcd43: mov qword ptr [rip + 0x195a272], 0 ; 0x102036fc0
0x1006dcd4e: vmovdqa xmmword ptr [rip + 0x195a27a], xmm5 ; 0x102036fd0
0x1006dcd56: lea rsi, [rip + 0x195a273] ; 0x102036fd0
0x1006dcd5d: mov qword ptr [rip + 0x195a27c], rcx ; 0x102036fe0
0x1006dcd64: mov qword ptr [rip + 0x62952d], rsi ; 0x100d06298
0x1006dcd6b: lea rcx, [rip + 0x4be65b] ; 0x100b9b3cd completeAtEnd
0x1006dcd72: mov qword ptr [rip + 0x629567], rcx ; 0x100d062e0
0x1006dcd79: lea rcx, [rip + 0x629560] ; 0x100d062e0
0x1006dcd80: mov qword ptr [rip + 0x629569], rdx ; 0x100d062f0
0x1006dcd87: mov qword ptr [rip + 0x62956e], 0x7b ; 0x100d06300
0x1006dcd92: mov qword ptr [rip + 0x62956f], rdi ; 0x100d06308
0x1006dcd99: mov qword ptr [rip + 0x629570], rax ; 0x100d06310
0x1006dcda0: mov qword ptr [rip + 0x62956d], 0xffffffffffffffff ; 0x100d06318
0x1006dcdab: mov qword ptr [rip + 0x62956e], rbx ; 0x100d06320
0x1006dcdb2: mov qword ptr [rip + 0x62956b], 0 ; 0x100d06328
0x1006dcdbd: vpunpcklqdq xmm0, xmm3, xmm0
0x1006dcdc1: vmovdqa xmmword ptr [rbp - 0xb0], xmm0
0x1006dcdc9: vmovdqa xmmword ptr [rip + 0x195a21f], xmm0 ; 0x102036ff0
0x1006dcdd1: lea rdx, [rip + 0x195a218] ; 0x102036ff0
0x1006dcdd8: mov qword ptr [rip + 0x195a21d], 0 ; 0x102037000
0x1006dcde3: mov qword ptr [rip + 0x6294fe], rdx ; 0x100d062e8
0x1006dcdea: lea rdx, [rip + 0x4be5ea] ; 0x100b9b3db gotoCurrentTargetTransform
0x1006dcdf1: mov qword ptr [rip + 0x629538], rdx ; 0x100d06330
0x1006dcdf8: lea rdx, [rip + 0x629531] ; 0x100d06330
0x1006dcdff: mov qword ptr [rip + 0x62953a], rcx ; 0x100d06340
0x1006dce06: mov qword ptr [rip + 0x62953f], 0x7c ; 0x100d06350
0x1006dce11: mov qword ptr [rip + 0x629540], rdi ; 0x100d06358
0x1006dce18: mov qword ptr [rip + 0x629541], rax ; 0x100d06360
0x1006dce1f: mov qword ptr [rip + 0x62953e], 0xffffffffffffffff ; 0x100d06368
0x1006dce2a: mov qword ptr [rip + 0x62953f], rbx ; 0x100d06370
0x1006dce31: mov qword ptr [rip + 0x62953c], 0 ; 0x100d06378
0x1006dce3c: vmovdqa xmmword ptr [rbp - 0x90], xmm1
0x1006dce44: vmovdqa xmmword ptr [rip + 0x195a1c4], xmm1 ; 0x102037010
0x1006dce4c: lea rcx, [rip + 0x195a1bd] ; 0x102037010
0x1006dce53: mov qword ptr [rip + 0x195a1c2], 0 ; 0x102037020
0x1006dce5e: mov qword ptr [rip + 0x6294d3], rcx ; 0x100d06338
0x1006dce65: lea rcx, [rip + 0x4be58a] ; 0x100b9b3f6 twoPhase
0x1006dce6c: mov qword ptr [rip + 0x62950d], rcx ; 0x100d06380
0x1006dce73: lea rcx, [rip + 0x629506] ; 0x100d06380
0x1006dce7a: mov qword ptr [rip + 0x62950f], rdx ; 0x100d06390
0x1006dce81: mov qword ptr [rip + 0x59add8], rcx ; 0x100c77c60
0x1006dce88: mov qword ptr [rip + 0x62950d], 0x7d ; 0x100d063a0
0x1006dce93: mov qword ptr [rip + 0x62950e], rdi ; 0x100d063a8
0x1006dce9a: mov qword ptr [rip + 0x62950f], rax ; 0x100d063b0
0x1006dcea1: mov qword ptr [rip + 0x62950c], 0xffffffffffffffff ; 0x100d063b8
0x1006dceac: mov qword ptr [rip + 0x62950d], rbx ; 0x100d063c0
0x1006dceb3: mov qword ptr [rip + 0x62950a], 0 ; 0x100d063c8
0x1006dcebe: vmovdqa xmmword ptr [rip + 0x195a16a], xmm1 ; 0x102037030
0x1006dcec6: lea rax, [rip + 0x195a163] ; 0x102037030
0x1006dcecd: mov qword ptr [rip + 0x195a168], 0 ; 0x102037040
0x1006dced8: mov qword ptr [rip + 0x6294a9], rax ; 0x100d06388
0x1006dcedf: lea rax, [rip + 0x4be519] ; 0x100b9b3ff TransformObjectToFloor
0x1006dcee6: mov qword ptr [rip + 0x195a163], rax ; 0x102037050
0x1006dceed: lea rax, [rip + 0x195a154] ; 0x102037048
0x1006dcef4: mov qword ptr [rip + 0x195a159], 0 ; 0x102037058
0x1006dceff: mov rcx, qword ptr [rip + 0x593052] ; 0x100c6ff58
0x1006dcf06: mov qword ptr [rip + 0x195a153], rcx ; 0x102037060
0x1006dcf0d: mov qword ptr [rip + 0x593044], rax ; 0x100c6ff58
0x1006dcf14: mov qword ptr [rip + 0x195a155], rax ; 0x102037070
0x1006dcf1b: mov qword ptr [rip + 0x195a156], r12 ; 0x102037078
0x1006dcf22: mov dword ptr [rip + 0x195a154], 0xffffffff ; 0x102037080
0x1006dcf2c: mov dword ptr [rip + 0x195a14e], 0xffffffff ; 0x102037084
0x1006dcf36: mov qword ptr [rip + 0x195a15f], 0 ; 0x1020370a0
0x1006dcf41: mov rax, qword ptr [rip + 0x52f1d0] ; 0x100c0c118
0x1006dcf48: add rax, 0x10
0x1006dcf4c: mov qword ptr [rip + 0x195a0f5], rax ; 0x102037048
0x1006dcf53: xor eax, eax
0x1006dcf55: call 0x100011c10 ; 0x100011c10
0x1006dcf5a: mov qword ptr [rip + 0x62946f], r14 ; 0x100d063d0
0x1006dcf61: lea rax, [rip + 0x629468] ; 0x100d063d0
0x1006dcf68: mov rcx, qword ptr [rip + 0x59acf1] ; 0x100c77c60
0x1006dcf6f: mov qword ptr [rip + 0x62946a], rcx ; 0x100d063e0
0x1006dcf76: mov qword ptr [rip + 0x62946f], 0x38 ; 0x100d063f0
0x1006dcf81: mov qword ptr [rip + 0x629470], r15 ; 0x100d063f8
0x1006dcf88: mov rcx, qword ptr [rip + 0x52b4a1] ; 0x100c08430 -> 0x1006d9cb0 __Z18GetMetaClassByTypeIP22TransformObjectToFloorERK9MetaClassv
0x1006dcf8f: mov qword ptr [rip + 0x62946a], rcx ; 0x100d06400
0x1006dcf96: mov qword ptr [rip + 0x629467], 0xffffffffffffffff ; 0x100d06408
0x1006dcfa1: mov qword ptr [rip + 0x629468], rbx ; 0x100d06410
0x1006dcfa8: mov qword ptr [rip + 0x629465], 0 ; 0x100d06418
0x1006dcfb3: lea rdx, [rip + 0x4be45c] ; 0x100b9b416 verticalOffset
0x1006dcfba: mov qword ptr [rip + 0x62945f], rdx ; 0x100d06420
0x1006dcfc1: lea rdx, [rip + 0x629458] ; 0x100d06420
0x1006dcfc8: mov qword ptr [rip + 0x629455], 0 ; 0x100d06428
0x1006dcfd3: mov qword ptr [rip + 0x629456], rax ; 0x100d06430
0x1006dcfda: mov qword ptr [rip + 0x59ac7f], rdx ; 0x100c77c60
0x1006dcfe1: mov qword ptr [rip + 0x629454], 0x40 ; 0x100d06440
0x1006dcfec: mov qword ptr [rip + 0x629455], r13 ; 0x100d06448
0x1006dcff3: mov qword ptr [rip + 0x629456], rcx ; 0x100d06450
0x1006dcffa: mov qword ptr [rip + 0x629453], 0xffffffffffffffff ; 0x100d06458
0x1006dd005: mov qword ptr [rip + 0x629454], rbx ; 0x100d06460
0x1006dd00c: mov qword ptr [rip + 0x629451], 0 ; 0x100d06468
0x1006dd017: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1006dd01c: vmovaps xmmword ptr [rip + 0x195a08c], xmm0 ; 0x1020370b0
0x1006dd024: lea rax, [rip + 0x195a085] ; 0x1020370b0
0x1006dd02b: mov qword ptr [rip + 0x195a08a], 0 ; 0x1020370c0
0x1006dd036: mov qword ptr [rip + 0x62939b], rax ; 0x100d063d8
0x1006dd03d: lea rdi, [rip + 0x654c8c] ; 0x100d31cd0
0x1006dd044: lea rsi, [rip + 0x195a07d] ; 0x1020370c8
0x1006dd04b: lea rdx, [rip + 0x4be3d3] ; 0x100b9b425 tag_RotateObject
0x1006dd052: call 0x1007951b0 ; 0x1007951b0
0x1006dd057: lea rax, [rip + 0x4be3d8] ; 0x100b9b436 Axis
0x1006dd05e: mov qword ptr [rip + 0x195a073], rax ; 0x1020370d8
0x1006dd065: lea r13, [rip + 0x195a064] ; 0x1020370d0
0x1006dd06c: mov rcx, qword ptr [rip + 0x592ee5] ; 0x100c6ff58
0x1006dd073: mov qword ptr [rip + 0x195a06e], rcx ; 0x1020370e8
0x1006dd07a: mov qword ptr [rip + 0x592ed7], r13 ; 0x100c6ff58
0x1006dd081: mov qword ptr [rip + 0x195a070], r13 ; 0x1020370f8
0x1006dd088: mov rcx, qword ptr [rip + 0x52fc81] ; 0x100c0cd10
0x1006dd08f: add rcx, 0x10
0x1006dd093: mov qword ptr [rip + 0x195a036], rcx ; 0x1020370d0
0x1006dd09a: vmovq xmm0, rax
0x1006dd09f: lea rax, [rip + 0x480598] ; 0x100b5d63e Enum_Type
0x1006dd0a6: vmovq xmm1, rax
0x1006dd0ab: vpunpcklqdq xmm0, xmm1, xmm0
0x1006dd0af: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x1006dd0b4: vmovdqa xmmword ptr [rip + 0x195a044], xmm0 ; 0x102037100
0x1006dd0bc: lea rax, [rip + 0x195a03d] ; 0x102037100
0x1006dd0c3: mov qword ptr [rip + 0x195a042], 0 ; 0x102037110
0x1006dd0ce: mov qword ptr [rip + 0x195a00b], rax ; 0x1020370e0
0x1006dd0d5: lea rax, [rip + 0x4be35f] ; 0x100b9b43b kAxis_X
0x1006dd0dc: mov qword ptr [rip + 0x195a035], rax ; 0x102037118
0x1006dd0e3: lea r14, [rip + 0x195a02e] ; 0x102037118
0x1006dd0ea: mov qword ptr [rip + 0x195a02b], 0 ; 0x102037120
0x1006dd0f5: mov rax, qword ptr [rip + 0x635fe4] ; 0x100d130e0
0x1006dd0fc: mov qword ptr [rip + 0x195a025], rax ; 0x102037128
0x1006dd103: mov qword ptr [rip + 0x635fd6], r14 ; 0x100d130e0
0x1006dd10a: mov edi, 4
0x1006dd10f: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1006dd114: mov dword ptr [rax], 0
0x1006dd11a: mov qword ptr [rip + 0x195a017], rax ; 0x102037138
0x1006dd121: mov r12, qword ptr [rip + 0x529c38] ; 0x100c06d60 -> 0x1006d9e70 __Z17GetMetaTypeByTypeI4AxisERK8MetaTypev
0x1006dd128: mov qword ptr [rip + 0x195a011], r12 ; 0x102037140
0x1006dd12f: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1006dd134: vmovaps xmmword ptr [rip + 0x195a014], xmm0 ; 0x102037150
0x1006dd13c: lea rax, [rip + 0x195a00d] ; 0x102037150
0x1006dd143: mov qword ptr [rip + 0x195a012], 0 ; 0x102037160
0x1006dd14e: mov qword ptr [rip + 0x1959fcb], rax ; 0x102037120
0x1006dd155: lea rax, [rip + 0x4be2e7] ; 0x100b9b443 kAxis_Y
0x1006dd15c: mov qword ptr [rip + 0x195a005], rax ; 0x102037168
0x1006dd163: lea r15, [rip + 0x1959ffe] ; 0x102037168
0x1006dd16a: mov qword ptr [rip + 0x1959ffb], 0 ; 0x102037170
0x1006dd175: mov qword ptr [rip + 0x1959ffc], r14 ; 0x102037178
0x1006dd17c: mov qword ptr [rip + 0x635f5d], r15 ; 0x100d130e0
0x1006dd183: mov edi, 4
0x1006dd188: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1006dd18d: mov dword ptr [rax], 1
0x1006dd193: mov qword ptr [rip + 0x1959fee], rax ; 0x102037188
0x1006dd19a: mov qword ptr [rip + 0x1959fef], r12 ; 0x102037190
0x1006dd1a1: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1006dd1a6: vmovaps xmmword ptr [rip + 0x1959ff2], xmm0 ; 0x1020371a0
0x1006dd1ae: lea rax, [rip + 0x1959feb] ; 0x1020371a0
0x1006dd1b5: mov qword ptr [rip + 0x1959ff0], 0 ; 0x1020371b0
0x1006dd1c0: mov qword ptr [rip + 0x1959fa9], rax ; 0x102037170
0x1006dd1c7: lea rax, [rip + 0x4be27d] ; 0x100b9b44b kAxis_Z
0x1006dd1ce: mov qword ptr [rip + 0x1959fe3], rax ; 0x1020371b8
0x1006dd1d5: lea rax, [rip + 0x1959fdc] ; 0x1020371b8
0x1006dd1dc: mov qword ptr [rip + 0x1959fd9], 0 ; 0x1020371c0
0x1006dd1e7: mov qword ptr [rip + 0x1959fda], r15 ; 0x1020371c8
0x1006dd1ee: mov qword ptr [rip + 0x635eeb], rax ; 0x100d130e0
0x1006dd1f5: mov edi, 4
0x1006dd1fa: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1006dd1ff: mov dword ptr [rax], 2
0x1006dd205: mov qword ptr [rip + 0x1959fcc], rax ; 0x1020371d8
0x1006dd20c: mov qword ptr [rip + 0x1959fcd], r12 ; 0x1020371e0
0x1006dd213: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1006dd218: vmovaps xmmword ptr [rip + 0x1959fd0], xmm0 ; 0x1020371f0
0x1006dd220: lea rax, [rip + 0x1959fc9] ; 0x1020371f0
0x1006dd227: mov qword ptr [rip + 0x1959fce], 0 ; 0x102037200
0x1006dd232: mov qword ptr [rip + 0x1959f87], rax ; 0x1020371c0
0x1006dd239: lea rax, [rip + 0x4be213] ; 0x100b9b453 RotateObject
0x1006dd240: mov qword ptr [rip + 0x1959fc9], rax ; 0x102037210
0x1006dd247: lea rax, [rip + 0x1959fba] ; 0x102037208
0x1006dd24e: mov qword ptr [rip + 0x1959fbf], 0 ; 0x102037218
0x1006dd259: mov qword ptr [rip + 0x1959fc0], r13 ; 0x102037220
0x1006dd260: mov qword ptr [rip + 0x592cf1], rax ; 0x100c6ff58
0x1006dd267: mov qword ptr [rip + 0x1959fc2], rax ; 0x102037230
0x1006dd26e: mov r15, qword ptr [rip + 0x52b373] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x1006dd275: mov qword ptr [rip + 0x1959fbc], r15 ; 0x102037238
0x1006dd27c: mov qword ptr [rip + 0x1959fb9], 0xffffffffffffffff ; 0x102037240
0x1006dd287: mov qword ptr [rip + 0x1959fce], 0 ; 0x102037260
0x1006dd292: mov rax, qword ptr [rip + 0x52dd5f] ; 0x100c0aff8
0x1006dd299: add rax, 0x10
0x1006dd29d: mov qword ptr [rip + 0x1959f64], rax ; 0x102037208
0x1006dd2a4: xor eax, eax
0x1006dd2a6: call 0x100011c10 ; 0x100011c10
0x1006dd2ab: lea r13, [rip + 0x49f3be] ; 0x100b7c670 objects
0x1006dd2b2: mov qword ptr [rip + 0x6291b7], r13 ; 0x100d06470
0x1006dd2b9: lea rcx, [rip + 0x6291b0] ; 0x100d06470
0x1006dd2c0: mov rax, qword ptr [rip + 0x59a999] ; 0x100c77c60
0x1006dd2c7: mov qword ptr [rip + 0x6291b2], rax ; 0x100d06480
0x1006dd2ce: mov qword ptr [rip + 0x6291b7], 0x40 ; 0x100d06490
0x1006dd2d9: mov rax, qword ptr [rip + 0x529fe8] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x1006dd2e0: mov qword ptr [rip + 0x6291b1], rax ; 0x100d06498
0x1006dd2e7: mov rax, qword ptr [rip + 0x52a782] ; 0x100c07a70 -> 0x1006db4c0 __Z18GetMetaClassByTypeIP12RotateObjectERK9MetaClassv
0x1006dd2ee: mov qword ptr [rip + 0x6291ab], rax ; 0x100d064a0
0x1006dd2f5: mov qword ptr [rip + 0x6291a8], 0xffffffffffffffff ; 0x100d064a8
0x1006dd300: mov qword ptr [rip + 0x6291a9], rbx ; 0x100d064b0
0x1006dd307: mov qword ptr [rip + 0x6291a6], 0 ; 0x100d064b8
0x1006dd312: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1006dd317: vmovaps xmmword ptr [rip + 0x1959f51], xmm0 ; 0x102037270
0x1006dd31f: lea rdx, [rip + 0x1959f4a] ; 0x102037270
0x1006dd326: mov qword ptr [rip + 0x1959f4f], 0 ; 0x102037280
0x1006dd331: mov qword ptr [rip + 0x629140], rdx ; 0x100d06478
0x1006dd338: lea rdx, [rip + 0x4a87df] ; 0x100b85b1e axis
0x1006dd33f: mov qword ptr [rip + 0x62917a], rdx ; 0x100d064c0
0x1006dd346: lea rdx, [rip + 0x629173] ; 0x100d064c0
0x1006dd34d: mov qword ptr [rip + 0x62917c], rcx ; 0x100d064d0
0x1006dd354: mov qword ptr [rip + 0x629181], 0x48 ; 0x100d064e0
0x1006dd35f: mov qword ptr [rip + 0x629182], r12 ; 0x100d064e8
0x1006dd366: mov qword ptr [rip + 0x629183], rax ; 0x100d064f0
0x1006dd36d: mov qword ptr [rip + 0x629180], 0xffffffffffffffff ; 0x100d064f8
0x1006dd378: mov qword ptr [rip + 0x629181], rbx ; 0x100d06500
0x1006dd37f: mov qword ptr [rip + 0x62917e], 0 ; 0x100d06508
0x1006dd38a: lea rcx, [rip + 0x4be0b2] ; 0x100b9b443 kAxis_Y
0x1006dd391: vmovq xmm0, rcx
0x1006dd396: vmovdqa xmm1, xmmword ptr [rbp - 0x60]
0x1006dd39b: vpunpcklqdq xmm0, xmm1, xmm0
0x1006dd39f: vmovdqa xmmword ptr [rip + 0x1959ee9], xmm0 ; 0x102037290
0x1006dd3a7: lea rcx, [rip + 0x1959ee2] ; 0x102037290
0x1006dd3ae: mov qword ptr [rip + 0x1959ee7], 0 ; 0x1020372a0
0x1006dd3b9: mov qword ptr [rip + 0x629108], rcx ; 0x100d064c8
0x1006dd3c0: lea rcx, [rip + 0x4825c9] ; 0x100b5f990 x
0x1006dd3c7: mov qword ptr [rip + 0x629142], rcx ; 0x100d06510
0x1006dd3ce: lea rcx, [rip + 0x62913b] ; 0x100d06510
0x1006dd3d5: mov qword ptr [rip + 0x629138], 0 ; 0x100d06518
0x1006dd3e0: mov qword ptr [rip + 0x629139], rdx ; 0x100d06520
0x1006dd3e7: mov qword ptr [rip + 0x62913e], 0x4c ; 0x100d06530
0x1006dd3f2: mov rsi, qword ptr [rip + 0x52a167] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1006dd3f9: mov qword ptr [rip + 0x629138], rsi ; 0x100d06538
0x1006dd400: mov qword ptr [rip + 0x629139], rax ; 0x100d06540
0x1006dd407: mov qword ptr [rip + 0x629136], 0xffffffffffffffff ; 0x100d06548
0x1006dd412: mov qword ptr [rip + 0x629137], rbx ; 0x100d06550
0x1006dd419: mov qword ptr [rip + 0x629134], 0 ; 0x100d06558
0x1006dd424: lea rdx, [rip + 0x482567] ; 0x100b5f992 y
0x1006dd42b: mov qword ptr [rip + 0x62912e], rdx ; 0x100d06560
0x1006dd432: lea rdx, [rip + 0x629127] ; 0x100d06560
0x1006dd439: mov qword ptr [rip + 0x629124], 0 ; 0x100d06568
0x1006dd444: mov qword ptr [rip + 0x629125], rcx ; 0x100d06570
0x1006dd44b: mov qword ptr [rip + 0x62912a], 0x50 ; 0x100d06580
0x1006dd456: mov qword ptr [rip + 0x62912b], rsi ; 0x100d06588
0x1006dd45d: mov r14, rsi
0x1006dd460: mov qword ptr [rip + 0x629129], rax ; 0x100d06590
0x1006dd467: mov qword ptr [rip + 0x629126], 0xffffffffffffffff ; 0x100d06598
0x1006dd472: mov qword ptr [rip + 0x629127], rbx ; 0x100d065a0
0x1006dd479: mov qword ptr [rip + 0x629124], 0 ; 0x100d065a8
0x1006dd484: lea rcx, [rip + 0x4bdfd5] ; 0x100b9b460 z
0x1006dd48b: mov qword ptr [rip + 0x62911e], rcx ; 0x100d065b0
0x1006dd492: lea rcx, [rip + 0x629117] ; 0x100d065b0
0x1006dd499: mov qword ptr [rip + 0x629114], 0 ; 0x100d065b8
0x1006dd4a4: mov qword ptr [rip + 0x629115], rdx ; 0x100d065c0
0x1006dd4ab: mov qword ptr [rip + 0x62911a], 0x54 ; 0x100d065d0
0x1006dd4b6: mov qword ptr [rip + 0x62911b], r14 ; 0x100d065d8
0x1006dd4bd: mov qword ptr [rip + 0x62911c], rax ; 0x100d065e0
0x1006dd4c4: mov qword ptr [rip + 0x629119], 0xffffffffffffffff ; 0x100d065e8
0x1006dd4cf: mov qword ptr [rip + 0x62911a], rbx ; 0x100d065f0
0x1006dd4d6: mov qword ptr [rip + 0x629117], 0 ; 0x100d065f8
0x1006dd4e1: lea rdx, [rip + 0x48dc09] ; 0x100b6b0f1 shake
0x1006dd4e8: mov qword ptr [rip + 0x629111], rdx ; 0x100d06600
0x1006dd4ef: lea rdx, [rip + 0x62910a] ; 0x100d06600
0x1006dd4f6: mov qword ptr [rip + 0x629113], rcx ; 0x100d06610
0x1006dd4fd: mov qword ptr [rip + 0x629118], 0x88 ; 0x100d06620
0x1006dd508: mov rsi, qword ptr [rip + 0x52a049] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1006dd50f: mov qword ptr [rip + 0x629112], rsi ; 0x100d06628
0x1006dd516: mov qword ptr [rip + 0x629113], rax ; 0x100d06630
0x1006dd51d: mov qword ptr [rip + 0x629110], 0xffffffffffffffff ; 0x100d06638
0x1006dd528: mov qword ptr [rip + 0x629111], rbx ; 0x100d06640
0x1006dd52f: mov qword ptr [rip + 0x62910e], 0 ; 0x100d06648
0x1006dd53a: vmovaps xmm2, xmmword ptr [rbp - 0x90]
0x1006dd542: vmovaps xmmword ptr [rip + 0x1959d66], xmm2 ; 0x1020372b0
0x1006dd54a: lea rcx, [rip + 0x1959d5f] ; 0x1020372b0
0x1006dd551: mov qword ptr [rip + 0x1959d64], 0 ; 0x1020372c0
0x1006dd55c: mov qword ptr [rip + 0x6290a5], rcx ; 0x100d06608
0x1006dd563: lea rcx, [rip + 0x4a2041] ; 0x100b7f5ab rateMult
0x1006dd56a: mov qword ptr [rip + 0x6290df], rcx ; 0x100d06650
0x1006dd571: lea rcx, [rip + 0x6290d8] ; 0x100d06650
0x1006dd578: mov qword ptr [rip + 0x6290e1], rdx ; 0x100d06660
0x1006dd57f: mov qword ptr [rip + 0x6290e6], 0x58 ; 0x100d06670
0x1006dd58a: mov qword ptr [rip + 0x6290e7], r14 ; 0x100d06678
0x1006dd591: mov qword ptr [rip + 0x6290e8], rax ; 0x100d06680
0x1006dd598: mov qword ptr [rip + 0x6290e5], 0xffffffffffffffff ; 0x100d06688
0x1006dd5a3: mov qword ptr [rip + 0x6290e6], rbx ; 0x100d06690
0x1006dd5aa: mov qword ptr [rip + 0x6290e3], 0 ; 0x100d06698
0x1006dd5b5: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x1006dd5bd: vmovaps xmmword ptr [rip + 0x1959d0b], xmm0 ; 0x1020372d0
0x1006dd5c5: lea rdx, [rip + 0x1959d04] ; 0x1020372d0
0x1006dd5cc: mov qword ptr [rip + 0x1959d09], 0 ; 0x1020372e0
0x1006dd5d7: mov qword ptr [rip + 0x62907a], rdx ; 0x100d06658
0x1006dd5de: lea rdx, [rip + 0x4aa9a0] ; 0x100b87f85 sound
0x1006dd5e5: mov qword ptr [rip + 0x6290b4], rdx ; 0x100d066a0
0x1006dd5ec: lea rdx, [rip + 0x6290ad] ; 0x100d066a0
0x1006dd5f3: mov qword ptr [rip + 0x6290aa], 0 ; 0x100d066a8
0x1006dd5fe: mov qword ptr [rip + 0x6290ab], rcx ; 0x100d066b0
0x1006dd605: mov qword ptr [rip + 0x6290b0], 0x70 ; 0x100d066c0
0x1006dd610: mov rcx, qword ptr [rip + 0x5297d1] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x1006dd617: mov qword ptr [rip + 0x6290aa], rcx ; 0x100d066c8
0x1006dd61e: mov qword ptr [rip + 0x6290ab], rax ; 0x100d066d0
0x1006dd625: mov qword ptr [rip + 0x6290a8], 0xffffffffffffffff ; 0x100d066d8
0x1006dd630: mov qword ptr [rip + 0x6290a9], rbx ; 0x100d066e0
0x1006dd637: mov qword ptr [rip + 0x6290a6], 0 ; 0x100d066e8
0x1006dd642: lea rcx, [rip + 0x4bde19] ; 0x100b9b462 soundMinDist
0x1006dd649: mov qword ptr [rip + 0x6290a0], rcx ; 0x100d066f0
0x1006dd650: lea rcx, [rip + 0x629099] ; 0x100d066f0
0x1006dd657: mov qword ptr [rip + 0x6290a2], rdx ; 0x100d06700
0x1006dd65e: mov qword ptr [rip + 0x6290a7], 0x60 ; 0x100d06710
0x1006dd669: mov qword ptr [rip + 0x6290a8], r14 ; 0x100d06718
0x1006dd670: mov qword ptr [rip + 0x6290a9], rax ; 0x100d06720
0x1006dd677: mov qword ptr [rip + 0x6290a6], 0xffffffffffffffff ; 0x100d06728
0x1006dd682: mov qword ptr [rip + 0x6290a7], rbx ; 0x100d06730
0x1006dd689: mov qword ptr [rip + 0x6290a4], 0 ; 0x100d06738
0x1006dd694: lea rdx, [rip + 0x49b5d9] ; 0x100b78c74 5.0
0x1006dd69b: vmovq xmm0, rdx
0x1006dd6a0: vpunpcklqdq xmm0, xmm1, xmm0
0x1006dd6a4: vmovdqa xmmword ptr [rip + 0x1959c44], xmm0 ; 0x1020372f0
0x1006dd6ac: lea rdx, [rip + 0x1959c3d] ; 0x1020372f0
0x1006dd6b3: mov qword ptr [rip + 0x1959c42], 0 ; 0x102037300
0x1006dd6be: mov qword ptr [rip + 0x629033], rdx ; 0x100d066f8
0x1006dd6c5: lea rdx, [rip + 0x4bdda3] ; 0x100b9b46f soundMaxDist
0x1006dd6cc: mov qword ptr [rip + 0x62906d], rdx ; 0x100d06740
0x1006dd6d3: lea rdx, [rip + 0x629066] ; 0x100d06740
0x1006dd6da: mov qword ptr [rip + 0x62906f], rcx ; 0x100d06750
0x1006dd6e1: mov qword ptr [rip + 0x629074], 0x64 ; 0x100d06760
0x1006dd6ec: mov qword ptr [rip + 0x629075], r14 ; 0x100d06768
0x1006dd6f3: mov qword ptr [rip + 0x629076], rax ; 0x100d06770
0x1006dd6fa: mov qword ptr [rip + 0x629073], 0xffffffffffffffff ; 0x100d06778
0x1006dd705: mov qword ptr [rip + 0x629074], rbx ; 0x100d06780
0x1006dd70c: mov qword ptr [rip + 0x629071], 0 ; 0x100d06788
0x1006dd717: lea rcx, [rip + 0x4ba8a3] ; 0x100b97fc1 25.0
0x1006dd71e: vmovq xmm0, rcx
0x1006dd723: vpunpcklqdq xmm0, xmm1, xmm0
0x1006dd727: vmovdqa xmmword ptr [rip + 0x1959be1], xmm0 ; 0x102037310
0x1006dd72f: lea rcx, [rip + 0x1959bda] ; 0x102037310
0x1006dd736: mov qword ptr [rip + 0x1959bdf], 0 ; 0x102037320
0x1006dd741: mov qword ptr [rip + 0x629000], rcx ; 0x100d06748
0x1006dd748: lea rcx, [rip + 0x4bdd2d] ; 0x100b9b47c windPushMult
0x1006dd74f: mov qword ptr [rip + 0x62903a], rcx ; 0x100d06790
0x1006dd756: lea rcx, [rip + 0x629033] ; 0x100d06790
0x1006dd75d: mov qword ptr [rip + 0x62903c], rdx ; 0x100d067a0
0x1006dd764: mov qword ptr [rip + 0x629041], 0x5c ; 0x100d067b0
0x1006dd76f: mov qword ptr [rip + 0x629042], r14 ; 0x100d067b8
0x1006dd776: mov qword ptr [rip + 0x629043], rax ; 0x100d067c0
0x1006dd77d: mov qword ptr [rip + 0x629040], 0xffffffffffffffff ; 0x100d067c8
0x1006dd788: mov qword ptr [rip + 0x629041], rbx ; 0x100d067d0
0x1006dd78f: mov qword ptr [rip + 0x62903e], 0 ; 0x100d067d8
0x1006dd79a: lea rdx, [rip + 0x496973] ; 0x100b74114 0.0
0x1006dd7a1: vmovq xmm0, rdx
0x1006dd7a6: vpunpcklqdq xmm0, xmm1, xmm0
0x1006dd7aa: vmovdqa xmm3, xmm1
0x1006dd7ae: vmovdqa xmmword ptr [rip + 0x1959b7a], xmm0 ; 0x102037330
0x1006dd7b6: lea rdx, [rip + 0x1959b73] ; 0x102037330
0x1006dd7bd: mov qword ptr [rip + 0x1959b78], 0 ; 0x102037340
0x1006dd7c8: mov qword ptr [rip + 0x628fc9], rdx ; 0x100d06798
0x1006dd7cf: lea rdx, [rip + 0x49bef6] ; 0x100b796cc networked
0x1006dd7d6: mov qword ptr [rip + 0x629003], rdx ; 0x100d067e0
0x1006dd7dd: lea rdx, [rip + 0x628ffc] ; 0x100d067e0
0x1006dd7e4: mov qword ptr [rip + 0x629005], rcx ; 0x100d067f0
0x1006dd7eb: mov qword ptr [rip + 0x62900a], 0x89 ; 0x100d06800
0x1006dd7f6: mov rdi, rsi
0x1006dd7f9: mov qword ptr [rip + 0x629008], rdi ; 0x100d06808
0x1006dd800: mov qword ptr [rip + 0x629009], rax ; 0x100d06810
0x1006dd807: mov qword ptr [rip + 0x629006], 0xffffffffffffffff ; 0x100d06818
0x1006dd812: mov qword ptr [rip + 0x629007], rbx ; 0x100d06820
0x1006dd819: mov qword ptr [rip + 0x629004], 0 ; 0x100d06828
0x1006dd824: vmovaps xmm1, xmm2
0x1006dd828: vmovaps xmmword ptr [rip + 0x1959b20], xmm1 ; 0x102037350
0x1006dd830: lea rcx, [rip + 0x1959b19] ; 0x102037350
0x1006dd837: mov qword ptr [rip + 0x1959b1e], 0 ; 0x102037360
0x1006dd842: mov qword ptr [rip + 0x628f9f], rcx ; 0x100d067e8
0x1006dd849: lea rcx, [rip + 0x4bdc39] ; 0x100b9b489 rateMultFloat
0x1006dd850: mov qword ptr [rip + 0x628fd9], rcx ; 0x100d06830
0x1006dd857: lea rcx, [rip + 0x628fd2] ; 0x100d06830
0x1006dd85e: mov qword ptr [rip + 0x628fdb], rdx ; 0x100d06840
0x1006dd865: mov qword ptr [rip + 0x628fe0], 0x68 ; 0x100d06850
0x1006dd870: mov rdx, qword ptr [rip + 0x529a61] ; 0x100c072d8 -> 0x10003bf40 __Z17GetMetaTypeByTypeIP5FloatERK8MetaTypev
0x1006dd877: mov qword ptr [rip + 0x628fda], rdx ; 0x100d06858
0x1006dd87e: mov qword ptr [rip + 0x628fdb], rax ; 0x100d06860
0x1006dd885: mov qword ptr [rip + 0x628fd8], 0xffffffffffffffff ; 0x100d06868
0x1006dd890: mov qword ptr [rip + 0x628fd9], rbx ; 0x100d06870
0x1006dd897: mov qword ptr [rip + 0x628fd6], 0 ; 0x100d06878
0x1006dd8a2: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1006dd8a7: vmovaps xmmword ptr [rip + 0x1959ac1], xmm0 ; 0x102037370
0x1006dd8af: lea rdx, [rip + 0x1959aba] ; 0x102037370
0x1006dd8b6: mov qword ptr [rip + 0x1959abf], 0 ; 0x102037380
0x1006dd8c1: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1006dd8c6: vmovaps xmmword ptr [rip + 0x1959ac2], xmm0 ; 0x102037390
0x1006dd8ce: lea rsi, [rip + 0x1959abb] ; 0x102037390
0x1006dd8d5: mov qword ptr [rip + 0x1959ac4], rdx ; 0x1020373a0
0x1006dd8dc: mov qword ptr [rip + 0x628f55], rsi ; 0x100d06838
0x1006dd8e3: lea rdx, [rip + 0x4bdbad] ; 0x100b9b497 useRotRange
0x1006dd8ea: mov qword ptr [rip + 0x628f8f], rdx ; 0x100d06880
0x1006dd8f1: lea rdx, [rip + 0x628f88] ; 0x100d06880
0x1006dd8f8: mov qword ptr [rip + 0x628f91], rcx ; 0x100d06890
0x1006dd8ff: mov qword ptr [rip + 0x628f96], 0x8a ; 0x100d068a0
0x1006dd90a: mov qword ptr [rip + 0x628f97], rdi ; 0x100d068a8
0x1006dd911: mov r12, rdi
0x1006dd914: mov qword ptr [rip + 0x628f95], rax ; 0x100d068b0
0x1006dd91b: mov qword ptr [rip + 0x628f92], 0xffffffffffffffff ; 0x100d068b8
0x1006dd926: mov qword ptr [rip + 0x628f93], rbx ; 0x100d068c0
0x1006dd92d: mov qword ptr [rip + 0x628f90], 0 ; 0x100d068c8
0x1006dd938: vmovaps xmmword ptr [rip + 0x1959a70], xmm1 ; 0x1020373b0
0x1006dd940: lea rcx, [rip + 0x1959a69] ; 0x1020373b0
0x1006dd947: mov qword ptr [rip + 0x1959a6e], 0 ; 0x1020373c0
0x1006dd952: lea rsi, [rip + 0x4bdb4a] ; 0x100b9b4a3 Rot_Range
0x1006dd959: vmovq xmm0, rsi
0x1006dd95e: vmovdqa xmm1, xmmword ptr [rbp - 0xc0]
0x1006dd966: vpunpcklqdq xmm0, xmm1, xmm0
0x1006dd96a: vmovdqa xmmword ptr [rip + 0x1959a5e], xmm0 ; 0x1020373d0
0x1006dd972: lea rsi, [rip + 0x1959a57] ; 0x1020373d0
0x1006dd979: mov qword ptr [rip + 0x1959a60], rcx ; 0x1020373e0
0x1006dd980: mov qword ptr [rip + 0x628f01], rsi ; 0x100d06888
0x1006dd987: lea rcx, [rip + 0x4bdb1f] ; 0x100b9b4ad rotRangeX
0x1006dd98e: mov qword ptr [rip + 0x628f3b], rcx ; 0x100d068d0
0x1006dd995: lea rcx, [rip + 0x628f34] ; 0x100d068d0
0x1006dd99c: mov qword ptr [rip + 0x628f3d], rdx ; 0x100d068e0
0x1006dd9a3: mov qword ptr [rip + 0x628f42], 0x8c ; 0x100d068f0
0x1006dd9ae: mov qword ptr [rip + 0x628f43], r14 ; 0x100d068f8
0x1006dd9b5: mov qword ptr [rip + 0x628f44], rax ; 0x100d06900
0x1006dd9bc: mov qword ptr [rip + 0x628f41], 0xffffffffffffffff ; 0x100d06908
0x1006dd9c7: mov qword ptr [rip + 0x628f42], rbx ; 0x100d06910
0x1006dd9ce: mov qword ptr [rip + 0x628f3f], 0 ; 0x100d06918
0x1006dd9d9: lea rdx, [rip + 0x481059] ; 0x100b5ea39 0.0f
0x1006dd9e0: vmovq xmm1, rdx
0x1006dd9e5: vpunpcklqdq xmm1, xmm3, xmm1
0x1006dd9e9: vmovdqa xmmword ptr [rip + 0x19599ff], xmm1 ; 0x1020373f0
0x1006dd9f1: lea rdx, [rip + 0x19599f8] ; 0x1020373f0
0x1006dd9f8: mov qword ptr [rip + 0x19599fd], 0 ; 0x102037400
0x1006dda03: vmovdqa xmmword ptr [rip + 0x1959a05], xmm0 ; 0x102037410
0x1006dda0b: lea rsi, [rip + 0x19599fe] ; 0x102037410
0x1006dda12: mov qword ptr [rip + 0x1959a07], rdx ; 0x102037420
0x1006dda19: mov qword ptr [rip + 0x628eb8], rsi ; 0x100d068d8
0x1006dda20: lea rdx, [rip + 0x4bda90] ; 0x100b9b4b7 rotRangeY
0x1006dda27: mov qword ptr [rip + 0x628ef2], rdx ; 0x100d06920
0x1006dda2e: lea rdx, [rip + 0x628eeb] ; 0x100d06920
0x1006dda35: mov qword ptr [rip + 0x628ef4], rcx ; 0x100d06930
0x1006dda3c: mov qword ptr [rip + 0x628ef9], 0x90 ; 0x100d06940
0x1006dda47: mov qword ptr [rip + 0x628efa], r14 ; 0x100d06948
0x1006dda4e: mov qword ptr [rip + 0x628efb], rax ; 0x100d06950
0x1006dda55: mov qword ptr [rip + 0x628ef8], 0xffffffffffffffff ; 0x100d06958
0x1006dda60: mov qword ptr [rip + 0x628ef9], rbx ; 0x100d06960
0x1006dda67: mov qword ptr [rip + 0x628ef6], 0 ; 0x100d06968
0x1006dda72: vmovdqa xmmword ptr [rip + 0x19599b6], xmm1 ; 0x102037430
0x1006dda7a: lea rcx, [rip + 0x19599af] ; 0x102037430
0x1006dda81: mov qword ptr [rip + 0x19599b4], 0 ; 0x102037440
0x1006dda8c: vmovdqa xmmword ptr [rip + 0x19599bc], xmm0 ; 0x102037450
0x1006dda94: lea rsi, [rip + 0x19599b5] ; 0x102037450
0x1006dda9b: mov qword ptr [rip + 0x19599be], rcx ; 0x102037460
0x1006ddaa2: mov qword ptr [rip + 0x628e7f], rsi ; 0x100d06928
0x1006ddaa9: lea rcx, [rip + 0x4bda11] ; 0x100b9b4c1 rotRangeZ
0x1006ddab0: mov qword ptr [rip + 0x628eb9], rcx ; 0x100d06970
0x1006ddab7: lea rcx, [rip + 0x628eb2] ; 0x100d06970
0x1006ddabe: mov qword ptr [rip + 0x628ebb], rdx ; 0x100d06980
0x1006ddac5: mov qword ptr [rip + 0x59a194], rcx ; 0x100c77c60
0x1006ddacc: mov qword ptr [rip + 0x628eb9], 0x94 ; 0x100d06990
0x1006ddad7: mov qword ptr [rip + 0x628eba], r14 ; 0x100d06998
0x1006ddade: mov qword ptr [rip + 0x628ebb], rax ; 0x100d069a0
0x1006ddae5: mov qword ptr [rip + 0x628eb8], 0xffffffffffffffff ; 0x100d069a8
0x1006ddaf0: mov qword ptr [rip + 0x628eb9], rbx ; 0x100d069b0
0x1006ddaf7: mov qword ptr [rip + 0x628eb6], 0 ; 0x100d069b8
0x1006ddb02: vmovdqa xmmword ptr [rip + 0x1959966], xmm1 ; 0x102037470
0x1006ddb0a: lea rax, [rip + 0x195995f] ; 0x102037470
0x1006ddb11: mov qword ptr [rip + 0x1959964], 0 ; 0x102037480
0x1006ddb1c: vmovdqa xmmword ptr [rip + 0x195996c], xmm0 ; 0x102037490
0x1006ddb24: lea rcx, [rip + 0x1959965] ; 0x102037490
0x1006ddb2b: mov qword ptr [rip + 0x195996e], rax ; 0x1020374a0
0x1006ddb32: mov qword ptr [rip + 0x628e3f], rcx ; 0x100d06978
0x1006ddb39: lea rax, [rip + 0x4bd98b] ; 0x100b9b4cb MakeFloaty
0x1006ddb40: mov qword ptr [rip + 0x1959969], rax ; 0x1020374b0
0x1006ddb47: lea rax, [rip + 0x195995a] ; 0x1020374a8
0x1006ddb4e: mov qword ptr [rip + 0x195995f], 0 ; 0x1020374b8
0x1006ddb59: mov rcx, qword ptr [rip + 0x5923f8] ; 0x100c6ff58
0x1006ddb60: mov qword ptr [rip + 0x1959959], rcx ; 0x1020374c0
0x1006ddb67: mov qword ptr [rip + 0x5923ea], rax ; 0x100c6ff58
0x1006ddb6e: mov qword ptr [rip + 0x195995b], rax ; 0x1020374d0
0x1006ddb75: mov qword ptr [rip + 0x195995c], r15 ; 0x1020374d8
0x1006ddb7c: mov dword ptr [rip + 0x195995a], 0xffffffff ; 0x1020374e0
0x1006ddb86: mov dword ptr [rip + 0x1959954], 0xffffffff ; 0x1020374e4
0x1006ddb90: mov qword ptr [rip + 0x1959965], 0 ; 0x102037500
0x1006ddb9b: mov rax, qword ptr [rip + 0x52ce7e] ; 0x100c0aa20
0x1006ddba2: add rax, 0x10
0x1006ddba6: mov qword ptr [rip + 0x19598fb], rax ; 0x1020374a8
0x1006ddbad: xor eax, eax
0x1006ddbaf: call 0x100011c10 ; 0x100011c10
0x1006ddbb4: mov qword ptr [rip + 0x628e05], r13 ; 0x100d069c0
0x1006ddbbb: lea rcx, [rip + 0x628dfe] ; 0x100d069c0
0x1006ddbc2: mov rax, qword ptr [rip + 0x59a097] ; 0x100c77c60
0x1006ddbc9: mov qword ptr [rip + 0x628e00], rax ; 0x100d069d0
0x1006ddbd0: mov qword ptr [rip + 0x628e05], 0x38 ; 0x100d069e0
0x1006ddbdb: mov rax, qword ptr [rip + 0x5296e6] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x1006ddbe2: mov qword ptr [rip + 0x628dff], rax ; 0x100d069e8
0x1006ddbe9: mov rax, qword ptr [rip + 0x529ab8] ; 0x100c076a8 -> 0x1006dc250 __Z18GetMetaClassByTypeIP10MakeFloatyERK9MetaClassv
0x1006ddbf0: mov qword ptr [rip + 0x628df9], rax ; 0x100d069f0
0x1006ddbf7: mov qword ptr [rip + 0x628df6], 0xffffffffffffffff ; 0x100d069f8
0x1006ddc02: mov qword ptr [rip + 0x628df7], rbx ; 0x100d06a00
0x1006ddc09: mov qword ptr [rip + 0x628df4], 0 ; 0x100d06a08
0x1006ddc14: lea rdx, [rip + 0x4bd8bb] ; 0x100b9b4d6 pivot
0x1006ddc1b: mov qword ptr [rip + 0x628dee], rdx ; 0x100d06a10
0x1006ddc22: lea rdx, [rip + 0x628de7] ; 0x100d06a10
0x1006ddc29: mov qword ptr [rip + 0x628df0], rcx ; 0x100d06a20
0x1006ddc30: mov qword ptr [rip + 0x628df5], 0x60 ; 0x100d06a30
0x1006ddc3b: mov rcx, qword ptr [rip + 0x5296ee] ; 0x100c07330 -> 0x100148fe0 __Z17GetMetaTypeByTypeIP6ObjectERK8MetaTypev
0x1006ddc42: mov qword ptr [rip + 0x628def], rcx ; 0x100d06a38
0x1006ddc49: mov qword ptr [rip + 0x628df0], rax ; 0x100d06a40
0x1006ddc50: mov qword ptr [rip + 0x628ded], 0xffffffffffffffff ; 0x100d06a48
0x1006ddc5b: mov qword ptr [rip + 0x628dee], rbx ; 0x100d06a50
0x1006ddc62: mov qword ptr [rip + 0x628deb], 0 ; 0x100d06a58
0x1006ddc6d: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1006ddc72: vmovaps xmmword ptr [rip + 0x1959896], xmm0 ; 0x102037510
0x1006ddc7a: lea rcx, [rip + 0x195988f] ; 0x102037510
0x1006ddc81: mov qword ptr [rip + 0x1959894], 0 ; 0x102037520
0x1006ddc8c: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1006ddc91: vmovaps xmmword ptr [rip + 0x1959897], xmm0 ; 0x102037530
0x1006ddc99: lea rsi, [rip + 0x1959890] ; 0x102037530
0x1006ddca0: mov qword ptr [rip + 0x1959899], rcx ; 0x102037540
0x1006ddca7: mov qword ptr [rip + 0x628d6a], rsi ; 0x100d06a18
0x1006ddcae: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1006ddcb3: vmovaps xmmword ptr [rip + 0x1959895], xmm0 ; 0x102037550
0x1006ddcbb: lea rcx, [rip + 0x195988e] ; 0x102037550
0x1006ddcc2: mov qword ptr [rip + 0x1959893], 0 ; 0x102037560
0x1006ddccd: mov qword ptr [rip + 0x628cf4], rcx ; 0x100d069c8
0x1006ddcd4: lea rcx, [rip + 0x4bd801] ; 0x100b9b4dc floatRange
0x1006ddcdb: mov qword ptr [rip + 0x628d7e], rcx ; 0x100d06a60
0x1006ddce2: lea rcx, [rip + 0x628d77] ; 0x100d06a60
0x1006ddce9: mov qword ptr [rip + 0x628d74], 0 ; 0x100d06a68
0x1006ddcf4: mov qword ptr [rip + 0x628d75], rdx ; 0x100d06a70
0x1006ddcfb: mov qword ptr [rip + 0x628d7a], 0x40 ; 0x100d06a80
0x1006ddd06: mov rdx, qword ptr [rip + 0x5290c3] ; 0x100c06dd0 -> 0x100066ac0 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Vector3EERK8MetaTypev
0x1006ddd0d: mov qword ptr [rip + 0x628d74], rdx ; 0x100d06a88
0x1006ddd14: mov qword ptr [rip + 0x628d75], rax ; 0x100d06a90
0x1006ddd1b: mov qword ptr [rip + 0x628d72], 0xffffffffffffffff ; 0x100d06a98
0x1006ddd26: mov qword ptr [rip + 0x628d73], rbx ; 0x100d06aa0
0x1006ddd2d: mov qword ptr [rip + 0x628d70], 0 ; 0x100d06aa8
0x1006ddd38: lea rsi, [rip + 0x4bd7a8] ; 0x100b9b4e7 floatSpeedMult
0x1006ddd3f: mov qword ptr [rip + 0x628d6a], rsi ; 0x100d06ab0
0x1006ddd46: lea rsi, [rip + 0x628d63] ; 0x100d06ab0
0x1006ddd4d: mov qword ptr [rip + 0x628d60], 0 ; 0x100d06ab8
0x1006ddd58: mov qword ptr [rip + 0x628d61], rcx ; 0x100d06ac0
0x1006ddd5f: mov qword ptr [rip + 0x628d66], 0x50 ; 0x100d06ad0
0x1006ddd6a: mov qword ptr [rip + 0x628d67], rdx ; 0x100d06ad8
0x1006ddd71: mov qword ptr [rip + 0x628d68], rax ; 0x100d06ae0
0x1006ddd78: mov qword ptr [rip + 0x628d65], 0xffffffffffffffff ; 0x100d06ae8
0x1006ddd83: mov qword ptr [rip + 0x628d66], rbx ; 0x100d06af0
0x1006ddd8a: mov qword ptr [rip + 0x628d63], 0 ; 0x100d06af8
0x1006ddd95: lea rcx, [rip + 0x494d87] ; 0x100b72b23 speed
0x1006ddd9c: mov qword ptr [rip + 0x628d5d], rcx ; 0x100d06b00
0x1006ddda3: lea rcx, [rip + 0x628d56] ; 0x100d06b00
0x1006dddaa: mov qword ptr [rip + 0x628d53], 0 ; 0x100d06b08
0x1006dddb5: mov qword ptr [rip + 0x628d54], rsi ; 0x100d06b10
0x1006dddbc: mov qword ptr [rip + 0x628d59], 0x68 ; 0x100d06b20
0x1006dddc7: mov qword ptr [rip + 0x628d5a], r14 ; 0x100d06b28
0x1006dddce: mov qword ptr [rip + 0x628d5b], rax ; 0x100d06b30
0x1006dddd5: mov qword ptr [rip + 0x628d58], 0xffffffffffffffff ; 0x100d06b38
0x1006ddde0: mov qword ptr [rip + 0x628d59], rbx ; 0x100d06b40
0x1006ddde7: mov qword ptr [rip + 0x628d56], 0 ; 0x100d06b48
0x1006dddf2: lea rsi, [rip + 0x4bd6fd] ; 0x100b9b4f6 rotateSpeed
0x1006dddf9: mov qword ptr [rip + 0x628d50], rsi ; 0x100d06b50
0x1006dde00: lea rsi, [rip + 0x628d49] ; 0x100d06b50
0x1006dde07: mov qword ptr [rip + 0x628d52], rcx ; 0x100d06b60
0x1006dde0e: mov qword ptr [rip + 0x628d57], 0x70 ; 0x100d06b70
0x1006dde19: mov qword ptr [rip + 0x628d58], rdx ; 0x100d06b78
0x1006dde20: mov qword ptr [rip + 0x628d59], rax ; 0x100d06b80
0x1006dde27: mov qword ptr [rip + 0x628d56], 0xffffffffffffffff ; 0x100d06b88
0x1006dde32: mov qword ptr [rip + 0x628d57], rbx ; 0x100d06b90
0x1006dde39: mov qword ptr [rip + 0x628d54], 0 ; 0x100d06b98
0x1006dde44: lea rcx, [rip + 0x4bd6b7] ; 0x100b9b502 ( 0.0, 0.0, 0.0 )
0x1006dde4b: vmovq xmm0, rcx
0x1006dde50: vmovdqa xmm1, xmmword ptr [rbp - 0x60]
0x1006dde55: vpunpcklqdq xmm0, xmm1, xmm0
0x1006dde59: vmovdqa xmmword ptr [rip + 0x195970f], xmm0 ; 0x102037570
0x1006dde61: lea rcx, [rip + 0x1959708] ; 0x102037570
0x1006dde68: mov qword ptr [rip + 0x195970d], 0 ; 0x102037580
0x1006dde73: mov qword ptr [rip + 0x628cde], rcx ; 0x100d06b58
0x1006dde7a: lea rcx, [rip + 0x4bd693] ; 0x100b9b514 staggerMult
0x1006dde81: mov qword ptr [rip + 0x628d18], rcx ; 0x100d06ba0
0x1006dde88: lea rcx, [rip + 0x628d11] ; 0x100d06ba0
0x1006dde8f: mov qword ptr [rip + 0x628d0e], 0 ; 0x100d06ba8
0x1006dde9a: mov qword ptr [rip + 0x628d0f], rsi ; 0x100d06bb0
0x1006ddea1: mov qword ptr [rip + 0x628d14], 0x80 ; 0x100d06bc0
0x1006ddeac: mov qword ptr [rip + 0x628d15], r14 ; 0x100d06bc8
0x1006ddeb3: mov qword ptr [rip + 0x628d16], rax ; 0x100d06bd0
0x1006ddeba: mov qword ptr [rip + 0x628d13], 0xffffffffffffffff ; 0x100d06bd8
0x1006ddec5: mov qword ptr [rip + 0x628d14], rbx ; 0x100d06be0
0x1006ddecc: mov qword ptr [rip + 0x628d11], 0 ; 0x100d06be8
0x1006dded7: lea rdx, [rip + 0x4bd642] ; 0x100b9b520 fadeIn
0x1006ddede: mov qword ptr [rip + 0x628d0b], rdx ; 0x100d06bf0
0x1006ddee5: lea rdx, [rip + 0x628d04] ; 0x100d06bf0
0x1006ddeec: mov qword ptr [rip + 0x628d0d], rcx ; 0x100d06c00
0x1006ddef3: mov qword ptr [rip + 0x599d66], rdx ; 0x100c77c60
0x1006ddefa: mov qword ptr [rip + 0x628d0b], 0x84 ; 0x100d06c10
0x1006ddf05: mov qword ptr [rip + 0x628d0c], r12 ; 0x100d06c18
0x1006ddf0c: mov qword ptr [rip + 0x628d0d], rax ; 0x100d06c20
0x1006ddf13: mov qword ptr [rip + 0x628d0a], 0xffffffffffffffff ; 0x100d06c28
0x1006ddf1e: mov qword ptr [rip + 0x628d0b], rbx ; 0x100d06c30
0x1006ddf25: mov qword ptr [rip + 0x628d08], 0 ; 0x100d06c38
0x1006ddf30: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x1006ddf38: vmovaps xmmword ptr [rip + 0x1959650], xmm0 ; 0x102037590
0x1006ddf40: lea rax, [rip + 0x1959649] ; 0x102037590
0x1006ddf47: mov qword ptr [rip + 0x195964e], 0 ; 0x1020375a0
0x1006ddf52: mov qword ptr [rip + 0x628c9f], rax ; 0x100d06bf8
0x1006ddf59: add rsp, 0x98
0x1006ddf60: pop rbx
0x1006ddf61: pop r12
0x1006ddf63: pop r13
0x1006ddf65: pop r14
0x1006ddf67: pop r15
0x1006ddf69: pop rbp
0x1006ddf6a: ret 
0x1006ddf6b: nop 
0x1006ddf6c: nop 
0x1006ddf6d: nop 
0x1006ddf6e: nop 
0x1006ddf6f: nop 
