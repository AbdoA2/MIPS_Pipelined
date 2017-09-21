library verilog;
use verilog.vl_types.all;
entity IF_ID_Reg is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        en              : in     vl_logic;
        \instr_\        : in     vl_logic_vector(31 downto 0);
        \pc_\           : in     vl_logic_vector(31 downto 0);
        \pc4_\          : in     vl_logic_vector(31 downto 0);
        instr           : out    vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        pc4             : out    vl_logic_vector(31 downto 0)
    );
end IF_ID_Reg;
