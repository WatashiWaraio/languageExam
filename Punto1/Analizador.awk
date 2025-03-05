
/^[0-9]+$/{
	printf "ENTERO\n"
}

/^+$/{
	printf "SUMA\n"
}

/^([0-9]+).([0-9]+)$/{

	printf "REAL\n"
}

/^+\+$/{
	printf "INCREMENTO\n"
}

