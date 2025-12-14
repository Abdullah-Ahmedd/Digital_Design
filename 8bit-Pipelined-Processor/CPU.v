`include "adder.v"
`include "ALU.v"
`include "CCR.v"
`include "CU.v"
`include "Data_memory.v"
`include "EX_MEM_Reg.v"
`include "Hazard_unit.v"
`include "ID_EX_Reg.v"
`include "IF_ID_Reg.v"
`include "Instruction_memory.v"
`include "MEM_WB_Reg.v"
`include "mux_2x1_en.v"
`include "mux_2x1.v" 
`include "mux_4x1.v"
`include "mux_4x1_2bits.v"
`include "pc.v"
`include "Register_file.v"

module CPU 
(
//Declaring inputs
    input wire CLK,
    input wire RST,
    input wire [ 7 : 0 ] INPUT,
    input wire INTR_in,
//Declaring outputs 
    output wire [ 7 : 0 ] OUTPUT
);
//////////////////////////////////////////////////////////////////////////////////////
                                   // Internal wires //
/////////////////////////////////////////////////////////////////////////////////////

wire [ 7 : 0 ] PC_P_one_internal; // output of PC+1
wire [ 7 : 0 ] M0_internal ; // M0
wire [ 7 : 0 ] M1_internal; // M1
wire [ 7 : 0 ] MUX_OUT_OUTPUT_internal; //JUMP
wire [ 1 : 0 ] PC_Sel_internal; //Selection lines of the MUX_PC
wire [ 7 : 0 ] pc_in_internal; //PC input 

wire stall_F_internal; //PC enable 
wire [ 7 : 0 ] pc_out_internal; //Program counter output

wire [ 7 : 0 ] RD_IM_internal; //Read data output (From the instruction memory)

wire [ 7 : 0 ] pc_out_internal_FD_Stage_output; //output of the Program counter from the fetch decode-stage register
wire [ 7 : 0 ] PC_P_one_internal_FD_Stage_output; // output of PC+1 from the fetch decode-stage register
wire stall_D_internal; //Stall fetch decode-stage register control signal
wire flush_D_internal; //flush fetch decode-stage register control signal
wire [ 7 : 0 ] RD_IM_internal_FD_Stage_output;

wire [ 3 : 0 ] CCR_OUT_internal; //CCR output 
wire [ 1 : 0 ] old_rb_internal; //Old rb
wire [ 1 : 0 ] MUX_RDATA_Sel_internal; //MUX_RDATA selection line
wire [ 1 : 0 ] MUX_DMEM_WD_Sel_internal; //MUX_DMEM_WD selection line
wire [ 1 : 0 ] MUX_DMEM_A_Sel_internal; //MUX_DMEM_A selection line 
wire MUX_OUT_Sel_internal; //MUX out selection line
wire [ 1 : 0 ] ADDR_Sel_internal; //Regf Addr MUX selection line
wire branch_taken_E_internal; //Hazard unit signals
wire is_2byte_D_internal; //Hazard unit signal
wire F_Save_internal; //CCR unit signal
wire F_Restore_internal; //CCR unit signal
wire SP_Sel_internal; //Hazard unit signal
wire RD2_Sel_internal; //MUX_RD2 selection line 
wire OUT_PORT_sel_internal; //output port mux ENABLE
wire wr_en_dmem_internal; //Data memory write enable
wire rd_en_internal; //Data memory read enable 
wire wr_en_regf_internal; //Register file write enable
wire is_ret_internal; //Control unit signal 
wire [ 5 : 0 ] alu_control_internal; //ALU control signal
wire [ 1 : 0 ] ADDER_internal_Regf_Addr_MUX; //Register file address 

wire [ 7 : 0 ] SP_INC_DEC_internal; //Stack pointer after being incremeneted/decremented
wire [ 7 : 0 ] RD_IM_internal_MWB_Stage_output; //Red data of the instruction memory outputted from the memory write back-stage register
wire [ 7 : 0 ] RDATA_internal; //Read data of the register file
wire [ 7 : 0 ] MUX_RDATA_Sel_internal_MWB_Stage_output; //MUX_RDATA selection line outputted from the memory write back-stage register

wire [ 7 : 0 ] MUX_SP_OUTPUT_internal; //output of the stack pointer mux  

wire [ 7 : 0 ] SP_internal; //Stack pointer before begin incremented/decremented

wire [ 1 : 0 ] ADDER_internal_MWB_Stage_output; // Register file output outputted from the memory write back-stage register
wire wr_en_regf_internal_WMB_Stage_output; //Write enable of the rgister file outputted from the memory write back-stage register 
wire [ 7 : 0 ] RD1_internal; //Register file output 1
wire [ 7 : 0 ] RD2_internal; //Register file output 2




/////////////////////////////////////////////////////////////////////////////////////
                                // Modules instantiation //
////////////////////////////////////////////////////////////////////////////////////

//Mux PC
mux_4x1 MUX_PC 
(
.i0( PC_P_one_internal ),    
.i1( M0_internal ),   
.i2( M1_internal ),   
.i3( MUX_OUT_OUTPUT_internal ),    
.s0( PC_Sel_internal[0] ),
.s1( PC_Sel_internal[1] ),
.out( pc_in_internal )
);

//PC
pc PC
(
.clk( CLK ),
.enable( stall_F_internal ), 
.pc_in( pc_in_internal ),
.pc_out( pc_out_internal )
);

//PC_adder
adder PC_adder
(
.a( pc_out_internal ),
.b( 8'b00000001 ),     
.sum( PC_P_one_internal ) 
);

//Instruction memory
Instruction_memory I_memory
(
.A( pc_out_internal ),
.CLK( CLK ),
.RST( RST ),
.RD( RD_IM_internal ),
.M0( M0_internal ),
.M1( M1_internal )
);

// Fetch-Decode register
IF_ID_Reg Fetch_Decode_Register
(
.clk( CLK ),
.reset( RST ),
.stall_D( stall_D_internal ),   
.flush_D( flush_D_internal ),  
.instr_in( RD_IM_internal ),     
.pc_reg_in( pc_out_internal ),     
.pc_plus_1_in( PC_P_one_internal ), 
.instr_out( RD_IM_internal_FD_Stage_output ),
.pc_reg_out( pc_out_internal_FD_Stage_output ),
.pc_plus_1_out( PC_P_one_internal_FD_Stage_output )
);


//Control unit 
CU Control_unit 
(
.clk( CLK ),
.rst( RST ), 
.opcode( RD_IM_internal_FD_Stage_output ),      
.flags( CCR_OUT_internal ),             
.INTR_in( INTR_in ), 
.old_rb( old_rb_internal ),
.MUX_RDATA_Sel( MUX_RDATA_Sel_internal ),
.MUX_DMEM_WD_Sel( MUX_DMEM_WD_Sel_internal ),
.MUX_DMEM_A_Sel( MUX_DMEM_A_Sel_internal ),
.MUX_OUT_Sel( MUX_OUT_Sel_internal ),
.PC_Sel( PC_Sel_internal ),
.ADDR_Sel( ADDR_Sel_internal ),
.branch_taken_E(branch_taken_E_internal),
.is_2byte_D( is_2byte_D_internal ),
.F_Save( F_Save_internal ),
.F_Restore( F_Restore_internal ),
.SP_Sel( SP_Sel_internal ),
.RD2_Sel(RD2_Sel_internal),
.OUT_PORT_sel( OUT_PORT_sel_internal ),
.wr_en_dmem( wr_en_dmem_internal ),
.rd_en( rd_en_internal ),
.wr_en_regf( wr_en_regf_internal ),
.is_ret( is_ret_internal ),
.alu_control( alu_control_internal )
);

//Regf Addr MUX
mux_4x1_2bits Regf_Addr_MUX
(
.i0( RD_IM_internal_FD_Stage_output [ 1 : 0 ] ),    
.i1( RD_IM_internal_FD_Stage_output [ 2 : 1 ] ),   
.i2( 2'd3 ),   
.i3( old_rb_internal ),    
.s0( ADDR_Sel_internal[ 0 ] ),
.s1( ADDR_Sel_internal[ 1 ] ),
.out( ADDER_internal_Regf_Addr_MUX )
);

//MUX RDATA
mux_4x1 MUX_RDATA
(
.i0( SP_INC_DEC_internal ),    
.i1( INPUT ),   
.i2( MUX_OUT_OUTPUT_internal ),   
.i3( RD_IM_internal_MWB_Stage_output ),    
.s0( MUX_RDATA_Sel_internal_MWB_Stage_output [ 0 ] ),
.s1( MUX_RDATA_Sel_internal_MWB_Stage_output[ 1 ] ),
.out( RDATA_internal )
);

//MUX_SP
 mux_2x1 MUS_SP
 (
.i0( 8'hff ),    
.i1( 8'h01 ),   
.s( SP_Sel_internal ),    
.out( MUX_SP_OUTPUT_internal )    
);

//SP_adder_subtractor
adder SP_ADD_SUB 
(
.a( SP_internal ),
.b( MUX_SP_OUTPUT_internal ),     
.sum( SP_INC_DEC_internal ) 
);

//Register file 
Register_file Reg_file 
(
.clk( CLK ),
.rst( RST ),
.RA( RD_IM_internal_FD_Stage_output [ 3 : 2 ] ),      
.RB( RD_IM_internal_FD_Stage_output [ 1 : 0 ] ),      
.ADDER( ADDER_internal_MWB_Stage_output ),      
.RDATA( RDATA_internal ),
.wr_en( wr_en_regf_internal_WMB_Stage_output ),
.RD1( RD1_internal ),
.RD2( RD2_internal ),
.SP( SP_internal )
);



endmodule 