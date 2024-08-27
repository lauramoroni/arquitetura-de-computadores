# Chamando a biblioteca 'string'
.include "string.asm"

.data
strlen_string: .asciiz "hello world"

strcmp_string1: .asciiz "maria"
strcmp_string2: .asciiz "laura"

strcat_string1: .asciiz "deu "
strcat_string2: .asciiz "certo"

strncat_string1: .asciiz "parede"
strncat_string2: .asciiz "amarela"
strncat_value: .word 4

strncpy_string1: .asciiz "aaabbb"
strncpy_string2: .asciiz "bbbaaa"
strncpy_value: .word 3

.globl main

.text
main: 
	la $a0, strlen_string
	
	# Testando 'strlen'  (resultado deve ser 11)
		jal strlen # Chamando a função 'strlen'
	
		addi $a0, $v0, 0 # Passa o resultado para o registrador de argumento
	
		# Exibindo resultado
		li $v0, 1
		syscall
	
	# Testando 'strcmp' (resultado deve ser 0)
		la $a0, strcmp_string1
		la $a1, strcmp_string2
		
		jal strcmp # Chamando a função 'strcmp'
	
		addi $a0, $v0, 0 # Passa o resultado para o registrador de argumento
	
		# Exibindo resultado
		li $v0, 1
		syscall
		
	# Testando 'strcat' (resultado deve ser 'deu certo')
		la $a0, strcat_string1
		la $a1, strcat_string2
		
		jal strcat # Chamando a função 'strcat'
		
		# Exibindo o resultado
		li $v0, 4
		syscall
		
	# Testando 'strncat' (resultado deve ser 'paredeamar')
		la $a0, strncat_string1
		la $a1, strncat_string2
		la $a2, strncat_value
		lw $a2, 0($a2)
		
		jal strncat
		
		# Exibindo o resultado
		li $v0, 4
		syscall
		
	# Testando 'strncpy' (resultado deve ser 'bbbbbb')
		la $a0, strncpy_string1
		la $a1, strncpy_string2
		la $a2, strncpy_value
		lw $a2, 0($a2)
		
		jal strncpy # Chamando a função 'strncpy'
	
		# Exibindo resultado
		li $v0, 4
		syscall
	
	# Finalizando programa
	li $v0, 10
	syscall
