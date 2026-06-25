module Lab_one ();
//===========1) Declarations ===========
    bit [ 7 : 0 ] arr1 [ 5 ];
    bit [ 2 : 0 ] [ 7 : 0 ] arr2;
    bit [ 7 : 0 ] arr3 [ 2 : 0 ];
    byte darr [];

initial 
    begin
    

//===========2) Itterations ===========
for (  int i = 0  ;  i <= 4  ;  i++  )
    begin
        arr1[ i ] = 2 * i;
    end
$display("================== PART 2 RESULT ==================");
foreach( arr1 [ i ] )
    begin
        $display(  "arr1[%0d]=%0d" ,  i  ,  arr1[ i ]  );
     end
//===========3) 24-bit array ===========
    arr2=24'hFFFFFF;
$display("================== PART 3 RESULT ==================");
    foreach(  arr2 [ i ]  )
        begin
            $display(  "arr2[%0h]=%0h" ,  i   ,  arr2[ i ] );
        end
//===========4) Unpacked static arrays vectors ===========
    arr3[ 0 ] = 8'hAA;
    arr3[ 1 ] = 8'hBB;
    arr3[ 2 ] = 8'hCC;
$display("================== PART 4 RESULT ==================");
    foreach(  arr3 [ i ]  )
    begin
        $display(  "arr3[%0h]=%0h" ,  i   ,  arr3[ i ] );
    end

//===========5) Allocating the dynamic array ===========
darr = new[ 5 ];

    foreach(  arr1[ i ]  )
        begin
            darr[ i ] = arr1[ i ] ;
        end
    
    $display("================== PART 5 RESULT ==================");
    foreach(  darr [ i ]  )
        begin
            $display(  "darr[%0d]=%0d" ,  i   ,  darr[ i ] );
        end

//===========6) Resizing the dynamic array ===========
    darr = new[ 7 ]( darr );
    darr[ 5 ] = 8'hab;
    darr[ 6 ] = 8'hcd;

$display("================== PART 6 RESULT ==================");
    foreach(  darr [ i ]  )
        begin
            $display(  "darr[%0d]=%0h" ,  i   ,  darr[ i ] );
        end
//===========7) Deleting the last element of the dynamic array ===========
    darr = new[  darr.size() - 1  ] (  darr  );
$display("================== PART 7 RESULT ==================");
    foreach(  darr [ i ]  )
        begin
            $display(  "darr[%0d]=%0h" ,  i   ,  darr[ i ] );
        end

//===========8) Deleting the dynamic array ===========
    darr.delete();
$display("================== PART 7 RESULT ==================");
    
    $display( "the size of the dynamic array after deletion is %0d", darr.size() );

    end


endmodule