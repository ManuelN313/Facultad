#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "stack.h"

int main(void) {
	stack test_stack = stack_empty();
	stack_elem test_stack_elem, *test_array;
	unsigned int test_stack_length;
	bool is_empty;

	/*Probando con Stack Vacio (Funciona)
	test_stack = stack_pop(test_stack);     
	test_stack_length = stack_size(test_stack);
	printf("Length: %u\n", test_stack_length);
	test_stack_elem = stack_top(test_stack);
	is_empty = stack_is_empty(test_stack);
	printf("Empty: %d\n", is_empty);
	test_array = stack_to_array(test_stack);
	printf("Array: %ls\n", test_array);
	*/

	/*Probando con Stack de 1 elemento (Funciona)
	test_stack = stack_push(test_stack, 1);
	test_stack_length = stack_size(test_stack);
	printf("Length: %u\n", test_stack_length);
	test_stack_elem = stack_top(test_stack);
	printf("TOP: %d\n", test_stack_elem);
	is_empty = stack_is_empty(test_stack);
	printf("Empty: %d\n", is_empty);
	test_array = stack_to_array(test_stack);
	printf("Array: %d\n", test_array[0]);
	test_stack = stack_pop(test_stack);
	test_stack_length = stack_size(test_stack); //-> POST POP
	printf("Length: %u\n", test_stack_length);
	*/
	
	//Probando con Stack de mas elementos (Funciona)
	test_stack = stack_push(test_stack, 1);
	test_stack = stack_push(test_stack, 2);
	test_stack = stack_push(test_stack, 3);
	test_stack_length = stack_size(test_stack);
	printf("Length: %u\n", test_stack_length);
	test_stack_elem = stack_top(test_stack);
	printf("TOP: %d\n", test_stack_elem);
	is_empty = stack_is_empty(test_stack);
	printf("Empty: %d\n", is_empty);
	test_array = stack_to_array(test_stack);
	printf("Array: %d %d %d\n", test_array[0], test_array[1], test_array[2]);
	test_stack = stack_pop(test_stack);
	test_stack = stack_pop(test_stack);
	test_stack = stack_pop(test_stack);
	test_stack_length = stack_size(test_stack);
	printf("Length: %u\n", test_stack_length);
	test_stack = stack_push(test_stack, 4);
	test_stack_elem = stack_top(test_stack);
	printf("TOP: %d\n", test_stack_elem);
	
	
	test_stack = stack_destroy(test_stack);
	free(test_array);
	
	return EXIT_SUCCESS;
}
