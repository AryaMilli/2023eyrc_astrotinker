// Verilog code for Sequence Detector
    // Define Sequence Detector module
    module sequence_detector (
        input clock,
        input [3:0] number, // Define input ports clock, number
        output reg pattern // Define output port patter
    );


	 //////////////////////////////////////////////
    // Define your State Machine Parameters Here
    parameter ST_ONE = 0;
	 parameter ST_ZERO = 1;
	 parameter ST_NINE = 2;
	 parameter ST_FOUR = 3;
	 //////////////////////////////////////////////

    // defining 2-bit register
    reg [1:0] state = ST_ONE;

    initial begin // define initial state output register
        pattern = 0;
    end

    always @(posedge clock) begin
        pattern = 0;
        case (state)
			   ///////////////////////////////////////
				// Do not modify above part of the code
            // Write your state machine here
				ST_ONE: begin
					// you can read input inside always block like this
					 if (number == 1) begin
					      pattern = 0; // you can assign output values for a register like this.
							state = ST_ZERO;
					 end
					 else
			       state = ST_ONE; // write your own logic here
				end
				ST_ZERO: begin 
					 if (number==0) begin 
						pattern=0;
						state = ST_NINE;
					 end 
					 else
					 state = ST_ONE;
				end
				ST_NINE: begin
					 if(number==9) begin
						pattern=0;
						state=ST_FOUR;
					 end
					 else
					 state = ST_ONE;
				end	
				ST_FOUR: begin
					 if(number==4) begin
					 pattern =1;
					 state=ST_ONE;
					 end
					 else
					 state=ST_ONE;
				 default: state= ST_ONE;
					 // Do not modify below part of the code
					 ///////////////////////////////////////
				end
        endcase
    end
    endmodule 