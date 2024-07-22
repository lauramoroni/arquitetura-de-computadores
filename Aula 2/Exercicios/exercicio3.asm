.data
a: .word
b: .word
c: .word
d: .word
msg: .asciiz "a = (b+c) - (c+d) = "

.text
# Lendo o valor de 'b'
li $v0, 5 # Atribuindo o valor 5 (read_int) ao registrador de chamada v0
syscall 

add $t0, $v0, $zero # Passando o valor de 'b' para o registrador t0

# Lendo o valor de 'c'
li $v0, 5 # Atribuindo o valor 5 (read_int) ao registrador de chamada v0
syscall 

add $t1, $v0, $zero # Passando o valor de 'c' para o registrador t1

# Lendo o valor de 'd'
li $v0, 5 # Atribuindo o valor 5 (read_int) ao registrador de chamada v0
syscall 

add $t2, $v0, $zero # Passando o valor de 'c' para o registrador t2

# (b + c)
add $s0, $t0, $t1 # Atribuindo a soma de 'b' e 'c' no registrador s0

# (c + d)
add $s1, $t1, $t2 # Atribuindo a soma de 'c' e 'd' no registrador s1

# (b + c) - (c + d)
sub $s2, $s0, $s1 # Atribuindo a subtração de 'b + c' e 'c + d' no registrador s2

## Exibir resultado

# Exibir mensagem
la $a0, msg # Passando o endereço de 'msg' para o registrador de argumento a0

li $v0, 4 # Atribuindo o valor 4 no registrador de chamada v0
syscall

# Exibir valor
add $a0, $s2, $zero # Passando o endereço de 'msg' para o registrador de argumento a0

li $v0, 1 # Atribuindo o valor 4 no registrador de chamada v0
syscall

# Finalizar o programa
li $v0, 10 # Atribuindo o valor 10 no registrador de chamada v0
syscall

