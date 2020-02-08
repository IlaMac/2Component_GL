import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
import sys
import os
import math
from statsmodels.graphics.tsaplots import plot_acf
import statsmodels.api as sm
from statsmodels.tsa.stattools import acf

beta_low=float(sys.argv[1])
beta_high=float(sys.argv[2])
nbeta=int(sys.argv[3])

beta=np.zeros((nbeta))
L=8
h=5.4

#Create an array of length nbeta for each observable A

BASEDIR=("/home/ilaria/Desktop/MultiComponents_SC/Output_2C/L%d_e0.5_h5.4_bmin%s_bmax%s" %(L, beta_low, beta_high))

#Files of the observables measured for each temperature
for b in range(nbeta):
    beta[b]=beta_low +b*((beta_high -beta_low)/(nbeta-1))
    if (beta[b]>=0.692):
        fileM=("%s/beta_%d/Magnetization.txt" %(BASEDIR, b))
        M=np.loadtxt(fileM, usecols=0, unpack=True)
        print(len(M))

        hist, bin_edges = np.histogram(M)
        PM = sm.nonparametric.KDEUnivariate(M)
        PM.fit()

        plt.rc('text', usetex=True)
        plt.rc('font', family='serif')
        plt.rc('text.latex', preamble=r'\usepackage{bm}')
        fig, ((ax1, ax2, ax3)) = plt.subplots(3, 1)
        ax1.set_title(r"$\beta=%lf$" %beta[b])
        ax1.set_xlabel("t")
        ax1.set_ylabel("M(t)")
        ax1.plot(M)
        ax2.set_xlabel("t")
        ax2.set_ylabel("$A_M(t)$")
        ax2.plot(acf(M,  nlags=100, fft=False), 'o-') 
        ax3.set_xlabel("M")
        ax3.set_ylabel("P(M)")
        ax3.hist(M, bins=20, density=True)
        ax3.plot(PM.support, PM.density)
        fig.tight_layout()
        plt.show()
#    plt.savefig('%s/beta_%d/Check_M.png' %(BASEDIR, b))
#    plt.close()
