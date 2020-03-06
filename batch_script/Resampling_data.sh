#!/bin/bash

################# This script computes for a set of L (the array is defined in the .py files): ####################################
#	-the maximum transient time among all the observables
#	-the maximum autocorrelation time among all the observables
#	-Given these two times it perform a bootstrap resampling to compute the mean value and the variance of the observables 
###################################################################################################################################



############# Parameters of the Hamiltonian ##################
H_e=0.5
H_h=7
H_blow=0.45
H_bhigh=0.6

nbeta=64

#LList="\"[[8] [10]]\""

LList=("8" "10")

BASEDIR="/home/ilaria/Desktop/MultiComponents_SC/Output_2C"

transient_time=$(python3 LogBoxing.py ${H_blow} ${H_bhigh} ${nbeta} ${H_h} ${H_e} ${LList[@]}) 
echo ${transient_time} > ${BASEDIR}/transient_time_e${H_e}_h${H_h}_bmin${H_blow}_bmax${H_bhigh}.txt

tau_max=$(python3 Autocorr_time.py ${H_blow} ${H_bhigh} ${nbeta} ${H_h} ${H_e} ${LList[@]})
echo ${tau_max} > ${BASEDIR}/tau_max_e${H_e}_h${H_h}_bmin${H_blow}_bmax${H_bhigh}.txt

python3 Bootstrap_Energy.py ${H_blow} ${H_bhigh} ${nbeta} ${H_h} ${H_e} ${transient_time} ${tau_max} ${LList[@]}
python3 Bootstrap_Magnetization.py ${H_blow} ${H_bhigh} ${nbeta} ${H_h} ${H_e} ${transient_time} ${tau_max} ${LList[@]}
python3 Bootstrap_DualStiffness.py ${H_blow} ${H_bhigh} ${nbeta} ${H_h} ${H_e} ${transient_time} ${tau_max} ${LList[@]}
python3 Bootstrap_PsiDensity.py ${H_blow} ${H_bhigh} ${nbeta} ${H_h} ${H_e} ${transient_time} ${tau_max} ${LList[@]}
