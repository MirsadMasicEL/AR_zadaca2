// Mirsad Masic, zadatak4
#include <stdio.h>

float bar(float, float, double);

int main() {
  float num = bar(1.5f, 2.6f, 3.0);
  // ocekivano 4
  printf("Rezultat f-je je: %f\n", num);
  num = bar(1.7f, 1.7f, 5.8);
  // ocekivano 6
  printf("Rezultat f-je je: %f\n", num);
  num = bar(2.3f, 1.1f, 82.7);
  // ocekivano 82.7
  printf("Rezultat f-je je: %f\n", num);
  return 0;
}
