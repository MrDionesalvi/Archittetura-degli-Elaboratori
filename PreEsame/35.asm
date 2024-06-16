  .globl _start
  .data
    size:  .word  10
    array: .word  3,1,6,6,23,17,9,25,3,4
  
  .text
  _start:
      # chiama selection_sort
      la   a0, array
      la   a1, size
      lw   a1, 0(a1)
      jal  ra, selection_sort
      
      #exit
      li   a7, 10
      ecall   
      
      
minarray:
	li t0, 0	#min_idx
	lw t1, 0(a0)	#min_val
	li t2, 1	#i

TOP:
	bge t2, a1, END
	addi a0, a0, 4
	lw t3, 0(a0)
	bge t3, t1, SKIP
	mv t0, t2 # min_idx = i
	mv t1, t3 # min_val = array[i]	
SKIP:
	addi t2, t2, 1
	j TOP
END:
	mv a0, t0
	ret
	
swap:
	slli a1, a1, 2
	slli a2, a2, 2
	add t0, a0, a1
	add t1, a0, a2
	lw t2, 0(t0)
	lw t3, 0(t1)
	
	sw t2, 0(t1)
	sw t3, 0(t0)
	
	ret
#****************************************************
# completare la funzione selection_sort nel campo di sotto
selection_sort:
	li t0, 1
	bgt a1, t0, OK
	ret	
OK:
	addi sp, sp, -32
	sd a0, 0(sp)
	sd a1, 8(sp)
	sd ra, 16(sp)
	sd s0, 24(sp)
	
	jal ra, minarray
	mv s0, a0
	
	ld a0, 0(sp)
	li a1, 0
	mv a2, s0
	jal ra, swap
	
	ld a0, 0(sp)
	ld a1, 8(sp)
	addi a0, a0, 4
	addi a1, a1, -1
	jal ra, selection_sort
	
		
	ld a0, 0(sp)
	ld a1, 8(sp)
	ld ra, 16(sp)
	ld s0, 24(sp)
	addi sp, sp, 32
	ret