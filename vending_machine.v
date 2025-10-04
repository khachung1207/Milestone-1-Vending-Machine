// Code your design here
module vending_machine(
  input wire i_nickle,i_dime, i_quarter,
  input wire i_clk,
  output reg [2:0] o_change,
  output reg o_soda
);
  localparam S0 =2'b00, S1 = 2'b01, S2= 2'b10, S3= 2'b11;
  reg [1:0] current_state, next_state;
  reg next_soda;
  reg [2:0] next_change;
  
  always @(posedge i_clk) begin
    current_state <= next_state;
    o_soda <= next_soda ;
    o_change <= next_change;
  end
  
  always @(*) begin
    next_soda = 1'b0;
    next_change = 3'b000;
    
    case (current_state) 
      S0: case ({i_quarter,i_dime,i_nickle})
        3'b100: begin
          next_state = S0;
          next_soda = 1'b1;
          next_change = 3'b001;
        end
        3'b010: begin
          next_state = S2;
          next_soda =1'b0;
          next_change = 3'b000;
        end
        3'b001: begin
          next_state = S1;
          next_soda =1'b0;
          next_change = 3'b000;
        end
        default: next_state = S0;
      endcase
      
      S1: case ({i_quarter,i_dime,i_nickle})
        3'b100: begin
          next_state = S0;
          next_soda = 1'b1;
          next_change = 3'b010;
        end
        3'b010: begin
          next_state = S3;
          next_soda =1'b0;
          next_change = 3'b000;
        end
        3'b001: begin
          next_state = S2;
          next_soda =1'b0;
          next_change = 3'b000;
        end
        default: next_state = S1;
      endcase
        
      S2: case ({i_quarter,i_dime,i_nickle})
        3'b100: begin
          next_state = S0;
          next_soda = 1'b1;
          next_change = 3'b011;
        end
        3'b010: begin
          next_state = S0;
          next_soda =1'b1;
          next_change = 3'b000;
        end
        3'b001: begin
          next_state = S3;
          next_soda =1'b0;
          next_change = 3'b000;
        end
        default: next_state = S2;
      endcase
      
      S3: case ({i_quarter,i_dime,i_nickle})
        3'b100: begin
          next_state = S0;
          next_soda = 1'b1;
          next_change = 3'b100;
        end
        3'b010: begin
          next_state = S0;
          next_soda =1'b1;
          next_change = 3'b001;
        end
        3'b001: begin
          next_state = S0;
          next_soda =1'b1;
          next_change = 3'b000;
        end
        default: next_state = S3;
      endcase
      default : begin 
        next_state <= S0;
        next_soda <= 1'b0;
        next_change <= 3'b000;
      end
      
    endcase
  end
  
endmodule


