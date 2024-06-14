.globl _start
    .data
        array: .word 1,2,3,4,5,4,3,2,2
        size:  .word 9
        
    .text
    _start:
        # chiama palindrome
        la   a0, array
        la   a1, size
        lw   a1, 0(a1)
        jal  ra, palindrome
        
        #exit
        li   a7, 10
        ecall

#########
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
    #*********************************************************
    # completare la funzione palindrome nel campo di sotto
palindrome:
	li s0, 0
	mv s1, a1
	addi s1, s1, -1
	li s2, 1 # result
	
	addi sp, sp, -48
	sd a0, 0(sp)
	sd a1, 8(sp)
	sd ra, 16(sp)
	sd s0, 24(sp)
	sd s1, 32(sp)
	sd s2, 40(sp)

TOP:	
	bge s0, s1, FINE
	mv a1, s0
	mv a2, s1
	jal ra, equal
	mv t0, a0
	
	ld a0, 0(sp)
	ld a1, 8(sp)
	ld s0, 24(sp)
	ld s1, 32(sp)
	ld s2, 40(sp)
	
	and s2, s2, t0
	
	addi s0, s0, 1
	addi s1, s1, -1
	
	sd s0, 24(sp)
	sd s1, 32(sp)
	sd s2, 40(sp)
	
	j TOP

FINE:
	ld ra, 16(sp)
	addi sp, sp, 48
	mv a0, s2
	ret