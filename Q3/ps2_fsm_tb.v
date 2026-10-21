module ps2_fsm_tb;
reg clk, reset, valid;
reg [7:0] data;
wire done;
ps2_fsm dut(clk, reset, valid, data, done);
always #5 clk = ~clk;
initial begin
    clk = 0; reset = 1; valid = 0; data = 0;
    #10 reset = 0; valid = 1;
    #10 data = 8'h07;

    // Two consecutive messages
    #10 data = 8'h08;
    #10 data = 8'h01;
    #10 data = 8'h02;
    #10 data = 8'h18;
    #10 data = 8'hFF;
    #10 data = 8'h08;
    #10 valid = 0;

    // Message with gaps between bytes
    #10 valid = 1; data = 8'h08;
    #10 valid = 0;
    #20 valid = 1; data = 8'h00;
    #10 valid = 0;
    #20 valid = 1; data = 8'hFF;
    #10 valid = 0;
    #10 $finish;
end

endmodule