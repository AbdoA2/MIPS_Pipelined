library verilog;
use verilog.vl_types.all;
entity mux8 is
    generic(
        N               : integer := 32
    );
    port(
        d               : in     vl_logic;
        s               : in     vl_logic_vector(2 downto 0);
        y               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end mux8;
