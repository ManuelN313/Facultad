#include <stdio.h>

int main (void) {
	int x, y, i=0;

	printf("Ingrese el Valor de X\n");
	scanf("%d",&x);

	printf("Ingrese el Valor de Y\n");
	scanf("%d",&y);

	while (x >= y) {
		x = x-y;
		i = i+1;
	} 

	printf("\nEl Valor de X=%d I=%d \n", x, i);

	return 0; 
}
