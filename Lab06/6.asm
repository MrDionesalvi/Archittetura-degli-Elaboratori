    .globl _start
    .data
        array: .word 1,2,3,4,5,4,3,2,2
        size:  .word 9
        
    .text
    _start:
        # chiama palindrome
        la   a0, array
        la   a1, size
        lw   a1, 0(a1)
        jal  ra, palindrome
        
        #exit
        li   a7, 10
        ecall
    
#*********************************************************
# completare la funzione palindrome nel campo di sotto

palindrome:
    li t0, 0 #i
    
    li t1, -1 # j
    add t1, t1, a1
    li t2, 1 # result
   
TOP:     
    bge t0, t1, END
    addi sp, sp, -20
    sw t0, 0(sp)
    sw t1, 4(sp)
    sw t2, 8(sp)
    sw ra, 12(sp)
    sw a0, 16(sp)
    
    add a1, zero, t0
    add a2, zero, t1
    jal ra, equal
    
    lw t2, 8(sp)
    and t2, t2, a0
    
    lw t0, 0(sp)
    lw t1, 4(sp)
    lw ra, 12(sp)
    lw a0, 16(sp)
    addi sp, sp, 20   
    
    addi t0, t0, 1
    addi t1, t1, -1
    j TOP
    

END:
    add a0, zero, t2
    jr ra
