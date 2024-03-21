.globl _start

.data 
	# variables here 
.text

_start:
	li t0, 8 # t0 = N = 8 
	li t1, 1 # t1 = R = 1
	li t2, 0 # A
	li t3, 1 # B
	
TOP:    ble t0, zero, END
	add t1, t2, t3
	add t2, t3, zero 
	add t3, t1, zero
	addi t0, t0, -1
	j TOP
END: 

print:
        addi  a0, t1, 0    	 # print the result
        li    a7, 1
        ecall
	


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
