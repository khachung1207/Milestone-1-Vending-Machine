// Code your testbench here
// or browse Examples

module tb_vending_machine;
  reg i_clk;
  reg i_nickle, i_dime, i_quarter;
  wire o_soda;
  wire [2:0] o_change;
  
  vending_machine dut(
    .i_clk(i_clk),
    .i_nickle(i_nickle),
    .i_dime(i_dime),
    .i_quarter(i_quarter),
    .o_soda(o_soda),
    .o_change(o_change)
  );
  
  initial begin
    i_clk =0 ;
    forever #5 i_clk = ~i_clk;
  end
  
  initial begin
    
    #5 i_nickle = 0;
       i_dime = 0;
       i_quarter = 0;

    // Apply test vectors
    // Apply first Nickel (5¢)
    #10 i_dime = 1; 
    #10 i_dime = 0;

    // Apply second Dime (10¢)
    #10 i_quarter = 1; 
    #10 i_quarter = 0;

    // Apply Quarter (25¢)
    #10 i_nickle = 1;
    #10 i_nickle = 0;
    	i_dime =1;
    #10 i_dime = 0;
    	i_quarter =1;
    #10 i_quarter = 0;

   

    // Finish simulation after sufficient time
    #100;
    $finish;
  end
endmodule
  