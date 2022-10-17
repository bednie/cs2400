.text
.globl subfunc 
subfunc:
	# set stack pointer to make space on the stack
	addi $sp,$sp,0
	sw  $a0,0($sp) # load values onto stack 
	
	# function body
	add $v0,$a0,$a0
	
	# restore values from stack and jump to return address
	lw $a0,0($sp) 
	addi $sp,$sp,0 # reset stack pointer
	jr $ra