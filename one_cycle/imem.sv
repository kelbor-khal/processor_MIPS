// The program code of the processor is taken from the 
// book "Digital Circuitry and Computer Architecture". 
// It is used for training in the design of HDL devices.
//
// Parameterization has been introduced in some modules.
// student: Filin I.A.


module imem (
	input	logic [5:0]  a,

	output	logic [31:0] rd
);
	logic [31:0] RAM [64:0];

	initial
		$readmemh (".memory/assembled_programm.dat", RAM);
	
	assign rd = RAM [a];

endmodule: imem

