library verilog;
use verilog.vl_types.all;
entity multiplier is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        en              : in     vl_logic;
        m               : in     vl_logic_vector(31 downto 0);
        ai              : in     vl_logic_vector(31 downto 0);
        qi              : in     vl_logic_vector(31 downto 0);
        a               : out    vl_logic_vector(31 downto 0);
        q               : out    vl_logic_vector(31 downto 0);
        e               : out    vl_logic_vector(4 downto 0)
    );
end multiplier;
