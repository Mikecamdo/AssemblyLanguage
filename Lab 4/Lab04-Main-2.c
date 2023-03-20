#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern uint32_t ufunc(uint32_t,uint32_t);
extern int32_t sfunc(int32_t,int32_t);

int main(void) {
  int32_t sa,sb,sr;
  uint32_t ua,ub,ur;

  InitializeHardware(HEADER,"Shift, Multiply, and Divide");
  ua = 368;  // Complete this assignment statement
  ub = 42;  // Complete this assignment statement
  ur = ufunc(ua,ub);
  printf("ufunc() return value =\n  (decimal) %lu\n  (hex) 0x%08lX\n",ur,ur);
  sa = -368;  // Complete this assignment statement
  sb = -42;  // Complete this assignment statement
  sr = sfunc(sa,sb);
  printf("sfunc() return value =\n  (decimal) %ld\n  (hex) 0x%08lX\n",sr,sr);
}
