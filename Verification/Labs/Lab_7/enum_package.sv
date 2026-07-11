package enum_package;

typedef enum logic [ 7 : 0 ]
{ 
CMD_NOP = 8'h00,
CMD_READ = 8'h01,
CMD_WRITE = 8'h02,
CMD_RESET = 8'hff
} cmd_e;    


endpackage