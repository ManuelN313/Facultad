#include <stdio.h>
#include <assert.h>

struct div_t {
	int cociente;
	int resto;
};


struct div_t division (int x, int y) {
	int q=0;
	struct div_t dupla;	

	while (x >= y) {
		x = x-y;
		q = q+1;
	}
	
	dupla.cociente = q;
	dupla.resto = x;

	return dupla;
}


int pedirEntero (char h) {
	int j;
	printf("Ingrese el Valor de %c\n", h);
	scanf("%d",&j);
 
	return j;
}


int main (void) {
	int dividendo, divisor;
	struct div_t resultado;

	dividendo = pedirEntero('X');
	divisor = pedirEntero('Y');

	if (divisor == 0) {
		printf("Division por 0, Finalizando Programa\n");
		return 0;
	}

	assert(dividendo >= 0);
	assert(divisor > 0);

	resultado = division(dividendo, divisor);
 
	printf("El Resultado de la Division Entera entre %d/%d es %d con Resto %d \n", dividendo, divisor, resultado.cociente, resultado.resto); 

	return 0; 
}
