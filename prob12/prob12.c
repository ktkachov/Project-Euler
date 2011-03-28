#include <stdio.h>

void populateFactors();

unsigned int *factorNums = NULL;
unsigned long long size = 1 << 20;


int main(int argc, char* argv[]) {
  unsigned long long triangleNum = 1;
  factorNums = (unsigned int*)calloc(size, sizeof(unsigned int));
  if (!factorNums) {
    printf("Could not allocate memory\n");
    exit(-1);
  }
  populateFactors();
  int i = 0;
  for (i = 0; i < 10; ++i) {
    printf("%d \n", factorNums[i]);
  }
  return 0;
}

void populateFactors() {
  unsigned long long i = 0;
  factorNums[0] = 1;
  factorNums[1] = 2;
  for (i = 2; i < size; ++i) {
    unsigned long long succI = i + 1;
    if (!(succI & 1)) {
      unsigned long iOver2 = i >> 1;
      unsigned int halfIndex = factorNums[iOver2];
      short inc = 1;
      if (!(iOver2 & 1)) {++inc;}
      factorNums[i] = halfIndex + inc;
    } else {
      unsigned long long j = 0;
      unsigned int facs = 2;
      for (j = 3; j < i / 2; j+=2) {
        if (!(i % j)) {
          ++facs;
        }
      }
      factorNums[i] = facs;
    }
  }
}
