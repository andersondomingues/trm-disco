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
localparam AND = 7'b000_0000;   // logical and          RA = RA and RB  RA = RB and imm
localparam OR  = 7'b000_0010;   // logical or           RA = RA or RB   RA = RB or imm 
localparam XOR = 7'b000_0011;   // logical excl. or     RA = RA xor RB  RA = RB xor imm
localparam ADD = 7'b000_0100;   // arithmetic add 	    RA = RA + RB 	RA = RB + imm 	
localparam SUB = 7'b000_0101;   // arithmetic subtract  RA = RA - RB 	RA = RB - imm 	
localparam LSL = 7'b001_1000;   // shift left 	        RA = RA << RB 	RA = RB << imm 	
localparam LSR = 7'b001_1010;   // shift right 	        RA = RA >>> RB 	RA = RB >>> imm 	
localparam ASR = 7'b001_1011;   // arith. shift right   RA = RA >> RB 	RA = RB >> imm 	
localparam LDW = 7'b010_0000;   // load word 	        RA = mem[RB] 	RA = mem[RB + imm] 	word access
localparam LDB = 7'b010_0010;   // load byte 	        RA = mem[RB] 	RA = mem[RB + imm] 	byte access
localparam LBU = 7'b010_0011;   // load byte unsigned   RA = mem[RB] 	RA = mem[RB + imm] 	byte access
localparam STW = 7'b010_0100;   // store word 	       mem[RB] = RA 	mem[RB + imm] = RA 	word access
localparam STB = 7'b010_0110;   // store byte 	       mem[RB] = RA 	mem[RB + imm] = RA 	byte access
localparam BLT = 7'b100_0000;   // branch if less than 	         PC = RA < 0 ? RB : PC + 2 	PC = RA < RB ? imm 
localparam BGE = 7'b100_0001;   // branch if greater or equal 	 PC = RA >= 0 ? RB : PC + 2 	PC = RA >= RB ?
localparam BBL = 7'b100_0100;   // branch if below 	             PC = RA < 0 ? RB : PC + 2 	PC = RA < RB ? imm : PC
localparam BAE = 7'b100_0101;   // branch if above or equal 	 PC = RA >= 0 ? RB : PC + 2 	PC = RA >= RB ?
localparam BEQ = 7'b100_1000;   // branch if equal 	             PC = RA == 0 ? RB : PC + 2 	PC = RA == RB ? imm : PC
localparam BNE = 7'b100_1001;   // branch if not equal 	         PC = RA != 0 ? RB : PC + 2 	PC = RA != RB ? imm : PC
localparam TLT = 7'b101_0000;   // test if less than 	      RA = RA < RB ? 1 : 0 	RA = RB < imm ? 1 : 0 	
localparam TGE = 7'b101_0001;   // test if greater or equal   RA = RA >= RB ? 1 : 0 	RA = RB >= imm ? 1 
localparam TBL = 7'b101_0100;   // test if below 	          RA = RA < RB ? 1 : 0 	RA = RB < imm ? 1 : 0 	unsigned
localparam TAE = 7'b101_0101;   // test if above or equal 	  RA = RA >= RB ? 1 : 0 	RA = RB >= imm ? 1 : 0 
localparam TEQ = 7'b101_1000;   // test if equal 	          RA = RA == RB ? 1 : 0 	RA = RB == imm ? 1 : 0 	
localparam TNE = 7'b101_1001;   // test if not equal 	      RA = RA == RB ? 1 : 0 	RA = RB == imm ? 1 : 0 	

// pseudo-instructions
localparam HLT = 7'b111_1100;  // halt program (simulation only)

endpackage