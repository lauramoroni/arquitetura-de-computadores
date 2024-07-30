.data
g: .word 4 # Valor teste
h: .word 8 # Valor teste

.text
# Carrega variáveis
la $t0, g # Endereço de 'g'
lw $s0, 0($t0) # Valor de 'g'
la $t0, h # Endereço de 'h'
lw $s1, 0($t0) # Valor de 'h'

# Cálculo
sub $a0, $s1, $s0 # a0 = g - h

# Exibe resultado
li $v0, 1
syscall

# Finaliza programa
li $v0, 10
syscall


