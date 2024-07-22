.data
i: .word 5 # Inicializando i com o valor 5
msg: .asciiz "O valor do fatorial é: "

.globl main # Definindo a main como label global

.text
# Função fatorial
fact: 
	addi $t1, $zero, 1 # t1 = 1
lab: 	mul $t1, $t1, $s0
	addi $s1, $t1, 0 # Resultado da soma 
	subi $s0, $s0, 1
	bne $s0, $zero, lab
	
	jr $ra # Volta para a chamada da função na main

# Função main
main:
	# Carregando variáveis
	la $t0, i # Endereço de i
	
	# Lendo valor
	li $v0, 5
	syscall
	addi $s0, $v0, 0 # Atribuindo a s0 o valor lido 
	
	# Chamando a função
	jal fact
	
	# Exibindo resultado
	## Exibindo mensagem
	la $a0, msg
	li $v0, 4
	syscall
	## Exibindo valor
	add $a0, $zero, $s1
	li $v0, 1
	syscall
	
	
	
