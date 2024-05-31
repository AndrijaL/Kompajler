
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TOKEN_INT = 258,
     TOKEN_STRING = 259,
     TOKEN_DOUBLE = 260,
     TOKEN_BOOL = 261,
     TOKEN_VRIJEDNOST_INT = 262,
     TOKEN_VRIJEDNOST_STRING = 263,
     TOKEN_VRIJEDNOST_DOUBLE = 264,
     TOKEN_VRIJEDNOST_BOOL = 265,
     TOKEN_NIJE = 266,
     TOKEN_PUTA = 267,
     TOKEN_PODIJELJENO = 268,
     TOKEN_MOD = 269,
     TOKEN_PLUS = 270,
     TOKEN_MINUS = 271,
     TOKEN_MANJE = 272,
     TOKEN_MANJE_JEDNAKO = 273,
     TOKEN_VECE = 274,
     TOKEN_VECE_JEDNAKO = 275,
     TOKEN_JE_JEDNAKO = 276,
     TOKEN_NIJE_JEDNAKO = 277,
     TOKEN_I = 278,
     TOKEN_ILI = 279,
     TOKEN_JEDNAKO = 280,
     TOKEN_TACKA_ZAREZ = 281,
     TOKEN_ZAREZ = 282,
     TOKEN_TACKA = 283,
     TOKEN_OTVORENA_ZAGRADA = 284,
     TOKEN_ZATVORENA_ZAGRADA = 285,
     TOKEN_IF = 286,
     TOKEN_LET = 287,
     TOKEN_IN = 288,
     TOKEN_SKIP = 289,
     TOKEN_ELSE = 290,
     TOKEN_THEN = 291,
     TOKEN_WHILE = 292,
     TOKEN_DO = 293,
     TOKEN_READ = 294,
     TOKEN_WRITE = 295,
     TOKEN_FOR = 296,
     TOKEN_RETURN = 297,
     TOKEN_BREAK = 298,
     TOKEN_END = 299,
     TOKEN_ID = 300
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 11 "parser.y"

int vr_int;
char* vr_string;
double vr_double;
bool vr_bool;
char* id;



/* Line 1676 of yacc.c  */
#line 107 "parser.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


