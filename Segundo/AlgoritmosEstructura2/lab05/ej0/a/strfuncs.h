#ifndef _STRFUNCS_H_
#define _STRFUNCS_H_

size_t string_length(const char *str);
/*
	Devuelve el largo de la cadena apuntada por str
	Pre: str != NULL
*/

char *string_filter(const char *str, char c);
/*
	Devuelve una nueva cadena que se obtiene tomando los carecteres de str que son distintos del caracter c
	Pre: str != NULL

*/



#endif
