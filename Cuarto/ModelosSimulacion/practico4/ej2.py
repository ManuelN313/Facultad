from random import random
import numpy
import time

def udiscreta(n):
	U = random()
	return int(n * U) + 1

def termino(u):
	return numpy.exp(u/10000)

def aproximacion(N):
	sum = 0
	for _ in range (N):
		sum += termino(udiscreta(10000))
	return 10000 * (sum/N)

def sumatoria(N):
	sum = 0
	for i in range(N):
		sum += termino(i+1)
	return sum

time1 = time.perf_counter()
aprox_100 = aproximacion(100)
time2 = time.perf_counter()
suma_100 = sumatoria(100)
time3 = time.perf_counter()
suma = sumatoria(10000)
time4 = time.perf_counter()

print("Aproximacion de Sumatoria usando 100 numeros aleatorios:", aprox_100, "con T =", time2 - time1)
print("Aproximacion de Sumatoria usando los primeros 100 numeros:", suma_100, "con T =", time3 - time2)
print("Valor exacto de la Sumatoria:", suma, "con T =", time4 - time3)