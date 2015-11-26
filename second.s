#Lizzy Austad and Elizabeth Lefever

.globl list

.data

count:
	.word 10
list:
	.word 3 11 157 99 81 13 17 55 11 999

answers:
	.word 0 0 0

.text

main:

	la $s0, list
	la $s6, answers
	la $s7, count
	lw $a1, 0($s7)
	add $s1, $0, $a1


loop:
	lw $a0, 0($s0)

	add $s3, $s3, $a0
	and $s4, $s4, $a0
	xor $s5, $s5, $a0
	
	addi $v0, $0, 1
	syscall
	addi $s0, $s0, 4

	addi $v0, $0, 11
	addi $a0, $0, 32
	syscall	

	addi $s1, $s1, -1
	bne $0, $s1, loop

	sw $s3, 0($s6)
	lw $a0, 0($s6)
	addi $v0, $0, 1
	syscall
	addi $v0, $0, 11
        addi $a0, $0, 32
	syscall
	
	sw $s4, 4($s6)
	lw $a0, 4($s6)
	addi $v0, $0, 1
	syscall
	addi $v0, $0, 11
	addi $a0, $0, 32
	syscall
	
	sw $s5, 8($s6)
	lw $a0, 8($s6)
	addi $v0, $0, 1
	syscall

	jr $ra