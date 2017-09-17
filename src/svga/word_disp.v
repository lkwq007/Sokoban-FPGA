module word_disp(clk, x_pos, y_pos, x0, y0, pixel);
input clk;
input [9:0]x_pos, y_pos, x0, y0;
output pixel;

wire[9:0] x_disp, y_disp;
wire[2:0] x_temp;
wire[3:0] y_temp;    
wire[3:0] letter_order; 
wire pixel,byte;
reg[4:0] word;

assign x_disp=x_pos-x0, y_disp=y_pos-y0;
assign x_temp=x_disp[2:0]-1,y_temp=y_disp[3:0];
assign byte=x_disp[3];
assign letter_order=x_disp[7:4]; 

always @(posedge clk)
  begin
    case(letter_order)
      4'd0:word=4'd0;
      4'd1:word=4'd1;
      4'd2:word=4'd2;
      4'd3:word=4'd3;
      4'd4:word=4'd4;
      4'd5:word=4'd5;
      4'd6:word=4'd6;
      4'd7:word=4'd3;
      4'd8:word=4'd8;
      4'd9:word=4'd9;
      4'd10:word=4'd10;
      4'd11:word=4'd11;
      4'd12:word=4'd12;
      4'd13:word=4'd13;
      default:;
    endcase
  end
wire [7:0]dout,dout_temp; 
wordROM   wordROM (
		.addr ({word,y_temp,byte}),
		.clk(clk),
		.dout(dout)
		);
assign dout_temp=dout<<x_temp;
assign pixel = dout_temp[7];
		
endmodule