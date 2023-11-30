`timescale 10ns/10ns // <time_unit>/<time_precision
module testbech;

  // // Determinar el tamaño de los wire como de los estímulos
  //parameter INPUT_SIZE = 1;
  parameter OUTPUT_SIZE = 6;

  // // STIMULUS 1
   reg at = 0, bt = 0;
   initial
   begin
      #1 at = 1; 
      #2 at = 0; 
      #200000 bt=1;
         //   # 100 $finish(); // [stop(), $finish()]
   end

  // // STIMULUS 2
   //reg [INPUT_SIZE-1:0] inputs;
  // inputs[2] inputs[1] inputs[1]
   //integer i;
  // initial
  // begin
     //inputs = 0;
     //for (i=0; i<2**INPUT_SIZE; i=i+1) // 2 elevado a la INPUT_SIZE , en el ejemplo 2^3 = 8 combinaciones
     //begin
       //inputs = i;
       //#1;
     //end
   //end

  // // STIMULUS ARGS
  // initial
  // begin
  //   if(! $value$plusargs("inputs=%b", inputs)) begin
  //     $display("ERROR: please specify +inputs=<value> to start.");
  //     $finish;
  //   end

  //   wait (outs) $display("outs = %d", outs);
  //   #1
  //   $finish;
  // end

  // // CLOCK STIMULUS
  // Make a regular pulsing clock.
  reg clk = 0;
  always #2 clk = !clk;

  initial
   begin
     //#2E4 $stop();
     #300000 $finish(); // [stop(), $finish()]
   end

  // // RESULT FOR DEVICE/DESIGN UNDER TEST
  wire [OUTPUT_SIZE-1:0]value;

  // // DEVICE/DESIGN UNDER TEST
  //sumcomplete (in_a,in_b,op,clk_in,a,b,c,d,e,f,g,sign0,dis1,dis0
  top dut(.switch(at),.signal(bt),.clk_in(clk),.trigger(value[5]),.l_a(value[4]),.l_b(value[3]),.l_c(value[2]),.l_d(value[1]),.l_e(value[0]));
  

  // // MONITOR
  // initial
    // $monitor("Time: %t, a = %d, b = %d => out = %d",
    //   $time, a, b, value);

  // // WAVES IN VCD TO OPEN IN GTKWAVE
  initial
  begin
    $dumpfile("top.vcd");
    $dumpvars(0, testbech);
  end
endmodule
