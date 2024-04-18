.globl _start
.data
    size:  .word 8
    array: .word 1,5,3,7,2,6,4,8
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
	li t0, 8
	mul t1, t0, a1
	mul t2, t0, a2
	
	add t1, t1, a0
	add t2, t2, a0
	
	ld t3, 0(t1)
	ld t4, 0(t2)
	
	sd t4, 0(t2)
	sd t3, 0(t1)

invert:
	li t0, 0 # i
	add t1, zero, a1 # size da dividere a metà
	add t2, zero, a1 # size intatto 
	add t6, zero, ra # ra intatto
	srli t1, t1, 1
	
TOP:
	bge t0, t1, END
	# Chiamata a swap
	addi t3, t2, -1 # t3 = size - 1
	sub t3, t3, t0  # t3 = size - 1 - i
	add a1, zero, t0
	add a2, zero, t3
	jal ra, swap
	###
	add ra, zero, t6
	addi t0, t0, 1
	j TOP

END:
	jr ra
	