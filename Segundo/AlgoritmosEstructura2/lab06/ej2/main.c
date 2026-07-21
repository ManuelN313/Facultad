#include <stdio.h>
#include <stdlib.h>
#include "string.h"

int main(void) {

	char *word1 = "Hola Mundo!";
	char *word2 = "Hola Munde!";
	char *word3 = "Perro";
	char *word4 = "Perros";
	
	string str1 = string_create(word1);
	string str2 = string_create(word2);
	string str3 = string_create(word3);
	string str4 = string_create(word4);
	
	printf("'Hola Mundo!' < 'Hola Munde!': %d\n", string_less(str1, str2));
	printf("'Hola Mundo!' = 'Hola Munde!': %d\n", string_eq(str1, str2));
	printf("'Hola Mundo!' < 'Perro': %d\n", string_less(str1, str3));
	printf("'Perro' < 'Perros': %d\n", string_less(str3, str4));
	printf("'Perro' = 'Perro': %d\n", string_eq(str3, str3));

	string_destroy(str1);
	string_destroy(str2);
	string_destroy(str3);
	string_destroy(str4);
	
	return EXIT_SUCCESS;
}
