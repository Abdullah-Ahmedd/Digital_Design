module Lab_one;

  // ── Function with input AND output ports ──────────────────────
  function automatic void add_with_carry (
    input  bit [7:0] a,
    input  bit [7:0] b,
    output bit [7:0] sum,
    output bit       carry
  );
    bit [8:0] temp;
    temp  = {1'b0, a} + {1'b0, b};  // 9-bit addition
    sum   = temp[7:0];
    carry = temp[8];
  endfunction

  // ── Variables ─────────────────────────────────────────────────
  bit [7:0] a, b, sum;
  bit       carry;

  // ── Test ──────────────────────────────────────────────────────
  initial begin
    $display("─────────────────────────────────────────");
    $display("  a      b      sum    carry");
    $display("─────────────────────────────────────────");

    // Test 1: no carry
    a = 8'd10;  b = 8'd20;
    add_with_carry(a, b, sum, carry);
    $display("  %0d \t %0d \t %0d \t %0d", a, b, sum, carry);

    // Test 2: carry generated
    a = 8'd200;  b = 8'd100;
    add_with_carry(a, b, sum, carry);
    $display("  %0d \t %0d \t %0d \t %0d", a, b, sum, carry);

    // Test 3: max + max
    a = 8'd255;  b = 8'd255;
    add_with_carry(a, b, sum, carry);
    $display("  %0d \t %0d \t %0d \t %0d", a, b, sum, carry);

    $display("─────────────────────────────────────────");
    $finish;
  end

endmodule