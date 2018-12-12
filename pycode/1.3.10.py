from math import sqrt
def calc(a,b,c):
    t = sqrt(b**2-4*a*c)
    if abs(b-t) < 1e-7:
        x1 = (-2*c)/(b+t)
        x2 = (-b-t)/(2*a)
    else:
        x1 = (-b+t)/(2*a)
        x2 = (-2*c)/(b-t)
    return x1, x2
if __name__ == "__main__":
    a,b,c = 1.,-1000000.000001,1.
    x1, x2 = calc(a,b,c)
    print('x1:',x1,' x2:',x2)
