library verilog;
use verilog.vl_types.all;
entity arithmeticUnit is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        y               : out    vl_logic_vector(31 downto 0);
        c_out           : out    vl_logic;
        o               : out    vl_logic
    );
end arithmeticUnit;
