.globl _start
.data
    str: .string "V"

.text
_start:
    # call hash
    la  a0, str
    jal ra, hash

    #exit
    li   a7, 10
    ecall

#******************************************
# completare la funzione nel campo di sotto
hash:
	li t0, 5381
	
TOP:	
	lbu t3, 0(a0)
	beqz t3, END
	slli t4, t0, 5 # hash << 5
	add t0, t0, t4
	add t0, t0, t3
	
	addi a0, a0, 1
	j TOP
	
END:
	mv a0, t0
	jr ra