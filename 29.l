%{
#include<stdio.h>
%}

%%
"#include"[^\n]*      { printf("HEADER FILE: %s\n", yytext); }
"int"|"void"|"return" { printf("KEYWORD: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER: %s\n", yytext); }
[0-9]+                { printf("NUMBER: %s\n", yytext); }
\".*\"                { printf("STRING: %s\n", yytext); }
[+\-*/=]              { printf("OPERATOR: %s\n", yytext); }
[{}();,]              { printf("SPECIAL SYMBOL: %s\n", yytext); }
[ \t\n]+              ;
.                     ;

%%

int main()
{
    yyin = fopen("sample29.c","r");
    yylex();
    return 0;
}

int yywrap(){ return 1; }