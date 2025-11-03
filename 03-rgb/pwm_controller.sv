// PWM controller
module pwm_controller 
# (
    parameter RESOLUTION = 4
)    
(
    input logic clock,
    input logic reset,
    input logic [1:0] SW,
    input logic clock_enable,
    output logic PWM
);

    // define the parameters
    localparam DT_50 = 1 << (RESOLUTION-1);
    localparam DT_25 = 1 << (RESOLUTION-2);
    localparam DT_12_5 = 1 << (RESOLUTION-3);

    // resolution of the PWM
    logic [RESOLUTION-1:0] count;
    logic [RESOLUTION:0] duty_cycle;

    always_ff @( posedge clock) begin 
        if (reset) begin
            count <= 0;
            PWM <= 0;
        end
        else begin 
            if (clock_enable) begin
                count <= count + 1;
                if (count < duty_cycle) begin
                    PWM <= 1;
                end
                else begin
                    PWM <= 0;
                end
            end
        end
    end
    
    always_comb begin : DutyCycleCalculate
        case (SW)
            2'b00: duty_cycle = 0;
            2'b01: duty_cycle = DT_12_5;
            2'b10: duty_cycle = DT_25;
            2'b11: duty_cycle = DT_50;
            default: duty_cycle = 0;
        endcase
    end

endmodule

