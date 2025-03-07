Le rune e le stringhe sono rispettivamente dei caratteri e delle sequenze di caratteri che vengono codificati dal computer con dei numeri, in particolare con dei byte.
#### Sistemi di codifica
###### ASCII (1963)
ASCII, l'american standard code for information interchange, è un codice per la codificvn dei caratteri che si basa su **7-bit** e che di conseguenza dispone di 128 caratteri diversi (2<sup>7</sup>). 
È una codifica basata sulla lingua inglese, e non presenta quindi tutte quelle lettere accentate presenti nelle altre lingue europee.

I primi 32 caratteri sono di controllo (es: il carattere codificato dal codice 9 è la tabulazione), i restanti invece sono caratteri stampabili come lettere, punteggiatura, numeri, ecc...![[ASCII Table.png| C | 550]]
###### ISO 8859-15 (1999)
È un codice che si presta a supportare la codifica delle lingue neolatine e dell'Europa occidentale. 
Usa **8-bit**, disponendo quindi di **256 caratteri** (2<sup>7</sup>): i primi 128 sono occupati dai caratteri ASCII, mentre la restante metà presenta un'estensione dei caratteri ASCII che include lettere e simboli degli alfabeti europei. Per esempio, il carattere 192 (C0) rappresenta "À", mentre il numero 164 (A4) codifica il simbolo dell'euro €.

![[ISO8859-15 Table.png| C | 600]]

###### UNICODE
l'Universal Code è un sistema di codifica che assegna un numero univoco ad ogni carattere. È stato pensato per codificare tutte le lettere e i simboli di tutte le lingue del mondo, anche quelle morte, e altri caratteri come per esempio le emoji.

Unicode utilizza 32-bit, permettendo un totale di circa 1,1 milione di combinazioni possibili codificati con numeri esadecimali (2<sup>32</sup> combinazioni sarebbero 4 miliardi, ma per varie ragioni non è possibile utilizzare tutto quello spazio). Ad oggi circa 140k spazi sono stati utilizzati.

Unicode, dalle codifiche 0 alla 127, presenta i caratteri ASCII, e fino a 255 i caratteri europei: questo perchè sono quelli più utilizzati e comuni, e di conseguenza possono occupare meno byte quando vengono codificati in binario.

<ins>Definizioni</ins>:
- Unicode è composto da dei **code point**: sono dei numeri univoci che rappresentano degli Unicode characters, che possono essere sia dei caratteri che dei grafema.
- Un **code unit** è l'unita di immagazzinamento di un code point codificato. In UTF-8 il code unit è 8 bit, in UTF-16 è 16 bit o 2 byte. 
  A seconda del carattere, il code unit può rappresentare un code point nella sue interezza oppure una sola parte di esso: il carattere "☃" occupa 3 code unit (3 byte) in UTF-8, mentre occupa un solo code unit (2 byte) in UTF-16.
- Il **grafema** è una sequenza di uno o più code point che sono rappresentati come una singola unità grafica che il lettore riconosce come un unico elemento di scrittura. 
  Sia *a* che *à* sono due grafemi, ma il secondo potrebbe consistere di due code point: uno per il carattere *a* ed uno per l'apostrofo; c'è anche un altro singolo code point che rappresenta il secondo grafema. Alcuni code point non fanno mai parte di nessun grafema.
- Il **glifo** è un'immagine immagazzinata in un font (un insieme di glifi) usata per rappresentare i grafemi o parti di esse.
  I font possono comporre glifi multipli in un'unica rappresentazione. Unicode inoltre non dipende dai glifi, in quanto sono questi ultimi a dover supportare i caratteri di Unicode.

***
#### Rappresentazione dei caratteri in Go
##### Rune
Le rune di go contengono i code point di Unicode. Per immagazzinare i caratteri Unicode in memoria, Go utilizza la codifica UTF-8: ciò risulta in un output di lunghezza variabile tra 1 e 4 byte. Per questo motivo le rune sono considerate zucchero sintattico: sono un altro modo di definire un int32: `{go} c := 65; Println(string(c)) //output:a`
>Le rune teoricamente occuperebbero 32-bit essendo un singolo carattere Unicode, ma ciò comporterebbe che un normale carattere di testo ASCII occupi 4 byte invece di uno solo. Per questo motivo bisogna fare in modo che la lunghezza della runa sia variabile: si introduce perciò l'UTF-8.

###### UTF-8
È un codice per la codifica di caratteri a lunghezza variabile ed è capace di codificare tutto il milione di caratteri di code points di Unicode utilizzando da una a 4 stringhe.
È compatibile con lo standard ASCII: i primi 128 caratteri di Unicode, che corrispondono esattamente a quelli ASCII, sono codificati da un solo byte con lo stesso valore binario di quelli ASCII.

La maggior parte dei siti web e dei linuguaggi di programmazione utilizza UTF-8, in quanto occupa meno spazio di memoria.

**Funzionamento**
Se il primo byte inizia con 0, significa cbe il carattere è rappresentato in 7 bit ed è ASCII.
Se invece il carattere non è ASCII, e quindi occupa più di un byte:
- 

[ ... manca una parte ... ]

##### [Stringhe](https://go.dev/blog/strings)
Le stringhe sono delle sequenze ideali di rune che sono in realtà codificate in UTF-8.
Queste, in Go, sono immutabili: `{go} c := "ciao"; c[0] = "l" //errore`
- `{go}len(stringa)`  restituisce la lunghezza in byte della stringa, ossia il numero di byte che questa occupa in codifica UTF-8.
- `{go}stringa[i] ` restituisce il byte della stringa alla posizione i. 

###### Problematiche di len(stringa) e stringa[i] in Go
Se una stringa contiene solo caratteri ASCII, dato che questi occupano un solo byte in golang, la lunghezza restituita da len(stringa) sarà pari alla quantità di caratteri nella stringa, e perciò facendo stringa[i] si ottiene effettivamente il carattere alla posizione i della stringa.
- Questo però non vale se la stringa contiene anche caratteri non ASCII, che occupano dai 2 ai 4 byte. Se si prova a fare un ciclo for per scorrere i caratteri di questa stringa:
```go title:"string[ i ]""
func main() {
	stringa := "€50💶"
	for i := 0; i < len(stringa); i++ {
		Print("Char di indice ", i, ": ", string(stringa[i]), "\n")	
	} 
	/* 
	len(stringa) = 9 [€ 3byte, 5 e 0 1byte ciascuno (ASCII), 💶 4byte]
	0:'â', 1:'', 2:'¬', 3:'5', 4:'0', 5:'ð', 6:' ', 7:' ', 8:'¶'
	*/

	Println()
	for i, c := range stringa {
		Print("Char di indice ", i, ": ", string(c), "\n")
	}
}
```
- si nota che la lista non è scorsa correttamente: len(stringa) non restituisce la quantità di caratteri della stringa, in questo caso 4, ma il numero di byte che questa occupa, ossia 9: i caratteri non ASCII infatti necessitano di almeno due byte per essere codificati.
  Di conseguenza quando si prova a stampare l'i-esimo carattere della stringa, i caratteri ASCII vengono stampati correttamente (anche se con indice sbagliato), mentre gli altri sono spezzettati: per esempio, al posto di un carattere che occupa tre byte, vengono stampati i tre caratteri codificati ciascuno da uno dei tre byte.

###### Substrings
The substring operation s[i:j] yields a new string consisting of the bytes of the original string starting at index i and continuing up to, but not including, the byte at index j. The result contains j-i bytes.

`fmt.PrintIn(s[0:5]) // "hello"` 
Again, a panic results if either index is out of bounds or if j is less than i.