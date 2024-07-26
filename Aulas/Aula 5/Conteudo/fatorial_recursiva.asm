.data
n: .word 0
msg: .asciiz "Fatorial("
msg2: .asciiz "): "

.globl main

.text
main:	la $a0, n # Passando o endereço de n para t0

	# Lendo o valor
	li $v0, 5
	syscall
	
	addi $t1, $v0, 0 # Só para printar depois
	addi $a0, $v0, 0 # Atribuindo o valor lido para o registrador de argumento
	
	jal fact # Retorna o fatorial de n no registrador v0
	
	addi $s0, $v0, 0 # Guardando o valor retornado
	
	# Imprimindo o valor
	la $a0, msg
	li $v0, 4
	syscall
	addi $a0, $t1, 0
	li $v0, 1
	syscall
	la $a0, msg2
	li $v0, 4
	syscall
	addi $a0, $s0, 0
	li $v0, 1
	syscall
	
	# Finalizando programa
	li $v0, 10
	syscall

fact:	addi $sp, $sp, -8 # Ajusta a pilha para 2 itens
	sw $ra, 4($sp) # Salvando endereço de retorno
	sw $a0, 0($sp) # Salvando o argumento n
	
	# Verificar se n é menor que 1
	slti $t0, $a0, 1 # Testa se a0 é menor que 1 (se for, t0 recebe a 1; se não, recebe 0)
	bne $t0, 1, Else
	
		# Caso verdadeiro (a0 < 1)
		addi $v0, $zero, 1 # Atribui 1 ao valor de retorno
		addi $sp, $sp, 8 # Retira dois itens da pilha
		jr $ra # Retorna para o endereço da próxima instrução na main
	
		# Caso falso
		Else:	addi $a0, $a0, -1 # Subtrai 1 de a0 (condiz a 'fact(n - 1)')
			jal fact # chama 'fact(n-1)'
		
	# Restaurando registradores
	lw $a0, 0($sp) # Restaura o valor de n
	lw $ra, 4($sp)
	addi $sp, $sp, 8 # Ajusta stack pointer
	
	# Retornando o novo $v0
	mul $v0, $a0, $v0 # Retorna 'n * fact(n-1)'
	jr $ra # Retorna para o endereço que chamou a função (na main)
	
