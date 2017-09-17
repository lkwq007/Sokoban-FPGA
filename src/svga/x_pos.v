
module x_pos(sys_clk,reset,x_pos,co1);
  
  input sys_clk,reset;
  output reg co1;
  output [9:0] x_pos;
  reg [10:0] state;
  
  always @(*)
  begin
    case(state)
    11'd79:  co1<=1;
    11'd247: co1<=1;
    11'd1047:co1<=1;
    11'd1063:co1<=1;
    default: co1<=0;
    endcase
  end
  
  always @(posedge sys_clk)
  begin
    if(reset|(state==11'd1063))
      state <= 0;
    else 
      state <= state + 1;
  end
  
  assign x_pos = state - 11'd248;
endmodule