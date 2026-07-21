#include <stdio.h>
#include <assert.h>

int main (void) {
	int x, y;

	printf("Ingrese el Valor de X\n");
	scanf("%d",&x);
	assert(x == 2);

	printf("Ingrese el Valor de Y\n");
	scanf("%d",&y);
	assert(y == 5);

	x = x+y;
	y = y+y;

	printf("\nx = %d \n", x);

	printf("y = %d \n", y);

	return 0; 
}
