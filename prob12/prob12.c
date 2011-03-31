#include <stdio.h>

int numDivisors(unsigned long long);

int main(int argc, char* argv[]) {
  unsigned long long trNum = 1;
  unsigned long long count = 2;
  while (1) {
    trNum = trNum + count++;
    if (numDivisors(trNum) > 500) {
      printf("%lld\n", trNum);
      return 0;
    }
  }
  return 0;
}

inline int numDivisors(unsigned long long n) {
  unsigned long long i = 0;
  unsigned int facs = 2;
  for (i = 2; i <= n>>1; ++i) {
    if (n % i == 0) {
      ++facs;
    }
  } 
  return facs;
}
