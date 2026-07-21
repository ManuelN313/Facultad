#ifndef _WEATHER_UTILS_H
#define _WEATHER_UTILS_H

#include <stdio.h>

#include "array_helpers.h"
#include "weather.h"


int min_mintemp_all_time(WeatherTable array);

void max_maxtemp_of_year(WeatherTable array, int output[]);

void max_total_precipitations_of_month (WeatherTable array, month_t output[]);


#endif
