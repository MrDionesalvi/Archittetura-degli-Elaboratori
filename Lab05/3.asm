.globl _start
.data
    str: .string "Hello World!"

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
	li t0, 5381 # Hash
	li t1, 0 # i counter
	
TOP:
	lbu t2, 0(a0)
	addi a0, a0, 1
	beq t2, zero, END # While
	
	add t3, zero, t0 # Copia di Has in t3
	slli t3, t3, 5 # hash << 5
	add t3, t3, t0
	add t3, t3, t2
	add t0, zero, t3
	j TOP
END:	
	add a0, zero, t0
	jr ra
	
	