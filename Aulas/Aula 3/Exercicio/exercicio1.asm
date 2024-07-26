# Considere duas vari�veis A e B inicializadas
# Leia as 2 vari�veis
# Teste se A � maior que B
##Se sim, imprima �O valor A � maior que B� (onde A e B s�o os valores das vari�veis)
##Caso contr�rio, �O valor A � menor ou igual a B� (onde A e B s�o os valores das vari�veis)

.data
A: .word 0
B: .word 0
AmaiorB: .asciiz "O valor A � maior que B"
AmenorB: .asciiz "O valor A � menor ou igual a B"

.text

# Passando os endere�os de A e B

la $s0, A # Endere�o de A em s0
la $s1, B # Endere�o de B em s1

# Ler os valores de A e B

li $v0, 5 #read_int
syscall
add $s0, $v0, 0 # Atribuindo o valor lido de A ao registrador s0

li $v0, 5 # read_int
syscall
add $s1, $v0, 0 # Atribuindo o valor lido de B ao registrador s1

# Testar se A � maior que B

slt $t1, $s0, $s1 # Verifica se A � menor que B (se for, t1 = 1; se n�o, t1 = 0)

beq $t1, 1, Else # Compara A e B

	# Caso falso (A >= B)
	beq $s0, $s1, Else # Verifica se A e B s�o iguais (se forem, pula para Else; se n�o, continua)
		
		# Caso falso (A > B)
		la $a0, AmaiorB # Passando o endere�o de 'AmaiorB' para o registrador de argumento a0
		li $v0, 4 #print_string
		syscall
		j Exit
	
	# Caso verdadeiro (A <= B)
Else: 	la $a0, AmenorB # Passando o endere�o de 'AmenorB' para o registrador de argumento a0
	li $v0, 4 # print_string
	syscall

Exit:
