module top (
	input	logic 		 clk, reset,

	output	logic [31:0] writedata, dataadr,
	output	logic		 memwrite
);
	// declaration local signal
	logic [31:0] pc, instr, readdata;

	// memory data
	dmem dmem (.clk(clk),
			   .we (memwrite),
			   .a  (dataadr),
			   .wd (writedata),
			   .rd (readdata));

	// memory instruction
	imem imem (.a(pc[7:2]),
			   .rd(instr));

	// mips core
	mips mips (.clk(clk),
			   .reset(reset),
			   .pc(pc),
			   .instr(instr),
			   .memwrite(memwrite),
			   .aluout(dataadr),
			   .writedata(writedata),
			   .readdata(readdata));

endmodule: top