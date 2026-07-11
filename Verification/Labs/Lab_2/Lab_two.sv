module Lab_two();

    string seq_queue [ $ ];
    string temp;

initial 
begin
    ////////////////////////////////1] adding 3 strings////////////////////////////////
    seq_queue[ 0 ] ="seq3";
    seq_queue[ 1 ] ="seq4";
    seq_queue[ 2 ] ="seq5";

         ////////////////////////////////2] adding 2 strings////////////////////////////////
   seq_queue.push_front("seq2");
   seq_queue.push_front("seq1");

        ////////////////////////////////BONUS] displaying the current queue////////////////////////////////
        $display("////////////////////////////////BONUS] displaying the current queue////////////////////////////////");
        foreach(seq_queue[i])
            begin
                 $display("Queue has %0s",seq_queue[i]);
            end

        ////////////////////////////////3] displaying the size of the queue////////////////////////////////
        $display("////////////////////////////////3] displaying the size of the queue////////////////////////////////");
        $display("The size of the queue is %0d" ,seq_queue.size() );


        ////////////////////////////////4] removing the front and last element////////////////////////////////
        $display("////////////////////////////////4] removing the front and last element////////////////////////////////");
        temp= seq_queue.pop_front();
        $display("The poped front element is %0s", temp);
                temp= seq_queue.pop_back();
        $display("The poped front element is %0s", temp);


        ////////////////////////////////6] displaying the current queue////////////////////////////////
        $display("////////////////////////////////6] displaying the current queue////////////////////////////////");
        foreach(seq_queue[i])
            begin
                 $display("element %0d of the queue is %0s",i, seq_queue[i]);
            end


        ////////////////////////////////7] removing all elements at odd indicies////////////////////////////////
        $display("////////////////////////////////7] removing all elements at odd indicies////////////////////////////////");
        for (int i =0 ; i<=seq_queue.size() ;i++)
            begin
                if( i %2 ==0 )
                    begin
                        continue;
                    end
                else
                    begin
                        seq_queue.delete(i);
                    end
            end
        foreach(seq_queue[i])
            begin
                 $display("element %0d of the queue is %0s",i, seq_queue[i]);
            end

        ////////////////////////////////8] deleting the whole queue////////////////////////////////
        $display("////////////////////////////////8] deleting the whole queue////////////////////////////////");
        seq_queue.delete();
        $display("the queue size after deletions is %0d",seq_queue.size());
end
endmodule