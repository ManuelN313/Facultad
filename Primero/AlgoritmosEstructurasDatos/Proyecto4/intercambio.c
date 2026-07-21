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
	int x, y, z;	

	x = pedirEntero('X');
	y = pedirEntero('Y');
	z = x;

	assert(true); //Precondicion

	x = y;
	y = z;

	printf("Los Valores Finales son X=%d, Y=%d \n", x, y);

	assert(true); //Postcondicion (No se cual seria la post-condicion de este programa) 

	return 0;
}
