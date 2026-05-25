%{
#include <stdio.h>

int words = 0;
int lines = 0;
int chars = 0;
%}

%%
\n          { lines++; chars++; }
[ \t]+      { chars += yyleng; }
[^ \t\n]+   { words++; chars += yyleng; }
%%

int main()
{
    FILE *fp;
    fp = fopen("sample.c", "r");   // your input file

    if(fp == NULL)
    {
        printf("File not found\n");
        return 0;
    }

    yyin = fp;
    yylex();

    printf("Number of characters = %d\n", chars);
    printf("Number of words = %d\n", words);
    printf("Number of lines = %d\n", lines);

    return 0;
}

int yywrap()
{
    return 1;
}