<Qucs Schematic 2.0.0>
<Properties>
  <View=-40,-14,1147,778,0.826446,9,28>
  <Grid=10,10,1>
  <DataSet=sim_n_cd4069.dat>
  <DataDisplay=sim_n_cd4069.dpl>
  <OpenDisplay=1>
  <Script=sim_n_cd4069.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.ID -20 -16 SUB>
  <Line -20 20 40 0 #000080 2 1>
  <Line 20 20 0 -40 #000080 2 1>
  <Line -20 -20 40 0 #000080 2 1>
  <Line -20 20 0 -40 #000080 2 1>
</Symbol>
<Components>
  <GND * 1 640 250 0 0 0 0>
  <GND * 1 40 270 0 0 0 0>
  <Vdc V1 1 40 200 18 -26 0 1 "5" 1>
  <GND * 1 130 270 0 0 0 0>
  <R Rgen 1 190 170 -26 -51 1 0 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <SPICEINIT SPICEINIT1 1 310 260 -30 16 0 0 " set ngbehavior=ltpsa" 1>
  <SpLib X1 1 450 200 -29 -164 1 2 "/home/alejandro/.qucs/user_lib/CD4069UB.lib" 0 "CD4069UB" 1 "auto" 1 "" 1>
  <GND * 1 380 240 0 0 0 0>
  <R R_out 1 600 170 -26 -51 0 2 "10k Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <IProbe out 1 510 170 -26 16 0 0>
  <R R_in 1 280 170 -26 -51 0 2 "10kOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <IProbe in 1 370 170 -26 16 0 0>
  <Vrect V2 1 130 240 18 -26 0 1 "5V" 1 "1 ms" 1 "1 ms" 1 "10 ns" 0 "10 ns" 0 "0 ns" 0>
  <.TR TR1 1 670 120 0 65 0 0 "lin" 1 "0" 1 "5 ms" 1 "200" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
</Components>
<Wires>
  <40 230 40 270 "" 0 0 0 "">
  <40 140 40 170 "" 0 0 0 "">
  <130 170 130 210 "" 0 0 0 "">
  <130 170 160 170 "" 0 0 0 "">
  <380 230 420 230 "" 0 0 0 "">
  <380 230 380 240 "" 0 0 0 "">
  <630 170 640 170 "" 0 0 0 "">
  <640 170 640 250 "" 0 0 0 "">
  <220 170 250 170 "" 0 0 0 "">
  <540 170 570 170 "out" 550 190 10 "">
  <400 170 420 170 "" 0 0 0 "">
  <310 170 340 170 "" 0 0 0 "">
  <420 170 420 170 "in" 410 120 0 "">
  <480 230 480 230 "vcc" 510 230 0 "">
  <40 140 40 140 "vcc" 80 150 0 "">
</Wires>
<Diagrams>
  <Rect 190 483 591 153 3 #c0c0c0 4 00 1 0 0.0005 0.005 1 -0.5 1 6 1 -1 1 1 315 0 225 1 0 0 "Tiempo (s)" "" "">
	<"ngspice/tran.v(in)" #0000ff 0 3 0 0 0>
	<"ngspice/tran.v(out)" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 180 693 591 153 3 #c0c0c0 4 00 1 0 0.001 0.01 1 -0.000590398 0.0005 0.000590458 1 -1 1 1 315 0 225 1 0 0 "Tiempo (s)" "" "">
	<"ngspice/tran.i(vin)" #00ff00 0 3 0 0 0>
	<"ngspice/tran.i(vout)" #613583 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
