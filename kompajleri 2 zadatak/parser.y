%{
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

void yyerror(const char* str);

%}


%union{
int vr_int;
char* vr_string;
double vr_double;
bool vr_bool;
char* id;
}

%start S

%token TOKEN_INT
%token TOKEN_STRING
%token TOKEN_DOUBLE
%token TOKEN_BOOL
%token<vr_int> TOKEN_VRIJEDNOST_INT
%token<vr_string> TOKEN_VRIJEDNOST_STRING
%token<vr_double> TOKEN_VRIJEDNOST_DOUBLE
%token<vr_bool> TOKEN_VRIJEDNOST_BOOL

%token TOKEN_NIJE
%token TOKEN_PUTA
%token TOKEN_PODIJELJENO
%token TOKEN_MOD
%token TOKEN_PLUS
%token TOKEN_MINUS
%token TOKEN_MANJE
%token TOKEN_MANJE_JEDNAKO
%token TOKEN_VECE
%token TOKEN_VECE_JEDNAKO
%token TOKEN_JE_JEDNAKO
%token TOKEN_NIJE_JEDNAKO
%token TOKEN_I
%token TOKEN_ILI
%token TOKEN_JEDNAKO

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
%token<id> TOKEN_ID

%left TOKEN_PLUS TOKEN_MINUS TOKEN_PUTA TOKEN_PODIJELJENO TOKEN_MOD TOKEN_I TOKEN_ILI

%type <vr_int>izraz_int
%type <vr_int>status_int

%type <vr_string>izraz_string
%type <vr_string>status_string

%type <vr_bool>izraz_bool
%type <vr_bool>status_bool

%type <vr_double>izraz_double
%type <vr_double>status_double

%%

S:
status_int          {}
| S status_string   {}
| S status_bool     {}
| S status_double   {}
;

status_int:
izraz_int TOKEN_TACKA_ZAREZ {}
| TOKEN_ID TOKEN_JEDNAKO izraz_int TOKEN_TACKA_ZAREZ {}
;

status_string:
izraz_string TOKEN_TACKA_ZAREZ {}
| TOKEN_ID TOKEN_JEDNAKO izraz_string TOKEN_TACKA_ZAREZ {}
;

status_bool:
izraz_bool TOKEN_TACKA_ZAREZ {}
| TOKEN_ID TOKEN_JEDNAKO izraz_bool TOKEN_TACKA_ZAREZ {}
;

status_double:
izraz_double TOKEN_TACKA_ZAREZ {}
| TOKEN_ID TOKEN_JEDNAKO izraz_double TOKEN_TACKA_ZAREZ {}
;

izraz_int:
izraz_int TOKEN_PLUS izraz_int {$$=$1+$3;}
| izraz_int TOKEN_MINUS izraz_int {$$=$1-$3;}
| izraz_int TOKEN_PUTA izraz_int {$$=$1*$3;}
| izraz_int TOKEN_PODIJELJENO izraz_int {$$=$1/$3;}
| izraz_int TOKEN_MOD izraz_int {$$=$1%$3;}
| izraz_int TOKEN_I izraz_int {$$=$1&&$3;}
| izraz_int TOKEN_ILI izraz_int {$$=$1||$3;}
| TOKEN_OTVORENA_ZAGRADA izraz_int TOKEN_ZATVORENA_ZAGRADA {$$=$2;}
| TOKEN_VRIJEDNOST_INT {$$=$1;}
;

izraz_double:
izraz_double TOKEN_PLUS izraz_double {$$=$1+$3;}
| izraz_double TOKEN_MINUS izraz_double {$$=$1-$3;}
| izraz_double TOKEN_PUTA izraz_double {$$=$1*$3;}
| izraz_double TOKEN_PODIJELJENO izraz_double {$$=$1/$3;}
| izraz_double TOKEN_I izraz_double {$$=$1&&$3;}
| izraz_double TOKEN_ILI izraz_double {$$=$1||$3;}
| TOKEN_OTVORENA_ZAGRADA izraz_double TOKEN_ZATVORENA_ZAGRADA {$$=$2;}
| TOKEN_VRIJEDNOST_DOUBLE {$$=$1;}
;

izraz_bool:
izraz_bool TOKEN_ILI izraz_bool {$$=$1||$3;}
| izraz_bool TOKEN_I izraz_bool {$$=$1&&$3;}
| TOKEN_VRIJEDNOST_BOOL {$$=$1;}
;

izraz_string:
TOKEN_VRIJEDNOST_STRING {$$=$1;}
;
%%

void yyerror(const char* str){
    printf("%s", str);
}


