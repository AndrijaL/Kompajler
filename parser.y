%{
    #include <stdlib.h>
    #include <stdio.h>
    #include <stdbool.h>

%}

%start S

%token TOKEN_INT
%token TOKEN_STRING
%token TOKEN_DOUBLE
%token TOKEN_BOOL
%token TOKEN_PLUS
%token TOKEN_MINUS
%token TOKEN_PUTA
%token TOKEN_PODIJELJENO
%token TOKEN_MOD
%token TOKEN_MANJE
%token TOKEN_MANJE_JEDNAKO
%token TOKEN_VECE
%token TOKEN_VECE_JEDNAKO
%token TOKEN_JEDNAKO
%token TOKEN_JE_JEDNAKO
%token TOKEN_NIJE_JEDNAKO
%token TOKEN_I
%token TOKEN_ILI
%token TOKEN_NIJE
%token TOKEN_TACKA_ZAREZ
%token TOKEN_ZAREZ
%token TOKEN_TACKA
%token TOKEN_OTVORENA_ZAGRADA
%token TOKEN_ZATVORENA_ZAGRADA
%token TOKEN_IF
%token TOKEN_LET
%token TOKEN_IN
%token TOKEN_SKIP
%token TOKEN_ELSE
%token TOKEN_THEN
%token TOKEN_WHILE
%token TOKEN_DO
%token TOKEN_READ
%token TOKEN_WRITE
%token TOKEN_FOR
%token TOKEN_RETURN
%token TOKEN_BREAK
%token TOKEN_END
%token TOKEN_ID
