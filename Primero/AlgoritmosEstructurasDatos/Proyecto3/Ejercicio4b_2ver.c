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


int main (void) {
	int x, y, z, m;

	x = pedirEntero('X');
	y = pedirEntero('Y');
	z = pedirEntero('Z');
	m = pedirEntero('M');

	if (x < y) {
		m = x;
	}
	else {
		m = y;
	}


	if (m >= z) {
		m = z;
	}

	imprimeEntero(x, 'X');
	imprimeEntero(y, 'Y');
	imprimeEntero(z, 'Z');
	imprimeEntero(m, 'M');

	return 0; 
}
