/*
This module is a instruction-fetch-unit module, which used to sending request and address
for each instructions, besides, this module can also receive request from outter module
to change the PC value.
*/
module ifu(
	);

	/* interface definition */ // {

	// i_Clk,  the input clock signal, the whole core use only one clock frequency

	// i_RstN, the input reset signal, the whole core use one reset signal only.

	// o_FetchV, the fetch valid signal, indicates that current request is enabled.

	// o_FetchA, [27:0] the fetch address signal, each request should rcv 128 bits info, so the address
	// need the width is: 28
	//

	// i_FetchR, the ready signal of fetch, only when the ready signal is high, can the request be continue.

	// i_JumpV, the jump valid signal, this module will change the PC value according to input

	// i_JumpT, [31:0] the jump target signal, indicates the target value to jump.

	// o_InstrSel, [1:0] the instruction select signal, this signal used to indicates the receiver the part of
	// the received instruction should be dropped. This signal will be pushed to fifo of idu module.
	//

	/************************/ // interface define done }



	/* block */
	/*********************************/


endmodule
