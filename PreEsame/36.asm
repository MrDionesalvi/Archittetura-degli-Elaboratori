.globl _start
.data
    needle: .word 10
    size:   .word 8
    array:  .word 1,2,3,7,9,10,11,15
.text
_start:
    # chiama binsearch
    la   a0, array
    li   a1, 0
    la   a2, size
    lw   a2, 0(a2)
    addi a2, a2, -1
    la   a3, needle
    lw   a3, 0(a3)
    jal  ra, binsearch
    
    #exit
    li   a7, 10
    ecall

#***************************************************
# completare la funzione binsearch nel campo di sotto
binsearch:
	bge a2, a1, OK
	li a0, -1
	ret	

OK:
	add t0, a1, a2 # middle = start + end
	srli t0, t0, 1 # middle = (start + end)/2
	
	slli t1, t0, 2 # middle *4 
	add t1, t1, a0 # array[middle]
	lw t1, 0(t1) # :D
	
	bne a3, t1, IF
	mv a0, t0
	ret
IF:
	addi sp, sp, -8
	sd ra, 0(sp)
	
	bge a3, t1, ELSE
	addi t0, t0, -1
	mv a2, t0
	jal ra, binsearch
	j END
	
ELSE:
	addi t0, t0, 1
	mv a1, t0
	jal ra, binsearch
	j END
END:
	ld ra, 0(sp)
	addi sp, sp, 8
	ret