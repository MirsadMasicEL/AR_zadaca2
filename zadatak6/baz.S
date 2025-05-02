// Mirsad Masic, zadatak6
.section .text
.globl baz
baz:
  // $f8 = f2
  mtc1 $a2, $f8
  // $f16 = *p1
  ldc1 $f16, ($a1)
  // $f10 = 0
  mtc1 $0, $f10
  cvt.d.w $f10, $f10
  // *p1 == 0 ?
  c.eq.d $f16, $f10
  // $f6 = (float)n
  mtc1 $a3, $f6
  cvt.s.w $f6, $f6
  bc1t first_if_body
  // f1 + f2
  add.s $f4, $f12, $f8
  // f1 + f2 < (float)n ?
  c.lt.s $f4, $f6
  bc1f second_if
first_if_body:
  // f2 * (float)n
  mul.s $f0, $f8, $f6
  add.s $f0, $f12, $f0
  cvt.d.s $f0, $f0
  jr $ra
second_if:
  c.eq.d $f16, $f10
  bc1t lastReturn
  mul.s $f0, $f8, $f6
  sub.s $f0, $f12, $f0
  cvt.s.d $f16, $f16
  div.s $f0, $f0, $f16
  cvt.d.s $f0, $f0
  jr $ra
lastReturn:
  cvt.s.d $f16, $f16
  mul.s $f0, $f12, $f16
  add.s $f0, $f0, $f6
  add.s $f0, $f0, $f8
  cvt.d.s $f0, $f0
  jr $ra
