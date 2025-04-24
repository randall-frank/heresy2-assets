import numpy as np
from scipy.stats import norm

ix = range(-100, 101, 2)
x = list(ix)   # [-100,100]
x = [float(i)/50 for i in x]
print(x)
n = [1.-float(i) for i in norm.pdf(x, loc=0., scale=0.5)]
area = sum(n)
print(area, n)
counts = 100
c = [float((p/area)*counts) for p in n]
print(sum(c), c)
sum = 0
c_cum = []
for v in c:
    c_cum.append(v+sum)
    sum += v
print(c_cum)

ii = list(range(len(ix)))
z = np.polyfit(ii, c_cum, 5)
print("coefficients:", z)
f = np.poly1d(z)
fit = []
for v in ii:
    fit.append(float(f(v)))
print(fit)

import matplotlib.pyplot as plt

fig, ax = plt.subplots(2,2)
ax[0,0].plot(x,n)
ax[0,0].set_title('pdf')
ax[0,1].plot(x,c)
ax[0,1].set_title('counts')
ax[1,0].plot(ii,c_cum)
ax[1,0].set_title('cumulative')
ax[1,1].plot(ii,fit)
ax[1,1].set_title('fit')
plt.show()
