.globl _start
.data
    buffer: .string  "test string"
    low:    .byte  'b'
    high:   .byte  'c'

.text
_start:
    # call contains
    la   a0, buffer
    la   a1, low
    la   a2, high
    lbu  a1, 0(a1)
    lbu  a2, 0(a2)
    jal  ra, contains

    # exit
    li   a7, 10
    ecall

#******************************************
# completare la funzione nel campo di sotto

contains:
	li t0, 0
TOP:	
	lbu t1, 0(a0)
	beq t1, zero, ENDS
	blt t1, a1, END
	bgt t1, a2, END
	addi a0, zero, 1
	jr ra

ENDS:
	addi a0, zero, 0
	jr ra

END:
	addi a0, a0, 1
	j TOP
	