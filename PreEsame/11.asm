.globl _start
.data
    size:   .word 8                  # size of the array        
    array:  .byte 2,1,3,2,3,-6,1,23  # the array of bytes
    result: .word 0                  # store the result
    
.text
_start:
	la t0, size
	la t1, array
	lw t0, 0(t0) # size
	li t2, 0 # i
	li t6, 0 
	li t3, 2

TOP:	
	bge t2, t0, END
	lb t5, 0(t1)
	rem t4, t5, t3 # t4 = t5 % 2 
	beqz t4, SKIP
	addi t6, t6, 1
SKIP:
	
	addi t1, t1, 1
	addi t2, t2, 1
	j TOP
	
END:
	la t0, result
	sw t6, 0(t0)