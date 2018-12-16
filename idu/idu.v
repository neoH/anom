/*
The instruction receive and decode unit.
*/

module idu (
	);

	parameter IW = `ANOM_INSTRUCTION_WIDTH;
	parameter IN = `ANOM_INSTRUCTION_FNUM;


	// i_Clk, the clock signal
	input i_Clk;

	// i_RstN, the reset signal
	input i_RstN;


	// i_InstrSel, [1:0] the instruction select signal, this signal will be pushed into a fifo
	// and each time one instruction got, then the item in this fifo will be poped.
	// so the depth of this fifo determined the maximum pending requests.
	// from ifu module.
	//
	input [1:0] i_InstrSel;

	// i_InstrV, the instruction valid signal, indicates the received instruction has valid
	// from interface module
	//

	// i_Instr, [127:0] the signal contains the received instructions
	input [IW*IN-1:0] i_Instr;


	/********************************************************************************************************************************/
	// declared the decode output, send to the issue module in ieu unit
	// command formats:
	//
	//
	//
	//
	/********************************************************************************************************************************/


endmodule
