#include <stdio.h>

int pedirEntero (char h) {
	int j;
	printf("Ingrese el Valor de %c\n", h);
	scanf("%d",&j);
 
	return j;
}


int main (void) {
	int x, y, aux_x;

	x = pedirEntero('X');
	y = pedirEntero('Y');
	aux_x = x;

	x = x+1;
	y = aux_x + y;

	printf("Los Valores son X=%d, Y=%d \n", x, y); 

	return 0; 
}
