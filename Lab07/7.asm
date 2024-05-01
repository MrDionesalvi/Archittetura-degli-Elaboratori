.globl _start
.data
    needle: .word 23
    size:   .word 8
    array:  .word 1,5,7,9,11,17,19,23
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
	blt a2, a1, EOS
	
	add t0, a1, a2 # middle = start + end
	li t6, 2
	div t0, t0, t6
	slli t5, t0, 2 
	
	add t1, a0, t5 # t1 = &array[middle]
	lw t1, 0(t1) 
	
	bne a3, t1, FELSE
	mv a0, t0
	jr ra
FELSE:
	bge a3, t1, SELSE
	
	addi sp, sp, -24
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	sw a3, 12(sp)
	sw t0, 16(sp)
	sw ra, 20(sp)
	
	mv a2, t0
	addi a2, a2, -1
	jal ra, binsearch

	lw a1, 4(sp)
	lw a2, 8(sp)
	lw a3, 12(sp)
	lw t0, 16(sp)
	lw ra, 20(sp)
	addi sp, sp, 24
	jr ra
SELSE:
	addi sp, sp, -24
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	sw a3, 12(sp)
	sw t0, 16(sp)
	sw ra, 20(sp)
	
	mv a1, t0
	addi a1, a1, 1
	jal ra, binsearch

	lw a1, 4(sp)
	lw a2, 8(sp)
	lw a3, 12(sp)
	lw t0, 16(sp)
	lw ra, 20(sp)
	addi sp, sp, 24
	jr ra

EOS:
	addi a0, zero, -1
	jr ra