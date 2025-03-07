.globl cifraLettera

.text

# input 0: la lettera da cifrare
# input 1: l'offset della lettera (pos o neg)
# output: lettera cifrata

cifraLettera:
    # è una procedura foglia
	move $t3 $zero # $t3 vale: 'a' $a0 se minuscolo, 'A' se $a0 maiuscolo, 0 altrim.

	blt $a0 'a' NON_MINUSCOLO
	bgt $a0 'z' NON_MINUSCOLO
	li $t3 'a'
	NON_MINUSCOLO:
	blt $a0 'A' NON_MAIUSCOLO
	bgt $a0 'Z' NON_MAIUSCOLO
	li $t3 'A'
	NON_MAIUSCOLO:

	sub $a0 $a0 $t3  # ora $a0 contiene la posizione alfabetica della lettera (da 0 a 26)
	beqz $t3 DOPO
	add $a0 $a0 $a1  # $a1 è l'offset del cifrario di Cesare
	addi $a0 $a0 260 # aggiungiamo qualsiasi multiplo di 26 per gestire i casi con offset negativo
	rem $a0 $a0 26
	DOPO:
	add $v0 $a0 $t3
	jr $ra


