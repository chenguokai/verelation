module SRAMTemplate(
  input         clock,
  input         reset,
  output        io_r_req_ready,
  input         io_r_req_valid,
  input  [8:0]  io_r_req_bits_setIdx,
  output [27:0] io_r_resp_data_0_tag,
  output [1:0]  io_r_resp_data_0__type,
  output [38:0] io_r_resp_data_0_target,
  output [2:0]  io_r_resp_data_0_brIdx,
  output        io_r_resp_data_0_valid,
  input         io_w_req_valid,
  input  [8:0]  io_w_req_bits_setIdx,
  input  [27:0] io_w_req_bits_data_tag,
  input  [1:0]  io_w_req_bits_data__type,
  input  [38:0] io_w_req_bits_data_target,
  input  [2:0]  io_w_req_bits_data_brIdx
);
`ifdef RANDOMIZE_MEM_INIT
  reg [95:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [95:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [72:0] array_0 [0:511]; // @[SRAMTemplate.scala 76:26]
  wire [72:0] array_0__T_19_data; // @[SRAMTemplate.scala 76:26]
  wire [8:0] array_0__T_19_addr; // @[SRAMTemplate.scala 76:26]
  wire [72:0] array_0__T_15_data; // @[SRAMTemplate.scala 76:26]
  wire [8:0] array_0__T_15_addr; // @[SRAMTemplate.scala 76:26]
  wire  array_0__T_15_mask; // @[SRAMTemplate.scala 76:26]
  wire  array_0__T_15_en; // @[SRAMTemplate.scala 76:26]
  reg  array_0__T_19_en_pipe_0;
  reg [8:0] array_0__T_19_addr_pipe_0;
  reg  resetState; // @[SRAMTemplate.scala 80:30]
  reg [8:0] resetSet; // @[Counter.scala 29:33]
  wire  _T_3 = resetSet == 9'h1ff; // @[Counter.scala 38:24]
  wire [8:0] _T_5 = resetSet + 9'h1; // @[Counter.scala 39:22]
  wire  _GEN_1 = resetState & _T_3; // @[Counter.scala 67:17]
  wire  _GEN_2 = _GEN_1 ? 1'h0 : resetState; // @[SRAMTemplate.scala 82:24]
  wire  wen = io_w_req_valid | resetState; // @[SRAMTemplate.scala 88:52]
  wire  _T_6 = ~wen; // @[SRAMTemplate.scala 89:41]
  wire [72:0] _T_11 = {io_w_req_bits_data_tag,io_w_req_bits_data__type,io_w_req_bits_data_target,io_w_req_bits_data_brIdx,1'h1}; // @[SRAMTemplate.scala 92:78]
  reg  _T_20; // @[Hold.scala 28:106]
  reg [72:0] _T_22_0; // @[Reg.scala 27:20]
  wire [72:0] _GEN_14 = _T_20 ? array_0__T_19_data : _T_22_0; // @[Reg.scala 28:19]
  wire  _T_31 = ~resetState; // @[SRAMTemplate.scala 101:21]
  assign array_0__T_19_addr = array_0__T_19_addr_pipe_0;
  assign array_0__T_19_data = array_0[array_0__T_19_addr]; // @[SRAMTemplate.scala 76:26]
  assign array_0__T_15_data = resetState ? 73'h0 : _T_11;
  assign array_0__T_15_addr = resetState ? resetSet : io_w_req_bits_setIdx;
  assign array_0__T_15_mask = 1'h1;
  assign array_0__T_15_en = io_w_req_valid | resetState;
  assign io_r_req_ready = _T_31 & _T_6; // @[SRAMTemplate.scala 101:18]
  assign io_r_resp_data_0_tag = _GEN_14[72:45]; // @[SRAMTemplate.scala 99:18]
  assign io_r_resp_data_0__type = _GEN_14[44:43]; // @[SRAMTemplate.scala 99:18]
  assign io_r_resp_data_0_target = _GEN_14[42:4]; // @[SRAMTemplate.scala 99:18]
  assign io_r_resp_data_0_brIdx = _GEN_14[3:1]; // @[SRAMTemplate.scala 99:18]
  assign io_r_resp_data_0_valid = _GEN_14[0]; // @[SRAMTemplate.scala 99:18]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {3{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    array_0[initvar] = _RAND_0[72:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  array_0__T_19_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  array_0__T_19_addr_pipe_0 = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  resetState = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  resetSet = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  _T_20 = _RAND_5[0:0];
  _RAND_6 = {3{`RANDOM}};
  _T_22_0 = _RAND_6[72:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin

    array_0__T_19_en_pipe_0 <= io_r_req_valid & _T_6;

    resetState <= reset | _GEN_2;

    _T_20 <= io_r_req_valid & _T_6;

  end
endmodule