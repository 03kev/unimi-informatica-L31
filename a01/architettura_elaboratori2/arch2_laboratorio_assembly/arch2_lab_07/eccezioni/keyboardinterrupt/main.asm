# Tool richiesto : Digital Lab Sim

.data
	display_dx:	.word	0xFFFF0010
	enable:		.word	0xFFFF0012
	scanner:	.word	0xFFFF0014

.text	
main:
	lw	$a2,scanner	# Indirizzo da cui leggere il carattere premuto
	lw	$a1,enable	# Indirizzo del byte di controllo della tastiera
	
	add	$t1,$t1,0x80	# Per abilitare gli interrupt (da documentazione)
				# è necessario scrivere il bit 7 del byte enable a 1 0x80
	sb	$t1,($a1)	# sb (store byte) vogliamo settare un byte non una word
	
loop:
j loop
	
.ktext 0x80000180

keyboard:
	lw	$a1,enable			# Ci assicuriamo di avere in a1 l'indirizzo del byte di controllo
	add	$t1,$zero,0x81			# Possiamo scansionare una riga della tastiera per volta, per abilitare
						# il controllo su una riga dobbiamo assicurarci che il bit corrispondente
						# alla riga da scansionare sia settato a 1 (0x81 --> 1000 0001)
						
	sb	$t1,($a1)			# aggiorniamo il byte di controllo, se è stato premuto un tasto in questa
						# riga, il codice del tasto verrà scritto nel byte "scanner"
	
	lb	$t3,($a2)			# Leggiamo scanner
		beq $t3,0x11,zero		# Gestisci pressione tasto 0
		beq $t3,0x21,one		# Gestisci pressione tasto 1
		beq $t3,0x41,two		# Gestisci pressione tasto 2
		beq $t3,0xffffff81,three	# Gestisci pressione tasto 3
		
	lw	$a1,enable			# Ci assicuriamo di avere in a1 l'indirizzo del byte di controllo
	add	$t1,$zero,0x82			# Codice per scansionare seconda riga (0x82 --> 1000 0010)
	sb	$t1,($a1)			# aggiorniamo il byte di controllo, se è stato premuto un tasto in questa
						# riga, il codice del tasto verrà scritto nel byte "scanner"
						
	lb	$t3,($a2)			# Leggiamo scanner
	        beq $t3,0x12,four		# Gestisci pressione tasto 4
		beq $t3,0x22,five		# Gestisci pressione tasto 5
		beq $t3,0x42,six		# Gestisci pressione tasto 6
		beq $t3,0xffffff82,seven	# Gestisci pressione tasto 7
		
		lw $a1,enable			# Ci assicuriamo di avere in a1 l'indirizzo del byte di controllo
	add	$t1,$zero,0x84			# Codice per scansionare seconda riga (0x82 --> 1000 0100)
	sb	$t1,($a1)			# aggiorniamo il byte di controllo, se è stato premuto un tasto in questa
						# riga, il codice del tasto verrà scritto nel byte "scanner"
						
	lb	$t3,($a2)			# Leggiamo scanner
	        beq $t3,0x14,eight		# Gestisci pressione tasto 8
		beq $t3,0x24,nine		# Gestisci pressione tasto 9
		
		j end				# Usa tutti gli altri tasti per terminare l'esecuzione
		
zero:
        lw	$a0,display_dx			# Carica l'indirizzo del display destro
	add	$t0,$zero,0x3F			# Carica la configurazione dei segmenti da disegnare
	sw	$t0,0($a0)			# Scrivi la configurazione per aggiornare il display
	eret
	
one:
	lw	$a0,display_dx
	add	$t0,$zero,0x06
	sw	$t0,0($a0)	
	eret
	
two:
	lw	$a0,display_dx
	add	$t0,$zero,0x5B
	sw	$t0,0($a0)	
	eret
	

three:
	lw	$a0,display_dx
	add	$t0,$zero,0x4F
	sw	$t0,0($a0)
	eret
	
four:
	lw	$a0,display_dx
	add	$t0,$zero,0x66
	sw	$t0,0($a0)
	eret

five:
	lw	$a0,display_dx
	add	$t0,$zero,0x6D
	sw	$t0,0($a0)
	eret

six:
	lw	$a0,display_dx
	add	$t0,$zero,0x7D
	sw	$t0,0($a0)
	eret

seven:
	lw	$a0,display_dx
	add	$t0,$zero,0x07
	sw	$t0,0($a0)
	eret
	
eight:
	lw	$a0,display_dx
	add	$t0,$zero,0x7F
	sw	$t0,0($a0)
	eret

nine:
	lw	$a0,display_dx
	add	$t0,$zero,0x6F
	sw	$t0,0($a0)
	eret
	
end:
	li	$v0,10				# exit(0)
	syscall