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
L=12
h=5.4

#Create an array of length nbeta for each observable A

BASEDIR=("/home/ilaria/Desktop/MultiComponents_SC/Output_2C/L%d_e0.5_h5.4_bmin%s_bmax%s" %(L, beta_low, beta_high))

#Files of the observables measured for each temperature
for b in range(nbeta):
    beta[b]=beta_low +b*((beta_high -beta_low)/(nbeta-1))
    if ((beta[b]>=0.7103) and (beta[b]<0.7105)):
        fileM=("%s/beta_%d/Magnetization.txt" %(BASEDIR, b))
        M=np.loadtxt(fileM, usecols=0, unpack=True)
        Half=int(0.5*(len(M)))
        N1=M[:Half]
        N2=M[Half:]
        hist, bin_edges = np.histogram(M)
        PM = sm.nonparametric.KDEUnivariate(M)
        PM.fit()
        PN1=sm.nonparametric.KDEUnivariate(N1)
        PN1.fit()
        PN2=sm.nonparametric.KDEUnivariate(N2)
        PN2.fit()

        plt.rc('text', usetex=True)
        plt.rc('font', family='serif')
        plt.rc('text.latex', preamble=r'\usepackage{bm}')
        fig, ((ax1, ax2, ax3, ax4, ax5)) = plt.subplots(5, 1)
        ax1.set_title(r"$\beta=%lf$" %beta[b])
        ax1.set_xlabel("t")
        ax1.set_ylabel("M(t)")
        ax1.plot(M)
        ax2.set_xlabel("t")
        ax2.set_ylabel("$A_M(t)$")
        #check the mining fft=True or False in this case
        ax2.plot(acf(M,  nlags=100, fft=True), 'o-') 
        ax3.set_xlabel("M")
        ax3.set_ylabel("P(M)")
        ax3.hist(M, bins=80, density=True)
        ax3.plot(PM.support, PM.density)
        ax4.set_xlabel("M1")
        ax4.set_ylabel("P(M1)")
        ax4.hist(N1, bins=80, density=True)
        ax4.plot(PN1.support, PN1.density)
        ax5.set_xlabel("M2")
        ax5.set_ylabel("P(M2)")
        ax5.hist(N2, bins=80, density=True)
        ax5.plot(PN2.support, PN2.density)
        fig.tight_layout()
        plt.show()
#    plt.savefig('%s/beta_%d/Check_M.png' %(BASEDIR, b))
#    plt.close()
