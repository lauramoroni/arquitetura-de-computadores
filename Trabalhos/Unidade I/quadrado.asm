.data
azul: .word 0x0000FF # Valor em hexadecimal
vermelho: .word 0xFF0000 # Valor em hexadecimal
verde: .word 0x00FF00 # Valor em hexadecimal
msg: .asciiz "(1) Azul ; (2) Vermelho ; (3) Verde"
msg2: .asciiz "Tamanho do quadrado: "
i: .word 0 # Contador

.globl main

.text
main: 

li $t0, 0x10010000 # Atribuindo o endere�o do display para o registrador t0

# Carregando contador 
la $t1, i # Passando o endere�o de i pra t1
lw $s4, 0($t1) # Passando o valor de i para s4

# Exibir mensagem
la $a0, msg
li $v0, 4
syscall

# Ler a cor do quadrado
li $v0, 5 #read_int
syscall
addi $s0, $v0, 0 # Atribuindo a cor lida para s0

# Exibir mensagem 2
la $a0, msg2
li $v0, 4
syscall

# Ler o lado do quadrado
li $v0, 5 #read_int
syscall
addi $s1, $v0, 0 # Atribuindo o lado lido para t1

# Definir a cor do quadrado
bne $s0, 1, Else

	# Caso verdadeiro
	
	la $t1, azul # Passando o endere�o da cor azul para t1
	lw $s0, 0($t1) # Passando o valor de azul para s0
	
	j loop1
	
	# Caso falso
	
	Else: bne $s0, 2, Else2
	
		# Caso verdadeiro
		
		la $t1, vermelho # Passando o endere�o da cor vermeho para t1
		lw $s0, 0($t1) # Passando o valor de vermelho para s0
		
		j loop1
		
		# Caso falso
		
		Else2: 	bne $s0, 3, Exit # Se o valor lido for diferente de 1, 2 ou 3, o programa finaliza
			la $t1, verde # Passando o endere�o da cor verde para t1
			lw $s0, 0($t1) # Passando o valor de verde para s0
		
			j loop1		
				
# Finalizando o programa
Exit:
	li $v0, 10 # exit
	syscall

# Loop para pintar o primeiro lado dos quadrados (A para B)

loop1: 
	add $t0, $t0, 4
	sw $s0, 0($t0) # Pixel 'cor' no endere�o base de t0 

	addi $s4, $s4, 1 # Contador + 1
	
	bne $s4, $s1, loop1 # At� o contador ser igual o valor lido

# Zerando a itera��o
addi $s4, $zero, 0

# Loop para pintar o lado (B para D[)

loop2:
	addi $t0, $t0, 64 # Pula todos os pixeis at� chegar no pixel abaixo
	sw $s0, 0($t0) # Pixel 'cor' no endere�o base de t0
	
	addi $s4, $s4, 1 # Contador + 1
	
	bne $s4, $s1, loop2 # At� o contador ser igual o valor lido
	
# Zerando a itera��o
addi $s4, $zero, 0

# Loop para pintar o lado (D para C)

loop3:
	addi $t0, $t0, -4 # Pula todos os pixeis at� chegar no pixel abaixo
	sw $s0, 0($t0) # Pixel 'cor' no endere�o base de t0
	
	addi $s4, $s4, 1 # Contador + 1
	
	bne $s4, $s1, loop3 # At� o contador ser igual o valor lido
	
# Zerando a itera��o
addi $s4, $zero, 0

# Loop para pintar o lado (C para A)

loop4:
	addi $t0, $t0, -64 # Pula todos os pixeis at� chegar no pixel abaixo
	sw $s0, 0($t0) # Pixel 'cor' no endere�o base de t0
	
	addi $s4, $s4, 1 # Contador + 1
	
	bne $s4, $s1, loop4 # At� o contador ser igual o valor lido
	
	j Exit
