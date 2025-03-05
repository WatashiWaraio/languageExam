%{
#include <stdio.h>
#include <stdlib.h>

int contador = 0;  
int lambda = 0;
int noLambda = 0;
%}

ID         [a-zA-Z_][a-zA-Z0-9]*
PARAMS     {ID}([ \t]*,[ \t]*{ID})*
LAMBDA     [a-zA-Z_][a-zA-Z0-9]*[ \t]*=[ \t]*lambda[ \t]*\(?.*?\)?[ \t]*:[ \t]*.+

%%
^{LAMBDA}$      { lambda++; printf("Acepta\n"); }
^.+$            { noLambda++; printf("No Acepta\n"); }
\n              { contador++; }
%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: %s <archivo>\n", argv[0]);
        return 1;
    }

    FILE *archivo = fopen(argv[1], "r");
    if (!archivo) {
        printf("Error al abrir el archivo: %s\n", argv[1]);
        return 1;
    }

    yyin = archivo;
    yylex();  

    fclose(archivo);
    
    return 0;
}
