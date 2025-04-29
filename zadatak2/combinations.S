// Mirsad Masic, zadatak2
.section .data
d:
  .word 0
.section .text
.globl combinations
combinations:
  addiu $sp, $sp, -32
  sw $ra, 16($sp)
  sw $a0, 20($sp)
  sw $a1, 24($sp)
  sw $a2, 28($sp)
  addiu $a0, $a2, 0
  jal malloc
  la $t0, d
  sw $v0, ($t0)
  lw $a0, 20($sp)
  lw $a1, 28($sp)
  lw $a2, 24($sp)
  lw $a3, 28($sp)
  jal combinations_impl
  lw $ra, 16($sp)
  addiu $sp, $sp, 32
  jr $ra

combinations_impl:
  addiu $sp, $sp, -40
  sw $ra, 16($sp)
  sw $a0, 20($sp)
  sw $a1, 24($sp)
  sw $a2, 28($sp)
  sw $a3, 32($sp)
  bne $a3, $0, leave_if
  addiu $a0, $a1, 0
  jal print_comb
  j leave_combinations_impl_for
leave_if:
  // i = 0
  addiu $t0, $0, 0
combinations_impl_for:
  // vracanje argumenata u registre
  lw $a0, 20($sp)
  lw $a1, 24($sp)
  lw $a2, 28($sp)
  lw $a3, 32($sp)
  slt $t1, $t0, $a2
  beq $t1, $0, leave_combinations_impl_for
  subu $t1, $a1, $a3
  la $t2, d
  lw $t2, ($t2)
  addu $t2, $t2, $t1
  addu $t3, $a0, $t0
  lb $t3, ($t3)
  sb $t3, ($t2)
  addiu $a3, $a3, -1
  sw $t0, 36($sp)
  jal combinations_impl
  lw $t0, 36($sp)
  addiu $t0, $t0, 1
  j combinations_impl_for
leave_combinations_impl_for:
  lw $ra, 16($sp)
  addiu $sp, $sp, 40
  jr $ra

.section .rodata
arg1:
  .asciiz "%c"
arg2:
  .asciiz "\n"
.section .text
.globl print_comb
print_comb:
  addiu $sp, $sp, -40
  sw $ra, 16($sp)
  sw $a0, 20($sp)
  la $t0, arg1
  sw $t0, 24($sp)
  la $t0, arg2
  sw $t0, 28($sp)
  addiu $t0, $0, 0
print_comb_for:
  lw $a0, 20($sp)
  slt $t1, $t0, $a0
  beq $t1, $0, leave_print_comb_for
  lw $a0, 24($sp)
  la $t1, d
  lw $t1, ($t1)
  addu $a1, $t1, $t0 
  lb $a1, ($a1)
  sw $t0, 32($sp)
  jal printf
  lw $t0, 32($sp)
  addiu $t0, $t0, 1
  j print_comb_for
leave_print_comb_for:
  lw $a0, 28($sp)
  jal printf
  lw $ra, 16($sp)
  addiu $sp, $sp, 40
  jr $ra
