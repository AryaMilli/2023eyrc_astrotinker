// AstroTinker Bot : Task 1C : Pulse Generator and Detector
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.

This file is used to design a module which will generate a 10us pulse and detect incoming pulse signal.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

// t1c_pulse_gen_detect
//Inputs : clk_50M, reset, echo_rx
//Output : trigger, distance, pulses, state

// module declaration
module t1c_pulse_gen_detect (
    input clk_50M, reset, echo_rx,
    output reg trigger, out,
    output reg [21:0] pulses,
    output reg [1:0] state
);

initial begin
    trigger = 0; out = 0; pulses = 0; state = 0;
end


//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////

/*
Add your logic here
*/
//reg [1:0] c_state;
//reg [1:0] n_state;
reg [19:0] timer;
parameter s0=1,s1=2,s2=3,s3=4;

always @(posedge clk_50M) begin
timer=timer+1'b1;
end

always @ (posedge clk_50M) 
if (reset) begin 
//state =0;
trigger =0;
out =0;
pulses =0;
state=0;
end
else begin
case(state) 
s0: begin 
		#1000;
		state=s1;
	 end
s1: begin
		trigger=1;
		#10000;
		state=s2;
	 end
s2: begin
		if(echo_rx==1) begin 
			pulses=pulses+1'b1;
		end 
	   if (timer == 20'd1000000) begin 
		state=s3;
		end
	end
s3: begin 
		if (timer == 20'd588_200 && reset==0) begin
		out=1;
		state=s0;
		end
	 end
endcase
end
//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule 