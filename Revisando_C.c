//Bibliotecas
#include <stdio.h>
#include <stdlib.h>


//===Variáveis===
int number =10; //%d =Formato Decimal)
unsigned int number2 =1; //Numeros não negativos
float numracional =35.7; //%f =Números também racionais
char caracter = 'c'; //%c=Caracteres

unsigned int modtest = 0;
//Igualei um valor qualquer as variaveis, caso não poderia ter lixo


//===Código Principal===
int main() //int argc, char *argv[]
{
//===Qual modo iremos ver
modos:
printf("Digite o valor do modo que deseja ver? (1)Imprimir_Variaveis - (2)logica \n");
scanf("%d", &modtest);

if(modtest == 1)
{
    goto imprimindo;
}

else{
    goto condition;
}


imprimindo:
    {
    printf("Digite um number positivo: "); //Imprime na tela
    scanf("%d", &number2); //Lê o número //&=Endereço
    printf("\nSeu number foi: %d - A variable foi \"unsigned int\", representada como %%d \n \n", number2);
    getchar(); //limpa o buffer do teclado

    printf("Digite UM caracter: "); //Imprime na tela
    scanf("%c", &caracter); //Lê o número //&=Endereço
    printf("Seu caracter foi: %c - A variable foi \"char\", representada como %%c \n \n", caracter);
    getchar(); //limpa o buffer do teclado

    printf("Digite um number inteiro: "); //Imprime na tela
    scanf("%d", &number); //Lê o número //&=Endereço
    printf("Seu caracter foi: %d - A variable foi \"int\", representada como %%d \n \n", number);
    getchar(); //limpa o buffer do teclado

    printf("Digite um number com ponto flutuante: "); //Imprime na tela
    scanf("%f", &numracional); //Lê o número //&=Endereço
    printf("Seu caracter foi: %f - A variable foi \"float\", representada como %%f \n \n", numracional);
    getchar(); //limpa o buffer do teclado

    printf("===Pronto===\n\nObs:Quando adicionamos no code um \& antes de uma variable estamos nos referindo ao seu addres.");
return(0);
goto modos; /* Cria um loop */
    }

condition:
    {
char valor1 = 1;
char valor2 = 2;
char valor3 = 3;
char valor4 = 1;

    if (valor1 > valor2 && valor1 < valor3)
    {
       printf("Condition verdadeira");
    }

    if (valor3 == valor4 || valor4 == valor1)
    {
        printf("Condition verdadeira2");
    }

    else
    {
        printf("Mentira");
    }

    }

}
