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

int sumatoria (int a[], int n_max) {
	int i=0, suma=0;

	while (i < n_max) {
		suma = suma + a[i];
		i=i+1;
	}
	
	return suma;
}	


int main (void) {
	int tam, sumaArreglo; //En la Consigna se pide que sea un valor Constante, pero me es mas util esta forma
	printf("Ingrese el Tamaño del Arreglo: ");
	scanf("%d",&tam);
	assert(tam >= 0);
	
	int arreglo[tam];

	pedirArreglo(arreglo, tam);
	sumaArreglo = sumatoria(arreglo, tam);

	printf("La Sumatoria de los Elementos es %d \n", sumaArreglo);
	
	return 0; 
}
