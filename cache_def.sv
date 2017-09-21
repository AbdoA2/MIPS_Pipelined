package cache_def;
  
// tag type
typedef struct {
  logic[23:0] tag;
  logic valid;
  logic dirty;
} tag_type;

// cache_req type
typedef struct packed {
  logic[3:0] index;
  logic we;
} cache_req_type;

// cache_data type
typedef logic[127:0] cache_data_type;

// cpu -> cache (instructions)
typedef struct {
  logic[31:0] addr;
  logic  valid;
} cpu_req_typeI;  

// cpu -> cache (data)
typedef struct {
  logic[31:0] addr;
  logic[31:0] data;
  logic rw;
  logic  valid;
} cpu_req_typeD;  


// chache -> cpu
typedef struct {
  logic[31:0] data;
  logic ready;
} cpu_result_type;  

// cache -> memory (instructions)
typedef struct {
  logic[31:0] addr;
  logic valid;
} mem_req_typeI;

// cache -> memory (data)
typedef struct {
  logic[31:0] addr;
  cache_data_type data;
  logic rw;
  logic valid;
} mem_req_typeD;

// memory -> cache
typedef struct {
  logic[127:0] data;
  logic ready;
} mem_result_type; 

endpackage
