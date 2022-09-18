.data
message:    .ascii "This is my first assembly program.\n"
	    .asciiz "I am "
message_2: 	    .asciiz " years old.\n"	    

.text 
main:
	# print first part of message
        la $a0,message  # print()
        li $v0,4
        syscall

	# print int for age
	li $v0, 1       # print()
	li $a0, 34
	syscall
	
	#print last part of message
	la $a0,message_2 	# print()
        li $v0,4
        syscall

	# exit
        li $v0,10   	# exit()
        syscall         