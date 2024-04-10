.globl _start
.data
    str: .string "Hello World!"
    n:   .word   6

.text
_start:

    la  a0, str
    la  a1, n
    lw  a1, 0(a1)
    jal ra, charAt

    #exit
    li   a7, 10
    ecall

charAt:
	li t0, 0
	add t0, a0, a1
	lbu a0, 0(t0)
	jr ra
	
