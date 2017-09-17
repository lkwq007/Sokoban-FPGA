module y_pos(sys_clk,reset,y_pos,EndLine,co2);  
  input sys_clk,reset,EndLine;
  output reg co2;
  output [9:0] y_pos;
  reg [9:0] state;
  
  always @(*)
  begin
    case(state)
    10'd1:   co2<=1;
    10'd24:  co2<=1;
    10'd624: co2<=1;
    10'd625: co2<=1;
    default: co2<=0;
    endcase
  end
  
  always @(posedge sys_clk)
  begin
    if((reset)|(state==10'd625))
      state <= 0;
    else if(EndLine)
      state <= state + 1;
    else 
      state <= state;
  end
  assign y_pos = state - 10'd25;
endmodule