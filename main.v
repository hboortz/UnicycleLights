`timescale 1ns / 1ps

module main (
   output [7:0] led,
	input [2:0] sw,
	input clk
   );
		
	reg [7:0] val;
	integer ctr = 0;
	integer led_ctr = 0;
	
	always @(posedge clk) begin
		ctr = ctr + 1;
		if (ctr>10000000) begin
			val = !val;
			ctr = 0;
			val[led_ctr+1] = 1;
			val[led_ctr] = 0;
			
			if (led_ctr==6) begin
				led_ctr = 0; 
			end else begin
				led_ctr = led_ctr + 1;
			end
		end

	end
	assign led = val;
	

endmodule