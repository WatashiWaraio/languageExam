from LabeledExprParser import LabeledExprParser
from LabeledExprVisitor import LabeledExprVisitor
import math

class Evalvisitor(LabeledExprVisitor):
    def init(self):
        self.memory={}

    def visitAssign(self, ctx):
        #maneja asignaciones de variables (ejemplo x=10)
        name=ctx.ID().getText() #nombre de la variable
        value=self.visit(ctx.expr()) #evaluar la expresion
        self.memory[name]=value #guardar en memoria
        return value

    def visitPrintExpr(self, ctx):
        """ Evalúa y devuelve la expresión ingresada por el usuario """
        return self.visit(ctx.expr())

    def visitMulDiv(self, ctx):
        """ Maneja multiplicación y división """
        left = self.visit(ctx.expr(0))  # Operando izquierdo
        right = self.visit(ctx.expr(1))  # Operando derecho
        if ctx.op.type == LabeledExprParser.MUL:
            return left * right
        else:
            return left / right  # genera error si se divide por 0

    def visitAddSub(self, ctx):
        """ Maneja suma y resta """
        left = self.visit(ctx.expr(0))
        right = self.visit(ctx.expr(1))
        if ctx.op.type == LabeledExprParser.ADD:
            return left + right
        else:
            return left - right

    def visitParens(self, ctx):
        """ Maneja expresiones entre paréntesis """
        return self.visit(ctx.expr())

    def visitInt(self, ctx):
        """ Convierte un número entero en Python """
        return int(ctx.INT().getText())

    def visitId(self, ctx):
        """ Devuelve el valor de una variable almacenada en memoria """
        name = ctx.ID().getText()
        return self.memory.get(name, 0)  # Retorna 0 si la variable no existe
    
    def visitPow(self,ctx):
        base = self.visit(ctx.expr(0))
        exponent = self.visit(ctx.expr(1))
        return base ** exponent
    
    def visitSqrt(self,ctx):
        value = self.visit(ctx.expr())
        return value ** (1/2)
    
    def visitSin(self,ctx):
        value = self.visit(ctx.expr())
        return math.sin(value)
    
    def visitCos(self,ctx):
        value = self.visit(ctx.expr())
        return math.cos(value)
    
    def visitTan(self,ctx):
        value = self.visit(ctx.expr())
        return math.tan(value)
    
    def visitLog3(self,ctx):
        value = self.visit(ctx.expr())
        return math.log(value,3)

   
