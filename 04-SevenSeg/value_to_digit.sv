module value_to_digit(
	input logic [31:0] value,
	input logic [7:0] anode_select,
	output logic [3:0] digit
);
	always_comb begin
		case(anode_select)
			8'hFE: digit = value[3:0];
			8'hFD: digit = value[7:4];
			8'hFB: digit = value[11:8];
			8'hF7: digit = value[15:12];
			8'hEF: digit = value[19:16];
			8'hDF: digit = value[23:20];
			8'hBF: digit = value[27:24];
			8'h7F: digit = value[31:28];
			default: digit = 4'b0000;
		endcase
	end

endmodule
