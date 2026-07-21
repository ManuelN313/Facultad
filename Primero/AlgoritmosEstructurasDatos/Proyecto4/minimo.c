#include <stdio.h>
#include <assert.h>
#include <stdbool.h>
	
int pedirEntero (char h) {
	int j;
	printf("Ingrese el Valor de %c\n", h);
	scanf("%d",&j);
 
	return j;
}

int main (void) {
	int x, y, minimo;	

	x = pedirEntero('X');
	y = pedirEntero('Y');

	assert(true); //Precondicion

	if (x <= y) {
		minimo = x;
	}
	else {
		minimo = y;
	}	

	printf("El Minimo entre %d y %d es %d \n", x, y, minimo);

	assert(x > y || x < y || x == y); //Postcondicion 

	return 0;
}
