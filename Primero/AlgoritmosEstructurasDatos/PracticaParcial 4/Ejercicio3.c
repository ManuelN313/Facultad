#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

struct datos_t {
	int positivos;
	int ceros;
	int negativos;
	bool hay_23;
	int primos;
};


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


bool esPrimo(int p) {
	int i=2;
	bool resultado=1;	

	while (i < p) {
		resultado = resultado && (p % i != 0);
		i = i+1;
	}

	return resultado;
}


struct datos_t analisis_arreglo (int a[], int n_max) {
	struct datos_t datosA;
	datosA.positivos = 0;
	datosA.ceros = 0;
	datosA.negativos = 0;
	datosA.hay_23 = 0;
	datosA.primos = 0;

	int i=0;

	while (i < n_max) {
		
		if (a[i] > 0) {
			datosA.positivos++;
		}
		else if (a[i] < 0) {
			datosA.negativos++;
		}
		else {
			datosA.ceros++;
		}
		
		if (a[i] == 23) {
			datosA.hay_23 = 1;
		}

		if (esPrimo(a[i]) && a[i] > 1) {
				datosA.primos++;	
		}

		i++;
	}

	return datosA;
}


int main(void) {
	int tam;
	printf("Ingrese el Tamaño del Arreglo: ");
	scanf("%d",&tam);
	assert(tam >= 0);

	int arreglo[tam];
	pedirArreglo(arreglo, tam);

	struct datos_t resulA;
	resulA = analisis_arreglo(arreglo, tam);

	printf("\nPositivos=%d Negativos=%d Ceros=%d Hay_23=%d Primos=%d \n", resulA.positivos, resulA.negativos, resulA.ceros, resulA.hay_23, resulA.primos);
	
	return 0;
}
