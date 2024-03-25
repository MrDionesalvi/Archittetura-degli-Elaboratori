.globl _start
.data        
    size:   .word 16
    array:  .word 12, 22, 111, 3, 5, 1, 7, 1, -1, 4, -2, -3, 1, 9, -6, 10
    result: .word 0
    
.text
_start:
	la t0, size
	lw t0, 0(t0) # size
	
	la t1, array
	
	lw t5, 0(t1)
	add t2, zero, t5 # Massimo
	li t3, 1 # Indice i for
	
	
TOP:	bgt t3, t0, END
	lw t4, 0(t1)

	bgt t2, t4, SKIP
	add t2, zero, t4
SKIP:
	
	addi t1, t1, 4
	addi t3, t3, 1
	j TOP
END:

	la t4, result
	sw t2, 0(t4) 
	
	
print:
        addi  a0, t2, 0    	 # print the result
        li    a7, 1
        ecall
	
