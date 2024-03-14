# sum three words saved in memory
.globl _start

.data
    v1: .word 0x5f
    v2: .word 0xabc
    v3: .word 0xc
    v4: .word 0xf0
    v5: .word 0
    NUM_VALUES: .word 4
.text

_start:
    la   t0, v1        # base address of our .data segment
    lw   t1, 0(t0)     # copy the first word to t1
    lw   t2, 4(t0)     # copy the second word to t2 
    lw   t3, 8(t0)
    lw   t4, 12(t0)
    lw   t5, 16(t0)	# RESULT
    lw   t6, 20(t0)	# Numero di valori :D
    
    add x10, t1, t2
    add x10, x10, t3
    add x10, x10, t4
    
    div t5, x10, t6
    sw t5, 16(t0)

print:
        addi  a0, t5, 0    	 # print the result
        li    a7, 1
        ecall
exit:
        li    a7, 10         # call number 10 = exit
        ecall
