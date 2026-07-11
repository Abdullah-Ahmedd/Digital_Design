class Coverage_test;
//Declaring variables 
     rand logic [ 3 : 0 ] op_code; //must be declared rand as they are in the class used in crt and functional coverage
     rand logic [ 7 : 0 ] data_in; //must be declared rand as they are in the class used in crt and functional coverage
	 
	 
	 constraint valid_opcode 
	 {
         op_code != 15;   // 15 is illegal don't generate it in normal randomization
     }
//Declaring the covergroup
	covergroup cg;
		coverpoint op_code  //coverpoint for the op_code
		{
			bins ALU_operations = { 4 , 5 , 6 };
			bins LoadnStore = { 1 , 2 };
			bins Miscellanous = { 0 , 3 , 7 , 8 };
			
			bins LoadtoStore = ( 1 => 2 );
			bins StoretoALU = ( 2 => 4 =>5 );
			
			ignore_bins reserved = {  9  ,  10  ,  11  ,12  };
			illegal_bins illegal = {  15  };
		}
		coverpoint data_in //coverpoint for the data
		{
			bins low = {  [ 0 : 63 ]  };
			bins mid = {  [ 64 : 127 ]  };
			bins high = {  [ 128 : 255 ]  };
			
		}
		
	endgroup
		function new(); //custom constructor to construct the covergroup
			cg = new();
		endfunction			
endclass