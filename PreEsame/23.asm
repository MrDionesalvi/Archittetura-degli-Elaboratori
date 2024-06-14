.globl _start
.data
    size:  .word 8
    array: .word 1,5,3,7,2,6,4,8
.text
_start:
    # chiama invert
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)        
    jal  ra, invert
    
    #exit
    li   a7, 10
    ecall

#***************************************************
# completare la funzione invert nel campo di sotto
invert:
      addi  sp, sp, -32
      sd    ra, 0(sp)
      sd    a0, 8(sp)
      sd    s1, 16(sp)
      sd    s2, 24(sp)

      addi  s1, zero, 0         # index of first element
      addi  s2, a1, -1          # index of last element
LOOP_invert:
      blt   s2, s1, END_invert  # if s2 < s1 goto end

      ld    a0, 8(sp)
      add   a1, s1, zero
      add   a2, s2, zero
      jal   ra, swap
      addi  s1, s1, 1
      addi  s2, s2, -1
      j     LOOP_invert
END_invert:

      ld    ra, 0(sp)           # restore the return address
      ld    s1, 16(sp)
      ld    s2, 24(sp)
      addi  sp, sp, 32          # restore the stack pointer
      ret
	
