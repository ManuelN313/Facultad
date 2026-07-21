#include <stdio.h>
#include <stdbool.h>

int main (void) {
	int x, y, z;

	printf("Ingrese el Valor de X\n");
	scanf("%d",&x);

	printf("Ingrese el Valor de Y\n");
	scanf("%d",&y);

	printf("Ingrese el Valor de Z\n");
	scanf("%d",&z);

	//A
	printf("\nx+y+1=%d \n \n", x+y+1);

	//B
	printf("z*z+y*45-15*x=%d \n \n", z*z+y*45-15*x);

	//C
	printf("z-2==(x*3+1)%5=%d \n \n", z-2 == (x*3+1)%5);

	//D
	printf("y/2*x=%d \n \n", y/2*x);

	//E
	printf("y<x*z=%d \n \n", y<x*z);

	return 0; 
}


