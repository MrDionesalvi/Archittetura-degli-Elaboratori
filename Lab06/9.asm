.globl _start
.data
    size:  .word 8
    array: .word 1,5,3,7,2,6,4,8
    x:     .word 0
    y:     .word 1
    
.text
_start:
    # chiama swap
    la   a0, array
    la   a1, x
    lw   a1, 0(a1)
    la   a2, y
    lw   a2, 0(a2)
    jal  ra, swap
    
    #exit
    li   a7, 10
    ecall

#***************************************************
# completare la funzione swap nel campo di sotto
swap:
	li t0, 8
	mul t1, t0, a1
	mul t2, t0, a2
	
	add t1, t1, a0
	add t2, t2, a0
	
	ld t3, 0(t1)
	ld t4, 0(t2)
	
	sd t4, 0(t2)
	sd t3, 0(t1)