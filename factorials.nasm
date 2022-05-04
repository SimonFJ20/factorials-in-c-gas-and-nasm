global _start
section .text
_start:
    call main
    jmp exit
factorial:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp-4], ebx
    mov eax, [rbp-4]
    cmp eax, 0
    jle .factorial_if0_end
    mov ebx, eax
    sub ebx, 1
    call factorial
    mov ebx, [rbp-4]
    imul eax, ebx
    jmp .factorial_end
.factorial_if0_end:
    mov eax, 1
.factorial_end:
    leave
    ret
main:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov ebx, 5
    call factorial
    mov [rbp-4], eax
.main_end:
    leave
    ret
exit:
    mov rdi, rax
    mov rax, 60
    syscall
