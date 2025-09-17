module SYS_CNTRL 
#( parameter Input_data_width = 'd8 , parameter Output_data_width = 'd8 , parameter Address_width = 'd4 )
(

//Declaring ingputs
   input wire [ Data_width - 1 : 0 ] ALU_OUT,
   input wire OUT_VALID,
   input wire [ Data_width - 1 : 0 ] RX_p_data,
   input wire RX_d_valid,
   input wire [ Data_width - 1 : 0 ] Rd_data,
   input wire RdData_valid,
   input wire FIFO_full,
   input wire CLK,
   input wire RST,

//Declaring outputs
    output reg ALU_EN,
    output reg [ 3 : 0 ] ALU_FUN,
    output reg [ Data_width - 1 : 0 ] CLK_EN,
    output reg [ Data_width - 1 : 0 ] Address,
    output reg WrEN,
    output reg RdEN,
    output reg [ Data_width - 1 : 0 ] WrData,
    output reg [ Data_width - 1 : 0 ] TX_p_data,
    output reg TX_d_valid,
    output reg clk_div_en,

);
/*
//Isolating ALU_OUT , RX_P_data and Rd_data
   input wire [ Data_width - 1 : 0 ] ALU_OUT_isolated,
   input wire [ Data_width - 1 : 0 ] RX_p_data_isolated,
   input wire [ Data_width - 1 : 0 ] Rd_data_isolated,
*/

//FSM encoding
    localparam Idle = 4'0000;
    localparam Receive_Command = 4'0001;
    localparam Register_file_address = 4'0010;
    localparam Register_file_data = 4'0011;
    localparam Read_operation = 4'0100;
    localparam Write_operation = 4'0101;
    localparam ALU_operand_A = 4'0110;
    localparam ALU_operand_B = 4'0111;
    localparam ALU_OP_code = 4'1000;
    localparam ALU_operation = 4'1001;
    localparam Send_data_TX = 4'1010;

//Declaring internal registers to store the current and next state 
    reg [ 3 : 0 ] Current_state; 
    reg [ 3 : 0 ] Next_state;

//Declaring internal registers to store the command , data to be written , ALU op code , data to be sent to the tx  and address
    reg [ 7 : 0 ] command;
    reg [ Data_width - 1 : 0 ] A;
    reg [ Data_width - 1 : 0 ] B;
    reg [ 3 : 0 ] ALU_fun;
    reg [ Address_width - 1 : 0 ] RF_Address;
    reg [ Data_width - 1 : 0 ] RF_Data;
    reg [ Data_width - 1 : 0 ] TX_data;

//making the clock divider enable always equal one 
assign clk_div_en = 1'b1;

//State transition
always@(  posedge CLK  or  negedge RST  )  
    begin
        if( !RST )
            begin
                Current_state <= Idle;
            end
                Current_state <= Next_state;
    end
//Next state logic
always@( * )
    begin
        case( Current_state )
        Idle:
            begin
                if( RX_d_valid )
                    Next_state = Receive_Command;
                else
                    Next_state = Idle;
            end

        Receive_Command:
            begin
                case( command )  
                8'hAA: Next_state = Register_file_address;
                8'hBB: Next_state = Register_file_address;
                8'hCC: Next_state = ALU_operand_A;
                8'hDD: Next_state = ALU_OP_code;
                default: Next_state = Idle;
                endcase              
            end

        Register_file_address:
            begin
                if( RX_d_valid )
                    begin
                        if( command == 8'hAA )
                            Next_state = Register_file_data;
                        else if( command == 8'BB )
                            Next_state = Read_operation;
                        else
                            Next_state = Idle;
                    end
                else 
                    Next_state = Current_state;
            end

        Register_file_data:
            begin
                if( RX_d_valid )
                    Next_state = Write_operation;
                else
                Next_state = Current_state; 
            end

        Read_operation:
            begin
                if( RdData_valid )
                    Next_state = Send_data_TX;
                else
                    Next_state = Current_state;
            end

        Write_operation:
            begin
                Next_state = Send_data_TX;
            end

        ALU_operand_A:
            begin
                if( RX_d_valid )
                    Next_state = ALU_operand_B;
                else 
                    Next_state = Current_state;
            end

        ALU_operand_B:
            begin
                if( RX_d_valid )
                    Next_state = ALU_OP_code;
                else 
                    Next_state = Current_state;
            end

        ALU_OP_code:
            begin
                if( RX_d_valid )
                    Next_state = ALU_operation;
                else 
                    Next_state = Current_state;
            end

        ALU_operation:
            begin
                if( OUT_VALID )
                    Next_state = Send_data_TX;
                else
                    Next_state = Current_state;
            end

        Send_data_TX:
            begin
                Next_state = Idle;
            end

        default : Next_state = Idle;
        endcase
    end


//Output logic 
always@( * )
    begin
//Default values
    ALU_EN = 0;
    ALU_FUN = 4'b1000;
    CLK_EN = 0;
    WrEN = 0;
    RdEN = 0;
    TX_p_data = 0;
    TX_d_valid = 0;

    Address = RF_Address ;
    WrData = RF_Data ;
    ALU_FUN = ALU_fun;
    
    
            case( Current_state )
            Idle:
                begin

                end

            Receive_Command:
                begin    
                    if( RX_d_valid )
                        command = RX_P_data;                     
                end

            Register_file_address:
                begin
                    if( RX_d_valid )
                        RF_Address = RX_P_data; 
                end

            Register_file_data:
                begin
                    if( RX_d_valid )
                        RF_Data = RX_P_data; 

                end

            Read_operation:
                begin
                    RdEN = 1;
                end

            Write_operation:
                begin
                    WrEN = 1;
                    WrData = RF_Data; 
                end

            ALU_operand_A:
                begin
                    if( RX_d_valid )
                        begin
                            WrEN = 1;
                            Address = 'h00;
                            WrData = RX_P_data;  
                        end
                end

            ALU_operand_B:
                begin
                    if( RX_d_valid )
                        begin
                            WrEN = 1;
                            Address = 'h01;
                            WrData = RX_P_data;  
                        end
                end

            ALU_OP_code:
                begin
                    if( RX_d_valid )
                    ALU_fun = RX_P_data; 
                end

            ALU_operation:
                begin
                    CLK_EN = 1;
                    ALU_EN = 1;
                end
                
            Send_data_TX:
                begin
                    if( !FIFO_full ) 
                        TX_p_data = TX_data;
                        TX_d_valid = 1; 
                end
            default:
                begin

                end    
            endcase
    end

//Registering     
/*
always@( posedge CLK or negedge RST )
    begin
        if( !RST )
            begin
                   input wire [ Data_width - 1 : 0 ] ALU_OUT_isolated,
   input wire [ Data_width - 1 : 0 ] RX_p_data_isolated,
   input wire [ Data_width - 1 : 0 ] Rd_data_isolated,
       reg [ 7 : 0 ] command;
    reg [ Data_width - 1 : 0 ] A;
    reg [ Data_width - 1 : 0 ] B;
    reg [ 3 : 0 ] ALU_fun;
    reg [ Address_width - 1 : 0 ] RF_Address;
    reg [ Data_width - 1 : 0 ] RF_Data;
   
            end
        else 
    end
    */
endmodule 