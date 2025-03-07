# Trova la somma degli stipendi,
# dato il vettore (o array) di stipendi mensili
# Stipendi � un vettore in RAM "terminato da -1"
# (Il valore -1 � il terminatore, o elemento guardia:
#  non � un elemento dell'array ma segnala la fine dell'array)

.data
stipendi: .word 50 12 40 5 0 13  -1

.text

PSEUDOCODICE: 

var totale = 0;
for (i=0; stipendi[i]!= -1 ; i++) {
   totale = totale + stipendi[i];
}

RISCRITTURA A BASSO LIVELLO:

ciclo:
	var totale = 0;
	var i = 0;
	ciclo:
	if (stipendio[i]==-1) break; cio� esci dal ciclo; cio� SALTA a fine_ciclo
	totale = totale + stipendi[i];
	i++;
	continue; cio� SALTA alla prossima iterazione
fine_ciclo: # etichetta

VEDI ESERCIZIO SUCCESSIVO PER SCRITTURA IN MIPS
