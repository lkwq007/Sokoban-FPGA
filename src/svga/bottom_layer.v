`include "parameter_vga.v"
 
module bottom_layer(x_pos, y_pos, stage, win, lose, sys_clk, Red0, Green0, Blue0, RqFlag0,step,step_exp);
input  [9:0]x_pos, y_pos;
input  sys_clk,win,lose;
input  [1:0]stage;
input  [7:0]step,step_exp;

output [7:0]Red0, Green0, Blue0;
output RqFlag0;
  
wire  en_level, en_retry, en_retract,en_next,en_step,en_message,en_retry_bounary,en_retract_bounary,en_next_bounary;
assign en_level= (x_pos>=`_EN_LEVEL_LEFT)&&(x_pos<=`_EN_LEVEL_RIGHT)&&(y_pos>=`_EN_LEVEL_UP)&&(y_pos<=`_EN_LEVEL_DOWN);			
assign en_retry= (x_pos>=`_EN_RETRY_LEFT)&&(x_pos<=`_EN_RETRY_RIGHT)&&(y_pos>=`_EN_RETRY_UP)&&(y_pos<=`_EN_RETRY_DOWN);
assign en_retract=(x_pos>=`_EN_RETRACT_LEFT)&&(x_pos<=`_EN_RETRACT_RIGHT)&&(y_pos>=`_EN_RETRACT_UP)&&(y_pos<=`_EN_RETRACT_DOWN);
assign en_next=(x_pos>=`_EN_NEXT_LEFT)&&(x_pos<=`_EN_NEXT_RIGHT)&&(y_pos>=`_EN_NEXT_UP)&&(y_pos<=`_EN_NEXT_DOWN);
assign en_step=(x_pos>=`_EN_STEP_LEFT)&&(x_pos<=`_EN_STEP_RIGHT)&&(y_pos>=`_EN_STEP_UP)&&(y_pos<=`_EN_STEP_DOWN);
assign en_message=(x_pos>=`_EN_MESSAGE_LEFT)&&(x_pos<=`_EN_MESSAGE_RIGHT)&&(y_pos>=`_EN_MESSAGE_UP)&&(y_pos<=`_EN_MESSAGE_DOWN);
assign en_retry_bounary=(x_pos>=`_EN_RETRY_LEFT-5)&&(x_pos<=`_EN_RETRY_RIGHT+5)&&(y_pos>=`_EN_RETRY_UP-5)&&(y_pos<=`_EN_RETRY_DOWN+5);
assign en_retract_bounary=(x_pos>=`_EN_RETRACT_LEFT-5)&&(x_pos<=`_EN_RETRACT_RIGHT+5)&&(y_pos>=`_EN_RETRACT_UP-5)&&(y_pos<=`_EN_RETRACT_DOWN+5);
assign en_next_bounary=(x_pos>=`_EN_NEXT_LEFT-5)&&(x_pos<=`_EN_NEXT_RIGHT+5)&&(y_pos>=`_EN_NEXT_UP-5)&&(y_pos<=`_EN_NEXT_DOWN+5);

wire pixel0,pixel1,pixel2,pixel3,pixel4,pixel5;
letter_disp letter_disp_level  (.x_pos(x_pos), .y_pos(y_pos), .clk(sys_clk), .x0(`_EN_LEVEL_LEFT), .y0(`_EN_LEVEL_UP), .pixel(pixel0), .stage(stage), .win(win),.lose(lose));
letter_disp letter_disp_retry  (.x_pos(x_pos), .y_pos(y_pos), .clk(sys_clk), .x0(`_EN_RETRY_LEFT), .y0(`_EN_RETRY_UP), .pixel(pixel1), .stage(stage), .win(win),.lose(lose));
letter_disp letter_disp_retract(.x_pos(x_pos), .y_pos(y_pos), .clk(sys_clk), .x0(`_EN_RETRACT_LEFT), .y0(`_EN_RETRACT_UP), .pixel(pixel2), .stage(stage), .win(win),.lose(lose));
letter_disp letter_disp_next (.x_pos(x_pos), .y_pos(y_pos), .clk(sys_clk), .x0(`_EN_NEXT_LEFT), .y0(`_EN_NEXT_UP), .pixel(pixel3), .stage(stage), .win(win),.lose(lose));
number_disp number_disp_step(.x_pos(x_pos), .y_pos(y_pos), .clk(sys_clk), .x0(`_EN_STEP_LEFT), .y0(`_EN_STEP_UP), .pixel(pixel4),.step(step),.step_exp(step_exp));
word_disp word_disp_message(.x_pos(x_pos), .y_pos(y_pos), .clk(sys_clk), .x0(`_EN_MESSAGE_LEFT), .y0(`_EN_MESSAGE_UP), .pixel(pixel5));

wire [14:0] addr;
wire[7:0] bottom_red,bottom_green,bottom_blue;
assign addr={y_pos[6:0], x_pos[6:0]};
bottomROM   bottomROM (
		.addr (addr),
		.clk(sys_clk),
		.en(1),
		.dout({bottom_red,bottom_green,bottom_blue})
		);

wire EN;
assign EN = en_retry|en_retract|en_level|en_next|en_step|en_message;
assign EN1= en_retry_bounary|en_retract_bounary|en_next_bounary;
assign pixel = en_level? pixel0: en_retry? pixel1:en_retract ?pixel2: en_next? pixel3:en_step? pixel4:en_message? pixel5: 0;
assign Red0  =pixel? 8'd1:EN? 8'd55:EN1 ? 8'd29:bottom_red;
assign Green0=pixel? 8'd25:EN? 8'd198:EN1 ? 8'd176:bottom_green;
assign Blue0 =pixel? 8'd53:EN? 8'd192:EN1 ? 8'd184:bottom_blue;
assign RqFlag0=1;
endmodule


