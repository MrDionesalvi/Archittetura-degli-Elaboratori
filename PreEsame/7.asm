.globl _start
.data        
    v1: .word 1
    v2: .word 2
    v3: .word 3
    v4: .word 4
    result: .word 0
    
.text
_start:
    la   t1, v1          # get the v1 address
    lw   t2, 0(t1)       # copy the first word to t2
    lw   t3, 4(t1)       # copy the second word to t3
    add  t4, t2, t3      # sum the words and save it on register t4
    lw   t3, 8(t1)       # copy the third word to t3
    add  t4, t4, t3      # sum it and save on register t4
    lw   t3, 12(t1)      # copy the fourth word to t3
    add  t4, t4, t3      # sum it and save on register t4
    srai t4, t4, 2       # shift to the right by 2 positions
    sw   t4, 16(t1)      # store the sum in the 5th word
    
      