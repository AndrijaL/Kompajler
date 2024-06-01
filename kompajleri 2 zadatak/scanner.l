%{
    #include <string.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <stdbool.h>
    #include "parser.tab.c"


    int brojac =1;
    int greske =0;
%}

%x komJedna
%x ViseKom

%%

"\n"        {brojac++;}
[ \t\r\n]   {}





\"[^\n\"]*\"    {}

"+"         {return TOKEN_PLUS;}
"-"         {return TOKEN_MINUS;}
"*"         {return TOKEN_PUTA;}
"/"         {return TOKEN_PODIJELJENO;}
"%"         {return TOKEN_MOD;}
"<"         {return TOKEN_MANJE;}
"<="        {return TOKEN_MANJE_JEDNAKO;}
">"         {return TOKEN_VECE;}
">="        {return TOKEN_VECE_JEDNAKO;}
"="         {return TOKEN_JEDNAKO;}
"=="        {return TOKEN_JE_JEDNAKO;}
"!="        {return TOKEN_NIJE_JEDNAKO;}
"&&"        {return TOKEN_I;}
"||"        {return TOKEN_ILI;}
"!"         {return TOKEN_NIJE;}
";"         {return TOKEN_TACKA_ZAREZ;}
","         {return TOKEN_ZAREZ;}
"."         {return TOKEN_TACKA;}
"("         {return TOKEN_OTVORENA_ZAGRADA;}
")"         {return TOKEN_ZATVORENA_ZAGRADA;}


"//"    {  
            BEGIN(komJedna);
        }

"/*"    {   
            
            BEGIN(ViseKom);
        }



"INT"       {return TOKEN_INT;}
"STRING"    {return TOKEN_STRING;}
"BOOL"      {return TOKEN_BOOL;}
"DOUBLE"    {return TOKEN_DOUBLE;}
"IF"        {return TOKEN_IF;}
"LET"       {return TOKEN_LET;}
"IN"        {return TOKEN_IN;}
"SKIP"      {return TOKEN_SKIP;}
"ELSE"      {return TOKEN_ELSE;}
"THEN"      {return TOKEN_THEN;}
"WHILE"     {return TOKEN_WHILE;}
"DO"        {return TOKEN_DO;}
"READ"      {return TOKEN_READ;}
"WRITE"     {return TOKEN_WRITE;}
"FOR"       {return TOKEN_FOR;}
"RETURN"    {return TOKEN_RETURN;}
"BREAK"     {return TOKEN_BREAK;}
"END"       {return TOKEN_END;}

([0-9]*)                                    {
                                            int broj = atoi(yytext);
                                            yylval.vr_int = broj;
                                            return TOKEN_VRIJEDNOST_INT;}

(0x|0X)[0-9A-Fa-f]*                         {
                                            int broj = strtol(yytext+2, NULL, 16);
                                            yylval.vr_int = broj;
                                            return TOKEN_VRIJEDNOST_INT;}

[a-zA-Z_][a-zA-Z0-9_]{0,29}                 {return TOKEN_VRIJEDNOST_STRING;}
[0-9]+\.[0-9]*                              {
                                                double broj = atof(yytext);
                                                yylval.vr_double = broj;                                         
                                                return TOKEN_VRIJEDNOST_DOUBLE;}
([0-9]*)\.[0-9]*[eE][+-]?[0-9]?             {
                                                double broj = atof(yytext);
                                                yylval.vr_double = broj;
                                                return TOKEN_VRIJEDNOST_DOUBLE;}

<komJedna>{

"\n"    {
           
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






