library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        dataadr         : out    vl_logic_vector(31 downto 0);
        writedata       : out    vl_logic_vector(31 downto 0);
        instr           : out    vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        memwriteM       : out    vl_logic_vector(1 downto 0)
    );
end top;
