.section .rodata
nums:
  .double 1., 5.7, 9.4, 14.8, 7.1, 8.2, 10.5

print:
  .asciiz "MyMax: %f\n"

.section .data
size:
  .word 7

.section .text
  .global main
main:
  addiu $sp, $sp, -24
  sw $ra, 20($sp)

  la $t0, nums
  ldc1 $f12, ($t0)

  addiu $a2, $t0, 0

  la $t0, size
  lw $t0, ($t0)

  addiu $a3, $t0, 0

  jal mymax

  mfc1 $a2, $f0
  mfc1 $a3, $f1

  la $a0, print

  jal printf

  lw $ra, 20($sp)
  addiu $sp, $sp, 24
  addiu $v0, $0, 0
  jr  $ra


