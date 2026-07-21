#include <stdio.h>

int pedirEntero (void) {
	int x;
	printf("Sumar hasta que Valor:\n");
	scanf("%d",&x);
	 
	return x;
}

int suma_hasta (int n) {
	int i=0, suma=0;

	while (i <= n) {
		suma = suma + i;
		i = i+1;
	}

	return suma;
}

int main (void) {
	int h, resultado;
	h = pedirEntero();

	if (h < 0) {
		printf("Numero Negativo, Finalizando Programa \n");
		return 0;
	}
	
	resultado = suma_hasta(h);
 
	printf("La Sumatoria hasta %d es %d \n", h, resultado); 

	return 0; 
}
