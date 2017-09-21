library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic_vector(3 downto 0);
        y               : out    vl_logic_vector(31 downto 0);
        C               : out    vl_logic;
        \S\             : out    vl_logic;
        Z               : out    vl_logic;
        O               : out    vl_logic
    );
end ALU;
