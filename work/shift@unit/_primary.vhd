library verilog;
use verilog.vl_types.all;
entity shiftUnit is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        shamt           : in     vl_logic_vector(4 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        y               : out    vl_logic_vector(31 downto 0)
    );
end shiftUnit;
