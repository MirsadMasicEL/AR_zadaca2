// Mirsad Masic, zadatak8
.section .text
roundToTick:
  // $f4 = *p
  ldc1 $f4, ($a0)
  // $f6 = (double)precision
  mtc1 $a1, $f6
  cvt.d.w $f6, $f6
  // $t0 = r => $f4 = (double)r
  mul.d $f4, $f4, $f6
  trunc.w.d $f8, $f4
  // double(r)
  cvt.d.w $f8, $f8
  // *p
  div.d $f4, $f8, $f6
  // *p = ...
  sdc1 $f4, ($a0)
  jr $ra
.section .rodata
.align 3
return1:
  .double 0.001
return2:
  .double 0.01
return3:
  .double 0.1
.section .text
getTick:
  // ucitaj 0. (implicitna konverzija 0 u 0.)
  // $f4 = 0.
  addiu $t0, $0, 0
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  // num == 0 ?
  c.eq.d $f12, $f4
  bc1f second_if
  mov.d $f0, $f12
  jr $ra
second_if:
  // $f4 = 10
  addiu $t0, $0, 10
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  // num < 10 ?
  c.lt.d $f12, $f4
  bc1f third_if
  // return 0.001
  l.d $f0, return1
  jr $ra
third_if:
  // $f4 = 100
  addiu $t0, $0, 100
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  // num < 100
  c.lt.d $f12, $f4
  bc1f forth_if
  // return 0.01
  l.d $f0, return2
  jr $ra
forth_if:
  // $f4 = 1000
  addiu $t0, $0, 1000
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  // num < 1000
  c.lt.d $f12, $f4
  bc1f finalReturn
  // return 0.1
  l.d $f0, return3
  jr $ra
finalReturn:
  addiu $t0, $0, 1
  mtc1 $t0, $f0
  cvt.d.w $f0, $f0
  jr $ra
.globl calculateAmount
calculateAmount:
  addiu $sp, $sp, -16
  sw $ra, 12($sp)
  sw $a2, 8($sp)
  sdc1 $f12, ($sp)
  // getTick(price)
  jal getTick
  // ucitaj &price u $a0
  addu $a0, $sp, $0
  // ucitaj 1
  addiu $t0, $0, 1
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  // 1. / getTick(price)
  div.d $f4, $f4, $f0
  // ucitaj rezultat kao int u $a1
  trunc.w.d $f4, $f4
  mfc1 $a1, $f4
  // roundToTick()
  jal roundToTick
  // vrati sa stack-a i vrati stack
  lw $ra, 12($sp)
  lw $t0, 8($sp)
  ldc1 $f0, ($sp)
  addiu $sp, $sp, 16
  // $f4 = (double)quantity
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  // return price * quantity
  mul.d $f0, $f0, $f4
  jr $ra
