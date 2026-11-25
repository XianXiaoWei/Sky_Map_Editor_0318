0x100a69680: push rbp
0x100a69681: mov rbp, rsp
0x100a69684: push r15
0x100a69686: push r14
0x100a69688: push r13
0x100a6968a: push r12
0x100a6968c: push rbx
0x100a6968d: sub rsp, 0x18
0x100a69691: mov r12, rsi
0x100a69694: mov r13, rdi
0x100a69697: mov eax, dword ptr [r13 + 0x19c]
0x100a6969e: cmp eax, dword ptr [r13 + 0x198]
0x100a696a5: jae 0x100a69b4f
0x100a696ab: inc eax
0x100a696ad: mov dword ptr [r13 + 0x19c], eax
0x100a696b4: mov rax, qword ptr [r13 + 0x1a8]
0x100a696bb: mov r14d, 0xffffffff
0x100a696c1: mov ebx, 0xffffffe0
0x100a696c6: nop word ptr cs:[rax + rax]
0x100a696d0: inc r14d
0x100a696d3: mov edx, dword ptr [rax + r14*4]
0x100a696d7: add ebx, 0x20
0x100a696da: cmp edx, -1
0x100a696dd: je 0x100a696d0
0x100a696df: mov esi, r14d
0x100a696e2: mov ecx, edx
0x100a696e4: not ecx
0x100a696e6: bsf ecx, ecx
0x100a696e9: mov edi, 1
0x100a696ee: shl edi, cl
0x100a696f0: mov dword ptr [rbp - 0x34], edi
0x100a696f3: or edx, edi
0x100a696f5: mov dword ptr [rax + rsi*4], edx
0x100a696f8: or ebx, ecx
0x100a696fa: mov rax, qword ptr [r13 + 0x1a0]
0x100a69701: mov qword ptr [rax + rbx*8], 0
0x100a69709: mov rdi, qword ptr [rip + 0x201e98] ; 0x100c6b5a8
0x100a69710: mov rsi, qword ptr [rip + 0x1fdeb1] ; 0x100c675c8
0x100a69717: mov r15, qword ptr [rip + 0x1a43f2] ; 0x100c0db10
0x100a6971e: call r15
0x100a69721: mov rsi, qword ptr [rip + 0x1fdef0] ; 0x100c67618
0x100a69728: mov rdi, rax
0x100a6972b: call r15
0x100a6972e: mov r15, rax
0x100a69731: cmp byte ptr [r12], 0
0x100a69736: mov qword ptr [rbp - 0x40], r13
0x100a6973a: je 0x100a6974f
0x100a6973c: mov eax, dword ptr [r12 + 4]
0x100a69741: dec eax
0x100a69743: cmp eax, 6
0x100a69746: ja 0x100a69756
0x100a69748: mov edx, eax
0x100a6974a: inc rdx
0x100a6974d: jmp 0x100a69758 ; 0x100a69758
0x100a6974f: mov edx, 7
0x100a69754: jmp 0x100a69758 ; 0x100a69758
0x100a69756: xor edx, edx
0x100a69758: mov rsi, qword ptr [rip + 0x2007a1] ; 0x100c69f00
0x100a6975f: mov rdi, r15
0x100a69762: mov qword ptr [rbp - 0x30], r15
0x100a69766: call qword ptr [rip + 0x1a43a4] ; 0x100c0db10
0x100a6976c: movsx edx, byte ptr [r12 + 1]
0x100a69772: mov rsi, qword ptr [rip + 0x20078f] ; 0x100c69f08
0x100a69779: mov rdi, r15
0x100a6977c: call qword ptr [rip + 0x1a438e] ; 0x100c0db10
0x100a69782: cmp byte ptr [r12 + 8], 0
0x100a69788: je 0x100a69ae0
0x100a6978e: mov r13d, dword ptr [r12 + 0x24]
0x100a69793: mov rsi, qword ptr [rip + 0x200776] ; 0x100c69f10
0x100a6979a: mov rdi, r15
0x100a6979d: call qword ptr [rip + 0x1a436d] ; 0x100c0db10
0x100a697a3: dec r13d
0x100a697a6: mov ecx, r13d
0x100a697a9: inc rcx
0x100a697ac: xor r15d, r15d
0x100a697af: cmp r13d, 7
0x100a697b3: cmovb r15, rcx
0x100a697b7: mov rdi, rax
0x100a697ba: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a697bf: mov r13, rax
0x100a697c2: mov rsi, qword ptr [rip + 0x20074f] ; 0x100c69f18
0x100a697c9: mov rdi, r13
0x100a697cc: mov rdx, r15
0x100a697cf: call qword ptr [rip + 0x1a433b] ; 0x100c0db10
0x100a697d5: mov rdi, r13
0x100a697d8: call qword ptr [rip + 0x1a433a] ; 0x100c0db18
0x100a697de: mov r13d, dword ptr [r12 + 0x20]
0x100a697e3: mov rdi, qword ptr [rbp - 0x30]
0x100a697e7: mov rsi, qword ptr [rip + 0x200722] ; 0x100c69f10
0x100a697ee: call qword ptr [rip + 0x1a431c] ; 0x100c0db10
0x100a697f4: dec r13d
0x100a697f7: mov ecx, r13d
0x100a697fa: inc rcx
0x100a697fd: xor r15d, r15d
0x100a69800: cmp r13d, 7
0x100a69804: cmovb r15, rcx
0x100a69808: mov rdi, rax
0x100a6980b: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69810: mov r13, rax
0x100a69813: mov rsi, qword ptr [rip + 0x200706] ; 0x100c69f20
0x100a6981a: mov rdi, r13
0x100a6981d: mov rdx, r15
0x100a69820: call qword ptr [rip + 0x1a42ea] ; 0x100c0db10
0x100a69826: mov rdi, r13
0x100a69829: call qword ptr [rip + 0x1a42e9] ; 0x100c0db18
0x100a6982f: mov r13d, dword ptr [r12 + 0x28]
0x100a69834: mov rdi, qword ptr [rbp - 0x30]
0x100a69838: mov rsi, qword ptr [rip + 0x2006d1] ; 0x100c69f10
0x100a6983f: call qword ptr [rip + 0x1a42cb] ; 0x100c0db10
0x100a69845: dec r13d
0x100a69848: mov ecx, r13d
0x100a6984b: inc rcx
0x100a6984e: xor r15d, r15d
0x100a69851: cmp r13d, 7
0x100a69855: cmovb r15, rcx
0x100a69859: mov rdi, rax
0x100a6985c: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69861: mov r13, rax
0x100a69864: mov rsi, qword ptr [rip + 0x2006bd] ; 0x100c69f28
0x100a6986b: mov rdi, r13
0x100a6986e: mov rdx, r15
0x100a69871: call qword ptr [rip + 0x1a4299] ; 0x100c0db10
0x100a69877: mov rdi, r13
0x100a6987a: call qword ptr [rip + 0x1a4298] ; 0x100c0db18
0x100a69880: mov r13d, dword ptr [r12 + 0x10]
0x100a69885: mov rdi, qword ptr [rbp - 0x30]
0x100a69889: mov rsi, qword ptr [rip + 0x200680] ; 0x100c69f10
0x100a69890: call qword ptr [rip + 0x1a427a] ; 0x100c0db10
0x100a69896: dec r13d
0x100a69899: mov ecx, r13d
0x100a6989c: inc rcx
0x100a6989f: xor r15d, r15d
0x100a698a2: cmp r13d, 7
0x100a698a6: cmovb r15, rcx
0x100a698aa: mov rdi, rax
0x100a698ad: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a698b2: mov r13, rax
0x100a698b5: mov rsi, qword ptr [rip + 0x200674] ; 0x100c69f30
0x100a698bc: mov rdi, r13
0x100a698bf: mov rdx, r15
0x100a698c2: call qword ptr [rip + 0x1a4248] ; 0x100c0db10
0x100a698c8: mov rdi, r13
0x100a698cb: call qword ptr [rip + 0x1a4247] ; 0x100c0db18
0x100a698d1: movzx r13d, byte ptr [r12 + 9]
0x100a698d7: mov r15, qword ptr [rbp - 0x30]
0x100a698db: mov rdi, r15
0x100a698de: mov rsi, qword ptr [rip + 0x20062b] ; 0x100c69f10
0x100a698e5: call qword ptr [rip + 0x1a4225] ; 0x100c0db10
0x100a698eb: mov rsi, qword ptr [rip + 0x2005ae] ; 0x100c69ea0
0x100a698f2: mov rdi, rax
0x100a698f5: mov edx, r13d
0x100a698f8: call qword ptr [rip + 0x1a4212] ; 0x100c0db10
0x100a698fe: mov rdi, r15
0x100a69901: mov rsi, qword ptr [rip + 0x200608] ; 0x100c69f10
0x100a69908: call qword ptr [rip + 0x1a4202] ; 0x100c0db10
0x100a6990e: mov rdi, rax
0x100a69911: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69916: mov r13, rax
0x100a69919: mov rsi, qword ptr [rip + 0x200618] ; 0x100c69f38
0x100a69920: mov edx, 0xffffffff
0x100a69925: mov rdi, r13
0x100a69928: call qword ptr [rip + 0x1a41e2] ; 0x100c0db10
0x100a6992e: mov rdi, r13
0x100a69931: call qword ptr [rip + 0x1a41e1] ; 0x100c0db18
0x100a69937: mov r13d, dword ptr [r12 + 0x18]
0x100a6993c: mov rsi, qword ptr [rip + 0x2005fd] ; 0x100c69f40
0x100a69943: mov rdi, r15
0x100a69946: call qword ptr [rip + 0x1a41c4] ; 0x100c0db10
0x100a6994c: dec r13d
0x100a6994f: mov ecx, r13d
0x100a69952: inc rcx
0x100a69955: xor r15d, r15d
0x100a69958: cmp r13d, 7
0x100a6995c: cmovb r15, rcx
0x100a69960: mov rdi, rax
0x100a69963: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69968: mov r13, rax
0x100a6996b: mov rdi, r13
0x100a6996e: mov rsi, qword ptr [rip + 0x2005a3] ; 0x100c69f18
0x100a69975: mov rdx, r15
0x100a69978: call qword ptr [rip + 0x1a4192] ; 0x100c0db10
0x100a6997e: mov rdi, r13
0x100a69981: call qword ptr [rip + 0x1a4191] ; 0x100c0db18
0x100a69987: mov r13d, dword ptr [r12 + 0x14]
0x100a6998c: mov rdi, qword ptr [rbp - 0x30]
0x100a69990: mov rsi, qword ptr [rip + 0x2005a9] ; 0x100c69f40
0x100a69997: call qword ptr [rip + 0x1a4173] ; 0x100c0db10
0x100a6999d: dec r13d
0x100a699a0: mov ecx, r13d
0x100a699a3: inc rcx
0x100a699a6: xor r15d, r15d
0x100a699a9: cmp r13d, 7
0x100a699ad: cmovb r15, rcx
0x100a699b1: mov rdi, rax
0x100a699b4: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a699b9: mov r13, rax
0x100a699bc: mov rdi, r13
0x100a699bf: mov rsi, qword ptr [rip + 0x20055a] ; 0x100c69f20
0x100a699c6: mov rdx, r15
0x100a699c9: call qword ptr [rip + 0x1a4141] ; 0x100c0db10
0x100a699cf: mov rdi, r13
0x100a699d2: call qword ptr [rip + 0x1a4140] ; 0x100c0db18
0x100a699d8: mov r13d, dword ptr [r12 + 0x1c]
0x100a699dd: mov rdi, qword ptr [rbp - 0x30]
0x100a699e1: mov rsi, qword ptr [rip + 0x200558] ; 0x100c69f40
0x100a699e8: call qword ptr [rip + 0x1a4122] ; 0x100c0db10
0x100a699ee: dec r13d
0x100a699f1: mov ecx, r13d
0x100a699f4: inc rcx
0x100a699f7: xor r15d, r15d
0x100a699fa: cmp r13d, 7
0x100a699fe: cmovb r15, rcx
0x100a69a02: mov rdi, rax
0x100a69a05: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69a0a: mov r13, rax
0x100a69a0d: mov rdi, r13
0x100a69a10: mov rsi, qword ptr [rip + 0x200511] ; 0x100c69f28
0x100a69a17: mov rdx, r15
0x100a69a1a: call qword ptr [rip + 0x1a40f0] ; 0x100c0db10
0x100a69a20: mov rdi, r13
0x100a69a23: call qword ptr [rip + 0x1a40ef] ; 0x100c0db18
0x100a69a29: mov r13d, dword ptr [r12 + 0xc]
0x100a69a2e: mov rdi, qword ptr [rbp - 0x30]
0x100a69a32: mov rsi, qword ptr [rip + 0x200507] ; 0x100c69f40
0x100a69a39: call qword ptr [rip + 0x1a40d1] ; 0x100c0db10
0x100a69a3f: dec r13d
0x100a69a42: mov ecx, r13d
0x100a69a45: inc rcx
0x100a69a48: xor r15d, r15d
0x100a69a4b: cmp r13d, 7
0x100a69a4f: cmovb r15, rcx
0x100a69a53: mov rdi, rax
0x100a69a56: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69a5b: mov r13, rax
0x100a69a5e: mov rdi, r13
0x100a69a61: mov rsi, qword ptr [rip + 0x2004c8] ; 0x100c69f30
0x100a69a68: mov rdx, r15
0x100a69a6b: call qword ptr [rip + 0x1a409f] ; 0x100c0db10
0x100a69a71: mov rdi, r13
0x100a69a74: call qword ptr [rip + 0x1a409e] ; 0x100c0db18
0x100a69a7a: movzx r12d, byte ptr [r12 + 9]
0x100a69a80: mov r15, qword ptr [rbp - 0x30]
0x100a69a84: mov rdi, r15
0x100a69a87: mov rsi, qword ptr [rip + 0x2004b2] ; 0x100c69f40
0x100a69a8e: call qword ptr [rip + 0x1a407c] ; 0x100c0db10
0x100a69a94: mov rdi, rax
0x100a69a97: mov rsi, qword ptr [rip + 0x200402] ; 0x100c69ea0
0x100a69a9e: mov edx, r12d
0x100a69aa1: call qword ptr [rip + 0x1a4069] ; 0x100c0db10
0x100a69aa7: mov rdi, r15
0x100a69aaa: mov rsi, qword ptr [rip + 0x20048f] ; 0x100c69f40
0x100a69ab1: call qword ptr [rip + 0x1a4059] ; 0x100c0db10
0x100a69ab7: mov rdi, rax
0x100a69aba: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69abf: mov r12, rax
0x100a69ac2: mov edx, 0xffffffff
0x100a69ac7: mov rdi, r12
0x100a69aca: mov rsi, qword ptr [rip + 0x200467] ; 0x100c69f38
0x100a69ad1: call qword ptr [rip + 0x1a4039] ; 0x100c0db10
0x100a69ad7: mov rdi, r12
0x100a69ada: call qword ptr [rip + 0x1a4038] ; 0x100c0db18
0x100a69ae0: mov rax, qword ptr [rbp - 0x40]
0x100a69ae4: mov rdi, qword ptr [rax + 8]
0x100a69ae8: mov rsi, qword ptr [rip + 0x200459] ; 0x100c69f48
0x100a69aef: mov rdx, r15
0x100a69af2: call qword ptr [rip + 0x1a4018] ; 0x100c0db10
0x100a69af8: mov rdx, qword ptr [rbp - 0x40]
0x100a69afc: cmp dword ptr [rdx + 0x198], ebx
0x100a69b02: jbe 0x100a69b76
0x100a69b04: mov rcx, qword ptr [rdx + 0x1a8]
0x100a69b0b: and r14d, 0x7ffffff
0x100a69b12: mov esi, dword ptr [rbp - 0x34]
0x100a69b15: test dword ptr [rcx + r14*4], esi
0x100a69b19: je 0x100a69ba2
0x100a69b1f: mov rcx, qword ptr [rdx + 0x1a0]
0x100a69b26: mov rdi, qword ptr [rcx + rbx*8]
0x100a69b2a: mov qword ptr [rcx + rbx*8], rax
0x100a69b2e: mov r14, qword ptr [rip + 0x1a3fe3] ; 0x100c0db18
0x100a69b35: call r14
0x100a69b38: mov rdi, r15
0x100a69b3b: call r14
0x100a69b3e: mov eax, ebx
0x100a69b40: add rsp, 0x18
0x100a69b44: pop rbx
0x100a69b45: pop r12
0x100a69b47: pop r13
0x100a69b49: pop r14
0x100a69b4b: pop r15
0x100a69b4d: pop rbp
0x100a69b4e: ret 
0x100a69b4f: mov rcx, qword ptr [r13 + 0x190]
0x100a69b56: lea rdi, [rip + 0x157e43] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a69b5d: lea rdx, [rip + 0x157e63] ; 0x100bc19c7 %s: Exceeded maximum capacity
0x100a69b64: mov esi, 0x6c
0x100a69b69: xor eax, eax
0x100a69b6b: call qword ptr [rip + 0x12fe797] ; 0x101d68308
0x100a69b71: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a69b76: mov rcx, qword ptr [rdx + 0x190]
0x100a69b7d: lea rdi, [rip + 0x157e1c] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a69b84: lea rdx, [rip + 0x157e5a] ; 0x100bc19e5 %s: Attempted to access out of bounds [%u]
0x100a69b8b: mov esi, 0x64
0x100a69b90: xor eax, eax
0x100a69b92: mov r8d, ebx
0x100a69b95: call qword ptr [rip + 0x12fe76d] ; 0x101d68308
0x100a69b9b: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a69ba0: jmp 0x100a69bcc ; 0x100a69bcc
0x100a69ba2: mov rcx, qword ptr [rdx + 0x190]
0x100a69ba9: lea rdi, [rip + 0x157df0] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a69bb0: lea rdx, [rip + 0x157e59] ; 0x100bc1a10 %s: Attempted to access unallocated slot [%u]
0x100a69bb7: mov esi, 0x65
0x100a69bbc: xor eax, eax
0x100a69bbe: mov r8d, ebx
0x100a69bc1: call qword ptr [rip + 0x12fe741] ; 0x101d68308
0x100a69bc7: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a69bcc: ud2 
0x100a69bce: mov rbx, rax
0x100a69bd1: mov rdi, r12
0x100a69bd4: call qword ptr [rip + 0x1a3f3e] ; 0x100c0db18
0x100a69bda: jmp 0x100a69c01 ; 0x100a69c01
0x100a69bdc: jmp 0x100a69bfe ; 0x100a69bfe
0x100a69bde: jmp 0x100a69bf0 ; 0x100a69bf0
0x100a69be0: jmp 0x100a69bf0 ; 0x100a69bf0
0x100a69be2: jmp 0x100a69bf0 ; 0x100a69bf0
0x100a69be4: jmp 0x100a69bf0 ; 0x100a69bf0
0x100a69be6: jmp 0x100a69bf0 ; 0x100a69bf0
0x100a69be8: jmp 0x100a69bfe ; 0x100a69bfe
0x100a69bea: jmp 0x100a69bf0 ; 0x100a69bf0
0x100a69bec: jmp 0x100a69bf0 ; 0x100a69bf0
0x100a69bee: jmp 0x100a69bf0 ; 0x100a69bf0
0x100a69bf0: mov rbx, rax
0x100a69bf3: mov rdi, r13
0x100a69bf6: call qword ptr [rip + 0x1a3f1c] ; 0x100c0db18
0x100a69bfc: jmp 0x100a69c01 ; 0x100a69c01
0x100a69bfe: mov rbx, rax
0x100a69c01: mov rdi, qword ptr [rbp - 0x30]
0x100a69c05: call qword ptr [rip + 0x1a3f0d] ; 0x100c0db18
0x100a69c0b: mov rdi, rbx
0x100a69c0e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100a69c13: ud2 
0x100a69c15: nop word ptr cs:[rax + rax]
