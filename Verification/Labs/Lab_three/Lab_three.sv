module Lab_three();
    int score [ string ];

initial
begin
    

    string key;
    string target;

///////////////// 1] inserting the three values /////////////////
    score [ "Alice" ] = 85;
    score [ "Bob" ] = 92;
    score [ "Charlie" ] = 78;

///////////////// 2] Displaying Alice and Bob /////////////////
$display ("///////////////// 2] Displaying Alice and Bob /////////////////");
        $display("Alice's score is : %0d", score["Alice"] ) ;
        $display("Bob's score is : %0d", score["Bob"] ) ;

///////////////// 3] Updating Bob to 95 /////////////////
$display ("///////////////// 3] Updating Bob to 95 /////////////////");
        score [ "Bob" ] = 95;
        $display("Bob's new score is : %0d", score["Bob"] ) ;

///////////////// 4] Itterating over all keys and values using foreach /////////////////
$display ("///////////////// 4] Itterating over all keys and values using foreach /////////////////");
       foreach( score[ key ] )
        begin
            $display("Student name is : %0s" ,key);
            $display("Having a score : %0d" , score[ key ]);
        end


///////////////// 5] Itterating over all keys and values using first and next /////////////////
$display ("///////////////// 5] Itterating over all keys and values using first and next /////////////////");
    score.first(key);
    do
        begin
            $display("Student name is : %0s" ,key);
            $display("Having a score : %0d" , score[ key ]);
        end
    while(score.next( key ));

///////////////// 6] Checking if Diana exists /////////////////
$display ("///////////////// 6] Checking if Diana exists /////////////////");
target="Diana";
if(  score.exists(target) == 1  )
$display("our student target %0s exists" , target);
else
$display("our student target %0s does NOT exist" , target);

///////////////// 7] Deleting charlie /////////////////
$display ("///////////////// 7] Deleting charlie /////////////////");
    target="Charlie";
    if(  score.exists(target) == 1  )   
        begin
            $display("our student target %0s exists" , target);
            $display ("deleting our target");
            score.delete(target);
        end
    else
        begin
            $display("our student target %0s does NOT exist" , target);
            $display ("our target cannot be deleted");
        end
$display ("///////////////// Itterating over all keys and values using foreach /////////////////");
       foreach( score[ key ] )
        begin
            $display("Student name is : %0s" ,key);
            $display("Having a score : %0d" , score[ key ]);
        end


///////////////// 8] Deleting the whole array /////////////////
$display ("///////////////// 8] Deleting the whole array /////////////////");
    score.delete();
    $display("Verifying the deletion of the array");
    $display("Now the size of array is %0d", score.size());

end
endmodule 