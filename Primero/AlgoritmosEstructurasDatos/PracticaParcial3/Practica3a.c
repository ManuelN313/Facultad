#include <stdio.h>
#include <stdbool.h>

int pedirEntero(char h) {
	
	int j;

	printf("Ingrese el Valor de %c\n", h);	
	scanf("%d",&j);

	return j;
}


bool esPrimo (int p) {

	int i=2;
	bool res=1;

	while (i < p && res)
	{

 	res = res && (p % i) != 0;
 	i = i+1;

	} 

	if (p == i) {
		printf("%d es Primo \n", p);
		return 1; 
	}
	else {
		printf("%d no es Primo \n", p);
		return 0;
	}

}


int main (void) {
	
	int x = pedirEntero('X');
	esPrimo(x);

	return 0;
}






 

