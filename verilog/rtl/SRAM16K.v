/*
    16 kbytes SRAM made out of 8 x 2
*/

module SRAM16K(
    input wire clk,
    input wire  [11:0]  addr,
    input wire  [31:0]  wdata,
    output wire [31:0]  rdata,
    input  wire         cs,
    input wire  [3:0]   wen
);

    // 8 x 2kbytes OpenRAM banks
    wire [31:0] sram_rdata[7:0];

    wire [7:0] sram_dec = {
                            (addr[11:9]=='d7),
                            (addr[11:9]=='d6),
                            (addr[11:9]=='d5),
                            (addr[11:9]=='d4),
                            (addr[11:9]=='d3),
                            (addr[11:9]=='d2),
                            (addr[11:9]=='d1),
                            (addr[11:9]=='d0)
                        };

    wire [7:0] sram_csb = ~({8{cs}} & sram_dec);

    reg [2:0] sram_sel;

    always @(posedge clk)
        sram_sel <= addr[11:9];

    assign rdata = sram_rdata[sram_sel];

    generate
        genvar i;
        for(i=0; i<8; i=i+1) begin : BANK
            sky130_sram_2kbyte_1rw1r_32x512_8 RAM(
                // Port 0: RW
                .clk0(clk),
                .csb0(sram_csb[i]),
                .web0(~|wen),
                .wmask0(wen),
                .addr0(addr[8:0]),
                .din0(wdata),
                .dout0(sram_rdata[i]),
                // Port 1: R
                .clk1(1'b1),
                .csb1(1'b1),
                .addr1(9'h1FF)
                //.dout1()
            );
        end
    endgenerate

endmodule