library verilog;
use verilog.vl_types.all;
entity EX_MEM_Reg is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        \MEM_control_\  : in     vl_logic_vector(4 downto 0);
        \WB_control_\   : in     vl_logic_vector(1 downto 0);
        \aluout_\       : in     vl_logic_vector(31 downto 0);
        \writedata_\    : in     vl_logic_vector(31 downto 0);
        \rt_\           : in     vl_logic_vector(4 downto 0);
        \rd_\           : in     vl_logic_vector(4 downto 0);
        MEM_control     : out    vl_logic_vector(4 downto 0);
        WB_control      : out    vl_logic_vector(1 downto 0);
        aluout          : out    vl_logic_vector(31 downto 0);
        writedata       : out    vl_logic_vector(31 downto 0);
        rt              : out    vl_logic_vector(4 downto 0);
        rd              : out    vl_logic_vector(4 downto 0)
    );
end EX_MEM_Reg;
