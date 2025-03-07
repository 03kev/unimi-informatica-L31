.globl main

.text

# dati due numeri x e y, restituisce: x+y, x-y, e x*y
sommaDifferenzaProdotto:
  add $v0 $a0 $a1
  sub $v1 $a0 $a1
  mul $t0 $a0 $a1
  addi $sp $sp -4  #
  sw $t0 ($sp)     # push ( $t0 )
  jr $ra
  
.data
x: 10
y: 5
array: .space 12  # risevo 12 bytes per metterci i miei 3 elementi

.text
main:
  la $t0 x
  lw $a0 ($t0)
  la $t1 y
  lw $a1 ($t1)
  jal sommaDifferenzaProdotto    # sommaDifferenzaProdotto( x, y )
  # mettiamo i tre valori restituiti nei tre elementi di array
  la $s0 array
  sw $v0 ($s0)
  sw $v1 4($s0)
  
  lw $t0 ($sp)
  add $sp $sp +4
  sw $t0 8($s0)
  
  li $v0 10
  syscall
  
  