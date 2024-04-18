.globl _start
.data
    size:  .word 2
    array: .word 1,5
.text
_start:
    # chiama invert
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)        
    jal  ra, invert
    
    #exit
    li   a7, 10
    ecall

#***************************************************
# completare la funzione invert nel campo di invert
swap:
	li t0, 4
	mul t1, t0, a1
	mul t2, t0, a2
	
	add t1, t1, a0
	add t2, t2, a0
	
	lw t3, 0(t1)
	lw t4, 0(t2)
	
	sw t3, 0(t2)
	sw t4, 0(t1)
	
	li t0, 0
	li t1, 0
	li t2, 0
	li t3, 0
	li t4, 0
	li t5, 0
	li t6, 0
	
	jr ra

invert:
	li t0, 0 # i
	add t1, zero, a1 # size da dividere a metà 
	add t2, zero, a1 # size intatto 
	srli t1, t1, 1
	
TOP:
	bge t0, t1, END
	# Chiamata a swap
	addi t3, t2, -1 # t3 = size - 1
	sub t3, t3, t0  # t3 = size - 1 - i
	add a1, zero, t0
	add a2, zero, t3
	addi sp, sp, -16
	sw t0, 0(sp)  # i
	sw t1, 4(sp)  # uscita ciclo
	sw t2, 8(sp) # size intatto
	sw ra, 12(sp) # ra
	jal ra, swap
	###
	lw t0, 0(sp)  # i
	lw t1, 4(sp)  # uscita ciclo
	lw t2, 8(sp) # size intatto
	lw ra, 12(sp) # ra
	addi sp, sp, 16
	
	addi t0, t0, 1
	j TOP

END:
	jr ra
	
