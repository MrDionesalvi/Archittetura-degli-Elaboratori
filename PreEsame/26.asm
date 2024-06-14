.globl _start
    .data
        array: .word 1,2,3,4,5,4,3,2,1
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
	bge s0, s1, END
	mv a1, s0
	mv a2, s1
	jal ra, TOP
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

END:
	ld ra, 16(sp)
	addi sp, sp, 48
	mv a0, s2
	ret