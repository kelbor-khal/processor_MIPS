// The program code of the processor is taken from the 
// book "Digital Circuitry and Computer Architecture". 
// It is used for training in the design of HDL devices.
//
// Parameterization has been introduced in some modules.
// student: Filin I.A. 

module alu 
#(
	parameter WIDTH = 32
)
(
	input	logic [WIDTH-1:0] a, b,
	input	logic [2:0] 	  alu_op,

	output	logic [WIDTH-1:0] result,
	output	logic 			  zero
);

	always_comb begin
		case (alu_op)
			3'b010:  result = a + b;
			3'b110:  result = a - b;
			3'b000:  result = a & b;
			3'b001:  result = a | b;
			3'b111:	 result = (a < b) ? 32'b1 : 32'b0;
			3'bxxx:  result = 32'bx;
			default: result = 3'bxxx;
		endcase
	end

	assign zero = (a == b) ? 1'b1 : 1'b0;

endmodule: alu