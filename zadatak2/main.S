// Mirsad Masic, zadatak2
.section .rodata
set:
  .asciiz "ab"
.section .text
.globl main
main:
  addiu $sp, $sp, -24
  sw $ra, 16($sp)
  la $a0, set
  addiu $a1, $0, 2
  addiu $a2, $0, 3
  jal combinations
  lw $ra, 16($sp)
  addiu $sp, $sp, 24
  addiu $v0, $0, 0
  jr $ra
