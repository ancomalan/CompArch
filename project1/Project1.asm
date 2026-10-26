.data
array:  .word   12, -5, 23, 7, 0, 18, -9, 31, 4, 15
size:   .word   10

.text
        .globl  main

main:
	# Task 1: Call addTwo

	# TODO:
	# 1. Set $a0 = 15 and $a1 = 20
	# 2. Call addTwo using jal
	# 3. Store the returned result in $s5

	# Task 2: Calculate the array sum
	# Write your loop directly in main

	# Provided initialization
	la      $s0,    array
	lw      $s1,    size

	# TODO:
	# 1. Initialize the loop counter and sum
	# 2. Use lw and a loop to add all elements
	# 3. Store the final sum in $s3

	# End program
	addi    $v0,    $zero,  10
	syscall

	# Procedure: addTwo
addTwo:
	# TODO:
	# 1. Add $a0 and $a1
	# 2. Store the result in $v0
	# 3. Return using jr $ra