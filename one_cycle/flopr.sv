// The program code of the processor is taken from the 
// book "Digital Circuitry and Computer Architecture". 
// It is used for training in the design of HDL devices.
//
// Parameterization has been introduced in some modules.
// student: Filin I.A.

module flopr 
#(
	parameter WIDTH = 32
)
(
	input	logic 			  clk, reset,
	input	logic [WIDTH-1:0] d,

	output	logic [WIDTH-1:0] q
);

	always_ff @(posedge clk, posedge reset)
		if (reset)	q <= 0;
		else		q <= d;
 
endmodule: flopr