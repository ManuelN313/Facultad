#include <stdio.h>
#include <stdbool.h>

int pedirEntero(char h) {
	
	int j;

	printf("Ingrese el Valor de %c\n", h);	
	scanf("%d",&j);

	return j;
}


int main (void) {

	int x, y;
	
	x = pedirEntero('X');
	y = pedirEntero('Y');


	printf("x*x*x*y >= 0 --> %d \n", x*x*x*y >= 0 );
	printf("(not x == (y+1) % 1) || not (x && not y) --> %d \n", ((!x) == (y+1) % 1) || !(x && (!y)) );
 	printf("not x == (x+2) --> %d \n", (!x) == (x+2) );

	return 0;
}

/*

1) x->-1, y->7 
   x->8 , y->-9 
   x->-2, y->1 

2) x->9 , y->6 
   x->-1, y->7 
   x->8 , y->-9 

3) x->-2

*/  





 

