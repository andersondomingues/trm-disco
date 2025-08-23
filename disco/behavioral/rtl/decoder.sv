import disco::*;

module decoder(
    input logic[15:0] instr
    output logic [6:0]  opcode,        // 7-bit opcode
    output logic i,                    // use_imm
    output logic [3:0]  ra,            // destination register
    output logic [3:0]  rb,            // source register
    output logic [15:0] imm
);


endmodule