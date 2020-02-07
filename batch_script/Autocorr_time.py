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

#BASEDIR, nb= input("Insert the size L, the working folder and the number of temperatures: ").split()

BASEDIR=str(sys.argv[1])
nbeta=int(sys.argv[2])
b_low=float(sys.argv[3])
b_high=float(sys.argv[4])

beta=np.zeros((nbeta))

for b in range(nbeta):
    beta[b]=b_low +b*(b_high -b_low)/(nbeta-1)


Observables=["Energy", "Psi_density", "Dual_Stiffness"]

for name in range(len(Observables)):
    Obs_mean=np.zeros((nbeta))
    Obs_var=np.zeros((nbeta))
    for b in range(nbeta):
        fileO=("%s/beta_%d/%s.txt" %(BASEDIR, b, Observables[name]))
        if (Observables[name]=="Energy"):
            Obs=np.loadtxt(fileO, usecols=1, unpack=True)
        else:
            Obs=np.loadtxt(fileO, usecols=0, unpack=True)
        Obs_mean[b]=np.mean(Obs);
        Obs_var[b]=np.var(Obs);
        Obs_err=np.std(Obs, axis=0)/np.sqrt(len(Obs)-1)
        #A_Obs=acf(Obs, nlags=100, fft=False)
    plt.rc('text', usetex=True)
    plt.rc('font', family='serif')
    plt.rc('text.latex', preamble=r'\usepackage{bm}')
    fig, ((ax1, ax2)) = plt.subplots(2, 1)
    ax1.set_title("$%s$" %Observables[name])
    ax1.set_xlabel(r"$\beta$")
    ax1.set_ylabel(r"$\langle O(t) \rangle$")
    ax1.plot(beta, Obs_mean, 'ro-')
    ax1.errorbar(beta, Obs_mean,yerr=Obs_err, fmt='ro', linewidth=1.0)
    ax2.set_xlabel(r"$\beta$")
    ax2.set_ylabel(r"$\langle O(t)^2 \rangle - \langle O(t) \rangle^2$")
    ax2.plot(beta, Obs_var, 'o-')
    fig.tight_layout()
    plt.show()
#plt.savefig('%s/beta_%d/Check_M.png' %(BASEDIR, b))
#plt.close()
