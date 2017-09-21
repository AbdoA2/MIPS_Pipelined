library verilog;
use verilog.vl_types.all;
entity exceptionUnit is
    port(
        reset           : in     vl_logic;
        undefined       : in     vl_logic;
        s               : in     vl_logic;
        \OF\            : in     vl_logic;
        en              : out    vl_logic;
        cause           : out    vl_logic
    );
end exceptionUnit;
