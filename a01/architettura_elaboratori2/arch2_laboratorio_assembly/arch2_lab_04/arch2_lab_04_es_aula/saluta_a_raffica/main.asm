.data
marioNome: .asciiz "Mario"
zia: "zia"
anna: "Anna"
.text

.globl main
 
main:
   la $a0 marioNome
   jal salutaQualcuno
   
   la $a0 zia
   jal salutaQualcuno
   
   la $a0 anna   
   jal salutaQualcuno

   li $v0 10
   syscall


	
