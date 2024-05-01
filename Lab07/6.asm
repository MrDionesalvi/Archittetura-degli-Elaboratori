.globl _start
.data
size:  .word  10
array: .word  3,1,6,6,23,17,9,25,3,4

.text
_start:
    # chiama selection_sort
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, selection_sort

    #exit
    li   a7, 10
    ecall   

#****************************************************
# completare la funzione selection_sort nel campo di sotto
selection_sort:
	li t0, 1
	ble a1, t0 END
	
	addi sp, sp, -12 
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw ra, 8(sp)
	
	jal ra, minarray
	mv t1, a0
	
	# Parte ottimizzabile
	lw a0, 0(sp)
	lw a1, 4(sp)
	lw ra, 8(sp)
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw ra, 8(sp)
	
	li a1, 0
	mv a2, t1
	jal ra, swap
	lw a0, 0(sp)
	lw a1, 4(sp)
	lw ra, 8(sp)
	addi sp, sp, 12
	
	addi a0, a0, 4
	addi a1, a1, -1
	
	addi sp, sp, -4
	sw ra, 0(sp)
	jal ra, selection_sort
	lw ra, 0(sp)
	addi sp, sp, 4
	jr ra
END:
	jr ra
	    
