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
h=5.4


plt.rc('text', usetex=True)
plt.rc('font', family='serif', size='18')
plt.rc('text.latex', preamble=r'\usepackage{bm}')
fig, ((ax1, ax2))= plt.subplots(2, 1)

for l in range(len(L)):

    BASEDIR=("/home/ilaria/Desktop/MultiComponents_SC/Output_2C/L%d_e0.5_h5.4_bmin%s_bmax%s" %(L[l], beta_low, beta_high))
    M=np.zeros((nbeta))
    M2=np.zeros((nbeta))
    M4=np.zeros((nbeta))
    U=np.zeros((nbeta))

    for b in range(nbeta):
        beta[b]=beta_low +b*((beta_high-beta_low)/(nbeta-1))
        file_M=("%s/beta_%d/Magnetization.txt" %(BASEDIR, b))
        Magn=(np.loadtxt(file_M, usecols=0, unpack=True))
        print(len(Magn))
        Half=int(0.75*len(Magn))
        Magn=np.array(Magn[Half:])
        print(len(Magn))
        M[b]=np.mean(Magn)
        N=Magn-np.sqrt(np.power(M[b],2))
        M2[b]=np.power(np.mean(np.power(N, 2)) ,2)
        M4[b]=np.mean(np.power(N, 4))
      
        U[b]=M4[b]/(3*M2[b])   

    ax1.plot(beta, M, '-', label=str(L[l]))
    ax2.plot(beta, U, '-', label=str(L[l]))

ax1.legend(loc='best')
ax1.grid(True)
ax1.set_xlabel(r'$\beta$')
ax1.set_ylabel(r'$m$')
ax2.grid(True)
ax2.set_xlabel(r'$\beta$')
ax2.set_ylabel(r'$U$')
plt.tight_layout()
plt.show()
