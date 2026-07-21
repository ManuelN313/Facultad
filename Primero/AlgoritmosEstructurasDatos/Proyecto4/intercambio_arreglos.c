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

void intercambiar (int a[], int p1, int p2) {
	int aux = a[p1];
	a[p1] = a[p2];
	a[p2] = aux;
}

void imprimirArreglo (int a[], int n_max) {
	int i=0;

	while (i < n_max) {
		printf("El Valor en la Posicion %d es %d \n", i, a[i]);
		i=i+1;
	}	
}


int main (void) {
	int tam, pos1, pos2; 
	printf("Ingrese el Tamaño del Arreglo: ");
	scanf("%d",&tam);
	assert(tam >= 0);
	
	int arreglo[tam];
	pedirArreglo(arreglo, tam);

	printf("Ingrese Posicion 1 a Cambiar (Recordar que se comienza desde el 0): ");
	scanf("%d",&pos1);
	printf("Ingrese Posicion 2 a Cambiar (Recordar que se comienza desde el 0): ");
	scanf("%d",&pos2);
	assert(0 <= pos1 && pos1 < tam);
	assert(0 <= pos2 && pos2 < tam);

	intercambiar(arreglo, pos1, pos2); //No es necesario usar el tamaño de la variable como argumento

	imprimirArreglo(arreglo, tam);

	return 0; 
}
