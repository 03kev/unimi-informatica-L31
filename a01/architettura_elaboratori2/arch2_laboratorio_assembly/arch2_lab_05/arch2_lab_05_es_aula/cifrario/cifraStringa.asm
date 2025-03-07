.globl cifraStringa

# input 0 : l'inidirizzo dela stringa (terminata da 0)
# input 1 : la "chiave" del codice di cesare (offeset)
# non ci sono valori di ritorno: la stringa viene codificata dove e'
cifraStringa:
    # non è una funzione foglia (invoca cifraLettera)
	
    # PREAMBOLO: salvo nello stack $ra, $s1, $s2, $s3
    sw $ra -4($sp)
    sw $s1 -8($sp)
    sw $s2 -12($sp)
    sw $s3 -16($sp)
    add $sp $sp -16 
    
    # CORPO DELLA FUNZIONE:
    move $s2 $a0
    move $s1 $a1
  loop:
    lb $s3 ($s2)
    beqz $s3 fineloop
    
    move $a0 $s3      #
    move $a1 $s1      #  $s3 = cifraLettera( $s3, $s1)
    jal cifraLettera  #
    move $s3 $v0      #
    
    sb $s3 ($s2)
    add $s2 $s2 1
    j loop
  fineloop:
  
    # EPILOGO: recupero dallo stack $ra, $s1, $s2, $s3
    add $sp $sp 16 
    lw $ra -4($sp)
    lw $s1 -8($sp)
    lw $s2 -12($sp)
    lw $s3 -16($sp)

    jr $ra
