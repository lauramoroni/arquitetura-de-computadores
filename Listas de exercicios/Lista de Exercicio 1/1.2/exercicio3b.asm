.data
g: .word 3
f: .word 0
B: .word 5, 2, 6, 4, 1
A: .word 10, 20, 30

.text
# Carregando variáveis
la $t0, g # Endereço de 'g'
lw $s1, 0($t0) # Valor de 'g'

la $s7, B # Endereço do array 'B'
lw $t1, 16($s7) # Valor de 'B[4]'

la $s6, A # Endereço de array 'A'
sll $t2, $t1, 2 # t2 = t1 << 2 = 2^2 ; o valor de B[4] multiplica por 4
add $s6, $s6, $t2 # Endereço de A[B[4]]
lw $t1, 0($s6) # Valor de A[B[4]]

la $t0, f # Endereço de 'f'
sw $s0, 0($t0) 

# Cálculos
sub $s0, $s1, $t1 # f = g - A[B[4]]

# Exibir resultado
addi $a0, $s0, 0

li $v0, 1
syscall

# Finalizando programa
li $v0, 10
syscall