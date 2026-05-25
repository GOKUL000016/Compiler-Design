%{
#include<stdio.h>
int count = 0;
FILE *out;
%}

%x COMMENT

%%

"//".*        { count++; }   

"/*"          { BEGIN(COMMENT); count++; }

<COMMENT>"*/" { BEGIN(INITIAL); }

<COMMENT>.|\n  ;

.|\n          { fputc(yytext[0], out); }

%%

int main()
{
    FILE *fp = fopen("sample24.c", "r");   // ✅ changed here
    out = fopen("output.c", "w");

    if(fp == NULL || out == NULL)
    {
        printf("File error\n");
        return 0;
    }

    yyin = fp;
    yylex();

    printf("Number of comment lines: %d\n", count);

    fclose(fp);
    fclose(out);
    return 0;
}

int yywrap()
{
    return 1;
}