module mips (
	input	logic 		 clk, reset,	
	input	logic [31:0] instr, 		
	input	logic [31:0] readdata,

	output	logic [31:0] pc,
	output	logic 		 memwrite,
	output	logic [31:0] aluout,
	output	logic [31:0] writedata
);

	logic memtoreg, alusrc, regdst, 				
	      regwrite, jump, pcsrc, zero;				

	logic [2:0] alucontrol; 

	// device control data path
	controller	c (.op(instr[31:26]), 
				   .funct(instr[5:0]), 
				   .zero(zero),
				   .memtoreg(memtoreg), 
				   .memwrite(memwrite),
				   .pcsrc(pcsrc), 
				   .alusrc(alusrc), 
				   .regdst(regdst), 
				   .regwrite(regwrite), 
				   .jump(jump), 
				   .alucontrol(alucontrol));

	// data path
	datapath	dp (.clk(clk), 
					.reset(reset), 
					.memtoreg(memtoreg),
				    .pcsrc(pcsrc), 
				    .alusrc(alusrc), 
				    .regdst(regdst),
				    .regwrite(regwrite), 
				    .jump(jump), 
				    .zero(zero),
				    .alucontrol(alucontrol), 
				    .pc(pc), 
				    .instr(instr),
				    .aluout(aluout), 
				    .writedata(writedata), 
				    .readdata(readdata));

endmodule: mips
