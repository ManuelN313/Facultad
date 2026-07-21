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

	bool b, w;

	b = pedirEntero('B');
	w = pedirEntero('W');
	x = pedirEntero('X');
	y = pedirEntero('Y');
	z = pedirEntero('Z');


	//No voy a usar la funcion imprimeEntero porque es mas comodo presentar los resultados de esta forma:

	//Expresion 1
	printf("\nx%4==0 = %d \n \n", x%4==0);

	//Expresion 2
	printf("x+y==0 && y-x==(-1)*z = %d \n\n", x==-y && x-y==z);

	//Expresion 3
	printf("not b && w = %d \n \n", !b && w);

	return 0; 
}
