import cache_def::cache_req_type;
import cache_def::tag_type;

module tag_mem (input logic clk, reset,
                input cache_req_type tag_req,
                input tag_type in_tag,
                output tag_type out_tag);
  
  tag_type ram[15:0];
  
  assign out_tag = ram[tag_req.index];
  
  always_ff @ (posedge clk) 
    if (tag_req.we)
      ram[tag_req.index] <= in_tag;
  
  
   // initialize tags
  initial
    for (int i = 0; i < 16; i++) 
      ram[i].valid <= 0;
            
endmodule
                                                       
