module regbank(
    input logic clock,
    input logic reset

    // read ports
    input logic [3:0] raddr1,               
    output logic [15:0] rdata1,
    input logic [3:0] raddr2,               
    output logic [15:0] rdata2,

    // write port
    input logic we,
    input logic [3:0] waddr,                
    input logic [15:0] wdata
);

    // 16 registers of 16 bits each
    logic [15:0] regs[15:0];                

    // read ports (combinational)
    assign rdata1 = regs[raddr1];
    assign rdata2 = regs[raddr2];

    // write port (synchronous)
    always_ff @(posedge clock or negedge reset) begin
        if (~reset) begin
            // reset all registers to 0
            for (int i = 0; i < 16; i++) begin 
                regs[i] <= 16'b0;
            end
        end else if (we) begin
            regs[waddr] <= wdata;
        end
    end
endmodule