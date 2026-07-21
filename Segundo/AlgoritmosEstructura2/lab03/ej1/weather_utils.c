#include <stdio.h>

#include "array_helpers.h"
#include "weather.h"
#include "weather_utils.h"

int min_mintemp_all_time(WeatherTable array) {
	int min = array[0][0][0]._min_temp;
	for (unsigned int year = 0u; year < YEARS; year++) {
		for (month_t month = january; month <= december; month++) {
			for (unsigned int day = 0u; day < 28; day++) {
				if (min > array[year][month][day]._min_temp) {
					min = array[year][month][day]._min_temp;
				}		
			} 
		}
	}
	
	return min;
	
}

void max_maxtemp_of_year(WeatherTable array, int output[]) {
	
	int max;
	for (unsigned int year = 0u; year < YEARS; year++) {
		max = array[year][0][0]._max_temp;
		
		for (month_t month = january; month <= december; month++) {
			for (unsigned int day = 0u; day < 28; day++) {
				if (max < array[year][month][day]._max_temp) {
					max = array[year][month][day]._max_temp;
				}		
			} 
		}
		
		output[year] = max;
		
	}

}

void max_total_precipitations_of_month (WeatherTable array, month_t output[]) {
	
	month_t max_prec;
	unsigned int total_precipitations_of_month, max_total_prec;
	
	for (unsigned int year = 0u; year < YEARS; year++) {
		max_total_prec = 0u;
		max_prec = january;
	
		for (month_t month = january; month <= december; month++) {
			total_precipitations_of_month = 0;
			for (unsigned int day = 0u; day < 28; day++) {
				total_precipitations_of_month = total_precipitations_of_month + array[year][month][day]._rainfall;		
			}
			
			if (total_precipitations_of_month > max_total_prec) {
				max_total_prec = total_precipitations_of_month;
				max_prec = month;
			}
		}
		
		output[year] = max_prec;
		
	}

}
