#include <stdio.h>
#include <stdbool.h>

int pedirEntero(char h) {
	
	int l;

	printf("Ingrese el Valor de %c\n", h);	
	scanf("%d",&l);

	return l;
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
		return 1; 
	}
	else {
		return 0;
	}

}


int main (void) {
	
	int i, j, k;
	bool ress = 0;

	i = pedirEntero('I');
	j = pedirEntero('J');
	k = i;

	while (k <= j && !ress) {

		k = k+1;
		ress = ress || ((k % 2 == 0) || esPrimo(k));

	}

	printf("Los Valores son: I=%d J=%d K=%d Res=%d \n", i, j, k, ress);


	return 0;
}

/*

D) Ahora lo que el Programa hace es devolvernos True cuando encuentra al primer elemento del intervalo [I, J+1] tal que sea Primo o Par. Res sirve para verificar si se ha encotrado dicho elemento y que de esta forma finalice el ciclo.

*/

 

