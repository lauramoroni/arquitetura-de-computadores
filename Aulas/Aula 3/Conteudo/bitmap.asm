.data
azul: .word 0x0000FF # Valor em hexadecimal
vermelho: .word 0xFF0000 # Valor em hexadecimal
verde: .word 0x00FF00 # Valor em hexadecimal

.text
li $t0, 0x10010000 # Atribuindo o endereço do display para o registrador t0

la $t1, azul # Passando o endereço da cor azul para t1
lw $s0, 0($t1) # Passando o valor de azul para s0

la $t1, vermelho # Passando o endereço da cor vermeho para t1
lw $s1, 0($t1) # Passando o valor de vermelho para s1

la $t1, verde # Passando o endereço da cor verde para t1
lw $s2, 0($t1) # Passando o valor de verde para s2

# Linha alternada de azul e vermelho

sw $s0, 0($t0) # Pixel azul no endereço base de t0
sw $s1, 4($t0) # Pixel vermelho no endereço base de t0
sw $s0, 8($t0) # Pixel azul no endereço base de t0

# Desenhar um sorriso

sw $s2, 20($t0) # Pixel verde no endereço base de t0 (canto do sorriso)

sw $s2, 88($t0) # Pixel verde no endereço base de t0 (sorriso)
sw $s2, 76($t0) # Pixel verde no endereço base de t0  (olho)
sw $s2, 152($t0) # Pixel verde no endereço base de t0 (sorriso)
sw $s2, 216($t0) # Pixel verde no endereço base de t0  (sorriso)
sw $s2, 204($t0) # Pixel verde no endereço base de t0 (olho)

sw $s2, 276($t0) # Pixel verde no endereço base de t0 (canto do sorriso)

# Linha alternada de azul e vermelho

sw $s1, 256($t0) # Pixel vermelho no endereço base de t0
sw $s0, 260($t0) # Pixel azul no endereço base de t0
sw $s1, 264($t0) # Pixel vermelho no endereço base de t0