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
	bool ress = 1;

	i = pedirEntero('I');
	j = pedirEntero('J');
	k = i;

	while (k <= j && ress) {

		k = k+1;
		ress = ress && ((k % 2 == 0) || esPrimo(k));

	}

	printf("Los Valores son: I=%d J=%d K=%d Res=%d \n", i, j, k, ress);


	return 0;
}

/*
C)
Sigma0 I->2, J->8, K->0, Res->False 
Sigma1 I->2, J->8, K->3, Res->True 
Sigma1 I->2, J->8, K->4, Res->True
Sigma1 I->2, J->8, K->5, Res->True
Sigma1 I->2, J->8, K->6, Res->True 
Sigma1 I->2, J->8, K->7, Res->True  
Sigma1 I->2, J->8, K->8, Res->True  
Sigma1 I->2, J->8, K->9, Res->False 
Sigma2 I->2, J->8, K->9, Res->False

 
El programa lo que hace es ver si todos los numeros enteros entre I e J+1 son Pares o Primos, es decir, nos devueve False (la Variable Res) si encuentra un numero Impar no Primo en el intervalo [I,J+1].

*/

 

