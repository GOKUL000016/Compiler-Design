%{
#include <stdio.h>
%}

%%
[0-9]+\.[0-9]+      { printf("Float Constant: %s\n", yytext); }
[0-9]+              { printf("Integer Constant: %s\n", yytext); }
\".*\"              { printf("String Constant: %s\n", yytext); }
.                   ;
%%

int main()
{
    FILE *fp;
    fp = fopen("sample20.c", "r");   // ✅ matches experiment 20

    if(fp == NULL)
    {
        printf("File not found\n");
        return 0;
    }

    yyin = fp;
    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}