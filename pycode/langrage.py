import numpy as np
import matplotlib.pyplot as plt
def get_li(xi, x_set = []):
    def li(Lx):
        W,c = 1., 1.
        for each_x in x_set:
            if each_x != xi:
                W = W * (Lx - each_x)
                c = c * (xi - each_x)   
        return W / c    
    return li
def get_Lxfunc(x = [], fx = []):
    set_of_lifunc = []
    for each in x:
        lifunc = get_li(each, x)
        set_of_lifunc.append(lifunc)
         
    def Lxfunc(Lx):
        result = 0
        for index in range(len(x)):
            result = result + fx[index]*set_of_lifunc[index](Lx)
        return result
             
    return Lxfunc
l,r,cnt = -5.,5.,11
x = np.linspace(l,r,cnt)
y0 = 1/(1+x**2)
Lx = get_Lxfunc(x,y0)
tmpx = np.linspace(l,r,100)
tmpy0 = 1/(1+tmpx**2)
tmpy = [Lx(i) for i in tmpx]
plt.plot(tmpx, tmpy, tmpx, tmpy0, x, y0, 'o')
plt.show()
#plt.plot(x,y0)
#plt.show()

