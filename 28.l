%{
#include<stdio.h>
#include<string.h>

int isValid(char num[])
{
    int len = strlen(num);

    if(len != 10)
        return 0;

    if(num[0] < '6' || num[0] > '9')
        return 0;

    for(int i = 0; i < 10; i++)
    {
        if(num[i] < '0' || num[i] > '9')
            return 0;
    }

    return 1;
}
%}

%%

[0-9]+   {
            if(isValid(yytext))
                printf("Valid Mobile Number\n");
            else
                printf("Invalid Mobile Number\n");
         }

.|\n ;

%%

int main()
{
    printf("Enter mobile number:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}