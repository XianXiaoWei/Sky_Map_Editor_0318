0x1003a1220: push rbp
0x1003a1221: mov rbp, rsp
0x1003a1224: push rbx
0x1003a1225: push rax
0x1003a1226: mov rbx, rdi
0x1003a1229: mov edi, 0x60
0x1003a122e: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1003a1233: vmovups ymm0, ymmword ptr [rbx + 8]
0x1003a1238: vmovups ymmword ptr [rax + 8], ymm0
0x1003a123d: mov rcx, qword ptr [rbx + 0x28]
0x1003a1241: mov qword ptr [rax + 0x28], rcx
0x1003a1245: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x1003a124a: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x1003a124f: vmovups ymmword ptr [rax + 0x40], ymm1
0x1003a1254: vmovups ymmword ptr [rax + 0x30], ymm0
0x1003a1259: mov rcx, qword ptr [rip + 0x86b368] ; 0x100c0c5c8
0x1003a1260: add rcx, 0x10
0x1003a1264: mov qword ptr [rax], rcx
0x1003a1267: add rsp, 8
0x1003a126b: pop rbx
0x1003a126c: pop rbp
0x1003a126d: vzeroupper 
0x1003a1270: ret 
0x1003a1271: nop word ptr cs:[rax + rax]
