#include <stdio.h>

int main (void) {
	int x, y;

	printf("Ingrese el Valor de X\n");
	scanf("%d",&x);

	printf("Ingrese el Valor de Y\n");
	scanf("%d",&y);

	y = y+y;
	x = x+y;

	printf("\nx = %d \n", x);

	printf("y = %d \n", y);

	return 0; 
}
