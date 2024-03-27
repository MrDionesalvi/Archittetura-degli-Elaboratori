	la t0, size
	lw t0, 0(t0) # size
	
	la t1, array
	li t2, 0 # Counter dei numeri dispari
	li t3, 1 # Counter del for
	li t6, 1 # Check element // 2
	li t5, 0
	
TOP:	bgt t3, t0, END
	lb t4, 0(t1) # Carico in t4, il valore dell'aray nella posizione i
	
	andi t5, t4, 1
	beq t5, zero, SKIP
	addi t2, t2, 1
SKIP:
	addi t1, t1, 1
	addi t3, t3, 1
	j TOP
END:

	la t4, result
	sw t2, 0(t4) 
	
