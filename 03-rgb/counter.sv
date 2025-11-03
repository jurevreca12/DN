////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dr. Ratko Pilipović
//
// Design Name:   counter.sv
// Module Name:   counter
// Project Name:  digital_systems_design
// Target Device:  
// Tool versions:  
// Description: 
//
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Controlled counter
// 
// Develop a prescaler with the following properties:
///////////////////////////////////////////////////////////////////////////////

module counter
    #(parameter COUNTER_WIDTH = 4)
    (
        input logic clock,
        input logic reset,
        input logic clock_enable,
        input logic count_up,
        input logic count_down,
        output logic [COUNTER_WIDTH-1:0] value
    );

    logic [COUNTER_WIDTH-1:0] count;

    always_ff @(posedge clock) begin 
        if (reset) begin
            count <= 0;
        end
        else begin
            if (clock_enable) begin
                if (count_up) begin
                    count <= count + 1;
                end
                else if (count_down) begin
                    count <= count - 1;
                end
            end
        end
    end

    assign value = count;

endmodule