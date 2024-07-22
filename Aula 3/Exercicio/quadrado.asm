.data
azul: .word 0x0000FF # Valor em hexadecimal
vermelho: .word 0xFF0000 # Valor em hexadecimal
verde: .word 0x00FF00 # Valor em hexadecimal
branco: .word 0xFFFFFF # Valor em hexadecimal
i: .word 84 # Contador

.text
li $t0, 0x10010000 # Atribuindo o endereço do display para o registrador t0

# Carregando variáveis

la $t1, azul # Passando o endereço da cor azul para t1
lw $s0, 0($t1) # Passando o valor de azul para s0

la $t1, vermelho # Passando o endereço da cor vermeho para t1
lw $s1, 0($t1) # Passando o valor de vermelho para s1

la $t1, verde # Passando o endereço da cor verde para t1
lw $s2, 0($t1) # Passando o valor de verde para s2

la $t1, branco # Passando o endereço da cor branca para t1
lw $s3, 0($t1) # Passando o valor de branco para s3

la $t1, i # Passando o endereço de i pra t1
lw $s4, 0($t1) # Passando o valor de i para s4


# Desenhar um quadrado

## Cantos do quadrado
sw $s0, 84($t0) # Pixel azul no endereço base de t0 (A)
sw $s1, 104($t0) # Pixel vermelho no endereço base de t0 (B)
sw $s2, 404($t0) # Pixel verde no endereço base de t0 (C)
sw $s3, 424($t0) # Pixel branco no endereço base de t0 (D) 

# Loop para pintar o primeiro lado dos quadrados (A para B)
loop1: 	li $t1, 88
	sw $s0, $s4($t0)
	
	addi $t1, $t1, 4
	bne $t1, 104, loop1
	
li $s6, 2 # teste se saiu do loop
	
	


