.globl _start
.data
    numstr: .string  "123"
.text
_start:
    # chiama strlen per ottenere la lunghezza della stringa
    la   a0, numstr
    jal  ra, strlen
    
    # chiama atoi
    mv   a1, a0
    la   a0, numstr
    jal  ra, atoi

    #exit
    li   a7, 10
    ecall

#*******************************************************************************
# strlen
# a0 - str
#*******************************************************************************
# usare la funzione strlen sviluppata in precedenza 
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
	
#****************************************************
# completare la funzione atoi nel campo di sotto
atoi:
	bnez a1, NEX
	li a0, 0
	ret
NEX:
	addi sp, sp, -24
	sd ra, 0(sp)
	sd a1, 8(sp)
	sd s0, 16(sp)

	addi a1, a1, -1
	add t0, a0, a1
	lbu s0, 0(t0)
	li t0, 48
	sub s0, s0, t0
	

	jal ra, atoi
	
	li t0, 10
	mv t1, a0
	
	mul t0, t0, t1
	add a0, s0, t0

	li t0, 0
	ld ra, 0(sp)
	ld a1, 8(sp)
	ld s0, 16(sp)
	addi sp, sp, 24
	
	ret
	