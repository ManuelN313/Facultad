#include <stdio.h>

int pedirEntero (char h) {
	int j;
	printf("Ingrese el Valor de %c\n", h);
	scanf("%d",&j);
 
	return j;
}


int main (void) {
	int x, y, z, aux_x, aux_y;

	x = pedirEntero('X');
	y = pedirEntero('Y');
	z = pedirEntero('Z');
	aux_x = x;
	aux_y = y;

	x = y;
	y = y + aux_x + z;
	z = aux_y + aux_x;

	printf("Los Valores son X=%d, Y=%d, Z=%d \n", x, y, z); 

	return 0; 
}
