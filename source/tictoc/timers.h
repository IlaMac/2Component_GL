#pragma once
#include "class_tic_toc.h"
namespace prof {
  inline class_tic_toc t_total = class_tic_toc(true,5,"Total time");
  inline class_tic_toc t_swap = class_tic_toc(true,5,"Parallel Temp time");;
  inline class_tic_toc t_update  = class_tic_toc(true,5,"Metropolis time");;
  inline class_tic_toc t_measures  = class_tic_toc(true,5,"Measurements time");;
  inline class_tic_toc t_writing  = class_tic_toc(true,5,"Writing on a file time");;

  inline void print_all_times(){
    t_total.print_time();
    t_swap.print_time();
    t_update.print_time();
    t_measures.print_time();
    t_writing.print_time();
  }

  inline void print_all_times_w_percent(){
        t_total.print_time_w_percent();
        t_swap.print_time_w_percent();
        t_update.print_time_w_percent();
        t_measures.print_time_w_percent();
        t_writing.print_time_w_percent();
  }

}

