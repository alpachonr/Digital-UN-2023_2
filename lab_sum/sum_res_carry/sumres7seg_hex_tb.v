// `timescale 10ns/10ns // <time_unit>/<time_precision
module testbech;

  // // Determinar el tamaño de los wire como de los estímulos
  parameter INPUT_SIZE = 10;
  parameter OUTPUT_SIZE = 8;

  // // STIMULUS 1
  // reg a = 0, b = 0;
  // initial
  // begin
  //    # 17 a = 1; b = 1;
  //    # 11 a = 1; b = 0;
  //    # 29 a = 1; b = 1;
  //    # 11 a = 1; b = 0;
  //    # 100 $finish(); // [stop(), $finish()]
  // end

  // // STIMULUS 2
   reg [INPUT_SIZE-1:0] inputs;
  // inputs[2] inputs[1] inputs[1]
   integer i;
   initial
   begin
     inputs = 0;
     for (i=0; i<2**INPUT_SIZE; i=i+1) // 2 elevado a la INPUT_SIZE , en el ejemplo 2^3 = 8 combinaciones
     begin
       inputs = i;
       #1;
     end
   end

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
  // reg clk = 0;
  // always #5 clk = !clk;

  // initial
  // begin
  //   #2E9 $finish(); // [stop(), $finish()]
  // end

  // // RESULT FOR DEVICE/DESIGN UNDER TEST
  wire [OUTPUT_SIZE-1:0]value;

  // // DEVICE/DESIGN UNDER TEST
  sumres7seg_hex dut(inputs[0],inputs [1],inputs[2],inputs [3],inputs[4],inputs [5],inputs[6],inputs [7],inputs[8],inputs [9],
  (value[7]),(value[6]),(value[5]),(value[4]),(value[3]),(value[2]),(value[1]),(value[0]));

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
