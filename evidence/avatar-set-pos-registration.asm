0x10014f2b0: push rbp
0x10014f2b1: mov rbp, rsp
0x10014f2b4: push r15
0x10014f2b6: push r14
0x10014f2b8: push r13
0x10014f2ba: push r12
0x10014f2bc: push rbx
0x10014f2bd: sub rsp, 0x98
0x10014f2c4: mov dword ptr [rip + 0xbd4bde], 0 ; 0x100d23eac
0x10014f2ce: lea rax, [rip + 0xa25feb] ; 0x100b752c0 AvatarForceEnableFlightMode
0x10014f2d5: mov qword ptr [rip + 0x1c8715c], rax ; 0x101dd6438
0x10014f2dc: lea rax, [rip + 0x1c8714d] ; 0x101dd6430
0x10014f2e3: mov qword ptr [rip + 0x1c87152], 0 ; 0x101dd6440
0x10014f2ee: mov rcx, qword ptr [rip + 0xb20c63] ; 0x100c6ff58
0x10014f2f5: mov qword ptr [rip + 0x1c8714c], rcx ; 0x101dd6448
0x10014f2fc: mov qword ptr [rip + 0xb20c55], rax ; 0x100c6ff58
0x10014f303: mov qword ptr [rip + 0x1c8714e], rax ; 0x101dd6458
0x10014f30a: mov r13, qword ptr [rip + 0xab92d7] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x10014f311: mov qword ptr [rip + 0x1c87148], r13 ; 0x101dd6460
0x10014f318: mov qword ptr [rip + 0x1c87145], 0xffffffffffffffff ; 0x101dd6468
0x10014f323: mov qword ptr [rip + 0x1c8715a], 0 ; 0x101dd6488
0x10014f32e: mov rax, qword ptr [rip + 0xabcf83] ; 0x100c0c2b8
0x10014f335: add rax, 0x10
0x10014f339: mov qword ptr [rip + 0x1c870f0], rax ; 0x101dd6430
0x10014f340: xor eax, eax
0x10014f342: call 0x100011c10 ; 0x100011c10
0x10014f347: lea rax, [rip + 0xa25f8e] ; 0x100b752dc AvatarExitFlight
0x10014f34e: mov qword ptr [rip + 0x1c87143], rax ; 0x101dd6498
0x10014f355: lea rax, [rip + 0x1c87134] ; 0x101dd6490
0x10014f35c: mov qword ptr [rip + 0x1c87139], 0 ; 0x101dd64a0
0x10014f367: mov rcx, qword ptr [rip + 0xb20bea] ; 0x100c6ff58
0x10014f36e: mov qword ptr [rip + 0x1c87133], rcx ; 0x101dd64a8
0x10014f375: mov qword ptr [rip + 0xb20bdc], rax ; 0x100c6ff58
0x10014f37c: mov qword ptr [rip + 0x1c87135], rax ; 0x101dd64b8
0x10014f383: mov qword ptr [rip + 0x1c87136], r13 ; 0x101dd64c0
0x10014f38a: mov qword ptr [rip + 0x1c87133], 0xffffffffffffffff ; 0x101dd64c8
0x10014f395: mov qword ptr [rip + 0x1c87148], 0 ; 0x101dd64e8
0x10014f3a0: mov rax, qword ptr [rip + 0xabc4e9] ; 0x100c0b890
0x10014f3a7: add rax, 0x10
0x10014f3ab: mov qword ptr [rip + 0x1c870de], rax ; 0x101dd6490
0x10014f3b2: xor eax, eax
0x10014f3b4: call 0x100011c10 ; 0x100011c10
0x10014f3b9: lea rax, [rip + 0xa25f2d] ; 0x100b752ed fireOnce
0x10014f3c0: mov qword ptr [rip + 0xb34659], rax ; 0x100c83a20
0x10014f3c7: lea rax, [rip + 0xb34652] ; 0x100c83a20
0x10014f3ce: mov rcx, qword ptr [rip + 0xb2888b] ; 0x100c77c60
0x10014f3d5: mov qword ptr [rip + 0xb34654], rcx ; 0x100c83a30
0x10014f3dc: mov qword ptr [rip + 0xb2887d], rax ; 0x100c77c60
0x10014f3e3: mov qword ptr [rip + 0xb34652], 0x38 ; 0x100c83a40
0x10014f3ee: mov r15, qword ptr [rip + 0xab8163] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10014f3f5: mov qword ptr [rip + 0xb3464c], r15 ; 0x100c83a48
0x10014f3fc: mov rax, qword ptr [rip + 0xab8bad] ; 0x100c07fb0 -> 0x1001495b0 __Z18GetMetaClassByTypeIP16AvatarExitFlightERK9MetaClassv
0x10014f403: mov qword ptr [rip + 0xb34646], rax ; 0x100c83a50
0x10014f40a: mov qword ptr [rip + 0xb34643], 0xffffffffffffffff ; 0x100c83a58
0x10014f415: lea rbx, [rip - 0x1359fc] ; 0x100019a20
0x10014f41c: mov qword ptr [rip + 0xb3463d], rbx ; 0x100c83a60
0x10014f423: mov qword ptr [rip + 0xb3463a], 0 ; 0x100c83a68
0x10014f42e: lea rax, [rip + 0xa53bf7] ; 0x100ba302c false
0x10014f435: vmovq xmm0, rax
0x10014f43a: lea rax, [rip + 0xa0f5c1] ; 0x100b5ea02 Tool_DefaultValue
0x10014f441: vmovq xmm1, rax
0x10014f446: vmovdqa xmmword ptr [rbp - 0x40], xmm1
0x10014f44b: vpunpcklqdq xmm0, xmm1, xmm0
0x10014f44f: vmovdqa xmmword ptr [rbp - 0x60], xmm0
0x10014f454: vmovdqa xmmword ptr [rip + 0x1c87094], xmm0 ; 0x101dd64f0
0x10014f45c: lea rax, [rip + 0x1c8708d] ; 0x101dd64f0
0x10014f463: mov qword ptr [rip + 0x1c87092], 0 ; 0x101dd6500
0x10014f46e: mov qword ptr [rip + 0xb345b3], rax ; 0x100c83a28
0x10014f475: lea rax, [rip + 0xa25e7a] ; 0x100b752f6 AvatarSetStance
0x10014f47c: mov qword ptr [rip + 0x1c8708d], rax ; 0x101dd6510
0x10014f483: lea rax, [rip + 0x1c8707e] ; 0x101dd6508
0x10014f48a: mov qword ptr [rip + 0x1c87083], 0 ; 0x101dd6518
0x10014f495: mov rcx, qword ptr [rip + 0xb20abc] ; 0x100c6ff58
0x10014f49c: mov qword ptr [rip + 0x1c8707d], rcx ; 0x101dd6520
0x10014f4a3: mov qword ptr [rip + 0xb20aae], rax ; 0x100c6ff58
0x10014f4aa: mov qword ptr [rip + 0x1c8707f], rax ; 0x101dd6530
0x10014f4b1: mov qword ptr [rip + 0x1c87080], r13 ; 0x101dd6538
0x10014f4b8: mov dword ptr [rip + 0x1c8707e], 0xffffffff ; 0x101dd6540
0x10014f4c2: mov dword ptr [rip + 0x1c87078], 0xffffffff ; 0x101dd6544
0x10014f4cc: mov qword ptr [rip + 0x1c87089], 0 ; 0x101dd6560
0x10014f4d7: mov rax, qword ptr [rip + 0xabc12a] ; 0x100c0b608
0x10014f4de: add rax, 0x10
0x10014f4e2: mov qword ptr [rip + 0x1c8701f], rax ; 0x101dd6508
0x10014f4e9: xor eax, eax
0x10014f4eb: call 0x100011c10 ; 0x100011c10
0x10014f4f0: lea rax, [rip + 0xa179c0] ; 0x100b66eb7 sit
0x10014f4f7: mov qword ptr [rip + 0xb34572], rax ; 0x100c83a70
0x10014f4fe: lea rcx, [rip + 0xb3456b] ; 0x100c83a70
0x10014f505: mov rax, qword ptr [rip + 0xb28754] ; 0x100c77c60
0x10014f50c: mov qword ptr [rip + 0xb3456d], rax ; 0x100c83a80
0x10014f513: mov qword ptr [rip + 0xb34572], 0x38 ; 0x100c83a90
0x10014f51e: mov qword ptr [rip + 0xb34573], r15 ; 0x100c83a98
0x10014f525: mov rax, qword ptr [rip + 0xab88fc] ; 0x100c07e28 -> 0x100149970 __Z18GetMetaClassByTypeIP15AvatarSetStanceERK9MetaClassv
0x10014f52c: mov qword ptr [rip + 0xb3456d], rax ; 0x100c83aa0
0x10014f533: mov qword ptr [rip + 0xb3456a], 0xffffffffffffffff ; 0x100c83aa8
0x10014f53e: mov qword ptr [rip + 0xb3456b], rbx ; 0x100c83ab0
0x10014f545: mov qword ptr [rip + 0xb34568], 0 ; 0x100c83ab8
0x10014f550: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10014f555: vmovaps xmmword ptr [rip + 0x1c87013], xmm0 ; 0x101dd6570
0x10014f55d: lea rdx, [rip + 0x1c8700c] ; 0x101dd6570
0x10014f564: mov qword ptr [rip + 0x1c87011], 0 ; 0x101dd6580
0x10014f56f: mov qword ptr [rip + 0xb34502], rdx ; 0x100c83a78
0x10014f576: lea rdx, [rip + 0xa25d89] ; 0x100b75306 stand
0x10014f57d: mov qword ptr [rip + 0xb3453c], rdx ; 0x100c83ac0
0x10014f584: lea rdx, [rip + 0xb34535] ; 0x100c83ac0
0x10014f58b: mov qword ptr [rip + 0xb3453e], rcx ; 0x100c83ad0
0x10014f592: mov qword ptr [rip + 0xb34543], 0x39 ; 0x100c83ae0
0x10014f59d: mov qword ptr [rip + 0xb34544], r15 ; 0x100c83ae8
0x10014f5a4: mov qword ptr [rip + 0xb34545], rax ; 0x100c83af0
0x10014f5ab: mov qword ptr [rip + 0xb34542], 0xffffffffffffffff ; 0x100c83af8
0x10014f5b6: mov qword ptr [rip + 0xb34543], rbx ; 0x100c83b00
0x10014f5bd: mov qword ptr [rip + 0xb34540], 0 ; 0x100c83b08
0x10014f5c8: vmovaps xmmword ptr [rip + 0x1c86fc0], xmm0 ; 0x101dd6590
0x10014f5d0: lea rcx, [rip + 0x1c86fb9] ; 0x101dd6590
0x10014f5d7: mov qword ptr [rip + 0x1c86fbe], 0 ; 0x101dd65a0
0x10014f5e2: mov qword ptr [rip + 0xb344df], rcx ; 0x100c83ac8
0x10014f5e9: lea rcx, [rip + 0xa1b775] ; 0x100b6ad65 sleep
0x10014f5f0: mov qword ptr [rip + 0xb34519], rcx ; 0x100c83b10
0x10014f5f7: lea rcx, [rip + 0xb34512] ; 0x100c83b10
0x10014f5fe: mov qword ptr [rip + 0xb3451b], rdx ; 0x100c83b20
0x10014f605: mov qword ptr [rip + 0xb34520], 0x3a ; 0x100c83b30
0x10014f610: mov qword ptr [rip + 0xb34521], r15 ; 0x100c83b38
0x10014f617: mov qword ptr [rip + 0xb34522], rax ; 0x100c83b40
0x10014f61e: mov qword ptr [rip + 0xb3451f], 0xffffffffffffffff ; 0x100c83b48
0x10014f629: mov qword ptr [rip + 0xb34520], rbx ; 0x100c83b50
0x10014f630: mov qword ptr [rip + 0xb3451d], 0 ; 0x100c83b58
0x10014f63b: vmovaps xmmword ptr [rip + 0x1c86f6d], xmm0 ; 0x101dd65b0
0x10014f643: lea rdx, [rip + 0x1c86f66] ; 0x101dd65b0
0x10014f64a: mov qword ptr [rip + 0x1c86f6b], 0 ; 0x101dd65c0
0x10014f655: mov qword ptr [rip + 0xb344bc], rdx ; 0x100c83b18
0x10014f65c: lea rdx, [rip + 0xa25ca9] ; 0x100b7530c instant
0x10014f663: mov qword ptr [rip + 0xb344f6], rdx ; 0x100c83b60
0x10014f66a: lea rdx, [rip + 0xb344ef] ; 0x100c83b60
0x10014f671: mov qword ptr [rip + 0xb344f8], rcx ; 0x100c83b70
0x10014f678: mov qword ptr [rip + 0xb344fd], 0x3b ; 0x100c83b80
0x10014f683: mov qword ptr [rip + 0xb344fe], r15 ; 0x100c83b88
0x10014f68a: mov qword ptr [rip + 0xb344ff], rax ; 0x100c83b90
0x10014f691: mov qword ptr [rip + 0xb344fc], 0xffffffffffffffff ; 0x100c83b98
0x10014f69c: mov qword ptr [rip + 0xb344fd], rbx ; 0x100c83ba0
0x10014f6a3: mov qword ptr [rip + 0xb344fa], 0 ; 0x100c83ba8
0x10014f6ae: lea rcx, [rip + 0xa0f32a] ; 0x100b5e9df true
0x10014f6b5: vmovq xmm0, rcx
0x10014f6ba: vmovdqa xmm2, xmmword ptr [rbp - 0x40]
0x10014f6bf: vpunpcklqdq xmm1, xmm2, xmm0
0x10014f6c3: vmovdqa xmmword ptr [rbp - 0x50], xmm1
0x10014f6c8: vmovdqa xmmword ptr [rip + 0x1c86f00], xmm1 ; 0x101dd65d0
0x10014f6d0: lea rcx, [rip + 0x1c86ef9] ; 0x101dd65d0
0x10014f6d7: mov qword ptr [rip + 0x1c86efe], 0 ; 0x101dd65e0
0x10014f6e2: mov qword ptr [rip + 0xb3447f], rcx ; 0x100c83b68
0x10014f6e9: lea rcx, [rip + 0xa25c24] ; 0x100b75314 objectToPointAt
0x10014f6f0: mov qword ptr [rip + 0xb344b9], rcx ; 0x100c83bb0
0x10014f6f7: lea rcx, [rip + 0xb344b2] ; 0x100c83bb0
0x10014f6fe: mov qword ptr [rip + 0xb344bb], rdx ; 0x100c83bc0
0x10014f705: mov qword ptr [rip + 0xb28554], rcx ; 0x100c77c60
0x10014f70c: mov qword ptr [rip + 0xb344b9], 0x40 ; 0x100c83bd0
0x10014f717: mov rcx, qword ptr [rip + 0xab7c12] ; 0x100c07330 -> 0x100148fe0 __Z17GetMetaTypeByTypeIP6ObjectERK8MetaTypev
0x10014f71e: mov qword ptr [rip + 0xb344b3], rcx ; 0x100c83bd8
0x10014f725: mov qword ptr [rip + 0xb344b4], rax ; 0x100c83be0
0x10014f72c: mov qword ptr [rip + 0xb344b1], 0xffffffffffffffff ; 0x100c83be8
0x10014f737: mov qword ptr [rip + 0xb344b2], rbx ; 0x100c83bf0
0x10014f73e: mov qword ptr [rip + 0xb344af], 0 ; 0x100c83bf8
0x10014f749: lea rax, [rip + 0xa0f2c9] ; 0x100b5ea19 Tool_Nullable
0x10014f750: vmovq xmm1, rax
0x10014f755: vpunpcklqdq xmm0, xmm1, xmm0
0x10014f759: vmovdqa xmmword ptr [rbp - 0x70], xmm0
0x10014f75e: vmovdqa xmmword ptr [rip + 0x1c86e8a], xmm0 ; 0x101dd65f0
0x10014f766: lea rax, [rip + 0x1c86e83] ; 0x101dd65f0
0x10014f76d: mov qword ptr [rip + 0x1c86e88], 0 ; 0x101dd6600
0x10014f778: lea rcx, [rip + 0xa0f318] ; 0x100b5ea97 null
0x10014f77f: vmovq xmm0, rcx
0x10014f784: vpunpcklqdq xmm0, xmm2, xmm0
0x10014f788: vmovdqa xmmword ptr [rbp - 0x80], xmm0
0x10014f78d: vmovdqa xmmword ptr [rip + 0x1c86e7b], xmm0 ; 0x101dd6610
0x10014f795: lea rcx, [rip + 0x1c86e74] ; 0x101dd6610
0x10014f79c: mov qword ptr [rip + 0x1c86e7d], rax ; 0x101dd6620
0x10014f7a3: mov qword ptr [rip + 0xb3440e], rcx ; 0x100c83bb8
0x10014f7aa: lea rax, [rip + 0xa25b73] ; 0x100b75324 AvatarSetPos
0x10014f7b1: mov qword ptr [rip + 0x1c86e78], rax ; 0x101dd6630
0x10014f7b8: lea rax, [rip + 0x1c86e69] ; 0x101dd6628
0x10014f7bf: mov qword ptr [rip + 0x1c86e6e], 0 ; 0x101dd6638
0x10014f7ca: mov rcx, qword ptr [rip + 0xb20787] ; 0x100c6ff58
0x10014f7d1: mov qword ptr [rip + 0x1c86e68], rcx ; 0x101dd6640
0x10014f7d8: mov qword ptr [rip + 0xb20779], rax ; 0x100c6ff58
0x10014f7df: mov qword ptr [rip + 0x1c86e6a], rax ; 0x101dd6650
0x10014f7e6: mov qword ptr [rip + 0x1c86e6b], r13 ; 0x101dd6658
0x10014f7ed: mov dword ptr [rip + 0x1c86e69], 0xffffffff ; 0x101dd6660
0x10014f7f7: mov dword ptr [rip + 0x1c86e63], 0xffffffff ; 0x101dd6664
0x10014f801: mov qword ptr [rip + 0x1c86e74], 0 ; 0x101dd6680
0x10014f80c: mov rax, qword ptr [rip + 0xabb66d] ; 0x100c0ae80
0x10014f813: add rax, 0x10
0x10014f817: mov qword ptr [rip + 0x1c86e0a], rax ; 0x101dd6628
0x10014f81e: xor eax, eax
0x10014f820: call 0x100011c10 ; 0x100011c10
0x10014f825: lea rax, [rip + 0xa25b05] ; 0x100b75331 marker
0x10014f82c: mov qword ptr [rip + 0xb343cd], rax ; 0x100c83c00
0x10014f833: lea rcx, [rip + 0xb343c6] ; 0x100c83c00
0x10014f83a: mov qword ptr [rip + 0xb343c3], 0 ; 0x100c83c08
0x10014f845: mov rax, qword ptr [rip + 0xb28414] ; 0x100c77c60
0x10014f84c: mov qword ptr [rip + 0xb343bd], rax ; 0x100c83c10
0x10014f853: mov qword ptr [rip + 0xb343c2], 0x38 ; 0x100c83c20
0x10014f85e: mov rax, qword ptr [rip + 0xab7ac3] ; 0x100c07328 -> 0x10003a510 __Z17GetMetaTypeByTypeIP6MarkerERK8MetaTypev
0x10014f865: mov qword ptr [rip + 0xb343bc], rax ; 0x100c83c28
0x10014f86c: mov rsi, rax
0x10014f86f: mov rax, qword ptr [rip + 0xab80e2] ; 0x100c07958 -> 0x10014a4e0 __Z18GetMetaClassByTypeIP12AvatarSetPosERK9MetaClassv
0x10014f876: mov qword ptr [rip + 0xb343b3], rax ; 0x100c83c30
0x10014f87d: mov qword ptr [rip + 0xb343b0], 0xffffffffffffffff ; 0x100c83c38
0x10014f888: mov qword ptr [rip + 0xb343b1], rbx ; 0x100c83c40
0x10014f88f: mov qword ptr [rip + 0xb343ae], 0 ; 0x100c83c48
0x10014f89a: lea rdx, [rip + 0xa25a97] ; 0x100b75338 setLevelStartPosition
0x10014f8a1: mov qword ptr [rip + 0xb343a8], rdx ; 0x100c83c50
0x10014f8a8: lea rdx, [rip + 0xb343a1] ; 0x100c83c50
0x10014f8af: mov qword ptr [rip + 0xb343aa], rcx ; 0x100c83c60
0x10014f8b6: mov qword ptr [rip + 0xb343af], 0x48 ; 0x100c83c70
0x10014f8c1: mov qword ptr [rip + 0xb343b0], r15 ; 0x100c83c78
0x10014f8c8: mov qword ptr [rip + 0xb343b1], rax ; 0x100c83c80
0x10014f8cf: mov qword ptr [rip + 0xb343ae], 0xffffffffffffffff ; 0x100c83c88
0x10014f8da: mov qword ptr [rip + 0xb343af], rbx ; 0x100c83c90
0x10014f8e1: mov qword ptr [rip + 0xb343ac], 0 ; 0x100c83c98
0x10014f8ec: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x10014f8f1: vmovaps xmmword ptr [rip + 0x1c86d97], xmm1 ; 0x101dd6690
0x10014f8f9: lea rcx, [rip + 0x1c86d90] ; 0x101dd6690
0x10014f900: mov qword ptr [rip + 0x1c86d95], 0 ; 0x101dd66a0
0x10014f90b: mov qword ptr [rip + 0xb34346], rcx ; 0x100c83c58
0x10014f912: lea rcx, [rip + 0xa25a35] ; 0x100b7534e relMarker
0x10014f919: mov qword ptr [rip + 0xb34380], rcx ; 0x100c83ca0
0x10014f920: lea rcx, [rip + 0xb34379] ; 0x100c83ca0
0x10014f927: mov qword ptr [rip + 0xb34382], rdx ; 0x100c83cb0
0x10014f92e: mov qword ptr [rip + 0xb34387], 0x40 ; 0x100c83cc0
0x10014f939: mov qword ptr [rip + 0xb34388], rsi ; 0x100c83cc8
0x10014f940: mov qword ptr [rip + 0xb34389], rax ; 0x100c83cd0
0x10014f947: mov qword ptr [rip + 0xb34386], 0xffffffffffffffff ; 0x100c83cd8
0x10014f952: mov qword ptr [rip + 0xb34387], rbx ; 0x100c83ce0
0x10014f959: mov qword ptr [rip + 0xb34384], 0 ; 0x100c83ce8
0x10014f964: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10014f969: vmovaps xmmword ptr [rip + 0x1c86d3f], xmm0 ; 0x101dd66b0
0x10014f971: lea rdx, [rip + 0x1c86d38] ; 0x101dd66b0
0x10014f978: mov qword ptr [rip + 0x1c86d3d], 0 ; 0x101dd66c0
0x10014f983: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10014f988: vmovaps xmmword ptr [rip + 0x1c86d40], xmm0 ; 0x101dd66d0
0x10014f990: lea rsi, [rip + 0x1c86d39] ; 0x101dd66d0
0x10014f997: mov qword ptr [rip + 0x1c86d42], rdx ; 0x101dd66e0
0x10014f99e: mov qword ptr [rip + 0xb34303], rsi ; 0x100c83ca8
0x10014f9a5: lea rdx, [rip + 0xa259ac] ; 0x100b75358 randomGroundInMarker
0x10014f9ac: mov qword ptr [rip + 0xb3433d], rdx ; 0x100c83cf0
0x10014f9b3: lea rdx, [rip + 0xb34336] ; 0x100c83cf0
0x10014f9ba: mov qword ptr [rip + 0xb3433f], rcx ; 0x100c83d00
0x10014f9c1: mov qword ptr [rip + 0xb34344], 0x49 ; 0x100c83d10
0x10014f9cc: mov qword ptr [rip + 0xb34345], r15 ; 0x100c83d18
0x10014f9d3: mov qword ptr [rip + 0xb34346], rax ; 0x100c83d20
0x10014f9da: mov qword ptr [rip + 0xb34343], 0xffffffffffffffff ; 0x100c83d28
0x10014f9e5: mov qword ptr [rip + 0xb34344], rbx ; 0x100c83d30
0x10014f9ec: mov qword ptr [rip + 0xb34341], 0 ; 0x100c83d38
0x10014f9f7: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10014f9fc: vmovaps xmmword ptr [rip + 0x1c86cec], xmm0 ; 0x101dd66f0
0x10014fa04: lea rcx, [rip + 0x1c86ce5] ; 0x101dd66f0
0x10014fa0b: mov qword ptr [rip + 0x1c86cea], 0 ; 0x101dd6700
0x10014fa16: mov qword ptr [rip + 0xb342db], rcx ; 0x100c83cf8
0x10014fa1d: lea r12, [rip + 0xa25949] ; 0x100b7536d breakHandHold
0x10014fa24: mov qword ptr [rip + 0xb34315], r12 ; 0x100c83d40
0x10014fa2b: lea rcx, [rip + 0xb3430e] ; 0x100c83d40
0x10014fa32: mov qword ptr [rip + 0xb34317], rdx ; 0x100c83d50
0x10014fa39: mov qword ptr [rip + 0xb3431c], 0x4a ; 0x100c83d60
0x10014fa44: mov qword ptr [rip + 0xb3431d], r15 ; 0x100c83d68
0x10014fa4b: mov qword ptr [rip + 0xb3431e], rax ; 0x100c83d70
0x10014fa52: mov qword ptr [rip + 0xb3431b], 0xffffffffffffffff ; 0x100c83d78
0x10014fa5d: mov qword ptr [rip + 0xb3431c], rbx ; 0x100c83d80
0x10014fa64: mov qword ptr [rip + 0xb34319], 0 ; 0x100c83d88
0x10014fa6f: vmovaps xmmword ptr [rip + 0x1c86c99], xmm0 ; 0x101dd6710
0x10014fa77: lea rdx, [rip + 0x1c86c92] ; 0x101dd6710
0x10014fa7e: mov qword ptr [rip + 0x1c86c97], 0 ; 0x101dd6720
0x10014fa89: mov qword ptr [rip + 0xb342b8], rdx ; 0x100c83d48
0x10014fa90: lea r14, [rip + 0xa258e4] ; 0x100b7537b killMomentum
0x10014fa97: mov qword ptr [rip + 0xb342f2], r14 ; 0x100c83d90
0x10014fa9e: lea rdx, [rip + 0xb342eb] ; 0x100c83d90
0x10014faa5: mov qword ptr [rip + 0xb342f4], rcx ; 0x100c83da0
0x10014faac: mov qword ptr [rip + 0xb342f9], 0x4b ; 0x100c83db0
0x10014fab7: mov qword ptr [rip + 0xb342fa], r15 ; 0x100c83db8
0x10014fabe: mov qword ptr [rip + 0xb342fb], rax ; 0x100c83dc0
0x10014fac5: mov qword ptr [rip + 0xb342f8], 0xffffffffffffffff ; 0x100c83dc8
0x10014fad0: mov qword ptr [rip + 0xb342f9], rbx ; 0x100c83dd0
0x10014fad7: mov qword ptr [rip + 0xb342f6], 0 ; 0x100c83dd8
0x10014fae2: vmovaps xmmword ptr [rip + 0x1c86c46], xmm0 ; 0x101dd6730
0x10014faea: lea rcx, [rip + 0x1c86c3f] ; 0x101dd6730
0x10014faf1: mov qword ptr [rip + 0x1c86c44], 0 ; 0x101dd6740
0x10014fafc: mov qword ptr [rip + 0xb34295], rcx ; 0x100c83d98
0x10014fb03: lea rcx, [rip + 0xa2587e] ; 0x100b75388 onGround
0x10014fb0a: mov qword ptr [rip + 0xb342cf], rcx ; 0x100c83de0
0x10014fb11: lea rcx, [rip + 0xb342c8] ; 0x100c83de0
0x10014fb18: mov qword ptr [rip + 0xb342d1], rdx ; 0x100c83df0
0x10014fb1f: mov qword ptr [rip + 0xb2813a], rcx ; 0x100c77c60
0x10014fb26: mov qword ptr [rip + 0xb342cf], 0x4c ; 0x100c83e00
0x10014fb31: mov qword ptr [rip + 0xb342d0], r15 ; 0x100c83e08
0x10014fb38: mov qword ptr [rip + 0xb342d1], rax ; 0x100c83e10
0x10014fb3f: mov qword ptr [rip + 0xb342ce], 0xffffffffffffffff ; 0x100c83e18
0x10014fb4a: mov qword ptr [rip + 0xb342cf], rbx ; 0x100c83e20
0x10014fb51: mov qword ptr [rip + 0xb342cc], 0 ; 0x100c83e28
0x10014fb5c: vmovaps xmmword ptr [rip + 0x1c86bec], xmm1 ; 0x101dd6750
0x10014fb64: lea rax, [rip + 0x1c86be5] ; 0x101dd6750
0x10014fb6b: mov qword ptr [rip + 0x1c86bea], 0 ; 0x101dd6760
0x10014fb76: mov qword ptr [rip + 0xb3426b], rax ; 0x100c83de8
0x10014fb7d: lea rax, [rip + 0xa2580d] ; 0x100b75391 AvatarSetRandomPos
0x10014fb84: mov qword ptr [rip + 0x1c86be5], rax ; 0x101dd6770
0x10014fb8b: lea rax, [rip + 0x1c86bd6] ; 0x101dd6768
0x10014fb92: mov qword ptr [rip + 0x1c86bdb], 0 ; 0x101dd6778
0x10014fb9d: mov rcx, qword ptr [rip + 0xb203b4] ; 0x100c6ff58
0x10014fba4: mov qword ptr [rip + 0x1c86bd5], rcx ; 0x101dd6780
0x10014fbab: mov qword ptr [rip + 0xb203a6], rax ; 0x100c6ff58
0x10014fbb2: mov qword ptr [rip + 0x1c86bd7], rax ; 0x101dd6790
0x10014fbb9: mov qword ptr [rip + 0x1c86bd8], r13 ; 0x101dd6798
0x10014fbc0: mov dword ptr [rip + 0x1c86bd6], 0xffffffff ; 0x101dd67a0
0x10014fbca: mov dword ptr [rip + 0x1c86bd0], 0xffffffff ; 0x101dd67a4
0x10014fbd4: mov qword ptr [rip + 0x1c86be1], 0 ; 0x101dd67c0
0x10014fbdf: mov rax, qword ptr [rip + 0xabc072] ; 0x100c0bc58
0x10014fbe6: add rax, 0x10
0x10014fbea: mov qword ptr [rip + 0x1c86b77], rax ; 0x101dd6768
0x10014fbf1: xor eax, eax
0x10014fbf3: call 0x100011c10 ; 0x100011c10
0x10014fbf8: lea rax, [rip + 0xa257a5] ; 0x100b753a4 markers
0x10014fbff: mov qword ptr [rip + 0xb3422a], rax ; 0x100c83e30
0x10014fc06: lea rcx, [rip + 0xb34223] ; 0x100c83e30
0x10014fc0d: mov rax, qword ptr [rip + 0xb2804c] ; 0x100c77c60
0x10014fc14: mov qword ptr [rip + 0xb34225], rax ; 0x100c83e40
0x10014fc1b: mov qword ptr [rip + 0xb3422a], 0x38 ; 0x100c83e50
0x10014fc26: mov rax, qword ptr [rip + 0xab769b] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x10014fc2d: mov qword ptr [rip + 0xb34224], rax ; 0x100c83e58
0x10014fc34: mov rax, qword ptr [rip + 0xab8595] ; 0x100c081d0 -> 0x10014acf0 __Z18GetMetaClassByTypeIP18AvatarSetRandomPosERK9MetaClassv
0x10014fc3b: mov qword ptr [rip + 0xb3421e], rax ; 0x100c83e60
0x10014fc42: mov qword ptr [rip + 0xb3421b], 0xffffffffffffffff ; 0x100c83e68
0x10014fc4d: mov qword ptr [rip + 0xb3421c], rbx ; 0x100c83e70
0x10014fc54: mov qword ptr [rip + 0xb34219], 0 ; 0x100c83e78
0x10014fc5f: lea rdx, [rip + 0xa149d3] ; 0x100b64639 Marker
0x10014fc66: vmovq xmm0, rdx
0x10014fc6b: lea rdx, [rip + 0xa0ed7a] ; 0x100b5e9ec Tool_ClumpType
0x10014fc72: vmovq xmm1, rdx
0x10014fc77: vmovdqa xmmword ptr [rbp - 0xc0], xmm1
0x10014fc7f: vpunpcklqdq xmm0, xmm1, xmm0
0x10014fc83: vmovdqa xmmword ptr [rbp - 0xa0], xmm0
0x10014fc8b: vmovdqa xmmword ptr [rip + 0x1c86b3d], xmm0 ; 0x101dd67d0
0x10014fc93: lea rdx, [rip + 0x1c86b36] ; 0x101dd67d0
0x10014fc9a: mov qword ptr [rip + 0x1c86b3b], 0 ; 0x101dd67e0
0x10014fca5: mov qword ptr [rip + 0xb3418c], rdx ; 0x100c83e38
0x10014fcac: lea rdx, [rip + 0xa25685] ; 0x100b75338 setLevelStartPosition
0x10014fcb3: mov qword ptr [rip + 0xb341c6], rdx ; 0x100c83e80
0x10014fcba: lea rdx, [rip + 0xb341bf] ; 0x100c83e80
0x10014fcc1: mov qword ptr [rip + 0xb341c8], rcx ; 0x100c83e90
0x10014fcc8: mov qword ptr [rip + 0xb341cd], 0x40 ; 0x100c83ea0
0x10014fcd3: mov qword ptr [rip + 0xb341ce], r15 ; 0x100c83ea8
0x10014fcda: mov qword ptr [rip + 0xb341cf], rax ; 0x100c83eb0
0x10014fce1: mov qword ptr [rip + 0xb341cc], 0xffffffffffffffff ; 0x100c83eb8
0x10014fcec: mov qword ptr [rip + 0xb341cd], rbx ; 0x100c83ec0
0x10014fcf3: mov qword ptr [rip + 0xb341ca], 0 ; 0x100c83ec8
0x10014fcfe: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10014fd03: vmovaps xmmword ptr [rip + 0x1c86ae5], xmm0 ; 0x101dd67f0
0x10014fd0b: lea rcx, [rip + 0x1c86ade] ; 0x101dd67f0
0x10014fd12: mov qword ptr [rip + 0x1c86ae3], 0 ; 0x101dd6800
0x10014fd1d: mov qword ptr [rip + 0xb34164], rcx ; 0x100c83e88
0x10014fd24: mov qword ptr [rip + 0xb341a5], r12 ; 0x100c83ed0
0x10014fd2b: lea rcx, [rip + 0xb3419e] ; 0x100c83ed0
0x10014fd32: mov qword ptr [rip + 0xb341a7], rdx ; 0x100c83ee0
0x10014fd39: mov qword ptr [rip + 0xb341ac], 0x41 ; 0x100c83ef0
0x10014fd44: mov qword ptr [rip + 0xb341ad], r15 ; 0x100c83ef8
0x10014fd4b: mov qword ptr [rip + 0xb341ae], rax ; 0x100c83f00
0x10014fd52: mov qword ptr [rip + 0xb341ab], 0xffffffffffffffff ; 0x100c83f08
0x10014fd5d: mov qword ptr [rip + 0xb341ac], rbx ; 0x100c83f10
0x10014fd64: mov qword ptr [rip + 0xb341a9], 0 ; 0x100c83f18
0x10014fd6f: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10014fd74: vmovaps xmmword ptr [rip + 0x1c86a94], xmm0 ; 0x101dd6810
0x10014fd7c: lea rdx, [rip + 0x1c86a8d] ; 0x101dd6810
0x10014fd83: mov qword ptr [rip + 0x1c86a92], 0 ; 0x101dd6820
0x10014fd8e: mov qword ptr [rip + 0xb34143], rdx ; 0x100c83ed8
0x10014fd95: mov qword ptr [rip + 0xb34184], r14 ; 0x100c83f20
0x10014fd9c: lea rdx, [rip + 0xb3417d] ; 0x100c83f20
0x10014fda3: mov qword ptr [rip + 0xb34186], rcx ; 0x100c83f30
0x10014fdaa: mov qword ptr [rip + 0xb27eaf], rdx ; 0x100c77c60
0x10014fdb1: mov qword ptr [rip + 0xb34184], 0x42 ; 0x100c83f40
0x10014fdbc: mov qword ptr [rip + 0xb34185], r15 ; 0x100c83f48
0x10014fdc3: mov qword ptr [rip + 0xb34186], rax ; 0x100c83f50
0x10014fdca: mov qword ptr [rip + 0xb34183], 0xffffffffffffffff ; 0x100c83f58
0x10014fdd5: mov qword ptr [rip + 0xb34184], rbx ; 0x100c83f60
0x10014fddc: mov qword ptr [rip + 0xb34181], 0 ; 0x100c83f68
0x10014fde7: vmovaps xmmword ptr [rip + 0x1c86a41], xmm0 ; 0x101dd6830
0x10014fdef: lea rax, [rip + 0x1c86a3a] ; 0x101dd6830
0x10014fdf6: mov qword ptr [rip + 0x1c86a3f], 0 ; 0x101dd6840
0x10014fe01: mov qword ptr [rip + 0xb34120], rax ; 0x100c83f28
0x10014fe08: lea rax, [rip + 0xa2559d] ; 0x100b753ac AvatarWarp
0x10014fe0f: mov qword ptr [rip + 0x1c86a3a], rax ; 0x101dd6850
0x10014fe16: lea rax, [rip + 0x1c86a2b] ; 0x101dd6848
0x10014fe1d: mov qword ptr [rip + 0x1c86a30], 0 ; 0x101dd6858
0x10014fe28: mov rcx, qword ptr [rip + 0xb20129] ; 0x100c6ff58
0x10014fe2f: mov qword ptr [rip + 0x1c86a2a], rcx ; 0x101dd6860
0x10014fe36: mov qword ptr [rip + 0xb2011b], rax ; 0x100c6ff58
0x10014fe3d: mov qword ptr [rip + 0x1c86a2c], rax ; 0x101dd6870
0x10014fe44: mov qword ptr [rip + 0x1c86a2d], r13 ; 0x101dd6878
0x10014fe4b: mov r14, r13
0x10014fe4e: mov dword ptr [rip + 0x1c86a28], 0xffffffff ; 0x101dd6880
0x10014fe58: mov dword ptr [rip + 0x1c86a22], 0xffffffff ; 0x101dd6884
0x10014fe62: mov qword ptr [rip + 0x1c86a33], 0 ; 0x101dd68a0
0x10014fe6d: mov rax, qword ptr [rip + 0xabaa64] ; 0x100c0a8d8
0x10014fe74: add rax, 0x10
0x10014fe78: mov qword ptr [rip + 0x1c869c9], rax ; 0x101dd6848
0x10014fe7f: xor eax, eax
0x10014fe81: call 0x100011c10 ; 0x100011c10
0x10014fe86: lea rax, [rip + 0xa254a4] ; 0x100b75331 marker
0x10014fe8d: mov qword ptr [rip + 0xb340dc], rax ; 0x100c83f70
0x10014fe94: lea rax, [rip + 0xb340d5] ; 0x100c83f70
0x10014fe9b: mov qword ptr [rip + 0xb340d2], 0 ; 0x100c83f78
0x10014fea6: mov rcx, qword ptr [rip + 0xb27db3] ; 0x100c77c60
0x10014fead: mov qword ptr [rip + 0xb340cc], rcx ; 0x100c83f80
0x10014feb4: mov qword ptr [rip + 0xb340d1], 0x38 ; 0x100c83f90
0x10014febf: mov rcx, qword ptr [rip + 0xab7462] ; 0x100c07328 -> 0x10003a510 __Z17GetMetaTypeByTypeIP6MarkerERK8MetaTypev
0x10014fec6: mov qword ptr [rip + 0xb340cb], rcx ; 0x100c83f98
0x10014fecd: mov rcx, qword ptr [rip + 0xab76bc] ; 0x100c07590 -> 0x10014b130 __Z18GetMetaClassByTypeIP10AvatarWarpERK9MetaClassv
0x10014fed4: mov qword ptr [rip + 0xb340c5], rcx ; 0x100c83fa0
0x10014fedb: mov qword ptr [rip + 0xb340c2], 0xffffffffffffffff ; 0x100c83fa8
0x10014fee6: mov qword ptr [rip + 0xb340c3], rbx ; 0x100c83fb0
0x10014feed: mov qword ptr [rip + 0xb340c0], 0 ; 0x100c83fb8
0x10014fef8: lea r12, [rip + 0xa22c24] ; 0x100b72b23 speed
0x10014feff: mov qword ptr [rip + 0xb340ba], r12 ; 0x100c83fc0
0x10014ff06: lea rdx, [rip + 0xb340b3] ; 0x100c83fc0
0x10014ff0d: mov qword ptr [rip + 0xb340bc], rax ; 0x100c83fd0
0x10014ff14: mov qword ptr [rip + 0xb27d45], rdx ; 0x100c77c60
0x10014ff1b: mov qword ptr [rip + 0xb340ba], 0x40 ; 0x100c83fe0
0x10014ff26: mov r13, qword ptr [rip + 0xab7633] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x10014ff2d: mov qword ptr [rip + 0xb340b4], r13 ; 0x100c83fe8
0x10014ff34: mov qword ptr [rip + 0xb340b5], rcx ; 0x100c83ff0
0x10014ff3b: mov qword ptr [rip + 0xb340b2], 0xffffffffffffffff ; 0x100c83ff8
0x10014ff46: mov qword ptr [rip + 0xb340b3], rbx ; 0x100c84000
0x10014ff4d: mov qword ptr [rip + 0xb340b0], 0 ; 0x100c84008
0x10014ff58: lea rax, [rip + 0xa25458] ; 0x100b753b7 10.0
0x10014ff5f: vmovq xmm0, rax
0x10014ff64: vmovdqa xmm1, xmmword ptr [rbp - 0x40]
0x10014ff69: vpunpcklqdq xmm0, xmm1, xmm0
0x10014ff6d: vmovdqa xmmword ptr [rbp - 0xb0], xmm0
0x10014ff75: vmovdqa xmmword ptr [rip + 0x1c86933], xmm0 ; 0x101dd68b0
0x10014ff7d: lea rax, [rip + 0x1c8692c] ; 0x101dd68b0
0x10014ff84: mov qword ptr [rip + 0x1c86931], 0 ; 0x101dd68c0
0x10014ff8f: mov qword ptr [rip + 0xb34032], rax ; 0x100c83fc8
0x10014ff96: lea rax, [rip + 0xa2541f] ; 0x100b753bc AvatarSetPosMP
0x10014ff9d: mov qword ptr [rip + 0x1c8692c], rax ; 0x101dd68d0
0x10014ffa4: lea rax, [rip + 0x1c8691d] ; 0x101dd68c8
0x10014ffab: mov qword ptr [rip + 0x1c86922], 0 ; 0x101dd68d8
0x10014ffb6: mov rcx, qword ptr [rip + 0xb1ff9b] ; 0x100c6ff58
0x10014ffbd: mov qword ptr [rip + 0x1c8691c], rcx ; 0x101dd68e0
0x10014ffc4: mov qword ptr [rip + 0xb1ff8d], rax ; 0x100c6ff58
0x10014ffcb: mov qword ptr [rip + 0x1c8691e], rax ; 0x101dd68f0
0x10014ffd2: mov qword ptr [rip + 0x1c8691f], r14 ; 0x101dd68f8
0x10014ffd9: mov dword ptr [rip + 0x1c8691d], 0xffffffff ; 0x101dd6900
0x10014ffe3: mov dword ptr [rip + 0x1c86917], 0xffffffff ; 0x101dd6904
0x10014ffed: mov qword ptr [rip + 0x1c86928], 0 ; 0x101dd6920
0x10014fff8: mov rax, qword ptr [rip + 0xabb329] ; 0x100c0b328
0x10014ffff: add rax, 0x10
0x100150003: mov qword ptr [rip + 0x1c868be], rax ; 0x101dd68c8
0x10015000a: xor eax, eax
0x10015000c: call 0x100011c10 ; 0x100011c10
0x100150011: lea rax, [rip + 0xa2538c] ; 0x100b753a4 markers
0x100150018: mov qword ptr [rip + 0xb33ff1], rax ; 0x100c84010
0x10015001f: lea rax, [rip + 0xb33fea] ; 0x100c84010
0x100150026: mov rcx, qword ptr [rip + 0xb27c33] ; 0x100c77c60
0x10015002d: mov qword ptr [rip + 0xb33fec], rcx ; 0x100c84020
0x100150034: mov qword ptr [rip + 0xb27c25], rax ; 0x100c77c60
0x10015003b: mov qword ptr [rip + 0xb33fea], 0x38 ; 0x100c84030
0x100150046: mov rax, qword ptr [rip + 0xab727b] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x10015004d: mov qword ptr [rip + 0xb33fe4], rax ; 0x100c84038
0x100150054: mov rax, qword ptr [rip + 0xab7c0d] ; 0x100c07c68 -> 0x10014bd10 __Z18GetMetaClassByTypeIP14AvatarSetPosMPERK9MetaClassv
0x10015005b: mov qword ptr [rip + 0xb33fde], rax ; 0x100c84040
0x100150062: mov qword ptr [rip + 0xb33fdb], 0xffffffffffffffff ; 0x100c84048
0x10015006d: mov qword ptr [rip + 0xb33fdc], rbx ; 0x100c84050
0x100150074: mov qword ptr [rip + 0xb33fd9], 0 ; 0x100c84058
0x10015007f: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x100150087: vmovaps xmmword ptr [rip + 0x1c868a1], xmm0 ; 0x101dd6930
0x10015008f: lea rax, [rip + 0x1c8689a] ; 0x101dd6930
0x100150096: mov qword ptr [rip + 0x1c8689f], 0 ; 0x101dd6940
0x1001500a1: mov qword ptr [rip + 0xb33f70], rax ; 0x100c84018
0x1001500a8: lea rax, [rip + 0xa2531c] ; 0x100b753cb AvatarSetZeroG
0x1001500af: mov qword ptr [rip + 0x1c8689a], rax ; 0x101dd6950
0x1001500b6: lea rax, [rip + 0x1c8688b] ; 0x101dd6948
0x1001500bd: mov qword ptr [rip + 0x1c86890], 0 ; 0x101dd6958
0x1001500c8: mov rcx, qword ptr [rip + 0xb1fe89] ; 0x100c6ff58
0x1001500cf: mov qword ptr [rip + 0x1c8688a], rcx ; 0x101dd6960
0x1001500d6: mov qword ptr [rip + 0xb1fe7b], rax ; 0x100c6ff58
0x1001500dd: mov qword ptr [rip + 0x1c8688c], rax ; 0x101dd6970
0x1001500e4: mov qword ptr [rip + 0x1c8688d], r14 ; 0x101dd6978
0x1001500eb: mov dword ptr [rip + 0x1c8688b], 0xffffffff ; 0x101dd6980
0x1001500f5: mov dword ptr [rip + 0x1c86885], 0xffffffff ; 0x101dd6984
0x1001500ff: mov qword ptr [rip + 0x1c86896], 0 ; 0x101dd69a0
0x10015010a: mov rax, qword ptr [rip + 0xabb21f] ; 0x100c0b330
0x100150111: add rax, 0x10
0x100150115: mov qword ptr [rip + 0x1c8682c], rax ; 0x101dd6948
0x10015011c: xor eax, eax
0x10015011e: call 0x100011c10 ; 0x100011c10
0x100150123: lea rax, [rip + 0xa252b0] ; 0x100b753da energyCharge
0x10015012a: mov qword ptr [rip + 0xb33f2f], rax ; 0x100c84060
0x100150131: lea rax, [rip + 0xb33f28] ; 0x100c84060
0x100150138: mov rcx, qword ptr [rip + 0xb27b21] ; 0x100c77c60
0x10015013f: mov qword ptr [rip + 0xb33f2a], rcx ; 0x100c84070
0x100150146: mov qword ptr [rip + 0xb27b13], rax ; 0x100c77c60
0x10015014d: mov qword ptr [rip + 0xb33f28], 0x38 ; 0x100c84080
0x100150158: mov qword ptr [rip + 0xb33f29], r13 ; 0x100c84088
0x10015015f: mov rax, qword ptr [rip + 0xab7b0a] ; 0x100c07c70 -> 0x10014d170 __Z18GetMetaClassByTypeIP14AvatarSetZeroGERK9MetaClassv
0x100150166: mov qword ptr [rip + 0xb33f23], rax ; 0x100c84090
0x10015016d: mov qword ptr [rip + 0xb33f20], 0xffffffffffffffff ; 0x100c84098
0x100150178: mov qword ptr [rip + 0xb33f21], rbx ; 0x100c840a0
0x10015017f: mov qword ptr [rip + 0xb33f1e], 0 ; 0x100c840a8
0x10015018a: lea rax, [rip + 0xa23fbd] ; 0x100b7414e 1.0
0x100150191: vmovq xmm0, rax
0x100150196: vmovdqa xmm1, xmmword ptr [rbp - 0x40]
0x10015019b: vpunpcklqdq xmm0, xmm1, xmm0
0x10015019f: vmovdqa xmmword ptr [rbp - 0x90], xmm0
0x1001501a7: vmovdqa xmmword ptr [rip + 0x1c86801], xmm0 ; 0x101dd69b0
0x1001501af: lea rax, [rip + 0x1c867fa] ; 0x101dd69b0
0x1001501b6: mov qword ptr [rip + 0x1c867ff], 0 ; 0x101dd69c0
0x1001501c1: mov qword ptr [rip + 0xb33ea0], rax ; 0x100c84068
0x1001501c8: lea rax, [rip + 0xa25218] ; 0x100b753e7 AvatarBreakHandHold
0x1001501cf: mov qword ptr [rip + 0x1c867fa], rax ; 0x101dd69d0
0x1001501d6: lea rax, [rip + 0x1c867eb] ; 0x101dd69c8
0x1001501dd: mov qword ptr [rip + 0x1c867f0], 0 ; 0x101dd69d8
0x1001501e8: mov rcx, qword ptr [rip + 0xb1fd69] ; 0x100c6ff58
0x1001501ef: mov qword ptr [rip + 0x1c867ea], rcx ; 0x101dd69e0
0x1001501f6: mov qword ptr [rip + 0xb1fd5b], rax ; 0x100c6ff58
0x1001501fd: mov qword ptr [rip + 0x1c867ec], rax ; 0x101dd69f0
0x100150204: mov qword ptr [rip + 0x1c867ed], r14 ; 0x101dd69f8
0x10015020b: mov dword ptr [rip + 0x1c867eb], 0xffffffff ; 0x101dd6a00
0x100150215: mov dword ptr [rip + 0x1c867e5], 0xffffffff ; 0x101dd6a04
0x10015021f: mov qword ptr [rip + 0x1c867f6], 0 ; 0x101dd6a20
0x10015022a: mov rax, qword ptr [rip + 0xabbb9f] ; 0x100c0bdd0
0x100150231: add rax, 0x10
0x100150235: mov qword ptr [rip + 0x1c8678c], rax ; 0x101dd69c8
0x10015023c: xor eax, eax
0x10015023e: call 0x100011c10 ; 0x100011c10
0x100150243: lea rax, [rip + 0xa251b1] ; 0x100b753fb breakFromLeader
0x10015024a: mov qword ptr [rip + 0xb33e5f], rax ; 0x100c840b0
0x100150251: lea rax, [rip + 0xb33e58] ; 0x100c840b0
0x100150258: mov rcx, qword ptr [rip + 0xb27a01] ; 0x100c77c60
0x10015025f: mov qword ptr [rip + 0xb33e5a], rcx ; 0x100c840c0
0x100150266: mov qword ptr [rip + 0xb33e5f], 0x38 ; 0x100c840d0
0x100150271: mov qword ptr [rip + 0xb33e60], r15 ; 0x100c840d8
0x100150278: mov rcx, qword ptr [rip + 0xab8019] ; 0x100c08298 -> 0x10014d490 __Z18GetMetaClassByTypeIP19AvatarBreakHandHoldERK9MetaClassv
0x10015027f: mov qword ptr [rip + 0xb33e5a], rcx ; 0x100c840e0
0x100150286: mov qword ptr [rip + 0xb33e57], 0xffffffffffffffff ; 0x100c840e8
0x100150291: mov qword ptr [rip + 0xb33e58], rbx ; 0x100c840f0
0x100150298: mov qword ptr [rip + 0xb33e55], 0 ; 0x100c840f8
0x1001502a3: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1001502a8: vmovaps xmmword ptr [rip + 0x1c86780], xmm0 ; 0x101dd6a30
0x1001502b0: lea rdx, [rip + 0x1c86779] ; 0x101dd6a30
0x1001502b7: mov qword ptr [rip + 0x1c8677e], 0 ; 0x101dd6a40
0x1001502c2: mov qword ptr [rip + 0xb33def], rdx ; 0x100c840b8
0x1001502c9: lea rdx, [rip + 0xa2513b] ; 0x100b7540b breakFromFollowers
0x1001502d0: mov qword ptr [rip + 0xb33e29], rdx ; 0x100c84100
0x1001502d7: lea rdx, [rip + 0xb33e22] ; 0x100c84100
0x1001502de: mov qword ptr [rip + 0xb33e2b], rax ; 0x100c84110
0x1001502e5: mov qword ptr [rip + 0xb27974], rdx ; 0x100c77c60
0x1001502ec: mov qword ptr [rip + 0xb33e29], 0x39 ; 0x100c84120
0x1001502f7: mov qword ptr [rip + 0xb33e2a], r15 ; 0x100c84128
0x1001502fe: mov qword ptr [rip + 0xb33e2b], rcx ; 0x100c84130
0x100150305: mov qword ptr [rip + 0xb33e28], 0xffffffffffffffff ; 0x100c84138
0x100150310: mov qword ptr [rip + 0xb33e29], rbx ; 0x100c84140
0x100150317: mov qword ptr [rip + 0xb33e26], 0 ; 0x100c84148
0x100150322: vmovaps xmmword ptr [rip + 0x1c86726], xmm0 ; 0x101dd6a50
0x10015032a: lea rax, [rip + 0x1c8671f] ; 0x101dd6a50
0x100150331: mov qword ptr [rip + 0x1c86724], 0 ; 0x101dd6a60
0x10015033c: mov qword ptr [rip + 0xb33dc5], rax ; 0x100c84108
0x100150343: lea rax, [rip + 0xa250d4] ; 0x100b7541e AvatarSetInnerGlow
0x10015034a: mov qword ptr [rip + 0x1c8671f], rax ; 0x101dd6a70
0x100150351: lea rax, [rip + 0x1c86710] ; 0x101dd6a68
0x100150358: mov qword ptr [rip + 0x1c86715], 0 ; 0x101dd6a78
0x100150363: mov rcx, qword ptr [rip + 0xb1fbee] ; 0x100c6ff58
0x10015036a: mov qword ptr [rip + 0x1c8670f], rcx ; 0x101dd6a80
0x100150371: mov qword ptr [rip + 0xb1fbe0], rax ; 0x100c6ff58
0x100150378: mov qword ptr [rip + 0x1c86711], rax ; 0x101dd6a90
0x10015037f: mov qword ptr [rip + 0x1c86712], r14 ; 0x101dd6a98
0x100150386: mov dword ptr [rip + 0x1c86710], 0xffffffff ; 0x101dd6aa0
0x100150390: mov dword ptr [rip + 0x1c8670a], 0xffffffff ; 0x101dd6aa4
0x10015039a: mov qword ptr [rip + 0x1c8671b], 0 ; 0x101dd6ac0
0x1001503a5: mov rax, qword ptr [rip + 0xabb8a4] ; 0x100c0bc50
0x1001503ac: add rax, 0x10
0x1001503b0: mov qword ptr [rip + 0x1c866b1], rax ; 0x101dd6a68
0x1001503b7: xor eax, eax
0x1001503b9: call 0x100011c10 ; 0x100011c10
0x1001503be: lea rax, [rip + 0xa13f49] ; 0x100b6430e amount
0x1001503c5: mov qword ptr [rip + 0xb33d84], rax ; 0x100c84150
0x1001503cc: lea rcx, [rip + 0xb33d7d] ; 0x100c84150
0x1001503d3: mov rax, qword ptr [rip + 0xb27886] ; 0x100c77c60
0x1001503da: mov qword ptr [rip + 0xb33d7f], rax ; 0x100c84160
0x1001503e1: mov qword ptr [rip + 0xb33d84], 0x38 ; 0x100c84170
0x1001503ec: mov qword ptr [rip + 0xb33d85], r13 ; 0x100c84178
0x1001503f3: mov rax, qword ptr [rip + 0xab7dce] ; 0x100c081c8 -> 0x10014d910 __Z18GetMetaClassByTypeIP18AvatarSetInnerGlowERK9MetaClassv
0x1001503fa: mov qword ptr [rip + 0xb33d7f], rax ; 0x100c84180
0x100150401: mov qword ptr [rip + 0xb33d7c], 0xffffffffffffffff ; 0x100c84188
0x10015040c: mov qword ptr [rip + 0xb33d7d], rbx ; 0x100c84190
0x100150413: mov qword ptr [rip + 0xb33d7a], 0 ; 0x100c84198
0x10015041e: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x100150426: vmovaps xmmword ptr [rip + 0x1c866a2], xmm0 ; 0x101dd6ad0
0x10015042e: lea rdx, [rip + 0x1c8669b] ; 0x101dd6ad0
0x100150435: mov qword ptr [rip + 0x1c866a0], 0 ; 0x101dd6ae0
0x100150440: mov qword ptr [rip + 0xb33d11], rdx ; 0x100c84158
0x100150447: lea rdx, [rip + 0xa24fe3] ; 0x100b75431 snap
0x10015044e: mov qword ptr [rip + 0xb33d4b], rdx ; 0x100c841a0
0x100150455: lea rdx, [rip + 0xb33d44] ; 0x100c841a0
0x10015045c: mov qword ptr [rip + 0xb33d4d], rcx ; 0x100c841b0
0x100150463: mov qword ptr [rip + 0xb33d52], 0x3c ; 0x100c841c0
0x10015046e: mov qword ptr [rip + 0xb33d53], r13 ; 0x100c841c8
0x100150475: mov qword ptr [rip + 0xb33d54], rax ; 0x100c841d0
0x10015047c: mov qword ptr [rip + 0xb33d51], 0xffffffffffffffff ; 0x100c841d8
0x100150487: mov qword ptr [rip + 0xb33d52], rbx ; 0x100c841e0
0x10015048e: mov qword ptr [rip + 0xb33d4f], 0 ; 0x100c841e8
0x100150499: lea rcx, [rip + 0xa24f96] ; 0x100b75436 0.5
0x1001504a0: vmovq xmm0, rcx
0x1001504a5: vmovdqa xmm1, xmmword ptr [rbp - 0x40]
0x1001504aa: vpunpcklqdq xmm0, xmm1, xmm0
0x1001504ae: vmovdqa xmmword ptr [rip + 0x1c8663a], xmm0 ; 0x101dd6af0
0x1001504b6: lea rcx, [rip + 0x1c86633] ; 0x101dd6af0
0x1001504bd: mov qword ptr [rip + 0x1c86638], 0 ; 0x101dd6b00
0x1001504c8: mov qword ptr [rip + 0xb33cd9], rcx ; 0x100c841a8
0x1001504cf: lea rcx, [rip + 0xa24f64] ; 0x100b7543a stayActive
0x1001504d6: mov qword ptr [rip + 0xb33d13], rcx ; 0x100c841f0
0x1001504dd: lea rcx, [rip + 0xb33d0c] ; 0x100c841f0
0x1001504e4: mov qword ptr [rip + 0xb33d15], rdx ; 0x100c84200
0x1001504eb: mov qword ptr [rip + 0xb33d1a], 0x40 ; 0x100c84210
0x1001504f6: mov qword ptr [rip + 0xb33d1b], r15 ; 0x100c84218
0x1001504fd: mov qword ptr [rip + 0xb33d1c], rax ; 0x100c84220
0x100150504: mov qword ptr [rip + 0xb33d19], 0xffffffffffffffff ; 0x100c84228
0x10015050f: mov qword ptr [rip + 0xb33d1a], rbx ; 0x100c84230
0x100150516: mov qword ptr [rip + 0xb33d17], 0 ; 0x100c84238
0x100150521: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x100150526: vmovaps xmmword ptr [rip + 0x1c865e2], xmm0 ; 0x101dd6b10
0x10015052e: lea rdx, [rip + 0x1c865db] ; 0x101dd6b10
0x100150535: mov qword ptr [rip + 0x1c865e0], 0 ; 0x101dd6b20
0x100150540: mov qword ptr [rip + 0xb33cb1], rdx ; 0x100c841f8
0x100150547: lea rdx, [rip + 0xa24ef7] ; 0x100b75445 fadeInDuration
0x10015054e: mov qword ptr [rip + 0xb33ceb], rdx ; 0x100c84240
0x100150555: lea rdx, [rip + 0xb33ce4] ; 0x100c84240
0x10015055c: mov qword ptr [rip + 0xb33ced], rcx ; 0x100c84250
0x100150563: mov qword ptr [rip + 0xb276f6], rdx ; 0x100c77c60
0x10015056a: mov qword ptr [rip + 0xb33ceb], 0x44 ; 0x100c84260
0x100150575: mov qword ptr [rip + 0xb33cec], r13 ; 0x100c84268
0x10015057c: mov qword ptr [rip + 0xb33ced], rax ; 0x100c84270
0x100150583: mov qword ptr [rip + 0xb33cea], 0xffffffffffffffff ; 0x100c84278
0x10015058e: mov qword ptr [rip + 0xb33ceb], rbx ; 0x100c84280
0x100150595: mov qword ptr [rip + 0xb33ce8], 0 ; 0x100c84288
0x1001505a0: lea rax, [rip + 0xa23b6d] ; 0x100b74114 0.0
0x1001505a7: vmovq xmm0, rax
0x1001505ac: vpunpcklqdq xmm0, xmm1, xmm0
0x1001505b0: vmovdqa xmmword ptr [rip + 0x1c86578], xmm0 ; 0x101dd6b30
0x1001505b8: lea rax, [rip + 0x1c86571] ; 0x101dd6b30
0x1001505bf: mov qword ptr [rip + 0x1c86576], 0 ; 0x101dd6b40
0x1001505ca: mov qword ptr [rip + 0xb33c77], rax ; 0x100c84248
0x1001505d1: lea rax, [rip + 0xa24e7c] ; 0x100b75454 AvatarGrindToPos
0x1001505d8: mov qword ptr [rip + 0x1c86571], rax ; 0x101dd6b50
0x1001505df: lea rax, [rip + 0x1c86562] ; 0x101dd6b48
0x1001505e6: mov qword ptr [rip + 0x1c86567], 0 ; 0x101dd6b58
0x1001505f1: mov rcx, qword ptr [rip + 0xb1f960] ; 0x100c6ff58
0x1001505f8: mov qword ptr [rip + 0x1c86561], rcx ; 0x101dd6b60
0x1001505ff: mov qword ptr [rip + 0xb1f952], rax ; 0x100c6ff58
0x100150606: mov qword ptr [rip + 0x1c86563], rax ; 0x101dd6b70
0x10015060d: mov qword ptr [rip + 0x1c86564], r14 ; 0x101dd6b78
0x100150614: mov dword ptr [rip + 0x1c86562], 0xffffffff ; 0x101dd6b80
0x10015061e: mov dword ptr [rip + 0x1c8655c], 0xffffffff ; 0x101dd6b84
0x100150628: mov qword ptr [rip + 0x1c8656d], 0 ; 0x101dd6ba0
0x100150633: mov rax, qword ptr [rip + 0xabb25e] ; 0x100c0b898
0x10015063a: add rax, 0x10
0x10015063e: mov qword ptr [rip + 0x1c86503], rax ; 0x101dd6b48
0x100150645: xor eax, eax
0x100150647: call 0x100011c10 ; 0x100011c10
0x10015064c: lea rax, [rip + 0xa0fa24] ; 0x100b60077 OnResumeEnabled
0x100150653: mov qword ptr [rip + 0x1c8654e], rax ; 0x101dd6ba8
0x10015065a: lea rax, [rip + 0x1c86547] ; 0x101dd6ba8
0x100150661: mov qword ptr [rip + 0x1c86544], 0 ; 0x101dd6bb0
0x10015066c: mov rcx, qword ptr [rip + 0xb1f8ed] ; 0x100c6ff60
0x100150673: mov qword ptr [rip + 0x1c8653e], rcx ; 0x101dd6bb8
0x10015067a: mov qword ptr [rip + 0xb1f8df], rax ; 0x100c6ff60
0x100150681: lea rax, [rip - 0x77a8] ; 0x100148ee0
0x100150688: vmovq xmm0, rax
0x10015068d: vmovdqu xmmword ptr [rip + 0x1c8654b], xmm0 ; 0x101dd6be0
0x100150695: mov rax, qword ptr [rip + 0xab570c] ; 0x100c05da8 -> 0x10014e950 __Z12ApplyWrapperI16AvatarGrindToPosMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x10015069c: mov qword ptr [rip + 0x1c8654d], rax ; 0x101dd6bf0
0x1001506a3: mov rax, qword ptr [rip + 0xab8f8e] ; 0x100c09638 -> 0x10014e9f0 __Z21InitFunctionSignatureIM16AvatarGrindToPosFvP4GameEEvP17FunctionSignature
0x1001506aa: mov qword ptr [rip + 0x1c86547], rax ; 0x101dd6bf8
0x1001506b1: mov rax, qword ptr [rip + 0xab7900] ; 0x100c07fb8 -> 0x10014e0e0 __Z18GetMetaClassByTypeIP16AvatarGrindToPosERK9MetaClassv
0x1001506b8: mov qword ptr [rip + 0x1c86541], rax ; 0x101dd6c00
0x1001506bf: lea rcx, [rip + 0xa24daa] ; 0x100b75470 748A70
0x1001506c6: vmovq xmm0, rcx
0x1001506cb: lea rcx, [rip + 0xa24d93] ; 0x100b75465 Tool_Color
0x1001506d2: vmovq xmm1, rcx
0x1001506d7: vpunpcklqdq xmm0, xmm1, xmm0
0x1001506db: vmovdqa xmmword ptr [rip + 0x1c8652d], xmm0 ; 0x101dd6c10
0x1001506e3: lea rcx, [rip + 0x1c86526] ; 0x101dd6c10
0x1001506ea: mov rdx, qword ptr [rip + 0x1c86467] ; 0x101dd6b58
0x1001506f1: mov qword ptr [rip + 0x1c86528], rdx ; 0x101dd6c20
0x1001506f8: mov qword ptr [rip + 0x1c86459], rcx ; 0x101dd6b58
0x1001506ff: lea rcx, [rip + 0xa22416] ; 0x100b72b1c target
0x100150706: mov qword ptr [rip + 0xb33b83], rcx ; 0x100c84290
0x10015070d: lea rcx, [rip + 0xb33b7c] ; 0x100c84290
0x100150714: mov qword ptr [rip + 0xb33b79], 0 ; 0x100c84298
0x10015071f: mov rdx, qword ptr [rip + 0xb2753a] ; 0x100c77c60
0x100150726: mov qword ptr [rip + 0xb33b73], rdx ; 0x100c842a0
0x10015072d: mov qword ptr [rip + 0xb33b78], 0x40 ; 0x100c842b0
0x100150738: mov rsi, qword ptr [rip + 0xab6b89] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x10015073f: mov qword ptr [rip + 0xb33b72], rsi ; 0x100c842b8
0x100150746: mov qword ptr [rip + 0xb33b73], rax ; 0x100c842c0
0x10015074d: mov qword ptr [rip + 0xb33b70], 0xffffffffffffffff ; 0x100c842c8
0x100150758: mov qword ptr [rip + 0xb33b71], rbx ; 0x100c842d0
0x10015075f: mov qword ptr [rip + 0xb33b6e], 0 ; 0x100c842d8
0x10015076a: lea rdx, [rip + 0xa24d06] ; 0x100b75477 remoteTarget
0x100150771: mov qword ptr [rip + 0xb33b68], rdx ; 0x100c842e0
0x100150778: lea rdx, [rip + 0xb33b61] ; 0x100c842e0
0x10015077f: mov qword ptr [rip + 0xb33b5e], 0 ; 0x100c842e8
0x10015078a: mov qword ptr [rip + 0xb33b5f], rcx ; 0x100c842f0
0x100150791: mov qword ptr [rip + 0xb33b64], 0x48 ; 0x100c84300
0x10015079c: mov qword ptr [rip + 0xb33b65], rsi ; 0x100c84308
0x1001507a3: mov qword ptr [rip + 0xb33b66], rax ; 0x100c84310
0x1001507aa: mov qword ptr [rip + 0xb33b63], 0xffffffffffffffff ; 0x100c84318
0x1001507b5: mov qword ptr [rip + 0xb33b64], rbx ; 0x100c84320
0x1001507bc: mov qword ptr [rip + 0xb33b61], 0 ; 0x100c84328
0x1001507c7: mov qword ptr [rip + 0xb33b62], r12 ; 0x100c84330
0x1001507ce: lea rcx, [rip + 0xb33b5b] ; 0x100c84330
0x1001507d5: mov qword ptr [rip + 0xb33b58], 0 ; 0x100c84338
0x1001507e0: mov qword ptr [rip + 0xb33b59], rdx ; 0x100c84340
0x1001507e7: mov qword ptr [rip + 0xb33b5e], 0x50 ; 0x100c84350
0x1001507f2: mov qword ptr [rip + 0xb33b5f], r13 ; 0x100c84358
0x1001507f9: mov qword ptr [rip + 0xb33b60], rax ; 0x100c84360
0x100150800: mov qword ptr [rip + 0xb33b5d], 0xffffffffffffffff ; 0x100c84368
0x10015080b: mov qword ptr [rip + 0xb33b5e], rbx ; 0x100c84370
0x100150812: mov qword ptr [rip + 0xb33b5b], 0 ; 0x100c84378
0x10015081d: lea rdx, [rip + 0xa0c281] ; 0x100b5caa5 time
0x100150824: mov qword ptr [rip + 0xb33b55], rdx ; 0x100c84380
0x10015082b: lea rdx, [rip + 0xb33b4e] ; 0x100c84380
0x100150832: mov qword ptr [rip + 0xb33b4b], 0 ; 0x100c84388
0x10015083d: mov qword ptr [rip + 0xb33b4c], rcx ; 0x100c84390
0x100150844: mov qword ptr [rip + 0xb33b51], 0x54 ; 0x100c843a0
0x10015084f: mov qword ptr [rip + 0xb33b52], r13 ; 0x100c843a8
0x100150856: mov qword ptr [rip + 0xb33b53], rax ; 0x100c843b0
0x10015085d: mov qword ptr [rip + 0xb33b50], 0xffffffffffffffff ; 0x100c843b8
0x100150868: mov qword ptr [rip + 0xb33b51], rbx ; 0x100c843c0
0x10015086f: mov qword ptr [rip + 0xb33b4e], 0 ; 0x100c843c8
0x10015087a: lea rcx, [rip + 0xa24c03] ; 0x100b75484 useTime
0x100150881: mov qword ptr [rip + 0xb33b48], rcx ; 0x100c843d0
0x100150888: lea rcx, [rip + 0xb33b41] ; 0x100c843d0
0x10015088f: mov qword ptr [rip + 0xb33b3e], 0 ; 0x100c843d8
0x10015089a: mov qword ptr [rip + 0xb33b3f], rdx ; 0x100c843e0
0x1001508a1: mov qword ptr [rip + 0xb33b44], 0x64 ; 0x100c843f0
0x1001508ac: mov qword ptr [rip + 0xb33b45], r15 ; 0x100c843f8
0x1001508b3: mov qword ptr [rip + 0xb33b46], rax ; 0x100c84400
0x1001508ba: mov qword ptr [rip + 0xb33b43], 0xffffffffffffffff ; 0x100c84408
0x1001508c5: mov qword ptr [rip + 0xb33b44], rbx ; 0x100c84410
0x1001508cc: mov qword ptr [rip + 0xb33b41], 0 ; 0x100c84418
0x1001508d7: lea rdx, [rip + 0xa24bae] ; 0x100b7548c stopDist
0x1001508de: mov qword ptr [rip + 0xb33b3b], rdx ; 0x100c84420
0x1001508e5: lea rdx, [rip + 0xb33b34] ; 0x100c84420
0x1001508ec: mov qword ptr [rip + 0xb33b31], 0 ; 0x100c84428
0x1001508f7: mov qword ptr [rip + 0xb33b32], rcx ; 0x100c84430
0x1001508fe: mov qword ptr [rip + 0xb33b37], 0x60 ; 0x100c84440
0x100150909: mov qword ptr [rip + 0xb33b38], r13 ; 0x100c84448
0x100150910: mov qword ptr [rip + 0xb33b39], rax ; 0x100c84450
0x100150917: mov qword ptr [rip + 0xb33b36], 0xffffffffffffffff ; 0x100c84458
0x100150922: mov qword ptr [rip + 0xb33b37], rbx ; 0x100c84460
0x100150929: mov qword ptr [rip + 0xb33b34], 0 ; 0x100c84468
0x100150934: lea rcx, [rip + 0xa14757] ; 0x100b65092 npc
0x10015093b: mov qword ptr [rip + 0xb33b2e], rcx ; 0x100c84470
0x100150942: lea rcx, [rip + 0xb33b27] ; 0x100c84470
0x100150949: mov qword ptr [rip + 0xb33b24], 0 ; 0x100c84478
0x100150954: mov qword ptr [rip + 0xb33b25], rdx ; 0x100c84480
0x10015095b: mov qword ptr [rip + 0xb33b2a], 0x68 ; 0x100c84490
0x100150966: mov rdx, qword ptr [rip + 0xab6903] ; 0x100c07270 -> 0x100088f50 __Z17GetMetaTypeByTypeIP3NpcERK8MetaTypev
0x10015096d: mov qword ptr [rip + 0xb33b24], rdx ; 0x100c84498
0x100150974: mov qword ptr [rip + 0xb33b25], rax ; 0x100c844a0
0x10015097b: mov qword ptr [rip + 0xb33b22], 0xffffffffffffffff ; 0x100c844a8
0x100150986: mov qword ptr [rip + 0xb33b23], rbx ; 0x100c844b0
0x10015098d: mov qword ptr [rip + 0xb33b20], 0 ; 0x100c844b8
0x100150998: lea rdx, [rip + 0xa24af6] ; 0x100b75495 setOrientDuration
0x10015099f: mov qword ptr [rip + 0xb33b1a], rdx ; 0x100c844c0
0x1001509a6: lea rdx, [rip + 0xb33b13] ; 0x100c844c0
0x1001509ad: mov qword ptr [rip + 0xb33b10], 0 ; 0x100c844c8
0x1001509b8: mov qword ptr [rip + 0xb33b11], rcx ; 0x100c844d0
0x1001509bf: mov qword ptr [rip + 0xb33b16], 0x58 ; 0x100c844e0
0x1001509ca: mov qword ptr [rip + 0xb33b17], r13 ; 0x100c844e8
0x1001509d1: mov qword ptr [rip + 0xb33b18], rax ; 0x100c844f0
0x1001509d8: mov qword ptr [rip + 0xb33b15], 0xffffffffffffffff ; 0x100c844f8
0x1001509e3: mov qword ptr [rip + 0xb33b16], rbx ; 0x100c84500
0x1001509ea: mov qword ptr [rip + 0xb33b13], 0 ; 0x100c84508
0x1001509f5: lea rcx, [rip + 0xa24aab] ; 0x100b754a7 comeToStop
0x1001509fc: mov qword ptr [rip + 0xb33b0d], rcx ; 0x100c84510
0x100150a03: lea rcx, [rip + 0xb33b06] ; 0x100c84510
0x100150a0a: mov qword ptr [rip + 0xb33b03], 0 ; 0x100c84518
0x100150a15: mov qword ptr [rip + 0xb33b04], rdx ; 0x100c84520
0x100150a1c: mov qword ptr [rip + 0xb33b09], 0x71 ; 0x100c84530
0x100150a27: mov qword ptr [rip + 0xb33b0a], r15 ; 0x100c84538
0x100150a2e: mov qword ptr [rip + 0xb33b0b], rax ; 0x100c84540
0x100150a35: mov qword ptr [rip + 0xb33b08], 0xffffffffffffffff ; 0x100c84548
0x100150a40: mov qword ptr [rip + 0xb33b09], rbx ; 0x100c84550
0x100150a47: mov qword ptr [rip + 0xb33b06], 0 ; 0x100c84558
0x100150a52: lea rdx, [rip + 0xa24a59] ; 0x100b754b2 useInputStr
0x100150a59: mov qword ptr [rip + 0xb33b00], rdx ; 0x100c84560
0x100150a60: lea rdx, [rip + 0xb33af9] ; 0x100c84560
0x100150a67: mov qword ptr [rip + 0xb33af6], 0 ; 0x100c84568
0x100150a72: mov qword ptr [rip + 0xb33af7], rcx ; 0x100c84570
0x100150a79: mov qword ptr [rip + 0xb33afc], 0x70 ; 0x100c84580
0x100150a84: mov qword ptr [rip + 0xb33afd], r15 ; 0x100c84588
0x100150a8b: mov qword ptr [rip + 0xb33afe], rax ; 0x100c84590
0x100150a92: mov qword ptr [rip + 0xb33afb], 0xffffffffffffffff ; 0x100c84598
0x100150a9d: mov qword ptr [rip + 0xb33afc], rbx ; 0x100c845a0
0x100150aa4: mov qword ptr [rip + 0xb33af9], 0 ; 0x100c845a8
0x100150aaf: lea rcx, [rip + 0xa24a08] ; 0x100b754be inputStr
0x100150ab6: mov qword ptr [rip + 0xb33af3], rcx ; 0x100c845b0
0x100150abd: lea rcx, [rip + 0xb33aec] ; 0x100c845b0
0x100150ac4: mov qword ptr [rip + 0xb33ae9], 0 ; 0x100c845b8
0x100150acf: mov qword ptr [rip + 0xb33aea], rdx ; 0x100c845c0
0x100150ad6: mov qword ptr [rip + 0xb33aef], 0x5c ; 0x100c845d0
0x100150ae1: mov qword ptr [rip + 0xb33af0], r13 ; 0x100c845d8
0x100150ae8: mov qword ptr [rip + 0xb33af1], rax ; 0x100c845e0
0x100150aef: mov qword ptr [rip + 0xb33aee], 0xffffffffffffffff ; 0x100c845e8
0x100150afa: mov qword ptr [rip + 0xb33aef], rbx ; 0x100c845f0
0x100150b01: mov qword ptr [rip + 0xb33aec], 0 ; 0x100c845f8
0x100150b0c: lea rdx, [rip + 0xa249b4] ; 0x100b754c7 positionSnap
0x100150b13: mov qword ptr [rip + 0xb33ae6], rdx ; 0x100c84600
0x100150b1a: lea rdx, [rip + 0xb33adf] ; 0x100c84600
0x100150b21: mov qword ptr [rip + 0xb33adc], 0 ; 0x100c84608
0x100150b2c: mov qword ptr [rip + 0xb33add], rcx ; 0x100c84610
0x100150b33: mov qword ptr [rip + 0xb33ae2], 0x74 ; 0x100c84620
0x100150b3e: mov qword ptr [rip + 0xb33ae3], r13 ; 0x100c84628
0x100150b45: mov qword ptr [rip + 0xb33ae4], rax ; 0x100c84630
0x100150b4c: mov qword ptr [rip + 0xb33ae1], 0xffffffffffffffff ; 0x100c84638
0x100150b57: mov qword ptr [rip + 0xb33ae2], rbx ; 0x100c84640
0x100150b5e: mov qword ptr [rip + 0xb33adf], 0 ; 0x100c84648
0x100150b69: lea rcx, [rip + 0xa24964] ; 0x100b754d4 smoothInTime
0x100150b70: mov qword ptr [rip + 0xb33ad9], rcx ; 0x100c84650
0x100150b77: lea rcx, [rip + 0xb33ad2] ; 0x100c84650
0x100150b7e: mov qword ptr [rip + 0xb33adb], rdx ; 0x100c84660
0x100150b85: mov qword ptr [rip + 0xb33ae0], 0x78 ; 0x100c84670
0x100150b90: mov qword ptr [rip + 0xb33ae1], r13 ; 0x100c84678
0x100150b97: mov qword ptr [rip + 0xb33ae2], rax ; 0x100c84680
0x100150b9e: mov qword ptr [rip + 0xb33adf], 0xffffffffffffffff ; 0x100c84688
0x100150ba9: mov qword ptr [rip + 0xb33ae0], rbx ; 0x100c84690
0x100150bb0: mov qword ptr [rip + 0xb33add], 0 ; 0x100c84698
0x100150bbb: lea rdx, [rip + 0xa2491f] ; 0x100b754e1 smoothOutDist
0x100150bc2: mov qword ptr [rip + 0xb33ad7], rdx ; 0x100c846a0
0x100150bc9: lea rdx, [rip + 0xb33ad0] ; 0x100c846a0
0x100150bd0: mov qword ptr [rip + 0xb33ad9], rcx ; 0x100c846b0
0x100150bd7: mov qword ptr [rip + 0xb33ade], 0x7c ; 0x100c846c0
0x100150be2: mov qword ptr [rip + 0xb33adf], r13 ; 0x100c846c8
0x100150be9: mov qword ptr [rip + 0xb33ae0], rax ; 0x100c846d0
0x100150bf0: mov qword ptr [rip + 0xb33add], 0xffffffffffffffff ; 0x100c846d8
0x100150bfb: mov qword ptr [rip + 0xb33ade], rbx ; 0x100c846e0
0x100150c02: mov qword ptr [rip + 0xb33adb], 0 ; 0x100c846e8
0x100150c0d: lea rcx, [rip + 0xa248db] ; 0x100b754ef grindCompleteFX
0x100150c14: mov qword ptr [rip + 0xb33ad5], rcx ; 0x100c846f0
0x100150c1b: lea rcx, [rip + 0xb33ace] ; 0x100c846f0
0x100150c22: mov qword ptr [rip + 0xb33ad7], rdx ; 0x100c84700
0x100150c29: mov qword ptr [rip + 0xb27030], rcx ; 0x100c77c60
0x100150c30: mov qword ptr [rip + 0xb33ad5], 0x80 ; 0x100c84710
0x100150c3b: mov qword ptr [rip + 0xb33ad6], rsi ; 0x100c84718
0x100150c42: mov qword ptr [rip + 0xb33ad7], rax ; 0x100c84720
0x100150c49: mov qword ptr [rip + 0xb33ad4], 0xffffffffffffffff ; 0x100c84728
0x100150c54: mov qword ptr [rip + 0xb33ad5], rbx ; 0x100c84730
0x100150c5b: mov qword ptr [rip + 0xb33ad2], 0 ; 0x100c84738
0x100150c66: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x100150c6e: vmovaps xmmword ptr [rip + 0x1c85fba], xmm0 ; 0x101dd6c30
0x100150c76: lea rax, [rip + 0x1c85fb3] ; 0x101dd6c30
0x100150c7d: mov rcx, qword ptr [rip + 0xb33614] ; 0x100c84298
0x100150c84: mov qword ptr [rip + 0x1c85fb5], rcx ; 0x101dd6c40
0x100150c8b: mov qword ptr [rip + 0xb33606], rax ; 0x100c84298
0x100150c92: vmovaps xmmword ptr [rip + 0x1c85fb6], xmm0 ; 0x101dd6c50
0x100150c9a: lea rax, [rip + 0x1c85faf] ; 0x101dd6c50
0x100150ca1: mov rcx, qword ptr [rip + 0xb33640] ; 0x100c842e8
0x100150ca8: mov qword ptr [rip + 0x1c85fb1], rcx ; 0x101dd6c60
0x100150caf: lea rcx, [rip + 0xa0dd45] ; 0x100b5e9fb Object
0x100150cb6: vmovq xmm0, rcx
0x100150cbb: vmovdqa xmm1, xmmword ptr [rbp - 0xc0]
0x100150cc3: vpunpcklqdq xmm0, xmm1, xmm0
0x100150cc7: vmovdqa xmmword ptr [rip + 0x1c85fa1], xmm0 ; 0x101dd6c70
0x100150ccf: lea rdx, [rip + 0x1c85f9a] ; 0x101dd6c70
0x100150cd6: mov qword ptr [rip + 0x1c85f9f], 0 ; 0x101dd6c80
0x100150ce1: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100150ce6: vmovaps xmmword ptr [rip + 0x1c85fa2], xmm0 ; 0x101dd6c90
0x100150cee: lea rsi, [rip + 0x1c85f9b] ; 0x101dd6c90
0x100150cf5: mov rcx, qword ptr [rip + 0xb3377c] ; 0x100c84478
0x100150cfc: mov qword ptr [rip + 0x1c85f9d], rcx ; 0x101dd6ca0
0x100150d03: vmovaps xmmword ptr [rip + 0x1c85fa5], xmm0 ; 0x101dd6cb0
0x100150d0b: lea rcx, [rip + 0x1c85f9e] ; 0x101dd6cb0
0x100150d12: mov qword ptr [rip + 0x1c85fa7], rax ; 0x101dd6cc0
0x100150d19: vmovaps xmmword ptr [rip + 0x1c85faf], xmm0 ; 0x101dd6cd0
0x100150d21: lea rax, [rip + 0x1c85fa8] ; 0x101dd6cd0
0x100150d28: mov qword ptr [rip + 0x1c85fb1], rdx ; 0x101dd6ce0
0x100150d2f: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x100150d37: vmovaps xmmword ptr [rip + 0x1c85fb1], xmm0 ; 0x101dd6cf0
0x100150d3f: lea rdx, [rip + 0x1c85faa] ; 0x101dd6cf0
0x100150d46: mov rdi, qword ptr [rip + 0xb335eb] ; 0x100c84338
0x100150d4d: mov qword ptr [rip + 0x1c85fac], rdi ; 0x101dd6d00
0x100150d54: mov qword ptr [rip + 0xb335dd], rdx ; 0x100c84338
0x100150d5b: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x100150d60: vmovaps xmmword ptr [rip + 0x1c85fa8], xmm0 ; 0x101dd6d10
0x100150d68: lea rdx, [rip + 0x1c85fa1] ; 0x101dd6d10
0x100150d6f: mov rdi, qword ptr [rip + 0xb33662] ; 0x100c843d8
0x100150d76: mov qword ptr [rip + 0x1c85fa3], rdi ; 0x101dd6d20
0x100150d7d: mov qword ptr [rip + 0xb33654], rdx ; 0x100c843d8
0x100150d84: lea rdx, [rip + 0xa0dc89] ; 0x100b5ea14 NULL
0x100150d8b: vmovq xmm0, rdx
0x100150d90: vmovdqa xmm2, xmmword ptr [rbp - 0x40]
0x100150d95: vpunpcklqdq xmm0, xmm2, xmm0
0x100150d99: vmovdqa xmmword ptr [rip + 0x1c85f8f], xmm0 ; 0x101dd6d30
0x100150da1: lea rdx, [rip + 0x1c85f88] ; 0x101dd6d30
0x100150da8: mov qword ptr [rip + 0x1c85f91], rsi ; 0x101dd6d40
0x100150daf: mov qword ptr [rip + 0xb336c2], rdx ; 0x100c84478
0x100150db6: lea rdx, [rip + 0xa24742] ; 0x100b754ff 0.25
0x100150dbd: vmovq xmm1, rdx
0x100150dc2: vpunpcklqdq xmm1, xmm2, xmm1
0x100150dc6: vmovdqa xmmword ptr [rip + 0x1c85f82], xmm1 ; 0x101dd6d50
0x100150dce: lea rdx, [rip + 0x1c85f7b] ; 0x101dd6d50
0x100150dd5: mov rsi, qword ptr [rip + 0xb336ec] ; 0x100c844c8
0x100150ddc: mov qword ptr [rip + 0x1c85f7d], rsi ; 0x101dd6d60
0x100150de3: mov qword ptr [rip + 0xb336de], rdx ; 0x100c844c8
0x100150dea: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x100150def: vmovaps xmmword ptr [rip + 0x1c85f79], xmm1 ; 0x101dd6d70
0x100150df7: lea rdx, [rip + 0x1c85f72] ; 0x101dd6d70
0x100150dfe: mov rsi, qword ptr [rip + 0xb33713] ; 0x100c84518
0x100150e05: mov qword ptr [rip + 0x1c85f74], rsi ; 0x101dd6d80
0x100150e0c: mov qword ptr [rip + 0xb33705], rdx ; 0x100c84518
0x100150e13: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x100150e1b: vmovaps xmmword ptr [rip + 0x1c85f6d], xmm1 ; 0x101dd6d90
0x100150e23: lea rdx, [rip + 0x1c85f66] ; 0x101dd6d90
0x100150e2a: mov rsi, qword ptr [rip + 0xb33787] ; 0x100c845b8
0x100150e31: mov qword ptr [rip + 0x1c85f68], rsi ; 0x101dd6da0
0x100150e38: mov qword ptr [rip + 0xb33779], rdx ; 0x100c845b8
0x100150e3f: vmovdqa xmmword ptr [rip + 0x1c85f69], xmm0 ; 0x101dd6db0
0x100150e47: lea rdx, [rip + 0x1c85f62] ; 0x101dd6db0
0x100150e4e: mov qword ptr [rip + 0x1c85f6b], rcx ; 0x101dd6dc0
0x100150e55: mov qword ptr [rip + 0xb3348c], rdx ; 0x100c842e8
0x100150e5c: lea rcx, [rip + 0xa1389b] ; 0x100b646fe 5.0f
0x100150e63: vmovq xmm0, rcx
0x100150e68: vmovdqa xmm1, xmm2
0x100150e6c: vpunpcklqdq xmm0, xmm1, xmm0
0x100150e70: vmovdqa xmmword ptr [rip + 0x1c85f58], xmm0 ; 0x101dd6dd0
0x100150e78: lea rcx, [rip + 0x1c85f51] ; 0x101dd6dd0
0x100150e7f: mov rdx, qword ptr [rip + 0xb33782] ; 0x100c84608
0x100150e86: mov qword ptr [rip + 0x1c85f53], rdx ; 0x101dd6de0
0x100150e8d: mov qword ptr [rip + 0xb33774], rcx ; 0x100c84608
0x100150e94: lea rcx, [rip + 0xa24669] ; 0x100b75504 0.5f
0x100150e9b: vmovq xmm0, rcx
0x100150ea0: vpunpcklqdq xmm0, xmm1, xmm0
0x100150ea4: vmovdqa xmmword ptr [rip + 0x1c85f44], xmm0 ; 0x101dd6df0
0x100150eac: lea rcx, [rip + 0x1c85f3d] ; 0x101dd6df0
0x100150eb3: mov qword ptr [rip + 0x1c85f42], 0 ; 0x101dd6e00
0x100150ebe: mov qword ptr [rip + 0xb33793], rcx ; 0x100c84658
0x100150ec5: lea rcx, [rip + 0xa0fd6b] ; 0x100b60c37 1.0f
0x100150ecc: vmovq xmm0, rcx
0x100150ed1: vpunpcklqdq xmm0, xmm1, xmm0
0x100150ed5: vmovdqa xmmword ptr [rip + 0x1c85f33], xmm0 ; 0x101dd6e10
0x100150edd: lea rcx, [rip + 0x1c85f2c] ; 0x101dd6e10
0x100150ee4: mov qword ptr [rip + 0x1c85f31], 0 ; 0x101dd6e20
0x100150eef: mov qword ptr [rip + 0xb337b2], rcx ; 0x100c846a8
0x100150ef6: lea rcx, [rip + 0xa0db3c] ; 0x100b5ea39 0.0f
0x100150efd: vmovq xmm0, rcx
0x100150f02: vpunpcklqdq xmm0, xmm1, xmm0
0x100150f06: vmovdqa xmmword ptr [rip + 0x1c85f22], xmm0 ; 0x101dd6e30
0x100150f0e: lea rcx, [rip + 0x1c85f1b] ; 0x101dd6e30
0x100150f15: mov rdx, qword ptr [rip + 0xb3350c] ; 0x100c84428
0x100150f1c: mov qword ptr [rip + 0x1c85f1d], rdx ; 0x101dd6e40
0x100150f23: mov qword ptr [rip + 0xb334fe], rcx ; 0x100c84428
0x100150f2a: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x100150f2f: vmovaps xmmword ptr [rip + 0x1c85f19], xmm0 ; 0x101dd6e50
0x100150f37: lea rcx, [rip + 0x1c85f12] ; 0x101dd6e50
0x100150f3e: mov qword ptr [rip + 0x1c85f1b], rax ; 0x101dd6e60
0x100150f45: mov qword ptr [rip + 0xb337ac], rcx ; 0x100c846f8
0x100150f4c: lea rax, [rip + 0xa245b6] ; 0x100b75509 AvatarLookAt
0x100150f53: mov qword ptr [rip + 0x1c85f16], rax ; 0x101dd6e70
0x100150f5a: lea rax, [rip + 0x1c85f07] ; 0x101dd6e68
0x100150f61: mov qword ptr [rip + 0x1c85f0c], 0 ; 0x101dd6e78
0x100150f6c: mov rcx, qword ptr [rip + 0xb1efe5] ; 0x100c6ff58
0x100150f73: mov qword ptr [rip + 0x1c85f06], rcx ; 0x101dd6e80
0x100150f7a: mov qword ptr [rip + 0xb1efd7], rax ; 0x100c6ff58
0x100150f81: mov qword ptr [rip + 0x1c85f08], rax ; 0x101dd6e90
0x100150f88: mov r12, r14
0x100150f8b: mov qword ptr [rip + 0x1c85f06], r12 ; 0x101dd6e98
0x100150f92: mov dword ptr [rip + 0x1c85f04], 0xffffffff ; 0x101dd6ea0
0x100150f9c: mov dword ptr [rip + 0x1c85efe], 0xffffffff ; 0x101dd6ea4
0x100150fa6: mov qword ptr [rip + 0x1c85f0f], 0 ; 0x101dd6ec0
0x100150fb1: mov rax, qword ptr [rip + 0xab9ec0] ; 0x100c0ae78
0x100150fb8: add rax, 0x10
0x100150fbc: mov qword ptr [rip + 0x1c85ea5], rax ; 0x101dd6e68
0x100150fc3: xor eax, eax
0x100150fc5: call 0x100011c10 ; 0x100011c10
0x100150fca: lea r14, [rip + 0xa0e71e] ; 0x100b5f6ef duration
0x100150fd1: mov qword ptr [rip + 0xb33768], r14 ; 0x100c84740
0x100150fd8: lea rax, [rip + 0xb33761] ; 0x100c84740
0x100150fdf: mov rcx, qword ptr [rip + 0xb26c7a] ; 0x100c77c60
0x100150fe6: mov qword ptr [rip + 0xb33763], rcx ; 0x100c84750
0x100150fed: mov qword ptr [rip + 0xb33768], 0x38 ; 0x100c84760
0x100150ff8: mov qword ptr [rip + 0xb33769], r13 ; 0x100c84768
0x100150fff: mov rcx, qword ptr [rip + 0xab694a] ; 0x100c07950 -> 0x10014ee20 __Z18GetMetaClassByTypeIP12AvatarLookAtERK9MetaClassv
0x100151006: mov qword ptr [rip + 0xb33763], rcx ; 0x100c84770
0x10015100d: mov qword ptr [rip + 0xb33760], 0xffffffffffffffff ; 0x100c84778
0x100151018: mov qword ptr [rip + 0xb33761], rbx ; 0x100c84780
0x10015101f: mov qword ptr [rip + 0xb3375e], 0 ; 0x100c84788
0x10015102a: lea rdx, [rip + 0xa244e5] ; 0x100b75516 3.0
0x100151031: vmovq xmm0, rdx
0x100151036: vmovdqa xmm1, xmmword ptr [rbp - 0x40]
0x10015103b: vpunpcklqdq xmm0, xmm1, xmm0
0x10015103f: vmovdqa xmmword ptr [rip + 0x1c85e89], xmm0 ; 0x101dd6ed0
0x100151047: lea rdx, [rip + 0x1c85e82] ; 0x101dd6ed0
0x10015104e: mov qword ptr [rip + 0x1c85e87], 0 ; 0x101dd6ee0
0x100151059: mov qword ptr [rip + 0xb336e8], rdx ; 0x100c84748
0x100151060: lea rdx, [rip + 0xa21ab5] ; 0x100b72b1c target
0x100151067: mov qword ptr [rip + 0xb33722], rdx ; 0x100c84790
0x10015106e: lea rdx, [rip + 0xb3371b] ; 0x100c84790
0x100151075: mov qword ptr [rip + 0xb33724], rax ; 0x100c847a0
0x10015107c: mov qword ptr [rip + 0xb26bdd], rdx ; 0x100c77c60
0x100151083: mov qword ptr [rip + 0xb33722], 0x40 ; 0x100c847b0
0x10015108e: mov rax, qword ptr [rip + 0xab629b] ; 0x100c07330 -> 0x100148fe0 __Z17GetMetaTypeByTypeIP6ObjectERK8MetaTypev
0x100151095: mov qword ptr [rip + 0xb3371c], rax ; 0x100c847b8
0x10015109c: mov qword ptr [rip + 0xb3371d], rcx ; 0x100c847c0
0x1001510a3: mov qword ptr [rip + 0xb3371a], 0xffffffffffffffff ; 0x100c847c8
0x1001510ae: mov qword ptr [rip + 0xb3371b], rbx ; 0x100c847d0
0x1001510b5: mov qword ptr [rip + 0xb33718], 0 ; 0x100c847d8
0x1001510c0: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1001510c5: vmovaps xmmword ptr [rip + 0x1c85e23], xmm0 ; 0x101dd6ef0
0x1001510cd: lea rax, [rip + 0x1c85e1c] ; 0x101dd6ef0
0x1001510d4: mov qword ptr [rip + 0x1c85e21], 0 ; 0x101dd6f00
0x1001510df: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1001510e4: vmovaps xmmword ptr [rip + 0x1c85e24], xmm0 ; 0x101dd6f10
0x1001510ec: lea rcx, [rip + 0x1c85e1d] ; 0x101dd6f10
0x1001510f3: mov qword ptr [rip + 0x1c85e26], rax ; 0x101dd6f20
0x1001510fa: mov qword ptr [rip + 0xb33697], rcx ; 0x100c84798
0x100151101: lea rax, [rip + 0xa24412] ; 0x100b7551a AvatarHijack
0x100151108: mov qword ptr [rip + 0x1c85e21], rax ; 0x101dd6f30
0x10015110f: lea rax, [rip + 0x1c85e12] ; 0x101dd6f28
0x100151116: mov qword ptr [rip + 0x1c85e17], 0 ; 0x101dd6f38
0x100151121: mov rcx, qword ptr [rip + 0xb1ee30] ; 0x100c6ff58
0x100151128: mov qword ptr [rip + 0x1c85e11], rcx ; 0x101dd6f40
0x10015112f: mov qword ptr [rip + 0xb1ee22], rax ; 0x100c6ff58
0x100151136: mov qword ptr [rip + 0x1c85e13], rax ; 0x101dd6f50
0x10015113d: mov qword ptr [rip + 0x1c85e14], r12 ; 0x101dd6f58
0x100151144: mov dword ptr [rip + 0x1c85e12], 0xffffffff ; 0x101dd6f60
0x10015114e: mov dword ptr [rip + 0x1c85e0c], 0xffffffff ; 0x101dd6f64
0x100151158: mov qword ptr [rip + 0x1c85e1d], 0 ; 0x101dd6f80
0x100151163: mov rax, qword ptr [rip + 0xab9d06] ; 0x100c0ae70
0x10015116a: add rax, 0x10
0x10015116e: mov qword ptr [rip + 0x1c85db3], rax ; 0x101dd6f28
0x100151175: xor eax, eax
0x100151177: call 0x100011c10 ; 0x100011c10
0x10015117c: mov qword ptr [rip + 0xb3365d], r14 ; 0x100c847e0
0x100151183: lea rax, [rip + 0xb33656] ; 0x100c847e0
0x10015118a: mov rcx, qword ptr [rip + 0xb26acf] ; 0x100c77c60
0x100151191: mov qword ptr [rip + 0xb33658], rcx ; 0x100c847f0
0x100151198: mov qword ptr [rip + 0xb3365d], 0x38 ; 0x100c84800
0x1001511a3: mov qword ptr [rip + 0xb3365e], r13 ; 0x100c84808
0x1001511aa: mov rcx, qword ptr [rip + 0xab6797] ; 0x100c07948 -> 0x10014f2a0 __Z18GetMetaClassByTypeIP12AvatarHijackERK9MetaClassv
0x1001511b1: mov qword ptr [rip + 0xb33658], rcx ; 0x100c84810
0x1001511b8: mov qword ptr [rip + 0xb33655], 0xffffffffffffffff ; 0x100c84818
0x1001511c3: mov qword ptr [rip + 0xb33656], rbx ; 0x100c84820
0x1001511ca: mov qword ptr [rip + 0xb33653], 0 ; 0x100c84828
0x1001511d5: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x1001511dd: vmovaps xmmword ptr [rip + 0x1c85dab], xmm0 ; 0x101dd6f90
0x1001511e5: lea rdx, [rip + 0x1c85da4] ; 0x101dd6f90
0x1001511ec: mov qword ptr [rip + 0x1c85da9], 0 ; 0x101dd6fa0
0x1001511f7: mov qword ptr [rip + 0xb335ea], rdx ; 0x100c847e8
0x1001511fe: lea rdx, [rip + 0xa24322] ; 0x100b75527 restoreState
0x100151205: mov qword ptr [rip + 0xb33624], rdx ; 0x100c84830
0x10015120c: lea rdx, [rip + 0xb3361d] ; 0x100c84830
0x100151213: mov qword ptr [rip + 0xb33626], rax ; 0x100c84840
0x10015121a: mov qword ptr [rip + 0xb26a3f], rdx ; 0x100c77c60
0x100151221: mov qword ptr [rip + 0xb33624], 0x3c ; 0x100c84850
0x10015122c: mov qword ptr [rip + 0xb33625], r15 ; 0x100c84858
0x100151233: mov qword ptr [rip + 0xb33626], rcx ; 0x100c84860
0x10015123a: mov qword ptr [rip + 0xb33623], 0xffffffffffffffff ; 0x100c84868
0x100151245: mov qword ptr [rip + 0xb33624], rbx ; 0x100c84870
0x10015124c: mov qword ptr [rip + 0xb33621], 0 ; 0x100c84878
0x100151257: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10015125c: vmovaps xmmword ptr [rip + 0x1c85d4c], xmm0 ; 0x101dd6fb0
0x100151264: lea rax, [rip + 0x1c85d45] ; 0x101dd6fb0
0x10015126b: mov qword ptr [rip + 0x1c85d4a], 0 ; 0x101dd6fc0
0x100151276: mov qword ptr [rip + 0xb335bb], rax ; 0x100c84838
0x10015127d: add rsp, 0x98
0x100151284: pop rbx
0x100151285: pop r12
0x100151287: pop r13
0x100151289: pop r14
0x10015128b: pop r15
0x10015128d: pop rbp
0x10015128e: ret 
0x10015128f: nop 
