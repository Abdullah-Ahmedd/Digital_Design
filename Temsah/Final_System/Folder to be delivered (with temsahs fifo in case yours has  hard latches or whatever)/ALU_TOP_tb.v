`timescale 1ns/1ps
`include "ALU_TOP.v"
module tb_ALU_TOP;

  // Parameters
  parameter Width = 16;

  // Testbench signals
  reg signed [Width-1:0] A, B;
  reg [3:0] ALU_FUN;
  reg CLK, RST;

  wire signed [(2*Width)-1:0] Arith_OUT;
  wire [Width-1:0] Logic_OUT, Shift_OUT, CMP_OUT;
  wire Arith_Flag, Logic_Flag, Shift_Flag, CMP_Flag;

  // Instantiate DUT
  ALU_TOP #(Width) DUT (
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN),
    .CLK(CLK),
    .RST(RST),
    .Arith_OUT(Arith_OUT),
    .Logic_OUT(Logic_OUT),
    .Shift_OUT(Shift_OUT),
    .CMP_OUT(CMP_OUT),
    .Arith_Flag(Arith_Flag),
    .Logic_Flag(Logic_Flag),
    .Shift_Flag(Shift_Flag),
    .CMP_Flag(CMP_Flag)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 100 MHz clock
  end

  // Local expected results
  reg signed [(2*Width)-1:0] exp_arith;
  reg [Width-1:0] exp_logic, exp_shift, exp_cmp;
  reg exp_af, exp_lf, exp_sf, exp_cf;

  // === Task to check outputs immediately ===
  task check_outputs;
    input [3:0] func;
    begin
      case (func)
        // ---------------- Arithmetic ----------------
        4'b0000: begin // ADD
          exp_arith = A + B;
          exp_af    = 1;
          if (Arith_OUT !== exp_arith)
            $error("ADD mismatch! A=%0d B=%0d DUT=%0d EXP=%0d", A, B, Arith_OUT, exp_arith);
        end
        4'b0001: begin // SUB
          exp_arith = A - B;
          exp_af    = 1;
          if (Arith_OUT !== exp_arith)
            $error("SUB mismatch! A=%0d B=%0d DUT=%0d EXP=%0d", A, B, Arith_OUT, exp_arith);
        end

        // ---------------- Logic ----------------
        4'b0100: begin // AND
          exp_logic = A & B;
          exp_lf    = 1;
          if (Logic_OUT !== exp_logic)
            $error("AND mismatch! A=%h B=%h DUT=%h EXP=%h", A, B, Logic_OUT, exp_logic);
        end
        4'b0101: begin // OR
          exp_logic = A | B;
          exp_lf    = 1;
          if (Logic_OUT !== exp_logic)
            $error("OR mismatch! A=%h B=%h DUT=%h EXP=%h", A, B, Logic_OUT, exp_logic);
        end

        // ---------------- Shift ----------------
        4'b1000: begin // SHL
          exp_shift = A << B;
          exp_sf    = 1;
          if (Shift_OUT !== exp_shift)
            $error("SHL mismatch! A=%h B=%0d DUT=%h EXP=%h", A, B, Shift_OUT, exp_shift);
        end
        4'b1001: begin // SHR
          exp_shift = A >> B;
          exp_sf    = 1;
          if (Shift_OUT !== exp_shift)
            $error("SHR mismatch! A=%h B=%0d DUT=%h EXP=%h", A, B, Shift_OUT, exp_shift);
        end

        // ---------------- Compare ----------------
        4'b1100: begin // EQ
          exp_cmp = (A == B) ? 1 : 0;
          exp_cf  = 1;
          if (CMP_OUT !== exp_cmp)
            $error("CMP_EQ mismatch! A=%0d B=%0d DUT=%h EXP=%h", A, B, CMP_OUT, exp_cmp);
        end
        4'b1101: begin // GT
          exp_cmp = (A > B) ? 1 : 0;
          exp_cf  = 1;
          if (CMP_OUT !== exp_cmp)
            $error("CMP_GT mismatch! A=%0d B=%0d DUT=%h EXP=%h", A, B, CMP_OUT, exp_cmp);
        end
      endcase
    end
  endtask

  // Stimulus
  initial begin
    // Reset
    RST = 0; A = 0; B = 0; ALU_FUN = 0;
    #12;
    RST = 1;

    // === Apply tests ===
    @(posedge CLK);
    A = 10; B = 5; ALU_FUN = 4'b0000; // ADD
    @(posedge CLK); check_outputs(ALU_FUN);

    @(posedge CLK);
    A = 15; B = 7; ALU_FUN = 4'b0001; // SUB
    @(posedge CLK); check_outputs(ALU_FUN);

    @(posedge CLK);
    A = 16'hFF00; B = 16'h0FF0; ALU_FUN = 4'b0100; // AND
    @(posedge CLK); check_outputs(ALU_FUN);

    @(posedge CLK);
    A = 16'hAA55; B = 16'h00FF; ALU_FUN = 4'b0101; // OR
    @(posedge CLK); check_outputs(ALU_FUN);

    @(posedge CLK);
    A = 16'h000F; B = 2; ALU_FUN = 4'b1000; // SHL
    @(posedge CLK); check_outputs(ALU_FUN);

    @(posedge CLK);
    A = 25; B = 25; ALU_FUN = 4'b1100; // EQ
    @(posedge CLK); check_outputs(ALU_FUN);

    @(posedge CLK);
    A = 30; B = 10; ALU_FUN = 4'b1101; // GT
    @(posedge CLK); check_outputs(ALU_FUN);

    // Done
    #20 $display("All tests finished.");
    $finish;
  end

endmodule
