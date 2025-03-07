.globl main
.text

# func mediaDiCinque( x0,x1,x2,x3,x4 int) int {
#    return (x0+x1+x2+x3+x4) / 5
# }


mediaDiCinque:
   add $t0 $a0 $a1
   add $t0 $t0 $a2
   add $t0 $t0 $a3
   lw $t2 ($sp)    #  questa è una
   add $sp $sp 4   #  pop( $t2 )
   add $t0 $t0 $t2
   # ora $t0 è la somma dei 5 parametri
   div $v0 $t0 5
   jr $ra

# func main() {
#    print( media( 14, 16, 17, 12, 10 ) )
# }


main:
   li $a0 14
   li $a1 16
   li $a2 17
   li $a3 12
   add $sp $sp -4
   li $t0 10
   sw $t0 ($sp)
   jal mediaDiCinque
   
   move $a0 $v0
   li $v0 1
   syscall