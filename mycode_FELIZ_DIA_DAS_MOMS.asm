ORG 100h  
JMP MAIN

;Criando as mensagens
Feliz_dia_das_moms db 'Feliz dia das m',198,'es, mam',198,'e',033,033,033,010,013, 'E nesse dia t',198,'o especial, que mesmo tendo mil dias n',198,'o seriam suficientes para', 010,013,'demonstrar o que a senhora significa para mim, gostaria de fazer um jogo, o que acha',063,010, 010, 013, '$'
melhor_mom db 'Qual ', 130, ' o primeiro nome da melhor m',198,'e do mundo',063, '$'
profissoes db 'Qual ',130, ' a m',198,'e que tem mais de mil profiss',228,'es', 063, '$'
mom db 'As ',163,'nicas 3 letras quem pode descrever o que a senhora ',130,' para mim','$'
day db 'em que dia nasceu a melhor m',198,'e do mundo',063, '$'
senha_errada db 'SENHA INCORRETA $' 
senha_correta db 'Acertou!!!',002,010,010,013,'$' 
;msg_senha db 'Qual a sua senha? $'
Amo db 010,013, 'Te amo mam',198,'e',010,013, 'muito obrigado por tudo',033,010,013,'Feliz dia das m',198,'es',033,007,'$' 
;dica db 010,013, 'Dica: Tem 3 letras', 010, 010, 013,'$'
nova_linha db 010, 013, '$'
estrela db '*$' 
digitado db 'Sua senha digitada foi: $'  
minha_senha1 db 'Rosana$' 
minha_senha3 db 'mae$' 
senha_dia    db '13$'
tente_novamente db 010, 013, 014, 'Tente outra vez', 014, ': $' 

;Criando variaveis de memoria
Vsenha db 1600 dup('$') ;Colocando $, para ter no final 
Vsenha3 db 1600 dup('$')                      
                              

MAIN: 
mov ah, 9
lea dx, Feliz_dia_das_moms
int 21h              
call line

;Mensagem da senha
mov ah, 9
lea dx, melhor_mom ;igual a "mov dx,offset senha" 
int 21h              
call line

;Inicializando os ponteiro no inicio
XOR si, si 
XOR di, di 

mov cx, 3; Contagem de erros

;Armazenando a informacao de senha
keys:  
mov ah, 8 ;Lendo caracter sem ECO
int 21h ;Salva em AL

CMP al, 013 ;Verifica se foi o ENTER
je  sua_senha  

;Armazenando o valor digitado
mov Vsenha[si], al ;Tambem podia ser Vsenha+[si]
inc si ;No outro ciclo ira salvar uma posicion a frente


mov ah, 9
lea dx, estrela ;Adiciona asterisco por digito
int 21h 

;Fica em loop ate receber ENTER       
jmp keys

       
sua_senha:
call line
call line 

mov ah, 9
lea dx, digitado ;Mensagem
int 21h

mov Vsenha[si], '$' ;Colocando um asterisco no final

mov ah, 9
lea dx, Vsenha ;Printa a senha digitada
int 21h  

;Preparando as variaveis para poder comparar
lea si, Vsenha ;Senha digitada
lea di, minha_senha1 ;Senha correta

;Comparacao e redirecionamento
Comparando:
mov al, [si] ;Senha digitada
mov bl, [di] ;Senha correta


cmp al, bl
je ta_acertando ;ta igual, bora conferindo 
jmp tentativa

ta_acertando:
inc si
inc di

cmp al, '$' ;Verifica se chegou no final
je correta
jmp comparando

;Comparando para saber se esta certa
Correta:
call line

mov ah, 9
lea dx, senha_correta
int 21h 
jmp idade
.exit



tentativa: 
mov ah, 9 
lea dx, tente_novamente
int 21h

dec cx ;Diminui uma tentativa
cmp cx, 0
je errada 

;Colocando os ponteiros no inicio
XOR si, si 
XOR di, di

jmp keys

errada:
call line

mov ah, 9 
lea dx, senha_errada
int 21h 
.exit

  
  
idade:  
;Mensagem da senha
mov ah, 9
lea dx, day ;igual a "mov dx,offset senha" 
int 21h              
call line

;Inicializando os ponteiro no inicio
XOR si, si 
XOR di, di 

mov cx, 3; Contagem de erros

;Armazenando a informacao de senha
keys4:  
mov ah, 8 ;Lendo caracter sem ECO
int 21h ;Salva em AL

CMP al, 013 ;Verifica se foi o ENTER
je  sua_senha4  

;Armazenando o valor digitado
mov Vsenha[si], al ;Tambem podia ser Vsenha+[si]
inc si ;No outro ciclo ira salvar uma posicion a frente


mov ah, 9
lea dx, estrela ;Adiciona asterisco por digito
int 21h 

;Fica em loop ate receber ENTER       
jmp keys4

       
sua_senha4:
call line
call line 

mov ah, 9
lea dx, digitado ;Mensagem
int 21h

mov Vsenha[si], '$' ;Colocando um asterisco no final

mov ah, 9
lea dx, Vsenha ;Printa a senha digitada
int 21h  

;Preparando as variaveis para poder comparar
lea si, Vsenha ;Senha digitada
lea di, senha_dia ;Senha correta

;Comparacao e redirecionamento
Comparando4:
mov al, [si] ;Senha digitada
mov bl, [di] ;Senha correta


cmp al, bl
je ta_acertando4 ;ta igual, bora conferindo 
jmp tentativa4

ta_acertando4:
inc si
inc di

cmp al, '$' ;Verifica se chegou no final
je correta4
jmp comparando4

;Comparando para saber se esta certa
Correta4:
call line

mov ah, 9
lea dx, senha_correta
int 21h 
jmp segunda
.exit



tentativa4: 
mov ah, 9 
lea dx, tente_novamente
int 21h

dec cx ;Diminui uma tentativa
cmp cx, 0
je errada4 

;Colocando os ponteiros no inicio
XOR si, si 
XOR di, di

jmp keys4

errada4:
call line

mov ah, 9 
lea dx, senha_errada
int 21h 
.exit  
  
  
  
  

segunda:
;Mensagem da senha
mov ah, 9
lea dx, profissoes ;igual a "mov dx,offset senha" 
int 21h              
call line

;Inicializando os ponteiro no inicio
XOR si, si 
XOR di, di 

mov cx, 3; Contagem de erros

;Armazenando a informacao de senha
keys2:  
mov ah, 8 ;Lendo caracter sem ECO
int 21h ;Salva em AL

CMP al, 013 ;Verifica se foi o ENTER
je  sua_senha2  

;Armazenando o valor digitado
mov Vsenha[si], al ;Tambem podia ser Vsenha+[si]
inc si ;No outro ciclo ira salvar uma posicion a frente


mov ah, 9
lea dx, estrela ;Adiciona asterisco por digito
int 21h 

;Fica em loop ate receber ENTER       
jmp keys2

       
sua_senha2:
call line
call line 

mov ah, 9
lea dx, digitado ;Mensagem
int 21h

mov Vsenha[si], '$' ;Colocando um asterisco no final

mov ah, 9
lea dx, Vsenha ;Printa a senha digitada
int 21h  

;Preparando as variaveis para poder comparar
lea si, Vsenha ;Senha digitada
lea di, minha_senha1 ;Senha correta

;Comparacao e redirecionamento
Comparando2:
mov al, [si] ;Senha digitada
mov bl, [di] ;Senha correta


cmp al, bl
je ta_acertando2 ;ta igual, bora conferindo 
jmp tentativa2

ta_acertando2:
inc si
inc di

cmp al, '$' ;Verifica se chegou no final
je correta2
jmp comparando2

;Comparando para saber se esta certa
Correta2:
call line

mov ah, 9
lea dx, senha_correta
int 21h 
jmp terceira
.exit



tentativa2: 
mov ah, 9 
lea dx, tente_novamente
int 21h

dec cx ;Diminui uma tentativa
cmp cx, 0
je errada2 

;Colocando os ponteiros no inicio
XOR si, si 
XOR di, di

jmp keys2

errada2:
call line

mov ah, 9 
lea dx, senha_errada
int 21h 
.exit

   
   
   
   

terceira:
;Mensagem da senha
mov ah, 9
lea dx, mom ;igual a "mov dx,offset senha" 
int 21h              
call line

;Inicializando os ponteiro no inicio
XOR si, si 
XOR di, di 

mov cx, 3; Contagem de erros

;Armazenando a informacao de senha
keys3:  
mov ah, 8 ;Lendo caracter sem ECO
int 21h ;Salva em AL

CMP al, 013 ;Verifica se foi o ENTER
je  sua_senha3  

;Armazenando o valor digitado
mov Vsenha[si], al ;Tambem podia ser Vsenha+[si]
inc si ;No outro ciclo ira salvar uma posicion a frente


mov ah, 9
lea dx, estrela ;Adiciona asterisco por digito
int 21h 

;Fica em loop ate receber ENTER       
jmp keys3

       
sua_senha3:
call line
call line 

mov ah, 9
lea dx, digitado ;Mensagem
int 21h

mov Vsenha[si], '$' ;Colocando um asterisco no final

mov ah, 9
lea dx, Vsenha ;Printa a senha digitada
int 21h  

;Preparando as variaveis para poder comparar
lea si, Vsenha ;Senha digitada
lea di, minha_senha3 ;Senha correta

;Comparacao e redirecionamento
Comparando3:
mov al, [si] ;Senha digitada
mov bl, [di] ;Senha correta


cmp al, bl
je ta_acertando3 ;ta igual, bora conferindo 
jmp tentativa3

ta_acertando3:
inc si
inc di

cmp al, '$' ;Verifica se chegou no final
je correta3
jmp comparando3

;Comparando para saber se esta certa
Correta3:
call line

mov ah, 9
lea dx, senha_correta
int 21h 
jmp teAmo
.exit



tentativa3: 
mov ah, 9 
lea dx, tente_novamente
int 21h

dec cx ;Diminui uma tentativa
cmp cx, 0
je errada3 

;Colocando os ponteiros no inicio
XOR si, si 
XOR di, di

jmp keys3

errada3:
call line

mov ah, 9 
lea dx, senha_errada
int 21h 
.exit

teAmo:
mov ah, 9
lea dx, Amo
int 21h
.exit





;Funcao chamada
line:
mov ah, 9
lea dx, nova_linha
int 21h
ret
.Exit  