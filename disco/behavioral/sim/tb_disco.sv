`timescale 1ns/1ps

module tb_disco_behavioral ()();

logic clock = 0;
logic reset = 0;

disco_behavioural disco_cpu #(MEM_SIZE=1024)(
    .clock(clock),
    .reset(reset)
);

always #2 clock = ~clock;

initial begin
    #3 reset = 1;
end

endmodule