.globl _start
.data        
    size:   .word 16
    array:  .word 12, 2, 1, 3, 5, 1, 7, 1, -1, 4, -2, -3, 1, 9, -6, 10
    result: .word 0
    
.text
_start:
	la t0, size
	la t1, array
	lw t0, 0(t0) # size
	li t2, 0 # i
	lw t6, 0(t1)

TOP:	
	bge t2, t0, END
	lw t5, 0(t1)
	bge t6, t5, SKIP
	mv t6, t5
SKIP:
	
	addi t1, t1, 4
	addi t2, t2, 1
	j TOP
	
END:
	la t0, result
	sw t6, 0(t0)
	