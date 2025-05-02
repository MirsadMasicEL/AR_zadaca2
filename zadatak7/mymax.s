.section .text
  .global mymax
mymax:
  # f12 = start
  addiu $t0, $0, 0 # t0 = i
  mtc1 $a3, $f2
  cvt.d.w $f2, $f2 # f2 = (double) size

loop:
  slt $t1, $t0, $a3
  beq $t1, $0, outloop
  
  sll $t2, $t0, 3
  addu $t2, $t2, $a2

  ldc1 $f4, ($t2) #f4 = nums[i] 
  c.lt.d $f12, $f4
  bc1f outif
  mov.d $f12, $f4

outif:
  addiu $t0, $t0, 1
  j loop
outloop:
  
  mov.d $f0, $f12
  jr $ra
