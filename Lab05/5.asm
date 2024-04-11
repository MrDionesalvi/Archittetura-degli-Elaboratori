.globl _start
.data
    str: .string  "str"
.text
_start:
    # call strlen
    la   a0, str
    jal  ra, strlen

    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione strlen nel campo di sotto
strlen:
	li t0, 0
TOP:
	lbu t1, 0(a0)
	beq t1, zero, END
	addi a0, a0, 1
	addi t0, t0, 1
	j TOP

END:
	add a0, zero, t0
	jr ra