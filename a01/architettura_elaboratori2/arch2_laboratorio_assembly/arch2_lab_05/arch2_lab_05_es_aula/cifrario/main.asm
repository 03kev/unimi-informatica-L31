.globl main
.data
msg: .asciiz "\nCODIFICATO:\n"
msg2: .asciiz "\nDECODICATO:\n"
stringaLetta: .space 256
.text

main:

la $s6 msg
la $s5 msg2
la $s3 stringaLetta

li $v0 8      #
move $a0 $s3  # readString( $s3 )
li $a1 250    #
syscall       #

move $a0 $s3     #
li $a1 -2        # cifraStringa( $s3 , -2 )
jal cifraStringa #

move $a0 $s6 # 
li $v0 4     # print ( msg )
syscall      #

li $v0 4        #
move $a0 $s3    # print ( $s3 )
syscall         #

move $a0 $s5   # 
li $v0 4       # print ( msg2 )
syscall        #

move $a0 $s3     # 
li $a1 +2        # cifraStringa( $s3 , +2 )
jal cifraStringa #

li $v0 4      #
move $a0 $s3  #  print ( $s3 )
syscall       # 

li $v0 10   # exit()
syscall     #
