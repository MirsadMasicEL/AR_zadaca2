#include <stdio.h>

int foo(double d1, float f1, float f2);

int main() {
 printf("%d \n", foo(18.1, 0.2, 10.9));
 printf("%d \n", foo(10.3, 50.2, 10.3));
 printf("%d \n", foo(7.9, 7.9, 50.3));
 printf("%d \n", foo(8.7, 56, 50.3));
}
