`timescale 1ns/1ns
module Assignment_one;

///////////////////////////////1]Declaring the needed variables for part A///////////////////////////////
  bit signed [3:0] a;
  byte unsigned b;
  shortint signed c;
  bit unsigned [ 3 : 0 ] d;
  real r;
  string mystring = "SV Assignment1";

///////////////////////////////3]Declaring the needed variables for part B///////////////////////////////
int arr_int [ 5 ]='{  1  ,  2  ,  3  ,  4  ,  5  };
logic [ 2 : 0 ][ 1 : 0 ] arr_packed='{  2'b10  ,  2'b10  ,  2'b10  };
byte arr_byte [ 4 ] = '{  10  ,  20  ,  30  ,  40  }; 

///////////////////////////////4]Declaring the needed struct///////////////////////////////
typedef struct 
{
string name;
int id;
byte grade;
}student_t;

student_t students [3];

///////////////////////////////4]Declaring the needed union///////////////////////////////
typedef union
{
int i;
byte b;
}data_u;

data_u data;


///////////////////////////////PART C : DYNAMIC ARRAY///////////////////////////////
int dyn_arr [];
int dyn_arr_copy [];





initial
begin


///////////////////////////////2]assigning values///////////////////////////////
    a = - 3;
      $display("printing the value of a=%0d",a);

    b=250;
      $display("printing the value of b=%0d",b);

     c=-12345;
      $display("printing the value of c=%0d",c);   

    d=4'b1101;
    #5;
      $display("printing the value of d=%0b",d);

    r=3.14159;
    #15;
      $display("printing the value of r=%0f",r);

      $display("printing my strin = %0s",mystring);


///////////////////////////////3]Printing the needed arrays from part B///////////////////////////////
$display("////////////////DISPLAYING ARR_INT////////////////");
foreach(  arr_int[ i ]  )
  begin
    $display("arr_int[%0d]=%0d",i, arr_int[i] );
  end

$display("////////////////DISPLAYING ARR_PACKED////////////////");
foreach(arr_packed[i])
  begin
    $display("arr_packed[%0d]=%0d",i, arr_packed[i] );
  end  


$display("////////////////DISPLAYING ARR_BYTE////////////////");
foreach(arr_byte[i])
  begin
    $display("arr_byte[%0d]=%0d",i, arr_byte[i] );
  end       

///////////////////////////////4]initialzing the structs and printing them///////////////////////////////
  students[ 0 ]='{  name : "Ali"  ,  id : 1  ,  grade : 85  };
  students[ 1 ]='{  "Sara"  ,  2  ,  92  };
  students[ 2 ]='{  "Omar"  ,  3  ,  78  };

$display("///////////////////////////////4]initialzing the structs and printing them///////////////////////////////");
foreach(  students[ i ]  )
  begin
    $display("Name:%0s,ID:%0d,Grade:%0d",students[i].name,students[i].id,students[i].grade);
  end


///////////////////////////////4]Initializing the union///////////////////////////////
data.i=32'h12345678;
$display("///////////////////////////////4]Initializing the union///////////////////////////////");
$display("data.i=%0h,data.b=%0h",data.i,data.b);
data.b=32'h12;
$display("data.i=%0h,data.b=%0h",data.i,data.b);

///////////////////////////////DYNAMIC ARRAY///////////////////////////////
dyn_arr = new[ 5 ];
dyn_arr='{5,10,15,20,25};

dyn_arr_copy = new[ 5 ](dyn_arr);

$display("///////////////////////////////DYNAMIC ARRAY///////////////////////////////");

foreach(  dyn_arr[ i ]  )
begin
  $display("dyn_arr[%0d]=%0d",  i  ,  dyn_arr[ i ]  );
end

foreach(  dyn_arr_copy[ i ]  )
begin
  $display("dyn_arr_copy[%0d]=%0d",  i  ,  dyn_arr_copy[ i ]  );
end


dyn_arr=new[20] (dyn_arr);

for(  int i = 5  ;   i <= 20  ;  i++  )
  begin
    dyn_arr[ i ] = 'hc;
  end

$display("///////////////////////////////Printing all the elements of the dyn_arr///////////////////////////////");
for(  int i = 0  ;   i < dyn_arr.size()  ;  i++  )
  begin
    $display("dyn_arr[%0d]=0x%0h",  i  ,  dyn_arr[ i ]  );
  end

$display("///////////////////////////////Printing all the elements of the dyn_arr_copy///////////////////////////////");
  foreach(  dyn_arr_copy[ i ]  )
    begin
      $display("dyn_arr_copy[%0d]=%0d",  i  ,  dyn_arr_copy[ i ]  ); 
    end

    dyn_arr_copy.delete();

   $display("///////////////////////////////Printing the size of dyn_arr_copy///////////////////////////////");
      $display("the size of dyn_arr_copy is : %0d", dyn_arr_copy.size()); 
    




end

endmodule