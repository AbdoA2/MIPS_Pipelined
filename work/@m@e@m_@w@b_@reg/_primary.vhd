library verilog;
use verilog.vl_types.all;
entity MEM_WB_Reg is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        \WB_control_\   : in     vl_logic_vector(1 downto 0);
        \aluout_\       : in     vl_logic_vector(31 downto 0);
        \readdata_\     : in     vl_logic_vector(31 downto 0);
        \rd_\           : in     vl_logic_vector(4 downto 0);
        WB_control      : out    vl_logic_vector(1 downto 0);
        aluout          : out    vl_logic_vector(31 downto 0);
        readdata        : out    vl_logic_vector(31 downto 0);
        rd              : out    vl_logic_vector(4 downto 0)
    );
end MEM_WB_Reg;
