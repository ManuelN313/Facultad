#include <stdio.h>

int pedirEntero(char h) {
	int j;
	printf("Ingrese el Valor de %c\n", h);
	scanf("%d",&j);
 
	return j;
}


void imprimeEntero (int p, char l) {
	printf("El Valor de %c es %d \n", l, p);
}


int minimo (int a, int b) {
	int menor;

	if (a < b) {
		menor = a;
	}
	else {
		menor = b;
	}

	return menor;
}


int main (void) {
	int x, y, z, m;

	x = pedirEntero('X');
	y = pedirEntero('Y');
	z = pedirEntero('Z');

	m = minimo (minimo (x, y), z); //Se que m es el menor de los 3 numeros.

	imprimeEntero(x, 'X');
	imprimeEntero(y, 'Y');
	imprimeEntero(z, 'Z');
	imprimeEntero(m, 'M');

	return 0; 
}
