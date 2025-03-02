%{
#include <stdio.h>
%}

%option noyywrap

/* Definición de macros */
ID         [a-zA-Z_][a-zA-Z0-9_]*
PARAMS     {ID}([ \t]*,[ \t]*{ID})*
LAMBDA     lambda([ \t]+({PARAMS}))?[ \t]*:[ \t]*.+

%%
^{LAMBDA}$      { printf("Acepta\n"); }
^.*$            { printf("No acepta\n"); }
%%

int main(void) {
    yylex();
    return 0;
}
