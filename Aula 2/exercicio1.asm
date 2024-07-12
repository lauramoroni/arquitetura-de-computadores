.data
x: .word 0
y: .word 0
msg: .asciiz "A soma X e Y é: "

.text
# Passando o endereço de X e Y para os registradores
la $t0, x
la $t1, y

# Armazenando o valor de t0 e t1 nos registradores s0 (X) e s1 (Y)
lw $s0, 0($t0)
lw $s1, 0($t1)

# Lendo o valor de X
li $v0, 5
syscall

# Atribuir o valor de v0 para s0 (X)
add $s0, $v0, $zero

# Incrementa em 1 o valor de s0 (X) e armazena em s1 (Y)
addi $s1, $s0, 1 

# Somando X e Y
add $t0, $s1, $s0

# Passando o endereço de mensagem para a0
la $a0, msg

# Exibir a msg na tela
li $v0, 4
syscall

# Atribui a a0 o valor da soma e a v0 a chamada de sistema para exibir a soma
add $a0, $t0, $zero 
li $v0, 1
syscall

# Passa a constante 10 (chamada de sistema) para v0, para finalizar o código
li $v0, 10 
syscall