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
h=float(sys.argv[4])
e=sys.argv[5]

beta=np.zeros((nbeta))
if( (h).is_integer()): h=int(h)


L=np.array([8, 10, 12, 16])

Psi1=np.zeros((nbeta))
Psi2=np.zeros((nbeta))

BASEDIR=("/home/ilaria/Desktop/MultiComponents_SC/Output_2C/L8_e0.5_h5.4_bmin0.15_bmax0.25")


fig, ((ax1, ax2))= plt.subplots(2, 1)
plt.rc('text', usetex=True)
plt.rc('font', family='serif', size='18')
plt.rc('text.latex', preamble=r'\usepackage{bm}')

for l in range(len(L)):

    BASEDIR=("/home/ilaria/Desktop/MultiComponents_SC/Output_2C/L%d_e%s_h%s_bmin%s_bmax%s" %(L[l], e, h, beta_low, beta_high))

    for b in range(nbeta):
        beta[b]=beta_low +b*((beta_high-beta_low)/(nbeta-1))
        file_Psi=("%s/beta_%d/Psi_density.npy" %(BASEDIR, b))
        psi=np.load(file_Psi)
        Psi1[b]=np.mean(psi[:,0])
        Psi2[b]=np.mean(psi[:,1])

    ax1.plot(beta, Psi1, '-')
    ax2.plot(beta, Psi2, '-')

ax1.set_xlabel(r'$\beta$')
ax1.set_ylabel(r'$|\Psi_1|$')
ax2.set_xlabel(r'$\beta$')
ax2.set_ylabel(r'$|\Psi_2|$')
#plt.subplots_adjust(top=0.964,bottom=0.115,left=0.076,right=0.98,hspace=0.14,wspace=0.4)
plt.tight_layout()
plt.show()
