#include <stdlib.h>
#include <stdio.h>

void absolute(int x, int y) {
    if (x >= 0) {
    	y = x;
    } else {
    	y = -x;
    }
}

int main(void) {
    int a = -98, res = 0;
    absolute(a, res);
    printf("El Valor de res es %d \n", res); //El valor de res va a ser 0, pero en el teorico nos daria 98
    return EXIT_SUCCESS;
}

