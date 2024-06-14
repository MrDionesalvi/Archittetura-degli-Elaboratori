.globl _start
.data
    num1: .dword 5
    num2: .dword 6
.text
_start:
    # call MCD
    la    a0, num1
    la    a1, num2
    ld    a0, 0(a0)
    ld    a1, 0(a1)     
    jal   ra, mcm

    #exit
    li    a7, 10
    ecall

mcd:

TOP:	
	beq a0, a1, END
	ble a0, a1, ELSE
	sub a0, a0, a1
	j TOP
ELSE:
	sub a1, a1, a0
	j TOP
	
END:
	ret
#****************************************************
# completare la funzione MCM nel campo di sotto
mcm:
	addi sp, sp, -32
	sd ra, 0(sp)
	sd a0, 8(sp)
	sd a1, 16(sp)
	sd s0, 24(sp)
	
	jal ra, mcd
	mv s0, a0
	ld ra, 0(sp)
	ld a0, 8(sp)
	ld a1, 16(sp)
	
	mul a0, a0, a1
	div a0, a0, s0
	
	ld s0, 24(sp)
	addi sp, sp, 32
	
	ret	
