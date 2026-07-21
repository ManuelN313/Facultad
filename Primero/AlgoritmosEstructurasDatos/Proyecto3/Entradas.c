#include <stdio.h>

int pedirEntero(void) {
	int x;
	printf("Ingrese un Entero\n");
	scanf("%d",&x);
	 
	return x;
}


void imprimeEntero (int h) {
	printf("\nEl Valor del Entero es %d \n", h);
}


int main (void) {
	int y;

	y = pedirEntero();
	imprimeEntero(y);

	return 0; 
}
