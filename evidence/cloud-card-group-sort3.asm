0x100223420: push rbp
0x100223421: mov rbp, rsp
0x100223424: sub rsp, 0x40
0x100223428: mov rax, qword ptr [rip + 0x9ea4a9] ; 0x100c0d8d8
0x10022342f: mov rax, qword ptr [rax]
0x100223432: mov qword ptr [rbp - 8], rax
0x100223436: mov ecx, dword ptr [rsi + 0x20]
0x100223439: mov r8d, dword ptr [rdx + 0x20]
0x10022343d: cmp ecx, dword ptr [rdi + 0x20]
0x100223440: jae 0x1002234e9
0x100223446: mov eax, dword ptr [rdi + 0x20]
0x100223449: mov dword ptr [rbp - 0x20], eax
0x10022344c: vmovups ymm0, ymmword ptr [rdi]
0x100223450: vmovups ymmword ptr [rbp - 0x40], ymm0
0x100223455: vmovaps xmm4, xmmword ptr [rdi + 0x30]
0x10022345a: vmovaps xmm3, xmmword ptr [rdi + 0x40]
0x10022345f: vmovaps xmm2, xmmword ptr [rdi + 0x50]
0x100223464: vmovaps xmm1, xmmword ptr [rdi + 0x60]
0x100223469: vmovaps xmm0, xmmword ptr [rdi + 0x70]
0x10022346e: cmp r8d, ecx
0x100223471: jae 0x10022362a
0x100223477: mov eax, dword ptr [rdx + 0x20]
0x10022347a: mov dword ptr [rdi + 0x20], eax
0x10022347d: vmovups ymm5, ymmword ptr [rdx]
0x100223481: vmovups ymmword ptr [rdi], ymm5
0x100223485: vmovaps xmm5, xmmword ptr [rdx + 0x30]
0x10022348a: vmovaps xmmword ptr [rdi + 0x30], xmm5
0x10022348f: vmovaps xmm5, xmmword ptr [rdx + 0x40]
0x100223494: vmovaps xmmword ptr [rdi + 0x40], xmm5
0x100223499: vmovaps xmm5, xmmword ptr [rdx + 0x50]
0x10022349e: vmovaps xmmword ptr [rdi + 0x50], xmm5
0x1002234a3: vmovaps xmm5, xmmword ptr [rdx + 0x60]
0x1002234a8: vmovaps xmmword ptr [rdi + 0x60], xmm5
0x1002234ad: vmovaps xmm5, xmmword ptr [rdx + 0x70]
0x1002234b2: vmovaps xmmword ptr [rdi + 0x70], xmm5
0x1002234b7: mov eax, dword ptr [rbp - 0x20]
0x1002234ba: mov dword ptr [rdx + 0x20], eax
0x1002234bd: vmovups ymm5, ymmword ptr [rbp - 0x40]
0x1002234c2: vmovups ymmword ptr [rdx], ymm5
0x1002234c6: vmovaps xmmword ptr [rdx + 0x30], xmm4
0x1002234cb: vmovaps xmmword ptr [rdx + 0x40], xmm3
0x1002234d0: vmovaps xmmword ptr [rdx + 0x50], xmm2
0x1002234d5: vmovaps xmmword ptr [rdx + 0x60], xmm1
0x1002234da: vmovaps xmmword ptr [rdx + 0x70], xmm0
0x1002234df: mov eax, 1
0x1002234e4: jmp 0x10022371b ; 0x10022371b
0x1002234e9: xor eax, eax
0x1002234eb: cmp r8d, ecx
0x1002234ee: jae 0x10022371b
0x1002234f4: mov eax, dword ptr [rsi + 0x20]
0x1002234f7: mov dword ptr [rbp - 0x20], eax
0x1002234fa: vmovups ymm0, ymmword ptr [rsi]
0x1002234fe: vmovups ymmword ptr [rbp - 0x40], ymm0
0x100223503: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x100223508: vmovaps xmm1, xmmword ptr [rsi + 0x40]
0x10022350d: vmovaps xmm2, xmmword ptr [rsi + 0x50]
0x100223512: vmovaps xmm3, xmmword ptr [rsi + 0x60]
0x100223517: vmovaps xmm4, xmmword ptr [rsi + 0x70]
0x10022351c: mov eax, dword ptr [rdx + 0x20]
0x10022351f: mov dword ptr [rsi + 0x20], eax
0x100223522: vmovups ymm5, ymmword ptr [rdx]
0x100223526: vmovups ymmword ptr [rsi], ymm5
0x10022352a: vmovaps xmm5, xmmword ptr [rdx + 0x30]
0x10022352f: vmovaps xmmword ptr [rsi + 0x30], xmm5
0x100223534: vmovaps xmm5, xmmword ptr [rdx + 0x40]
0x100223539: vmovaps xmmword ptr [rsi + 0x40], xmm5
0x10022353e: vmovaps xmm5, xmmword ptr [rdx + 0x50]
0x100223543: vmovaps xmmword ptr [rsi + 0x50], xmm5
0x100223548: vmovaps xmm5, xmmword ptr [rdx + 0x60]
0x10022354d: vmovaps xmmword ptr [rsi + 0x60], xmm5
0x100223552: vmovaps xmm5, xmmword ptr [rdx + 0x70]
0x100223557: vmovaps xmmword ptr [rsi + 0x70], xmm5
0x10022355c: mov eax, dword ptr [rbp - 0x20]
0x10022355f: mov dword ptr [rdx + 0x20], eax
0x100223562: vmovups ymm5, ymmword ptr [rbp - 0x40]
0x100223567: vmovups ymmword ptr [rdx], ymm5
0x10022356b: vmovaps xmmword ptr [rdx + 0x30], xmm0
0x100223570: vmovaps xmmword ptr [rdx + 0x40], xmm1
0x100223575: vmovaps xmmword ptr [rdx + 0x50], xmm2
0x10022357a: vmovaps xmmword ptr [rdx + 0x60], xmm3
0x10022357f: vmovaps xmmword ptr [rdx + 0x70], xmm4
0x100223584: mov ecx, dword ptr [rsi + 0x20]
0x100223587: mov eax, 1
0x10022358c: cmp ecx, dword ptr [rdi + 0x20]
0x10022358f: jae 0x10022371b
0x100223595: mov eax, dword ptr [rdi + 0x20]
0x100223598: mov dword ptr [rbp - 0x20], eax
0x10022359b: vmovups ymm0, ymmword ptr [rdi]
0x10022359f: vmovups ymmword ptr [rbp - 0x40], ymm0
0x1002235a4: vmovaps xmm0, xmmword ptr [rdi + 0x30]
0x1002235a9: vmovaps xmm1, xmmword ptr [rdi + 0x40]
0x1002235ae: vmovaps xmm2, xmmword ptr [rdi + 0x50]
0x1002235b3: vmovaps xmm3, xmmword ptr [rdi + 0x60]
0x1002235b8: vmovaps xmm4, xmmword ptr [rdi + 0x70]
0x1002235bd: mov eax, dword ptr [rsi + 0x20]
0x1002235c0: mov dword ptr [rdi + 0x20], eax
0x1002235c3: vmovups ymm5, ymmword ptr [rsi]
0x1002235c7: vmovups ymmword ptr [rdi], ymm5
0x1002235cb: vmovaps xmm5, xmmword ptr [rsi + 0x30]
0x1002235d0: vmovaps xmmword ptr [rdi + 0x30], xmm5
0x1002235d5: vmovaps xmm5, xmmword ptr [rsi + 0x40]
0x1002235da: vmovaps xmmword ptr [rdi + 0x40], xmm5
0x1002235df: vmovaps xmm5, xmmword ptr [rsi + 0x50]
0x1002235e4: vmovaps xmmword ptr [rdi + 0x50], xmm5
0x1002235e9: vmovaps xmm5, xmmword ptr [rsi + 0x60]
0x1002235ee: vmovaps xmmword ptr [rdi + 0x60], xmm5
0x1002235f3: vmovaps xmm5, xmmword ptr [rsi + 0x70]
0x1002235f8: vmovaps xmmword ptr [rdi + 0x70], xmm5
0x1002235fd: mov eax, dword ptr [rbp - 0x20]
0x100223600: mov dword ptr [rsi + 0x20], eax
0x100223603: vmovups ymm5, ymmword ptr [rbp - 0x40]
0x100223608: vmovups ymmword ptr [rsi], ymm5
0x10022360c: vmovaps xmmword ptr [rsi + 0x30], xmm0
0x100223611: vmovaps xmmword ptr [rsi + 0x40], xmm1
0x100223616: vmovaps xmmword ptr [rsi + 0x50], xmm2
0x10022361b: vmovaps xmmword ptr [rsi + 0x60], xmm3
0x100223620: vmovaps xmmword ptr [rsi + 0x70], xmm4
0x100223625: jmp 0x100223716 ; 0x100223716
0x10022362a: mov eax, dword ptr [rsi + 0x20]
0x10022362d: mov dword ptr [rdi + 0x20], eax
0x100223630: vmovups ymm5, ymmword ptr [rsi]
0x100223634: vmovups ymmword ptr [rdi], ymm5
0x100223638: vmovaps xmm5, xmmword ptr [rsi + 0x30]
0x10022363d: vmovaps xmmword ptr [rdi + 0x30], xmm5
0x100223642: vmovaps xmm5, xmmword ptr [rsi + 0x40]
0x100223647: vmovaps xmmword ptr [rdi + 0x40], xmm5
0x10022364c: vmovaps xmm5, xmmword ptr [rsi + 0x50]
0x100223651: vmovaps xmmword ptr [rdi + 0x50], xmm5
0x100223656: vmovaps xmm5, xmmword ptr [rsi + 0x60]
0x10022365b: vmovaps xmmword ptr [rdi + 0x60], xmm5
0x100223660: vmovaps xmm5, xmmword ptr [rsi + 0x70]
0x100223665: vmovaps xmmword ptr [rdi + 0x70], xmm5
0x10022366a: mov eax, dword ptr [rbp - 0x20]
0x10022366d: mov dword ptr [rsi + 0x20], eax
0x100223670: vmovups ymm5, ymmword ptr [rbp - 0x40]
0x100223675: vmovups ymmword ptr [rsi], ymm5
0x100223679: vmovaps xmmword ptr [rsi + 0x30], xmm4
0x10022367e: vmovaps xmmword ptr [rsi + 0x40], xmm3
0x100223683: vmovaps xmmword ptr [rsi + 0x50], xmm2
0x100223688: vmovaps xmmword ptr [rsi + 0x60], xmm1
0x10022368d: vmovaps xmmword ptr [rsi + 0x70], xmm0
0x100223692: mov ecx, dword ptr [rdx + 0x20]
0x100223695: mov eax, 1
0x10022369a: cmp ecx, dword ptr [rsi + 0x20]
0x10022369d: jae 0x10022371b
0x10022369f: mov eax, dword ptr [rsi + 0x20]
0x1002236a2: mov dword ptr [rbp - 0x20], eax
0x1002236a5: vmovups ymm5, ymmword ptr [rsi]
0x1002236a9: vmovups ymmword ptr [rbp - 0x40], ymm5
0x1002236ae: mov eax, dword ptr [rdx + 0x20]
0x1002236b1: mov dword ptr [rsi + 0x20], eax
0x1002236b4: vmovups ymm5, ymmword ptr [rdx]
0x1002236b8: vmovups ymmword ptr [rsi], ymm5
0x1002236bc: vmovaps xmm5, xmmword ptr [rdx + 0x30]
0x1002236c1: vmovaps xmmword ptr [rsi + 0x30], xmm5
0x1002236c6: vmovaps xmm5, xmmword ptr [rdx + 0x40]
0x1002236cb: vmovaps xmmword ptr [rsi + 0x40], xmm5
0x1002236d0: vmovaps xmm5, xmmword ptr [rdx + 0x50]
0x1002236d5: vmovaps xmmword ptr [rsi + 0x50], xmm5
0x1002236da: vmovaps xmm5, xmmword ptr [rdx + 0x60]
0x1002236df: vmovaps xmmword ptr [rsi + 0x60], xmm5
0x1002236e4: vmovaps xmm5, xmmword ptr [rdx + 0x70]
0x1002236e9: vmovaps xmmword ptr [rsi + 0x70], xmm5
0x1002236ee: mov eax, dword ptr [rbp - 0x20]
0x1002236f1: mov dword ptr [rdx + 0x20], eax
0x1002236f4: vmovups ymm5, ymmword ptr [rbp - 0x40]
0x1002236f9: vmovups ymmword ptr [rdx], ymm5
0x1002236fd: vmovaps xmmword ptr [rdx + 0x30], xmm4
0x100223702: vmovaps xmmword ptr [rdx + 0x40], xmm3
0x100223707: vmovaps xmmword ptr [rdx + 0x50], xmm2
0x10022370c: vmovaps xmmword ptr [rdx + 0x60], xmm1
0x100223711: vmovaps xmmword ptr [rdx + 0x70], xmm0
0x100223716: mov eax, 2
0x10022371b: mov rcx, qword ptr [rip + 0x9ea1b6] ; 0x100c0d8d8
0x100223722: mov rcx, qword ptr [rcx]
0x100223725: cmp rcx, qword ptr [rbp - 8]
0x100223729: jne 0x100223734
0x10022372b: add rsp, 0x40
0x10022372f: pop rbp
0x100223730: vzeroupper 
0x100223733: ret 
0x100223734: vzeroupper 
0x100223737: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10022373c: nop dword ptr [rax]
