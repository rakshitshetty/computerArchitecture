`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:26 06/12/2015 
// Design Name: 
// Module Name:    finalproject1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module finalproject1(led,lednext,switch,switchnext,btn, clk, a, b, c, d, e, f, g, an
    );


input [3:0] btn; 
input [4:0] switch;
input [2:0] switchnext;
input clk; 

output a, b, c, d, e, f, g;  
output [3:0] an; 
output [4:0] led;
output [2:0] lednext;

reg a, b, c, d, e, f, g;  
reg [3:0] an;
 
reg slow_clock;
integer count;

reg [4:0] led;
reg [2:0] lednext;

reg [4:0] dig;
reg [5:0] button0;
reg [5:0] button1;
reg [5:0] button2;
reg [5:0] button3;


always @(posedge clk) 

	create_slow_clock(clk, slow_clock); 



always @(posedge slow_clock) 

begin

	led=switch;

	lednext=switchnext;

  
	if (switch[4] == 0)
		begin
		
			an=4'b 1111;
			
			button0=5'b 01111;
			
			button1=5'b 01111;
			
			button2=5'b 01111;
			
			button3=5'b 01111;
			
		end
	
    else
	 
      begin 

			case (an)
			
				4'b 1110: an=4'b 1101;	
						

				4'b 1101: an=4'b 1011;  
		 
	 
		 
				4'b 1011: an=4'b 0111;
		 

				4'b 0111: an=4'b 1110;
		 
		 
				4'b 1111:
							begin
								if(btn)
									begin
										an=4'b 0111;				
									end
												
								else
									begin
										an=4'b 1111;
									end
							end
						
				default: an=1111; 
			
			endcase

 
			case (an)


				4'b 0111:  
	
						begin
						
							if(btn == 4'b0001)
								begin

									button0=switch;
									dig=button0;  
									
								end
											
							else
								begin
								
									dig=button0;

								end
							
						end
	
	
				4'b 1011: 
	 
						begin
							
							if(btn == 4'b0010)
								begin
								
									button1=switch;
									dig=button1;

								end
												
							else
								begin

									dig=button1;

								end

						end	 
	 
					
				4'b 1101: 

						begin
						
							if(btn == 4'b0100)
								begin
								
									button2=switch;
									dig=button2;

								end
													
							else
								begin

									dig=button2;

								end
							
						end

				4'b1110:  

						begin
						
							if(btn == 4'b1000)
								begin

									button3=switch;
									dig=button3;

								end
						
												
							else
								begin

									dig=button3;

								end	
		
						end
					
				
			endcase 
			
		end


		case (dig) 

		  5'b11111:  begin   
							a=0; b=1; c=1; d=1; e=0; f=0; g=0;  
						 end
				
		  5'b11110:  begin    
							a=0; b=1; c=1; d=0; e=0; f=0; g=0;  
						 end
				  
		  5'b11101:  begin   
							a=1; b=0; c=0; d=0; e=0; f=1; g=0;  
						 end
				
		  5'b11100:  begin    
							a=0; b=1; c=1; d=0; e=0; f=0; g=1;  
						 end
				
		  5'b11011:  begin    
							a=1; b=1; c=0; d=0; e=0; f=0; g=0;  
						 end
				
		  5'b11010:  begin    
							a=0; b=0; c=0; d=1; e=0; f=0; g=0;  
						 end
				
		  5'b11001:  begin    
							a=0; b=0; c=0; d=1; e=1; f=0; g=0;  
						 end
				
		  5'b11000:  begin    
							a=0; b=0; c=0; d=0; e=0; f=0; g=0;  
						 end
				
		  5'b10111:  begin   
							a=0; b=0; c=0; d=1; e=1; f=1; g=1;  
						 end
				
		  5'b10110:  begin    
							a=0; b=1; c=0; d=0; e=0; f=0; g=0;  
						 end	
				
		  5'b10101:  begin    
							a=0; b=1; c=0; d=0; e=1; f=0; g=0;  
						 end
				
		  5'b10100:  begin    
							a=1; b=0; c=0; d=1; e=1; f=0; g=0;  
						 end

		  5'b10011:  begin    
							a=0; b=0; c=0; d=0; e=1; f=1; g=0;  
						 end 
		  5'b10010:  begin     
							a=0; b=0; c=1; d=0; e=0; f=1; g=0;    
						 end 
		  5'b10001:  begin     
							a=1; b=0; c=0; d=1; e=1; f=1; g=1;  
						 end 
		  5'b10000:  begin    
							a=0; b=0; c=0; d=0; e=0; f=0; g=1;  
						 end 

		  5'b0????:  begin    
							a=1; b=1; c=1; d=1; e=1; f=1; g=1;  
						 end 	
				
		  default:  begin    
							a=1; b=1; c=1; d=1; e=1; f=1; g=1;  
						end 
						
		endcase 



	end




	task create_slow_clock; 
		 input clock; 
		 inout slow_clock; 
		 integer count; 
			begin 
			
			  if (count > 900)
			  
				  begin 
					  count=0; 
					  slow_clock = ~slow_clock; 
				  end 
				  
			  count = count+1;   
		  end 
	endtask 

endmodule

