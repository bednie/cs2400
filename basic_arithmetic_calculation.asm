.text 
li $t1,10 		# initialize $t1 with constant value 10
add $t2,$t1,1 		# add $t1 and constant value 1 
add $t3,$t1,$t2 	# add $t1 and $t2
add $t4,$t1,3		# add $t1 and constant value 3
add $t5,$t3,$t4		# intermediate step: add $t3 and $t4
add $t5,$t5,1		# complete step: add 1 to $t3 and $t4

li $v0, 1       	# print()
la $a0, ($t5)		# print value of $t5
syscall

li $v0,10    		# exit()
syscall      	