// good_module.v
module good_module (
    input wire a,
    input wire b,
    output wire y
);
    assign y = a & b;
endmodule

