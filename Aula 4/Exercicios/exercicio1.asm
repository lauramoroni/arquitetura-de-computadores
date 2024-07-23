.data
a: .word 4
b: .word 6

.text

main: 
	# Carregando variáveis
	la $t0, a # endereço 
	lw $a0, 0($t0) # valor carregado no registrador de argumento para ser chamado na função
	
	la $t0, b # endereço 
	lw $a1, 0($t0) # valor carregado no registrador de argumento para ser chamado na função
	
	# Chama a função
	jal soma
	
	# Copia resultado retornado
	add $s1, $v0, $zero
	
	# Imprimir resultado
	addi $a0, $s1, 0
	li $v0, 1
	syscall
	
	# Terminando o programa
      	li $v0, 10          # system call para exit
      	syscall 
	
soma: 
	## Só se tivesse 4+ argumentos
	# Liberando registradores
	#addi $sp, $sp, -12
	#sw $t1, 8($sp)  
	#sw $t0, 4($sp)
	#sw $s0, 0($sp) # ajusta a pilha criando espaço para três itens
	   
	add $s0, $a1, $a0
	
	# Passando o valor para ser retornado
	add $v0, $s0, $zero
	
	# Restaurando os três valores antigos dos registradores
	#lw $s0, 0($sp)
	#lw $t0, 4($sp)
	#lw $t1, 8($sp)
	#ddi $sp, $sp, 12
	
	# Fim da função
	jr $ra