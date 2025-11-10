module top (
	input  logic clock,
	input  logic reset,
	input  logic enable,
	output logic [7:0] anode_assert,
	output logic [6:0] segs
);
	logic [31:0] count;

	counter_1s c1s (
		.clock  (clock),
		.reset  (reset),
		.enable (enable),
		.count  (count)
	);

	SevSegDisplay ssd (
		.clock        (clock),
		.reset        (reset),
		.digits       (count),
		.anode_select (anode_assert),
		.segs         (segs)
	);
endmodule
