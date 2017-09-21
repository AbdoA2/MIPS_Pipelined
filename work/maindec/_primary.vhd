library verilog;
use verilog.vl_types.all;
entity maindec is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        DEC_control     : out    vl_logic_vector(6 downto 0);
        EX_control      : out    vl_logic_vector(10 downto 0);
        MEM_control     : out    vl_logic_vector(4 downto 0);
        WB_control      : out    vl_logic_vector(1 downto 0)
    );
end maindec;
