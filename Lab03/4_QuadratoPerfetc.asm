.globl _start

.data 
	# variables here 
.text

_start:
	li t0, 10 # t0 = N = 10 
	li t1, 0 # t1 = S = 0
	li t2, 1 # t2 = i = 0

	
TOP:    bgt t2, t0, END
	add t3, t2, zero
	mul t3, t3, t3
	add t1, t1, t3
	addi t2, t2, 1
	j TOP
END: 

print:
        addi  a0, t1, 0    	 # print the result
        li    a7, 1
        ecall
	


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
