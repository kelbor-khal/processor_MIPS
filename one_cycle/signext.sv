// The program code of the processor is taken from the 
// book "Digital Circuitry and Computer Architecture". 
// It is used for training in the design of HDL devices.
//
// Parameterization has been introduced in some modules.
// student: Filin I.A.

module signext (
	input	logic [15:0] a,
	output	logic [31:0] y
);

	assign y = {{16{a[15]}},a};

endmodule: signext