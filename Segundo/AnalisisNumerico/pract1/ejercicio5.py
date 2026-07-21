import math
print(math.factorial(6))

fact = 1
for i in range (1, 7): #Va hasta el 6 
    fact = fact*i
print(fact)

def factor (n):
    if (n == 0):
	    return 1
    else:
	    return n * factor(n-1)

x = int(input("Enter a value: "))
print("The Factorial of " + str(x) + " is " + str(factor(x)))

