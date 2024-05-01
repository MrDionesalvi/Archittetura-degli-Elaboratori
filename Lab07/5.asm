  .globl _start
  .data
    size:  .word  10
    array: .word  3,1,6,6,23,17,9,25,3,4
  
  .text
  _start:
      # chiama minarray
      la   a0, array
      la   a1, size
      lw   a1, 0(a1)
      jal  ra, minarray
      
      #exit
      li   a7, 10
      ecall   

#****************************************************
# completare la funzione minarray nel campo di sotto
minarray:
	li t0, 0	# min_idx = 0
	lw t1, 0(a0)	# min_val = array[0]
	li t2, 1	# i
	addi a0, a0, 4
	
TOPWHILE:
	bge t2, a1, END
	lw t3, 0(a0)
	bge t3, t1, ENDWHILE
	mv t0, t2
	mv t1, t3
	j TOPWHILE
ENDWHILE:
	addi t2, t2, 1
	addi a0, a0, 4
	j TOPWHILE
	

END:
	add a0, zero, t0
	jr ra
	