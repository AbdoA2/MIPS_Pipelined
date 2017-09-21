library verilog;
use verilog.vl_types.all;
entity Hazard_Unit is
    port(
        reset           : in     vl_logic;
        rsE             : in     vl_logic_vector(4 downto 0);
        rtE             : in     vl_logic_vector(4 downto 0);
        rdM             : in     vl_logic_vector(4 downto 0);
        rdE             : in     vl_logic_vector(4 downto 0);
        rtM             : in     vl_logic_vector(4 downto 0);
        rdW             : in     vl_logic_vector(4 downto 0);
        rsD             : in     vl_logic_vector(4 downto 0);
        rtD             : in     vl_logic_vector(4 downto 0);
        regwriteE       : in     vl_logic;
        regwriteM       : in     vl_logic;
        regwriteW       : in     vl_logic;
        regvalueWE      : in     vl_logic;
        regvalueW       : in     vl_logic;
        BranchD         : in     vl_logic;
        jrD             : in     vl_logic;
        memwriteD       : in     vl_logic_vector(1 downto 0);
        memwriteM       : in     vl_logic_vector(1 downto 0);
        ForwardAE       : out    vl_logic_vector(1 downto 0);
        ForwardBE       : out    vl_logic_vector(1 downto 0);
        ForwardAD       : out    vl_logic;
        ForwardBD       : out    vl_logic;
        ForwardM        : out    vl_logic;
        StallD          : out    vl_logic;
        StallF          : out    vl_logic;
        FlushE          : out    vl_logic
    );
end Hazard_Unit;
