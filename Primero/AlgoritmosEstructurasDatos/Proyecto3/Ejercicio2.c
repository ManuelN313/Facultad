#include <stdio.h>
#include <stdbool.h>

int main (void) {
	int x, y, z;

	bool b, w;

	printf("Ingrese el Valor de B\n");
	scanf("%d",&b);

	printf("Ingrese el Valor de W\n");
	scanf("%d",&w);

	printf("Ingrese el Valor de X\n");
	scanf("%d",&x);

	printf("Ingrese el Valor de Y\n");
	scanf("%d",&y);

	printf("Ingrese el Valor de Z\n");
	scanf("%d",&z);


	//Expresion 1
	printf("\nx%4==0 = %d \n \n", x%4==0);

	//Expresion 2
	printf("x+y==0 && y-x==(-1)*z = %d \n\n", x==-y && x-y==z);

	//Expresion 3
	printf("not b && w = %d \n \n", !b && w);

	return 0; 
}
