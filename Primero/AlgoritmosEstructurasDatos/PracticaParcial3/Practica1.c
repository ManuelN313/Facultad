#include <stdio.h>

int pedirEntero(char h) {
	
	int j;

	printf("Ingrese el Valor de %c\n", h);	
	scanf("%d",&j);

	return j;
}


int main (void) {

	int x, y, z=1;
	
	x = pedirEntero('X');
	y = pedirEntero('Y');

	while (0 < y) {
		z = x * z;
		y = y - 1;
	}

	printf("Los Valores Finales son: X=%d, Y=%d, Z=%d \n", x, y, z); 	

	return 0;
}

/*
B) El programa es la funcion exponencial, donde X es la base, Y es el exponente (al final de la ejecucion queda 0) y Z es el resultado de hacer X^Y.

C)
Simga0 es igual: x->2 , y->4 , z->0 
Simga1 es igual: x->2 , y->3 , z->2  
Simga1 es igual: x->2 , y->2 , z->4  
Simga1 es igual: x->2 , y->1 , z->8  
Simga1 es igual: x->2 , y->0 , z->16
Simga2 es igual: x->2 , y->0 , z->16  

*/
 

