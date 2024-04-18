    .globl _start
    .data        
        array: .word 1,1,2,2,3,4,4,1
        x:     .word 0
        y:     .word 2
        
    .text
    _start:
        # chiama equal
        la   a0, array
        la   a1, x
        lw   a1, 0(a1)
        la   a2, y
        lw   a2, 0(a2)
        jal  ra, equal
        
        #exit
        li   a7, 10
        ecall
    
    #***************************************************
    # completare la funzione equal nel campo di sotto
    equal:
    	li t0, 4
    	li t1, 1
    	li t2, 1
    	
    	mul t1, t0, a1
    	mul t2, t0, a2 
    	
    	add t1, a0, t1
    	add t2, a0, t2
    	lw t1, 0(t1)
    	lw t2, 0(t2)
    	
    	beq t1, t2, END
    	addi a0, zero, 0
    	jr ra
    	
END:
	addi a0, zero, 1
	jr ra
	
    	