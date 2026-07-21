#include <stdio.h>
#define N 9

int pedirEntero (int h) {
	int j;
	printf("Ingrese el Valor de la Posicion %d del Arreglo: ", h);
	scanf("%d",&j);
 
	return j;
}


void pedirArreglo (int a[], int n_max) {
	int i=0;

	while (i < n_max) {
		a[i] = pedirEntero(i);
		i=i+1;
	}	
}

void intercambiar (int a[], int n_max) {
	int aux = a[0];
	a[0] = a[n_max-1];
	a[n_max-1] = aux;
}

void imprimirArreglo (int a[], int n_max) {
	int i=0;

	while (i < n_max) {
		printf("El Valor en la Posicion %d es %d \n", i, a[i]);
		i=i+1;
	}	
}

int main(void) {
	int arreglo[N];
	pedirArreglo(arreglo, N);

	intercambiar(arreglo, N);
	
	imprimirArreglo(arreglo, N);

	return 0;
}
