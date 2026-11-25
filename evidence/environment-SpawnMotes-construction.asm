0x100480880: push rbp
0x100480881: mov rbp, rsp
0x100480884: push rbx
0x100480885: push rax
0x100480886: mov rbx, rsi
0x100480889: mov rdi, rbx
0x10048088c: call 0x10032eea0 ; 0x10032eea0
0x100480891: mov rax, qword ptr [rip + 0x1b88778] ; 0x102009010
0x100480898: mov eax, dword ptr [rax + 0x38]
0x10048089b: mov dword ptr [rbx + 8], eax
0x10048089e: mov rax, qword ptr [rip + 0x789de3] ; 0x100c0a688
0x1004808a5: add rax, 0x10
0x1004808a9: mov qword ptr [rbx], rax
0x1004808ac: mov qword ptr [rbx + 0x80], 0
0x1004808b7: mov dword ptr [rbx + 0x94], 0
0x1004808c1: mov rax, rbx
0x1004808c4: add rsp, 8
0x1004808c8: pop rbx
0x1004808c9: pop rbp
0x1004808ca: ret 
