.globl _start
.section .data
    buffer: .string  "test string"
    low:    .byte  'A'
    high:   .byte  'Z'

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
	
TOP:
	lbu t0, 0(a0)
	beqz t0, NOP
	blt t0, a1, NO
	ble t0, a2, OK
NO:
	addi a0, a0, 1
	j TOP
	
NOP:
	li a0, 0
	jr ra
OK:
	li a0, 1
	jr ra
	
	