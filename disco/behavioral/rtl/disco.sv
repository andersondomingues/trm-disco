import disco::*;

`define FILENAME "program.txt"

module disco_behavioural #(parameter MEM_SIZE = 1024)(
    input logic clock,
    input logic reset,
);

typedef logic[15:0] reg16;

reg16[16] r;
reg16 pc, pc_next, word, word_next;

logic[MEM_SIZE-1:0] mem;

logic[2:0] op1;
logic[3:0] op2;
logic I;
logic[3:0] ra;
logic[3:0] rb;

assign word = {op1, op2, I, ra, rb};

initial begin
    // load program into memory
    $readmemh("data.txt", mem);
end

always @(posedge clock) begin
    
    // fetch
    word = mem[pc];
    word_next = mem[pc_next];

    // decode 
    unique case (op1)
        OP_LOG_ARITH : begin
            if(~I) begin
                unique case(op2)
                    AND: r[ra] = r[ra] & r[rb];  
                    OR:  r[ra] = r[ra] | r[rb];
                    XOR: r[ra] = r[ra] ^ r[rb];
                    ADD: r[ra] = r[ra] + r[rb];
                    SUB: r[ra] = r[ra] - r[rb];
                endcase
            end else begin
                unique case(op2)
                    AND: r[ra] = r[ra] & imm;  
                    OR:  r[ra] = r[ra] | imm;
                    XOR: r[ra] = r[ra] ^ imm;
                    ADD: r[ra] = r[ra] + imm;
                    SUB: r[ra] = r[ra] - imm;
                endcase
            end
            pc = pc + 2;
        end
        OP_BRANCH : begin
            if(~I) begin
                unique case(op2)
                    BLT: pc = (r[ra] < 0) ? r[rb] : pc + 2;
                    BGE: pc = (r[ra] >= 0) ? r[rb] : pc + 2;
                    BBL: pc = (r[ra] < 0) ? r[rb] : pc + 2;
                    BAE: pc = (r[ra] >= 0) ? r[rb] : pc + 2;
                    BEQ: pc = (r[ra] == 0) ? r[rb] : pc + 2;
                    BNE: pc = (r[ra] != 0) ? r[rb] : pc + 2;
                endcase
            end else begin
                unique case(op2)
                    BLT: pc = (r[ra] < 0) ? imm : pc + 2;
                    BGE: pc = (r[ra] >= 0) ? imm : pc + 2;
                    BBL: pc = (r[ra] & {1b'0, 15{1'b1}} < 0) ? imm : pc + 2;
                    BAE: pc = (r[ra] & {1b'0, 15{1'b1}} >= 0) ? imm : pc + 2;
                    BEQ: pc = (r[ra] == 0) ? imm : pc + 2;
                    BNE: pc = (r[ra] != 0) ? imm : pc + 2;
                endcase
            end
        end
        OP_TEST : begin
            if(~I) begin
                unique case(op2)
                    TLT: r[ra] = (r[ra] < r[rb]) ? 1b'1 : 1b'0;
                    TGE: r[ra] = (r[ra] >= r[rb]) ? 1b'1 : 1b'0;
                    TBL: r[ra] = (r[ra] < r[rb]) ? 1b'1 : 1b'0;   // unsigned
                    TAE: r[ra] = (r[ra] >= r[rb]) ? 1b'1 : 1b'0;  // unsigned 
                    TEQ: r[ra] = (r[ra] == r[rb]) ? 1b'1 : 1b'0;
                    TNE: r[ra] = (r[ra] != r[rb]) ? 1b'1 : 1b'0;
                endcase
            end else begin
                unique case(op2)
                    TLT: r[ra] = (r[ra] < imm) ? 1b'1 : 1b'0;
                    TGE: r[ra] = (r[ra] >= imm) ? 1b'1 : 1b'0;
                    TBL: r[ra] = (r[ra] < imm) ? 1b'1 : 1b'0;   // unsigned
                    TAE: r[ra] = (r[ra] >= imm) ? 1b'1 : 1b'0;  // unsigned 
                    TEQ: r[ra] = (r[ra] == imm) ? 1b'1 : 1b'0;
                    TNE: r[ra] = (r[ra] != imm) ? 1b'1 : 1b'0;
                endcase
            end
            pc = pc + 2;
        end
        OP_LOAD_STORE : begin
            
        end
        OP_SHIFT : begin
            if(~I) begin
                unique case(op2)
                    LSL: r[ra] = r[ra] << r[rb];
                    LSR: r[ra] = r[ra] >>> r[rb];
                    ASR: r[ra] = r[ra] >> r[rb];
                endcase
            end else begin
                unique case(op2)
                    LSL: r[ra] = r[ra] << imm;
                    LSR: r[ra] = r[ra] >>> imm;
                    ASR: r[ra] = r[ra] >> imm;
                endcase
            end
            pc = pc + 2;
        end
        OP_EXTRA : begin
            if(op2 == HLT) $finish;
        end
        default : $display("Ignored unknown instruction ", op1, op2);
    endcase



end


endmodule