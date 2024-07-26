# Aluno: Maria Laura Barboza Moroni
# Matrícula: 2023011068

.text
li $v0, 8
syscall

addi $a0, $v0, 0
# Recebe um ponteiro que indica uma string e retorna quantos caracteres essa string possui
strlen: 
	addi $t0, $a0, 0 # Atribui o valor do argumento para t0
	li $t1, 0 # Contador = 0
	
	strlen_loop:
		lb $t2, 0($t0) # Carrega o byte atual da string
		beq, $t2, $zero, strlen_else
			# Caso verdadeiro (t2 != 0)
			addi $t1, $t1, 1 # contador = contador + 1
			addi $t0, $t0, 4 # Pula para o próximo byte
			
			j strlen_loop # Continua o loop
		
			# Caso falso (t2 = 0)
	strlen_else: 
		addi $v0, $t1, 0 # Atribui o resultado para o registrador de retorno v0
		jr $ra # Retorna para main
		

# Faz a mesma coisa da strcpy, mas em vez de copiar todos os elementos, copia somente os 'count' primeiros elementos da 'src' para a 'dest'
# PRECISA CORRIGIR
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
	