.text
.globl initPlancia

initPlancia:
move $t0 $fp
addi $fp $sp -4
sw $t0 0($fp)
sw $sp -4($fp)
sw $ra -8($fp)
sw $s0 -12($fp)
sw $s1 -16($fp)
sw $s2 -20($fp)
addi $sp $fp -20


li $s0 0
la $s1 plancia

loop:
bge $s0 6 fineloop

mul $s2 $s0 9 
add $s2 $s2 $s1 # plancia[i * 9]

li $t0 '#'
li $t1 '.'
sb $t0 ($s2)
sb $t1 1($s2)
sb $t1 2($s2)
sb $t1 3($s2)
sb $t1 4($s2)
sb $t1 5($s2)
sb $t1 6($s2)
sb $t1 7($s2)
sb $t0 8($s2)

addi $s0 $s0 1
j loop
fineloop:

mul $s2 $s0 9 
add $s2 $s2 $s1 # plancia[i * 9]

li $t0 '#'
li $t1 '.'
sb $t0 ($s2)
sb $t0 1($s2)
sb $t0 2($s2)
sb $t0 3($s2)
sb $t0 4($s2)
sb $t0 5($s2)
sb $t0 6($s2)
sb $t0 7($s2)
sb $t0 8($s2)

lw $t0 0($fp)
lw $sp -4($fp)
lw $ra -8($fp)
lw $s0 -12($fp)
lw $s1 -16($fp)
lw $s2 -20($fp)
move $fp $t0
jr $ra