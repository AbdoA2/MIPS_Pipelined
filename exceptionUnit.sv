module exceptionUnit(input logic reset, undefined, s, OF, output logic en, cause);
  always_comb
    if (reset) en <= 0;
    else if (undefined) begin
      cause <= 0;
      en <= 1;
    end
    else if (s & OF) begin
      cause <= 1;
      en <= 1;
    end
    else en <= 0;
endmodule