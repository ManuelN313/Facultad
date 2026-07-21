#include <stdio.h>
#include <assert.h>

void holaHasta (int n) {
	int i=0;

	while (i < n) {
		printf("hola \n");
		i=i+1; 
	}
}


int pedirEntero (void) {
	int x;
	printf("Ingrese Numero de Holas a imprimir\n");
	scanf("%d",&x);
	 
	return x;
}



int main (void) {
	int h;
	h = pedirEntero();
	assert(h > 0);

	holaHasta(h);

	return 0; 
}
