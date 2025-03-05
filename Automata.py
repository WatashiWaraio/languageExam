# Lenguaje de las cadenas que terminan en b
matriz_automata = {
    "a": [0, 0],
    "b": [1, 1],
}
estados_finalizacion = [1]

estado = 0
cadena = input("Ingrese la Cadena: ")
for c in cadena:
    estado = matriz_automata[c][estado]

if (estado in estados_finalizacion):
    print("Cadena Aceptada")
else:
    print("Cadena No Aceptada")
