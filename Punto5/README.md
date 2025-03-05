# 🧮 ANTLR Calculator

En este ejercicio de debia realizar operaciones con complejos. 

## 🔧 Requisitos para empezar

Antes de iniciar, asegúrate de tener lo siguiente instalado en tu sistema:

  - Java JDK (versión 8 o superior) ☕
  - Python 3 🐍
  - ANTLR 4 🔡

## 🔽 Instalación de ANTLR

Existen tres formas de instalar ANTLR:

### 🏃 Opción 1: Instalación rápida con Homebrew (macOS/Linux)

Si usas macOS o Linux, la forma más sencilla de instalar ANTLR es con Homebrew:

```bash
brew install antlr
```

### 🏗️ Opción 2: Instalación manual (Windows/macOS/Linux)

Si prefieres una instalación manual, sigue estos pasos:

- 1️⃣ Descarga ANTLR desde su sitio oficial: ANTLR Releases 📥

- 2️⃣ Ubica el archivo JAR descargado en una carpeta accesible.

- 3️⃣ Agrega ANTLR a tu PATH

- 4️⃣ Verifica la instalación

  **NOTA: En este repositorio no me dentendre en explicar esta parte de instalacion manual sin embargo si estas interesado te recomiendo leer The Definitive ANTLR 4 Reference donde explican paso a paso**

### 🤠 Opción 3: Uso de Nix con Flakes

Esta es la opción que nuestro equipo recomienda, ya que este repositorio ofrece un entorno de desarrollo basado en Nix Flakes con todo lo necesario preconfigurado para ejecutar este proyecto.

### 🛠️ ¿Qué es Nix y Flakes?

- Nix es un gestor de paquetes y entornos de desarrollo reproducibles, lo que garantiza que todas las dependencias estén correctamente configuradas sin afectar el sistema.

- Flakes es una extensión de Nix que permite definir configuraciones declarativas y predefinidas para proyectos, facilitando su instalación y uso.

Este repositorio ya incluye un entorno de trabajo listo con todos los programas necesarios para ejecutar esta calculadora Solo necesitas instalar Nix y ejecutar el entorno con Flakes.

Para la intalacion de Nix en tu entorno debereas instalarlo, de igual forma como recomendacion revisa la documentacion.

```bash
curl -L https://nixos.org/nix/install | sh
```
Una vez que hayas instalado Nix, debes dirigirte a la carpeta donde clonaste este repositorio. En esa ubicación, encontrarás los archivos del proyecto junto con los archivos de configuración de Flakes. 🧩

Para acceder al entorno de desarrollo preconfigurado, abre una terminal, navega hasta la carpeta del repositorio y ejecuta el siguiente comando:

```bash
nix develop
```
Este comando activará el entorno de desarrollo definido en el flake.nix, cargando automáticamente todas las herramientas y dependencias necesarias para este proyecto.

✅ Ventajas de usar nix develop:

- No necesitas instalar manualmente cada dependencia.
- Garantiza que todos los desarrolladores trabajen en un entorno idéntico.
- Evita conflictos entre versiones de paquetes y herramientas.

Finalmente la forma en que lo hayas instalado, si ejecutas el siguiente comando: 

```bash
antlr
```
**NOTA:Para poder ejecutar en Python debes tener 'pip' instalado luego tenemos que intalar el paquete que permite que los analizadores funcionen correctamente en Python con el siguiente comando:**

```bash
pip install antlr4-python3-runtime
```

Y esto te muestra la ayuda, ¡todo está listo! 🎯

## 🚀 Próximo paso

📂 Al clonar o descargar este repositorio, encontrarás varios archivos. A continuación, te explicamos su propósito para que comprendas mejor su función.

## 🏗️ Archivos de configuración del entorno
### 📌 flake.lock y flake.nix

Estos archivos definen el entorno de desarrollo preconfigurado que mencionamos anteriormente en la sección de instalación y preparación. Son fundamentales para garantizar que todo funcione correctamente, así que no los muevas ni edites a menos que quieras experimentar con la configuración para aprender más sobre Nix y Flakes.

## 🔡 Archivos de la gramática (ANTLR)

### 📌 ComponenteLexer.g4

Este archivo es esencial, ya que define las reglas léxicas 📝. Aquí se establecen qué caracteres forman un identificador (ID), un número entero (INT), una nueva línea (NEWLINE), etc.
Sin este archivo, no podríamos hacer el análisis léxico, porque es el encargado de definir cómo reconocer los tokens.

### 📌 LabeledExpr.g4

Terminales y no terminales (estructura de la gramática) las Reglas de precedencia y operaciones según los caracteres de entrada.
Ademas la Asignación de tokens para estructurar la expresión matemática.
Básicamente, este archivo le da forma y significado a los cálculos que haremos con la calculadora.

## 💻 Código de la calculadora

### 📌  Calc.py

Este archivo es el corazón del proyecto ❤️. Aquí se encuentra el método main(), que:

- Crea el lexer y el parser basados en la gramática definida.
- Ejecuta y procesa las expresiones ingresadas por el usuario.
- Orquesta la funcionalidad de la calculadora para devolver los resultados correctamente.

### 📌 EvalVisitor.py

Visitor es un patrón de diseño de comportamiento que te permite separar algoritmos de los objetos sobre los que operan.
En este caso el EvalVisitor implementa la interfaz que crea ANTLR.



## Para Python 🐍 :

```bash
 antlr -no-listener -visitor -Dlanguage=Python3  LabeledExpr.g4
```
Para generar los archivos necesarios para el analizador léxico y sintáctico en Python.
-Dlanguage=Python3: Especifica que el código generado debe ser para Python 3.

```bash
python3 Calc.py
```
Ejecuta la clase Calc (el programa principal).

## PRUEBAS 😮

Realizamos nueve pruebas distintas, las cuales podrán encontrar en el repositorio una vez lo clonen. Cada una de estas pruebas representa un reto diferente para la calculadora.

Para facilitar el proceso de ejecución, se ha creado un script en Bash, permitiendo ejecutar las pruebas con un solo comando.

si quieres ejecutar todas las pruebas pon este comadno : 

```bash
bash ejecutar_pruebas.sh --all
```

Pero si quieres probar algunas especificas puedes usar 

```bash
bash ejecutar_pruebas.sh 3,1,5 #Este es un ejemplo
```
