## Quadrado
Escreva um programa em assembly para executar no MARS que desenhe um quadrado na "tela", por meio da ferramenta "Bitmap Display" disponível no menu "Tools" do MARS. Seu programa deve receber do usuário o valor do lado do quadrado e a cor que deve ser escolhida entre 3 opções (vermelho, azul ou verde). Em seguida deve desenhar no display usando a instrução SW.

Dica: utilize instruções de desvio para implementar laços

## String
Implementar na linguagem Assembly do MIPS uma pequena biblioteca string com funções de manipulação de caracteres. 
- Implemente todas as funções em um mesmo arquivo que deverá ser salvo como “string.asm”. Essas funções serão testadas por um outro código (main.asm) que deverá incluir a biblioteca de funções usando a diretiva .include “string.asm”.
- Funções implementadas: 
    - strlen()
    - strcmp()
    - strcat()
    - strncat ()
    - strncpy ()