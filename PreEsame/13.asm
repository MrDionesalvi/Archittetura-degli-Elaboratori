.globl _start
.data
    size:   .word  8                  # size of the array        
    array:  .dword 1,2,3,4,5,6,7,8    # array of long integers

.text
_start:
	la t0, size
	la t3, array
	la t5, array
	lw t0, 0(t0)
	li t1, 0
	
	li t4, 8
	mul t4, t4, t0
	add t5, t5, t4 # t5  pointer to the last element
	
	srli t0, t0, 1
TOP:	
	bge t1, t0, END
	addi t5, t5, -8
	lw t2, 0(t3) # long temp = array[i]
	lw t4, 0(t5)
	sd t4, 0(t3)
	sd t2, 0(t5)
	addi t3, t3, 8
	addi t1, t1, 1
	j TOP	
			

END:	