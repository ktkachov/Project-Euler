#include <stdio.h>


inline int isPrime(unsigned long long n) {
  if (n % 2 == 0) {
    return 0;
  }
  float sqrtn = sqrt(n);
  unsigned long long i = 3;
  while (i <= sqrtn) {
    if (n % i == 0) {
      return 0;
    }
    i += 2;
  }
  return 1;
}

int main(int argc, char* argv[]) {
  unsigned long long step = 2;
  unsigned long long size = 1;
  float ratio = 1.0;
  unsigned long long num = 1;
  unsigned long long numPrimes = 0;
  unsigned long long numElems = 1;
  while (ratio >= 0.1) {
    int j = 0;
    for (j = 0; j < 4; ++j) {
      num += step;
      ++numElems;
      if (isPrime(num)) {
        ++numPrimes;
      }
    }
    size += 2;
    step += 2;
    ratio = (float) numPrimes / (float) numElems;
  }
  printf("%lld\n", size);
  return 0;
}
