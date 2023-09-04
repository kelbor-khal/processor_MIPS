// The program code of the processor is taken from the 
// book "Digital Circuitry and Computer Architecture". 
// It is used for training in the design of HDL devices.
//
// Parameterization has been introduced in some modules.
// student: Filin I.A.

module regfile 
#(
	parameter WIDTH_ADDR = 5,
	parameter WIDTH_DATA = 32
)
(
	input	logic 			  		clk,
	input	logic [WIDTH_ADDR-1:0] 	ra1, ra2, wa3,
	input	logic			  		we3,
	input	logic [WIDTH_DATA-1:0] 	wd3,

	output 	logic [WIDTH_DATA-1:0] 	rd1, rd2
);

	logic [WIDTH_DATA-1:0] regf [WIDTH_DATA-1:0];

	always_ff @(posedge clk)
		if (we3)	regf[wa3] <= wd3;

	assign rd1 = (ra1 !=0) ? regf[ra1]: 0;
	assign rd2 = (ra2 !=0) ? regf[ra2]: 0;

endmodule: regfile