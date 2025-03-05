# 🚀 Lex

# 📌 ¿Qué es Lex?

<a href="https://es.wikipedia.org/wiki/Lex_(informática)">Mas sobre LEX</a>

Lex es una herramienta que nos ayuda a generar analizadores léxicos, que permiten reconocer patrones en texto y procesarlos de manera eficiente. En este laboratorio, realizaremos varios ejercicios para entender mejor su funcionamiento.


# 🛠️ Requisitos

Lex es un analizador léxico estándar en sistemas UNIX, por lo que es recomendable contar con un entorno basado en UNIX para probar los códigos de manera óptima. 
Aunque existen métodos para utilizarlo en Windows, el uso de UNIX suele ser más eficiente y adecuado para trabajar con Lex. 😊🐧

Para ejecutar los programas, necesitas tener instalados los siguientes paquetes:

- Flex ✅ 

- GCC ✅ (Compilador de c)

🍂 **Nota: LEX esta programado en c, por lo mismo es necesario el compilador GCC 🍂**

### 🌪 Proceso de instalacion 

- Flex ✅ y GCC ✅ 
  
En **Ubuntu** o **Debian** puedes instalarlos con:

```bash
sudo apt update && sudo apt install flex gcc -y
```

Para **macOS** con Homebrew:

```bash
brew install flex gcc
```

 ### 👀 Si necesitas comprobar la instalacion puedes probar el siguiente comando  

```bash
flex --help
```
Debe aparecerte la ayuda disponible en la consola.

Si la instalación no funciona por alguna razón, puedes consultar la documentación oficial o buscar soluciones en comunidades como Reddit o Stack Overflow, 
donde encontrarás ayuda de otros desarrolladores. 🚀🔍 (O incluso puedes utilizar modelos de IA)

# 🚀 ¿Cómo ejecutar los programas?

Para compilar y ejecutar cualquier programa de Lex, sigue estos pasos:

## 1️⃣ Compilar el archivo .l con flex

Flex lee el archivo.l y genera un archivo en C llamado lex.yy.c que contiene el codigo fuente del analizador lexico.

```bash
flex lambda.l
```

## 2️⃣ Compilar el código generado en C

Este comando genera un ejecutable llamado **a.out** el -lfl enlaza la biblioteca **libfl** 📚, que se necesita para que el codigo generado por Flex funcione correctamente.

```bash
gcc lex.yy.c -lfl
```

Si este no funciona entonces ejecuta:

```bash
gcc lex.yy.c -ll
```
