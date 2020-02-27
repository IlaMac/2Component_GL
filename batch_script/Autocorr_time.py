import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
import sys
import os
import math
from statsmodels.graphics.tsaplots import plot_acf
import statsmodels.api as sm
from statsmodels.tsa.stattools import acf
import scipy.integrate as integrate


beta_low=float(sys.argv[1])
beta_high=float(sys.argv[2])
nbeta=int(sys.argv[3])
h=float(sys.argv[4])
e=sys.argv[5]

beta=np.zeros((nbeta))
if( (h).is_integer()): h=int(h)

L=np.array([8, 10, 12, 16])

Observables=["Energy", "Magnetization", "Dual_Stiffness"]

plt.rc('text', usetex=True)
plt.rc('font', family='serif')
plt.rc('text.latex', preamble=r'\usepackage{bm}')

tau=np.zeros((nbeta, 3))
tau_max=0
for l in range(len(L)):
    BASEDIR=("/home/ilaria/Desktop/MultiComponents_SC/Output_2C/L%d_e%s_h%s_bmin%s_bmax%s" %(L[l], e,  h, beta_low, beta_high))

    fig, ax1 = plt.subplots(1, 1)
    ax1.set_title(r"$L=%s$" %L[l])
    ax1.set_xlabel(r"$\beta$")
    ax1.set_ylabel(r"$\tau$")

    for b in range(nbeta):
        beta[b]=beta_low +b*(beta_high -beta_low)/(nbeta-1)

        for name in range(len(Observables)):
            Obs_mean=np.zeros((nbeta))
            Obs_var=np.zeros((nbeta))
            fileO=("%s/beta_%d/%s.npy" %(BASEDIR, b, Observables[name]))
            Obs=np.load(fileO)
            A_Obs=acf(Obs, nlags=100, fft=True)
            tau[b, name]=0.5*np.sum(A_Obs)
            temp_taumax=np.amax(tau)
            if(temp_taumax > tau_max): tau_max=temp_taumax


    ax1.plot(beta, tau[:,0], "-", label="$%s$" %Observables[0])
    ax1.plot(beta, tau[:,1], "-", label="$%s$" %Observables[1])
    ax1.plot(beta, tau[:,2], "-", label="$%s$" %Observables[2])
    ax1.annotate(r' $\tau_{MAX}=%s$' %np.amax(tau), xy=(0.05, 0.85), xycoords='axes fraction', bbox=dict(boxstyle="round", edgecolor='orange', fc="w"))
    ax1.legend(loc="best")
#    plt.show()
    plt.savefig('%s/tau_L%s.png' %(BASEDIR, L[l]))

print(tau_max)
