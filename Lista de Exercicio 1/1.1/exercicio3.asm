.data 0x10000000
vector: .word 10, 11, 12, 13, 14

.text
la $t0, vector # Passando o endere�o do vetor
lw $s0, 12($t0) # s0 = vector[3] = �ndice 4*3 = valor 13