.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 # Vetor 

.text
main: 
	# Carregando variáveis
	la $t0, A # endereço de 'A'
	addi $t1, $zero, 0 # Inicializa o acumulador
	
	li $t2, 10 # Número de elementos no vetor
	addi $t3, $zero, 0 # Inicializa o contador
	
loop: 
	beq $t3, $t2, loop_else # Se o contador for igual ao número de elementos, salta para 'end_loop'
	
	lw $a0, 0($t0) # Carrega o próximo valor do vetor
	add $a1, $t1, $zero # Passa o valor acumulado como segundo argumento
	
	# Chama a função
	jal soma
	
	add $t1, $v0, $zero # Atualiza o acumulador com o valor retornado
	
	addi $t0, $t0, 4 # Avança para o próximo elemento do vetor (int = 4 bytes)
	addi $t3, $t3, 1 # Incrementa o contador
	
	j loop
	
loop_else:
	# Copia o resultado da soma retornado
	add $a0, $t1, $zero
	
	# Imprimir resultado
	li $v0, 1
	syscall
	
	# Terminando o programa
	li $v0, 10 # system call para exit
	syscall 
	
soma: 
	# Somar os dois valores
	add $v0, $a0, $a1
	
	# Fim da função
	jr $ra