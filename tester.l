%{
    #include <string.h>
    #include <stdio.h>
    #include <stdlib.h>

    int brojac =1;
%}

%x komJedna
%x ViseKom

%%

"\n"        {brojac++;}
[ \t\r\n]   {}


([0-9]*)                                  {int broj = atoi(yytext); printf("dekadno -> %d", broj);}
(0x|0X)[0-9A-Fa-f]*                         {int broj = strtol(yytext+2, NULL, 16); printf("heksadecimalno -> %d", broj);}


\"[^\n\"]*\"    {printf("string -> %s", yytext);}

"+"         {printf(" + ");}
"-"         {printf(" - ");}
"*"         {printf(" * ");}
"/"         {printf(" / ");}
"%"         {printf(" % ");}
"<"         {printf(" < ");}
"<="        {printf(" <= ");}
">"         {printf(" > ");}
">="        {printf(" >= ");}
"="         {printf(" = ");}
"=="        {printf(" == ");}
"!="        {printf(" != ");}
"&&"        {printf(" && ");}
"||"        {printf(" || ");}
"!"         {printf(" ! ");}
";"         {
                printf(" ; ");
                printf("\n");

            }
","         {printf(" , ");}
"."         {printf(" . ");}
"("         {printf(" ( ");}
")"         {printf(" ) ");}


"//"    {  
            BEGIN(komJedna);
        }

"/*"    {   
            printf("Pocetak viselinijskog komentara na liniji -> %d\n", brojac);
            BEGIN(ViseKom);
        }



"INT"       {printf("%s\n", yytext);}
"STRING"    {printf("%s\n", yytext);}
"BOOL"      {printf("%s\n", yytext);}
"DOUBLE"    {printf("%s\n", yytext);}
"IF"        {printf("%s\n", yytext);}
"LET"       {printf("%s\n", yytext);}
"IN"        {printf("%s\n", yytext);}
"SKIP"      {printf("%s\n", yytext);}
"ELSE"      {printf("%s\n", yytext);}
"THEN"      {printf("%s\n", yytext);}
"WHILE"     {printf("%s\n", yytext);}
"DO"        {printf("%s\n", yytext);}
"READ"      {printf("%s\n", yytext);}
"WRITE"     {printf("%s\n", yytext);}
"FOR"       {printf("%s\n", yytext);}
"RETURN"    {printf("%s\n", yytext);}
"BREAK"     {printf("%s\n", yytext);}
"END"       {printf("%s\n", yytext);}


[a-zA-Z_][a-zA-Z0-9_]{0,29}                 {printf("identifikator-> %s", yytext);}
[0-9]+\.[0-9]*                              {printf("double -> %s", yytext);}
([0-9]*)\.[0-9]*[eE][+-]?[0-9]?         {printf("eksponencijalni double -> %s", yytext);}

<komJedna>{

"\n"    {
            printf("zakomentarisana linija broj -> %d\n", brojac);
            brojac++;
            BEGIN(INITIAL);
        }
"//"    {
            printf("Pogresan ulaz, nije dozvoljeno ugnjezdavanje komentara na liniji -> %d\n", brojac);
        }
.      {} 
}

<ViseKom>{


"*/"            {
                    printf("Kraj viselinijskog komentara na liniji -> %d\n", brojac);
                    BEGIN(INITIAL);
                }
"\n"            { 
                    brojac++;
                }
"/*"            {
                    printf("Pogresan ulaz, nije dozvoljeno ugnjezdavanje komentara -> \n");
                }
.               {}

}

\"[^\n\"]*                                  {printf("Pogresan ulaz, nezatvoren string na liniji -> %d\n", brojac);}
(0|([1-9][0-9]*))(E|e)[+-]?[0-9]*           {printf("Pogresan ulaz, pogresno upisan double na liniji -> %d\n", brojac);}
\.[0-9]+                                    {printf("Pogresan ulaz, pogresno upisan double na liniji -> %d\n", brojac);}
[a-zA-Z][0-9a-zA-Z\_]*                      {if(yyleng>31){printf("Pogresan ulaz, ime duze od dozvoljenog na liniji -> %d\n", brojac);}}
.                                           {printf("Pogresan ulaz, neobradjeni izraz na liniji -> %d\n", brojac);}

%%

int main(){
    yylex();
    return 0;
}


