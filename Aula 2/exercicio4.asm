.data
b: .word
c: .word
d: .word
e: .word

.text
## b + c - (d - e)
## Só usar 5 registradores

# Ler o valor de 'd'

li $v0, 5 # Atribuindo o valor 5 (read_int) para o registrador de chamada v0
syscall

addi $t0, $v0, 0 # Atribuindo o valor lido no registrador t0

# Ler o valor de 'e'

li $v0, 5 # Atribuindo o valor 5 (read_int) para o registrador de chamada v0
syscall

addi $t1, $v0, 0 # Atribuindo o valor lido no registrador t1

# Realizando a operação (d - e)

sub $s0, $t0, $t1 # Atribuindo a s0 a subtração entre t0 e t1

# Ler o valor de 'c'

li $v0, 5 # Atribuindo o valor 5 (read_int) para o registrador de chamada v0
syscall

add $t0, $v0, $zero # Atribuindo o valor lido no registrador t0

# Realizando a operação 'c - (d - e)"

sub $t1, $t0, $s0 # Atribuindo a subtração entre t0 e s0 em t1

# Ler o valor de 'b'

li $v0, 5 # Atribuindo o valor 5 (read_int) para o registrador de chamada v0
syscall

add $t0, $v0, $zero # Atribuindo o valor lido no registrador t0

# Realizando a operação 'b + c - (d - e)'

add $s0, $t0, $t1 # Atribuindo a soma entre t0 e t1 em s0

# Exibir resultado 

add $a0, $s0, 0 # Passando o valor de s0 no registrador de argumento a0

li $v0, 1 # Atribuindo o valor 1 (print_int) para o registrador de chamada v0
syscall

# Finalizando o programa

li $v0, 10 # Atribuindo o valor 10 (exit) para o registrador de chamada v0
syscall



