#include <stdio.h>

int main (void) {
	int x, y, z, m;

	printf("Ingrese el Valor de X\n");
	scanf("%d",&x);

	printf("Ingrese el Valor de Y\n");
	scanf("%d",&y);

	printf("Ingrese el Valor de Z\n");
	scanf("%d",&z);

	printf("Ingrese el Valor de M\n");
	scanf("%d",&m);

	if (x < y) {
		m = x;
	}
	else {
		m = y;
	}


	if (m >= z) {
	m = z;
	}


	printf("\nEl Valor de X=%d Y=%d Z=%d M=%d  \n", x, y, z, m);

	return 0; 
}
