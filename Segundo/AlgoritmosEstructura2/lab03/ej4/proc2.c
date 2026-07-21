#include <stdlib.h>
#include <stdio.h>

void absolute(int x, int *y) { 
    if (x >= 0) {
    	*y = x;
    } else {
    	*y = -x;
    }
}

int main(void) {
    int a = 98, res = 0;
    absolute(a, &res);
    printf("El valor de res es %d\n", res); 
    return EXIT_SUCCESS;
}
