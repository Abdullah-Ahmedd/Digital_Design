package class_package;




class MyCounter;
//Declaring instances
    string name;
    int count;

//Declaring a static attribute 
    static int total_count;

//Declaring the constructor
function new (  string n = "null"  );
    begin
        name = n;
        count = 0;
    end
endfunction

//Declaring the increment function
function void increment ();
    count++;
    total_count++;
endfunction

//Declaring the display function
function void display();
    $display("the current counter's name is :%0s", name);
    $display("the current conter's count us :%0d" ,count);
endfunction

//static method to display
static function void display_total ();
    $display("displaying the total count using the static method");
    $display("the total count is %0d", total_count );
endfunction 
endclass




endpackage