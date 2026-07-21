#include <stdio.h>

typedef struct {
	char *nombre;
	int edad;
	float altura;
	float peso;
} persona_t;

float peso_promedio (persona_t a[], unsigned int largo) {
	int i=0;
	float promedio=0;
	
	while (i < largo) {
		promedio = promedio + a[i].peso;
		i = i+1;
	}

	promedio = promedio/largo;

	return promedio;
}

persona_t persona_de_mayor_edad (persona_t a[], unsigned int largo) {
	int i=0;
	int mayor=a[i].edad;
	persona_t mayor_edad;

	while (i < largo) {
		if (a[i].edad > mayor) {
			mayor = a[i].edad;
			mayor_edad = a[i];
		}
		i = i+1;
	}
	
	return mayor_edad;
}

persona_t persona_de_menor_altura (persona_t a[], unsigned int largo) {
	int i=0;
	float menor=a[i].altura;
	persona_t menor_altura;

	while (i < largo) {
		if (a[i].altura < menor) {
			menor = a[i].altura;
			menor_altura = a[i];
		}
		i = i+1;
	}

	return menor_altura;
}
	

int main(void) {
	persona_t p1 = {"Paola", 21, 1.85, 75};
	persona_t p2 = {"Luis", 54, 1.75, 69};
	persona_t p3 = {"Julio", 40, 1.70, 80};
	unsigned int longitud = 3;

	persona_t arr[] = {p1, p2, p3};
	printf("El peso promedio es %f\n", peso_promedio(arr, longitud));

	persona_t p = persona_de_mayor_edad(arr, longitud);
	printf("El nombre de la persona con mayor edad es %s\n", p.nombre);

	p = persona_de_menor_altura(arr, longitud);
	printf("El nombre de la persona con menor altura es %s\n", p.nombre);

	return 0;
}
