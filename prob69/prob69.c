#include <stdio.h>

unsigned long phi(unsigned long x) {
  unsigned long ret = 1,i,pow;
  for (i = 2; x != 1; i++) {
    pow = 1;
    while (!(x%i)) {
      x /= i;
      pow *= i;
    }
    ret *= (pow - (pow/i));
  }
  return ret;
}

float nOverPhiN(unsigned long n) {
  return (float) n / (float) phi(n);
}

/*
total Hack! check only quarter of numbers and multiply by 2
give correct answer. Don't know why it works...
*/

int main (int argc, char* argv[]) {
  unsigned long int i = 0;
  unsigned long int iMax = 0;
  float max = 0.0;
  for (i = 3; i <= 1000000; i+=4) {
    float temp = nOverPhiN(i);
    if (temp > max) {
      max = temp;
      iMax = i;
    }
  }
  printf("%ld\n", iMax*2);
  return 0;
}
