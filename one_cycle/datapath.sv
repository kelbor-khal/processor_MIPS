// The program code of the processor is taken from the 
// book "Digital Circuitry and Computer Architecture". 
// It is used for training in the design of HDL devices.
//
// Parameterization has been introduced in some modules.
// student: Filin I.A. 

module datapath 
(
	// device control
	input	logic 			clk, reset,
	input	logic 			memtoreg, pcsrc,
	input	logic 			alusrc, regdst,
	input	logic 			regwrite, jump,
	input	logic [2:0]		alucontrol,

	// memory data and instructions
	input	logic [31:0]	instr,
	input	logic [31:0]	readdata,

	// ALU output
	output	logic 			zero,
	output	logic [31:0]	aluout,

	// memory data and instrustions
	output	logic [31:0]	pc,
	output 	logic [31:0] 	writedata
);

	logic [4:0]		writereg;
	logic [31:0]	pcnext, pcnextbr, pcplus4, pcbranch;
	logic [31:0]	signimm, signimmsh;
	logic [31:0]	srca, srcb;
	logic [31:0]	result;

	// logic next PC value
	flopr	pcreg 	(.clk(clk), 
					 .reset(reset),
					 .d(pcnext), 
					 .q(pc));

	adder	pcadd1  (.a(pc), 
					 .b(32'b100), 
					 .y(pcplus4));	
	
	sl2		immsh	(.a(signimm), 
					 .y(signimmsh));
	
	adder	pcadd2  (.a(pcplus4), 
					 .b(signimmsh), 
					 .y(pcbranch));

	mux2 #(.WIDTH(32)) pcbrmux (.d0(pcplus4), 
								.d1(pcbranch), 
								.y(pcnextbr), 
								.s(pcsrc));

	mux2 #(.WIDTH(32)) pcmux   (.d0(pcnextbr), 
								.d1({pcplus4[31:28],instr[25:0],2'b00}), 
								.y(pcnext), 
								.s(jump));
	// logic ref file
	regfile refile	(.clk(clk), 
					 .ra1(instr[25:21]), 
					 .ra2(instr[20:16]),
					 .we3(regwrite), 
					 .wa3(writereg), 
					 .wd3(result),
					 .rd1(srca), 
					 .rd2(writedata));

	mux2 #(.WIDTH(5))  wrmux (.d0(instr[20:16]), 
							  .d1(instr[15:11]), 
							  .s(regdst), 
							  .y(writereg));
	
	mux2 #(.WIDTH(32)) resmux (.d0(aluout), 
							   .d1(readdata), 
							   .s(memtoreg), 
							   .y(result));

	signext se (.a(instr[15:0]), 
				.y(signimm));

	// ALU logic
	mux2 #(.WIDTH(32)) srcbmux (.d0(writedata), 
								.d1(signimm), 
					 			.s(alusrc), 
					 			.y(srcb));

	alu 	alu 	(.a(srca), 
					 .b(srcb),
					 .alu_op(alucontrol),
				 	 .zero(zero), 
				 	 .result(aluout));

endmodule: datapath