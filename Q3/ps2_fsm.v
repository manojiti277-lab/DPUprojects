module ps2_fsm(
    input clk, reset, valid,
    input [7:0] data,
    output reg done
);
reg [1:0] state;
always @(posedge clk) begin
  if (reset) begin
   state <= 0;
   done <= 0;
  end
else begin
   done <= 0;
   if (valid)
   case (state)
   0: if (data[3]) state <= 1;
  1: state <= 2;
   2: begin
    done <= 1;
 state <= 0;
     end
default: state <= 0;
   endcase
    end
end
endmodule