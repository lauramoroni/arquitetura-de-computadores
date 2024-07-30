.data
g: .word 2
h: .word 7
f: .word 0
B: .word 5, 2, 6, 1, 0

.text
# Carregando variáveis
la $t0, g # Endereço de 'g'
lw $s1, 0($t0) # Valor de 'g'

la $t0, h # Endereço de 'h'
lw $s2, 0($t0) # Valor de 'h'

la $s7, B # Endereço do array 'B'
lw $t1, 16($s7) # Valor de 'B[4]'

la $t0, f # Endereço de 'f'
sw $s0, 0($t0) 

# Cálculos
add $t0, $s2, $t7 # t0 = h + B[4]
add $s0, $s1, $t0 # s0 = g + (h + B[4])

# Exibir resultado
addi $a0, $s0, 0

li $v0, 1
syscall

# Finalizando programa
li $v0, 10
syscall