.data
g: .word 5
h: .word 3
i: .word 2
j: .word 2
f: .word 0

.text

# Carregando os valores na mem�ria

la $t0, g # Passando o endere�o de 'g' em t0
lw $s0, 0($t0) # Carrega o valor de 'g' em s0

la $t0, h # Passando o endere�o de 'h' em t0
lw $s1, 0($t0) # Carrega o valor de 'h' em s0

la $t0, i # Passando o endere�o de 'i' em t0
lw $s2, 0($t0) # Carrega o valor de 'i' em s0

la $t0, j # Passando o endere�o de 'j' em t0
lw $s3, 0($t0) # Carrega o valor de 'j' em s0

la $t0, f # Passando o endere�o de 'f' em t0

# Estrutura condicional

beq $s2, $s3, Else # Comparando se os valores de 'i' e 'j' s�o iguais
	# Caso verdadeiro
add $t0, $s0, $s1 # Atribuindo a t0 ('f') a soma de 'g' e 'h'
j Exit
	# Caso falso
Else: sub $t0, $s0, $s1 # Atribuindo a t0 ('f') a subtra��o de 'g' e 'h'
Exit:





