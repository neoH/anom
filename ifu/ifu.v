/*
This module is a instruction-fetch-unit module, which used to sending request and address
for each instructions, besides, this module can also receive request from outter module
to change the PC value.
*/
module ifu(
	i_Clk,
	i_RstN,
	o_FetchV,
	o_FetchA,
	i_FetchR,
	i_JumpV,
	i_JumpT,
	o_InstrSel
	);

	parameter PC_WIDTH = `ANOM_PC_WIDTH;


	/******************/ // }

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
	reg r_FetchV;
	/*******************************************************************************/ // }


	/* combinetial logic */ // {

	// assign the output instruction sel when fetch valid and the PC value
	assign o_InstrSel = {2{o_FetchV}} & r_PC[1:0];
	assign o_FetchA   = {(PC_WIDTH-2){o_FetchV}} & r_PC[PC_WIDTH-1:2];
	assign o_FetchV   = r_FetchV;

	/*******************************************************************************/ // }

	/******************************************************************************/ // }

	/* block */
	// TODO always @(posedge i_Clk or negedge i_RstN) begin // {
	// TODO 	if (~i_RstN) begin // {
	// TODO 		// async. reset block
	// TODO 	// }
	// TODO 	end else begin // {
	// TODO 		case (w_status) // {
	// TODO 			IDLE: begin // {
	// TODO 			end // }
	// TODO 		endcase // }
	// TODO 	end // }
	// TODO end // }
	/*********************************/


	/* Process block */ // {
	always @(posedge i_Clk or negedge i_RstN) begin // {
		if (~i_RstN) begin // {
			r_PC <= {PC_WIDTH{1'b0}};
			r_FetchV <= 1'b0;
		// }
		end else begin // {
			if (i_JumpV) begin // {
				// if jump valid, then this cycle need to change to jump target
				// and no fetch request are valid.
				r_PC <= i_JumpT;
				r_FetchV <= 1'b0;
			// }
			end else begin // {
				// if i_FetchR is high, then choose to add the PC value and send fetch request
				if (i_FetchR == 1'b1) begin // P
					r_PC <= r_PC + 3'h4; // else add one for PC
					r_FetchV <= 1'b1;
				// }
				end else r_FetchV <= 1'b0; // else if FetchR is 0, then the request should be pull low.
			end // }
		end // }
	end // }
	/*****************/ // }




endmodule
