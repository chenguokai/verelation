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
    if(array_0__T_15_en & array_0__T_15_mask) begin
      array_0[array_0__T_15_addr] <= array_0__T_15_data; // @[SRAMTemplate.scala 76:26]
    end
    array_0__T_19_en_pipe_0 <= io_r_req_valid & _T_6;
    if (io_r_req_valid & _T_6) begin
      array_0__T_19_addr_pipe_0 <= io_r_req_bits_setIdx;
    end
    resetState <= reset | _GEN_2;
    if (reset) begin
      resetSet <= 9'h0;
    end else if (resetState) begin
      resetSet <= _T_5;
    end
    _T_20 <= io_r_req_valid & _T_6;
    if (reset) begin
      _T_22_0 <= 73'h0;
    end else if (_T_20) begin
      _T_22_0 <= array_0__T_19_data;
    end
  end
endmodule
module BPU_inorder(
  input         clock,
  input         reset,
  input         io_in_pc_valid,
  input  [38:0] io_in_pc_bits,
  output [38:0] io_out_target,
  output        io_out_valid,
  input         io_flush,
  output [2:0]  io_brIdx,
  output        io_crosslineJump,
  input         MOUFlushICache,
  input         bpuUpdateReq_valid,
  input  [38:0] bpuUpdateReq_pc,
  input         bpuUpdateReq_isMissPredict,
  input  [38:0] bpuUpdateReq_actualTarget,
  input         bpuUpdateReq_actualTaken,
  input  [8:0]  bpuUpdateReq_fuOpType,
  input  [1:0]  bpuUpdateReq_btbType,
  input         bpuUpdateReq_isRVC,
  input         DISPLAY_ENABLE,
  input         MOUFlushTLB
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  wire  btb_clock; // @[BPU.scala 302:19]
  wire  btb_reset; // @[BPU.scala 302:19]
  wire  btb_io_r_req_ready; // @[BPU.scala 302:19]
  wire  btb_io_r_req_valid; // @[BPU.scala 302:19]
  wire [8:0] btb_io_r_req_bits_setIdx; // @[BPU.scala 302:19]
  wire [27:0] btb_io_r_resp_data_0_tag; // @[BPU.scala 302:19]
  wire [1:0] btb_io_r_resp_data_0__type; // @[BPU.scala 302:19]
  wire [38:0] btb_io_r_resp_data_0_target; // @[BPU.scala 302:19]
  wire [2:0] btb_io_r_resp_data_0_brIdx; // @[BPU.scala 302:19]
  wire  btb_io_r_resp_data_0_valid; // @[BPU.scala 302:19]
  wire  btb_io_w_req_valid; // @[BPU.scala 302:19]
  wire [8:0] btb_io_w_req_bits_setIdx; // @[BPU.scala 302:19]
  wire [27:0] btb_io_w_req_bits_data_tag; // @[BPU.scala 302:19]
  wire [1:0] btb_io_w_req_bits_data__type; // @[BPU.scala 302:19]
  wire [38:0] btb_io_w_req_bits_data_target; // @[BPU.scala 302:19]
  wire [2:0] btb_io_w_req_bits_data_brIdx; // @[BPU.scala 302:19]
  reg [1:0] pht [0:511]; // @[BPU.scala 336:16]
  wire [1:0] pht__T_81_data; // @[BPU.scala 336:16]
  wire [8:0] pht__T_81_addr; // @[BPU.scala 336:16]
  wire [1:0] pht__T_139_data; // @[BPU.scala 336:16]
  wire [8:0] pht__T_139_addr; // @[BPU.scala 336:16]
  wire [1:0] pht__T_160_data; // @[BPU.scala 336:16]
  wire [8:0] pht__T_160_addr; // @[BPU.scala 336:16]
  wire  pht__T_160_mask; // @[BPU.scala 336:16]
  wire  pht__T_160_en; // @[BPU.scala 336:16]
  reg [38:0] ras [0:15]; // @[BPU.scala 342:16]
  wire [38:0] ras__T_83_data; // @[BPU.scala 342:16]
  wire [3:0] ras__T_83_addr; // @[BPU.scala 342:16]
  wire [38:0] ras__T_169_data; // @[BPU.scala 342:16]
  wire [3:0] ras__T_169_addr; // @[BPU.scala 342:16]
  wire  ras__T_169_mask; // @[BPU.scala 342:16]
  wire  ras__T_169_en; // @[BPU.scala 342:16]
  reg  flush; // @[StopWatch.scala 24:20]
  wire  _GEN_0 = io_in_pc_valid ? 1'h0 : flush; // @[StopWatch.scala 26:19]
  wire  _GEN_1 = io_flush | _GEN_0; // @[StopWatch.scala 27:20]
  wire  _T_1 = MOUFlushICache | MOUFlushTLB; // @[BPU.scala 308:42]
  wire  _T_2 = reset | _T_1; // @[BPU.scala 308:29]
  reg [63:0] _T_6; // @[GTimer.scala 24:20]
  wire [63:0] _T_8 = _T_6 + 64'h1; // @[GTimer.scala 25:12]
  wire  _T_10 = _T_2 & DISPLAY_ENABLE; // @[Debug.scala 55:16]
  wire  _T_12 = ~reset; // @[Debug.scala 56:24]
  reg [38:0] pcLatch; // @[Reg.scala 15:16]
  wire [27:0] btbRead_tag = btb_io_r_resp_data_0_tag; // @[BPU.scala 315:21 BPU.scala 316:11]
  wire  _T_27 = btbRead_tag == pcLatch[38:11]; // @[BPU.scala 320:45]
  wire  btbRead_valid = btb_io_r_resp_data_0_valid; // @[BPU.scala 315:21 BPU.scala 316:11]
  wire  _T_28 = btbRead_valid & _T_27; // @[BPU.scala 320:30]
  wire  _T_29 = ~flush; // @[BPU.scala 320:76]
  wire  _T_30 = _T_28 & _T_29; // @[BPU.scala 320:73]
  wire  _T_31 = btb_io_r_req_ready & btb_io_r_req_valid; // @[Decoupled.scala 40:37]
  reg  _T_32; // @[BPU.scala 320:93]
  wire  _T_33 = _T_30 & _T_32; // @[BPU.scala 320:83]
  wire [2:0] btbRead_brIdx = btb_io_r_resp_data_0_brIdx; // @[BPU.scala 315:21 BPU.scala 316:11]
  wire  _T_36 = pcLatch[1] & btbRead_brIdx[0]; // @[BPU.scala 320:147]
  wire  _T_37 = ~_T_36; // @[BPU.scala 320:134]
  wire  btbHit = _T_33 & _T_37; // @[BPU.scala 320:131]
  wire  crosslineJump = btbRead_brIdx[2] & btbHit; // @[BPU.scala 327:40]
  reg [63:0] _T_39; // @[GTimer.scala 24:20]
  wire [63:0] _T_41 = _T_39 + 64'h1; // @[GTimer.scala 25:12]
  reg [63:0] _T_54; // @[GTimer.scala 24:20]
  wire [63:0] _T_56 = _T_54 + 64'h1; // @[GTimer.scala 25:12]
  wire  _T_58 = btbHit & DISPLAY_ENABLE; // @[Debug.scala 55:16]
  wire [1:0] _T_64 = io_out_valid ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [2:0] _T_65 = {crosslineJump,_T_64}; // @[Cat.scala 29:58]
  reg [63:0] _T_66; // @[GTimer.scala 24:20]
  wire [63:0] _T_68 = _T_66 + 64'h1; // @[GTimer.scala 25:12]
  reg  phtTaken; // @[Reg.scala 15:16]
  reg [3:0] value; // @[Counter.scala 29:33]
  reg [38:0] rasTarget; // @[Reg.scala 15:16]
  wire  _T_100 = ~bpuUpdateReq_pc[1]; // @[BPU.scala 353:150]
  wire [1:0] _T_101 = {bpuUpdateReq_pc[1],_T_100}; // @[Cat.scala 29:58]
  reg [63:0] _T_102; // @[GTimer.scala 24:20]
  wire [63:0] _T_104 = _T_102 + 64'h1; // @[GTimer.scala 25:12]
  wire  _T_106 = bpuUpdateReq_valid & DISPLAY_ENABLE; // @[Debug.scala 55:16]
  wire  _T_118 = bpuUpdateReq_pc[2:0] == 3'h6; // @[BPU.scala 367:36]
  wire  _T_119 = ~bpuUpdateReq_isRVC; // @[BPU.scala 367:49]
  wire  _T_120 = _T_118 & _T_119; // @[BPU.scala 367:46]
  wire [1:0] _T_124 = {_T_120,bpuUpdateReq_pc[1]}; // @[Cat.scala 29:58]
  reg [1:0] cnt; // @[BPU.scala 389:20]
  reg  reqLatch_valid; // @[BPU.scala 390:25]
  reg [38:0] reqLatch_pc; // @[BPU.scala 390:25]
  reg  reqLatch_actualTaken; // @[BPU.scala 390:25]
  reg [8:0] reqLatch_fuOpType; // @[BPU.scala 390:25]
  wire  _T_141 = ~reqLatch_fuOpType[3]; // @[ALU.scala 65:30]
  wire  _T_142 = reqLatch_valid & _T_141; // @[BPU.scala 391:24]
  wire [1:0] _T_144 = cnt + 2'h1; // @[BPU.scala 393:33]
  wire [1:0] _T_146 = cnt - 2'h1; // @[BPU.scala 393:44]
  wire  _T_148 = cnt != 2'h3; // @[BPU.scala 394:30]
  wire  _T_149 = reqLatch_actualTaken & _T_148; // @[BPU.scala 394:22]
  wire  _T_150 = ~reqLatch_actualTaken; // @[BPU.scala 394:48]
  wire  _T_151 = cnt != 2'h0; // @[BPU.scala 394:63]
  wire  _T_152 = _T_150 & _T_151; // @[BPU.scala 394:55]
  wire  _T_153 = _T_149 | _T_152; // @[BPU.scala 394:44]
  wire  _T_161 = bpuUpdateReq_fuOpType == 9'h5c; // @[BPU.scala 403:24]
  wire [3:0] _T_163 = value + 4'h1; // @[BPU.scala 404:26]
  wire [38:0] _T_165 = bpuUpdateReq_pc + 39'h2; // @[BPU.scala 404:55]
  wire [38:0] _T_167 = bpuUpdateReq_pc + 39'h4; // @[BPU.scala 404:69]
  wire  _T_172 = bpuUpdateReq_fuOpType == 9'h5e; // @[BPU.scala 408:29]
  wire  _T_173 = value == 4'h0; // @[BPU.scala 409:21]
  wire [3:0] _T_176 = value - 4'h1; // @[BPU.scala 412:53]
  wire [1:0] btbRead__type = btb_io_r_resp_data_0__type; // @[BPU.scala 315:21 BPU.scala 316:11]
  wire  _T_178 = btbRead__type == 2'h3; // @[BPU.scala 416:38]
  wire [38:0] btbRead_target = btb_io_r_resp_data_0_target; // @[BPU.scala 315:21 BPU.scala 316:11]
  wire [3:0] _T_183 = {1'h1,crosslineJump,_T_64}; // @[Cat.scala 29:58]
  wire [3:0] _GEN_28 = {{1'd0}, btbRead_brIdx}; // @[BPU.scala 419:30]
  wire [3:0] _T_184 = _GEN_28 & _T_183; // @[BPU.scala 419:30]
  wire  _T_185 = btbRead__type == 2'h0; // @[BPU.scala 420:47]
  wire  _T_186 = rasTarget != 39'h0; // @[BPU.scala 420:91]
  wire  _T_188 = _T_185 ? phtTaken : _T_186; // @[BPU.scala 420:32]
  SRAMTemplate btb ( // @[BPU.scala 302:19]
    .clock(btb_clock),
    .reset(btb_reset),
    .io_r_req_ready(btb_io_r_req_ready),
    .io_r_req_valid(btb_io_r_req_valid),
    .io_r_req_bits_setIdx(btb_io_r_req_bits_setIdx),
    .io_r_resp_data_0_tag(btb_io_r_resp_data_0_tag),
    .io_r_resp_data_0__type(btb_io_r_resp_data_0__type),
    .io_r_resp_data_0_target(btb_io_r_resp_data_0_target),
    .io_r_resp_data_0_brIdx(btb_io_r_resp_data_0_brIdx),
    .io_r_resp_data_0_valid(btb_io_r_resp_data_0_valid),
    .io_w_req_valid(btb_io_w_req_valid),
    .io_w_req_bits_setIdx(btb_io_w_req_bits_setIdx),
    .io_w_req_bits_data_tag(btb_io_w_req_bits_data_tag),
    .io_w_req_bits_data__type(btb_io_w_req_bits_data__type),
    .io_w_req_bits_data_target(btb_io_w_req_bits_data_target),
    .io_w_req_bits_data_brIdx(btb_io_w_req_bits_data_brIdx)
  );
  assign pht__T_81_addr = io_in_pc_bits[10:2];
  assign pht__T_81_data = pht[pht__T_81_addr]; // @[BPU.scala 336:16]
  assign pht__T_139_addr = bpuUpdateReq_pc[10:2];
  assign pht__T_139_data = pht[pht__T_139_addr]; // @[BPU.scala 336:16]
  assign pht__T_160_data = reqLatch_actualTaken ? _T_144 : _T_146;
  assign pht__T_160_addr = reqLatch_pc[10:2];
  assign pht__T_160_mask = 1'h1;
  assign pht__T_160_en = _T_142 & _T_153;
  assign ras__T_83_addr = value;
  assign ras__T_83_data = ras[ras__T_83_addr]; // @[BPU.scala 342:16]
  assign ras__T_169_data = bpuUpdateReq_isRVC ? _T_165 : _T_167;
  assign ras__T_169_addr = value + 4'h1;
  assign ras__T_169_mask = 1'h1;
  assign ras__T_169_en = bpuUpdateReq_valid & _T_161;
  assign io_out_target = _T_178 ? rasTarget : btbRead_target; // @[BPU.scala 416:17]
  assign io_out_valid = btbHit & _T_188; // @[BPU.scala 420:16]
  assign io_brIdx = _T_184[2:0]; // @[BPU.scala 419:13]
  assign io_crosslineJump = btbRead_brIdx[2] & btbHit; // @[BPU.scala 328:20]
  assign btb_clock = clock;
  assign btb_reset = reset | _T_1; // @[BPU.scala 308:13]
  assign btb_io_r_req_valid = io_in_pc_valid; // @[BPU.scala 311:22]
  assign btb_io_r_req_bits_setIdx = io_in_pc_bits[10:2]; // @[BPU.scala 312:28]
  assign btb_io_w_req_valid = bpuUpdateReq_isMissPredict & bpuUpdateReq_valid; // @[BPU.scala 375:22]
  assign btb_io_w_req_bits_setIdx = bpuUpdateReq_pc[10:2]; // @[BPU.scala 376:28]
  assign btb_io_w_req_bits_data_tag = bpuUpdateReq_pc[38:11]; // @[BPU.scala 377:26]
  assign btb_io_w_req_bits_data__type = bpuUpdateReq_btbType; // @[BPU.scala 377:26]
  assign btb_io_w_req_bits_data_target = bpuUpdateReq_actualTarget; // @[BPU.scala 377:26]
  assign btb_io_w_req_bits_data_brIdx = {_T_124,_T_100}; // @[BPU.scala 377:26]
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
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    pht[initvar] = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ras[initvar] = _RAND_1[38:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  flush = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  _T_6 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  pcLatch = _RAND_4[38:0];
  _RAND_5 = {1{`RANDOM}};
  _T_32 = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  _T_39 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  _T_54 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  _T_66 = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  phtTaken = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  value = _RAND_10[3:0];
  _RAND_11 = {2{`RANDOM}};
  rasTarget = _RAND_11[38:0];
  _RAND_12 = {2{`RANDOM}};
  _T_102 = _RAND_12[63:0];
  _RAND_13 = {1{`RANDOM}};
  cnt = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  reqLatch_valid = _RAND_14[0:0];
  _RAND_15 = {2{`RANDOM}};
  reqLatch_pc = _RAND_15[38:0];
  _RAND_16 = {1{`RANDOM}};
  reqLatch_actualTaken = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  reqLatch_fuOpType = _RAND_17[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(pht__T_160_en & pht__T_160_mask) begin
      pht[pht__T_160_addr] <= pht__T_160_data; // @[BPU.scala 336:16]
    end
    if(ras__T_169_en & ras__T_169_mask) begin
      ras[ras__T_169_addr] <= ras__T_169_data; // @[BPU.scala 342:16]
    end
    if (reset) begin
      flush <= 1'h0;
    end else begin
      flush <= _GEN_1;
    end
    if (reset) begin
      _T_6 <= 64'h0;
    end else begin
      _T_6 <= _T_8;
    end
    if (io_in_pc_valid) begin
      pcLatch <= io_in_pc_bits;
    end
    if (reset) begin
      _T_32 <= 1'h0;
    end else begin
      _T_32 <= _T_31;
    end
    if (reset) begin
      _T_39 <= 64'h0;
    end else begin
      _T_39 <= _T_41;
    end
    if (reset) begin
      _T_54 <= 64'h0;
    end else begin
      _T_54 <= _T_56;
    end
    if (reset) begin
      _T_66 <= 64'h0;
    end else begin
      _T_66 <= _T_68;
    end
    if (io_in_pc_valid) begin
      phtTaken <= pht__T_81_data[1];
    end
    if (reset) begin
      value <= 4'h0;
    end else if (bpuUpdateReq_valid) begin
      if (_T_161) begin
        value <= _T_163;
      end else if (_T_172) begin
        if (_T_173) begin
          value <= 4'h0;
        end else begin
          value <= _T_176;
        end
      end
    end
    if (io_in_pc_valid) begin
      rasTarget <= ras__T_83_data;
    end
    if (reset) begin
      _T_102 <= 64'h0;
    end else begin
      _T_102 <= _T_104;
    end
    cnt <= pht__T_139_data;
    reqLatch_valid <= bpuUpdateReq_valid;
    reqLatch_pc <= bpuUpdateReq_pc;
    reqLatch_actualTaken <= bpuUpdateReq_actualTaken;
    reqLatch_fuOpType <= bpuUpdateReq_fuOpType;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & _T_12) begin
          $fwrite(32'h80000002,"[%d] BPU_inorder: ",_T_6); // @[Debug.scala 56:24]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & _T_12) begin
          $fwrite(32'h80000002,"[BPU-RESET] bpu-reset flushBTB:%d flushTLB:%d\n",MOUFlushICache,MOUFlushTLB); // @[Debug.scala 57:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_58 & _T_12) begin
          $fwrite(32'h80000002,"[%d] BPU_inorder: ",_T_54); // @[Debug.scala 56:24]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_58 & _T_12) begin
          $fwrite(32'h80000002,"[BTBHT1] %d pc=%x tag=%x,%x index=%x bridx=%x tgt=%x,%x flush %x type:%x\n",_T_39,pcLatch,btbRead_tag,pcLatch[38:11],pcLatch[10:2],btbRead_brIdx,btbRead_target,io_out_target,flush,btbRead__type); // @[Debug.scala 57:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_58 & _T_12) begin
          $fwrite(32'h80000002,"[%d] BPU_inorder: ",_T_66); // @[Debug.scala 56:24]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_58 & _T_12) begin
          $fwrite(32'h80000002,"[BTBHT2] btbRead.brIdx %x mask %x\n",btbRead_brIdx,_T_65); // @[Debug.scala 57:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_106 & _T_12) begin
          $fwrite(32'h80000002,"[%d] BPU_inorder: ",_T_102); // @[Debug.scala 56:24]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_106 & _T_12) begin
          $fwrite(32'h80000002,"[BTBUP] pc=%x tag=%x index=%x bridx=%x tgt=%x type=%x\n",bpuUpdateReq_pc,bpuUpdateReq_pc[38:11],bpuUpdateReq_pc[10:2],_T_101,bpuUpdateReq_actualTarget,bpuUpdateReq_btbType); // @[Debug.scala 57:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule