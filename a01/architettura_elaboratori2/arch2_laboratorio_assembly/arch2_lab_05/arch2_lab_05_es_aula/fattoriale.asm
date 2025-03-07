.text

.main
  # scriviamo a schermo il fattoriale di 5 (5! = 120)
  
  li $a0 5       #
  jal fattoriale # $v0 = fattoriale( 5 )
  
  move $a0 $v0   #
  li $v0 1       # print( $v0 )
  syscall        #
  
  li $v0 10      #  
  syscall        # exit
  
  

# input  n
# output n!
fattoriale:

  # PREAMBOLO:
  MOVE $t0 $fp
  ADD $fp $sp -4
  SW $t0  0($fp)  
  SW $ra -4($fp)  
  SW $sp -8($fp)  
  SW $s0 -12($fp)  
  ADD $sp $fp -12
  
  # if (a0==0) then return 1;         // caso base
  # else return a0 * fattoriale(a0-1) // caso ricorsivo
 
  move $s0 $a0
  beqz $s0 casoBase
  
  # caso ricorsivo
  add $a0 $s0 -1   #
  jal fattoriale   # $t1 = fattoriale($s0-1) * s0
  mul $t1 $v0 $s0  # 
  
  move $v0 $t1
  j epilogo
  
casoBase:
  li $v0 1
  
epilogo:
  LW $t0  0($fp)  
  LW $ra -4($fp)  
  LW $sp -8($fp)  
  LW $s0 -12($fp) 
  move $fp $t0
  jr $ra
