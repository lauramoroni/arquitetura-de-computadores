.data
x: .word 0
y: .word 0 
i: .word 0 # Contador

.text
main:	
	# Carregando variáveis
	la $a0, x
	la $a1, y
	
	# Lendo valores
	li $v0, 5 # read_int
	syscall
	addi $a0, $v0, 0 # Armazena o valor lido em 'x'
	
	li $v0, 5 # read_int
	syscall
	addi $a1, $v0, 0 # Armazena o valor lido em 'y'

	# Inicializa o contador
	li $t0, 0 # Valor auxiliar para fazer a soma
	li $t1, 0 # Contador
	
	jal produto # Chama função
	
	# Exibir resultado
	addi $a0, $v0, 0
	li $v0, 1 # print_int
	syscall
	
	# Finalizando programa
	li $v0, 10 # exit
	syscall
	
produto:
	add $t0, $t0, $a0 # X = X + X
	
	addi $t1, $t1, 1 # i = i + 1
	
	bne $t1, $a1, produto # Repete o loop até 'i' ser igual a 'y'
	
	addi $v0, $t0, 0 # Atribuindo o resultado ao registrador de retorno v0
	
	jr $ra # Volta para main