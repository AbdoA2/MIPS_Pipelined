import cache_def::cache_req_type;
import cache_def::cache_data_type;

module data_mem (input logic clk, reset,
                 input cache_req_type data_req,
                 input cache_data_type in_data,
                 output cache_data_type out_data);
  
  cache_data_type ram[15:0];
  
  assign out_data = ram[data_req.index];
  
  always_ff @ (posedge clk) 
    if (data_req.we)
      ram[tag_req.index] <= in_data;
       
endmodule
                                                       


