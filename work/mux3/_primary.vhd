library verilog;
use verilog.vl_types.all;
entity mux3 is
    generic(
        N               : integer := 32
    );
    port(
        d0              : in     vl_logic_vector;
        d1              : in     vl_logic_vector;
        d2              : in     vl_logic_vector;
        s               : in     vl_logic_vector(1 downto 0);
        y               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end mux3;
