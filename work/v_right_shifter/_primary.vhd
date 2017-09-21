library verilog;
use verilog.vl_types.all;
entity v_right_shifter is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        shamt           : in     vl_logic_vector(4 downto 0);
        l               : in     vl_logic;
        y               : out    vl_logic_vector(31 downto 0)
    );
end v_right_shifter;
