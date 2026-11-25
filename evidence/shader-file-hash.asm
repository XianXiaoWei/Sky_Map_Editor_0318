0x1007d1150: push rbp
0x1007d1151: mov rbp, rsp
0x1007d1154: push r15
0x1007d1156: push r14
0x1007d1158: push r13
0x1007d115a: push r12
0x1007d115c: push rbx
0x1007d115d: sub rsp, 0x138
0x1007d1164: mov r13d, r9d
0x1007d1167: mov qword ptr [rbp - 0x158], r8
0x1007d116e: mov r14d, ecx
0x1007d1171: mov r15, rdx
0x1007d1174: mov r12, rsi
0x1007d1177: mov rbx, rdi
0x1007d117a: mov rax, qword ptr [rip + 0x43c757]
0x1007d1181: mov rax, qword ptr [rax]
0x1007d1184: mov qword ptr [rbp - 0x30], rax
0x1007d1188: call 0x1007c19a0
0x1007d118d: mov ecx, eax
0x1007d118f: xor eax, eax
0x1007d1191: cmp ecx, 3
0x1007d1194: je 0x1007d12db
0x1007d119a: mov qword ptr [rbp - 0x150], rbx
0x1007d11a1: mov dword ptr [rbp - 0x13c], r13d
0x1007d11a8: call 0x1007c19a0
0x1007d11ad: lea rcx, [rip + 0x3d4aff]
0x1007d11b4: lea r13, [rip + 0x3d4b06]
0x1007d11bb: test r14b, r14b
0x1007d11be: cmovne r13, rcx
0x1007d11c2: lea rcx, [rip + 0x3d4aff]
0x1007d11c9: lea rbx, [rip + 0x3d4afc]
0x1007d11d0: cmovne rbx, rcx
0x1007d11d4: cmp eax, 2
0x1007d11d7: cmovne rbx, rcx
0x1007d11db: lea rax, [rip + 0x3d3bf6]
0x1007d11e2: cmovne r13, rax
0x1007d11e6: mov esi, 0x2e
0x1007d11eb: mov rdi, r12
0x1007d11ee: call 0x100aa2c9c
0x1007d11f3: mov r14, rax
0x1007d11f6: test r14, r14
0x1007d11f9: je 0x1007d1302
0x1007d11ff: mov eax, r14d
0x1007d1202: sub eax, r12d
0x1007d1205: mov dword ptr [rbp - 0x138], eax
0x1007d120b: mov al, byte ptr [r15]
0x1007d120e: test al, al
0x1007d1210: mov qword ptr [rbp - 0x148], r12
0x1007d1217: je 0x1007d123f
0x1007d1219: inc r15
0x1007d121c: xor r12d, r12d
0x1007d121f: nop 
0x1007d1220: movsx eax, al
0x1007d1223: add eax, r12d
0x1007d1226: shr r12d, 5
0x1007d122a: lea eax, [r12 + rax*4]
0x1007d122e: movzx r12d, ax
0x1007d1232: movzx eax, byte ptr [r15]
0x1007d1236: inc r15
0x1007d1239: test al, al
0x1007d123b: jne 0x1007d1220
0x1007d123d: jmp 0x1007d1242
0x1007d123f: xor r12d, r12d
0x1007d1242: lea rsi, [rip + 0x3d4a78]
0x1007d1249: mov rdi, r14
0x1007d124c: call 0x100aa2c4e
0x1007d1251: test eax, eax
0x1007d1253: lea rax, [rip + 0x3d3b7e]
0x1007d125a: cmove r14, rax
0x1007d125e: sub rsp, 8
0x1007d1262: lea rdx, [rip + 0x3d4a7f]
0x1007d1269: lea r15, [rbp - 0x130]
0x1007d1270: mov esi, 0x100
0x1007d1275: xor eax, eax
0x1007d1277: mov r8d, dword ptr [rbp - 0x138]
0x1007d127e: mov rdi, r15
0x1007d1281: mov rcx, rbx
0x1007d1284: mov r9, qword ptr [rbp - 0x148]
0x1007d128b: push r13
0x1007d128d: push r14
0x1007d128f: push r12
0x1007d1291: call 0x100aa2bd6
0x1007d1296: add rsp, 0x20
0x1007d129a: mov dword ptr [rbp - 0x134], 0
0x1007d12a4: lea r8, [rbp - 0x134]
0x1007d12ab: mov rdi, qword ptr [rbp - 0x150]
0x1007d12b2: mov rsi, r15
0x1007d12b5: mov r14, qword ptr [rbp - 0x158]
0x1007d12bc: mov rdx, r14
0x1007d12bf: mov ebx, dword ptr [rbp - 0x13c]
0x1007d12c5: mov ecx, ebx
0x1007d12c7: call 0x1007f86c0
0x1007d12cc: mov eax, dword ptr [rbp - 0x134]
0x1007d12d2: cmp eax, ebx
0x1007d12d4: jae 0x1007d1321
0x1007d12d6: mov byte ptr [r14 + rax], 0
0x1007d12db: mov rcx, qword ptr [rip + 0x43c5f6]
0x1007d12e2: mov rcx, qword ptr [rcx]
0x1007d12e5: cmp rcx, qword ptr [rbp - 0x30]
0x1007d12e9: jne 0x1007d12fd
0x1007d12eb: add rsp, 0x138
0x1007d12f2: pop rbx
0x1007d12f3: pop r12
0x1007d12f5: pop r13
0x1007d12f7: pop r14
0x1007d12f9: pop r15
0x1007d12fb: pop rbp
0x1007d12fc: ret 
0x1007d12fd: call 0x100aa251c
0x1007d1302: lea rdi, [rip + 0x3d49d0]
0x1007d1309: lea rsi, [rip + 0x3d49cd]
0x1007d1310: mov edx, 0x49
0x1007d1315: mov ecx, 3
0x1007d131a: call 0x1007e5f70
0x1007d131f: ud2 
0x1007d1321: lea rdi, [rip + 0x3d49db]
0x1007d1328: lea rsi, [rip + 0x3d49ae]
0x1007d132f: mov edx, 0x52
0x1007d1334: mov ecx, 3
0x1007d1339: call 0x1007e5f70
0x1007d133e: ud2 