function calcular() {
	java -cp .:$CLASSPATH Calc $1
}

function ejecutar_prueba() {
	titulo=$1
	archivo=$2

	echo $titulo
	echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
	cat $archivo
	echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

	echo
	echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	calcular $archivo
	echo -n ">>>>>>>>>>>>>>>>>>>>>>>>>>>>"
}

if [ -z $1 ]; then
	echo "Uso:"
	echo "${0} --all: ejecuta todas las pruebas"
	echo "${0} n,m,z,... : ejecuta las pruebas con números n,m,z, etc."
elif [ $1 == '--all' ]; then
	for i in {1..9}; do
		ejecutar_prueba "Prueba$i.txt" "Prueba$i.txt"
		echo -e "\n\n"
	done
else
	for i in $(echo $1 | sed "s/,/ /g"); do
		ejecutar_prueba "Prueba$i.txt" "Prueba$i.txt"
		echo -e "\n\n"
	done
fi
