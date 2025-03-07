# in:    none
# out:   v0 = 1 | 2 vittoria del rispettivo giocatore, 0 altrimenti
        .text
        .globl checkVittoria

checkVittoria:
        la $t0, 0

checkVittoria_loop:
        lb $t1, plancia($t0)                    # t1 = plancia[t0]
        beq $t1, 3, checkVittoria_loop_itera    # controllo bordo
        beq $t1, 0, checkVittoria_loop_itera    # controllo vuoto

	li $t6, 9
        div $t0, $t6
        mflo $t6                                # numero linea
        mfhi $t7                                # offset

checkVittoria_loop_boundOrizz:
        addi $t5, $t7, 4
        bge $t5, 8, checkVittoria_loop_boundVert

checkVittoria_loop_orizz:
        lb $t2, plancia+1($t0)
        bne $t1, $t2, checkVittoria_loop_boundVert
        lb $t2, plancia+2($t0)
        bne $t1, $t2, checkVittoria_loop_boundVert
        lb $t2, plancia+3($t0)
        bne $t1, $t2, checkVittoria_loop_boundVert

        move $v0, $t1
        j checkVittoria_fine

checkVittoria_loop_boundVert:
        bge $t0, 26, checkVittoria_loop_boundDiag1

checkVittoria_loop_vert:
        lb $t2, plancia+9($t0)
        bne $t1, $t2, checkVittoria_loop_boundDiag1
        lb $t2, plancia+18($t0)
        bne $t1, $t2, checkVittoria_loop_boundDiag1
        lb $t2, plancia+27($t0)
        bne $t1, $t2, checkVittoria_loop_boundDiag1

        move $v0, $t1
        j checkVittoria_fine

checkVittoria_loop_boundDiag1:
        addi $t5, $t7, 4
        bge $t5, 8, checkVittoria_loop_boundDiag2
        bge $t0, 26, checkVittoria_loop_boundDiag2

checkVittoria_loop_diag1:
        lb $t2, plancia+10($t0)
        bne $t1, $t2, checkVittoria_loop_boundDiag2
        lb $t2, plancia+20($t0)
        bne $t1, $t2, checkVittoria_loop_boundDiag2
        lb $t2, plancia+30($t0)
        bne $t1, $t2, checkVittoria_loop_boundDiag2

        move $v0, $t1
        j checkVittoria_fine

checkVittoria_loop_boundDiag2:
        addi $t5, $t7, 4
        bge $t5, 8, checkVittoria_loop_itera
        ble $t0, 26, checkVittoria_loop_itera

checkVittoria_loop_diag2:
	addi $t4, $t0, -8
        lb $t2, plancia($t4)
        bne $t1, $t2, checkVittoria_loop_itera
	addi $t4, $t4, -8
        lb $t2, plancia($t4)
        bne $t1, $t2, checkVittoria_loop_itera
	addi $t4, $t4, -8
        lb $t2, plancia($t4)
        bne $t1, $t2, checkVittoria_loop_itera

        move $v0, $t1
        j checkVittoria_fine

checkVittoria_loop_itera:
        addi $t0, $t0, 1
        bne $t0, 52, checkVittoria_loop

checkVittoria_fine:
        jr $ra
