%{
#include<stdio.h>
%}

%%
"int"|"void"|"return"|"float" { printf("KEYWORD: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER: %s\n", yytext); }
[ \t\n]+              ;
.                     ;

%%

int main()
{
    yyin = fopen("sample30.c","r");
    yylex();
    return 0;
}

int yywrap(){ return 1; }