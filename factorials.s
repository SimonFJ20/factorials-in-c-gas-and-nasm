.global _start
.text
_start:
    call main
    jmp exit
factorial:
    push %rbp
    mov %rsp, %rbp
    sub $16, %rsp
    mov %ebx, -4(%rbp)
    mov -4(%rbp), %eax
    cmp $0, %eax
    jle .factorial_if0_end
    mov %eax, %ebx
    sub $1, %ebx
    call factorial
    mov -4(%rbp), %ebx
    imul %ebx, %eax
    jmp .factorial_end
.factorial_if0_end:
    mov $1, %eax
.factorial_end:
    leave
    ret
main:
    push %rbp
    mov %rsp, %rbp
    sub $16, %rsp
    mov $5, %ebx
    call factorial
    mov %eax, -4(%rbp)
.main_end:
    leave
    ret
exit:
    mov %rax, %rbx
    mov $1, %rax
    int $0x80
