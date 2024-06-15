.globl _start
.data
    array: .word  1,2,3
    size:  .word  3
    
.text
_start:
    # chiama sumarray
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, sumarray
    
    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione sumarray nel campo di sotto
sumarray:
	bnez a1, NEXT
	li a0, 0
	ret	
NEXT:
	addi sp, sp, -32
	sd a0, 0(sp)
	sd a1, 8(sp)
	sd ra, 16(sp)
	sd s0, 24(sp)
	
	lw s0, 0(a0)
	addi a0, a0, 4
	addi a1, a1, -1
	
	jal ra, sumarray
	
	add a0, s0, a0
	ld a1, 8(sp)
	ld ra, 16(sp)
	ld s0, 24(sp)
	addi sp, sp, 32
	
	ret