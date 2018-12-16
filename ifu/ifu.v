/*
This module is a instruction-fetch-unit module, which used to sending request and address
for each instructions, besides, this module can also receive request from outter module
to change the PC value.
*/
module ifu(
	);

	parameter PC_WIDTH = `ANOM_PC_WIDTH;

	/* interface definition */ // {

	// i_Clk,  the input clock signal, the whole core use only one clock frequency
	input i_Clk;

	// i_RstN, the input reset signal, the whole core use one reset signal only.
	input i_RstN;

	// o_FetchV, the fetch valid signal, indicates that current request is enabled.
	output o_FetchV;

	// o_FetchA, [27:0] the fetch address signal, each request should rcv 128 bits info, so the address
	// need the width is: 28
	//
	output [(PC_WIDTH-2)-1:0] o_FetchA;

	// i_FetchR, the ready signal of fetch, only when the ready signal is high, can the request be continue.
	input i_FetchR;

	// i_JumpV, the jump valid signal, this module will change the PC value according to input
	input i_JumpV;

	// i_JumpT, [29:0] the jump target signal, indicates the target PC to jump.
	input [PC_WIDTH-1:0] i_JumpT;

	// o_InstrSel, [1:0] the instruction select signal, this signal used to indicates the receiver the part of
	// the received instruction should be dropped. This signal will be pushed to fifo of idu module.
	//
	output [1:0] o_InstrSel;


	//


	/************************/ // interface define done }

	/* internal PC */ // {
	reg [PC_WIDTH-1:0] r_PC;
	/*******************************************************************************/ // }


	/* combinetial logic */ // {

	// assign the output instruction sel when fetch valid and the PC value
	assign o_InstrSel = {2{o_FetchV}} & r_PC[1:0];

	/*******************************************************************************/ // }

	/* block */
	always @(posedge i_Clk or negedge i_RstN) begin // {
	end // }
	/*********************************/


endmodule
