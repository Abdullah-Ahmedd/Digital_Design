module ALU_16B
(

//Declaring input
    input wire [15:0] A,
    input wire [15:0] B,
    input wire [3:0] ALU_FUN,
    input wire CLK,

//Declaring outputs
    output reg [15:0] ALU_OUT,
    output reg Carry_Flag, //Carry bit for addition and borrow flag for subtraction
    output reg Arith_Flag, //raised when addition,subtraction , multiplcation or division is happening 
    output reg Logic_Flag,
    output reg CMP_Flag,
    output reg Shift_Flag

);

//Defining the ALU_FUN values 
    localparam ADD=4'b0000;
    localparam SUB=4'b0001;
    localparam MUL=4'b0010;
    localparam DIV=4'b0011;
    localparam AND=4'b0100;
    localparam OR=4'b0101;
    localparam NAND=4'b0110;
    localparam NOR=4'b0111;
    localparam XOR=4'b1000;
    localparam XNOR=4'b1001;
    localparam CMPEQ=4'b1010; //returns 1 if A=B else returns 0
    localparam CMPG=4'b1011; //Returns 2 if  A>B else returns 0
    localparam CMPL=4'b1100; //Returns 3 if  A<B else returns 0
    localparam SHR=4'b1101; //shift right A by 1 bit
    localparam SHL=4'b1110; //shift left A by 1 bit

always@(posedge CLK)
    begin
//Defualt flag values at the beginning of every clock
        Carry_Flag<=1'b0;
        Arith_Flag<=1'b0;
        Logic_Flag<=1'b0;
        CMP_Flag<=1'b0;
        Shift_Flag<=1'b0;

        case(ALU_FUN)
        ADD: //Addition
            begin

                {Carry_Flag,ALU_OUT}<= A + B ;
                Arith_Flag<=1'b1;

            end

        SUB: //Subtraction
            begin

                {Carry_Flag,ALU_OUT}<= A - B;
                Arith_Flag<=1'b1;

            end

        MUL: //Multiplication 
            begin

                ALU_OUT<= A * B;
                Arith_Flag<=1'b1;

            end  
        
        DIV: //Division
            begin

                if (B != 0)
                    begin
                        ALU_OUT <= A / B;
                    end
                else
                    begin
                        ALU_OUT <= 16'd0; //Handling division by zero (Assumuing anything divided by zero gives zero)
                    end
                        Arith_Flag<=1'b1;

            end  

        AND: //AND
            begin

               ALU_OUT<= A & B;
               Logic_Flag<=1'b1; 

            end

        OR: //OR
            begin

               ALU_OUT<= A | B;
               Logic_Flag<=1'b1; 
               
            end
            
        NAND: //NAND
            begin

               ALU_OUT<= ~( A & B );
               Logic_Flag<=1'b1; 
               
            end

        NOR: //NOR
            begin

               ALU_OUT<= ~( A | B );
               Logic_Flag<=1'b1; 
               
            end

        XOR: //XOR
            begin

               ALU_OUT<= ( A ^ B );
               Logic_Flag<=1'b1; 
               
            end  

        XNOR: //XNOR
            begin

               ALU_OUT<= ~( A ^ B );
               Logic_Flag<=1'b1; 
               
            end 

        CMPEQ: // Checks if A = B
            begin

               ALU_OUT<= ( A == B )? 16'd1 : 16'd0 ;
               CMP_Flag<=1'b1; 
               
            end

        CMPG:// Checks if A > B
            begin

               ALU_OUT<= ( A > B ) ? 16'd2 : 16'd0 ;
               CMP_Flag<=1'b1; 
               
            end
      
        CMPL: // Checks if A < B
            begin

               ALU_OUT<= ( A < B ) ? 16'd3 : 16'd0 ;
               CMP_Flag<=1'b1; 
               
            end

        SHR: //shift right A by 1 bit
            begin

               ALU_OUT<= A >> 1;
               Shift_Flag<=1'b1; 
               
            end

        SHL: //shift left A by 1 bit
            begin

               ALU_OUT<= A << 1;
               Shift_Flag<=1'b1; 
               
            end            

        default:
            begin
                Carry_Flag<=1'b0;
                Arith_Flag<=1'b0;
                Logic_Flag<=1'b0;
                CMP_Flag<=1'b0;
                Shift_Flag<=1'b0;
            end

        endcase

    end

endmodule     