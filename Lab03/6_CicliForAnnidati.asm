.globl _start

.data 
	# variables here 
.text

_start:
	li t0, 10 # t0 = a
	li t1, 5 # t1 = b
	li t2, 0 # t2 = R
	
	li t3, 0 # i
	li t4, 0 # j
	
TOP:    bge t3, t0, END
	li t4, 0 # j
J:	bge t4, t1, FEND
	add t5, t2, t2 # 2* R
	add t2, t5, t3 # R = (2*R) + i
	add t2, t2, t4 # R = (2*R) + i + j
	addi t4, t4, 1
	j J
FEND:
	addi t3, t3, 1
	j TOP
END: 

print:
        addi  a0, t2, 0    	 # print the result
        li    a7, 1
        ecall
	


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
