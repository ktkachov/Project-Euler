#include <stdio.h>

int main(int argc, char* argv[]) {
  unsigned long long c = 1;
  unsigned long long ePrime = 0;
  unsigned long long e = 7830457;
  unsigned long long m = 10000000000;
  while (ePrime++ < e) {
    c = (2 * c) % m;
  }

  unsigned long long temp = (c * 28433) % m;
  temp = temp + 1;
  printf("%lld\n", temp);
  
}
