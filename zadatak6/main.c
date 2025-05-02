// Mirsad Masic, zadatak6
#include <stdio.h>

double baz(float, double*, float, int);

int main() {
  double num = 18.1;
  printf("Rezultat je: %f\n", baz(88.5f, &num, 9.5f, 2));
  return 0;
}
