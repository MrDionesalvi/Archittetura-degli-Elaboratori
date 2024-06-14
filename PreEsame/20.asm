.globl _start
.data
    str: .string  "My string"
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
	beqz t1, END
	addi t0, t0, 1
	addi a0, a0, 1
	j TOP
	
END:
	mv a0, t0
	jr ra
	