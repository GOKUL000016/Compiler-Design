%{
#include <stdio.h>
%}

%%
"<"[^>]+">"    { printf("HTML Tag: %s\n", yytext); }
.|\n           ;
%%

int main()
{
    FILE *fp;
    fp = fopen("sample22.html", "r");   // ✅ matches experiment 22

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