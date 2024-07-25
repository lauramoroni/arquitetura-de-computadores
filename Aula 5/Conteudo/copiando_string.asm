# while((x[i] = y[i]) != ‘\0’) /* copia e testa byte*/
# i += 1
# x[0] = a0 ; y[0] = a1 ; i = s0

.data

.globl main
.text
main:

strcpy:	
	# Liberando espaço da pilha
	addi $sp, $sp, -4 # Ajusta a pilha para um item
	sw $s0, 0($sp) #  Salva o valor de s0 usado antes da função
	add $s0, $zero, $zero # i = 0
	
L1:	add $t1, $s0, $a1 # Atribui o endereço 'y[i]' em t1
	lb $t2, 0($t1) # $t2 = 'y[i]'
	add $t3, $s0, $a0 # Atribui o endereço 'x[i]' em t3
	sb $t2, 0($t3) # x[i] = y[i]
	beq $t2, $zero, L2 # Se t2 for igual a 0, salta para L2
	
	# Caso falso
		addi $s0, $s0, 1 # i = i + 1
		
		j L1 # Retorna para L1 e continua o loop

	# Caso verdadeiro
L2:
	# Restaura os valores da pilha
	lw $s0, 0($sp)
	addi $sp, $sp, 4 # Ajusta a pilha para um item
	jr $ra # Retorna para a chamada de função na main
	

