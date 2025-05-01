// Mirsad Masic, zadatak4
.section .text
.globl bar
bar:
  // f1 je u $f12, f2 u $f14, a d1 je u ($a2 i $a3)
  // f1 < f2 ?
  c.lt.s $f12, $f14
  bc1f else_if
  // ucitaj 2.f
  addiu $t0, $0, 2
  mtc1 $t0, $f0
  cvt.s.w $f0, $f0
  // ceil(f1)
  ceil.w.s $f4, $f12
  cvt.s.w $f4, $f4
  // 2.f * ceil(f1)
  mul.s $f0, $f0, $f4
  // floor(f2)
  round.w.s $f4, $f14
  cvt.s.w $f4, $f4
  // 2.f * ceil(f1) - round(f2)
  sub.s $f0, $f0, $f4
  // trunc(d1)
  mtc1 $a2, $f4
  mtc1 $a3, $f5
  trunc.w.d $f4, $f4
  cvt.s.w $f4, $f4
  // 2.f * ceil(f1) - round(f2) + trunc(d1)
  add.s $f0, $f0, $f4
  jr $ra
else_if:
  // f1 == f2 ?
  c.eq.s $f12, $f14
  bc1f leave_if
  // ceil(f1)
  ceil.w.s $f0, $f12
  cvt.s.w $f0, $f0
  // floor(f2)
  floor.w.s $f4, $f14
  cvt.s.w $f4, $f4
  // ceil(f1) - floor(f2)
  sub.s $f0, $f0, $f4
  // trunc(d1)
  mtc1 $a2, $f4
  mtc1 $a3, $f5
  trunc.w.d $f4, $f4
  cvt.s.w $f4, $f4
  // ceil(f1) - floor(f2) + trunc(d1)
  add.s $f0, $f0, $f4
  jr $ra
leave_if:
  // return float(d1)
  mtc1 $a2, $f0
  mtc1 $a3, $f1
  cvt.s.d $f0, $f0
  jr $ra
