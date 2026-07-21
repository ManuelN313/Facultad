//Los programas 1e y 1f son equivalentes.

#include <stdio.h>

int main (void) {
	int x, y;

	printf("Ingrese el Valor de X\n");
	scanf("%d",&x);

	printf("Ingrese el Valor de Y\n");
	scanf("%d",&y);

	if (x >= y) {
		x = 0;
	}
	else { //No pongo la otra guarda en un else if porque en C hay determinismo.
		x = 2;
	}

	printf("\nEl Valor de X es %d \n", x);


	return 0; 
}
