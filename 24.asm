.globl _start
.data
    num1: .dword 24
    num2: .dword 30
.text
_start:
    # call MCD
    la    a0, num1
    la    a1, num2
    ld    a0, 0(a0)
    ld    a1, 0(a1)     
    jal   ra, mcd

    #exit
    li    a7, 10
    ecall

#****************************************************
# completare la funzione MCD nel campo di sotto
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