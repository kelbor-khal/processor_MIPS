// The program code of the processor is taken from the 
// book "Digital Circuitry and Computer Architecture". 
// It is used for training in the design of HDL devices.
//
// Parameterization has been introduced in some modules.
// student: Filin I.A.

module sl2
#(
	parameter WIDTH = 32
)
(
	input	logic [WIDTH-1:0] a,

	output	logic [WIDTH-1:0] y
);

assign y = {a[29:0], 2'b00};

endmodule: sl2