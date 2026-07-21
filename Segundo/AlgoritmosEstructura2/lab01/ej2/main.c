/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>

int assing_int_value (unsigned int x) {
    int result;
    printf("Enter the %uº element of the array: ", x);
    scanf("%d", &result);
        
    return result;
}

void array_from_stdin(int array[], unsigned int length) {

	for (unsigned int i = 0; i < length; i++) {
		array[i] = assing_int_value(i); 	
	}

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

int main(void) { 
    unsigned int length;
    printf("Enter the size of the array: ");
    scanf("%u", &length);
    int array[length];
    
    array_from_stdin(array, length);
    array_dump(array, length);
    
    return 0;
}
