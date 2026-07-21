#include <stdio.h>
#include <assert.h>

struct datos_t {
	float maximo;
	float minimo;
	float promedio;
};


float pedirReal (int h) {
	float j;
	printf("Ingrese el Valor de la Posicion %d del Arreglo: ", h);
	scanf("%f",&j);
 
	return j;
}


void pedirArreglo (float a[], int n_max) {
	int i=0;

	while (i < n_max) {
		a[i] = pedirReal(i);
		i=i+1;
	}	
}


struct datos_t stats (float a[], int n_max) {
	int i=0; 

	struct datos_t valores;
	valores.maximo = a[0];
	valores.minimo = a[0];
	valores.promedio = 0;

	while (i < n_max) {

		if (a[i] > valores.maximo) {
			valores.maximo = a[i];
		}

		if (a[i] < valores.minimo) {
			valores.minimo = a[i];
		}

		valores.promedio = valores.promedio + a[i];

 		i = i+1;
	}

	valores.promedio = valores.promedio/n_max;

	return valores;
}


int main (void) {
	struct datos_t resultado;
	int tam; 
	printf("Ingrese el Tamaño del Arreglo: ");
	scanf("%d",&tam);
	assert(tam >= 0);
	
	float arreglo[tam];
	pedirArreglo(arreglo, tam);

	resultado = stats(arreglo, tam);

	printf("Maximo: %f, Minimo: %f, Promedio: %f \n", resultado.maximo, resultado.minimo, resultado.promedio);

	return 0; 
}
