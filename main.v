`timescale 1ns / 1ps

module main (
   output [7:0] led,
	output outpin,
	input switch,
	input clk
   );
		
	reg [7:0] val;
	integer ctr = 0;
	integer led_ctr = 0;
	integer blink_delay = 10000;
	
	reg pinled;
	
	always @(posedge clk) begin
		ctr = ctr + 1;
		
		if (ctr > blink_delay) begin
			pinled = !pinled;
			val = !val;
			ctr = 0;
			val[led_ctr+1] = 1;
			val[led_ctr] = 0;
			
			case(switch)
				0: blink_delay <= 10000000;
				1: blink_delay <= 100000;
			endcase
			
			if (led_ctr==6) begin
				led_ctr = 0; 
			end else begin
				led_ctr = led_ctr + 1;
			end
		end

	end
	assign led = val;
	assign outpin = pinled;
	

endmodule