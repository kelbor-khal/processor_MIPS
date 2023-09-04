// The program code of the processor is taken from the 
// book "Digital Circuitry and Computer Architecture". 
// It is used for training in the design of HDL devices.
//
// Parameterization has been introduced in some modules.
// student: Filin I.A.

module controller (
	input	logic [5:0]	op, funct,
	input	logic 		zero,

	output	logic 		memtoreg, memwrite,
	output	logic 		pcsrc, alusrc,
	output	logic 		regdst, regwrite,
	output  logic 		jump,
	output	logic [2:0] alucontrol
);

	logic [1:0] aluop;				// operation ALU
	logic 		branch;					// flag branch

	// main decoder device control
	maindec md( .op(op), 
				.memtoreg(memtoreg), 
			    .memwrite(memwrite), 
			    .branch(branch),
			    .alusrc(alusrc), 
			    .regdst(regdst), 
			    .regwrite(regwrite), 
			    .jump(jump), 
			    .aluop(aluop));
	
	// ALU decoder device control
	aludec  ad( .funct(funct), 
				.aluop(aluop), 
		   		.alucontrol(alucontrol));

	assign pcsrc = branch & zero;
endmodule: controller
