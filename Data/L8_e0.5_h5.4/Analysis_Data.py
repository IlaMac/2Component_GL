import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
import sys
import os
import math


L=8
e=0.5
h=5.4

beta=np.array([0.224, 0.2245, 0.225, 0.2255, 0.226, 0.2265])

U=np.zeros((len(beta)))

for b in range(len(beta)):
    BASEDIR=("/home/ilaria/Desktop/Multi_Components_GL/Data/L%d_e%s_h%s/beta_%s" %(L, e, h, beta[b]))
    fileM=("%s/Magnetization.txt" %BASEDIR)
    m2_b, m4_b=np.loadtxt(fileM, usecols=(2,3), unpack=True)
    U[b]=np.mean(m4_b)/(3*np.mean(m2_b)*np.mean(m2_b))

plt.rc('text', usetex=True)
plt.rc('font', family='serif', size='18')
plt.rc('text.latex', preamble=r'\usepackage{bm}')
ax1 = plt.gca()
ax1.grid(True)
ax1.set_xlabel(r'$\beta$')
ax1.set_ylabel('U')
ax1.plot(beta, U, 'o-',color='xkcd:plum', linewidth=1.0)
#ax1.legend(loc='best')
plt.tight_layout()
plt.savefig('/home/ilaria/Desktop/Multi_Components_GL/Data/L%d_e%s_h%s/U.png' %(L, e, h))
plt.show()
plt.close()


