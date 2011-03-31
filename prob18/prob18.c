#include <stdio.h>

unsigned int nums[15][15];

inline unsigned int max(unsigned int a, unsigned int b) {
  return a > b ? a : b;
}

unsigned int maxSum(int level, int index) {
  if (level == 14) {
    return max(nums[level][index], nums[level][index+1]);
  }
  return nums[level][index] + max(maxSum(level+1, index), maxSum(level+1, index+1));
  
}



int main(int argc, char* argv[]) {
  int i = 0;
  for (i = 1; i < 16; ++i) {
    int j = 0;
    for (j = 0; j < i; ++j) {
      int res = scanf("%u",&nums[i-1][j]);
    }    
  }
  printf("%u\n", maxSum(0,0));
/*
  for (i = 1; i < 16; ++i) {
    int j = 0;
    for (j = 0; j < i; ++j) {
      printf("%d ", nums[i-1][j]);
    }
    printf("\n");
  }
*/
  return 0;
}
