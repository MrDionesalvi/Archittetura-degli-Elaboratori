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
	slli a1, a1, 2
	slli a2, a2, 2
	add t0, a0, a1
	add t1, a0, a2
	lw t2, 0(t0)
	lw t3, 0(t1)
	
	sw t2, 0(t1)
	sw t3, 0(t0)
	
	ret