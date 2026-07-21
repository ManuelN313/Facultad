#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "array_helpers.h"
#include "mybool.h"

unsigned int array_from_file(int array[], unsigned int max_size, const char *filepath) {
    FILE *archivo;
    unsigned int length;
    archivo = fopen(filepath, "r"); //Abro el archivo en modo lectura
    fscanf(archivo, "%u", &length); //Asigno a length el valor del primer reglon
    assert(length <= max_size); //Reviso que no sea mayor al tamaño permitido
    
    for (unsigned int i = 0; i < length; i++) {
    	fscanf(archivo, "%d", &array[i]); //Inicializo el array con los valores del archivo
    }
    
    fclose(archivo); //Cierro el archivo
	return length;
}

void array_dump(int a[], unsigned int length) {
	
	if (length == 0) {
		printf("\n[ ]\n");
	} else {
		printf("\n[ %d", a[0]);
		for (unsigned int i = 1; i < length; i++) {
			printf(", %d", a[i]);
		}
    	printf("]\n");
	}

}

mybool array_is_sorted(int a[], unsigned int length) {
	mybool result = true;
	unsigned int i = 0;
	
	if (length > 0) {
		while (i < length-1 && result) {
			result = result && (a[i] <= a[i+1]);
			i++;
		}
	} 
	
	return result;
}
