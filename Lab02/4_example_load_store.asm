# sum three words saved in memory
.globl _start

.data
    v1: .word 0x10305070
    v2: .word 0x02040608
    v3: .word 0
.text

_start:
    la   t0, v1        # base address of our .data segment
    lw   t1, 0(t0)     # copy the first word to t1
    lw   t2, 4(t0)     # copy the second word to t2 - we could have used v2 address here!
    add  t3, t1, t2    # sum the words and save it on register t3
    sw   t3, 8(t0)     # store the sum in the 3rd word starting from address in t0

print:
        addi  a0, t3, 0    	 # print the result
        li    a7, 1
        ecall
exit:
        li    a7, 10         # call number 10 = exit
        ecall
