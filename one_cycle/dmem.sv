// The program code of the processor is taken from the 
// book "Digital Circuitry and Computer Architecture". 
// It is used for training in the design of HDL devices.
//
// Parameterization has been introduced in some modules.
// student: Filin I.A.

module dmem (
	input	logic 		 clk, we,
	input	logic [31:0] a, wd,

	output	logic [31:0] rd
);
	logic [31:0] RAM [63:0];

	assign rd = RAM[a[31:2]];

	always_ff @(posedge clk)
		if(we) RAM[a[31:2]] <= wd;

endmodule: dmem