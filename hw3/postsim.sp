* 4-bit ripple adder

.lib 'cic018.l' tt

.inc "adder.pex.sp"

***the 4-bit ripple adder***
Xadder S1 S2 S3 COUT S4 A1 VDD GND B1 CIN C1 A2 B2 C2 A3 C3 A4 B4 adder

***independent source***
VDD vdd 0 DC 1.8V
VSS gnd 0 DC 0V
* Input sources for A = 0001, B = 0001, Cin = 0
* PULSE ( V1 V2 Tdelay Trise Tfall Pwidth Period )
VA1 A1 0 PULSE(0V 1.8V 100ns 1ns 0ns 99ns 200ns)    
VA2 A2 0 DC 0V       
VA3 A3 0 DC 0V       
VA4 A4 0 DC 0V      

VB1 B1 0 PULSE(0V 1.8V 100ns 1ns 0ns 99ns 200ns)
VB2 B2 0 DC 0V       
VB3 B3 0 DC 0V       
VB4 B4 0 DC 0V       

VCin Cin 0 DC 0V     

.op
.option post

.tran 1n 1u

.probe v(S1) v(S2) v(S3) v(S4) v(Cout)

.end


