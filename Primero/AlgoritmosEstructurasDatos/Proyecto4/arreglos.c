#include <stdio.h>
#include <assert.h>

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

void imprimirArreglo (int a[], int n_max) {
	int i=0;

	while (i < n_max) {
		printf("El Valor en la Posicion %d es %d \n", i, a[i]);
		i=i+1;
	}	
}


int main (void) {
	int tam;
	printf("Ingrese el Tamaño del Arreglo: ");
	scanf("%d",&tam);
	assert(tam >= 0);
	
	int arreglo[tam];

	pedirArreglo(arreglo, tam);
	
	imprimirArreglo(arreglo, tam);
	
	return 0; 
}
