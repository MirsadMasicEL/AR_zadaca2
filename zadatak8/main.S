// Mirsad Masic, zadatak8
.section .rodata
.align 3
i:
  .double 3.451748
limit:
  .double 4000.
ten:
  .double 10.
arg:
  .asciiz "Amount(%f, 307) = %f\n"
.section .text
.globl main
main:
  addiu $sp, $sp, -40
  sw $ra, 32($sp)
  l.d $f12, i
  l.d $f6, limit
for:
  c.lt.d $f12, $f6
  bc1f leave_for
  sdc1 $f12, 24($sp)
  addiu $a2, $0, 307
  jal calculateAmount
  la $a0, arg
  mfc1 $a2, $f12
  mfc1 $a3, $f13
  sdc1 $f0, 16($sp)
  jal printf
  ldc1 $f12, 24($sp)
  l.d $f8, ten
  mul.d $f12, $f12, $f8
  l.d $f6, limit
  j for
leave_for:
  lw $ra, 32($sp)
  addiu $sp, $sp, 40
  addiu $v0, $0, 0
  jr $ra
