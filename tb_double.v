module dfs_tb;

	// Inputs
	reg clk1;
	reg clk2;
	reg rst1;
	reg rst2;
	reg din;

	// Outputs
	wire dout;

	// Instantiate the Unit Under Test (UUT)
	dfs uut (
		.clk1(clk1), 
		.clk2(clk2), 
		.rst1(rst1),
		.rst2(rst2),		
		.din(din), 
		.dout(dout)
	);

always #10 clk1 = ~clk1; 
always #5 clk2 = ~clk2; 

initial
  $monitor($time," clk1=%b, clk2=%b, din=%b, dout=%b, rst1=%b, rst2=%b",clk1,clk2,din,dout,rst1,rst2);

initial
  begin
  clk1=1'b0; clk2=1'b0; din=1'b0; rst1=1'b0; rst2=1'b0;
  #3 rst1=1'b1; rst2=1'b1;
  #17 din=1'b1;
  #60 $finish;
  end
  
endmodule
