.globl _start
.data
    array: .word  1,2,3,4,5,6,7,8,9,10
    size:  .word  10
    
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
	addi sp, sp, -16
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw ra, 8(sp)
	
	beqz a1, ENDARRAY
	lw t0, 0(a0) # return = array[0]
	sw t0, 12(sp)
	
	addi a0, a0, 4
	addi a1, a1, -1
	jal ra, sumarray
	
	lw t0, 12(sp)
	add t0, t0, a0
	lw a0, 0(sp)
	lw a1, 4(sp)
	lw ra, 8(sp)
	addi sp, sp, 16	
	
	add a0, zero, t0
	jr ra
	


ENDARRAY:
	addi sp, sp, 16
	add a0, zero, zero
	jr ra
