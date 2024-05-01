.globl _start
.data
    num: .dword 10
.text
_start:
    # call serief
    la    a0, num
    lw    a0, 0(a0)
    jal   ra, serief

    #exit
    li    a7, 10
    ecall

#****************************************************
# completare la funzione serief nel campo di sotto
serief:
    li t1, 1
    li t2, 2
    li t3, 3
    beq a0, t1, ENDA
    beq a0, t2, ENDB
    beq a0, t3, ENDC

    addi sp, sp, -32
    sd a0, 0(sp)
    sd ra, 8(sp)

    addi a0, a0, -1
    jal ra, serief
    mv t1, a0

    ld a0, 0(sp)
    ld ra, 8(sp)
    sd t1, 16(sp)

    addi a0, a0, -2
    jal ra, serief
    mv t2, a0

    ld a0, 0(sp)
    ld ra, 8(sp)
    ld t1, 16(sp)
    sd t2, 24(sp)

    addi a0, a0, -3
    jal ra, serief
    mv t3, a0

    ld a0, 0(sp)
    ld ra, 8(sp)
    ld t1, 16(sp)
    ld t2, 24(sp)
    addi sp, sp, 32

    add a0, t1, t2
    add a0, a0, t3
    jr ra

ENDA:
    addi a0, zero, 1
    jr ra
ENDB:
    addi a0, zero, 1
    jr ra
ENDC:
    addi a0, zero, 1
    jr ra