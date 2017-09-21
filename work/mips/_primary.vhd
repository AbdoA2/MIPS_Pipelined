library verilog;
use verilog.vl_types.all;
entity mips is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        memwriteM       : out    vl_logic_vector(1 downto 0);
        aluoutM         : out    vl_logic_vector(31 downto 0);
        writedataM      : out    vl_logic_vector(31 downto 0);
        readdataM       : in     vl_logic_vector(31 downto 0)
    );
end mips;
