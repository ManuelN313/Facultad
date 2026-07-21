#include <stdio.h>
#include <assert.h>

int main (void) {
	int x;

	printf("Ingrese el Valor de X\n");
	scanf("%d",&x);
	assert(x == 1);
	x = 5;

	printf("\nx = %d \n", x);

	return 0; 
}
