		.data
v: 		.space 2
msg:	.asciiz "Inserisci un intero: "
		.text
# output message
li $v0, 4
la $a0, msg
syscall

# input utente
# dato letto in s0
li $v0, 5
syscall
move $s0, $v0

# somma 1 a s0 e metti in s1
addi $s1, $s0, 1

# memorizza s0 ed s1 in A[0] e A[1]
la $t0, v
sw $s0, ($t0)
addi $t0, $t0, 4
sw $s1, ($t0)

