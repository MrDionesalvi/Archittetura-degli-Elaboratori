.globl _start
.data        
  v1: .word 1
  v2: .word 2
  v3: .word 3
  v4: .word 4
    result: .word 0
.text
_start: 
    la   t0, v1        # base address of our .data segment
    lw   t1, 0(t0)     # copy the first word to t1
    lw   t2, 4(t0)     # copy the second word to t2 
    lw   t3, 8(t0)
    lw   t4, 12(t0)
    lw   t5, 16(t0)	# RESULT
    addi t6, zero, 4
    
    add x10, t1, t2
    add x10, x10, t3
    add x10, x10, t4
    
    div t5, x10, t6
    rem a1, x10, t6

    sw t5, 16(t0)
    
	
print:
        addi  a0, a1, 0    	 # print the result
        li    a7, 1
        ecall
	
