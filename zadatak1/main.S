// Mirsad Masic, zadatak1
.section .rodata
.globl arg
arg:
  .asciiz "foo(%d, %d), %hd\n"
.section .text
.globl main
main:
  addiu $sp, $sp, -32
  sw $ra, 16($sp)
  // i = 2
  addiu $t0, $0, 2
for1_cond:
  // i < 6 ?
  slti $t1, $t0, 6
  beq $t1, $0, leave_for1
  // j = 3
  addiu $t1, $0, 3
for2_cond:
  // j < 7 ?
  slti $t2, $t1, 7
  beq $t2, $0, leave_for2
  // spremi i, j na stack zbog poziva funkcija
  sw $t0, 20($sp)
  sw $t1, 24($sp)
  addiu $a0, $t0, 0
  addiu $a1, $t1, 0
  jal foo
  // vrati i, j sa stack-a zbog poziva f-je
  lw $t0, 20($sp)
  lw $t1, 24($sp)
  // prvi argument printf-a je const char *, odnosno ptr na prvi char niza
  lui $a0, %hi(arg)
  ori $a0, $a0, %lo(arg)
  // drugi argument je i
  addu $a1, $t0, $0
  // treci argument je j
  addu $a2, $t1, $0
  // cetvrti argument je povratna vrijednost f-je foo
  addiu $a3, $v0, 0
  jal printf
  // vrati i, j sa stack-a zbog poziva f-je
  lw $t0, 20($sp)
  lw $t1, 24($sp)
  // povecaj j, te se vrati na uslov for-a
  addiu $t1, $t1, 1
  j for2_cond
leave_for2:
  // povecaj i, te se vrati na uslov for-a
  addiu $t0, $t0, 1
  j for1_cond
leave_for1:
  lw $ra, 16($sp)
  addiu $sp, $sp, 32
  jr $ra
