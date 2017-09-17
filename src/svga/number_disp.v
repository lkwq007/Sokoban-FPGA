module number_disp(clk, x_pos, y_pos, x0, y0, pixel, step,step_exp);
input clk;
input [7:0] step,step_exp;
input [9:0]x_pos, y_pos, x0, y0;
output pixel;

wire[9:0] x_disp, y_disp;
wire[2:0] x_temp;
wire[3:0] y_temp;    
wire pixel;
wire [2:0] letter_order;
reg[4:0] zk;

assign x_disp=x_pos-x0, y_disp=y_pos-y0;
assign x_temp=x_disp[3:1]-1,y_temp=y_disp[4:1];
assign letter_order=x_disp[6:4]; 
wire[3:0] hundred,ten,one;
wire[3:0] hundred_exp,ten_exp,one_exp;
bcd bin2bcd(.number(step),.hundreds(hundred),.tens(ten),.ones(one));
bcd bin2bcd_exp(.number(step_exp),.hundreds(hundred_exp),.tens(ten_exp),.ones(one_exp));
always @(posedge clk)
begin
 if(letter_order==3'd0)
  begin
    case(hundred)
      4'd0:zk=5'd0;
      4'd1:zk=5'd1;
      4'd2:zk=5'd2;
      4'd3:zk=5'd3;
      4'd4:zk=5'd4;
      4'd5:zk=5'd5;
      4'd6:zk=5'd21;
      4'd7:zk=5'd22;
      4'd8:zk=5'd23;
      4'd9:zk=5'd24;
      default:zk=5'd19;
    endcase
  end
 else if(letter_order==3'd1)
  begin
    case(ten)
      4'd0:zk=5'd0;
      4'd1:zk=5'd1;
      4'd2:zk=5'd2;
      4'd3:zk=5'd3;
      4'd4:zk=5'd4;
      4'd5:zk=5'd5;
      4'd6:zk=5'd21;
      4'd7:zk=5'd22;
      4'd8:zk=5'd23;
      4'd9:zk=5'd24;
      default:zk=5'd19;
    endcase
  end
 else if(letter_order==3'd2)
  begin
    case(one)
      4'd0:zk=5'd0;
      4'd1:zk=5'd1;
      4'd2:zk=5'd2;
      4'd3:zk=5'd3;
      4'd4:zk=5'd4;
      4'd5:zk=5'd5;
      4'd6:zk=5'd21;
      4'd7:zk=5'd22;
      4'd8:zk=5'd23;
      4'd9:zk=5'd24;
      default:zk=5'd19;
    endcase
  end
else if(letter_order==3'd3)
  begin
     zk=5'd27;
  end
else if(letter_order==3'd4)
  begin
    case(hundred_exp)
      4'd0:zk=5'd0;
      4'd1:zk=5'd1;
      4'd2:zk=5'd2;
      4'd3:zk=5'd3;
      4'd4:zk=5'd4;
      4'd5:zk=5'd5;
      4'd6:zk=5'd21;
      4'd7:zk=5'd22;
      4'd8:zk=5'd23;
      4'd9:zk=5'd24;
      default:zk=5'd19;
    endcase
  end
else if(letter_order==3'd5)
  begin
    case(ten_exp)
      4'd0:zk=5'd0;
      4'd1:zk=5'd1;
      4'd2:zk=5'd2;
      4'd3:zk=5'd3;
      4'd4:zk=5'd4;
      4'd5:zk=5'd5;
      4'd6:zk=5'd21;
      4'd7:zk=5'd22;
      4'd8:zk=5'd23;
      4'd9:zk=5'd24;
      default:zk=5'd19;
    endcase
  end
 else if(letter_order==3'd6)
  begin
    case(one_exp)
      4'd0:zk=5'd0;
      4'd1:zk=5'd1;
      4'd2:zk=5'd2;
      4'd3:zk=5'd3;
      4'd4:zk=5'd4;
      4'd5:zk=5'd5;
      4'd6:zk=5'd21;
      4'd7:zk=5'd22;
      4'd8:zk=5'd23;
      4'd9:zk=5'd24;
      default:zk=5'd19;
    endcase
  end
 end
 
wire [7:0]dout,dout_temp; 
ZkROM   ZkROM (
    .addr ({zk,y_temp}),
    .clk(clk),
    .dout(dout)
    );
assign dout_temp=dout<<x_temp;
assign pixel = dout_temp[7];
		
endmodule