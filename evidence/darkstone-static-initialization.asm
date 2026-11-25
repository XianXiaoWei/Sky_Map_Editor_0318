0x100280bc0: push rbp
0x100280bc1: mov rbp, rsp
0x100280bc4: push r15
0x100280bc6: push r14
0x100280bc8: push r12
0x100280bca: push rbx
0x100280bcb: mov dword ptr [rip + 0xaaa8ab], 0 ; 0x100d2b480
0x100280bd5: lea rax, [rip + 0x8fc34d] ; 0x100b7cf29 kDrawClosest
0x100280bdc: mov qword ptr [rip + 0x1b67205], rax ; 0x101de7de8
0x100280be3: lea rax, [rip + 0x1b671fe] ; 0x101de7de8
0x100280bea: mov rcx, qword ptr [rip + 0xa0f0af] ; 0x100c8fca0
0x100280bf1: mov qword ptr [rip + 0x1b67200], rcx ; 0x101de7df8
0x100280bf8: lea rcx, [rip + 0x1b671e1] ; 0x101de7de0
0x100280bff: vmovq xmm1, rcx
0x100280c04: lea rcx, [rip + 0x8fc32b] ; 0x100b7cf36 Darkstone.cpp
0x100280c0b: vmovq xmm0, rcx
0x100280c10: vpunpcklqdq xmm1, xmm0, xmm1
0x100280c14: vmovdqu xmmword ptr [rip + 0x1b671ec], xmm1 ; 0x101de7e08
0x100280c1c: mov r12, qword ptr [rip + 0x986935] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x100280c23: mov qword ptr [rip + 0x1b671ee], r12 ; 0x101de7e18
0x100280c2a: mov qword ptr [rip + 0x1b671eb], 0 ; 0x101de7e20
0x100280c35: lea rbx, [rip - 0x26721c] ; 0x100019a20
0x100280c3c: mov qword ptr [rip + 0x1b671e5], rbx ; 0x101de7e28
0x100280c43: mov qword ptr [rip + 0x1b671e2], 0 ; 0x101de7e30
0x100280c4e: lea r15, [rip + 0x8fc2ef] ; 0x100b7cf44 Darkstone
0x100280c55: vmovq xmm2, r15
0x100280c5a: lea rdx, [rip + 0x8dd3bc] ; 0x100b5e01d TweakCategory
0x100280c61: vmovq xmm1, rdx
0x100280c66: vpunpcklqdq xmm2, xmm1, xmm2
0x100280c6a: vmovdqa xmmword ptr [rip + 0x1b671ce], xmm2 ; 0x101de7e40
0x100280c72: lea rdx, [rip + 0x1b671c7] ; 0x101de7e40
0x100280c79: mov qword ptr [rip + 0x1b671cc], 0 ; 0x101de7e50
0x100280c84: mov qword ptr [rip + 0x1b67165], rdx ; 0x101de7df0
0x100280c8b: lea rdx, [rip + 0x8fc2bc] ; 0x100b7cf4e kHp
0x100280c92: mov qword ptr [rip + 0x1b671bf], rdx ; 0x101de7e58
0x100280c99: lea rdx, [rip + 0x1b671b8] ; 0x101de7e58
0x100280ca0: mov qword ptr [rip + 0x1b671c1], rax ; 0x101de7e68
0x100280ca7: mov qword ptr [rip + 0x1b671ca], rcx ; 0x101de7e78
0x100280cae: lea rax, [rip + 0xa1e6ab] ; 0x100c9f360
0x100280cb5: mov qword ptr [rip + 0x1b671c4], rax ; 0x101de7e80
0x100280cbc: mov rax, qword ptr [rip + 0x98689d] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x100280cc3: mov qword ptr [rip + 0x1b671be], rax ; 0x101de7e88
0x100280cca: mov qword ptr [rip + 0x1b671bb], 0 ; 0x101de7e90
0x100280cd5: mov qword ptr [rip + 0x1b671bc], rbx ; 0x101de7e98
0x100280cdc: mov qword ptr [rip + 0x1b671b9], 0 ; 0x101de7ea0
0x100280ce7: vmovdqa xmmword ptr [rip + 0x1b671c1], xmm2 ; 0x101de7eb0
0x100280cef: lea rax, [rip + 0x1b671ba] ; 0x101de7eb0
0x100280cf6: mov qword ptr [rip + 0x1b671bf], 0 ; 0x101de7ec0
0x100280d01: lea rcx, [rip + 0x8fc24a] ; 0x100b7cf52 0.01 1.0
0x100280d08: vmovq xmm3, rcx
0x100280d0d: lea rcx, [rip + 0x8df43a] ; 0x100b6014e TweakRange
0x100280d14: vmovq xmm4, rcx
0x100280d19: vpunpcklqdq xmm3, xmm4, xmm3
0x100280d1d: vmovdqa xmmword ptr [rip + 0x1b671ab], xmm3 ; 0x101de7ed0
0x100280d25: lea rcx, [rip + 0x1b671a4] ; 0x101de7ed0
0x100280d2c: mov qword ptr [rip + 0x1b671ad], rax ; 0x101de7ee0
0x100280d33: mov qword ptr [rip + 0x1b67126], rcx ; 0x101de7e60
0x100280d3a: lea rax, [rip + 0x8fc21a] ; 0x100b7cf5b kUseFakeWax
0x100280d41: mov qword ptr [rip + 0x1b671a8], rax ; 0x101de7ef0
0x100280d48: lea rax, [rip + 0x1b671a1] ; 0x101de7ef0
0x100280d4f: mov qword ptr [rip + 0x1b671aa], rdx ; 0x101de7f00
0x100280d56: lea rcx, [rip + 0x1b6718b] ; 0x101de7ee8
0x100280d5d: vmovq xmm3, rcx
0x100280d62: vpunpcklqdq xmm3, xmm0, xmm3
0x100280d66: vmovdqu xmmword ptr [rip + 0x1b671a2], xmm3 ; 0x101de7f10
0x100280d6e: mov qword ptr [rip + 0x1b671ab], r12 ; 0x101de7f20
0x100280d75: mov qword ptr [rip + 0x1b671a8], 0 ; 0x101de7f28
0x100280d80: mov qword ptr [rip + 0x1b671a9], rbx ; 0x101de7f30
0x100280d87: mov qword ptr [rip + 0x1b671a6], 0 ; 0x101de7f38
0x100280d92: vmovdqa xmmword ptr [rip + 0x1b671a6], xmm2 ; 0x101de7f40
0x100280d9a: lea rcx, [rip + 0x1b6719f] ; 0x101de7f40
0x100280da1: mov qword ptr [rip + 0x1b671a4], 0 ; 0x101de7f50
0x100280dac: mov qword ptr [rip + 0x1b67145], rcx ; 0x101de7ef8
0x100280db3: lea rcx, [rip + 0x8fc1ad] ; 0x100b7cf67 kDrawDebugHierarchyLines
0x100280dba: mov qword ptr [rip + 0x1b6719f], rcx ; 0x101de7f60
0x100280dc1: lea rcx, [rip + 0x1b67198] ; 0x101de7f60
0x100280dc8: mov qword ptr [rip + 0x1b671a1], rax ; 0x101de7f70
0x100280dcf: lea rax, [rip + 0x1b67182] ; 0x101de7f58
0x100280dd6: vmovq xmm3, rax
0x100280ddb: vpunpcklqdq xmm3, xmm0, xmm3
0x100280ddf: vmovdqu xmmword ptr [rip + 0x1b67199], xmm3 ; 0x101de7f80
0x100280de7: mov qword ptr [rip + 0x1b671a2], r12 ; 0x101de7f90
0x100280dee: mov qword ptr [rip + 0x1b6719f], 0 ; 0x101de7f98
0x100280df9: mov qword ptr [rip + 0x1b671a0], rbx ; 0x101de7fa0
0x100280e00: mov qword ptr [rip + 0x1b6719d], 0 ; 0x101de7fa8
0x100280e0b: vmovdqa xmmword ptr [rip + 0x1b6719d], xmm2 ; 0x101de7fb0
0x100280e13: lea rax, [rip + 0x1b67196] ; 0x101de7fb0
0x100280e1a: mov qword ptr [rip + 0x1b6719b], 0 ; 0x101de7fc0
0x100280e25: mov qword ptr [rip + 0x1b6713c], rax ; 0x101de7f68
0x100280e2c: lea rax, [rip + 0x8fc14d] ; 0x100b7cf80 kFastBurn
0x100280e33: mov qword ptr [rip + 0x1b67196], rax ; 0x101de7fd0
0x100280e3a: lea rax, [rip + 0x1b6718f] ; 0x101de7fd0
0x100280e41: mov qword ptr [rip + 0x1b67198], rcx ; 0x101de7fe0
0x100280e48: lea rcx, [rip + 0x1b67179] ; 0x101de7fc8
0x100280e4f: vmovq xmm3, rcx
0x100280e54: vpunpcklqdq xmm3, xmm0, xmm3
0x100280e58: vmovdqu xmmword ptr [rip + 0x1b67190], xmm3 ; 0x101de7ff0
0x100280e60: mov qword ptr [rip + 0x1b67199], r12 ; 0x101de8000
0x100280e67: mov qword ptr [rip + 0x1b67196], 0 ; 0x101de8008
0x100280e72: mov qword ptr [rip + 0x1b67197], rbx ; 0x101de8010
0x100280e79: mov qword ptr [rip + 0x1b67194], 0 ; 0x101de8018
0x100280e84: vmovdqa xmmword ptr [rip + 0x1b67194], xmm2 ; 0x101de8020
0x100280e8c: lea rcx, [rip + 0x1b6718d] ; 0x101de8020
0x100280e93: mov qword ptr [rip + 0x1b67192], 0 ; 0x101de8030
0x100280e9e: mov qword ptr [rip + 0x1b67133], rcx ; 0x101de7fd8
0x100280ea5: lea rcx, [rip + 0x8fc0de] ; 0x100b7cf8a kShowDarkstoneInfo
0x100280eac: mov qword ptr [rip + 0x1b6718d], rcx ; 0x101de8040
0x100280eb3: lea rcx, [rip + 0x1b67186] ; 0x101de8040
0x100280eba: mov qword ptr [rip + 0x1b6718f], rax ; 0x101de8050
0x100280ec1: mov qword ptr [rip + 0xa0edd8], rcx ; 0x100c8fca0
0x100280ec8: lea rax, [rip + 0x1b67169] ; 0x101de8038
0x100280ecf: vmovq xmm2, rax
0x100280ed4: vpunpcklqdq xmm0, xmm0, xmm2
0x100280ed8: vmovdqu xmmword ptr [rip + 0x1b67180], xmm0 ; 0x101de8060
0x100280ee0: mov qword ptr [rip + 0x1b67189], r12 ; 0x101de8070
0x100280ee7: mov qword ptr [rip + 0x1b67186], 0 ; 0x101de8078
0x100280ef2: mov qword ptr [rip + 0x1b67187], rbx ; 0x101de8080
0x100280ef9: mov qword ptr [rip + 0x1b67184], 0 ; 0x101de8088
0x100280f04: lea rax, [rip + 0x8e0f27] ; 0x100b61e32 Debug
0x100280f0b: vmovq xmm0, rax
0x100280f10: vpunpcklqdq xmm0, xmm1, xmm0
0x100280f14: vmovdqa xmmword ptr [rip + 0x1b67174], xmm0 ; 0x101de8090
0x100280f1c: lea rax, [rip + 0x1b6716d] ; 0x101de8090
0x100280f23: mov qword ptr [rip + 0x1b67172], 0 ; 0x101de80a0
0x100280f2e: mov qword ptr [rip + 0x1b67113], rax ; 0x101de8048
0x100280f35: vmovaps xmm0, xmmword ptr [rip + 0x8341c3] ; 0x100ab5100
0x100280f3d: vmovaps xmmword ptr [rip + 0xaaa54b], xmm0 ; 0x100d2b490
0x100280f45: vmovaps xmm0, xmmword ptr [rip + 0x8341c3] ; 0x100ab5110
0x100280f4d: vmovaps xmmword ptr [rip + 0xaaa54b], xmm0 ; 0x100d2b4a0
0x100280f55: vmovaps xmm0, xmmword ptr [rip + 0x8341c3] ; 0x100ab5120
0x100280f5d: vmovaps xmmword ptr [rip + 0xaaa54b], xmm0 ; 0x100d2b4b0
0x100280f65: vmovaps xmm0, xmmword ptr [rip + 0x8341c3] ; 0x100ab5130
0x100280f6d: vmovaps xmmword ptr [rip + 0xaaa54b], xmm0 ; 0x100d2b4c0
0x100280f75: vmovaps xmm0, xmmword ptr [rip + 0x8341c3] ; 0x100ab5140
0x100280f7d: vmovaps xmmword ptr [rip + 0xaaa54b], xmm0 ; 0x100d2b4d0
0x100280f85: vmovaps xmm0, xmmword ptr [rip + 0x8341c3] ; 0x100ab5150
0x100280f8d: vmovaps xmmword ptr [rip + 0xaaa54b], xmm0 ; 0x100d2b4e0
0x100280f95: lea r14, [rip + 0x8e0a90] ; 0x100b61a2c SoulTrap
0x100280f9c: mov qword ptr [rip + 0x1b6710d], r14 ; 0x101de80b0
0x100280fa3: lea rax, [rip + 0x1b670fe] ; 0x101de80a8
0x100280faa: mov qword ptr [rip + 0x1b67103], 0 ; 0x101de80b8
0x100280fb5: mov rcx, qword ptr [rip + 0x9eef9c] ; 0x100c6ff58
0x100280fbc: mov qword ptr [rip + 0x1b670fd], rcx ; 0x101de80c0
0x100280fc3: mov qword ptr [rip + 0x9eef8e], rax ; 0x100c6ff58
0x100280fca: mov qword ptr [rip + 0x1b670ff], rax ; 0x101de80d0
0x100280fd1: lea rax, [rip - 0x24b718] ; 0x1000358c0
0x100280fd8: mov qword ptr [rip + 0x1b670f9], rax ; 0x101de80d8
0x100280fdf: mov dword ptr [rip + 0x1b670f7], 0xffffffff ; 0x101de80e0
0x100280fe9: mov dword ptr [rip + 0x1b670f1], 0xffffffff ; 0x101de80e4
0x100280ff3: mov qword ptr [rip + 0x1b67102], 0 ; 0x101de8100
0x100280ffe: mov rax, qword ptr [rip + 0x98b7ab] ; 0x100c0c7b0
0x100281005: add rax, 0x10
0x100281009: mov qword ptr [rip + 0x1b67098], rax ; 0x101de80a8
0x100281010: xor eax, eax
0x100281012: call 0x100011c10 ; 0x100011c10
0x100281017: lea rax, [rip + 0x8df01e] ; 0x100b6003c Tool_Export
0x10028101e: vmovq xmm0, rax
0x100281023: lea rax, [rip + 0x8dd9b5] ; 0x100b5e9df true
0x10028102a: vmovq xmm2, rax
0x10028102f: vpunpcklqdq xmm0, xmm0, xmm2
0x100281033: vmovdqa xmmword ptr [rip + 0x1b670d5], xmm0 ; 0x101de8110
0x10028103b: lea rax, [rip + 0x1b670ce] ; 0x101de8110
0x100281042: mov rcx, qword ptr [rip + 0x1b6706f] ; 0x101de80b8
0x100281049: mov qword ptr [rip + 0x1b670d0], rcx ; 0x101de8120
0x100281050: mov qword ptr [rip + 0x1b67061], rax ; 0x101de80b8
0x100281057: lea rax, [rip + 0x8fbf3f] ; 0x100b7cf9d meshes
0x10028105e: mov qword ptr [rip + 0xa1e303], rax ; 0x100c9f368
0x100281065: lea rdx, [rip + 0xa1e2fc] ; 0x100c9f368
0x10028106c: mov rax, qword ptr [rip + 0x9f6bed] ; 0x100c77c60
0x100281073: mov qword ptr [rip + 0xa1e2fe], rax ; 0x100c9f378
0x10028107a: mov qword ptr [rip + 0xa1e303], 8 ; 0x100c9f388
0x100281085: mov rcx, qword ptr [rip + 0x98623c] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x10028108c: mov qword ptr [rip + 0xa1e2fd], rcx ; 0x100c9f390
0x100281093: mov rax, qword ptr [rip + 0x987826] ; 0x100c088c0 -> 0x10027fa00 __Z18GetMetaClassByTypeIP8SoulTrapERK9MetaClassv
0x10028109a: mov qword ptr [rip + 0xa1e2f7], rax ; 0x100c9f398
0x1002810a1: mov qword ptr [rip + 0xa1e2f4], 0xffffffffffffffff ; 0x100c9f3a0
0x1002810ac: mov qword ptr [rip + 0xa1e2f5], rbx ; 0x100c9f3a8
0x1002810b3: mov qword ptr [rip + 0xa1e2f2], 0 ; 0x100c9f3b0
0x1002810be: lea rsi, [rip + 0x8dff81] ; 0x100b61046 LevelMesh
0x1002810c5: vmovq xmm0, rsi
0x1002810ca: lea rsi, [rip + 0x8dd91b] ; 0x100b5e9ec Tool_ClumpType
0x1002810d1: vmovq xmm1, rsi
0x1002810d6: vpunpcklqdq xmm0, xmm1, xmm0
0x1002810da: vmovdqa xmmword ptr [rip + 0x1b6704e], xmm0 ; 0x101de8130
0x1002810e2: lea rsi, [rip + 0x1b67047] ; 0x101de8130
0x1002810e9: mov qword ptr [rip + 0x1b6704c], 0 ; 0x101de8140
0x1002810f4: mov qword ptr [rip + 0xa1e275], rsi ; 0x100c9f370
0x1002810fb: lea rsi, [rip + 0x8fbea2] ; 0x100b7cfa4 finishFX
0x100281102: mov qword ptr [rip + 0xa1e2af], rsi ; 0x100c9f3b8
0x100281109: lea rsi, [rip + 0xa1e2a8] ; 0x100c9f3b8
0x100281110: mov qword ptr [rip + 0xa1e2b1], rdx ; 0x100c9f3c8
0x100281117: mov qword ptr [rip + 0xa1e2b6], 0x10 ; 0x100c9f3d8
0x100281122: mov qword ptr [rip + 0xa1e2b7], rcx ; 0x100c9f3e0
0x100281129: mov qword ptr [rip + 0xa1e2b8], rax ; 0x100c9f3e8
0x100281130: mov qword ptr [rip + 0xa1e2b5], 0xffffffffffffffff ; 0x100c9f3f0
0x10028113b: mov qword ptr [rip + 0xa1e2b6], rbx ; 0x100c9f3f8
0x100281142: mov qword ptr [rip + 0xa1e2b3], 0 ; 0x100c9f400
0x10028114d: lea rdx, [rip + 0x8dd8a7] ; 0x100b5e9fb Object
0x100281154: vmovq xmm0, rdx
0x100281159: vpunpcklqdq xmm4, xmm1, xmm0
0x10028115d: vmovdqa xmmword ptr [rip + 0x1b66feb], xmm4 ; 0x101de8150
0x100281165: lea rdx, [rip + 0x1b66fe4] ; 0x101de8150
0x10028116c: mov qword ptr [rip + 0x1b66fe9], 0 ; 0x101de8160
0x100281177: lea rdi, [rip + 0x8dd89b] ; 0x100b5ea19 Tool_Nullable
0x10028117e: vmovq xmm0, rdi
0x100281183: vpunpcklqdq xmm0, xmm0, xmm2
0x100281187: vmovdqa xmmword ptr [rip + 0x1b66fe1], xmm0 ; 0x101de8170
0x10028118f: lea rdi, [rip + 0x1b66fda] ; 0x101de8170
0x100281196: mov qword ptr [rip + 0x1b66fe3], rdx ; 0x101de8180
0x10028119d: lea rdx, [rip + 0x8dd8f3] ; 0x100b5ea97 null
0x1002811a4: vmovq xmm1, rdx
0x1002811a9: lea rdx, [rip + 0x8dd852] ; 0x100b5ea02 Tool_DefaultValue
0x1002811b0: vmovq xmm3, rdx
0x1002811b5: vpunpcklqdq xmm1, xmm3, xmm1
0x1002811b9: vmovdqa xmmword ptr [rip + 0x1b66fcf], xmm1 ; 0x101de8190
0x1002811c1: lea rdx, [rip + 0x1b66fc8] ; 0x101de8190
0x1002811c8: mov qword ptr [rip + 0x1b66fd1], rdi ; 0x101de81a0
0x1002811cf: mov qword ptr [rip + 0xa1e1ea], rdx ; 0x100c9f3c0
0x1002811d6: lea rdx, [rip + 0x8fbdd0] ; 0x100b7cfad onKilled
0x1002811dd: mov qword ptr [rip + 0xa1e224], rdx ; 0x100c9f408
0x1002811e4: lea rdx, [rip + 0xa1e21d] ; 0x100c9f408
0x1002811eb: mov qword ptr [rip + 0xa1e226], rsi ; 0x100c9f418
0x1002811f2: mov qword ptr [rip + 0xa1e22b], 0x18 ; 0x100c9f428
0x1002811fd: mov qword ptr [rip + 0xa1e22c], rcx ; 0x100c9f430
0x100281204: mov qword ptr [rip + 0xa1e22d], rax ; 0x100c9f438
0x10028120b: mov qword ptr [rip + 0xa1e22a], 0xffffffffffffffff ; 0x100c9f440
0x100281216: mov qword ptr [rip + 0xa1e22b], rbx ; 0x100c9f448
0x10028121d: mov qword ptr [rip + 0xa1e228], 0 ; 0x100c9f450
0x100281228: vmovdqa xmmword ptr [rip + 0x1b66f80], xmm4 ; 0x101de81b0
0x100281230: lea rcx, [rip + 0x1b66f79] ; 0x101de81b0
0x100281237: mov qword ptr [rip + 0x1b66f7e], 0 ; 0x101de81c0
0x100281242: vmovdqa xmmword ptr [rip + 0x1b66f86], xmm0 ; 0x101de81d0
0x10028124a: lea rsi, [rip + 0x1b66f7f] ; 0x101de81d0
0x100281251: mov qword ptr [rip + 0x1b66f88], rcx ; 0x101de81e0
0x100281258: vmovdqa xmmword ptr [rip + 0x1b66f90], xmm1 ; 0x101de81f0
0x100281260: lea rcx, [rip + 0x1b66f89] ; 0x101de81f0
0x100281267: mov qword ptr [rip + 0x1b66f92], rsi ; 0x101de8200
0x10028126e: mov qword ptr [rip + 0xa1e19b], rcx ; 0x100c9f410
0x100281275: lea rcx, [rip + 0x8fbd3a] ; 0x100b7cfb6 useHierarchy
0x10028127c: mov qword ptr [rip + 0xa1e1d5], rcx ; 0x100c9f458
0x100281283: lea rcx, [rip + 0xa1e1ce] ; 0x100c9f458
0x10028128a: mov qword ptr [rip + 0xa1e1d7], rdx ; 0x100c9f468
0x100281291: mov qword ptr [rip + 0xa1e1dc], 0x20 ; 0x100c9f478
0x10028129c: mov qword ptr [rip + 0xa1e1dd], r12 ; 0x100c9f480
0x1002812a3: mov qword ptr [rip + 0xa1e1de], rax ; 0x100c9f488
0x1002812aa: mov qword ptr [rip + 0xa1e1db], 0xffffffffffffffff ; 0x100c9f490
0x1002812b5: mov qword ptr [rip + 0xa1e1dc], rbx ; 0x100c9f498
0x1002812bc: mov qword ptr [rip + 0xa1e1d9], 0 ; 0x100c9f4a0
0x1002812c7: vpunpcklqdq xmm2, xmm3, xmm2
0x1002812cb: vmovdqa xmmword ptr [rip + 0x1b66f3d], xmm2 ; 0x101de8210
0x1002812d3: lea rdx, [rip + 0x1b66f36] ; 0x101de8210
0x1002812da: mov qword ptr [rip + 0x1b66f3b], 0 ; 0x101de8220
0x1002812e5: mov qword ptr [rip + 0xa1e174], rdx ; 0x100c9f460
0x1002812ec: lea rdx, [rip + 0x8fbcd0] ; 0x100b7cfc3 rootKillable
0x1002812f3: mov qword ptr [rip + 0xa1e1ae], rdx ; 0x100c9f4a8
0x1002812fa: lea rdx, [rip + 0xa1e1a7] ; 0x100c9f4a8
0x100281301: mov qword ptr [rip + 0xa1e1b0], rcx ; 0x100c9f4b8
0x100281308: mov qword ptr [rip + 0xa1e1b5], 0x21 ; 0x100c9f4c8
0x100281313: mov qword ptr [rip + 0xa1e1b6], r12 ; 0x100c9f4d0
0x10028131a: mov qword ptr [rip + 0xa1e1b7], rax ; 0x100c9f4d8
0x100281321: mov qword ptr [rip + 0xa1e1b4], 0xffffffffffffffff ; 0x100c9f4e0
0x10028132c: mov qword ptr [rip + 0xa1e1b5], rbx ; 0x100c9f4e8
0x100281333: mov qword ptr [rip + 0xa1e1b2], 0 ; 0x100c9f4f0
0x10028133e: vmovdqa xmmword ptr [rip + 0x1b66eea], xmm2 ; 0x101de8230
0x100281346: lea rcx, [rip + 0x1b66ee3] ; 0x101de8230
0x10028134d: mov qword ptr [rip + 0x1b66ee8], 0 ; 0x101de8240
0x100281358: mov qword ptr [rip + 0xa1e151], rcx ; 0x100c9f4b0
0x10028135f: lea rcx, [rip + 0x8fbc6a] ; 0x100b7cfd0 darkstoneLevel
0x100281366: mov qword ptr [rip + 0xa1e18b], rcx ; 0x100c9f4f8
0x10028136d: lea rcx, [rip + 0xa1e184] ; 0x100c9f4f8
0x100281374: mov qword ptr [rip + 0xa1e18d], rdx ; 0x100c9f508
0x10028137b: mov qword ptr [rip + 0xa1e192], 0x24 ; 0x100c9f518
0x100281386: mov rdx, qword ptr [rip + 0x9861eb] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x10028138d: mov qword ptr [rip + 0xa1e18c], rdx ; 0x100c9f520
0x100281394: mov qword ptr [rip + 0xa1e18d], rax ; 0x100c9f528
0x10028139b: mov qword ptr [rip + 0xa1e18a], 0xffffffffffffffff ; 0x100c9f530
0x1002813a6: mov qword ptr [rip + 0xa1e18b], rbx ; 0x100c9f538
0x1002813ad: mov qword ptr [rip + 0xa1e188], 0 ; 0x100c9f540
0x1002813b8: lea rsi, [rip + 0x8dd73e] ; 0x100b5eafd 1
0x1002813bf: vmovq xmm4, rsi
0x1002813c4: vpunpcklqdq xmm3, xmm3, xmm4
0x1002813c8: vmovdqa xmmword ptr [rip + 0x1b66e80], xmm3 ; 0x101de8250
0x1002813d0: lea rsi, [rip + 0x1b66e79] ; 0x101de8250
0x1002813d7: mov qword ptr [rip + 0x1b66e7e], 0 ; 0x101de8260
0x1002813e2: mov qword ptr [rip + 0xa1e117], rsi ; 0x100c9f500
0x1002813e9: lea rsi, [rip + 0x8f5eca] ; 0x100b772ba bstGuid
0x1002813f0: mov qword ptr [rip + 0xa1e151], rsi ; 0x100c9f548
0x1002813f7: lea rsi, [rip + 0xa1e14a] ; 0x100c9f548
0x1002813fe: mov qword ptr [rip + 0xa1e147], 0 ; 0x100c9f550
0x100281409: mov qword ptr [rip + 0xa1e148], rcx ; 0x100c9f558
0x100281410: mov qword ptr [rip + 0xa1e14d], 0x28 ; 0x100c9f568
0x10028141b: mov qword ptr [rip + 0xa1e14e], rdx ; 0x100c9f570
0x100281422: mov qword ptr [rip + 0xa1e14f], rax ; 0x100c9f578
0x100281429: mov qword ptr [rip + 0xa1e14c], 0xffffffffffffffff ; 0x100c9f580
0x100281434: mov qword ptr [rip + 0xa1e14d], rbx ; 0x100c9f588
0x10028143b: mov qword ptr [rip + 0xa1e14a], 0 ; 0x100c9f590
0x100281446: lea rcx, [rip + 0x8f5c0c] ; 0x100b77059 enabled
0x10028144d: mov qword ptr [rip + 0xa1e144], rcx ; 0x100c9f598
0x100281454: lea rcx, [rip + 0xa1e13d] ; 0x100c9f598
0x10028145b: mov qword ptr [rip + 0xa1e146], rsi ; 0x100c9f5a8
0x100281462: mov qword ptr [rip + 0xa1e14b], 0x38 ; 0x100c9f5b8
0x10028146d: mov qword ptr [rip + 0xa1e14c], r12 ; 0x100c9f5c0
0x100281474: mov qword ptr [rip + 0xa1e14d], rax ; 0x100c9f5c8
0x10028147b: mov qword ptr [rip + 0xa1e14a], 0xffffffffffffffff ; 0x100c9f5d0
0x100281486: mov qword ptr [rip + 0xa1e14b], rbx ; 0x100c9f5d8
0x10028148d: mov qword ptr [rip + 0xa1e148], 0 ; 0x100c9f5e0
0x100281498: vmovdqa xmmword ptr [rip + 0x1b66dd0], xmm2 ; 0x101de8270
0x1002814a0: lea rdx, [rip + 0x1b66dc9] ; 0x101de8270
0x1002814a7: mov qword ptr [rip + 0x1b66dce], 0 ; 0x101de8280
0x1002814b2: mov qword ptr [rip + 0xa1e0e7], rdx ; 0x100c9f5a0
0x1002814b9: lea rdx, [rip + 0x8e3bd6] ; 0x100b65096 collectible
0x1002814c0: mov qword ptr [rip + 0xa1e121], rdx ; 0x100c9f5e8
0x1002814c7: lea rdx, [rip + 0xa1e11a] ; 0x100c9f5e8
0x1002814ce: mov qword ptr [rip + 0xa1e123], rcx ; 0x100c9f5f8
0x1002814d5: mov qword ptr [rip + 0x9f6784], rdx ; 0x100c77c60
0x1002814dc: mov qword ptr [rip + 0xa1e121], 0x30 ; 0x100c9f608
0x1002814e7: mov rcx, qword ptr [rip + 0x985a22] ; 0x100c06f10 -> 0x100088f60 __Z17GetMetaTypeByTypeIP11CollectibleERK8MetaTypev
0x1002814ee: mov qword ptr [rip + 0xa1e11b], rcx ; 0x100c9f610
0x1002814f5: mov qword ptr [rip + 0xa1e11c], rax ; 0x100c9f618
0x1002814fc: mov qword ptr [rip + 0xa1e119], 0xffffffffffffffff ; 0x100c9f620
0x100281507: mov qword ptr [rip + 0xa1e11a], rbx ; 0x100c9f628
0x10028150e: mov qword ptr [rip + 0xa1e117], 0 ; 0x100c9f630
0x100281519: vmovdqa xmmword ptr [rip + 0x1b66d6f], xmm0 ; 0x101de8290
0x100281521: lea rcx, [rip + 0x1b66d68] ; 0x101de8290
0x100281528: mov qword ptr [rip + 0x1b66d6d], 0 ; 0x101de82a0
0x100281533: vmovdqa xmmword ptr [rip + 0x1b66d75], xmm1 ; 0x101de82b0
0x10028153b: lea rdx, [rip + 0x1b66d6e] ; 0x101de82b0
0x100281542: mov qword ptr [rip + 0x1b66d77], rcx ; 0x101de82c0
0x100281549: mov qword ptr [rip + 0xa1e0a0], rdx ; 0x100c9f5f0
0x100281550: lea rcx, [rip + 0x8f5af7] ; 0x100b7704e SetEnabled
0x100281557: mov qword ptr [rip + 0x1b66d6a], rcx ; 0x101de82c8
0x10028155e: lea rcx, [rip + 0x1b66d63] ; 0x101de82c8
0x100281565: mov qword ptr [rip + 0x1b66d60], 0 ; 0x101de82d0
0x100281570: mov rdx, qword ptr [rip + 0x9ee9e9] ; 0x100c6ff60
0x100281577: mov qword ptr [rip + 0x1b66d5a], rdx ; 0x101de82d8
0x10028157e: lea rdx, [rip - 0x7235] ; 0x10027a350
0x100281585: vmovq xmm0, rdx
0x10028158a: vmovdqu xmmword ptr [rip + 0x1b66d6e], xmm0 ; 0x101de8300
0x100281592: mov rdx, qword ptr [rip + 0x9850ff] ; 0x100c06698 -> 0x10027fa10 __Z12ApplyWrapperI8SoulTrapMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x100281599: mov qword ptr [rip + 0x1b66d70], rdx ; 0x101de8310
0x1002815a0: mov rdx, qword ptr [rip + 0x988981] ; 0x100c09f28 -> 0x10027fab0 __Z21InitFunctionSignatureIM8SoulTrapFvbEEvP17FunctionSignature
0x1002815a7: mov qword ptr [rip + 0x1b66d6a], rdx ; 0x101de8318
0x1002815ae: mov qword ptr [rip + 0x1b66d6b], rax ; 0x101de8320
0x1002815b5: lea rdx, [rip + 0x8f1cb7] ; 0x100b73273 GetEnabled
0x1002815bc: mov qword ptr [rip + 0x1b66d65], rdx ; 0x101de8328
0x1002815c3: lea rdx, [rip + 0x1b66d5e] ; 0x101de8328
0x1002815ca: mov qword ptr [rip + 0x1b66d5b], 0 ; 0x101de8330
0x1002815d5: mov qword ptr [rip + 0x1b66d5c], rcx ; 0x101de8338
0x1002815dc: mov qword ptr [rip + 0x9ee97d], rdx ; 0x100c6ff60
0x1002815e3: lea rcx, [rip - 0x728a] ; 0x10027a360
0x1002815ea: vmovq xmm0, rcx
0x1002815ef: vmovdqu xmmword ptr [rip + 0x1b66d69], xmm0 ; 0x101de8360
0x1002815f7: mov rcx, qword ptr [rip + 0x9850a2] ; 0x100c066a0 -> 0x10027fb30 __Z12ApplyWrapperI8SoulTrapMS0_KFbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1002815fe: mov qword ptr [rip + 0x1b66d6b], rcx ; 0x101de8370
0x100281605: mov rcx, qword ptr [rip + 0x988924] ; 0x100c09f30 -> 0x10027fbb0 __Z21InitFunctionSignatureIM8SoulTrapKFbvEEvP17FunctionSignature
0x10028160c: mov qword ptr [rip + 0x1b66d65], rcx ; 0x101de8378
0x100281613: mov qword ptr [rip + 0x1b66d66], rax ; 0x101de8380
0x10028161a: lea rdi, [rip + 0xaa9ecf] ; 0x100d2b4f0
0x100281621: lea rsi, [rip + 0x1b66d60] ; 0x101de8388
0x100281628: lea rdx, [rip + 0x8fb9b0] ; 0x100b7cfdf tag_SoulTrap
0x10028162f: call 0x1007951b0 ; 0x1007951b0
0x100281634: mov qword ptr [rip + 0x1b66d5d], r15 ; 0x101de8398
0x10028163b: lea rax, [rip + 0x1b66d4e] ; 0x101de8390
0x100281642: mov qword ptr [rip + 0x1b66d53], 0 ; 0x101de83a0
0x10028164d: mov rcx, qword ptr [rip + 0x9ee904] ; 0x100c6ff58
0x100281654: mov qword ptr [rip + 0x1b66d4d], rcx ; 0x101de83a8
0x10028165b: mov qword ptr [rip + 0x9ee8f6], rax ; 0x100c6ff58
0x100281662: mov qword ptr [rip + 0x1b66d4f], rax ; 0x101de83b8
0x100281669: mov rax, qword ptr [rip + 0x9862b8] ; 0x100c07928 -> 0x100103d50 __Z18GetMetaClassByTypeIP11WorldObjectERK9MetaClassv
0x100281670: mov qword ptr [rip + 0x1b66d49], rax ; 0x101de83c0
0x100281677: mov qword ptr [rip + 0x1b66d46], 0xffffffffffffffff ; 0x101de83c8
0x100281682: mov qword ptr [rip + 0x1b66d5b], 0 ; 0x101de83e8
0x10028168d: mov rax, qword ptr [rip + 0x98b20c] ; 0x100c0c8a0
0x100281694: add rax, 0x10
0x100281698: mov qword ptr [rip + 0x1b66cf1], rax ; 0x101de8390
0x10028169f: xor eax, eax
0x1002816a1: call 0x100011c10 ; 0x100011c10
0x1002816a6: lea rax, [rip + 0x8f1bbf] ; 0x100b7326c GetObb
0x1002816ad: mov qword ptr [rip + 0x1b66d3c], rax ; 0x101de83f0
0x1002816b4: lea rax, [rip + 0x1b66d35] ; 0x101de83f0
0x1002816bb: mov qword ptr [rip + 0x1b66d32], 0 ; 0x101de83f8
0x1002816c6: mov rcx, qword ptr [rip + 0x9ee893] ; 0x100c6ff60
0x1002816cd: mov qword ptr [rip + 0x1b66d2c], rcx ; 0x101de8400
0x1002816d4: mov ecx, 0x21
0x1002816d9: vmovq xmm0, rcx
0x1002816de: vmovdqu xmmword ptr [rip + 0x1b66d42], xmm0 ; 0x101de8428
0x1002816e6: mov rcx, qword ptr [rip + 0x98517b] ; 0x100c06868 -> 0x10027ff70 __Z12ApplyWrapperI9DarkstoneMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x1002816ed: mov qword ptr [rip + 0x1b66d44], rcx ; 0x101de8438
0x1002816f4: mov rdx, qword ptr [rip + 0x9889fd] ; 0x100c0a0f8 -> 0x100280000 __Z21InitFunctionSignatureIM9DarkstoneKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x1002816fb: mov qword ptr [rip + 0x1b66d3e], rdx ; 0x101de8440
0x100281702: mov rsi, qword ptr [rip + 0x98727f] ; 0x100c08988 -> 0x10027ff60 __Z18GetMetaClassByTypeIP9DarkstoneERK9MetaClassv
0x100281709: mov qword ptr [rip + 0x1b66d38], rsi ; 0x101de8448
0x100281710: lea rdi, [rip + 0x8f1b48] ; 0x100b7325f GetTransform
0x100281717: mov qword ptr [rip + 0x1b66d32], rdi ; 0x101de8450
0x10028171e: lea rdi, [rip + 0x1b66d2b] ; 0x101de8450
0x100281725: mov qword ptr [rip + 0x1b66d28], 0 ; 0x101de8458
0x100281730: mov qword ptr [rip + 0x1b66d29], rax ; 0x101de8460
0x100281737: mov qword ptr [rip + 0x9ee822], rdi ; 0x100c6ff60
0x10028173e: mov eax, 0x19
0x100281743: vmovq xmm0, rax
0x100281748: vmovdqu xmmword ptr [rip + 0x1b66d38], xmm0 ; 0x101de8488
0x100281750: mov qword ptr [rip + 0x1b66d41], rcx ; 0x101de8498
0x100281757: mov qword ptr [rip + 0x1b66d42], rdx ; 0x101de84a0
0x10028175e: mov qword ptr [rip + 0x1b66d43], rsi ; 0x101de84a8
0x100281765: lea rax, [rip + 0x8fba4d] ; 0x100b7d1b9 DarkstoneBarn
0x10028176c: mov qword ptr [rip + 0x1b66d45], rax ; 0x101de84b8
0x100281773: lea rax, [rip + 0x1b66d36] ; 0x101de84b0
0x10028177a: mov qword ptr [rip + 0x1b66d3b], 0 ; 0x101de84c0
0x100281785: mov rcx, qword ptr [rip + 0x9ee7cc] ; 0x100c6ff58
0x10028178c: mov qword ptr [rip + 0x1b66d35], rcx ; 0x101de84c8
0x100281793: mov qword ptr [rip + 0x9ee7be], rax ; 0x100c6ff58
0x10028179a: mov qword ptr [rip + 0x1b66d37], rax ; 0x101de84d8
0x1002817a1: mov rax, qword ptr [rip + 0x986f08] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1002817a8: mov qword ptr [rip + 0x1b66d31], rax ; 0x101de84e0
0x1002817af: mov dword ptr [rip + 0x1b66d2f], 0xffffffff ; 0x101de84e8
0x1002817b9: mov dword ptr [rip + 0x1b66d29], 0xffffffff ; 0x101de84ec
0x1002817c3: mov qword ptr [rip + 0x1b66d3a], 0 ; 0x101de8508
0x1002817ce: mov rax, qword ptr [rip + 0x98996b] ; 0x100c0b140
0x1002817d5: add rax, 0x10
0x1002817d9: mov qword ptr [rip + 0x1b66cd0], rax ; 0x101de84b0
0x1002817e0: xor eax, eax
0x1002817e2: call 0x100011c10 ; 0x100011c10
0x1002817e7: lea rax, [rip + 0x8db11e] ; 0x100b5c90c Initialize
0x1002817ee: mov qword ptr [rip + 0x1b66d1b], rax ; 0x101de8510
0x1002817f5: lea rsi, [rip + 0x1b66d14] ; 0x101de8510
0x1002817fc: mov qword ptr [rip + 0x1b66d11], 0 ; 0x101de8518
0x100281807: mov rax, qword ptr [rip + 0x9ee752] ; 0x100c6ff60
0x10028180e: mov qword ptr [rip + 0x1b66d0b], rax ; 0x101de8520
0x100281815: lea rax, [rip - 0x2aec] ; 0x10027ed30
0x10028181c: vmovq xmm0, rax
0x100281821: vmovdqu xmmword ptr [rip + 0x1b66d1f], xmm0 ; 0x101de8548
0x100281829: mov rcx, qword ptr [rip + 0x9840e0] ; 0x100c05910 -> 0x1002803d0 __Z12ApplyWrapperI13DarkstoneBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x100281830: mov qword ptr [rip + 0x1b66d21], rcx ; 0x101de8558
0x100281837: mov rdx, qword ptr [rip + 0x987962] ; 0x100c091a0 -> 0x100280430 __Z21InitFunctionSignatureIM13DarkstoneBarnFvvEEvP17FunctionSignature
0x10028183e: mov qword ptr [rip + 0x1b66d1b], rdx ; 0x101de8560
0x100281845: mov rax, qword ptr [rip + 0x9862fc] ; 0x100c07b48 -> 0x1002803c0 __Z18GetMetaClassByTypeIP13DarkstoneBarnERK9MetaClassv
0x10028184c: mov qword ptr [rip + 0x1b66d15], rax ; 0x101de8568
0x100281853: lea rdi, [rip + 0x8df1eb] ; 0x100b60a45 OnLevelLoad
0x10028185a: mov qword ptr [rip + 0x1b66d0f], rdi ; 0x101de8570
0x100281861: lea rdi, [rip + 0x1b66d08] ; 0x101de8570
0x100281868: mov qword ptr [rip + 0x1b66d05], 0 ; 0x101de8578
0x100281873: mov qword ptr [rip + 0x1b66d06], rsi ; 0x101de8580
0x10028187a: lea rsi, [rip - 0x2b31] ; 0x10027ed50
0x100281881: vmovq xmm0, rsi
0x100281886: vmovdqu xmmword ptr [rip + 0x1b66d1a], xmm0 ; 0x101de85a8
0x10028188e: mov rsi, qword ptr [rip + 0x984073] ; 0x100c05908 -> 0x100280450 __Z12ApplyWrapperI13DarkstoneBarnMS0_FvP15ResourceManagerEEvM9VoidClassFvvEPv8VariablePS9_j
0x100281895: mov qword ptr [rip + 0x1b66d1c], rsi ; 0x101de85b8
0x10028189c: mov rsi, qword ptr [rip + 0x9878f5] ; 0x100c09198 -> 0x1002804f0 __Z21InitFunctionSignatureIM13DarkstoneBarnFvP15ResourceManagerEEvP17FunctionSignature
0x1002818a3: mov qword ptr [rip + 0x1b66d16], rsi ; 0x101de85c0
0x1002818aa: mov qword ptr [rip + 0x1b66d17], rax ; 0x101de85c8
0x1002818b1: lea rsi, [rip + 0x8df1a3] ; 0x100b60a5b OnLevelUnload
0x1002818b8: mov qword ptr [rip + 0x1b66d11], rsi ; 0x101de85d0
0x1002818bf: lea rsi, [rip + 0x1b66d0a] ; 0x101de85d0
0x1002818c6: mov qword ptr [rip + 0x1b66d07], 0 ; 0x101de85d8
0x1002818d1: mov qword ptr [rip + 0x1b66d08], rdi ; 0x101de85e0
0x1002818d8: lea rdi, [rip - 0x2b3f] ; 0x10027eda0
0x1002818df: vmovq xmm0, rdi
0x1002818e4: vmovdqu xmmword ptr [rip + 0x1b66d1c], xmm0 ; 0x101de8608
0x1002818ec: mov qword ptr [rip + 0x1b66d25], rcx ; 0x101de8618
0x1002818f3: mov qword ptr [rip + 0x1b66d26], rdx ; 0x101de8620
0x1002818fa: mov qword ptr [rip + 0x1b66d27], rax ; 0x101de8628
0x100281901: lea rdi, [rip + 0x8db045] ; 0x100b5c94d Update
0x100281908: mov qword ptr [rip + 0x1b66d21], rdi ; 0x101de8630
0x10028190f: lea rdi, [rip + 0x1b66d1a] ; 0x101de8630
0x100281916: mov qword ptr [rip + 0x1b66d17], 0 ; 0x101de8638
0x100281921: mov qword ptr [rip + 0x1b66d18], rsi ; 0x101de8640
0x100281928: lea rsi, [rip - 0x2b6f] ; 0x10027edc0
0x10028192f: vmovq xmm0, rsi
0x100281934: vmovdqu xmmword ptr [rip + 0x1b66d2c], xmm0 ; 0x101de8668
0x10028193c: mov rsi, qword ptr [rip + 0x983fbd] ; 0x100c05900 -> 0x100280570 __Z12ApplyWrapperI13DarkstoneBarnMS0_FvP10AvatarBarnP8GameTimeP7BubBarnP11EmitterBarnP10LightHouseP12SoundManagerP8AmbienceP8MenuBarnP9EventBarnP15AchievementBarnP11AccountBarnP15CollectibleBarnP9NetModuleP14LevelStateBarnP8DebugHudEEvM9VoidClassFvvEPv8VariablePS11_j
0x100281943: mov qword ptr [rip + 0x1b66d2e], rsi ; 0x101de8678
0x10028194a: mov rsi, qword ptr [rip + 0x98783f] ; 0x100c09190 -> 0x100280580 __Z21InitFunctionSignatureIM13DarkstoneBarnFvP10AvatarBarnP8GameTimeP7BubBarnP11EmitterBarnP10LightHouseP12SoundManagerP8AmbienceP8MenuBarnP9EventBarnP15AchievementBarnP11AccountBarnP15CollectibleBarnP9NetModuleP14LevelStateBarnP8DebugHudEEvP17FunctionSignature
0x100281951: mov qword ptr [rip + 0x1b66d28], rsi ; 0x101de8680
0x100281958: mov qword ptr [rip + 0x1b66d29], rax ; 0x101de8688
0x10028195f: lea rsi, [rip + 0x8daff9] ; 0x100b5c95f HotLoad
0x100281966: mov qword ptr [rip + 0x1b66d23], rsi ; 0x101de8690
0x10028196d: lea rsi, [rip + 0x1b66d1c] ; 0x101de8690
0x100281974: mov qword ptr [rip + 0x1b66d19], 0 ; 0x101de8698
0x10028197f: mov qword ptr [rip + 0x1b66d1a], rdi ; 0x101de86a0
0x100281986: lea rdi, [rip - 0x231d] ; 0x10027f670
0x10028198d: vmovq xmm0, rdi
0x100281992: vmovdqu xmmword ptr [rip + 0x1b66d2e], xmm0 ; 0x101de86c8
0x10028199a: mov qword ptr [rip + 0x1b66d37], rcx ; 0x101de86d8
0x1002819a1: mov qword ptr [rip + 0x1b66d38], rdx ; 0x101de86e0
0x1002819a8: mov qword ptr [rip + 0x1b66d39], rax ; 0x101de86e8
0x1002819af: lea rcx, [rip + 0x8fb811] ; 0x100b7d1c7 CreateSoulTrap
0x1002819b6: mov qword ptr [rip + 0x1b66d33], rcx ; 0x101de86f0
0x1002819bd: lea rcx, [rip + 0x1b66d2c] ; 0x101de86f0
0x1002819c4: mov qword ptr [rip + 0x1b66d35], rsi ; 0x101de8700
0x1002819cb: mov qword ptr [rip + 0x9ee58e], rcx ; 0x100c6ff60
0x1002819d2: lea rcx, [rip - 0x2339] ; 0x10027f6a0
0x1002819d9: vmovq xmm0, rcx
0x1002819de: vmovdqu xmmword ptr [rip + 0x1b66d42], xmm0 ; 0x101de8728
0x1002819e6: mov rcx, qword ptr [rip + 0x983f0b] ; 0x100c058f8 -> 0x100280a80 __Z12ApplyWrapperI13DarkstoneBarnMS0_FP8SoulTrapPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x1002819ed: mov qword ptr [rip + 0x1b66d44], rcx ; 0x101de8738
0x1002819f4: mov rcx, qword ptr [rip + 0x98778d] ; 0x100c09188 -> 0x100280b40 __Z21InitFunctionSignatureIM13DarkstoneBarnFP8SoulTrapPK9MetaClassEEvP17FunctionSignature
0x1002819fb: mov qword ptr [rip + 0x1b66d3e], rcx ; 0x101de8740
0x100281a02: mov qword ptr [rip + 0x1b66d3f], rax ; 0x101de8748
0x100281a09: vmovq xmm0, r14
0x100281a0e: lea rax, [rip + 0x8f56b3] ; 0x100b770c8 ObjectFactory_CreatesType
0x100281a15: vmovq xmm1, rax
0x100281a1a: vpunpcklqdq xmm0, xmm1, xmm0
0x100281a1e: vmovdqa xmmword ptr [rip + 0x1b66d2a], xmm0 ; 0x101de8750
0x100281a26: lea rax, [rip + 0x1b66d23] ; 0x101de8750
0x100281a2d: mov qword ptr [rip + 0x1b66d28], 0 ; 0x101de8760
0x100281a38: mov qword ptr [rip + 0x1b66cb9], rax ; 0x101de86f8
0x100281a3f: pop rbx
0x100281a40: pop r12
0x100281a42: pop r14
0x100281a44: pop r15
0x100281a46: pop rbp
0x100281a47: ret 
0x100281a48: nop 
0x100281a49: nop 
0x100281a4a: nop 
0x100281a4b: nop 
0x100281a4c: nop 
0x100281a4d: nop 
0x100281a4e: nop 
0x100281a4f: nop 
