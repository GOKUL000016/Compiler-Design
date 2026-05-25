%{
#include <stdio.h>

int macros = 0;
int headers = 0;
%}

%%
"#define"          { macros++; }
"#include"[ ]*"<".*">"   { headers++; }
.|\n              ;
%%

int main()
{
    FILE *fp;
    fp = fopen("sample21.c", "r");   // ✅ matches experiment 21

    if(fp == NULL)
    {
        printf("File not found\n");
        return 0;
    }

    yyin = fp;
    yylex();

    printf("Number of Macros = %d\n", macros);
    printf("Number of Header files = %d\n", headers);

    return 0;
}

int yywrap()
{
    return 1;
}