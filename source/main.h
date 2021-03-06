
#ifndef MAIN_H
#define MAIN_H
#include<cstdio>
#include<cmath>
#include<cstdlib>
#include <iostream>
#include <fstream>
#include <random>
#include "o2.h"
#include "montecarlo.h"
#include "initialization.h"
#include "robust_filesystem.h"
#include <mpi.h>
#include "rng.h"
//#include <h5pp/h5pp.h>


//#define Lx 8
//#define Ly 8
//#define Lz 8
//
//#define N (Lx*Ly*Lz)

#define NC 2 /*Number of components*/

extern unsigned int Lx, Ly, Lz, N;

void mainloop(struct Node* Site, struct MC_parameters &MCp, struct H_parameters &Hp, double &my_beta, int &my_ind, struct PT_parameters PTp, struct PTroot_parameters PTroot, std::string directory_parameters);
void parallel_temp(double &my_E , double &my_beta,  int &my_ind, struct PT_parameters &PTp, struct PTroot_parameters &PTroot);
unsigned int nn(unsigned int i, unsigned int coord, int dir);
void myhelp(int argd, char** argu);
#endif
