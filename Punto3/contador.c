#include <stdio.h>
#include <string.h>

int main (int argc, char *argv[]){
	
	char buffer[100];
	
	if (argv < 2){
		printf("%s <archivo>\n" , argv[0]);
		return 1;
	}


	FILE *archivo = fopen(argv[1],"r");
	if (!archivo){
		printf("Ups\n",argv[1]);
		return 1;
	}
	
	const char *key = argv[2];
	int count = 0;

	while (fgets(buffer, sizeof(buffer), archivo)){
		char *pos = buffer;
		while((pos = strstr(pos,key))!= NULL){
			count++;
			pos+=strlen(key);
		}
	}

	fclose(archivo);
	printf("La palabra '%s' aparece '%d'\n", key, count);


	
}
