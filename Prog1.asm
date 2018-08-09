#Wesley Wittekiend
#Program 1

.data
ArrayA:	.word 0, 2, 4, 6, 8, 10, 12, 14, 16, 18
ArrayB:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
ArrayC:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
space:	.asciiz " "

.text
.globl main

main:
la $s0, ArrayA
la $s1, ArrayB
la $s2, ArrayC
li $s3, 0		#i
li $s4, 10		#length
Loop:
lw $t0, 0($s0)		#load ArrayA[i] into $t0
lw $t1, 0($s1)		#load ArrayB[i] into $t1
sub $t3, $t0, $t1	#t3 = ArrayA[i] - ArrayB[i] 
sw $t3, 0($s2)		#save t3 to ArrayC[i]
lw $t4, 0($s2)		#load ArrayC[i]
li $v0, 1
move $a0, $t4
syscall			#print ArrayC[i]
li $v0, 4
la $a0, space		#print space character
syscall
addi $s3, $s3, 1	#increment i and data addresses of arrays
addi $s0, $s0, 4
addi $s1, $s1, 4
addi $s2, $s2, 4
blt $s3, $s4, Loop	#loop if i < length
li $v0, 10		#END	
syscall
