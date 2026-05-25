%{
#include <stdio.h>

int line = 1;
%}

%%
^.*\n     { printf("%d %s", line++, yytext); }
.         ;
%%

int main()
{
    FILE *fp;
    fp = fopen("sample23.c", "r");

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