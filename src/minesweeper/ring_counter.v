module ring_counter (clk,rst,out);

parameter DELAY = 100;

input clk,rst;
output [15:0] out;

(* keep = "true" *) (* s = "true" *) (* OPTIMIZE="OFF" *) wire [DELAY-1:0] delay_line /* synthesis keep */;

reg [15:0] cntr;
reg sync0;
reg wobble;

// unstable ring oscillator
genvar i;
generate
for (i=1; i<DELAY; i=i+1)
  begin : del
    assign delay_line [i] = delay_line[i-1];
  end
endgenerate
assign delay_line [0] = !delay_line [DELAY-1];

// sync it over to the input clock
always @(posedge clk) begin
  sync0 <= delay_line[0];
  wobble <= sync0;
end

// count when the wobbly oscillator is high
always @(posedge clk or posedge rst) begin
  if (rst) cntr <= 0;
  else cntr <= cntr + delay_line[15:0];
end

assign out = cntr;

endmodule