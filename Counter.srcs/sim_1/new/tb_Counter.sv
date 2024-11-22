`timescale 1ns / 1ps

module tb_Counter #(parameter bits = 8);

  logic clk, rst_n, en, load;
  logic [bits-1:0] d;
  logic [bits-1:0] q;

  Counter #(bits) counter1 (
      .clk(clk),
      .rst_n(rst_n),
      .en(en),
      .load(load),
      .d(d),
      .q(q)

  );

  
  initial begin
    rst_n = 1'b1;
    #1 rst_n = 1'b0;
    #2 clk = 1'b0;
    rst_n = 1'b1;
    en = 1'b1;
    load = 1'b0;
    d = 0;

    repeat (36) #3 clk = ~clk;
    en = 1'b0;
    repeat (8) #3 clk = ~clk;
    en = 1'b1;
    repeat (36) #3 clk = ~clk;
    load = 1'b1;

    repeat (8) begin
      #3 clk = ~clk;
      d = d + 1;
    end
    $finish;
  end


endmodule

