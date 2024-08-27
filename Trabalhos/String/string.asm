# Aluno: Maria Laura Barboza Moroni
# Matrícula: 2023011068
##################################################################################################################################################
# Recebe um ponteiro que indica uma string e retorna quantos caracteres essa string possui
strlen: 
	# Liberando espaço na pilha para 1 item 
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	
	addi $s0, $a0, 0 # Passando o endereço da string para s0
	li $t0, 0 # Contador = 0
	
	strlen_loop:
		lb $t1, 0($s0) # Carrega o byte atual da string em t1 ; t1 = string[i]
		beq, $t1, $zero, strlen_else
			# Caso verdadeiro (t2 != 0)
			addi $t0, $t0, 1 # contador = contador + 1
			addi $s0, $s0, 1 # Pula para o próximo byte
			
			j strlen_loop # Continua o loop
		
			# Caso falso (t2 = 0)
	strlen_else: 
		addi $v0, $t0, 0 # Atribui o resultado para o registrador de retorno v0
	
		# Liberando espaço na pilha
		lw $s0, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra # Retorna para chamada de função

##################################################################################################################################################
# Compara duas strings em relação ao seu tamanho (do caracter mais à esquerda até o mais à direita) e retorna um inteiro. Se primeira
# string é menor que a segunda retorna -1. Se a segunda string é maior que a segunda retornar 1. Se as strings têm o mesmo comprimento retornar 0.
# Essa função precisa necessariamente chamar a função anterior (strlen) para ser implementada.	
strcmp: 
	# Liberando espaço na pilha para 3 itens
	addi $sp, $sp, -12
	sw $ra, 0($sp) # Armazena o endereço de retorno
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	jal strlen # Chama 'strlen' para contar a quantidade de caracteres da string 's', armazenada em a0
	
	addi $s0, $v0, 0 # Salva o valor em s0
	
	move $a0, $a1 # Move a string t para a0, para ser argumento de função
	
	jal strlen # Chama 'strlen' para conta a quantidade de caracteres da string t, armazenada em a0
	
	addi $s1, $v0, 0 # Salva o valor em s1
	
	# Comparando se a primeira string é menor que a segunda
	slt $t1, $s0, $s1
	bne $t1, 1, strcmp_else
		
		# Caso falso (s < t)
		li $v0, -1 # O resultado final é -1
		
		j strcmp_exit # Pula para o final da função
		
		# Caso verdadeiro (s >= t)
		strcmp_else:
			# Comparando se a primeira string tem o mesmo tamanho que a segunda
			beq $s0, $s1, strcmp_equal
			
				# Caso falso (s > t)
				li $v0, 1 # O resultado final é 1
				
				j strcmp_exit # Pula para o final da função
				
				# Caso verdadeiro (s = t)
				strcmp_equal:
					li $v0, 0 # O resultado final é 0
					
	strcmp_exit:
		# Restaura itens da pilha
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		lw $s1, 8($sp)
		addi $sp, $sp, 12
		
		jr $ra # Volta para função main
		
##################################################################################################################################################	
# Copia (concatena) a string 'src' ao final da string 'dest'.
strcat: 
	# Liberando espaço da pilha para 3 itens
	addi $sp, $sp, -12 # Ajusta a pilha para 3 itens
	sw $ra, 0($sp) # Guarda o endereço de retorno
	sw $s0, 4($sp) # Salva o valor de s0 usado antes da função
	sw $s1, 8($sp) # Salva o valor de s1
	
	addi $s0, $a0, 0 # Salva o endereço da string 'dest'
	
	jal strlen # Chama a função 'strlen' e retorna a quantidade de caracteres da string 'dest' (a0)
	
	add $s0, $s0, $v0 # Calcula o endereço do final da string 'dest' (a0)
	
	addi $s1, $a1, 0 # Salva o endereço da string 'src' em s1
 	
 	strcat_loop:
 		lb $t1, 0($s1) # Carrega o byte 'src[i]' em t1
 	
 		beq $t1, $zero, strcat_else # Se o byte carregado for nulo (ou seja, fim da string com '\0'), salta para strncpy_else
		
		sb $t1, 0($s0) # Salva o byte de 'src' em 'dest'
		
		# Pulando para o próximo byte das strings (um caractere = um byte)
		addi $s0, $s0, 1
    		addi $s1, $s1, 1 
		
		j strcat_loop # Retorna para 'strcat_loop' e continua o loop
		
	strcat_else:
	
		sb $zero, 0($s0) # Adiciona o byte nulo no final da string 'dest' para evitar caracteres repetidos
		
		# Restaurando os itens da pilha
		lw $ra, 0($sp)
		lw $s0, 4($sp) 
		lw $s1, 8($sp)
		addi $sp, $sp, 12
	
		jr $ra # Retorna para a chamada de função na main
		
##################################################################################################################################################
# Copia (concatena) 'count' elementos da string 'src' no final da string 'dest'
strncat:
	# Liberando espaço da pilha para 3 itens
	addi $sp, $sp, -12 # Ajusta a pilha para 3 itens
	sw $ra, 0($sp) # Guarda o endereço de retorno
	sw $s0, 4($sp) # Salva o valor de s0 usado antes da função
	sw $s1, 8($sp) # Salva o valor de s1
	
	addi $s0, $a0, 0 # Salva o endereço da string 'dest'
	
	jal strlen # Chama a função 'strlen' e retorna a quantidade de caracteres da string 'dest' (a0)
	
	add $s0, $s0, $v0 # Calcula o endereço do final da string 'dest' (a0)
	
	addi $s1, $a1, 0 # Salva o endereço da string 'src' em s1
	
	addi $t0, $zero, 0 # Contador = 0
 	
 	strncat_loop:
 		lb $t1, 0($s1) # Carrega o byte 'src[i]' em t1
 	
 		beq $t0, $a2, strncat_else # Se o byte carregado for igual ao 'count' (ou seja, já concatenou a quantidade n de caracteres), salta para strncpy_else
		
		lb $t1, 0($s1) # Carrega o byte atual de 'src' em $t1
		
   		beq $t1, $zero, strncat_else # Se o byte atual for nulo, termina a cópia
		
		sb $t1, 0($s0) # Salva o byte de 'src' em 'dest'
		
		# Pulando para o próximo byte das strings (um caractere = um byte)
		addi $s0, $s0, 1
    		addi $s1, $s1, 1 
		
		addi $t0, $t0, 1 # Contador = contador + 1
		
		j strncat_loop # Retorna para 'strcat_loop' e continua o loop
		
	strncat_else:
	
		sb $zero, 0($s0) # Adiciona o byte nulo no final da string 'dest' para evitar caracteres repetidos
		
		# Restaurando os itens da pilha
		lw $ra, 0($sp)
		lw $s0, 4($sp) 
		lw $s1, 8($sp)
		addi $sp, $sp, 12
	
		jr $ra # Retorna para a chamada de função na main
		
##################################################################################################################################################
# Faz a mesma coisa da strcpy, mas em vez de copiar todos os elementos, copia somente os 'count' primeiros elementos da 'src' para a 'dest'
strncpy:	
	# Liberando espaço da pilha para um item
	addi $sp, $sp, -4 # Ajusta a pilha para um item
	sw $s0, 0($sp) # Salva o valor de s0 usado antes da função
	
	addi $s0, $zero, 0 # i = 0 ; contador

strncpy_loop:	
	beq $s0, $a2, strncpy_else # Se o contador for igual ao 'count', salta para strncpy_else
	
	# Caso falso ( contador != count )
    		add $t1, $s0, $a1 # Atribui o endereço 'src[i]' em t1
 		lb $t2, 0($t1) # Carrega o byte atual de 'src' em t2

  		add $t3, $s0, $a0 # Atribui o endereço 'dest[i]' em t3
  		sb $t2, 0($t3) # Armazena o byte de 'src' em 'dest'
    
		addi $s0, $s0, 1 # i = i + 1
  		j strncpy_loop # Retorna para strncpy_loop e continua o loop

	# Caso verdadeiro ( i = count )
	strncpy_else:
		# Restaura os valores da pilha
		lw $s0, 0($sp)
		addi $sp, $sp, 4 # Ajusta a pilha para um item
	
		jr $ra # Retorna para a chamada de função na main
