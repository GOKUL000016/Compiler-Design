%{
#include<stdio.h>
%}

%%

[A-Z]+    { printf("Capital word: %s\n", yytext); }

.|\n      ;

%%

int main()
{
    printf("Enter a sentence:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}