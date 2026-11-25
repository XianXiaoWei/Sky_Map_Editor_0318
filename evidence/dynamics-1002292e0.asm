0x1002292e0: push rbp
0x1002292e1: mov rbp, rsp
0x1002292e4: push r15
0x1002292e6: push r14
0x1002292e8: push r13
0x1002292ea: push r12
0x1002292ec: push rbx
0x1002292ed: sub rsp, 0x48
0x1002292f1: mov rbx, r9
0x1002292f4: mov r15, rdx
0x1002292f7: mov r12, rsi
0x1002292fa: mov r14, rdi
0x1002292fd: cmp dword ptr [rbp + 0x10], 9
0x100229301: jne 0x1002294fa
0x100229307: call 0x1007abbf0 ; 0x1007abbf0
0x10022930c: add r15, r12
0x10022930f: test r14b, 1
0x100229313: mov qword ptr [rbp - 0x68], r15
0x100229317: je 0x100229321
0x100229319: mov rax, qword ptr [r15]
0x10022931c: mov r14, qword ptr [rax + r14 - 1]
0x100229321: mov qword ptr [rbp - 0x38], r14
0x100229325: mov r12, qword ptr [rbx]
0x100229328: mov r13, qword ptr [rbx + 8]
0x10022932c: mov qword ptr [rbp - 0x30], 0
0x100229334: call 0x100387800 ; 0x100387800
0x100229339: mov r8, qword ptr [rax]
0x10022933c: lea rsi, [rbp - 0x30]
0x100229340: mov rdi, rax
0x100229343: mov rdx, r12
0x100229346: mov rcx, r13
0x100229349: call qword ptr [r8 + 0x40]
0x10022934d: mov rax, qword ptr [rbp - 0x30]
0x100229351: mov qword ptr [rbp - 0x60], rax
0x100229355: mov r12, qword ptr [rbx + 0x10]
0x100229359: mov r13, qword ptr [rbx + 0x18]
0x10022935d: mov qword ptr [rbp - 0x30], 0
0x100229365: call 0x10076bba0 ; 0x10076bba0
0x10022936a: mov r8, qword ptr [rax]
0x10022936d: lea rsi, [rbp - 0x30]
0x100229371: mov rdi, rax
0x100229374: mov rdx, r12
0x100229377: mov rcx, r13
0x10022937a: call qword ptr [r8 + 0x40]
0x10022937e: mov rax, qword ptr [rbp - 0x30]
0x100229382: mov qword ptr [rbp - 0x58], rax
0x100229386: mov r12, qword ptr [rbx + 0x20]
0x10022938a: mov r13, qword ptr [rbx + 0x28]
0x10022938e: mov qword ptr [rbp - 0x30], 0
0x100229396: call 0x1001de010 ; 0x1001de010
0x10022939b: mov r8, qword ptr [rax]
0x10022939e: lea rsi, [rbp - 0x30]
0x1002293a2: mov rdi, rax
0x1002293a5: mov rdx, r12
0x1002293a8: mov rcx, r13
0x1002293ab: call qword ptr [r8 + 0x40]
0x1002293af: mov rax, qword ptr [rbp - 0x30]
0x1002293b3: mov qword ptr [rbp - 0x50], rax
0x1002293b7: mov r12, qword ptr [rbx + 0x30]
0x1002293bb: mov r13, qword ptr [rbx + 0x38]
0x1002293bf: mov qword ptr [rbp - 0x30], 0
0x1002293c7: call 0x10023d340 ; 0x10023d340
0x1002293cc: mov r8, qword ptr [rax]
0x1002293cf: lea rsi, [rbp - 0x30]
0x1002293d3: mov rdi, rax
0x1002293d6: mov rdx, r12
0x1002293d9: mov rcx, r13
0x1002293dc: call qword ptr [r8 + 0x40]
0x1002293e0: mov rax, qword ptr [rbp - 0x30]
0x1002293e4: mov qword ptr [rbp - 0x48], rax
0x1002293e8: mov r12, qword ptr [rbx + 0x40]
0x1002293ec: mov r13, qword ptr [rbx + 0x48]
0x1002293f0: mov qword ptr [rbp - 0x30], 0
0x1002293f8: call 0x1007816f0 ; 0x1007816f0
0x1002293fd: mov r8, qword ptr [rax]
0x100229400: lea rsi, [rbp - 0x30]
0x100229404: mov rdi, rax
0x100229407: mov rdx, r12
0x10022940a: mov rcx, r13
0x10022940d: call qword ptr [r8 + 0x40]
0x100229411: mov rax, qword ptr [rbp - 0x30]
0x100229415: mov qword ptr [rbp - 0x40], rax
0x100229419: mov r13, qword ptr [rbx + 0x50]
0x10022941d: mov r14, qword ptr [rbx + 0x58]
0x100229421: mov qword ptr [rbp - 0x30], 0
0x100229429: call 0x1007c1b80 ; 0x1007c1b80
0x10022942e: mov r8, qword ptr [rax]
0x100229431: lea rsi, [rbp - 0x30]
0x100229435: mov rdi, rax
0x100229438: mov rdx, r13
0x10022943b: mov rcx, r14
0x10022943e: call qword ptr [r8 + 0x40]
0x100229442: mov r12, qword ptr [rbp - 0x30]
0x100229446: mov r14, qword ptr [rbx + 0x60]
0x10022944a: mov r13, qword ptr [rbx + 0x68]
0x10022944e: mov qword ptr [rbp - 0x30], 0
0x100229456: call 0x1000f8420 ; 0x1000f8420
0x10022945b: mov r8, qword ptr [rax]
0x10022945e: lea rsi, [rbp - 0x30]
0x100229462: mov rdi, rax
0x100229465: mov rdx, r14
0x100229468: mov rcx, r13
0x10022946b: call qword ptr [r8 + 0x40]
0x10022946f: mov r15, qword ptr [rbp - 0x30]
0x100229473: mov r14, qword ptr [rbx + 0x70]
0x100229477: mov r13, qword ptr [rbx + 0x78]
0x10022947b: mov qword ptr [rbp - 0x30], 0
0x100229483: call 0x100323fd0 ; 0x100323fd0
0x100229488: mov r8, qword ptr [rax]
0x10022948b: lea rsi, [rbp - 0x30]
0x10022948f: mov rdi, rax
0x100229492: mov rdx, r14
0x100229495: mov rcx, r13
0x100229498: call qword ptr [r8 + 0x40]
0x10022949c: mov r14, qword ptr [rbp - 0x30]
0x1002294a0: mov rdx, qword ptr [rbx + 0x80]
0x1002294a7: mov rcx, qword ptr [rbx + 0x88]
0x1002294ae: mov qword ptr [rbp - 0x30], 0
0x1002294b6: mov rdi, qword ptr [rip + 0x1bb9323] ; 0x101de27e0
0x1002294bd: mov rax, qword ptr [rdi]
0x1002294c0: lea rsi, [rbp - 0x30]
0x1002294c4: call qword ptr [rax + 0x40]
0x1002294c7: mov rdi, qword ptr [rbp - 0x68]
0x1002294cb: mov rsi, qword ptr [rbp - 0x60]
0x1002294cf: mov rdx, qword ptr [rbp - 0x58]
0x1002294d3: mov rcx, qword ptr [rbp - 0x50]
0x1002294d7: mov r8, qword ptr [rbp - 0x48]
0x1002294db: mov r9, qword ptr [rbp - 0x40]
0x1002294df: push qword ptr [rbp - 0x30]
0x1002294e2: push r14
0x1002294e4: push r15
0x1002294e6: push r12
0x1002294e8: call qword ptr [rbp - 0x38]
0x1002294eb: add rsp, 0x68
0x1002294ef: pop rbx
0x1002294f0: pop r12
0x1002294f2: pop r13
0x1002294f4: pop r14
0x1002294f6: pop r15
0x1002294f8: pop rbp
0x1002294f9: ret 
0x1002294fa: lea rdi, [rip + 0x9516dc] ; 0x100b7abdd 9 == argCount
0x100229501: lea rsi, [rip + 0x9340d0] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x100229508: mov edx, 0x23d
0x10022950d: mov ecx, 3
0x100229512: call 0x1007e5f70 ; 0x1007e5f70
0x100229517: ud2 
0x100229519: nop dword ptr [rax]
