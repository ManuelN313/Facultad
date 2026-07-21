#include <stdio.h>
#include <stdbool.h>

int main (void) {
	int x, i=2;
	bool res=1;

	printf("Ingrese el Valor de X\n");
	scanf("%d",&x);

	while (i < x && res) {
		res = res && (x % i) != 0;
		i = i+1;
	} 

	printf("\nEl Valor de I=%d \n", i);

	return 0; 
}
