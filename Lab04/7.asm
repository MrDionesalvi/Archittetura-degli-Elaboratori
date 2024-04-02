la t0, size
	lw t0, 0(t0) # size

	
	la t1, array
	la t6, array
	
	li t3, 8
	mul t3, t0, t3
	add t6, t6, t3
	addi t6, t6, -8
	li t3, 0
	
	li t3, 0 # Counter del for

    addi t3, t3, 1
	srli t0, t0, 1
TOP:
	bgt t3, t0, END
	ld t4, 0(t1) # Carico in t4, il valore dell'aray nella posizione i
	ld t5, 0(t6)
	
	sd t4, 0(t6)
	sd t5, 0(t1)
		
	addi t1, t1, 8
	addi t3, t3, 1
	addi t6, t6, -8
	j TOP
END:


	