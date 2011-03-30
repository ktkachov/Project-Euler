int main(int argc, char* argv[]) {
  unsigned long step = 2;
  unsigned long sum = 1;
  unsigned long num = 1;
  int j = 0;
  for (j = 1; j < 1001; j+=2) {
    int i = 0;
    for (i = 0; i < 4; ++i) {
      num += step;
      sum += num;
    }
    step += 2;
  }
  printf("%ld\n", sum);
  return 0;
}
