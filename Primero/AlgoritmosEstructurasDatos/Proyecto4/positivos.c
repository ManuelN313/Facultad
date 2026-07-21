#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

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

bool todos_positivos (int a[], int tam) {
	int i=0;
	bool todos=1;
	
	while (i < tam) {
		if (a[i] < 0) {
			todos=0;
		}
		i = i+1;
	}

	return todos;
}


bool existe_positivo (int a[], int tam) {
	int i=0;
	bool existe=0;
	
	while (i < tam) {
		if (a[i] >= 0) {
			existe=1;
		}
		i = i+1;
	}

	return existe;
}
	

int main (void) {
	bool respuesta;
	int tam, pregunta; //En la Consigna se pide que sea un valor Constante, pero me es mas util esta forma
	printf("Ingrese el Tamaño del Arreglo: ");
	scanf("%d",&tam);
	assert(tam >= 0);
	
	int arreglo[tam];
	pedirArreglo(arreglo, tam);
	
	printf("Seleccione Funcion a Ejecutar:\nPresione 0 para Existe Positivo || Presione 1+ para Todos Positivos\n");
	scanf("%d",&pregunta);

	if (pregunta == 0) { //Pregunta es de tipo Int porque cuando trate de hacerlo Bool no andaba el condicional	
		respuesta = existe_positivo(arreglo, tam);
	}
	else {
		respuesta = todos_positivos(arreglo, tam);
	}

	printf("\nEl Resultado de Ejecutar la Funcion es %d \n", respuesta);
	

	return 0; 
}
