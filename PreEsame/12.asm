.globl _start
.data
    size:   .word  8                  # size of the array        
    array:  .dword 1,2,3,4,5,6,7,8    # array of long integers
    result: .word  -1                 # store the result
    
.text
_start:
	la t0, size
	la t1, array
	lw t0, 0(t0) # size
	addi t0, t0, -1         
	li t2, 1 # result
	li t3, 0 # i
	
TOP:	
	bge t3, t0, END
	lw t4, 0(t1)
	lw t5, 8(t1)
	ble t4, t5, SKIP
	li t2, 0
	mv t3, t0
	
SKIP:
	addi t1, t1, 8
	addi t3, t3, 1
	j TOP
END:
	la t0, result
	sd t2, 0(t0)
																																																																																																																																																																																			