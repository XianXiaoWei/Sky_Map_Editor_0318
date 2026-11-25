0x100401040: push rbp
0x100401041: mov rbp, rsp
0x100401044: push r15
0x100401046: push r14
0x100401048: push r13
0x10040104a: push r12
0x10040104c: push rbx
0x10040104d: sub rsp, 0x338
0x100401054: mov r13, r8
0x100401057: mov dword ptr [rbp - 0x278], ecx
0x10040105d: mov r12, rdx
0x100401060: mov r15, rsi
0x100401063: mov rbx, rdi
0x100401066: mov rax, qword ptr [rip + 0x80c86b] ; 0x100c0d8d8
0x10040106d: mov rax, qword ptr [rax]
0x100401070: mov qword ptr [rbp - 0x30], rax
0x100401074: cmp byte ptr [rbx + 0xa30], 0
0x10040107b: mov qword ptr [rbp - 0x300], r13
0x100401082: jne 0x10040108d
0x100401084: cmp byte ptr [rbx + 0xa31], 0
0x10040108b: je 0x1004010f1
0x10040108d: mov r13, r15
0x100401090: lea rdi, [rbp - 0x2f0]
0x100401097: call 0x1007c2530 ; 0x1007c2530
0x10040109c: lea r15, [rbx + 0x58]
0x1004010a0: test byte ptr [rbx + 0x58], 1
0x1004010a4: jne 0x1004010ac
0x1004010a6: lea r14, [r15 + 1]
0x1004010aa: jmp 0x1004010b0 ; 0x1004010b0
0x1004010ac: mov r14, qword ptr [rbx + 0x68]
0x1004010b0: call 0x1004559d0 ; 0x1004559d0
0x1004010b5: mov rdi, r12
0x1004010b8: mov rsi, rax
0x1004010bb: mov rdx, r14
0x1004010be: call 0x1007c4360 ; 0x1007c4360
0x1004010c3: test rax, rax
0x1004010c6: je 0x1004011ea
0x1004010cc: lea rsi, [rbp - 0x2f0]
0x1004010d3: mov rdi, rax
0x1004010d6: call 0x1007c2310 ; 0x1007c2310
0x1004010db: lea rdi, [rbp - 0x2f0]
0x1004010e2: call 0x1007c2570 ; 0x1007c2570
0x1004010e7: mov r15, r13
0x1004010ea: mov r13, qword ptr [rbp - 0x300]
0x1004010f1: movabs rax, 0x700000000
0x1004010fb: mov qword ptr [rbp - 0x2f0], rax
0x100401102: mov byte ptr [rbp - 0x2e4], 0
0x100401109: mov dword ptr [rbp - 0x2e8], 0
0x100401113: mov word ptr [rbp - 0x2e3], 1
0x10040111c: mov dword ptr [rbp - 0x2e0], 0x447a0000
0x100401126: mov word ptr [rbp - 0x2dc], 0
0x10040112f: movabs rax, 0x3f8000003f800000
0x100401139: mov qword ptr [rbp - 0x2d8], rax
0x100401140: mov byte ptr [rbp - 0x2d0], 0
0x100401147: mov qword ptr [rbp - 0x2cc], 0x3eb33333
0x100401152: mov dword ptr [rbp - 0x2c4], 0xc11cf5c3
0x10040115c: mov word ptr [rbp - 0x2c0], 0
0x100401165: mov byte ptr [rbp - 0x2be], 0
0x10040116c: mov dword ptr [rbp - 0x2bc], 0
0x100401176: movabs rax, 0x3f8000003cf5c28f
0x100401180: mov qword ptr [rbp - 0x2b0], rax
0x100401187: mov byte ptr [rbp - 0x2a8], 1
0x10040118e: movabs rax, 0x100000000
0x100401198: mov qword ptr [rbp - 0x2a4], rax
0x10040119f: mov dword ptr [rbp - 0x29c], 0x3f800000
0x1004011a9: mov byte ptr [rbp - 0x298], 0
0x1004011b0: mov byte ptr [rbp - 0x297], 0
0x1004011b7: mov al, byte ptr [rbx + 0x71]
0x1004011ba: mov byte ptr [rbp - 0x2e8], al
0x1004011c0: test al, al
0x1004011c2: je 0x100401289
0x1004011c8: movzx eax, byte ptr [rbx + 0x80]
0x1004011cf: test al, 1
0x1004011d1: jne 0x100401290
0x1004011d7: shr rax, 1
0x1004011da: test rax, rax
0x1004011dd: je 0x1004012a0
0x1004011e3: xor eax, eax
0x1004011e5: jmp 0x100401334 ; 0x100401334
0x1004011ea: lea rdi, [rbp - 0x120]
0x1004011f1: lea r13, [rbp - 0x268]
0x1004011f8: mov rax, qword ptr [rip + 0x809321] ; 0x100c0a520
0x1004011ff: lea rcx, [rax + 0x18]
0x100401203: mov qword ptr [rbp - 0x270], rcx
0x10040120a: add rax, 0x40
0x10040120e: mov qword ptr [rbp - 0x120], rax
0x100401215: mov rsi, r13
0x100401218: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10040121d: mov qword ptr [rbp - 0x98], 0
0x100401228: mov dword ptr [rbp - 0x90], 0xffffffff
0x100401232: mov r14, qword ptr [rip + 0x80c38f] ; 0x100c0d5c8
0x100401239: lea r12, [r14 + 0x18]
0x10040123d: mov qword ptr [rbp - 0x270], r12
0x100401244: add r14, 0x40
0x100401248: mov qword ptr [rbp - 0x120], r14
0x10040124f: lea rsi, [rip + 0x75fdf0] ; 0x100b61046 LevelMesh
0x100401256: mov edx, 1
0x10040125b: mov rdi, r13
0x10040125e: call 0x1007a56a0 ; 0x1007a56a0
0x100401263: lea rsi, [rip + 0x78625c] ; 0x100b874c6 Ignoring LevelMesh HotDate with new mesh '
0x10040126a: lea rdi, [rbp - 0x270]
0x100401271: mov edx, 0x2a
0x100401276: call 0x100011930 ; 0x100011930
0x10040127b: mov r13, rax
0x10040127e: test byte ptr [r15], 1
0x100401282: jne 0x1004012b0
0x100401284: inc r15
0x100401287: jmp 0x1004012b4 ; 0x1004012b4
0x100401289: xor eax, eax
0x10040128b: jmp 0x100401336 ; 0x100401336
0x100401290: mov rax, qword ptr [rbx + 0x88]
0x100401297: test rax, rax
0x10040129a: jne 0x1004011e3
0x1004012a0: movzx eax, byte ptr [rbx + 0x98]
0x1004012a7: test al, 1
0x1004012a9: jne 0x100401327
0x1004012ab: shr rax, 1
0x1004012ae: jmp 0x10040132e ; 0x10040132e
0x1004012b0: mov r15, qword ptr [rbx + 0x68]
0x1004012b4: mov rdi, r15
0x1004012b7: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1004012bc: mov rdi, r13
0x1004012bf: mov rsi, r15
0x1004012c2: mov rdx, rax
0x1004012c5: call 0x100011930 ; 0x100011930
0x1004012ca: lea rsi, [rip + 0x786220] ; 0x100b874f1 '. Export and reload the level.
0x1004012d1: mov edx, 0x1f
0x1004012d6: mov rdi, rax
0x1004012d9: call 0x100011930 ; 0x100011930
0x1004012de: mov qword ptr [rbp - 0x270], r12
0x1004012e5: mov qword ptr [rbp - 0x120], r14
0x1004012ec: lea rdi, [rbp - 0x268]
0x1004012f3: call 0x1007a58d0 ; 0x1007a58d0
0x1004012f8: mov rsi, qword ptr [rip + 0x809281] ; 0x100c0a580
0x1004012ff: add rsi, 8
0x100401303: lea rdi, [rbp - 0x270]
0x10040130a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10040130f: lea rdi, [rbp - 0x120]
0x100401316: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10040131b: lea rdi, [rbp - 0x2f0]
0x100401322: jmp 0x100401b52 ; 0x100401b52
0x100401327: mov rax, qword ptr [rbx + 0xa0]
0x10040132e: test rax, rax
0x100401331: sete al
0x100401334: xor al, 1
0x100401336: mov byte ptr [rbp - 0x2e7], al
0x10040133c: mov al, byte ptr [rbx + 0x105]
0x100401342: mov byte ptr [rbp - 0x2e3], al
0x100401348: mov al, byte ptr [rbx + 0x107]
0x10040134e: mov byte ptr [rbp - 0x2e2], al
0x100401354: mov al, byte ptr [rbx + 0x109]
0x10040135a: mov byte ptr [rbp - 0x2bf], al
0x100401360: mov al, byte ptr [rbx + 0xe4]
0x100401366: mov byte ptr [rbp - 0x2dc], al
0x10040136c: mov al, byte ptr [rbx + 0xe5]
0x100401372: mov byte ptr [rbp - 0x2db], al
0x100401378: mov eax, dword ptr [rbx + 0xe8]
0x10040137e: mov dword ptr [rbp - 0x2d8], eax
0x100401384: mov eax, dword ptr [rbx + 0xec]
0x10040138a: mov dword ptr [rbp - 0x2d4], eax
0x100401390: mov al, byte ptr [rbx + 0xf0]
0x100401396: mov byte ptr [rbp - 0x2c0], al
0x10040139c: mov al, byte ptr [rbx + 0xf1]
0x1004013a2: mov byte ptr [rbp - 0x2d0], al
0x1004013a8: mov eax, dword ptr [rbx + 0xf4]
0x1004013ae: mov dword ptr [rbp - 0x2cc], eax
0x1004013b4: mov al, byte ptr [rbx + 0xf8]
0x1004013ba: mov byte ptr [rbp - 0x2c8], al
0x1004013c0: mov al, byte ptr [rbx + 0xdc]
0x1004013c6: mov byte ptr [rbp - 0x2c6], al
0x1004013cc: mov al, byte ptr [rbx + 0xf9]
0x1004013d2: mov byte ptr [rbp - 0x2c5], al
0x1004013d8: mov eax, dword ptr [rbx + 0xfc]
0x1004013de: mov dword ptr [rbp - 0x2c4], eax
0x1004013e4: mov al, byte ptr [rbx + 0x70]
0x1004013e7: mov byte ptr [rbp - 0x2be], al
0x1004013ed: mov al, byte ptr [rbx + 0xb3]
0x1004013f3: mov byte ptr [rbp - 0x2e5], al
0x1004013f9: mov al, byte ptr [rbx + 0xb4]
0x1004013ff: mov byte ptr [rbp - 0x2e4], al
0x100401405: mov eax, dword ptr [rbx + 0x140]
0x10040140b: mov dword ptr [rbp - 0x2bc], eax
0x100401411: test byte ptr [rbx + 0x148], 1
0x100401418: jne 0x100401426
0x10040141a: lea rax, [rbx + 0x148]
0x100401421: inc rax
0x100401424: jmp 0x10040142d ; 0x10040142d
0x100401426: mov rax, qword ptr [rbx + 0x158]
0x10040142d: mov qword ptr [rbp - 0x2b8], rax
0x100401434: mov eax, dword ptr [rbx + 0x160]
0x10040143a: mov dword ptr [rbp - 0x2b0], eax
0x100401440: mov eax, dword ptr [rbx + 0x164]
0x100401446: mov dword ptr [rbp - 0x2ac], eax
0x10040144c: mov al, byte ptr [rbx + 0x168]
0x100401452: mov byte ptr [rbp - 0x2a8], al
0x100401458: mov eax, dword ptr [rbx + 0x16c]
0x10040145e: mov dword ptr [rbp - 0x2a4], eax
0x100401464: mov al, byte ptr [rbx + 0x106]
0x10040146a: mov byte ptr [rbp - 0x298], al
0x100401470: mov eax, dword ptr [rbx + 0x170]
0x100401476: mov dword ptr [rbp - 0x2a0], eax
0x10040147c: mov eax, dword ptr [rbx + 0x174]
0x100401482: mov dword ptr [rbp - 0x29c], eax
0x100401488: mov al, byte ptr [rbx + 0x10a]
0x10040148e: mov byte ptr [rbp - 0x297], al
0x100401494: test byte ptr [rbx + 0x110], 1
0x10040149b: jne 0x1004014c0
0x10040149d: lea rax, [rbx + 0x110]
0x1004014a4: inc rax
0x1004014a7: mov qword ptr [rbp - 0x290], rax
0x1004014ae: test byte ptr [rbx + 0x128], 1
0x1004014b5: je 0x1004014d7
0x1004014b7: mov rax, qword ptr [rbx + 0x138]
0x1004014be: jmp 0x1004014e1 ; 0x1004014e1
0x1004014c0: mov rax, qword ptr [rbx + 0x120]
0x1004014c7: mov qword ptr [rbp - 0x290], rax
0x1004014ce: test byte ptr [rbx + 0x128], 1
0x1004014d5: jne 0x1004014b7
0x1004014d7: lea rax, [rbx + 0x128]
0x1004014de: inc rax
0x1004014e1: mov qword ptr [rbp - 0x288], rax
0x1004014e8: lea rax, [rbx + 0xb1]
0x1004014ef: lea r14, [rbx + 0xd9]
0x1004014f6: cmp byte ptr [rbp - 0x278], 0
0x1004014fd: cmovne rax, r14
0x100401501: mov al, byte ptr [rax]
0x100401503: mov byte ptr [rbp - 0x2e6], al
0x100401509: mov eax, dword ptr [rbx + 0x100]
0x10040150f: mov dword ptr [rbp - 0x2e0], eax
0x100401515: lea rdi, [rbp - 0x350]
0x10040151c: call 0x1007c2530 ; 0x1007c2530
0x100401521: call 0x1003f10c0 ; 0x1003f10c0
0x100401526: mov rdi, r12
0x100401529: mov rsi, rax
0x10040152c: mov rdx, r13
0x10040152f: call 0x1007c4360 ; 0x1007c4360
0x100401534: test rax, rax
0x100401537: je 0x10040154a
0x100401539: lea rsi, [rbp - 0x350]
0x100401540: mov rdi, rax
0x100401543: call 0x1007c2310 ; 0x1007c2310
0x100401548: jmp 0x10040155e ; 0x10040155e
0x10040154a: call 0x1003f10c0 ; 0x1003f10c0
0x10040154f: mov rsi, qword ptr [rax + 8]
0x100401553: mov rdi, r12
0x100401556: mov rdx, r13
0x100401559: call 0x1007c4640 ; 0x1007c4640
0x10040155e: mov qword ptr [rbp - 0x280], r12
0x100401565: mov rax, qword ptr [rbp - 0x350]
0x10040156c: mov rax, qword ptr [rax + 0x10]
0x100401570: cmp byte ptr [rax + 0x120], 0
0x100401577: je 0x1004015a2
0x100401579: xor r12d, r12d
0x10040157c: cmp byte ptr [rbp - 0x278], 0
0x100401583: je 0x1004015b3
0x100401585: lea rdi, [rbx + 0xb8]
0x10040158c: test byte ptr [rbx + 0xb8], 1
0x100401593: jne 0x10040163c
0x100401599: lea rax, [rdi + 1]
0x10040159d: jmp 0x100401684 ; 0x100401684
0x1004015a2: cmp byte ptr [r14], 0
0x1004015a6: setne r12b
0x1004015aa: cmp byte ptr [rbp - 0x278], 0
0x1004015b1: jne 0x100401585
0x1004015b3: cmp byte ptr [rbx + 0xb7], 0
0x1004015ba: jne 0x1004016b1
0x1004015c0: call 0x10043fb50 ; 0x10043fb50
0x1004015c5: movzx esi, byte ptr [rbx + 0x70]
0x1004015c9: mov rdi, rax
0x1004015cc: call 0x1004434f0 ; 0x1004434f0
0x1004015d1: mov qword ptr [rbp - 0x2f8], r15
0x1004015d8: lea r14, [rbx + 0xb8]
0x1004015df: mov rdi, qword ptr [rax + 8]
0x1004015e3: mov qword ptr [rbp - 0x308], rdi
0x1004015ea: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1004015ef: mov r15, rax
0x1004015f2: movzx ecx, byte ptr [rbx + 0xb8]
0x1004015f9: test cl, 1
0x1004015fc: mov qword ptr [rbp - 0x278], r14
0x100401603: jne 0x100401b7d
0x100401609: mov esi, 0x16
0x10040160e: mov rdx, r15
0x100401611: sub rdx, rsi
0x100401614: ja 0x100401b93
0x10040161a: test cl, 1
0x10040161d: jne 0x100401b9d
0x100401623: mov rax, qword ptr [rbp - 0x278]
0x10040162a: lea r13, [rax + 1]
0x10040162e: test r15, r15
0x100401631: jne 0x100401ba9
0x100401637: jmp 0x100401bbb ; 0x100401bbb
0x10040163c: mov rax, qword ptr [rdi]
0x10040163f: and rax, 0xfffffffffffffffe
0x100401643: lea rsi, [rax - 1]
0x100401647: cmp rsi, 4
0x10040164b: jae 0x10040167d
0x10040164d: mov rcx, qword ptr [rbx + 0xc0]
0x100401654: mov edx, 5
0x100401659: sub rdx, rax
0x10040165c: lea rax, [rip + 0x764bdf] ; 0x100b66242 Mesh
0x100401663: mov qword ptr [rsp + 8], rax
0x100401668: mov qword ptr [rsp], 4
0x100401670: xor r8d, r8d
0x100401673: mov r9, rcx
0x100401676: call 0x1000198c0 ; 0x1000198c0
0x10040167b: jmp 0x1004016a3 ; 0x1004016a3
0x10040167d: mov rax, qword ptr [rbx + 0xc8]
0x100401684: mov dword ptr [rax], 0x6873654d
0x10040168a: mov byte ptr [rax + 4], 0
0x10040168e: test byte ptr [rdi], 1
0x100401691: jne 0x100401698
0x100401693: mov byte ptr [rdi], 8
0x100401696: jmp 0x1004016a3 ; 0x1004016a3
0x100401698: mov qword ptr [rbx + 0xc0], 4
0x1004016a3: mov byte ptr [rbp - 0x2dc], 0
0x1004016aa: mov byte ptr [rbx + 0xb7], 1
0x1004016b1: mov rsi, qword ptr [rbx + 0x228]
0x1004016b8: test byte ptr [rbx + 0x58], 1
0x1004016bc: jne 0x100401cd4
0x1004016c2: lea rcx, [rbx + 0x58]
0x1004016c6: inc rcx
0x1004016c9: test rsi, rsi
0x1004016cc: je 0x100401ce1
0x1004016d2: mov r8d, 0xffffffff
0x1004016d8: test r12b, r12b
0x1004016db: je 0x1004016e1
0x1004016dd: mov r8d, dword ptr [rbx + 0x50]
0x1004016e1: test byte ptr [rbx + 0xb8], 1
0x1004016e8: jne 0x1004016f6
0x1004016ea: lea r9, [rbx + 0xb8]
0x1004016f1: inc r9
0x1004016f4: jmp 0x1004016fd ; 0x1004016fd
0x1004016f6: mov r9, qword ptr [rbx + 0xc8]
0x1004016fd: lea rax, [rbx + 0x10]
0x100401701: lea rdx, [rbp - 0x2f0]
0x100401708: mov qword ptr [rsp + 8], rdx
0x10040170d: mov qword ptr [rsp], rax
0x100401711: mov rdi, r15
0x100401714: mov rdx, r13
0x100401717: call 0x10046d010 ; 0x10046d010
0x10040171c: cmp byte ptr [rbx + 0xb7], 0
0x100401723: je 0x100401d54
0x100401729: cmp dword ptr [rbx + 0x220], 0
0x100401730: je 0x100401778
0x100401732: xor eax, eax
0x100401734: movabs rcx, 0xffffffff00000000
0x10040173e: nop 
0x100401740: mov rdx, qword ptr [rbx + rax*8 + 0x1a0]
0x100401748: mov qword ptr [rdx + 0x58], rcx
0x10040174c: vmovaps xmm0, xmmword ptr [rdx + 0x30]
0x100401751: vmovaps xmmword ptr [rdx + 0x60], xmm0
0x100401756: mov rdx, qword ptr [rbx + rax*8 + 0x1a0]
0x10040175e: mov qword ptr [rdx + 0x70], 0
0x100401766: mov byte ptr [rdx + 0x78], 1
0x10040176a: inc rax
0x10040176d: mov edx, dword ptr [rbx + 0x220]
0x100401773: cmp rax, rdx
0x100401776: jb 0x100401740
0x100401778: mov byte ptr [rbx + 0xa32], 1
0x10040177f: mov r14b, byte ptr [rbx + 0xd0]
0x100401786: mov rdi, qword ptr [rbx + 0x228]
0x10040178d: test rdi, rdi
0x100401790: je 0x10040179b
0x100401792: movzx esi, r14b
0x100401796: call 0x1004636d0 ; 0x1004636d0
0x10040179b: test r14b, r14b
0x10040179e: je 0x1004017ae
0x1004017a0: mov rdi, qword ptr [rbx + 0x228]
0x1004017a7: test rdi, rdi
0x1004017aa: jne 0x1004017c1
0x1004017ac: jmp 0x1004017ca ; 0x1004017ca
0x1004017ae: mov byte ptr [rbx + 0xa55], 1
0x1004017b5: mov rdi, qword ptr [rbx + 0x228]
0x1004017bc: test rdi, rdi
0x1004017bf: je 0x1004017ca
0x1004017c1: lea rsi, [rbx + 0x10]
0x1004017c5: call 0x100463750 ; 0x100463750
0x1004017ca: movzx eax, byte ptr [rbx + 0x80]
0x1004017d1: test al, 1
0x1004017d3: jne 0x1004017e2
0x1004017d5: mov rcx, rax
0x1004017d8: shr rcx, 1
0x1004017db: test rcx, rcx
0x1004017de: jne 0x1004017ee
0x1004017e0: jmp 0x100401827 ; 0x100401827
0x1004017e2: mov rcx, qword ptr [rbx + 0x88]
0x1004017e9: test rcx, rcx
0x1004017ec: je 0x100401827
0x1004017ee: mov rcx, qword ptr [rbx + 0x228]
0x1004017f5: mov rdi, qword ptr [rcx + 0x68]
0x1004017f9: test rdi, rdi
0x1004017fc: je 0x100401f47
0x100401802: test al, 1
0x100401804: jne 0x100401812
0x100401806: mov rdx, rbx
0x100401809: sub rdx, -0x80
0x10040180d: inc rdx
0x100401810: jmp 0x100401819 ; 0x100401819
0x100401812: mov rdx, qword ptr [rbx + 0x90]
0x100401819: mov rsi, qword ptr [rbp - 0x280]
0x100401820: xor ecx, ecx
0x100401822: call 0x1000942e0 ; 0x1000942e0
0x100401827: movzx eax, byte ptr [rbx + 0x98]
0x10040182e: test al, 1
0x100401830: jne 0x10040183f
0x100401832: mov rcx, rax
0x100401835: shr rcx, 1
0x100401838: test rcx, rcx
0x10040183b: jne 0x10040184b
0x10040183d: jmp 0x100401884 ; 0x100401884
0x10040183f: mov rcx, qword ptr [rbx + 0xa0]
0x100401846: test rcx, rcx
0x100401849: je 0x100401884
0x10040184b: mov rcx, qword ptr [rbx + 0x228]
0x100401852: mov rdi, qword ptr [rcx + 0x68]
0x100401856: test rdi, rdi
0x100401859: je 0x100401f66
0x10040185f: test al, 1
0x100401861: jne 0x10040186f
0x100401863: lea rdx, [rbx + 0x98]
0x10040186a: inc rdx
0x10040186d: jmp 0x100401876 ; 0x100401876
0x10040186f: mov rdx, qword ptr [rbx + 0xa8]
0x100401876: mov rsi, qword ptr [rbp - 0x280]
0x10040187d: xor ecx, ecx
0x10040187f: call 0x1000942e0 ; 0x1000942e0
0x100401884: mov rax, qword ptr [rbx + 0x228]
0x10040188b: mov rdi, qword ptr [rax + 0x68]
0x10040188f: test rdi, rdi
0x100401892: je 0x1004018d8
0x100401894: cmp byte ptr [rbx + 0x79], 0
0x100401898: je 0x1004018d8
0x10040189a: call 0x100096120 ; 0x100096120
0x10040189f: mov dword ptr [rbx + 0xa34], eax
0x1004018a5: mov rcx, qword ptr [rbx + 0x228]
0x1004018ac: mov rdi, qword ptr [rcx + 0x68]
0x1004018b0: vmovss xmm0, dword ptr [rbx + 0x74]
0x1004018b5: mov esi, eax
0x1004018b7: call 0x100097bb0 ; 0x100097bb0
0x1004018bc: cmp byte ptr [rbx + 0x78], 0
0x1004018c0: je 0x1004018d8
0x1004018c2: mov rax, qword ptr [rbx + 0x228]
0x1004018c9: mov rdi, qword ptr [rax + 0x68]
0x1004018cd: mov esi, dword ptr [rbx + 0xa34]
0x1004018d3: call 0x100097d30 ; 0x100097d30
0x1004018d8: mov rdi, rbx
0x1004018db: call 0x100402710 ; 0x100402710
0x1004018e0: mov eax, dword ptr [rbx + 0xd4]
0x1004018e6: mov dword ptr [rbx + 0xa50], eax
0x1004018ec: lea r15, [rbx + 0xa38]
0x1004018f3: movzx eax, byte ptr [rbx + 0xb8]
0x1004018fa: lea rsi, [rbx + 0xb9]
0x100401901: mov r12, rax
0x100401904: shr r12, 1
0x100401907: and al, 1
0x100401909: cmovne r12, qword ptr [rbx + 0xc0]
0x100401911: test al, al
0x100401913: cmovne rsi, qword ptr [rbx + 0xc8]
0x10040191b: movzx ecx, byte ptr [rbx + 0xa38]
0x100401922: test cl, 1
0x100401925: jne 0x100401944
0x100401927: mov eax, 0x16
0x10040192c: mov rdx, r12
0x10040192f: sub rdx, rax
0x100401932: ja 0x100401956
0x100401934: test cl, 1
0x100401937: jne 0x100401960
0x100401939: lea r14, [r15 + 1]
0x10040193d: test r12, r12
0x100401940: jne 0x10040196c
0x100401942: jmp 0x100401977 ; 0x100401977
0x100401944: mov rax, qword ptr [r15]
0x100401947: and rax, 0xfffffffffffffffe
0x10040194b: dec rax
0x10040194e: mov rdx, r12
0x100401951: sub rdx, rax
0x100401954: jbe 0x100401934
0x100401956: test cl, 1
0x100401959: jne 0x10040198a
0x10040195b: shr rcx, 1
0x10040195e: jmp 0x100401991 ; 0x100401991
0x100401960: mov r14, qword ptr [rbx + 0xa48]
0x100401967: test r12, r12
0x10040196a: je 0x100401977
0x10040196c: mov rdi, r14
0x10040196f: mov rdx, r12
0x100401972: call 0x100aa28fa ; 0x100aa28fa _memmove
0x100401977: mov byte ptr [r14 + r12], 0
0x10040197c: test byte ptr [r15], 1
0x100401980: jne 0x1004019ad
0x100401982: add r12b, r12b
0x100401985: mov byte ptr [r15], r12b
0x100401988: jmp 0x1004019b4 ; 0x1004019b4
0x10040198a: mov rcx, qword ptr [rbx + 0xa40]
0x100401991: mov qword ptr [rsp + 8], rsi
0x100401996: mov qword ptr [rsp], r12
0x10040199a: xor r8d, r8d
0x10040199d: mov rdi, r15
0x1004019a0: mov rsi, rax
0x1004019a3: mov r9, rcx
0x1004019a6: call 0x1000198c0 ; 0x1000198c0
0x1004019ab: jmp 0x1004019b4 ; 0x1004019b4
0x1004019ad: mov qword ptr [rbx + 0xa40], r12
0x1004019b4: mov al, byte ptr [rbx + 0x70]
0x1004019b7: mov cl, byte ptr [rbx + 0xb7]
0x1004019bd: mov byte ptr [rbx + 0xa33], cl
0x1004019c3: mov byte ptr [rbx + 0xa54], al
0x1004019c9: mov rdi, qword ptr [rbx + 0x228]
0x1004019d0: lea rdx, [rip + 0x785b72] ; 0x100b87549 u_noiseTexture
0x1004019d7: xor esi, esi
0x1004019d9: call 0x100466620 ; 0x100466620
0x1004019de: mov r14, qword ptr [rbp - 0x280]
0x1004019e5: test al, al
0x1004019e7: je 0x100401a84
0x1004019ed: lea rdi, [rbp - 0x270]
0x1004019f4: call 0x1007c2530 ; 0x1007c2530
0x1004019f9: call 0x10079ac90 ; 0x10079ac90
0x1004019fe: lea rdx, [rip + 0x785b53] ; 0x100b87558 ThreeDeeCauliflower
0x100401a05: mov rdi, r14
0x100401a08: mov rsi, rax
0x100401a0b: call 0x1007c4360 ; 0x1007c4360
0x100401a10: test rax, rax
0x100401a13: je 0x100401a26
0x100401a15: lea rsi, [rbp - 0x270]
0x100401a1c: mov rdi, rax
0x100401a1f: call 0x1007c2310 ; 0x1007c2310
0x100401a24: jmp 0x100401a3e ; 0x100401a3e
0x100401a26: call 0x10079ac90 ; 0x10079ac90
0x100401a2b: mov rsi, qword ptr [rax + 8]
0x100401a2f: lea rdx, [rip + 0x785b22] ; 0x100b87558 ThreeDeeCauliflower
0x100401a36: mov rdi, r14
0x100401a39: call 0x1007c4640 ; 0x1007c4640
0x100401a3e: mov rdi, qword ptr [rbx + 0x228]
0x100401a45: mov rax, qword ptr [rbp - 0x270]
0x100401a4c: test rax, rax
0x100401a4f: je 0x100401a65
0x100401a51: mov rax, qword ptr [rax + 0x10]
0x100401a55: lea rcx, [rax + 0xb0]
0x100401a5c: test rax, rax
0x100401a5f: cmove rcx, rax
0x100401a63: jmp 0x100401a67 ; 0x100401a67
0x100401a65: xor ecx, ecx
0x100401a67: lea rdx, [rip + 0x785adb] ; 0x100b87549 u_noiseTexture
0x100401a6e: xor esi, esi
0x100401a70: xor r8d, r8d
0x100401a73: call 0x100466ee0 ; 0x100466ee0
0x100401a78: lea rdi, [rbp - 0x270]
0x100401a7f: call 0x1007c2570 ; 0x1007c2570
0x100401a84: mov rdi, qword ptr [rbx + 0x228]
0x100401a8b: cmp byte ptr [rdi + 0x334], 0
0x100401a92: je 0x100401b4b
0x100401a98: lea rdx, [rip + 0x785aaa] ; 0x100b87549 u_noiseTexture
0x100401a9f: mov esi, 2
0x100401aa4: call 0x100466620 ; 0x100466620
0x100401aa9: test al, al
0x100401aab: je 0x100401b4b
0x100401ab1: lea rdi, [rbp - 0x270]
0x100401ab8: call 0x1007c2530 ; 0x1007c2530
0x100401abd: call 0x10079ac90 ; 0x10079ac90
0x100401ac2: lea rdx, [rip + 0x785a8f] ; 0x100b87558 ThreeDeeCauliflower
0x100401ac9: mov rdi, r14
0x100401acc: mov rsi, rax
0x100401acf: call 0x1007c4360 ; 0x1007c4360
0x100401ad4: test rax, rax
0x100401ad7: je 0x100401aea
0x100401ad9: lea rsi, [rbp - 0x270]
0x100401ae0: mov rdi, rax
0x100401ae3: call 0x1007c2310 ; 0x1007c2310
0x100401ae8: jmp 0x100401b02 ; 0x100401b02
0x100401aea: call 0x10079ac90 ; 0x10079ac90
0x100401aef: mov rsi, qword ptr [rax + 8]
0x100401af3: lea rdx, [rip + 0x785a5e] ; 0x100b87558 ThreeDeeCauliflower
0x100401afa: mov rdi, r14
0x100401afd: call 0x1007c4640 ; 0x1007c4640
0x100401b02: mov rdi, qword ptr [rbx + 0x228]
0x100401b09: mov rax, qword ptr [rbp - 0x270]
0x100401b10: test rax, rax
0x100401b13: je 0x100401b29
0x100401b15: mov rax, qword ptr [rax + 0x10]
0x100401b19: lea rcx, [rax + 0xb0]
0x100401b20: test rax, rax
0x100401b23: cmove rcx, rax
0x100401b27: jmp 0x100401b2b ; 0x100401b2b
0x100401b29: xor ecx, ecx
0x100401b2b: lea rdx, [rip + 0x785a17] ; 0x100b87549 u_noiseTexture
0x100401b32: mov esi, 2
0x100401b37: xor r8d, r8d
0x100401b3a: call 0x100466ee0 ; 0x100466ee0
0x100401b3f: lea rdi, [rbp - 0x270]
0x100401b46: call 0x1007c2570 ; 0x1007c2570
0x100401b4b: lea rdi, [rbp - 0x350]
0x100401b52: call 0x1007c2570 ; 0x1007c2570
0x100401b57: mov rax, qword ptr [rip + 0x80bd7a] ; 0x100c0d8d8
0x100401b5e: mov rax, qword ptr [rax]
0x100401b61: cmp rax, qword ptr [rbp - 0x30]
0x100401b65: jne 0x100401f1a
0x100401b6b: add rsp, 0x338
0x100401b72: pop rbx
0x100401b73: pop r12
0x100401b75: pop r13
0x100401b77: pop r14
0x100401b79: pop r15
0x100401b7b: pop rbp
0x100401b7c: ret 
0x100401b7d: mov rsi, qword ptr [r14]
0x100401b80: and rsi, 0xfffffffffffffffe
0x100401b84: dec rsi
0x100401b87: mov rdx, r15
0x100401b8a: sub rdx, rsi
0x100401b8d: jbe 0x10040161a
0x100401b93: test cl, 1
0x100401b96: jne 0x100401bda
0x100401b98: shr rcx, 1
0x100401b9b: jmp 0x100401be1 ; 0x100401be1
0x100401b9d: mov r13, qword ptr [rbx + 0xc8]
0x100401ba4: test r15, r15
0x100401ba7: je 0x100401bbb
0x100401ba9: mov rdi, r13
0x100401bac: mov rsi, qword ptr [rbp - 0x308]
0x100401bb3: mov rdx, r15
0x100401bb6: call 0x100aa28fa ; 0x100aa28fa _memmove
0x100401bbb: mov byte ptr [r13 + r15], 0
0x100401bc1: mov r14, qword ptr [rbp - 0x278]
0x100401bc8: mov al, byte ptr [r14]
0x100401bcb: test al, 1
0x100401bcd: jne 0x100401c2b
0x100401bcf: add r15b, r15b
0x100401bd2: mov byte ptr [r14], r15b
0x100401bd5: mov eax, r15d
0x100401bd8: jmp 0x100401c32 ; 0x100401c32
0x100401bda: mov rcx, qword ptr [rbx + 0xc0]
0x100401be1: mov rax, qword ptr [rbp - 0x308]
0x100401be8: mov qword ptr [rsp + 8], rax
0x100401bed: mov qword ptr [rsp], r15
0x100401bf1: xor r8d, r8d
0x100401bf4: mov r14, qword ptr [rbp - 0x278]
0x100401bfb: mov rdi, r14
0x100401bfe: mov r9, rcx
0x100401c01: call 0x1000198c0 ; 0x1000198c0
0x100401c06: mov r15, qword ptr [rbp - 0x2f8]
0x100401c0d: mov al, byte ptr [r14]
0x100401c10: test al, 1
0x100401c12: je 0x100401c44
0x100401c14: mov rsi, qword ptr [rbx + 0xb8]
0x100401c1b: mov rcx, qword ptr [rbx + 0xc0]
0x100401c22: and rsi, 0xfffffffffffffffe
0x100401c26: dec rsi
0x100401c29: jmp 0x100401c4f ; 0x100401c4f
0x100401c2b: mov qword ptr [rbx + 0xc0], r15
0x100401c32: mov r15, qword ptr [rbp - 0x2f8]
0x100401c39: mov r13, qword ptr [rbp - 0x300]
0x100401c40: test al, 1
0x100401c42: jne 0x100401c14
0x100401c44: movzx ecx, al
0x100401c47: shr rcx, 1
0x100401c4a: mov esi, 0x16
0x100401c4f: mov rdx, rsi
0x100401c52: sub rdx, rcx
0x100401c55: cmp rdx, 4
0x100401c59: jae 0x100401c8d
0x100401c5b: mov edx, 4
0x100401c60: sub rdx, rsi
0x100401c63: add rdx, rcx
0x100401c66: lea rax, [rip + 0x7645d5] ; 0x100b66242 Mesh
0x100401c6d: mov qword ptr [rsp + 8], rax
0x100401c72: mov qword ptr [rsp], 4
0x100401c7a: xor r9d, r9d
0x100401c7d: mov rdi, r14
0x100401c80: mov r8, rcx
0x100401c83: call 0x1000198c0 ; 0x1000198c0
0x100401c88: jmp 0x1004016b1 ; 0x1004016b1
0x100401c8d: test al, 1
0x100401c8f: jne 0x100401c97
0x100401c91: lea rax, [r14 + 1]
0x100401c95: jmp 0x100401c9e ; 0x100401c9e
0x100401c97: mov rax, qword ptr [rbx + 0xc8]
0x100401c9e: mov dword ptr [rax + rcx], 0x6873654d
0x100401ca5: add rcx, 4
0x100401ca9: test byte ptr [r14], 1
0x100401cad: jne 0x100401cb8
0x100401caf: mov edx, ecx
0x100401cb1: add dl, dl
0x100401cb3: mov byte ptr [r14], dl
0x100401cb6: jmp 0x100401cbf ; 0x100401cbf
0x100401cb8: mov qword ptr [rbx + 0xc0], rcx
0x100401cbf: mov byte ptr [rax + rcx], 0
0x100401cc3: mov rsi, qword ptr [rbx + 0x228]
0x100401cca: test byte ptr [rbx + 0x58], 1
0x100401cce: je 0x1004016c2
0x100401cd4: mov rcx, qword ptr [rbx + 0x68]
0x100401cd8: test rsi, rsi
0x100401cdb: jne 0x1004016d2
0x100401ce1: test r12b, r12b
0x100401ce4: je 0x100401cfe
0x100401ce6: mov eax, dword ptr [rbx + 0x50]
0x100401ce9: test byte ptr [rbx + 0xb8], 1
0x100401cf0: jne 0x100401d1a
0x100401cf2: lea r8, [rbx + 0xb8]
0x100401cf9: inc r8
0x100401cfc: jmp 0x100401d21 ; 0x100401d21
0x100401cfe: test byte ptr [rbx + 0xb8], 1
0x100401d05: jne 0x100401ef5
0x100401d0b: lea rdx, [rbx + 0xb8]
0x100401d12: inc rdx
0x100401d15: jmp 0x100401efc ; 0x100401efc
0x100401d1a: mov r8, qword ptr [rbx + 0xc8]
0x100401d21: lea r9, [rbx + 0x10]
0x100401d25: lea rdx, [rbp - 0x2f0]
0x100401d2c: mov qword ptr [rsp], rdx
0x100401d30: mov rdi, r15
0x100401d33: mov rsi, r13
0x100401d36: mov rdx, rcx
0x100401d39: mov ecx, eax
0x100401d3b: call 0x10046ca30 ; 0x10046ca30
0x100401d40: mov qword ptr [rbx + 0x228], rax
0x100401d47: cmp byte ptr [rbx + 0xb7], 0
0x100401d4e: jne 0x100401729
0x100401d54: mov dword ptr [rbx + 0x220], 0
0x100401d5e: call 0x10043fb50 ; 0x10043fb50
0x100401d63: call 0x10043fb50 ; 0x10043fb50
0x100401d68: movzx esi, byte ptr [rbx + 0x70]
0x100401d6c: mov rdi, rax
0x100401d6f: call 0x1004434f0 ; 0x1004434f0
0x100401d74: lea rsi, [rbp - 0x270]
0x100401d7b: mov edx, 0x10
0x100401d80: mov rdi, rax
0x100401d83: call 0x100443a70 ; 0x100443a70
0x100401d88: test eax, eax
0x100401d8a: je 0x10040177f
0x100401d90: mov r14d, eax
0x100401d93: lea r15, [rbp - 0x260]
0x100401d9a: xor r13d, r13d
0x100401d9d: mov qword ptr [rbp - 0x278], r14
0x100401da4: nop word ptr cs:[rax + rax]
0x100401db0: mov rdi, qword ptr [rbx + 0x228]
0x100401db7: mov rdx, qword ptr [r15 - 0x10]
0x100401dbb: xor esi, esi
0x100401dbd: call 0x1004666a0 ; 0x1004666a0
0x100401dc2: mov r12d, eax
0x100401dc5: mov eax, dword ptr [r15 - 8]
0x100401dc9: lea ecx, [rax - 2]
0x100401dcc: cmp ecx, 3
0x100401dcf: jae 0x100401e10
0x100401dd1: vmovaps xmm0, xmmword ptr [r15]
0x100401dd6: vmovaps xmmword ptr [rbp - 0x330], xmm0
0x100401dde: test r12d, r12d
0x100401de1: js 0x100401ee0
0x100401de7: mov rdi, qword ptr [rbx + 0x228]
0x100401dee: xor esi, esi
0x100401df0: mov edx, r12d
0x100401df3: lea rcx, [rbp - 0x330]
0x100401dfa: call 0x1004669b0 ; 0x1004669b0
0x100401dff: jmp 0x100401ee0 ; 0x100401ee0
0x100401e04: nop word ptr cs:[rax + rax]
0x100401e10: cmp eax, 1
0x100401e13: je 0x100401e5a
0x100401e15: cmp eax, 0x64
0x100401e18: jne 0x100401f1f
0x100401e1e: lea rdi, [rbp - 0x330]
0x100401e25: call 0x1007c2530 ; 0x1007c2530
0x100401e2a: mov r14, qword ptr [r15]
0x100401e2d: call 0x10079ac90 ; 0x10079ac90
0x100401e32: mov rdi, qword ptr [rbp - 0x280]
0x100401e39: mov rsi, rax
0x100401e3c: mov rdx, r14
0x100401e3f: call 0x1007c4360 ; 0x1007c4360
0x100401e44: test rax, rax
0x100401e47: je 0x100401e7b
0x100401e49: mov rdi, rax
0x100401e4c: lea rsi, [rbp - 0x330]
0x100401e53: call 0x1007c2310 ; 0x1007c2310
0x100401e58: jmp 0x100401e93 ; 0x100401e93
0x100401e5a: test r12d, r12d
0x100401e5d: js 0x100401ee0
0x100401e63: mov rdi, qword ptr [rbx + 0x228]
0x100401e6a: vmovss xmm0, dword ptr [r15]
0x100401e6f: xor esi, esi
0x100401e71: mov edx, r12d
0x100401e74: call 0x100466710 ; 0x100466710
0x100401e79: jmp 0x100401ee0 ; 0x100401ee0
0x100401e7b: call 0x10079ac90 ; 0x10079ac90
0x100401e80: mov rsi, qword ptr [rax + 8]
0x100401e84: mov rdi, qword ptr [rbp - 0x280]
0x100401e8b: mov rdx, r14
0x100401e8e: call 0x1007c4640 ; 0x1007c4640
0x100401e93: mov rdi, qword ptr [rbx + 0x228]
0x100401e9a: mov rax, qword ptr [rbp - 0x330]
0x100401ea1: test rax, rax
0x100401ea4: je 0x100401eba
0x100401ea6: mov rax, qword ptr [rax + 0x10]
0x100401eaa: lea rcx, [rax + 0xb0]
0x100401eb1: test rax, rax
0x100401eb4: cmove rcx, rax
0x100401eb8: jmp 0x100401ebc ; 0x100401ebc
0x100401eba: xor ecx, ecx
0x100401ebc: xor esi, esi
0x100401ebe: xor r8d, r8d
0x100401ec1: mov edx, r12d
0x100401ec4: call 0x100466e30 ; 0x100466e30
0x100401ec9: lea rdi, [rbp - 0x330]
0x100401ed0: call 0x1007c2570 ; 0x1007c2570
0x100401ed5: mov r14, qword ptr [rbp - 0x278]
0x100401edc: nop dword ptr [rax]
0x100401ee0: inc r13
0x100401ee3: add r15, 0x20
0x100401ee7: cmp r13, r14
0x100401eea: jb 0x100401db0
0x100401ef0: jmp 0x10040177f ; 0x10040177f
0x100401ef5: mov rdx, qword ptr [rbx + 0xc8]
0x100401efc: lea rax, [rbx + 0x10]
0x100401f00: lea r8, [rbp - 0x2f0]
0x100401f07: mov rdi, r15
0x100401f0a: mov rsi, rcx
0x100401f0d: mov rcx, rax
0x100401f10: call 0x10046c700 ; 0x10046c700
0x100401f15: jmp 0x100401d40 ; 0x100401d40
0x100401f1a: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100401f1f: lea rdi, [rip + 0x7a1106] ; 0x100ba302c false
0x100401f26: lea rsi, [rip + 0x785508] ; 0x100b87435 LevelMesh.cpp
0x100401f2d: lea r8, [rip + 0x7855dd] ; 0x100b87511 Unsupported material uniform type
0x100401f34: mov edx, 0x1f7
0x100401f39: mov ecx, 4
0x100401f3e: xor eax, eax
0x100401f40: call 0x1007e6030 ; 0x1007e6030
0x100401f45: ud2 
0x100401f47: lea rdi, [rip + 0x7855e5] ; 0x100b87533 m_model->IsAnimated()
0x100401f4e: lea rsi, [rip + 0x7854e0] ; 0x100b87435 LevelMesh.cpp
0x100401f55: mov edx, 0x20e
0x100401f5a: mov ecx, 3
0x100401f5f: call 0x1007e5f70 ; 0x1007e5f70
0x100401f64: jmp 0x100401f45 ; 0x100401f45
0x100401f66: lea rdi, [rip + 0x7855c6] ; 0x100b87533 m_model->IsAnimated()
0x100401f6d: lea rsi, [rip + 0x7854c1] ; 0x100b87435 LevelMesh.cpp
0x100401f74: mov edx, 0x213
0x100401f79: mov ecx, 3
0x100401f7e: call 0x1007e5f70 ; 0x1007e5f70
0x100401f83: jmp 0x100401f45 ; 0x100401f45
0x100401f85: jmp 0x10040203a ; 0x10040203a
0x100401f8a: mov rbx, rax
0x100401f8d: jmp 0x100401fc0 ; 0x100401fc0
0x100401f8f: mov rbx, rax
0x100401f92: jmp 0x100401fd7 ; 0x100401fd7
0x100401f94: jmp 0x10040203a ; 0x10040203a
0x100401f99: jmp 0x10040203a ; 0x10040203a
0x100401f9e: jmp 0x10040203a ; 0x10040203a
0x100401fa3: mov rbx, rax
0x100401fa6: mov qword ptr [rbp - 0x270], r12
0x100401fad: mov qword ptr [rbp - 0x120], r14
0x100401fb4: lea rdi, [rbp - 0x268]
0x100401fbb: call 0x1007a58d0 ; 0x1007a58d0
0x100401fc0: mov rsi, qword ptr [rip + 0x8085b9] ; 0x100c0a580
0x100401fc7: add rsi, 8
0x100401fcb: lea rdi, [rbp - 0x270]
0x100401fd2: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100401fd7: lea rdi, [rbp - 0x120]
0x100401fde: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100401fe3: lea rdi, [rbp - 0x2f0]
0x100401fea: call 0x1007c2570 ; 0x1007c2570
0x100401fef: mov rdi, rbx
0x100401ff2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100401ff7: jmp 0x10040203a ; 0x10040203a
0x100401ff9: mov rbx, rax
0x100401ffc: lea rdi, [rbp - 0x270]
0x100402003: call 0x1007c2570 ; 0x1007c2570
0x100402008: jmp 0x10040203d ; 0x10040203d
0x10040200a: mov rbx, rax
0x10040200d: lea rdi, [rbp - 0x2f0]
0x100402014: call 0x1007c2570 ; 0x1007c2570
0x100402019: mov rdi, rbx
0x10040201c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100402021: jmp 0x10040203a ; 0x10040203a
0x100402023: jmp 0x10040203a ; 0x10040203a
0x100402025: jmp 0x10040203a ; 0x10040203a
0x100402027: jmp 0x10040203a ; 0x10040203a
0x100402029: mov rbx, rax
0x10040202c: lea rdi, [rbp - 0x330]
0x100402033: call 0x1007c2570 ; 0x1007c2570
0x100402038: jmp 0x10040203d ; 0x10040203d
0x10040203a: mov rbx, rax
0x10040203d: lea rdi, [rbp - 0x350]
0x100402044: call 0x1007c2570 ; 0x1007c2570
0x100402049: mov rdi, rbx
0x10040204c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100402051: nop word ptr cs:[rax + rax]
