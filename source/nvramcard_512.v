`timescale 1ns / 100ps

/////////////////////////////////////////////////
//
// Project Name:	ProDOS NVRAMCard
// Target Devices:	XC9572XL-VQ44
// Engineer:		GSX Studio
// Create Date:		2022.4.13
// Revision:		1.1
// Comments:		For 512KB Flash
//
/////////////////////////////////////////////////
module nvram_card(
	input [7:0]data_6502,
	input [10:8]addr_6502,
	output reg [18:8]addr_nvram,
	input clk_ce,
	input _iosel,
	input _iostrobe,
	input r_w,
	input _reset,
	input phi0,
	input _devsel,
	output rom_ce,
	output rom_we,
	output _rw, // also used as rom_oe
	output iostrobe
);
reg [7:0] addr_reg;
reg _out1; // Q1 inverse signal of 74HCT74
wire clk_wri = !(phi0 && !(_devsel || r_w)); // bank# writing clock

assign _rw = !r_w; // rom_oe
assign rom_ce = !(!(_iostrobe || _out1) || !_iosel);
assign rom_we = !(phi0 && _rw);
assign iostrobe = !_iostrobe;

always @ (posedge clk_ce or negedge _reset or negedge _devsel) begin
	if (_reset==1'b0)
		_out1 = 1'b1; // Q1 low when _reset active low
	else if (_devsel==1'b0)
			_out1 = 1'b0; // Q1 high when _devsel active low
		 else _out1 = 1'b1; // Q1 = D1 = 0
end

always @ (posedge clk_wri) begin
	addr_reg <= data_6502; // latch the bank#
end

always @ (*) begin
	if (_iosel)
		addr_nvram <= {addr_reg,addr_6502}; // select bank#+(6502 address bus A10~A8) when _iosel high
	else
		addr_nvram <= 11'h7ff; // sets A18~A8 = 1 while _iosel active low bootloader at the bank#ff page#7
end

endmodule
