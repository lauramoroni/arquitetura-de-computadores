.data
g: .word 14 # Valor teste
h: .word -9 # Valor teste

.text
# Carrega vari�veis
la $t0, g # Endere�o de 'g'
lw $s0, 0($t0) # Valor de 'g'
la $t0, h # Endere�o de 'h'
lw $s1, 0($t0) # Valor de 'h'

# C�lculos
subi $t0, $s1, 5 # t0 = h - 5
add $a0, $s0, $t0 # a0 = g + (h - 5)

# Exibe resultado
li $v0, 1
syscall

# Finaliza programa
li $v0, 10
syscall


