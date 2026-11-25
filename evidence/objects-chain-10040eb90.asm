0x10040eb90: push rbp
0x10040eb91: mov rbp, rsp
0x10040eb94: lea rdi, [rip + 0x91d4cd] ; 0x100d2c068
0x10040eb9b: lea rsi, [rip + 0x1bf4a0e] ; 0x1020035b0
0x10040eba2: lea rdx, [rip + 0x778d13] ; 0x100b878bc tag_LevelObjects
0x10040eba9: call 0x1007951b0 ; 0x1007951b0
0x10040ebae: lea rax, [rip + 0x778d18] ; 0x100b878cd LevelObjects
0x10040ebb5: mov qword ptr [rip + 0x1bf4a04], rax ; 0x1020035c0
0x10040ebbc: lea rax, [rip + 0x1bf49f5] ; 0x1020035b8
0x10040ebc3: mov qword ptr [rip + 0x1bf49fa], 0 ; 0x1020035c8
0x10040ebce: mov rcx, qword ptr [rip + 0x861383] ; 0x100c6ff58
0x10040ebd5: mov qword ptr [rip + 0x1bf49f4], rcx ; 0x1020035d0
0x10040ebdc: mov qword ptr [rip + 0x861375], rax ; 0x100c6ff58
0x10040ebe3: mov qword ptr [rip + 0x1bf49f6], rax ; 0x1020035e0
0x10040ebea: mov rax, qword ptr [rip + 0x7f9c97] ; 0x100c08888 -> 0x100059560 __Z18GetMetaClassByTypeIP8ResourceERK9MetaClassv
0x10040ebf1: mov qword ptr [rip + 0x1bf49f0], rax ; 0x1020035e8
0x10040ebf8: mov qword ptr [rip + 0x1bf49ed], 0xffffffffffffffff ; 0x1020035f0
0x10040ec03: mov qword ptr [rip + 0x1bf4a02], 0 ; 0x102003610
0x10040ec0e: mov rax, qword ptr [rip + 0x7fc31b] ; 0x100c0af30
0x10040ec15: add rax, 0x10
0x10040ec19: mov qword ptr [rip + 0x1bf4998], rax ; 0x1020035b8
0x10040ec20: xor eax, eax
0x10040ec22: call 0x100011c10 ; 0x100011c10
0x10040ec27: lea rax, [rip + 0x778cac] ; 0x100b878da GetObjectByName
0x10040ec2e: mov qword ptr [rip + 0x1bf49e3], rax ; 0x102003618
0x10040ec35: lea r8, [rip + 0x1bf49dc] ; 0x102003618
0x10040ec3c: mov qword ptr [rip + 0x1bf49d9], 0 ; 0x102003620
0x10040ec47: mov rcx, qword ptr [rip + 0x861312] ; 0x100c6ff60
0x10040ec4e: mov qword ptr [rip + 0x1bf49d3], rcx ; 0x102003628
0x10040ec55: lea rcx, [rip - 0x3bbc] ; 0x10040b0a0
0x10040ec5c: vmovq xmm0, rcx
0x10040ec61: vmovdqu xmmword ptr [rip + 0x1bf49e7], xmm0 ; 0x102003650
0x10040ec69: mov rcx, qword ptr [rip + 0x7f6ae8] ; 0x100c05758 -> 0x10040e920 __Z12ApplyWrapperI12LevelObjectsMS0_FP6ObjectPKcEEvM9VoidClassFvvEPv8VariablePSB_j
0x10040ec70: mov qword ptr [rip + 0x1bf49e9], rcx ; 0x102003660
0x10040ec77: mov rcx, qword ptr [rip + 0x7fa36a] ; 0x100c08fe8 -> 0x10040e9f0 __Z21InitFunctionSignatureIM12LevelObjectsFP6ObjectPKcEEvP17FunctionSignature
0x10040ec7e: mov qword ptr [rip + 0x1bf49e3], rcx ; 0x102003668
0x10040ec85: mov rcx, qword ptr [rip + 0x7f8d4c] ; 0x100c079d8 -> 0x10040e0a0 __Z18GetMetaClassByTypeIP12LevelObjectsERK9MetaClassv
0x10040ec8c: mov qword ptr [rip + 0x1bf49dd], rcx ; 0x102003670
0x10040ec93: lea rdx, [rip + 0x74e33f] ; 0x100b5cfd9 level
0x10040ec9a: mov qword ptr [rip + 0x8b476f], rdx ; 0x100cc3410
0x10040eca1: lea rdx, [rip + 0x8b4768] ; 0x100cc3410
0x10040eca8: mov qword ptr [rip + 0x8b4765], 0 ; 0x100cc3418
0x10040ecb3: mov rsi, qword ptr [rip + 0x868fa6] ; 0x100c77c60
0x10040ecba: mov qword ptr [rip + 0x8b475f], rsi ; 0x100cc3420
0x10040ecc1: mov qword ptr [rip + 0x8b4764], 0x70 ; 0x100cc3430
0x10040eccc: mov rsi, qword ptr [rip + 0x7f8115] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x10040ecd3: mov qword ptr [rip + 0x8b475e], rsi ; 0x100cc3438
0x10040ecda: mov qword ptr [rip + 0x8b475f], rcx ; 0x100cc3440
0x10040ece1: mov qword ptr [rip + 0x8b475c], 0xffffffffffffffff ; 0x100cc3448
0x10040ecec: lea rdi, [rip - 0x3f52d3] ; 0x100019a20
0x10040ecf3: mov qword ptr [rip + 0x8b4756], rdi ; 0x100cc3450
0x10040ecfa: mov qword ptr [rip + 0x8b4753], 0 ; 0x100cc3458
0x10040ed05: lea rax, [rip + 0x773115] ; 0x100b81e21 source
0x10040ed0c: mov qword ptr [rip + 0x8b474d], rax ; 0x100cc3460
0x10040ed13: lea rax, [rip + 0x8b4746] ; 0x100cc3460
0x10040ed1a: mov qword ptr [rip + 0x8b4743], 0 ; 0x100cc3468
0x10040ed25: mov qword ptr [rip + 0x8b4744], rdx ; 0x100cc3470
0x10040ed2c: mov qword ptr [rip + 0x8b4749], 0x88 ; 0x100cc3480
0x10040ed37: mov qword ptr [rip + 0x8b474a], rsi ; 0x100cc3488
0x10040ed3e: mov qword ptr [rip + 0x8b474b], rcx ; 0x100cc3490
0x10040ed45: mov qword ptr [rip + 0x8b4748], 0xffffffffffffffff ; 0x100cc3498
0x10040ed50: mov qword ptr [rip + 0x8b4749], rdi ; 0x100cc34a0
0x10040ed57: mov qword ptr [rip + 0x8b4746], 0 ; 0x100cc34a8
0x10040ed62: lea rdx, [rip + 0x778b81] ; 0x100b878ea sources
0x10040ed69: mov qword ptr [rip + 0x8b4740], rdx ; 0x100cc34b0
0x10040ed70: lea rdx, [rip + 0x8b4739] ; 0x100cc34b0
0x10040ed77: mov qword ptr [rip + 0x8b4742], rax ; 0x100cc34c0
0x10040ed7e: mov qword ptr [rip + 0x868edb], rdx ; 0x100c77c60
0x10040ed85: mov qword ptr [rip + 0x8b4740], 0xa0 ; 0x100cc34d0
0x10040ed90: mov qword ptr [rip + 0x8b4741], rsi ; 0x100cc34d8
0x10040ed97: mov qword ptr [rip + 0x8b4742], rcx ; 0x100cc34e0
0x10040ed9e: mov qword ptr [rip + 0x8b473f], 0x3a0 ; 0x100cc34e8
0x10040eda9: mov rax, qword ptr [rip + 0x7f87c8] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x10040edb0: mov qword ptr [rip + 0x8b4739], rax ; 0x100cc34f0
0x10040edb7: mov qword ptr [rip + 0x8b4736], 0x20 ; 0x100cc34f8
0x10040edc2: lea rax, [rip + 0x778b29] ; 0x100b878f2 AllocateSources
0x10040edc9: mov qword ptr [rip + 0x1bf48a8], rax ; 0x102003678
0x10040edd0: lea rdx, [rip + 0x1bf48a1] ; 0x102003678
0x10040edd7: mov qword ptr [rip + 0x1bf489e], 0 ; 0x102003680
0x10040ede2: mov qword ptr [rip + 0x1bf489f], r8 ; 0x102003688
0x10040ede9: mov qword ptr [rip + 0x861170], rdx ; 0x100c6ff60
0x10040edf0: lea rdx, [rip - 0x3cd7] ; 0x10040b120
0x10040edf7: vmovq xmm0, rdx
0x10040edfc: vmovdqu xmmword ptr [rip + 0x1bf48ac], xmm0 ; 0x1020036b0
0x10040ee04: mov rdx, qword ptr [rip + 0x7f6955] ; 0x100c05760 -> 0x10040ea70 __Z12ApplyWrapperI12LevelObjectsMS0_FvjEEvM9VoidClassFvvEPv8VariablePS7_j
0x10040ee0b: mov qword ptr [rip + 0x1bf48ae], rdx ; 0x1020036c0
0x10040ee12: mov rdx, qword ptr [rip + 0x7fa1d7] ; 0x100c08ff0 -> 0x10040eb10 __Z21InitFunctionSignatureIM12LevelObjectsFvjEEvP17FunctionSignature
0x10040ee19: mov qword ptr [rip + 0x1bf48a8], rdx ; 0x1020036c8
0x10040ee20: mov qword ptr [rip + 0x1bf48a9], rcx ; 0x1020036d0
0x10040ee27: vmovq xmm0, rax
0x10040ee2c: lea rax, [rip + 0x76be4b] ; 0x100b7ac7e ArrayAllocator
0x10040ee33: vmovq xmm1, rax
0x10040ee38: vpunpcklqdq xmm0, xmm1, xmm0
0x10040ee3c: vmovdqa xmmword ptr [rip + 0x1bf489c], xmm0 ; 0x1020036e0
0x10040ee44: lea rax, [rip + 0x1bf4895] ; 0x1020036e0
0x10040ee4b: mov qword ptr [rip + 0x1bf489a], 0 ; 0x1020036f0
0x10040ee56: mov qword ptr [rip + 0x8b465b], rax ; 0x100cc34b8
0x10040ee5d: pop rbp
0x10040ee5e: ret 
0x10040ee5f: nop 
