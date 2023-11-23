// `timescale 10ns/10ns // <time_unit>/<time_precision
module testbech;

  // // Determinar el tamaño de los wire como de los estímulos
  parameter INPUT_SIZE = 9;
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
  sum7seg_hex dut(.x0(inputs[0]),.x1(inputs[1]),.x2(inputs[2]),.x3(inputs[3]),.y0(inputs[4]),.y1(inputs[5]),.y2(inputs[6]),.y3(inputs[7]),.carry_in(inputs[8])
  /*,.h(value[7]),.g(value[6]),.f(value[5]),.e(value[4]),.d(value[3]),.c(value[2]),.b(value[1]),.a(value[0])*/);

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
