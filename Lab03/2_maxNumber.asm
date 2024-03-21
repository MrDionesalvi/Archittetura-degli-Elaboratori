.globl _start

.data 
	# variables here 
.text

_start:
	li t0, 2
	li t1, 1
	li t2, 99
	
	add t3, t0, zero
	
	bgt t3, t1, THEN
	add t3, t1, zero
THEN:	bgt t3, t2, END
	add t3, t2, zero
	
END: 
print:
        addi  a0, t3, 0    	 # print the result
        li    a7, 1
        ecall
	


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
