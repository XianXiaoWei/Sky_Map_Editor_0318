0x1007236a0: push rbp
0x1007236a1: mov rbp, rsp
0x1007236a4: push rbx
0x1007236a5: push rax
0x1007236a6: mov dword ptr [rip + 0x60e778], 0 ; 0x100d31e28
0x1007236b0: lea rbx, [rip + 0x479357] ; 0x100b9ca0e Visibility
0x1007236b7: mov qword ptr [rip + 0x191851a], rbx ; 0x10203bbd8
0x1007236be: lea rax, [rip + 0x191850b] ; 0x10203bbd0
0x1007236c5: mov qword ptr [rip + 0x1918510], 0 ; 0x10203bbe0
0x1007236d0: mov rcx, qword ptr [rip + 0x54c881] ; 0x100c6ff58
0x1007236d7: mov qword ptr [rip + 0x191850a], rcx ; 0x10203bbe8
0x1007236de: mov qword ptr [rip + 0x54c873], rax ; 0x100c6ff58
0x1007236e5: mov qword ptr [rip + 0x191850c], rax ; 0x10203bbf8
0x1007236ec: mov rax, qword ptr [rip + 0x4e4fbd] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1007236f3: mov qword ptr [rip + 0x1918506], rax ; 0x10203bc00
0x1007236fa: mov qword ptr [rip + 0x1918503], 0xffffffffffffffff ; 0x10203bc08
0x100723705: mov qword ptr [rip + 0x1918518], 0 ; 0x10203bc28
0x100723710: mov rax, qword ptr [rip + 0x4e7481] ; 0x100c0ab98
0x100723717: add rax, 0x10
0x10072371b: mov qword ptr [rip + 0x19184ae], rax ; 0x10203bbd0
0x100723722: xor eax, eax
0x100723724: call 0x100011c10 ; 0x100011c10
0x100723729: lea rax, [rip + 0x4391dc] ; 0x100b5c90c Initialize
0x100723730: mov qword ptr [rip + 0x19184f9], rax ; 0x10203bc30
0x100723737: lea rcx, [rip + 0x19184f2] ; 0x10203bc30
0x10072373e: mov rax, qword ptr [rip + 0x54c81b] ; 0x100c6ff60
0x100723745: mov qword ptr [rip + 0x19184f4], rax ; 0x10203bc40
0x10072374c: lea rax, [rip - 0x60f3] ; 0x10071d660
0x100723753: vmovq xmm0, rax
0x100723758: vmovdqu xmmword ptr [rip + 0x1918508], xmm0 ; 0x10203bc68
0x100723760: mov rax, qword ptr [rip + 0x4e1d91] ; 0x100c054f8 -> 0x100722fd0 __Z12ApplyWrapperI10VisibilityMS0_FvP4HeapP6CameraEEvM9VoidClassFvvEPv8VariablePSB_j
0x100723767: mov qword ptr [rip + 0x191850a], rax ; 0x10203bc78
0x10072376e: mov rax, qword ptr [rip + 0x4e5613] ; 0x100c08d88 -> 0x100722fe0 __Z21InitFunctionSignatureIM10VisibilityFvP4HeapP6CameraEEvP17FunctionSignature
0x100723775: mov qword ptr [rip + 0x1918504], rax ; 0x10203bc80
0x10072377c: mov rax, qword ptr [rip + 0x4e3ff5] ; 0x100c07778 -> 0x100722d10 __Z18GetMetaClassByTypeIP10VisibilityERK9MetaClassv
0x100723783: mov qword ptr [rip + 0x19184fe], rax ; 0x10203bc88
0x10072378a: lea rdx, [rip + 0x4391b1] ; 0x100b5c942 systemHeap
0x100723791: vmovq xmm0, rdx
0x100723796: lea rdx, [rip + 0x43917a] ; 0x100b5c917 ArgName
0x10072379d: vmovq xmm1, rdx
0x1007237a2: vpunpcklqdq xmm0, xmm1, xmm0
0x1007237a6: vmovdqa xmmword ptr [rip + 0x19184e2], xmm0 ; 0x10203bc90
0x1007237ae: lea rdx, [rip + 0x19184db] ; 0x10203bc90
0x1007237b5: mov qword ptr [rip + 0x19184e0], 0 ; 0x10203bca0
0x1007237c0: mov qword ptr [rip + 0x1918471], rdx ; 0x10203bc38
0x1007237c7: lea rdx, [rip + 0x43916a] ; 0x100b5c938 Terminate
0x1007237ce: mov qword ptr [rip + 0x19184d3], rdx ; 0x10203bca8
0x1007237d5: lea rsi, [rip + 0x19184cc] ; 0x10203bca8
0x1007237dc: mov qword ptr [rip + 0x19184d5], rcx ; 0x10203bcb8
0x1007237e3: lea rcx, [rip - 0x5e3a] ; 0x10071d9b0
0x1007237ea: vmovq xmm1, rcx
0x1007237ef: vmovdqu xmmword ptr [rip + 0x19184e9], xmm1 ; 0x10203bce0
0x1007237f7: mov rcx, qword ptr [rip + 0x4e1cf2] ; 0x100c054f0 @1r
0x1007237fe: mov qword ptr [rip + 0x19184eb], rcx ; 0x10203bcf0
0x100723805: mov rdx, qword ptr [rip + 0x4e5574] ; 0x100c08d80 -> 0x1007231e0 __Z21InitFunctionSignatureIM10VisibilityFvP4HeapEEvP17FunctionSignature
0x10072380c: mov qword ptr [rip + 0x19184e5], rdx ; 0x10203bcf8
0x100723813: mov qword ptr [rip + 0x19184e6], rax ; 0x10203bd00
0x10072381a: vmovdqa xmmword ptr [rip + 0x19184ee], xmm0 ; 0x10203bd10
0x100723822: lea rdi, [rip + 0x19184e7] ; 0x10203bd10
0x100723829: mov qword ptr [rip + 0x19184ec], 0 ; 0x10203bd20
0x100723834: mov qword ptr [rip + 0x1918475], rdi ; 0x10203bcb0
0x10072383b: lea rdi, [rip + 0x4557f1] ; 0x100b79033 Resize
0x100723842: mov qword ptr [rip + 0x19184df], rdi ; 0x10203bd28
0x100723849: lea rdi, [rip + 0x19184d8] ; 0x10203bd28
0x100723850: mov qword ptr [rip + 0x19184e1], rsi ; 0x10203bd38
0x100723857: lea rsi, [rip - 0x5e6e] ; 0x10071d9f0
0x10072385e: vmovq xmm1, rsi
0x100723863: vmovdqu xmmword ptr [rip + 0x19184f5], xmm1 ; 0x10203bd60
0x10072386b: mov rsi, qword ptr [rip + 0x4e1c6e] ; 0x100c054e0 `2r
0x100723872: mov qword ptr [rip + 0x19184f7], rsi ; 0x10203bd70
0x100723879: mov rsi, qword ptr [rip + 0x4e54f0] ; 0x100c08d70 p2r
0x100723880: mov qword ptr [rip + 0x19184f1], rsi ; 0x10203bd78
0x100723887: mov qword ptr [rip + 0x19184f2], rax ; 0x10203bd80
0x10072388e: vmovdqa xmmword ptr [rip + 0x19184fa], xmm0 ; 0x10203bd90
0x100723896: lea rsi, [rip + 0x19184f3] ; 0x10203bd90
0x10072389d: mov qword ptr [rip + 0x19184f8], 0 ; 0x10203bda0
0x1007238a8: mov qword ptr [rip + 0x1918481], rsi ; 0x10203bd30
0x1007238af: lea rsi, [rip + 0x439097] ; 0x100b5c94d Update
0x1007238b6: mov qword ptr [rip + 0x19184eb], rsi ; 0x10203bda8
0x1007238bd: lea rsi, [rip + 0x19184e4] ; 0x10203bda8
0x1007238c4: mov qword ptr [rip + 0x19184e1], 0 ; 0x10203bdb0
0x1007238cf: mov qword ptr [rip + 0x19184e2], rdi ; 0x10203bdb8
0x1007238d6: lea rdi, [rip - 0x58bd] ; 0x10071e020
0x1007238dd: vmovq xmm1, rdi
0x1007238e2: vmovdqu xmmword ptr [rip + 0x19184f6], xmm1 ; 0x10203bde0
0x1007238ea: mov rdi, qword ptr [rip + 0x4e1bf7] ; 0x100c054e8 `4r
0x1007238f1: mov qword ptr [rip + 0x19184f8], rdi ; 0x10203bdf0
0x1007238f8: mov rdi, qword ptr [rip + 0x4e5479] ; 0x100c08d78 p4r
0x1007238ff: mov qword ptr [rip + 0x19184f2], rdi ; 0x10203bdf8
0x100723906: mov qword ptr [rip + 0x19184f3], rax ; 0x10203be00
0x10072390d: lea rdi, [rip + 0x43e4ed] ; 0x100b61e01 RenderFlush
0x100723914: mov qword ptr [rip + 0x19184ed], rdi ; 0x10203be08
0x10072391b: lea rdi, [rip + 0x19184e6] ; 0x10203be08
0x100723922: mov qword ptr [rip + 0x19184ef], rsi ; 0x10203be18
0x100723929: mov qword ptr [rip + 0x54c630], rdi ; 0x100c6ff60
0x100723930: lea rsi, [rip - 0x5157] ; 0x10071e7e0
0x100723937: vmovq xmm1, rsi
0x10072393c: vmovdqu xmmword ptr [rip + 0x19184fc], xmm1 ; 0x10203be40
0x100723944: mov qword ptr [rip + 0x1918505], rcx ; 0x10203be50
0x10072394b: mov qword ptr [rip + 0x1918506], rdx ; 0x10203be58
0x100723952: mov qword ptr [rip + 0x1918507], rax ; 0x10203be60
0x100723959: vmovdqa xmmword ptr [rip + 0x191850f], xmm0 ; 0x10203be70
0x100723961: lea rax, [rip + 0x1918508] ; 0x10203be70
0x100723968: mov qword ptr [rip + 0x191850d], 0 ; 0x10203be80
0x100723973: mov qword ptr [rip + 0x1918496], rax ; 0x10203be10
0x10072397a: lea rdi, [rip + 0x60e4af] ; 0x100d31e30
0x100723981: lea rsi, [rip + 0x1918500] ; 0x10203be88
0x100723988: lea rdx, [rip + 0x47908a] ; 0x100b9ca19 tag_Visibility
0x10072398f: call 0x1007951b0 ; 0x1007951b0
0x100723994: lea rax, [rip + 0x47908d] ; 0x100b9ca28 kDisableVisibility
0x10072399b: mov qword ptr [rip + 0x19184f6], rax ; 0x10203be98
0x1007239a2: lea rsi, [rip + 0x19184ef] ; 0x10203be98
0x1007239a9: mov rax, qword ptr [rip + 0x56c2f0] ; 0x100c8fca0
0x1007239b0: mov qword ptr [rip + 0x19184f1], rax ; 0x10203bea8
0x1007239b7: lea rax, [rip + 0x19184d2] ; 0x10203be90
0x1007239be: vmovq xmm0, rax
0x1007239c3: lea rax, [rip + 0x479071] ; 0x100b9ca3b Visibility.cpp
0x1007239ca: vmovq xmm1, rax
0x1007239cf: vpunpcklqdq xmm0, xmm1, xmm0
0x1007239d3: vmovdqu xmmword ptr [rip + 0x19184dd], xmm0 ; 0x10203beb8
0x1007239db: mov rdx, qword ptr [rip + 0x4e3b76] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1007239e2: mov qword ptr [rip + 0x19184df], rdx ; 0x10203bec8
0x1007239e9: mov qword ptr [rip + 0x19184dc], 0 ; 0x10203bed0
0x1007239f4: lea rcx, [rip - 0x709fdb] ; 0x100019a20
0x1007239fb: mov qword ptr [rip + 0x19184d6], rcx ; 0x10203bed8
0x100723a02: mov qword ptr [rip + 0x19184d3], 0 ; 0x10203bee0
0x100723a0d: vmovq xmm0, rbx
0x100723a12: lea rdi, [rip + 0x43a604] ; 0x100b5e01d TweakCategory
0x100723a19: vmovq xmm2, rdi
0x100723a1e: vpunpcklqdq xmm0, xmm2, xmm0
0x100723a22: vmovdqa xmmword ptr [rip + 0x19184c6], xmm0 ; 0x10203bef0
0x100723a2a: lea rdi, [rip + 0x19184bf] ; 0x10203bef0
0x100723a31: mov qword ptr [rip + 0x19184c4], 0 ; 0x10203bf00
0x100723a3c: mov qword ptr [rip + 0x191845d], rdi ; 0x10203bea0
0x100723a43: lea rdi, [rip + 0x479000] ; 0x100b9ca4a kDisableOcclusionTesting
0x100723a4a: mov qword ptr [rip + 0x19184bf], rdi ; 0x10203bf10
0x100723a51: lea rdi, [rip + 0x19184b8] ; 0x10203bf10
0x100723a58: mov qword ptr [rip + 0x19184c1], rsi ; 0x10203bf20
0x100723a5f: lea rsi, [rip + 0x19184a2] ; 0x10203bf08
0x100723a66: vmovq xmm2, rsi
0x100723a6b: vpunpcklqdq xmm2, xmm1, xmm2
0x100723a6f: vmovdqu xmmword ptr [rip + 0x19184b9], xmm2 ; 0x10203bf30
0x100723a77: mov qword ptr [rip + 0x19184c2], rdx ; 0x10203bf40
0x100723a7e: mov qword ptr [rip + 0x19184bf], 0 ; 0x10203bf48
0x100723a89: mov qword ptr [rip + 0x19184c0], rcx ; 0x10203bf50
0x100723a90: mov qword ptr [rip + 0x19184bd], 0 ; 0x10203bf58
0x100723a9b: vmovdqa xmmword ptr [rip + 0x19184bd], xmm0 ; 0x10203bf60
0x100723aa3: lea rsi, [rip + 0x19184b6] ; 0x10203bf60
0x100723aaa: mov qword ptr [rip + 0x19184bb], 0 ; 0x10203bf70
0x100723ab5: mov qword ptr [rip + 0x191845c], rsi ; 0x10203bf18
0x100723abc: lea rsi, [rip + 0x478fa0] ; 0x100b9ca63 kUpdateOcclusionCamera
0x100723ac3: mov qword ptr [rip + 0x19184ae], rsi ; 0x10203bf78
0x100723aca: lea rsi, [rip + 0x19184a7] ; 0x10203bf78
0x100723ad1: mov qword ptr [rip + 0x19184b0], rdi ; 0x10203bf88
0x100723ad8: lea rdi, [rip + 0x5e99e1] ; 0x100d0d4c0
0x100723adf: vmovq xmm2, rdi
0x100723ae4: vpunpcklqdq xmm2, xmm1, xmm2
0x100723ae8: vmovdqu xmmword ptr [rip + 0x19184a8], xmm2 ; 0x10203bf98
0x100723af0: mov qword ptr [rip + 0x19184b1], rdx ; 0x10203bfa8
0x100723af7: mov qword ptr [rip + 0x19184ae], 0 ; 0x10203bfb0
0x100723b02: mov qword ptr [rip + 0x19184af], rcx ; 0x10203bfb8
0x100723b09: mov qword ptr [rip + 0x19184ac], 0 ; 0x10203bfc0
0x100723b14: vmovdqa xmmword ptr [rip + 0x19184b4], xmm0 ; 0x10203bfd0
0x100723b1c: lea rdi, [rip + 0x19184ad] ; 0x10203bfd0
0x100723b23: mov qword ptr [rip + 0x19184b2], 0 ; 0x10203bfe0
0x100723b2e: mov qword ptr [rip + 0x191844b], rdi ; 0x10203bf80
0x100723b35: lea rdi, [rip + 0x478f3e] ; 0x100b9ca7a kShowSoftwareDepth
0x100723b3c: mov qword ptr [rip + 0x19184ad], rdi ; 0x10203bff0
0x100723b43: lea rdi, [rip + 0x19184a6] ; 0x10203bff0
0x100723b4a: mov qword ptr [rip + 0x19184af], rsi ; 0x10203c000
0x100723b51: lea rsi, [rip + 0x1918490] ; 0x10203bfe8
0x100723b58: vmovq xmm2, rsi
0x100723b5d: vpunpcklqdq xmm2, xmm1, xmm2
0x100723b61: vmovdqu xmmword ptr [rip + 0x19184a7], xmm2 ; 0x10203c010
0x100723b69: mov qword ptr [rip + 0x19184b0], rdx ; 0x10203c020
0x100723b70: mov qword ptr [rip + 0x19184ad], 0 ; 0x10203c028
0x100723b7b: mov qword ptr [rip + 0x19184ae], rcx ; 0x10203c030
0x100723b82: mov qword ptr [rip + 0x19184ab], 0 ; 0x10203c038
0x100723b8d: vmovdqa xmmword ptr [rip + 0x19184ab], xmm0 ; 0x10203c040
0x100723b95: lea rsi, [rip + 0x19184a4] ; 0x10203c040
0x100723b9c: mov qword ptr [rip + 0x19184a9], 0 ; 0x10203c050
0x100723ba7: mov qword ptr [rip + 0x191844a], rsi ; 0x10203bff8
0x100723bae: lea rsi, [rip + 0x478ed8] ; 0x100b9ca8d kShowSoftwareTriangles
0x100723bb5: mov qword ptr [rip + 0x19184a4], rsi ; 0x10203c060
0x100723bbc: lea rsi, [rip + 0x191849d] ; 0x10203c060
0x100723bc3: mov qword ptr [rip + 0x19184a6], rdi ; 0x10203c070
0x100723bca: lea rdi, [rip + 0x1918487] ; 0x10203c058
0x100723bd1: vmovq xmm2, rdi
0x100723bd6: vpunpcklqdq xmm2, xmm1, xmm2
0x100723bda: vmovdqu xmmword ptr [rip + 0x191849e], xmm2 ; 0x10203c080
0x100723be2: mov qword ptr [rip + 0x19184a7], rdx ; 0x10203c090
0x100723be9: mov qword ptr [rip + 0x19184a4], 0 ; 0x10203c098
0x100723bf4: mov qword ptr [rip + 0x19184a5], rcx ; 0x10203c0a0
0x100723bfb: mov qword ptr [rip + 0x19184a2], 0 ; 0x10203c0a8
0x100723c06: vmovdqa xmmword ptr [rip + 0x19184a2], xmm0 ; 0x10203c0b0
0x100723c0e: lea rdi, [rip + 0x191849b] ; 0x10203c0b0
0x100723c15: mov qword ptr [rip + 0x19184a0], 0 ; 0x10203c0c0
0x100723c20: mov qword ptr [rip + 0x1918441], rdi ; 0x10203c068
0x100723c27: lea rdi, [rip + 0x478e76] ; 0x100b9caa4 kShowVisibilitySphereTests
0x100723c2e: mov qword ptr [rip + 0x191849b], rdi ; 0x10203c0d0
0x100723c35: lea rdi, [rip + 0x1918494] ; 0x10203c0d0
0x100723c3c: mov qword ptr [rip + 0x191849d], rsi ; 0x10203c0e0
0x100723c43: lea rsi, [rip + 0x191847e] ; 0x10203c0c8
0x100723c4a: vmovq xmm2, rsi
0x100723c4f: vpunpcklqdq xmm2, xmm1, xmm2
0x100723c53: vmovdqu xmmword ptr [rip + 0x1918495], xmm2 ; 0x10203c0f0
0x100723c5b: mov qword ptr [rip + 0x191849e], rdx ; 0x10203c100
0x100723c62: mov qword ptr [rip + 0x191849b], 0 ; 0x10203c108
0x100723c6d: mov qword ptr [rip + 0x191849c], rcx ; 0x10203c110
0x100723c74: mov qword ptr [rip + 0x1918499], 0 ; 0x10203c118
0x100723c7f: vmovdqa xmmword ptr [rip + 0x1918499], xmm0 ; 0x10203c120
0x100723c87: lea rsi, [rip + 0x1918492] ; 0x10203c120
0x100723c8e: mov qword ptr [rip + 0x1918497], 0 ; 0x10203c130
0x100723c99: mov qword ptr [rip + 0x1918438], rsi ; 0x10203c0d8
0x100723ca0: lea rsi, [rip + 0x478e18] ; 0x100b9cabf kShowVisibilityAABBTests
0x100723ca7: mov qword ptr [rip + 0x1918492], rsi ; 0x10203c140
0x100723cae: lea rsi, [rip + 0x191848b] ; 0x10203c140
0x100723cb5: mov qword ptr [rip + 0x1918494], rdi ; 0x10203c150
0x100723cbc: lea rdi, [rip + 0x1918475] ; 0x10203c138
0x100723cc3: vmovq xmm2, rdi
0x100723cc8: vpunpcklqdq xmm2, xmm1, xmm2
0x100723ccc: vmovdqu xmmword ptr [rip + 0x191848c], xmm2 ; 0x10203c160
0x100723cd4: mov qword ptr [rip + 0x1918495], rdx ; 0x10203c170
0x100723cdb: mov qword ptr [rip + 0x1918492], 0 ; 0x10203c178
0x100723ce6: mov qword ptr [rip + 0x1918493], rcx ; 0x10203c180
0x100723ced: mov qword ptr [rip + 0x1918490], 0 ; 0x10203c188
0x100723cf8: vmovdqa xmmword ptr [rip + 0x1918490], xmm0 ; 0x10203c190
0x100723d00: lea rdi, [rip + 0x1918489] ; 0x10203c190
0x100723d07: mov qword ptr [rip + 0x191848e], 0 ; 0x10203c1a0
0x100723d12: mov qword ptr [rip + 0x191842f], rdi ; 0x10203c148
0x100723d19: lea rdi, [rip + 0x478db8] ; 0x100b9cad8 kShowClippedTriangles
0x100723d20: mov qword ptr [rip + 0x1918489], rdi ; 0x10203c1b0
0x100723d27: lea rdi, [rip + 0x1918482] ; 0x10203c1b0
0x100723d2e: mov qword ptr [rip + 0x191848b], rsi ; 0x10203c1c0
0x100723d35: lea rsi, [rip + 0x191846c] ; 0x10203c1a8
0x100723d3c: vmovq xmm2, rsi
0x100723d41: vpunpcklqdq xmm2, xmm1, xmm2
0x100723d45: vmovdqu xmmword ptr [rip + 0x1918483], xmm2 ; 0x10203c1d0
0x100723d4d: mov qword ptr [rip + 0x191848c], rdx ; 0x10203c1e0
0x100723d54: mov qword ptr [rip + 0x1918489], 0 ; 0x10203c1e8
0x100723d5f: mov qword ptr [rip + 0x191848a], rcx ; 0x10203c1f0
0x100723d66: mov qword ptr [rip + 0x1918487], 0 ; 0x10203c1f8
0x100723d71: vmovdqa xmmword ptr [rip + 0x1918487], xmm0 ; 0x10203c200
0x100723d79: lea rsi, [rip + 0x1918480] ; 0x10203c200
0x100723d80: mov qword ptr [rip + 0x1918485], 0 ; 0x10203c210
0x100723d8b: mov qword ptr [rip + 0x1918426], rsi ; 0x10203c1b8
0x100723d92: lea rsi, [rip + 0x478d55] ; 0x100b9caee kShowVisibilitySphereTestsTransformed
0x100723d99: mov qword ptr [rip + 0x1918480], rsi ; 0x10203c220
0x100723da0: lea rsi, [rip + 0x1918479] ; 0x10203c220
0x100723da7: mov qword ptr [rip + 0x1918482], rdi ; 0x10203c230
0x100723dae: lea rdi, [rip + 0x1918463] ; 0x10203c218
0x100723db5: vmovq xmm2, rdi
0x100723dba: vpunpcklqdq xmm2, xmm1, xmm2
0x100723dbe: vmovdqu xmmword ptr [rip + 0x191847a], xmm2 ; 0x10203c240
0x100723dc6: mov qword ptr [rip + 0x1918483], rdx ; 0x10203c250
0x100723dcd: mov qword ptr [rip + 0x1918480], 0 ; 0x10203c258
0x100723dd8: mov qword ptr [rip + 0x1918481], rcx ; 0x10203c260
0x100723ddf: mov qword ptr [rip + 0x191847e], 0 ; 0x10203c268
0x100723dea: vmovdqa xmmword ptr [rip + 0x191847e], xmm0 ; 0x10203c270
0x100723df2: lea rdi, [rip + 0x1918477] ; 0x10203c270
0x100723df9: mov qword ptr [rip + 0x191847c], 0 ; 0x10203c280
0x100723e04: mov qword ptr [rip + 0x191841d], rdi ; 0x10203c228
0x100723e0b: lea rdi, [rip + 0x478d02] ; 0x100b9cb14 kShowVisibilityAABBTestsTransformed
0x100723e12: mov qword ptr [rip + 0x1918477], rdi ; 0x10203c290
0x100723e19: lea rdi, [rip + 0x1918470] ; 0x10203c290
0x100723e20: mov qword ptr [rip + 0x1918479], rsi ; 0x10203c2a0
0x100723e27: lea rsi, [rip + 0x191845a] ; 0x10203c288
0x100723e2e: vmovq xmm2, rsi
0x100723e33: vpunpcklqdq xmm2, xmm1, xmm2
0x100723e37: vmovdqu xmmword ptr [rip + 0x1918471], xmm2 ; 0x10203c2b0
0x100723e3f: mov qword ptr [rip + 0x191847a], rdx ; 0x10203c2c0
0x100723e46: mov qword ptr [rip + 0x1918477], 0 ; 0x10203c2c8
0x100723e51: mov qword ptr [rip + 0x1918478], rcx ; 0x10203c2d0
0x100723e58: mov qword ptr [rip + 0x1918475], 0 ; 0x10203c2d8
0x100723e63: vmovdqa xmmword ptr [rip + 0x1918475], xmm0 ; 0x10203c2e0
0x100723e6b: lea rsi, [rip + 0x191846e] ; 0x10203c2e0
0x100723e72: mov qword ptr [rip + 0x1918473], 0 ; 0x10203c2f0
0x100723e7d: mov qword ptr [rip + 0x1918414], rsi ; 0x10203c298
0x100723e84: lea rsi, [rip + 0x478cad] ; 0x100b9cb38 kShowBadTriangles
0x100723e8b: mov qword ptr [rip + 0x191846e], rsi ; 0x10203c300
0x100723e92: lea rsi, [rip + 0x1918467] ; 0x10203c300
0x100723e99: mov qword ptr [rip + 0x1918470], rdi ; 0x10203c310
0x100723ea0: lea rdi, [rip + 0x1918451] ; 0x10203c2f8
0x100723ea7: vmovq xmm2, rdi
0x100723eac: vpunpcklqdq xmm1, xmm1, xmm2
0x100723eb0: vmovdqu xmmword ptr [rip + 0x1918468], xmm1 ; 0x10203c320
0x100723eb8: mov qword ptr [rip + 0x1918471], rdx ; 0x10203c330
0x100723ebf: mov qword ptr [rip + 0x191846e], 0 ; 0x10203c338
0x100723eca: mov qword ptr [rip + 0x191846f], rcx ; 0x10203c340
0x100723ed1: mov qword ptr [rip + 0x191846c], 0 ; 0x10203c348
0x100723edc: vmovdqa xmmword ptr [rip + 0x191846c], xmm0 ; 0x10203c350
0x100723ee4: lea rdx, [rip + 0x1918465] ; 0x10203c350
0x100723eeb: mov qword ptr [rip + 0x191846a], 0 ; 0x10203c360
0x100723ef6: mov qword ptr [rip + 0x191840b], rdx ; 0x10203c308
0x100723efd: lea rdx, [rip + 0x478c46] ; 0x100b9cb4a kSoftwareDepthMip
0x100723f04: mov qword ptr [rip + 0x1918465], rdx ; 0x10203c370
0x100723f0b: lea rdx, [rip + 0x191845e] ; 0x10203c370
0x100723f12: mov qword ptr [rip + 0x1918467], rsi ; 0x10203c380
0x100723f19: mov qword ptr [rip + 0x56bd80], rdx ; 0x100c8fca0
0x100723f20: mov qword ptr [rip + 0x1918469], rax ; 0x10203c390
0x100723f27: lea rax, [rip + 0x191843a] ; 0x10203c368
0x100723f2e: mov qword ptr [rip + 0x1918463], rax ; 0x10203c398
0x100723f35: mov rax, qword ptr [rip + 0x4e3624] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x100723f3c: mov qword ptr [rip + 0x191845d], rax ; 0x10203c3a0
0x100723f43: mov qword ptr [rip + 0x191845a], 0 ; 0x10203c3a8
0x100723f4e: mov qword ptr [rip + 0x191845b], rcx ; 0x10203c3b0
0x100723f55: mov qword ptr [rip + 0x1918458], 0 ; 0x10203c3b8
0x100723f60: vmovdqa xmmword ptr [rip + 0x1918458], xmm0 ; 0x10203c3c0
0x100723f68: lea rax, [rip + 0x1918451] ; 0x10203c3c0
0x100723f6f: mov qword ptr [rip + 0x1918456], 0 ; 0x10203c3d0
0x100723f7a: lea rcx, [rip + 0x43cf8d] ; 0x100b60f0e 0.0 1.0
0x100723f81: vmovq xmm0, rcx
0x100723f86: lea rcx, [rip + 0x43c1c1] ; 0x100b6014e TweakRange
0x100723f8d: vmovq xmm1, rcx
0x100723f92: vpunpcklqdq xmm0, xmm1, xmm0
0x100723f96: vmovdqa xmmword ptr [rip + 0x1918442], xmm0 ; 0x10203c3e0
0x100723f9e: lea rcx, [rip + 0x191843b] ; 0x10203c3e0
0x100723fa5: mov qword ptr [rip + 0x1918444], rax ; 0x10203c3f0
0x100723fac: mov qword ptr [rip + 0x19183c5], rcx ; 0x10203c378
0x100723fb3: add rsp, 8
0x100723fb7: pop rbx
0x100723fb8: pop rbp
0x100723fb9: ret 
0x100723fba: nop 
0x100723fbb: nop 
0x100723fbc: nop 
0x100723fbd: nop 
0x100723fbe: nop 
0x100723fbf: nop 
