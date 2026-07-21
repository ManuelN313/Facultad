#include <stdio.h>

int main (void) {
	int i;

	printf("Ingrese el Valor de I\n");
	scanf("%d",&i);

	while (i != 0) {
		i = i-1;
	} 

	printf("\nEl Valor de I es %d\n", i);

	return 0; 
}
