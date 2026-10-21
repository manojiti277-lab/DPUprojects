module tb_sequence_detector;
  reg clk, reset, x;
   wire y;
  reg [18:0] data, observed;
  integer i;
sequence_detector dut (
  .clk(clk), .reset(reset), .x(x), .y(y)
    );
always #5 clk = ~clk;//
initial begin
 clk = 0;
 reset = 1;
  x = 0;
 data = 19'b0010100100010111010;
 observed = 0;
#10 reset = 0;
 for (i = 18; i >= 0; i = i - 1) begin /* we are checking output by keeping it in loop.as we are having 19 digits,
	                                                 we kept loop from 0 to 18. */
 x = data[i];
 #10;
 observed[i] = y;
    end
 $finish;
    end
endmodule