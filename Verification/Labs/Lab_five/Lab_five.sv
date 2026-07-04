module Lab_five;
//Importing the class needed
    import class_package ::* ;
//Declaring the class objects
MyCounter c1,c2; 

initial 
begin
    c1 = new( "c1" );
    c2 = new( "c2" );
    
    c1.increment();
    c2.increment();
    c1.increment();

    //Diplaying the count of every object
    c1.display();
    c2.display();

    //Diplaying the total count using the static method
    MyCounter::display_total();

end

endmodule

