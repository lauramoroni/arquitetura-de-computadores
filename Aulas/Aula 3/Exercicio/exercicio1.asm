# Considere duas variáveis A e B inicializadas
# Leia as 2 variáveis
# Teste se A é maior que B
##Se sim, imprima “O valor A é maior que B” (onde A e B são os valores das variáveis)
##Caso contrário, “O valor A é menor ou igual a B” (onde A e B são os valores das variáveis)

.data
A: .word 0
B: .word 0
AmaiorB: .asciiz "O valor A é maior que B"
AmenorB: .asciiz "O valor A é menor ou igual a B"

.text

# Passando os endereços de A e B

la $s0, A # Endereço de A em s0
la $s1, B # Endereço de B em s1

# Ler os valores de A e B

li $v0, 5 #read_int
syscall
add $s0, $v0, 0 # Atribuindo o valor lido de A ao registrador s0

li $v0, 5 # read_int
syscall
add $s1, $v0, 0 # Atribuindo o valor lido de B ao registrador s1

# Testar se A é maior que B

slt $t1, $s0, $s1 # Verifica se A é menor que B (se for, t1 = 1; se não, t1 = 0)

beq $t1, 1, Else # Compara A e B

	# Caso falso (A >= B)
	beq $s0, $s1, Else # Verifica se A e B são iguais (se forem, pula para Else; se não, continua)
		
		# Caso falso (A > B)
		la $a0, AmaiorB # Passando o endereço de 'AmaiorB' para o registrador de argumento a0
		li $v0, 4 #print_string
		syscall
		j Exit
	
	# Caso verdadeiro (A <= B)
Else: 	la $a0, AmenorB # Passando o endereço de 'AmenorB' para o registrador de argumento a0
	li $v0, 4 # print_string
	syscall

Exit:
