#include <stdio.h>

int pedirEntero(char h) {
	
	int l;

	printf("Ingrese el Valor de %c\n", h);	
	scanf("%d",&l);

	return l;
}


void imprimeHola(void) {
	printf("hola\n");
}


void imprimeChau(void) {
	printf("chau\n");
}


int main (void) {
	
	int i=0, n=pedirEntero('N');
	
	while (i < n) {
		i = i+1;
		imprimeHola();

		if (i % 10 == 0) {
			imprimeChau();
		}
	}

	return 0;
}

/*
A) "hola" se imprime para el rango [0,19] (valor de i en la guarda del while). Es decir un total de 20 veces.
B) "chau" no se imprime desde [0,8] U [10,18].
C) "chau" se imprime en {9,19} sumando un total de 2. 
*/
 

