#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#define MAX_SIZE 1000

static void dump(char a[], unsigned int length) {
    printf("\"");
    for (unsigned int j=0u; j < length; j++) {
        printf("%c", a[j]);
    }
    printf("\"");
    printf("\n\n");
}

unsigned int data_from_file(const char *path, unsigned int indexes[], char letters[], unsigned int max_size) {
	FILE *file;
	unsigned int length = 0u;
    file = fopen(path, "r"); //Abro el archivo en modo lectura
    
    if (file == NULL) { //Si archivo no existe finalizar programa
    	printf("Error Opening File\n");
    	exit(EXIT_FAILURE);
    }
    
	while (!feof(file)) { //Mientras que no se llegue al final del archivo sigo ejecutando fscanf
		if (fscanf(file, "%u '%c'\n", &indexes[length], &letters[length]) != 2) { //Reviso que el formato del archivo sea correcto
			printf("Wrong File Format\n");
    		exit(EXIT_FAILURE);
		}
		
		length++;
		
		if (length >= max_size) { //Reviso que el numero de caracteres no se haya excedido MAX_SIZE
			printf("The are more characters than expected\n");
    		exit(EXIT_FAILURE);
		} 
	}
							
	return length;					
}


void sort_array(char sorted[], char letters[], unsigned int indexes[], unsigned int length) {
	
	for (unsigned int i = 0u; i < length; i++) {
	
		if (indexes[i] < length) {
			sorted[indexes[i]] = letters[i];
		}
		
	}

}

void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf("Usage: %s <input file path>\n\n"
           "Loads an array given in a file in disk and prints it on the screen."
           "\n\n"
           "The input file must have the following format:\n"
           " * The first line must contain only a positive integer,"
           " which is the length of the array.\n"
           " * The second line must contain the members of the array"
           " separated by one or more spaces. Each member must be an integer."
           "\n\n"
           "In other words, the file format is:\n"
           "<amount of array elements>\n"
           "<array elem 1> <array elem 2> ... <array elem N>\n\n",
           program_name);
}


char *parse_filepath(int argc, char *argv[]) {
    /* Parse the filepath given by command line argument. */
    char *result = NULL;
    // Program takes exactly two arguments
    // (the program's name itself and the input-filepath)
    bool valid_args_count = (argc == 2);

    if (!valid_args_count) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return result;
}


int main(int argc, char *argv[]) {
	char *file = NULL;
	file = parse_filepath(argc, argv);
	
    unsigned int indexes[MAX_SIZE];
    char letters[MAX_SIZE];
    char sorted[MAX_SIZE];
    unsigned int length = data_from_file(file, indexes, letters, MAX_SIZE); 
    
	sort_array(sorted, letters, indexes, length); 
    dump(sorted, length);

    return EXIT_SUCCESS;
}

