#include <stdio.h>
#include <assert.h>
#include <stdbool.h>
	
int pedirEntero (void) {
	int j;
	printf("Ingrese Entero: \n");
	scanf("%d",&j);
 
	return j;
}

int main (void) {
	int x;
	x = pedirEntero();

	assert(true); //Precondicion

	if (x < 0) {
		x = -x;
	}
	
	printf("El Valor Absoluto del Entero es %d \n", x);

	assert(x >= 0); //Postcondicion 

	return 0;
}
