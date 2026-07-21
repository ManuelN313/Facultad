#include <stdio.h>
#include <assert.h>

struct comp_t {
	int menores;
	int iguales;
	int mayores;
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


struct comp_t cuantos (int a[], int n_max, int elem) {
	int i=0;

	struct comp_t total;
	total.menores = 0;
	total.iguales = 0;
	total.mayores = 0;

		
	while (i < n_max) {
		if (a[i] < elem) {
			total.menores = total.menores + 1;
		}
		else if (a[i] == elem) {
			total.iguales = total.iguales + 1;
		}
		else {
			total.mayores = total.mayores + 1;
		}
		i = i+1;
	}

	return total;
}


int main (void) {
	struct comp_t resultado;
	int tam, ent; 
	printf("Ingrese el Tamaño del Arreglo: ");
	scanf("%d",&tam);
	assert(tam >= 0);
	
	int arreglo[tam];
	pedirArreglo(arreglo, tam);

	printf("Ingrese un Numero Entero: ");
	scanf("%d",&ent);

	resultado = cuantos(arreglo, tam, ent);

	printf("Numero Menores a %d son %d \nNumero Iguales a %d son %d \nNumero Mayores a %d son %d \n", ent, resultado.menores, ent, resultado.iguales, ent, resultado.mayores);
 
	return 0; 
}
