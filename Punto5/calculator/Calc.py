import sys
from antlr4 import *
from LabeledExprVisitor import LabeledExprVisitor
from LabeledExprLexer import LabeledExprLexer
from LabeledExprParser import LabeledExprParser
from EvalVisitor import Evalvisitor

def main():
    input_file = sys.argv[1] if len(sys.argv) > 1 else None
    visitor = Evalvisitor()  # Instancia del visitor

    if input_file:
        with open(input_file, 'r') as file:
            lines = file.readlines()
    else:
        lines = []
        try:
            while True:
                line = input().strip()
                if line:  # Evita procesar líneas vacías
                    lines.append(line)
        except EOFError:
            pass  # Captura Ctrl+D o Ctrl+Z para salir

    for line in lines:
        input_stream = InputStream(line)
        lexer = LabeledExprLexer(input_stream)
        token_stream = CommonTokenStream(lexer)
        parser = LabeledExprParser(token_stream)
        arbol = parser.expr()  # Evaluar cada línea como una expresión individual

        result = visitor.visit(arbol)  # Evaluar con el visitor
        if result is not None:
            print("Resultado:", result)

if __name__ == "__main__":
    main()
