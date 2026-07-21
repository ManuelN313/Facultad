#include <stdio.h>
#include <stdbool.h>

int pedirEntero (void) {
	int j;
	printf("Ingrese Entero: ");
	scanf("%d",&j);
 
	return j;
}


bool esPrimo (int p) {
	int i=2;
	bool resultado=1;	

	while (i < p) {
		resultado = resultado && (p % i != 0);
		i = i+1;
	}

	return resultado;
}

int nesimo_primo (int n) {
	int i=0, h=2, primo;

	while (i < n) {
		if (esPrimo(h)) {
			i = i+1;
			primo = h;
		} 
		h = h+1;
	}

	return primo;
}
	

int main (void) {
	int ent, primos;
	ent = pedirEntero();

	while (ent <= 0) {
		printf("Entero Negativo o Igual a Cero, volver a Ingresar \n");
		ent = pedirEntero();
	}
	
	primos = nesimo_primo(ent);

	printf("El %dª Numero Primo es %d \n", ent, primos);

	return 0; 
}
