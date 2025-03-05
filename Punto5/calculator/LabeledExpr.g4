grammar LabeledExpr;
import ComponenteLexer;

prog: stat+ ;

stat:   expr NEWLINE        # printExpr
    |   ID '=' expr NEWLINE # assign
    |   NEWLINE             # blank
    ;

expr:   'SQR_' expr           #Sqrt
    |   'sin' '(' expr ')'              #sin 
    |   'cos' '(' expr ')'              #cos
    |   'tan' '(' expr ')'              #tan
    |   'log3' '(' expr ')'           #log3
    |   expr '^' expr               #Pow 
    |   expr op=('*'|'/') expr      # MulDiv
    |   expr op=('+'|'-') expr      # AddSub
    |   INT                         # int
    |   ID                          # id
    |   COMPLEJO                    #complejo
    |   '(' expr ')'                # parens
    ;

POW : '^' ;
MUL : '*' ; // assigns token name to '*' used above in grammar
DIV : '/' ;
ADD : '+' ;
SUB : '-' ;
