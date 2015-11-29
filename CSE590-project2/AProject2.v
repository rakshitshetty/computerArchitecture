`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:56:50 06/16/2015 
// Design Name: 
// Module Name:    AProject2 
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
module AProject2(led,lednext,switch,switchnext,btn, clk, a, b, c, d, e, f, g, an
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

integer i;

integer count;
integer led_count;
integer guess=0;
integer guess_count=0;
integer guess_count2=0;
integer guess_count3=0;

reg countPL1=0;
reg countPL2=0;
reg countPL2values=0;

reg tempcount=0;
reg equaltemp=0;
reg freeze=0;
reg switchnextcount=0;

reg [4:0] led;
reg [2:0] lednext;



reg [4:0] dig;
reg [5:0] button0=5'b 00000;
reg [5:0] button1=5'b 00000;
reg [5:0] button2=5'b 00000;
reg [5:0] button3=5'b 00000;

reg [5:0] player1_0;
reg [5:0] player1_1;
reg [5:0] player1_2;
reg [5:0] player1_3;

reg [5:0] player2_0;
reg [5:0] player2_1;
reg [5:0] player2_2;
reg [5:0] player2_3;

reg [19:0] player1_full;
reg [19:0] player2_full;




always @(posedge clk) 

	create_slow_clock(clk, slow_clock); 



always @(posedge slow_clock) 

begin
	
	if(freeze==0)
	begin
		
		led=switch;

		lednext=switchnext;
		
	end

  
	if (switch[4] == 0)                                //switch 7
	begin
		
		an=4'b 1111;
						
		button0=5'b00000;							
		button1=5'b10001;							
		button2=5'b00001;							
		button3=5'b00100;	
							
		countPL1=0;
		countPL2=0;
		countPL2values=0;
			
		tempcount=0;
		equaltemp=0;
		freeze=0;
			
		guess=0;
		guess_count=0;
		guess_count2=0;
		guess_count3=0;			
			
		//led=0;
		//lednext=0;
			
		player1_0=0;
		player1_1=0;
		player1_2=0;
		player1_3=0;

		player2_0=0;
		player2_1=0;
		player2_2=0;
		player2_3=0;

		player1_full=0;
		player2_full=0;			
			
			
	end
	
   else
	 
		if(freeze==1)
		begin
					
			if (led_count > 5000) 
			begin 
				led_count=0;
						 
				led=~led; 
				lednext=~lednext;
						 
			end 
			led_count = led_count+1; 
					
		end
		

		
 //to check player 2 values
				
		if(switchnext[2]==1)								//switch 6
		begin
				
			if(switchnextcount==0)
			begin
				button0=player2_0;
								
				button1=player2_1;
								
				button2=player2_2;
								
				button3=player2_3;
				switchnextcount=1;
			end	
		end
		
		else
		begin
		switchnextcount=0;
		end

			
	 	if(switchnext[1]==0)									//switch 5
		begin
					
			if(countPL1==0)
			begin

									
				button0=5'b00000;
							
				button1=5'b10001;
							
				button2=5'b00001;
							
				button3=5'b00100;	
							
				countPL1=1;
				countPL2=0;
							
			end
					
					
		end
				



				
			
				
	 
      begin 

			case (an)
			
				4'b 1110: an=4'b 1101;	
						

				4'b 1101: an=4'b 1011;  
		 
	 
		 
				4'b 1011: an=4'b 0111;
		 

				4'b 0111: an=4'b 1110;
		 
		 
				4'b 1111:an=4'b 0111;				

						
				default: an=1111; 
			
			endcase
			


 
			case (an)


				4'b 0111:  
				begin
						  						
					if(btn == 4'b0001)
					begin
						if(freeze==0)
						begin
							button0=switch;
							dig=button0;  
						end			
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
						if(freeze==0)
						begin								
							button1=switch;
							dig=button1;
						end
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
						if(freeze==0)
						begin								
							button2=switch;
							dig=button2;
						end
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
						if(freeze==0)
						begin
							button3=switch;
							dig=button3;
						end
					end
												
					else
					begin

						dig=button3;

					end	
		
				end
						
			endcase
			
			if(switchnext[1]==1)														//switch 5
			begin
							
				if(countPL2==0)
				begin
						
					player1_0=button0;						     					//player 1 values
					player1_1=button1;
					player1_2=button2;
					player1_3=button3;
								
					player1_full[4:0]=player1_0;
					player1_full[9:5]=player1_1;
					player1_full[14:10]=player1_2;
					player1_full[19:15]=player1_3;
										
					button0=5'b00000;
								
					button1=5'b10010;
								
					button2=5'b00001;
								
					button3=5'b00100;	
								
					countPL1=0;
					countPL2=1;
							
				end
							
											
				if(switchnext[0]==1)													//switch 4
				begin
				
					if(countPL2values==0)
					begin					
						player2_0=button0;						     					//player 2 values
						player2_1=button1;
						player2_2=button2;
						player2_3=button3;
										
						player2_full[4:0]=player2_0;
						player2_full[9:5]=player2_1;
						player2_full[14:10]=player2_2;
						player2_full[19:15]=player2_3;								
										
						countPL2values=1;
					end
					
				end
							
				if(switchnext[0]==0)													//switch 4
				begin
								
					if(countPL2values==1)
					begin
										
						if(player2_full < player1_full)     					//2LO
						begin
																	
							button0=5'b 00000;
												
							button1=5'b 00011;
												
							button2=5'b 00001;
												
							button3=5'b 10010;
												
							guess=guess+1;
							countPL2values=0;
												
						end
											
						if(player2_full > player1_full)      					//2HI
						begin
																	
							button0=5'b 00000;
												
							button1=5'b 00101;
												
							button2=5'b 00010;
												
							button3=5'b 10010;
												
							guess=guess+1;
							countPL2values=0;
												
						end
											
											
						if(player2_full == player1_full)
						begin
						
							if(equaltemp==0)
							begin
							
								guess=guess+1;
								equaltemp=1;
								
							end

							if(guess>=1000 && guess<10000)
							begin
													
								guess=guess-1000;
								guess_count3=guess_count3+1;
													
							end												
												
							if(guess>=100 && guess<1000)
							begin
													
								guess=guess-100;
								guess_count2=guess_count2+1;
													
													
							end

							if(guess>=10 && guess<100)
							begin
														
								guess=guess-10;
								guess_count=guess_count+1;													
														
							end

							if(guess<10)
							begin
													
								if(tempcount==0)
								begin
														
									guess=guess+16;
									guess_count=guess_count+16;
									guess_count2=guess_count2+16;
									guess_count3=guess_count3+16;														
									tempcount=1;
														
								end
														
								button0=guess;
														
								button1=guess_count;
														
								button2=guess_count2;
														
								button3=guess_count3;
								
								led=0;
								lednext=0;
														
								countPL2values=0;
								freeze=1;
													
							end
		
						end											
																					
					end
								
				end
											
			end
				
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
						 
						 

 

		  5'b00001:  begin    
							a=1; b=1; c=1; d=0; e=0; f=0; g=1;    //L
						 end

		  5'b00010:  begin    
							a=1; b=0; c=0; d=1; e=0; f=0; g=0;    //H
						 end	

		  5'b00011:  begin    
							a=1; b=1; c=0; d=0; e=0; f=1; g=0;    //o
						 end			 

		  5'b00100:  begin    
							a=0; b=0; c=1; d=1; e=0; f=0; g=0;    //P
						 end

		  5'b00101:  begin    
							a=1; b=1; c=1; d=1; e=0; f=1; g=1;    //i
						 end
						 
		  5'b00110:  begin    
							a=1; b=0; c=0; d=0; e=0; f=0; g=1;    //U
						 end

		  5'b00111:  begin    
							a=0; b=1; c=0; d=0; e=1; f=0; g=1;    //S
						 end

		  5'b01000:  begin    
							a=1; b=0; c=0; d=0; e=1; f=0; g=0;    //y
						 end					 

		  5'b00000:  begin    
							a=1; b=1; c=1; d=1; e=1; f=1; g=1;     //blank
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
			
			  if (count > 900)							//900
			  
				  begin 
					  count=0; 
					  slow_clock = ~slow_clock; 
				  end 
				  
			  count = count+1;   
		  end 
		  
	endtask

endmodule
