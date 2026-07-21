#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

typedef struct datos_bool {
	int verdaderos;
	int falsos;
} datos_b;


bool pedirBool (int h) {
	bool b;
	int j;
	printf("Ingrese el Valor de la Posicion %d del Arreglo: ", h);
	scanf("%d",&j);
 
	return b = j;
}


void pedirArreglo (bool a[], int n_max) {
	int i=0;

	while (i < n_max) {
		a[i] = pedirBool(i);
		i=i+1;
	}	
}


datos_b analisis_arreglo (bool a[], int n_max) {
	datos_b resultado;
	resultado.verdaderos = 0;
	resultado.falsos = 0;

	int i=0;
	while (i < n_max) {

		if (a[i]) {
			resultado.verdaderos++;
		}
		else {
			resultado.falsos++;
		}

		i++;
	} 

	return resultado;
}


int main(void) {
	int tam;
	printf("Ingrese el Tamaño del Arreglo: ");
	scanf("%d",&tam);
	assert(tam >= 0);

	bool arreglo[tam];
	pedirArreglo(arreglo, tam);

	datos_b resulA;
	resulA = analisis_arreglo(arreglo, tam);

	printf("\nVerdaderos=%d Falsos=%d \n", resulA.verdaderos, resulA.falsos);
	
	return 0;
}
