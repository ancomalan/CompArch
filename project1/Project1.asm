.data
array:  .word   12, -5, 23, 7, 0, 18, -9, 31, 4, 15
size:   .word   10

.text
        .globl  main

main:
	# Task 1: Call addTwo

	# TODO:
	# 1. Set $a0 = 15 and $a1 = 20
	addi    $a0,    $zero,  15
	addi    $a1,    $zero,  20
	# 2. Call addTwo using jal
	jal     addTwo
	# 3. Store the returned result in $s5
	add     $s5,    $zero,  $v0                        # jr $ra points to this instruction

	# Task 2: Calculate the array sum
	# Write your loop directly in main

	# Provided initialization
	la      $s0,    array                              # $s0 stores starting address of array
	lw      $s1,    size                               # $s1 stores number of elements in array

	# TODO:
	# 1. Initialize the loop counter and sum (For loop)
	add     $t1,    $zero,  $zero                      # loop counter (i) = 0
	add     $t2,    $zero,  $zero                      # running sum = 0
	# 2. Use lw and a loop to add all elements
Loop:
	slt     $t3,    $t1,    $s1                        # check if i < 10 (i from 0-9 means we loop 10 times)
	beq     $t3,    $zero,  END                        # if above condition fails ($t3 is 0), then jump to END
	# otherwise, continue on with program
	sll     $t4,    $t1,    2                          # calculate byte offset for current i (multiply by 2^2)
	add     $t4,    $t4,    $s0                        # adress of element at index i = base address + byte offset
	lw      $t5,    0($t4)                             # load in element from memory
	add     $t2,    $t2,    $t5                        # add array[i] to running sum
	addi    $t1,    $t1,    1                          # increment i
	j       Loop

END:
	# 3. Store the final sum in $s3
	add     $s3,    $t2,    $zero

	# End program
	addi    $v0,    $zero,  10
	syscall

	# Procedure: addTwo
addTwo:
	# TODO:
	# 1. Add $a0 and $a1
	add     $t0,    $a0,    $a1
	# 2. Store the result in $v0
	add     $v0,    $zero,  $t0
	# 3. Return using jr $ra
	jr      $ra