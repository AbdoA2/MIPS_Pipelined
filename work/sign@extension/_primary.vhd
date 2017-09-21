library verilog;
use verilog.vl_types.all;
entity signExtension is
    generic(
        N               : integer := 16;
        M               : integer := 16
    );
    port(
        a               : in     vl_logic_vector;
        s               : in     vl_logic;
        y               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
    attribute mti_svvh_generic_type of M : constant is 1;
end signExtension;
