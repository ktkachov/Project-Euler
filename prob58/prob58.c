#include <stdio.h>


int main(int argc, char* argv[]) {

  unsigned long long nPrimes = 1000000000;
  unsigned long long i = 0;
  unsigned long long step = 2;
  unsigned long long size = 1;
  float ratio = 1.0;
  unsigned long long num = 1;
  unsigned long long numPrimes = 0;
  unsigned long long numElems = 1;
  short* candidates = (short*)calloc(nPrimes, sizeof(short));
  if (!candidates) {
    printf("failed to allocate memory\n");
    exit(-1);
  }
  /*
    Perform sieve of Eratosthenes to filter the primes
  */
  unsigned long long p = 2;
  while (p*p < nPrimes) {
    unsigned long long k = 0;
    for (k = p * p; k < nPrimes; k+=p) {
      candidates[k] = 1;
    }
    while (candidates[++p] != 0)
     ;
  }

  while (ratio >= 0.1) {
    int j = 0;
    for (j = 0; j < 4; ++j) {
      num += step;
      ++numElems;
      if (!candidates[num]) {
        ++numPrimes;
      }
    }
    size += 2;
    step += 2;
    ratio = (float) numPrimes / (float) numElems;
  }
  free(candidates);
  printf("%lld\n", size);
  return 0;
}
