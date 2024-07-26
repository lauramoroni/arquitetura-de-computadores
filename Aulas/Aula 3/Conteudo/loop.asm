.data
k: .word 0
valor_k: .asciiz "valor de K = "
valor_i: .asciiz "save[i] = "

.text
	# Inicio do loop
Loop: 	sll $t1, $s3, 2 # t1 = 4 * 1 // Desloca dois bits à esquerda
	add $t1, $t1, $s6 # Passando o endereço de 'save[i]' em t1
	lw $t0, 0($t1) # Passa o valor de 'save[i]' em t0
