.globl _start
.data
    srcstr: .string  "string to be copied"
    dststr: .string  "destination string is long enough"
.text
_start:
    
    # chiama strcpy    
    la   a0, srcstr
    la   a1, dststr
    jal  ra, strcpy

    #exit
    li   a7, 10
    ecall

#*******************************************************************************
# strlen
# a0 - str
#*******************************************************************************
# usate il vostro codice fatto in precedenza per strlen
strlen:
	li t0, 0

TOP:	
	lbu t1, 0(a0)
	beqz t1, END
	addi t0, t0, 1
	addi a0, a0, 1
	j TOP
	
END:
	mv a0, t0
	jr ra
	
#****************************************************
# completare la funzione strcpy nel campo di sotto
strcpy:
	addi sp, sp, -48
	sd a0, 0(sp)
	sd a1, 8(sp)
	sd ra, 16(sp)
	sd s0, 24(sp)
	sd s1, 32(sp)
	sd s2, 40(sp)
	
	li s0, 0
	
	jal ra, strlen
	mv s1, a0
	
	ld a0, 8(sp) # load in a0, a1
	jal ra, strlen
	mv s2, a0

	ld a0, 0(sp)
	ld a1, 8(sp)
	
COPY:
	bge s0, s1, NEXT
	lbu t0, 0(a0)
	sb t0, 0(a1)
	addi a0, a0, 1
	addi a1, a1, 1
	
	addi s0, s0, 1
	j COPY
NEXT:
	bge s0, s2, FINISH
	sb zero, 0(a1)
	addi a1, a1, 1
	addi s0, s0, 1
	j NEXT

FINISH:

	ld a0, 0(sp)
	ld a1, 8(sp)
	ld ra, 16(sp)
	ld s0, 24(sp)
	ld s1, 32(sp)
	ld s2, 40(sp)
	addi sp, sp, 48
	ret
	
	
	