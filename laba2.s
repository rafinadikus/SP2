.data
    array:
        .byte 100, 100, 20, 30, 15, 60
    string:
        .ascii "             \n"
.text
.global _start
_start:
    movl $array, %eax
    movl $3, %ecx
    xorl %ebx, %ebx
    
    m1:
        movb (%eax), %bl
        orb $0x10, %bl
        addw %bx, %dx
        movb %bl, (%eax)
        addl $1, %eax
        movb (%eax), %bl
        andb $0xdf, %bl
        addw %bx, %dx
        movb %bl, (%eax)
        addl $1, %eax
        cmp $0, %ecx
        je m2
    loop m1

    m2:

    movl $string, %esp
    addl $7, %esp
    movl %edx, %eax

    m3:
        movw $10, %bx
        #movb ($array), %al
        xorl %edx, %edx
        divw %bx
        addb $48, %dl
        movb %dl, (%esp)
        subl $1, %esp
        cmpw $0, %ax
        je m4
    loop m3
    m4:

    movl $4, %eax
    movl $1, %ebx
    movl $14, %edx
    movl $string, %ecx
    int $0x80

    movl $1, %eax
    movl $0, %ebx
    int $0x80

