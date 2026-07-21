#include <stdio.h>    /* printf(), scanf() */
#include <stdbool.h>  /* tipo bool         */

#include <assert.h>   /* assert() */

#define ARRAY_SIZE 10

struct max_min_result {
    int max_value;
    int min_value;
    unsigned int max_position;
    unsigned int min_position;
};

struct max_min_result compute_max_min(int array[], unsigned int length)
{
    assert(length > 0);
    array = array;
    unsigned int i = 0;
    struct max_min_result result; //Otra forma seria result = {array[i], array[i], 0, 0}
    result.max_value = array[i];
    result.min_value = array[i];
    result.max_position = i;
    result.min_position = i;
    i++;
    
    while (i < length) {
    	if (result.max_value < array[i]) {
    		result.max_value = array[i];
    		result.max_position = i;
    	}
    	if (result.min_value > array[i]) {
    		result.min_value = array[i];
    		result.min_position = i;
    	}
    	i++;
    }

    return result;
}

int main(void)
{
    int array[ARRAY_SIZE];
	int i = 0;

    while (i < ARRAY_SIZE) {
    	printf("Ingrese el elemento %dº del arreglo: ", i);
    	scanf("%d", &array[i]); 
    	i++;
    }
	
    struct max_min_result result = compute_max_min(array, ARRAY_SIZE);
    printf("Máximo: %d\n", result.max_value);
    printf("Posición del máximo: %u\n", result.max_position);
    printf("Mínimo: %d\n", result.min_value);
    printf("Posición del mínimo: %u\n", result.min_position);
    return 0;
}

