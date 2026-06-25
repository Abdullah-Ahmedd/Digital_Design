module lab1();

  // ===== 1) Declarations =====
  bit [7:0] arr1 [5];        // static UNPACKED array, 5 elements, each 8 bits
  bit [2:0][7:0] arr2;       // static PACKED array, 3 elements, each 8 bits (24-bit total vector)
  bit [7:0] arr3 [3];        // static UNPACKED array of vectors, size 3, each 8 bits
  byte      darr [];         // dynamic array of 8-bit elements, no initial allocation

  initial begin

    // ---------- 2) Initialize arr1 using for loop: double the index ----------
    $display("=== Part 2: arr1 initialized with 2*i ===");
    for (int i = 0; i < 5; i++)
      arr1[i] = 2 * i;

    foreach (arr1[i])
      $display("arr1[%0d] = %0d", i, arr1[i]);

    // ---------- 3) Assign 24-bit hex max value to packed array, display 8-bit slices ----------
    $display("\n=== Part 3: arr2 (packed) = 24-bit max hex value ===");
    arr2 = 24'hFFFFFF;   // maximum 24-bit hex value, legal because arr2 is packed (one scalar vector)

    foreach (arr2[i])
      $display("arr2[%0d] = %0h", i, arr2[i]);

    // ---------- 4) Initialize arr3 with AA, BB, CC ----------
    $display("\n=== Part 4: arr3 initialized with AA, BB, CC ===");
    arr3[0] = 8'hAA;
    arr3[1] = 8'hBB;
    arr3[2] = 8'hCC;

    foreach (arr3[i])
      $display("arr3[%0d] = %0h", i, arr3[i]);

    // ---------- 5) Dynamic array: allocate 5 elements, copy from static array ----------
    $display("\n=== Part 5: dynamic array allocated and copied from arr1 ===");
    darr = new[5];
    foreach (arr1[i])
      darr[i] = arr1[i];

    foreach (darr[i])
      $display("darr[%0d] = %0d", i, darr[i]);

    // ---------- 6) Resize dynamic array, add 2 new elements ----------
    $display("\n=== Part 6: dynamic array resized (+2 elements) ===");
    darr = new[7](darr);   // resize while preserving existing values
    darr[5] = 50;
    darr[6] = 60;

    foreach (darr[i])
      $display("darr[%0d] = %0d", i, darr[i]);

    // ---------- 7) Delete last element ----------
    $display("\n=== Part 7: delete last element ===");
    darr = new[darr.size() - 1](darr);
    $display("New size of darr = %0d", darr.size());
    foreach (darr[i])
      $display("darr[%0d] = %0d", i, darr[i]);

    // ---------- 8) Delete all elements using .delete() ----------
    $display("\n=== Part 8: delete all elements ===");
    darr.delete();
    $display("Size of darr after delete() = %0d", darr.size());

  end

endmodule