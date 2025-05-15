* 4-bit ripple adder

***first 1-bit full adder***
.subckt adder A1 B1 A2 B2 A3 B3 A4 B4 Cin S1 S2 S3 S4 Cout vdd gnd
M1  D1  A1  vdd vdd P_18 l=0.18u w=2u m=1
M2  D1  B1  vdd vdd P_18 l=0.18u w=2u m=1
M3  D2  Cin D1  vdd P_18 l=0.18u w=2u m=1
M4  D2  Cin D3  gnd N_18 l=0.18u w=1u m=1
M5  D3  A1  gnd gnd N_18 l=0.18u w=1u m=1
M6  D3  B1  gnd gnd N_18 l=0.18u w=1u m=1
M7  D4  A1  vdd vdd P_18 l=0.18u w=2u m=1
M8  D2  B1  D4  vdd P_18 l=0.18u w=2u m=1
M9  D2  B1  D5  gnd N_18 l=0.18u w=1u m=1
M10 D5  A1  gnd gnd N_18 l=0.18u w=1u m=1
M11 D6  A1  vdd vdd P_18 l=0.18u w=2u m=1
M12 D6  B1  vdd vdd P_18 l=0.18u w=2u m=1
M13 D6  Cin vdd vdd P_18 l=0.18u w=2u m=1
M14 D7  D2  D6  vdd P_18 l=0.18u w=2u m=1
M15 D7  D2  D8  gnd N_18 l=0.18u w=1u m=1
M16 D8  A1  gnd gnd N_18 l=0.18u w=1u m=1
M17 D8  B1  gnd gnd N_18 l=0.18u w=1u m=1
M18 D8  Cin gnd gnd N_18 l=0.18u w=1u m=1
M19 D9  A1  vdd vdd P_18 l=0.18u w=2u m=1
M20 D10 B1  D9  vdd P_18 l=0.18u w=2u m=1
M21 D7  Cin D10 vdd P_18 l=0.18u w=2u m=1
M22 D7  Cin D11 gnd N_18 l=0.18u w=1u m=1
M23 D11 B1  D12 gnd N_18 l=0.18u w=1u m=1
M24 D12 A1  gnd gnd N_18 l=0.18u w=1u m=1
M25 C1  D2  vdd vdd P_18 l=0.18u w=2u m=1
M26 C1  D2  gnd gnd N_18 l=0.18u w=1u m=1
M27 S1  D7  vdd vdd P_18 l=0.18u w=2u m=1
M28 S1  D7  gnd gnd N_18 l=0.18u w=1u m=1

***second 1-bit full adder***
M29 E1  A2  vdd vdd P_18 l=0.18u w=2u m=1
M30 E1  B2  vdd vdd P_18 l=0.18u w=2u m=1
M31 E2  C1  E1  vdd P_18 l=0.18u w=2u m=1
M32 E2  C1  E3  gnd N_18 l=0.18u w=1u m=1
M33 E3  A2  gnd gnd N_18 l=0.18u w=1u m=1
M34 E3  B2  gnd gnd N_18 l=0.18u w=1u m=1
M35 E4  A2  vdd vdd P_18 l=0.18u w=2u m=1
M36 E2  B2  E4  vdd P_18 l=0.18u w=2u m=1
M37 E2  B2  E5  gnd N_18 l=0.18u w=1u m=1
M38 E5  A2  gnd gnd N_18 l=0.18u w=1u m=1
M39 E6  A2  vdd vdd P_18 l=0.18u w=2u m=1
M40 E6  B2  vdd vdd P_18 l=0.18u w=2u m=1
M41 E6  C1  vdd vdd P_18 l=0.18u w=2u m=1
M42 E7  E2  E6  vdd P_18 l=0.18u w=2u m=1
M43 E7  E2  E8  gnd N_18 l=0.18u w=1u m=1
M44 E8  A2  gnd gnd N_18 l=0.18u w=1u m=1
M45 E8  B2  gnd gnd N_18 l=0.18u w=1u m=1
M46 E8  C1  gnd gnd N_18 l=0.18u w=1u m=1
M47 E9  A2  vdd vdd P_18 l=0.18u w=2u m=1
M48 E10 B2  E9  vdd P_18 l=0.18u w=2u m=1
M49 E7  C1  E10 vdd P_18 l=0.18u w=2u m=1
M50 E7  C1  E11 gnd N_18 l=0.18u w=1u m=1
M51 E11 B2  E12 gnd N_18 l=0.18u w=1u m=1
M52 E12 A2  gnd gnd N_18 l=0.18u w=1u m=1
M53 C2  E2  vdd vdd P_18 l=0.18u w=2u m=1
M54 C2  E2  gnd gnd N_18 l=0.18u w=1u m=1
M55 S2  E7  vdd vdd P_18 l=0.18u w=2u m=1
M56 S2  E7  gnd gnd N_18 l=0.18u w=1u m=1

***third 1-bit full adder***
M57 F1  A3  vdd vdd P_18 l=0.18u w=2u m=1
M58 F1  B3  vdd vdd P_18 l=0.18u w=2u m=1
M59 F2  C2  F1  vdd P_18 l=0.18u w=2u m=1
M60 F2  C2  F3  gnd N_18 l=0.18u w=1u m=1
M61 F3  A3  gnd gnd N_18 l=0.18u w=1u m=1
M62 F3  B3  gnd gnd N_18 l=0.18u w=1u m=1
M63 F4  A3  vdd vdd P_18 l=0.18u w=2u m=1
M64 F2  B3  F4  vdd P_18 l=0.18u w=2u m=1
M65 F2  B3  F5  gnd N_18 l=0.18u w=1u m=1
M66 F5  A3  gnd gnd N_18 l=0.18u w=1u m=1
M67 F6  A3  vdd vdd P_18 l=0.18u w=2u m=1
M68 F6  B3  vdd vdd P_18 l=0.18u w=2u m=1
M69 F6  C2  vdd vdd P_18 l=0.18u w=2u m=1
M70 F7  F2  F6  vdd P_18 l=0.18u w=2u m=1
M71 F7  F2  F8  gnd N_18 l=0.18u w=1u m=1
M72 F8  A3  gnd gnd N_18 l=0.18u w=1u m=1
M73 F8  B3  gnd gnd N_18 l=0.18u w=1u m=1
M74 F8  C2  gnd gnd N_18 l=0.18u w=1u m=1
M75 F9  A3  vdd vdd P_18 l=0.18u w=2u m=1
M76 F10 B3  F9  vdd P_18 l=0.18u w=2u m=1
M77 F7  C2  F10 vdd P_18 l=0.18u w=2u m=1
M78 F7  C2  F11 gnd N_18 l=0.18u w=1u m=1
M79 F11 B3  F12 gnd N_18 l=0.18u w=1u m=1
M80 F12 A3  gnd gnd N_18 l=0.18u w=1u m=1
M81 C3  F2  vdd vdd P_18 l=0.18u w=2u m=1
M82 C3  F2  gnd gnd N_18 l=0.18u w=1u m=1
M83 S3  F7  vdd vdd P_18 l=0.18u w=2u m=1
M84 S3  F7  gnd gnd N_18 l=0.18u w=1u m=1

***fourth 1-bit full adder***
M85  G1   A4  vdd vdd P_18 l=0.18u w=2u m=1
M86  G1   B4  vdd vdd P_18 l=0.18u w=2u m=1
M87  G2   C3  G1  vdd P_18 l=0.18u w=2u m=1
M88  G2   C3  G3  gnd N_18 l=0.18u w=1u m=1
M89  G3   A4  gnd gnd N_18 l=0.18u w=1u m=1
M90  G3   B4  gnd gnd N_18 l=0.18u w=1u m=1
M91  G4   A4  vdd vdd P_18 l=0.18u w=2u m=1
M92  G2   B4  G4  vdd P_18 l=0.18u w=2u m=1
M93  G2   B4  G5  gnd N_18 l=0.18u w=1u m=1
M94  G5   A4  gnd gnd N_18 l=0.18u w=1u m=1
M95  G6   A4  vdd vdd P_18 l=0.18u w=2u m=1
M96  G6   B4  vdd vdd P_18 l=0.18u w=2u m=1
M97  G6   C3  vdd vdd P_18 l=0.18u w=2u m=1
M98  G7   G2  G6  vdd P_18 l=0.18u w=2u m=1
M99  G7   G2  G8  gnd N_18 l=0.18u w=1u m=1
M100 G8   A4  gnd gnd N_18 l=0.18u w=1u m=1
M101 G8   B4  gnd gnd N_18 l=0.18u w=1u m=1
M102 G8   C3  gnd gnd N_18 l=0.18u w=1u m=1
M103 G9   A4  vdd vdd P_18 l=0.18u w=2u m=1
M104 G10  B4  G9  vdd P_18 l=0.18u w=2u m=1
M105 G7   C3  G10 vdd P_18 l=0.18u w=2u m=1
M106 G7   C3  G11 gnd N_18 l=0.18u w=1u m=1
M107 G11  B4  G12 gnd N_18 l=0.18u w=1u m=1
M108 G12  A4  gnd gnd N_18 l=0.18u w=1u m=1
M109 Cout G2  vdd vdd P_18 l=0.18u w=2u m=1
M110 Cout G2  gnd gnd N_18 l=0.18u w=1u m=1
M111 S4   G7  vdd vdd P_18 l=0.18u w=2u m=1
M112 S4   G7  gnd gnd N_18 l=0.18u w=1u m=1

.ends
