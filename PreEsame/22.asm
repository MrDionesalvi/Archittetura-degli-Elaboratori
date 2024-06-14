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
	slli a1, a1, 2
	slli a2, a2, 2
	mv t0, a0
	mv t1, a0
	add t0, t0, a1
	add t1, t1, a2
	
	lw t0, 0(t0)
	lw t1, 0(t1)
	
	bne t0, t1, NOP
	li a0, 1
	jr ra
	
NOP:
	li a0, 0
	jr ra