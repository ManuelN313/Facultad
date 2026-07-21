def horn(coefs, x):
	bn = coefs[0]
	for i in range (1, len(coefs)): #[1, len(coefs)-1]
		bn = coefs[i] + x*bn
	return bn

p = horn([1, -5, 6, 2], 2)

print(p)


	
