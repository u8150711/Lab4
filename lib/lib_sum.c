#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

struct SumArgs {
  int *array;
  int begin;
  int end;
};

int Sum(const struct SumArgs *args) {
  int sum = 0;
  for(int i = args->begin; i<args->end; i++)
  {
    //printf("elem %d: %d\n",i,args->array[i] % 100);
    sum += args->array[i];// % 100;
  }
  return sum;
}

void *ThreadSum(void *args) {
  struct SumArgs *sum_args = (struct SumArgs *)args;
  return (void *)(size_t)Sum(sum_args);
}
