.data
ano_atual: .word 2024

.globl main
.text

main:
	la $t0, ano_atual # Passando endereço
	lw $s0, 0($t0) # Passando valor
	
	# Lendo idade do usuário
	li $v0, 5 # read_int
	syscall
	
	addi $a0, $v0, 0 # Passando o valor lido para o registrador de argumento
	
	jal idade # Chama função de calcular idade
	
	addi $s0, $v0, 0 # Guardando valor de idade
	
	# Exibir idade
	addi $a0, $s0, 0
	li $v0, 1 # print_int
	syscall
	
	# Finalizando o programa
	li $v0, 10 # exit
	syscall
idade: 
	sub $v0, $s0, $a0 # Calcula idade
	jr $ra # Retorna para a main