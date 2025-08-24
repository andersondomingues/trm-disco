package disco;

// register definitions for the trm architecture
localparam R0 = 0;  // the constant zero register, always 0
localparam R1 = 1;  // the first general-purpose register
localparam R2 = 2;
localparam R3 = 3;
localparam R4 = 4;
localparam R5 = 5;
localparam R6 = 6;
localparam R7 = 7;
localparam R8 = 8;
localparam R9 = 9;
localparam R10 = 10;
localparam R11 = 11;
localparam R12 = 12;
localparam R13 = 13;  // frame pointer
localparam R14 = 14;  // stack pointer
localparam R15 = 15;  // link register

// alternative names for registers
localparam A0 = 0;
localparam A1 = 1;
localparam A2 = 2;
localparam A3 = 3;
localparam V0 = 4;  // local variables
localparam V1 = 5;
localparam R7 = 6;	
localparam V2 = 7;
localparam V3 = 8;
localparam V4 = 9;
localparam V5 = 10;
localparam V6 = 11;
localparam V7 = 12;
localparam FP = 13;  // frame pointer
localparam SP = 14;  // stack pointer
localparam LR = 15;  // link register

// another alternative name for FP
localparam V8 = 13;  // frame pointer

// instruction format definitions
localparam OP_LOG_ARITH = 3'b000;
localparam AND = 3'b0000;   // logical and          RA = RA and RB  RA = RB and imm
localparam OR  = 3'b0010;   // logical or           RA = RA or RB   RA = RB or imm 
localparam XOR = 3'b0011;   // logical excl. or     RA = RA xor RB  RA = RB xor imm
localparam ADD = 3'b0100;   // arithmetic add 	    RA = RA + RB 	RA = RB + imm 	
localparam SUB = 3'b0101;   // arithmetic subtract  RA = RA - RB 	RA = RB - imm 	

// shifts
localparam OP_SHIFT = 3'b001;
localparam LSL = 3'b1000;   // shift left 	        RA = RA << RB 	RA = RB << imm 	
localparam LSR = 3'b1010;   // shift right 	        RA = RA >>> RB 	RA = RB >>> imm 	
localparam ASR = 3'b1011;   // arith. shift right   RA = RA >> RB 	RA = RB >> imm 	

// load-store instructions
localparam OP_LOAD_STORE = 3'b010;
localparam LDW = 3'b0000;   // load word 	        RA = mem[RB] 	RA = mem[RB + imm] 	word access
localparam LDB = 3'b0010;   // load byte 	        RA = mem[RB] 	RA = mem[RB + imm] 	byte access
localparam LBU = 3'b0011;   // load byte unsigned   RA = mem[RB] 	RA = mem[RB + imm] 	byte access
localparam STW = 3'b0100;   // store word 	       mem[RB] = RA 	mem[RB + imm] = RA 	word access
localparam STB = 3'b0110;   // store byte 	       mem[RB] = RA 	mem[RB + imm] = RA 	byte access

localparam OP_BRANCH = 3'b100;
localparam BLT = 4'b0000;   // branch if less than 	         PC = RA < 0 ? RB : PC + 2 	PC = RA < RB ? imm : PC
localparam BGE = 4'b0001;   // branch if greater or equal 	 PC = RA >= 0 ? RB : PC + 2 	PC = RA >= RB ?
localparam BBL = 4'b0100;   // branch if below 	             PC = RA < 0 ? RB : PC + 2 	PC = RA < RB ? imm : PC
localparam BAE = 4'b0101;   // branch if above or equal 	 PC = RA >= 0 ? RB : PC + 2 	PC = RA >= RB ?
localparam BEQ = 4'b1000;   // branch if equal 	             PC = RA == 0 ? RB : PC + 2 	PC = RA == RB ? imm : PC
localparam BNE = 4'b1001;   // branch if not equal 	         PC = RA != 0 ? RB : PC + 2 	PC = RA != RB ? imm : PC

localparam OP_TEST = 3'b101;
localparam TLT = 4'b0000;   // test if less than 	      RA = RA < RB ? 1 : 0 	RA = RB < imm ? 1 : 0 	
localparam TGE = 4'b0001;   // test if greater or equal   RA = RA >= RB ? 1 : 0 	RA = RB >= imm ? 1 
localparam TBL = 4'b0100;   // test if below 	          RA = RA < RB ? 1 : 0 	RA = RB < imm ? 1 : 0 	unsigned
localparam TAE = 4'b0101;   // test if above or equal 	  RA = RA >= RB ? 1 : 0 	RA = RB >= imm ? 1 : 0 
localparam TEQ = 4'b1000;   // test if equal 	          RA = RA == RB ? 1 : 0 	RA = RB == imm ? 1 : 0 	
localparam TNE = 4'b1001;   // test if not equal 	      RA = RA == RB ? 1 : 0 	RA = RB == imm ? 1 : 0 	

localparam OP_EXTRA = 3'111;
localparam HLT = 4'_1100;  // halt program (simulation only)

endpackage