////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dr. Ratko Pilipović
//
// Design Name:   prescaler.sv
// Module Name:   prescaler
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
// Additional Comments: Prescaler
// 
// Develop a prescaler with the following properties:
///////////////////////////////////////////////////////////////////////////////

module prescaler
    #(parameter PRESCALER_WIDTH = 8)
    (
        input logic clock,
        input logic reset,
        input logic [PRESCALER_WIDTH-1:0] limit,
        output logic clock_enable
    );

    logic [PRESCALER_WIDTH-1:0] count;

    always_ff @( posedge clock) begin 
        if (reset) begin
            count <= 0;
            clock_enable <= 0;
        end
        else begin
            if (count == limit-1) begin
                count <= 0;
                clock_enable <= ~clock_enable;
            end
            else begin
                clock_enable <= 0;
                count <= count + 1;
            end
        end
    end

endmodule