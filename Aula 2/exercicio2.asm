.data
msg: .asciiz "(b - 3) + c = "
a: .word 0
b: .word 12
c: .word 7

.text
## a = (b - 3) + c

la $t0, a # Passando o endereço da variável 'a' no registrador t0

la $t1, b # Passando o endereço da variável 'b' no registrador t1

la $t2, c # Passando o endereço da variável 'c' no registrador t2

lw $s0, 0($t0) # Armazenando o valor de 'a' no registrador s0

lw $s1, 0($t1) # Armazenando o valor de 'b' no registrador s1

lw $s2, 0($t2) # Armazenando o valor de 'c' no registrador s2

# (b - 3)
subi $t1, $s1, 3

# (b - 3) + c
add $s0, $t1, $s2

# Exibir resultado

# Exibir mensagem

la $a0, msg # Passando o endereço de 'msg' para o registrador a0

li $v0, 4 # Atribuindo o valor 4 (print_string) para o registrador de chamada de sistema v0
syscall

# Exibir valor

add $a0, $s0, $zero # Atribuindo o valor de 'a' para o registrador a0

li $v0, 1 # Atribuindo o valor 1 (print_int) para o registrador de chamada de sistema v0
syscall

# Finalizar o programa

li $v0, 10 # Atribuindo o valor 10 (exit) para o registrador de chamada de sistema v0
syscall