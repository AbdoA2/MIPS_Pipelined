library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pcF             : out    vl_logic_vector(31 downto 0);
        instrF          : in     vl_logic_vector(31 downto 0);
        instrD          : out    vl_logic_vector(31 downto 0);
        DEC_controlD    : in     vl_logic_vector(6 downto 0);
        EX_controlD     : in     vl_logic_vector(10 downto 0);
        MEM_controlD    : in     vl_logic_vector(4 downto 0);
        WB_controlD     : in     vl_logic_vector(1 downto 0);
        aluoutM         : out    vl_logic_vector(31 downto 0);
        writedataM      : out    vl_logic_vector(31 downto 0);
        readdataM       : in     vl_logic_vector(31 downto 0);
        \OF\            : out    vl_logic;
        signE           : out    vl_logic;
        excepE          : in     vl_logic;
        causeE          : in     vl_logic;
        rsE             : out    vl_logic_vector(4 downto 0);
        rtE             : out    vl_logic_vector(4 downto 0);
        rdM             : out    vl_logic_vector(4 downto 0);
        wa3E            : out    vl_logic_vector(4 downto 0);
        rtM             : out    vl_logic_vector(4 downto 0);
        rdW             : out    vl_logic_vector(4 downto 0);
        regwriteE       : out    vl_logic;
        regwriteM       : out    vl_logic;
        regwriteW       : out    vl_logic;
        regvalueWE      : out    vl_logic;
        regvalueW       : out    vl_logic;
        BranchD         : out    vl_logic;
        undefinedE      : out    vl_logic;
        memwriteM       : out    vl_logic_vector(1 downto 0);
        ForwardAE       : in     vl_logic_vector(1 downto 0);
        ForwardBE       : in     vl_logic_vector(1 downto 0);
        ForwardAD       : in     vl_logic;
        ForwardBD       : in     vl_logic;
        ForwardM        : in     vl_logic;
        StallD          : in     vl_logic;
        StallF          : in     vl_logic;
        FlushE          : in     vl_logic
    );
end datapath;
