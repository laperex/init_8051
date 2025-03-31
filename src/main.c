#include <at89x52.h>

#ifndef SDCC
	#define __xdata
	#define __idata
	#define __code
	#define __interrupt
#endif

#define LED P0

void main() {
  LED = 0;

  while (1) {
    LED = (LED == 0) ? 1: 0;
  }
}
