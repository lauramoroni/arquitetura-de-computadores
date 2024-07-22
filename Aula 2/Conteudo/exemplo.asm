.data #segmento das variáveis
msg: .asciiz "hello world"
i: .word 0

.text #segmento do codigo
la $a0, msg #t0 recebe o endereço de msg
li $v0, 4 #print_string
syscall

#ler inteiro
li $v0, 5 #read_int - valor lido em $v0
syscall

#atualizar variavel i
la $t0, i
sw $v0, 0($t0)

# imprimit inteiro
add $a0, $v0, $zero
li $v0, 1 #print int - valor int esta em $a0
syscall

# terminando o programa
li $v0, 10 #exit
syscall