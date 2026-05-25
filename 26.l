%{
#include<stdio.h>
#include<string.h>

int isValid(char str[])
{
    int i, at = 0, dot = 0;

    for(i = 0; str[i] != '\0'; i++)
    {
        if(str[i] == '@') at++;
        if(str[i] == '.') dot++;
    }

    if(at == 1 && dot >= 1)
        return 1;
    else
        return 0;
}
%}

%%

[a-zA-Z0-9@._]+   {
                    if(isValid(yytext))
                        printf("Valid Email\n");
                    else
                        printf("Invalid Email\n");
                 }

.|\n ;

%%

int main()
{
    printf("Enter email:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}