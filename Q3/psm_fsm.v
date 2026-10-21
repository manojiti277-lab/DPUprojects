`timescale 1ns/1ps

module ps2_fsm (
    input wire clk,
    input wire reset,
    input wire valid,
    input wire [7:0] data,
    output reg done
);

    parameter FIRST = 2'd0,
              SECOND = 2'd1,
              THIRD = 2'd2;

    reg [1:0] state;

    always @(posedge clk) begin
        if (reset) begin
            state <= FIRST;
            done <= 1'b0;
        end else begin
            done <= 1'b0;

            if (valid) begin
                case (state)
                    FIRST: begin
                        if (data[3])
                            state <= SECOND;
                    end

                    SECOND: state <= THIRD;

                    THIRD: begin
                        done <= 1'b1;
                        state <= FIRST;
                    end

                    default: state <= FIRST;
                endcase
            end
        end
    end

endmodule