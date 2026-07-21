#include <stdio.h>
#include <stdbool.h>

int pedirEntero(char h) {
	int j;
	printf("Ingrese el Valor de %c\n", h);
	scanf("%d",&j);
 
	return j;
}


int main (void) {
	int x, y, z;

	x = pedirEntero('X');
	y = pedirEntero('Y');
	z = pedirEntero('Z');


	//No voy a usar la funcion imprimeEntero porque es mas comodo presentar los resultados de esta forma:

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
