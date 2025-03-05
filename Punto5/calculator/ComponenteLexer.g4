lexer grammar CommonLexerRules; // note "lexer grammar"
ID : [a-zA-Z]+ ; // match identifiers
INT : [0-9]+ ; // match integers
NEWLINE:'\r'? '\n' ; // return newlines to parser (end-statement signal)
WS : [ \t]+ -> skip ; // toss out whitespace
num: [-]?[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?;
COMPLEJO: [i]?|{num}?{parteI}+[ ]*[+-][ ]*{num}|{num}[ ]*[+-][ ]*{num}?[i]|{num}[i];
