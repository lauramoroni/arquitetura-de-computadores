## Lista 1.1

### Questão 3
Crie um programa que defina um vetor de 5 palavras associado à etiqueta vector que comece no endereço 0x10000000 e que contenha os valores 10,11,12,13,14. Certifique-se que o vetor é armazenado corretamente na memória. Dica: para especificar o endereço de início, escreva o valor desejado logo após a diretiva .data.

### Questão 5
Escrever um programa em assembly com 4 variáveis (n1, n2, n3 e n4) e teste no MARS. Leia as 3 primeiras variáveis. Faça um somatório delas. Teste se o valor é maior ou igual a 21. Se for, imprima “O valor X atingiu o esperado com 3 valores” (onde X é o seu resultado). Caso contrário, leia a 4a. variável e some ao resultado anterior e faça um novo teste: Teste se o somatório é maior ou igual a 24. Se for imprima “O valor X atingiu a meta com 4 valores”. Senão imprima “Não foi dessa vez. O valor X está abaixo do esperado”. Leitura e escrita das variáveis devem ser feita com LW e SW.

### Questão 6
Escreva um programa em assembly que solicite o nome e a da data de nascimento do usuário (por meio de syscalls) e calcule sua idade. Em seguida escreve o nome do usuário indicando se ele é criança, jovem, adulto ou idoso.
Para classificar o usuário por sua idade utilize os critérios: 0-10 anos criança; de 11-19 anos, jovem; 20-59 anos, adulto; maior ou igual a 60, idoso.

### Questão 7
Escreva um programa em assembly que obtenha dois números inteiros e por meio de laços de repetição implemente um algoritmo que calcule a multiplicação desses números usando apenas somas. No final imprima os números e o resultado da multiplicação entre eles.

## Lista 1.2

### Questão 1
Realize a tradução de C para MIPS. Considere que as variáveis f e g sejam dadas e possam ser consideradas inteiros de 32 bits, conforme declarado em um programa C.
- *a)* f = -g -f;
- *b)* f = g + (-f -5);

### Questão 3
Realize a tradução de C para MIPS. Suponha que as variáveis f, g, h, i e j sejam atribuídas aos registradores $s0, $s1, $s2, $s3 e $s4, respectivamente. Considere que o endereço de base dos arrays A e B estejam nos registradores $s6 e $s7,
respectivamente.
- *a)* f = g + h + B[4];
- *b)* f = g – A[B[4]];


## Lista 1.3