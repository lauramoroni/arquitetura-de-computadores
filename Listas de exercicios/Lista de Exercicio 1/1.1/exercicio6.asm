.data
ano_atual: .word 2024
crianca: .asciiz " anos = criança"
jovem: .asciiz " anos = jovem"
adulto: .asciiz " anos = adulto"
idoso: .asciiz " anos = idoso"

.globl main
.text

main:
	la $t0, ano_atual # Passando endereço
	lw $s0, 0($t0) # Passando valor
	
	# Lendo nome do usuário
	li $v0, 8 # read_string
	syscall
	
	# Lendo idade do usuário
	li $v0, 5 # read_int
	syscall
	
	addi $a0, $v0, 0 # Passando o valor lido para o registrador de argumento
	
	jal idade # Chama função de calcular idade
	
	addi $s0, $v0, 0 # Guardando valor de idade
	
	# Exibir nome
	#addi $a0, $s1, 0
	#li $v0, 4 # print_string
	#syscall
	
	# Exibir idade
	addi $a0, $s0, 0
	li $v0, 1 # print_int
	syscall
	
	# Classificar a idade de acordo com os critérios
	
	slti $t0, $s0, 11 # Verifica se a idade é menor que 11 (se for, t0 = 1; se não, t0 = 0) -> não incluir o 11
	
	bne $t0, 1, Else
	
		# Caso verdadeiro
		la $a0, crianca
		li $v0, 4 # print_string
		syscall
		
		j exit
		
		# Caso falso
		Else:	slti $t0, $s0, 20 # Verifica se a idade é menor que 20 (se for, t0 = 1; se não, t0 = 0) -> não inclui o 20

			bne $t0, 1, Else2
	
				# Caso verdadeiro
				la $a0, jovem
				li $v0, 4 # print_string
				syscall
				
				j exit
				
				# Caso falso
				Else2: slti $t0, $s0, 60 # Verifica se a idade é menor que 60 (se for, t0 = 1; se não, t0 = 0) -> não inclui o 60
	
					bne $t0, 1, Else3
	
					# Caso verdadeiro
					la $a0, adulto
					li $v0, 4 # print_string
					syscall
					
					j exit
					
					# Caso falso
					Else3:	la $a0, idoso
						li $v0, 4 # print_string
						syscall
	
exit:		
	# Finalizando o programa
	li $v0, 10 # exit
	syscall
idade: 
	sub $v0, $s0, $a0 # Calcula idade
	jr $ra # Retorna para a main
