.data
n1: .word 0
n2: .word 0
n3: .word 0
n4: .word 0
msg: .asciiz "O valor "
msg2: .asciiz " atingiu o esperado com 3 valores"
msg3: .asciiz " atingiu a meta com 4 valores"
msg4: .asciiz "Não foi dessa vez. "
msg5: .asciiz " está abaixo do esperado"

.text
# Carregando e lendo variáveis

	## n1
	la $t0, n1
	li $v0, 5
	syscall
	addi $t0, $v0, 0
	addi $t1, $t0, 0

	## n2
	la $t0, n2
	li $v0, 5
	syscall
	addi $t0, $v0, 0
	addi $t2, $t0, 0

	## n3
	la $t0, n3
	li $v0, 5
	syscall
	addi $t0, $v0, 0
	addi $t3, $t0, 0
	
	## n4
	la $t0, n4
	
# Somatório das variáveis
	add $s0, $t1, $t2
	add $s0, $s0, $t3
	
# Testar se o valor é maior ou igual a 21
	slti $t0, $s0, 21 # Verifica se s0 é menor que 21 (se for, t0 recebe 1; se não, recebe 0)
	
	bne $t0, 0, Else
	
	# Caso verdadeiro
	la $a0, msg 
	li $v0, 4
	syscall
	addi $a0, $s0, 0
	li $v0, 1
	syscall
	la $a0, msg2
	li $v0, 4
	syscall
	
	j Exit
	
	# Caso falso
	Else:	li $v0, 5
		syscall
		addi $t1, $v0, 0
		
		# Somando o resultado anterior com o valor lido
		add $s1, $t1, $s0
		
		slti $t0, $s1, 24 # Verifica se s1 é menor que 24 (se for, t0 recebe 1; se não, recebe 0)
		
		bne $t0, 0, Else1
		
		# Caso verdadeiro
		la $a0, msg
		li $v0, 4
		syscall
		addi $a0, $s1, 0
		li $v0, 1
		syscall
		la $a0, msg3
		li $v0, 4
		syscall
		
		j Exit
		# Caso falso
		Else1:	la $a0, msg4
			li $v0, 4
			syscall
			la $a0, msg
			li $v0, 4
			syscall
			addi $a0, $s1, 0
			li $v0, 1
			syscall
			la $a0, msg5
			li $v0, 4
			syscall
		
Exit: 	li $v0, 10
	syscall