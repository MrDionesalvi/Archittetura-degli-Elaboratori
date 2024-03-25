.globl _start
.data        
    size:   .word 16
    array:  .word 12, 2, 1, 3, 5, 1, 7, 1, -1, 4, -2, -3, 1, 9, -6, 10
    result: .word 0
    
.text
_start:
	la t0, size
	lw t0, 0(t0) # size
	
	la t1, array
	
	li t2, 0 # Somma
	li t3, 1 # Indice i for
	
	
TOP:	bgt t3, t0, END
	lw t4, 0(t1)
	add t2, t2, t4
	
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
	
