def potencia(x, n):
    if (n == 0):
	    return 1
    else:
	    return x * potencia(x, n-1)

x = float(input("Enter a real number: "))
print("The first five powers of the number " + str(x) + " are: ");
for i in range (1, 6):
    print(potencia(x, i))
