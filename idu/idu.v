/*
The instruction receive and decode unit.
*/

module idu (
	);



	// i_Clk, the clock signal

	// i_RstN, the reset signal


	// i_InstrSel, [1:0] the instruction select signal, this signal will be pushed into a fifo
	// and each time one instruction got, then the item in this fifo will be poped.
	// so the depth of this fifo determined the maximum pending requests.

	// i_InstrV, the instruction valid signal, indicates the received instruction has valid
	//

	// i_Instr, [127:0] the


endmodule
