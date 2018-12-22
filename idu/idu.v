/*
The instruction receive and decode unit.
*/

module idu (
	);

	parameter IW = `ANOM_INSTRUCTION_WIDTH;
	parameter IN = `ANOM_INSTRUCTION_FNUM;
	parameter RW = `ANOM_COMMON_REG_WIDTH;


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
	// common register: 0~15, use address width: 4
	//
	// command degree 0: total 16 commands
	// command degree 1: total 16 commands too.
	// command formats:

	// 0h: PC change command
	// -- bsr: non-conditional jump
	// -- bt: 
	// -- bf
	// -- call
	// -- rtn
	//

	// 1h: integer algrithm command
	// 

	// 2h: float algrithm command, TODO

	// 3h: logical algrithm command

	// 4h: memory operating command

	// 5h: 

	//
	//
	/********************************************************************************************************************************/

	output [] o_Cmd; // commander
	output [RW-1:0] o_Rx;  // register address of operand x
	output [RW-1:0] o_Ry;  // register address of operand y
	output [RW-1:0] o_Rz;  // register address of operand z, probably the result address


endmodule
