#pragma once
#include "class_tic_toc.h"
namespace prof {
  class_tic_toc t_total = class_tic_toc(true,5,"Total time");
  class_tic_toc t_swap;
  class_tic_toc t_update;

  void print_all_times(){
    t_total.print_time();
    t_swap.print_time();
    t_update.print_time();
  }
}

