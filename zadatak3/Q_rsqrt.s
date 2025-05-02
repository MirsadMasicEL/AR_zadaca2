#hena husicic :))

.section .rodata
threehalfs: 
  .float 1.5

half: 
  .float 0.5

.section .data
y:
  .float 0
i:
  .word 0

.section .text
.global Q_rsqrt
Q_rsqrt:
  la $t0, half
  lwc1 $f6, ($t0) #f6 = 0.5 
  mul.s $f6, $f6, $f12 #f6 = x2
  la $t0, y
  swc1 $f12, ($t0) # y = number

  la $t2, i
  lw $t0, ($t0) #t0 = i


  lui $t1, 0x5f37
  ori $t1, $t1, 0x59df
  srl $t0, $t0, 1
  sub $t0, $t1, $t0
  sw $t0, ($t2)  #t0 = i

  lwc1 $f7, ($t2)
  la $t3, y
  swc1 $f7, ($t3) #f7 = y

  la $t4, threehalfs
  lwc1 $f8, ($t4)

  mul.s $f6, $f6, $f7
  mul.s $f6, $f6, $f7
  sub.s $f6, $f8, $f6
  mul.s $f6, $f6, $f7 #f6 = y

  add.s $f0, $0, $f6
  jr $ra
  


  

  
