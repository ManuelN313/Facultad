from random import random
import time

# A

def udiscreta(n):
	U = random()
	return int(n * U) + 1

def metodo_rechazo():
	p = [0.11, 0.14, 0.09, 0.08, 0.12, 0.1, 0.09, 0.07, 0.11, 0.09]
	while True:
		Y = udiscreta(10)
		U = random()
		if (U <= (p[Y-1] / 0.14)):
			return Y

# B
	
def metodo_transformada_inversa():
	p = [0.11, 0.14, 0.09, 0.08, 0.12, 0.1, 0.09, 0.07, 0.11, 0.09]
	i = 0
	F = p[i]
	U = random()
	while (U >= F):
		i += 1
		F += p[i]
	return i + 1

# C

def generar_urna(p):
	p100 = []
	urna = []
	for j in range(len(p)):
		p100.append(int(p[j] * 100))
		
	for i in range(len(p100)):
		for _ in range(p100[i]):
			urna.append(i+1)
	return urna

def metodo_urna(urna):
	I = int(100 * random())
	return urna[I]

time1 = time.perf_counter()
for _ in range(10000):
	metodo_rechazo()
time2 = time.perf_counter()
for _ in range(10000):
	metodo_transformada_inversa()
time3 = time.perf_counter()
urna = generar_urna([0.11, 0.14, 0.09, 0.08, 0.12, 0.1, 0.09, 0.07, 0.11, 0.09])
for _ in range(10000):
	metodo_urna(urna)
time4 = time.perf_counter()

print("Tiempo del Metodo de Rechazo:", time2 - time1)
print("Tiempo del Metodo de Transformada Inversa:", time3 - time2)
print("Tiempo del Metodo de Urna:", time4 - time3) # Metodo mas rapido