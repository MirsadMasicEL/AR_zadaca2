// Mirsad Masic, zadatak1
.section .text
.globl foo
foo:
  addiu $sp, $sp, -32
  sw $ra, 16($sp)
  slti $t0, $a0, 2
  beq $t0, $0, first_else_if
  addiu $v0, $0, 0
  j leave_all
first_else_if:
  slti $t0, $a1, 3
  beq $t0, $0, second_if
  addiu $v0, $0, 1
  j leave_all
second_if:
  slt $t0, $a0, $a1
  beq $t0, $0, second_else
  sh $a0, 20($sp)
  addiu $a0, $a0, -1
  addiu $a1, $a1, -3
  jal foo
  lh $a0, 20($sp)
  addu $v0, $v0, $a0
  j leave_all
second_else:
  sh $a0, 20($sp)
  sh $a1, 24($sp)
  addiu $a0, $a0, -2
  addiu $a1, $a1, -1
  jal foo
  lh $a0, 20($sp)
  lh $a1, 24($sp)
  subu $a0, $a0, $a1
  addu $v0, $v0, $a0
leave_all:
  lw $ra, 16($sp)
  addiu $sp, $sp, 32
  jr $ra
