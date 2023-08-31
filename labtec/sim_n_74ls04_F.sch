<Qucs Schematic 2.0.0>
<Properties>
  <View=-120,-292,1043,681,1.1482,0,0>
  <Grid=10,10,1>
  <DataSet=sim_n_74ls04_F.dat>
  <DataDisplay=sim_n_74ls04_F.dpl>
  <OpenDisplay=1>
  <Script=sim_n_74ls04_F.m>
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
  <GND * 1 0 0 0 0 1 2>
  <SPICEINIT SPICEINIT1 1 20 70 -30 16 0 0 " set ngbehavior=ltpsa" 1>
  <R R1 1 120 -100 -26 15 0 0 "10 kOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R2 1 390 -100 -26 15 0 0 "10 kOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vdc V4 1 -80 -30 18 -26 0 1 "5 V" 1>
  <.TR TR1 1 500 -110 0 68 0 0 "lin" 1 "0" 1 "10 ms" 1 "200" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <Vrect V3 1 0 -30 18 -26 0 1 "5" 1 "1 ms" 1 "1 ms" 1 "1 ns" 0 "1 ns" 0 "0 ns" 0>
  <SpLib X2 1 250 -70 -29 -164 1 2 "/home/david/.qucs/user_lib/SN74LS04.lib" 0 "SN74LS04" 1 "auto" 1 "" 1>
</Components>
<Wires>
  <0 -100 0 -60 "" 0 0 0 "">
  <0 -100 90 -100 "" 0 0 0 "">
  <-80 0 0 0 "" 0 0 0 "">
  <150 -100 220 -100 "In" 210 -130 26 "">
  <280 -100 360 -100 "Out" 340 -130 33 "">
  <420 -100 420 0 "" 0 0 0 "">
  <0 0 220 0 "" 0 0 0 "">
  <220 0 420 0 "" 0 0 0 "">
  <220 -40 220 0 "" 0 0 0 "">
  <-80 -60 -80 -60 "VCC" -40 -90 0 "">
  <280 -40 280 -40 "VCC" 310 -70 0 "">
</Wires>
<Diagrams>
  <Rect 90 350 240 160 3 #c0c0c0 1 00 1 0 0.002 0.01 1 -0.492843 2 6 1 -1 1 1 315 0 225 1 0 0 "" "" "">
	<"ngspice/tran.v(in)" #ff0000 2 3 0 0 0>
	<"ngspice/tran.v(out)" #0000ff 2 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
