library verilog;
use verilog.vl_types.all;
entity ID_EX_Reg is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        en              : in     vl_logic;
        \EX_control_\   : in     vl_logic_vector(10 downto 0);
        \MEM_control_\  : in     vl_logic_vector(4 downto 0);
        \WB_control_\   : in     vl_logic_vector(1 downto 0);
        \rd1_\          : in     vl_logic_vector(31 downto 0);
        \rd2_\          : in     vl_logic_vector(31 downto 0);
        \imm_\          : in     vl_logic_vector(31 downto 0);
        \pc_\           : in     vl_logic_vector(31 downto 0);
        \pc4_\          : in     vl_logic_vector(31 downto 0);
        \rs_\           : in     vl_logic_vector(4 downto 0);
        \rt_\           : in     vl_logic_vector(4 downto 0);
        \undefined_\    : in     vl_logic;
        EX_control      : out    vl_logic_vector(10 downto 0);
        MEM_control     : out    vl_logic_vector(4 downto 0);
        WB_control      : out    vl_logic_vector(1 downto 0);
        rd1             : out    vl_logic_vector(31 downto 0);
        rd2             : out    vl_logic_vector(31 downto 0);
        imm             : out    vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        pc4             : out    vl_logic_vector(31 downto 0);
        rs              : out    vl_logic_vector(4 downto 0);
        rt              : out    vl_logic_vector(4 downto 0);
        undefined       : out    vl_logic
    );
end ID_EX_Reg;
