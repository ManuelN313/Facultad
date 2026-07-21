#include <assert.h> 
#include <stdio.h>
#include <stdlib.h>

#include "strfuncs.h"


size_t string_length(const char *str) {
	assert(str != NULL);
	size_t length = 0u;
	while (str[length] != '\0') {
		length++;
	}
	return length;
}

char *string_filter(const char *str, char c) {
	size_t j = 0u, length = string_length(str); //No hago el assert pues llamo a string_length 
	char *result = NULL;
	result = malloc((length+1) * sizeof(char));
	for (size_t i = 0u; i < length; i++) {
		if (str[i] != c) {
			result[j] = str[i]; 
			j++;
		}
	}
	result[j] = '\0';
	result = realloc(result, j+1);
	return result;
}

