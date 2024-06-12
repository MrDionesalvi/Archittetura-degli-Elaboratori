.globl _start
.data        
    x: .word 1
    y: .word 2
    z: .word 3
    result: .word 0
        
.text
_start:
    la t0, x
    lw t1, 0(t0)
    lw t2, 4(t0)
    lw t3, 8(t0)
    
    mv t4, t1
    bgt t4, t2, PINO
    mv t4, t2
PINO:
     bgt t4, t3, AUGUSTO
     mv t4, t3
AUGUSTO:
     sw t4, 12(t0)