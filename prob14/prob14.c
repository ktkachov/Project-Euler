#include <stdio.h>

int main(int argc, char* argv[]) {
  unsigned long long i = 1;
  unsigned long long n = 0;
  unsigned long long maxI = 0;
  unsigned long long maxL = 0;
  for (i = 1; i < 1000000; ++i) {
    n = i;
    unsigned long long length = 0;
    while (n != 1) {
      if (n & 1) {
        n = 3 * n + 1;
      } else {
        n >>= 1;
      }
      ++length;
    }
    if (length > maxL) {
      maxL = length;
      maxI = i;
    }
  }
  printf("%lld\n", maxI);
}
