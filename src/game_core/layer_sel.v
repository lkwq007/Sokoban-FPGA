//==================================================================================================
//  Filename      : layer_selv
//  Created On    : 2017-07-09 21:01:03
//  Last Modified : 2017-07-16 10:33:10
//  Revision      : 
//  Author        : Lnyan
//  Company       : College of Information Science and Electronic Engineering, Zhejiang University
//  Email         : lkwq007@gmailcom or i@llonelycom
//
//  Description   : 
//
//
//==================================================================================================
module layer_sel(/*autoport*/
//output
			Red,
			Blue,
			Green,
//input
			switch_sel,
			RqFlag0,
			Red0,
			Blue0,
			Green0,
			RqFlag1,
			Red1,
			Blue1,
			Green1,
			RqFlag2,
			Red2,
			Blue2,
			Green2,
			RqFlag3,
			Red3,
			Blue3,
			Green3,
			RqFlagm,
			Redm,
			Bluem,
			Greenm);
	input switch_sel;
	input RqFlag0;
	input[7:0] Red0,Blue0,Green0;
	input RqFlag1;
	input[7:0] Red1,Blue1,Green1;
	input RqFlag2;
	input[7:0] Red2,Blue2,Green2;
	input RqFlag3;
	input[7:0] Red3,Blue3,Green3;
	input RqFlagm;
	input[7:0] Redm,Bluem,Greenm;
	output[7:0] Red,Blue,Green;
	reg[7:0] Red,Blue,Green;
	always @(*) begin
		if(RqFlag3==1) begin
			Red<=Red3;
			Green<=Green3;
			Blue<=Blue3;
		end
		else if(RqFlagm==1&&switch_sel==1) begin
			Red<=Redm;
			Green<=Greenm;
			Blue<=Bluem;
		end
		else if (RqFlag2==1) begin
			Red<=Red2;
			Green<=Green2;
			Blue<=Blue2;
		end
		else if (RqFlag1==1) begin
			Red<=Red1;
			Green<=Green1;
			Blue<=Blue1;
		end
		else if(RqFlag0==1) begin
			Red<=Red0;
			Green<=Green0;
			Blue<=Blue0;			
		end
		else begin
			Red<=0;
			Green<=0;
			Blue<=0;				
		end
	end
endmodule