def getf1(x): return int(x/32)
def getf2(x): return int(x/16) - 2 * getf1(x)
def getn(x): return x - 16*getf2(x) - 32*getf1(x)

def setf1(x, y):

def setf2(x, y):

def unsetf1(x):

def unsetf2(x):

def setn(x, y):

for b in range(0, 255):
	print(b, getf1(b), getf2(b), getn(b))

"""

+ now alive/dead - 1 bit flag 
+ next alive/dead - 1 bit flag
+ neighbor count - 4 bit number = 0-15




"""