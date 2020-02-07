import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
import sys
import os
import math
from astropy.stats import jackknife_resampling


beta_low=float(sys.argv[1])
beta_high=float(sys.argv[2])
nbeta=int(sys.argv[3])
beta=np.zeros((nbeta))

L=np.array([8, 10, 12, 16])
E=np.zeros((nbeta))
E_var=np.zeros((nbeta))

h=5.4

fig, ((ax1, ax2))= plt.subplots(2, 1)
plt.rc('text', usetex=True)
plt.rc('font', family='serif', size='18')
plt.rc('text.latex', preamble=r'\usepackage{bm}')

for l in range(len(L)):

    BASEDIR=("/home/ilaria/Desktop/MultiComponents_SC/Output_2C/L%d_e0.5_h5.4_bmin%s_bmax%s" %(L[l], beta_low, beta_high))
    print(BASEDIR)
    V=(L[l]*h)**3
    for b in range(nbeta):
        beta[b]=beta_low +b*((beta_high-beta_low)/(nbeta-1))
        file_E=("%s/beta_%d/Energy.txt" %(BASEDIR, b))
        En=np.loadtxt(file_E, usecols=1, unpack=True)
        Half=int(0.5*len(En))
        E[b]=np.mean(En[:Half])
        E_var[b]=np.var(En[:Half])

    ax1.plot(beta, E, '-', label=str(L[l]))
    ax2.plot(beta, E_var, '-', label=str(L[l]))

ax1.legend(loc='best')
ax1.grid(True)
ax1.set_xlabel(r'$\beta$')
ax1.set_ylabel(r'$\beta E/V$')
ax2.set_xlabel(r'$\beta$')
ax2.grid(True)
ax2.set_ylabel(r'$var(\beta E/V)$')
plt.tight_layout()

plt.show()
