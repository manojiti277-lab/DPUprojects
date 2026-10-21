module sequence_detector (
 input wire clk,input wire reset, input wire x,
    output reg y
);
    reg [2:0] history;
    reg [1:0] count;

    always @(posedge clk) begin
     if (reset) begin
     history <= 3'b000;
      count<= 2'd0;
      y <= 1'b0;
   end 
	else begin
      history <= {history[1:0], x};
  if (count < 2'd3) begin
  count <= count + 2'd1;
   y<= 1'b0;
   end
else begin
  case ({history, x})
   4'b0010,
  4'b0100,
  4'b0101,
  4'b1000,
   4'b1110: y <= 1'b1;
    default: y <= 1'b0;
        
  endcase 
 end
  end
  end

endmodule