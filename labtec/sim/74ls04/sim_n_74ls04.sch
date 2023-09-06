<Qucs Schematic 2.0.0>
<Properties>
  <View=-179,-254,1043,561,0.784239,0,0>
  <Grid=10,10,1>
  <DataSet=sim_n_74ls04.dat>
  <DataDisplay=sim_n_74ls04.dpl>
  <OpenDisplay=1>
  <Script=sim_n_74ls04.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Título>
  <FrameText1=Dibujado por:>
  <FrameText2=Fecha:>
  <FrameText3=Revisión:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <IProbe out 1 340 -100 -26 16 0 0>
  <SpLib X1 1 250 -70 -29 -164 1 2 "/home/alejandro/.qucs/user_lib/SN74LS04.lib" 0 "SN74LS04" 1 "auto" 1 "" 1>
  <SPICEINIT SPICEINIT1 1 -50 -210 -30 16 0 0 " set ngbehavior=ltpsa" 1>
  <R Rout 1 400 -100 -26 -51 1 0 "10 kOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vdc V4 1 -100 -60 18 -26 0 1 "5 V" 1>
  <Vrect V3 1 -30 -40 18 -26 0 1 "5" 1 "1 ms" 1 "1 ms" 1 "1 ns" 0 "1 ns" 0 "0 ns" 0>
  <GND * 1 -30 0 0 0 1 2>
  <R Rgen 1 0 -100 -26 -51 1 0 "50Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R Rin 1 90 -100 -26 -51 0 2 "10 kOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <IProbe in 1 180 -100 -26 -34 1 0>
  <IProbe ext 1 130 -40 -26 -34 0 2>
  <.TR TR1 1 470 -150 0 66 0 0 "lin" 1 "0" 1 "10 ms" 1 "200" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
</Components>
<Wires>
  <280 -100 310 -100 "out" 290 -140 11 "">
  <430 -100 430 0 "" 0 0 0 "">
  <210 -100 220 -100 "in" 210 -140 0 "">
  <-100 0 -30 0 "" 0 0 0 "">
  <-100 -30 -100 0 "" 0 0 0 "">
  <-30 0 100 0 "" 0 0 0 "">
  <-30 -10 -30 0 "" 0 0 0 "">
  <-30 -100 -30 -70 "" 0 0 0 "">
  <30 -100 60 -100 "" 0 0 0 "">
  <120 -100 150 -100 "" 0 0 0 "">
  <100 0 430 0 "" 0 0 0 "">
  <100 -40 100 0 "" 0 0 0 "">
  <160 -40 220 -40 "" 0 0 0 "">
  <280 -40 280 -40 "VCC" 320 -50 0 "">
  <-100 -90 -100 -90 "VCC" -90 -130 0 "">
</Wires>
<Diagrams>
  <Rect -40 193 591 153 3 #c0c0c0 4 00 1 0 0.001 0.01 1 -0.492807 2 6 1 -1 1 1 315 0 225 1 0 0 "Tiempo (s)" "" "">
	<"ngspice/tran.v(in)" #0000ff 0 3 0 0 0>
	<"ngspice/tran.v(out)" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect -40 393 591 153 3 #c0c0c0 4 00 1 0 0.001 0.01 1 -0.000582522 0.0005 0.000589742 1 -1 1 1 315 0 225 1 0 0 "Tiempo (s)" "" "">
	<"ngspice/tran.i(vin)" #00ff00 0 3 0 0 0>
	<"ngspice/tran.i(vout)" #613583 0 3 0 0 0>
	<"ngspice/tran.i(vext)" #ff7800 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
