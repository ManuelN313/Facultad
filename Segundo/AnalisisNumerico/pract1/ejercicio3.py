import math

#Biggest Float
a = 1.0
while (True):
    a = a * 2.0
    if (math.isinf(a)):
	    break
    print(a)
	
#Smallest (Positive) Float
b = 1.0
while (True):
    b = b / 2.0
    if (b == 0):
	    break
    print(b)
