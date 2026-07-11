class Coverage_test_Lab_9_10;
//Declaring variables 
     rand logic [ 3 : 0 ] op_code; //must be declared rand as they are in the class used in crt and functional coverage
     rand logic [ 7 : 0 ] data_in; //must be declared rand as they are in the class used in crt and functional coverage
	 
	 
	 constraint valid_opcode 
	 {
         op_code != 15;   // 15 is illegal — don't generate it in normal randomization
     }
//Declaring the covergroup
	covergroup cg;
		cp_op_code_bins :coverpoint op_code  //coverpoint for the op_code values
		{
		option.auto_bin_max = 5;
			bins ALU_operations = { 4 , 5 , 6 };
			bins LoadnStore = { 1 , 2 };
			bins Miscellanous = { 0 , 3 , 7 , 8 };
						
			ignore_bins reserved = {  9  ,  10  ,  11  ,12  };
			illegal_bins illegal = {  15  };
		}
		cp_op_code_transitions:coverpoint op_code // coverpoint for op_code transitions 
		{
		option.weight = 0; //meaninig the transitions will be excluded from the overall coverage but sill will calculate the coverage for it
      		bins LoadtoStore = ( 1 => 2 );
			bins StoretoALU = ( 2 => 4 =>5 );
		}
		cp_data_range:coverpoint data_in //coverpoint for the data
		{
			bins low = {  [ 0 : 63 ]  };
			bins mid = {  [ 64 : 127 ]  };
			bins high = {  [ 128 : 255 ]  };
			
		}
		cross cp_op_code_bins , cp_data_range //cross coverage between the op_code and data_cov
		{
		bins alu_ops_low_range = binsof(  cp_op_code_bins.ALU_operations  ) && binsof(  cp_data_range.low  );
		bins alu_ops_not_low_range = binsof (  cp_data_range ) intersect {[64:255]} && binsof ( cp_op_code_bins.ALU_operations ); //could be !binsof (cp_data_range.low) && binsof (cp_op_code_bins.ALU_operations);
		}
	endgroup
		function new(); //custom constructor to construct the covergroup
			cg = new();
		endfunction			
endclass