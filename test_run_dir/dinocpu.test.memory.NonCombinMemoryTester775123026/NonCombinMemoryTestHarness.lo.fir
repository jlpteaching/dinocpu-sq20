circuit NonCombinMemoryTestHarness :
  module INonCombinMemPort :
    input clock : Clock
    input reset : UInt<1>
    input io_pipeline_address : UInt<32>
    input io_pipeline_valid : UInt<1>
    output io_pipeline_good : UInt<1>
    output io_pipeline_instruction : UInt<32>
    output io_pipeline_ready : UInt<1>
    input io_bus_request_ready : UInt<1>
    output io_bus_request_valid : UInt<1>
    output io_bus_request_bits_address : UInt<32>
    output io_bus_request_bits_writedata : UInt<32>
    output io_bus_request_bits_operation : UInt<2>
    input io_bus_response_valid : UInt<1>
    input io_bus_response_bits_data : UInt<32>
  
    node _T_1_operation = pad(UInt<1>("h0"), 2) @[memory-combin-ports.scala 17:23 memory-combin-ports.scala 19:23]
    node _GEN_0 = validif(io_pipeline_valid, _T_1_operation) @[memory-combin-ports.scala 16:28]
    node _T_1_writedata = pad(UInt<1>("h0"), 32) @[memory-combin-ports.scala 17:23 memory-combin-ports.scala 20:23]
    node _GEN_1 = validif(io_pipeline_valid, _T_1_writedata) @[memory-combin-ports.scala 16:28]
    node _T_1_address = io_pipeline_address @[memory-combin-ports.scala 17:23 memory-combin-ports.scala 18:23]
    node _GEN_2 = validif(io_pipeline_valid, _T_1_address) @[memory-combin-ports.scala 16:28]
    node _GEN_3 = mux(io_pipeline_valid, UInt<1>("h1"), UInt<1>("h0")) @[memory-combin-ports.scala 16:28]
    reg imemBusy : UInt<1>, clock with :
      reset => (UInt<1>("h0"), imemBusy) @[memory-noncombin-ports.scala 28:25]
    node _GEN_4 = mux(io_bus_response_valid, UInt<1>("h0"), imemBusy) @[memory-noncombin-ports.scala 34:39]
    node _GEN_5 = mux(io_pipeline_valid, UInt<1>("h1"), _GEN_4) @[memory-noncombin-ports.scala 32:28]
    node _T_2 = eq(imemBusy, UInt<1>("h0")) @[memory-noncombin-ports.scala 38:24]
    node _T_address = io_pipeline_address @[base-memory-components.scala 52:31 base-memory-components.scala 52:31 base-memory-components.scala 52:15]
    node _T_valid = io_pipeline_valid @[base-memory-components.scala 52:31 base-memory-components.scala 52:31 base-memory-components.scala 52:15]
    node _T_good = UInt<1>("h0") @[base-memory-components.scala 52:31 base-memory-components.scala 52:31]
    node _T_instruction = UInt<32>("h0") @[base-memory-components.scala 52:31 base-memory-components.scala 52:31]
    node _T_ready = UInt<1>("h0") @[base-memory-components.scala 52:31 base-memory-components.scala 52:31]
    io_pipeline_good <= io_bus_response_valid @[base-memory-components.scala 52:15 memory-combin-ports.scala 32:20 memory-noncombin-ports.scala 30:20]
    io_pipeline_instruction <= io_bus_response_bits_data @[base-memory-components.scala 52:15 memory-combin-ports.scala 33:27]
    io_pipeline_ready <= _T_2 @[base-memory-components.scala 52:15 memory-combin-ports.scala 29:21 memory-noncombin-ports.scala 38:21]
    io_bus_request_valid <= _GEN_3 @[memory-combin-ports.scala 23:26 memory-combin-ports.scala 25:26]
    io_bus_request_bits_address <= _GEN_2 @[memory-combin-ports.scala 22:26]
    io_bus_request_bits_writedata <= _GEN_1 @[memory-combin-ports.scala 22:26]
    io_bus_request_bits_operation <= _GEN_0 @[memory-combin-ports.scala 22:26]
    imemBusy <= mux(reset, UInt<1>("h0"), _GEN_5) @[memory-noncombin-ports.scala 33:14 memory-noncombin-ports.scala 35:14]

  module DNonCombinMemPort :
    input clock : Clock
    input reset : UInt<1>
    input io_pipeline_address : UInt<32>
    input io_pipeline_valid : UInt<1>
    output io_pipeline_good : UInt<1>
    input io_pipeline_writedata : UInt<32>
    input io_pipeline_memread : UInt<1>
    input io_pipeline_memwrite : UInt<1>
    input io_pipeline_maskmode : UInt<2>
    input io_pipeline_sext : UInt<1>
    output io_pipeline_readdata : UInt<32>
    input io_bus_request_ready : UInt<1>
    output io_bus_request_valid : UInt<1>
    output io_bus_request_bits_address : UInt<32>
    output io_bus_request_bits_writedata : UInt<32>
    output io_bus_request_bits_operation : UInt<2>
    input io_bus_response_valid : UInt<1>
    input io_bus_response_bits_data : UInt<32>
  
    reg outstandingReq_valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outstandingReq_valid) @[memory-noncombin-ports.scala 50:28]
    reg outstandingReq_bits_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), outstandingReq_bits_address) @[memory-noncombin-ports.scala 50:28]
    reg outstandingReq_bits_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), outstandingReq_bits_writedata) @[memory-noncombin-ports.scala 50:28]
    reg outstandingReq_bits_maskmode : UInt<2>, clock with :
      reset => (UInt<1>("h0"), outstandingReq_bits_maskmode) @[memory-noncombin-ports.scala 50:28]
    reg outstandingReq_bits_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), outstandingReq_bits_operation) @[memory-noncombin-ports.scala 50:28]
    reg outstandingReq_bits_sext : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outstandingReq_bits_sext) @[memory-noncombin-ports.scala 50:28]
    node _T_1 = eq(outstandingReq_valid, UInt<1>("h0")) @[memory-noncombin-ports.scala 62:15]
    node _T_2 = eq(outstandingReq_bits_operation, UInt<1>("h0")) @[memory-noncombin-ports.scala 62:121]
    node _T_3 = and(outstandingReq_valid, _T_2) @[memory-noncombin-ports.scala 62:88]
    node _T_4 = and(io_bus_response_valid, _T_3) @[memory-noncombin-ports.scala 62:63]
    node ready = or(_T_1, _T_4) @[memory-noncombin-ports.scala 62:37]
    node _T_5 = or(io_pipeline_memread, io_pipeline_memwrite) @[memory-noncombin-ports.scala 63:51]
    node _T_6 = and(io_pipeline_valid, _T_5) @[memory-noncombin-ports.scala 63:27]
    node _T_7 = and(_T_6, ready) @[memory-noncombin-ports.scala 63:76]
    node _T_8 = and(io_pipeline_memread, io_pipeline_memwrite) @[memory-noncombin-ports.scala 65:36]
    node _T_9 = eq(_T_8, UInt<1>("h0")) @[memory-noncombin-ports.scala 65:13]
    node _T_10 = asUInt(reset) @[memory-noncombin-ports.scala 65:12]
    node _T_11 = or(_T_9, _T_10) @[memory-noncombin-ports.scala 65:12]
    node _T_12 = eq(_T_11, UInt<1>("h0")) @[memory-noncombin-ports.scala 65:12]
    node _GEN_0 = mux(io_pipeline_memwrite, UInt<1>("h1"), UInt<1>("h0")) @[memory-noncombin-ports.scala 74:33]
    node _GEN_1 = mux(_T_7, io_pipeline_address, outstandingReq_bits_address) @[memory-noncombin-ports.scala 63:86]
    node _GEN_2 = mux(_T_7, io_pipeline_writedata, outstandingReq_bits_writedata) @[memory-noncombin-ports.scala 63:86]
    node _GEN_3 = mux(_T_7, io_pipeline_maskmode, outstandingReq_bits_maskmode) @[memory-noncombin-ports.scala 63:86]
    node _GEN_4 = mux(_T_7, io_pipeline_sext, outstandingReq_bits_sext) @[memory-noncombin-ports.scala 63:86]
    node _GEN_5 = mux(_T_7, _GEN_0, outstandingReq_bits_operation) @[memory-noncombin-ports.scala 63:86]
    node _GEN_6 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[memory-noncombin-ports.scala 63:86]
    node _GEN_7 = validif(_T_7, io_pipeline_address) @[memory-noncombin-ports.scala 63:86]
    node _GEN_8 = validif(_T_7, UInt<1>("h0")) @[memory-noncombin-ports.scala 63:86]
    node _T_13 = asUInt(reset) @[memory-noncombin-ports.scala 94:11]
    node _T_14 = or(outstandingReq_valid, _T_13) @[memory-noncombin-ports.scala 94:11]
    node _T_15 = eq(_T_14, UInt<1>("h0")) @[memory-noncombin-ports.scala 94:11]
    node _T_16 = eq(outstandingReq_bits_operation, UInt<1>("h1")) @[memory-noncombin-ports.scala 95:41]
    node _T_18 = neq(outstandingReq_bits_maskmode, UInt<2>("h2")) @[memory-noncombin-ports.scala 99:42]
    node _T_19 = bits(outstandingReq_bits_address, 1, 0) @[memory-noncombin-ports.scala 101:50]
    node _T_21 = eq(io_pipeline_maskmode, UInt<1>("h0")) @[memory-noncombin-ports.scala 105:36]
    node _T_22 = eq(_T_19, UInt<1>("h0")) @[memory-noncombin-ports.scala 106:23]
    node _T_20 = io_bus_response_bits_data @[memory-noncombin-ports.scala 102:29 memory-noncombin-ports.scala 103:18]
    node _T_23 = bits(_T_20, 31, 8) @[memory-noncombin-ports.scala 107:38]
    node _T_24 = bits(io_pipeline_writedata, 7, 0) @[memory-noncombin-ports.scala 107:67]
    node _T_25 = cat(_T_23, _T_24) @[Cat.scala 29:58]
    node _T_26 = eq(_T_19, UInt<1>("h1")) @[memory-noncombin-ports.scala 108:29]
    node _T_27 = bits(_T_20, 31, 16) @[memory-noncombin-ports.scala 109:38]
    node _T_28 = bits(io_pipeline_writedata, 15, 8) @[memory-noncombin-ports.scala 109:72]
    node _T_29 = bits(_T_20, 7, 0) @[memory-noncombin-ports.scala 109:88]
    node _T_30 = cat(_T_28, _T_29) @[Cat.scala 29:58]
    node _T_31 = cat(_T_27, _T_30) @[Cat.scala 29:58]
    node _T_32 = eq(_T_19, UInt<2>("h2")) @[memory-noncombin-ports.scala 110:29]
    node _T_33 = bits(_T_20, 31, 24) @[memory-noncombin-ports.scala 111:38]
    node _T_34 = bits(io_pipeline_writedata, 23, 16) @[memory-noncombin-ports.scala 111:72]
    node _T_35 = bits(_T_20, 15, 0) @[memory-noncombin-ports.scala 111:88]
    node _T_36 = cat(_T_34, _T_35) @[Cat.scala 29:58]
    node _T_37 = cat(_T_33, _T_36) @[Cat.scala 29:58]
    node _T_38 = bits(io_pipeline_writedata, 31, 24) @[memory-noncombin-ports.scala 113:51]
    node _T_39 = bits(_T_20, 23, 0) @[memory-noncombin-ports.scala 113:68]
    node _T_40 = cat(_T_38, _T_39) @[Cat.scala 29:58]
    node _GEN_9 = mux(_T_32, _T_37, _T_40) @[memory-noncombin-ports.scala 110:38]
    node _GEN_10 = mux(_T_26, _T_31, _GEN_9) @[memory-noncombin-ports.scala 108:38]
    node _GEN_11 = mux(_T_22, _T_25, _GEN_10) @[memory-noncombin-ports.scala 106:32]
    node _T_41 = eq(_T_19, UInt<1>("h0")) @[memory-noncombin-ports.scala 116:24]
    node _T_42 = bits(_T_20, 31, 16) @[memory-noncombin-ports.scala 117:38]
    node _T_43 = bits(io_pipeline_writedata, 15, 0) @[memory-noncombin-ports.scala 117:67]
    node _T_44 = cat(_T_42, _T_43) @[Cat.scala 29:58]
    node _T_45 = bits(io_pipeline_writedata, 31, 16) @[memory-noncombin-ports.scala 119:51]
    node _T_46 = bits(_T_20, 15, 0) @[memory-noncombin-ports.scala 119:68]
    node _T_47 = cat(_T_45, _T_46) @[Cat.scala 29:58]
    node _GEN_12 = mux(_T_41, _T_44, _T_47) @[memory-noncombin-ports.scala 116:33]
    node _GEN_13 = mux(_T_21, _GEN_11, _GEN_12) @[memory-noncombin-ports.scala 105:45]
    node _GEN_14 = mux(_T_18, _GEN_13, outstandingReq_bits_writedata) @[memory-noncombin-ports.scala 99:51]
    node _T_51 = bits(outstandingReq_bits_address, 1, 0) @[memory-noncombin-ports.scala 140:47]
    node _T_52 = eq(outstandingReq_bits_maskmode, UInt<1>("h0")) @[memory-noncombin-ports.scala 141:42]
    node _T_53 = mul(_T_51, UInt<4>("h8")) @[memory-noncombin-ports.scala 143:64]
    node _T_54 = dshr(io_bus_response_bits_data, _T_53) @[memory-noncombin-ports.scala 143:53]
    node _T_55 = and(_T_54, UInt<8>("hff")) @[memory-noncombin-ports.scala 143:72]
    node _T_56 = eq(outstandingReq_bits_maskmode, UInt<1>("h1")) @[memory-noncombin-ports.scala 144:49]
    node _T_57 = mul(_T_51, UInt<4>("h8")) @[memory-noncombin-ports.scala 146:64]
    node _T_58 = dshr(io_bus_response_bits_data, _T_57) @[memory-noncombin-ports.scala 146:53]
    node _T_59 = and(_T_58, UInt<16>("hffff")) @[memory-noncombin-ports.scala 146:72]
    node _GEN_15 = mux(_T_56, _T_59, io_bus_response_bits_data) @[memory-noncombin-ports.scala 144:58]
    node _GEN_16 = mux(_T_52, _T_55, _GEN_15) @[memory-noncombin-ports.scala 141:51]
    node _T_60 = eq(outstandingReq_bits_maskmode, UInt<1>("h0")) @[memory-noncombin-ports.scala 152:44]
    node _T_49 = _GEN_16 @[memory-noncombin-ports.scala 137:36 memory-noncombin-ports.scala 143:23 memory-noncombin-ports.scala 146:23 memory-noncombin-ports.scala 148:23]
    node _T_61 = bits(_T_49, 7, 7) @[memory-noncombin-ports.scala 154:59]
    node _T_62 = bits(_T_61, 0, 0) @[Bitwise.scala 71:15]
    node _T_63 = mux(_T_62, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 71:12]
    node _T_64 = bits(_T_49, 7, 0) @[memory-noncombin-ports.scala 154:79]
    node _T_65 = cat(_T_63, _T_64) @[Cat.scala 29:58]
    node _T_66 = eq(outstandingReq_bits_maskmode, UInt<1>("h1")) @[memory-noncombin-ports.scala 155:51]
    node _T_67 = bits(_T_49, 15, 15) @[memory-noncombin-ports.scala 157:59]
    node _T_68 = bits(_T_67, 0, 0) @[Bitwise.scala 71:15]
    node _T_69 = mux(_T_68, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 71:12]
    node _T_70 = bits(_T_49, 15, 0) @[memory-noncombin-ports.scala 157:79]
    node _T_71 = cat(_T_69, _T_70) @[Cat.scala 29:58]
    node _GEN_17 = mux(_T_66, _T_71, _T_49) @[memory-noncombin-ports.scala 155:60]
    node _GEN_18 = mux(_T_60, _T_65, _GEN_17) @[memory-noncombin-ports.scala 152:53]
    node _GEN_19 = mux(outstandingReq_bits_sext, _GEN_18, _T_49) @[memory-noncombin-ports.scala 151:39]
    node _T_48_operation = pad(UInt<1>("h1"), 2) @[memory-noncombin-ports.scala 128:26 memory-noncombin-ports.scala 131:25]
    node _GEN_20 = mux(_T_16, _T_48_operation, _GEN_8) @[memory-noncombin-ports.scala 95:68]
    node _T_17 = _GEN_14 @[memory-noncombin-ports.scala 96:28 memory-noncombin-ports.scala 107:23 memory-noncombin-ports.scala 109:23 memory-noncombin-ports.scala 111:23 memory-noncombin-ports.scala 113:23 memory-noncombin-ports.scala 117:23 memory-noncombin-ports.scala 119:23 memory-noncombin-ports.scala 124:19]
    node _T_48_writedata = _T_17 @[memory-noncombin-ports.scala 128:26 memory-noncombin-ports.scala 130:25]
    node _GEN_21 = mux(_T_16, _T_48_writedata, _GEN_8) @[memory-noncombin-ports.scala 95:68]
    node _T_48_address = outstandingReq_bits_address @[memory-noncombin-ports.scala 128:26 memory-noncombin-ports.scala 129:25]
    node _GEN_22 = mux(_T_16, _T_48_address, _GEN_7) @[memory-noncombin-ports.scala 95:68]
    node _GEN_23 = mux(_T_16, UInt<1>("h1"), _GEN_6) @[memory-noncombin-ports.scala 95:68]
    node _T_readdata = UInt<32>("h0") @[base-memory-components.scala 69:31 base-memory-components.scala 69:31]
    node _T_50 = _GEN_19 @[memory-noncombin-ports.scala 138:36 memory-noncombin-ports.scala 154:30 memory-noncombin-ports.scala 157:30 memory-noncombin-ports.scala 160:30 memory-noncombin-ports.scala 163:28]
    node _GEN_24 = mux(_T_16, _T_readdata, _T_50) @[memory-noncombin-ports.scala 95:68]
    node sending = _GEN_6 @[memory-noncombin-ports.scala 54:21 memory-noncombin-ports.scala 79:13 memory-noncombin-ports.scala 89:13]
    node _T_72 = or(outstandingReq_valid, sending) @[memory-noncombin-ports.scala 172:50]
    node _GEN_25 = mux(io_bus_response_valid, _GEN_20, _GEN_8) @[memory-noncombin-ports.scala 93:32]
    node _GEN_26 = mux(io_bus_response_valid, _GEN_21, _GEN_8) @[memory-noncombin-ports.scala 93:32]
    node _GEN_27 = mux(io_bus_response_valid, _GEN_22, _GEN_7) @[memory-noncombin-ports.scala 93:32]
    node _GEN_28 = mux(io_bus_response_valid, _GEN_23, _GEN_6) @[memory-noncombin-ports.scala 93:32]
    node _GEN_29 = mux(io_bus_response_valid, _GEN_24, _T_readdata) @[memory-noncombin-ports.scala 93:32]
    node _GEN_30 = mux(io_bus_response_valid, sending, _T_72) @[memory-noncombin-ports.scala 93:32]
    node _T_address = io_pipeline_address @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_valid = io_pipeline_valid @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_good = UInt<1>("h0") @[base-memory-components.scala 69:31 base-memory-components.scala 69:31]
    node _T_writedata = io_pipeline_writedata @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_memread = io_pipeline_memread @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_memwrite = io_pipeline_memwrite @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_maskmode = io_pipeline_maskmode @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_sext = io_pipeline_sext @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    io_pipeline_good <= io_bus_response_valid @[base-memory-components.scala 69:15 base-memory-components.scala 76:20]
    io_pipeline_readdata <= _GEN_29 @[base-memory-components.scala 69:15 memory-noncombin-ports.scala 166:28]
    io_bus_request_valid <= _GEN_28 @[memory-noncombin-ports.scala 85:35 memory-noncombin-ports.scala 88:26 memory-noncombin-ports.scala 133:28]
    io_bus_request_bits_address <= _GEN_27 @[memory-noncombin-ports.scala 82:35 memory-noncombin-ports.scala 132:28]
    io_bus_request_bits_writedata <= _GEN_26 @[memory-noncombin-ports.scala 83:35 memory-noncombin-ports.scala 132:28]
    io_bus_request_bits_operation <= _GEN_25 @[memory-noncombin-ports.scala 84:35 memory-noncombin-ports.scala 132:28]
    outstandingReq_valid <= _GEN_30 @[memory-noncombin-ports.scala 51:24 memory-noncombin-ports.scala 169:26 memory-noncombin-ports.scala 172:26]
    outstandingReq_bits_address <= _GEN_1 @[memory-noncombin-ports.scala 70:35]
    outstandingReq_bits_writedata <= _GEN_2 @[memory-noncombin-ports.scala 71:35]
    outstandingReq_bits_maskmode <= _GEN_3 @[memory-noncombin-ports.scala 72:35]
    outstandingReq_bits_operation <= _GEN_5 @[memory-noncombin-ports.scala 75:37 memory-noncombin-ports.scala 77:37]
    outstandingReq_bits_sext <= _GEN_4 @[memory-noncombin-ports.scala 73:35]
    printf(clock, and(and(and(UInt<1>("h1"), _T_7), _T_12), UInt<1>("h1")), "Assertion failed\n    at memory-noncombin-ports.scala:65 assert (! (io.pipeline.memread && io.pipeline.memwrite))\n") @[memory-noncombin-ports.scala 65:12]
    stop(clock, and(and(and(UInt<1>("h1"), _T_7), _T_12), UInt<1>("h1")), 1) @[memory-noncombin-ports.scala 65:12]
    printf(clock, and(and(and(UInt<1>("h1"), io_bus_response_valid), _T_15), UInt<1>("h1")), "Assertion failed\n    at memory-noncombin-ports.scala:94 assert(outstandingReq.valid)\n") @[memory-noncombin-ports.scala 94:11]
    stop(clock, and(and(and(UInt<1>("h1"), io_bus_response_valid), _T_15), UInt<1>("h1")), 1) @[memory-noncombin-ports.scala 94:11]

  module Pipe :
    input clock : Clock
    input reset : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits_address : UInt<32>
    input io_enq_bits_writedata : UInt<32>
    input io_enq_bits_operation : UInt<2>
    output io_deq_valid : UInt<1>
    output io_deq_bits_address : UInt<32>
    output io_deq_bits_writedata : UInt<32>
    output io_deq_bits_operation : UInt<2>
  
    reg _T : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T) @[Valid.scala 117:22]
    reg _T_1_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_1_address) @[Reg.scala 15:16]
    reg _T_1_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_1_writedata) @[Reg.scala 15:16]
    reg _T_1_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_1_operation) @[Reg.scala 15:16]
    node _GEN_0 = mux(io_enq_valid, io_enq_bits_operation, _T_1_operation) @[Reg.scala 16:19]
    node _GEN_1 = mux(io_enq_valid, io_enq_bits_writedata, _T_1_writedata) @[Reg.scala 16:19]
    node _GEN_2 = mux(io_enq_valid, io_enq_bits_address, _T_1_address) @[Reg.scala 16:19]
    reg _T_2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_2) @[Valid.scala 117:22]
    reg _T_3_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_3_address) @[Reg.scala 15:16]
    reg _T_3_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_3_writedata) @[Reg.scala 15:16]
    reg _T_3_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_3_operation) @[Reg.scala 15:16]
    node _GEN_3 = mux(_T, _T_1_operation, _T_3_operation) @[Reg.scala 16:19]
    node _GEN_4 = mux(_T, _T_1_writedata, _T_3_writedata) @[Reg.scala 16:19]
    node _GEN_5 = mux(_T, _T_1_address, _T_3_address) @[Reg.scala 16:19]
    reg _T_4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_4) @[Valid.scala 117:22]
    reg _T_5_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_5_address) @[Reg.scala 15:16]
    reg _T_5_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_5_writedata) @[Reg.scala 15:16]
    reg _T_5_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_5_operation) @[Reg.scala 15:16]
    node _GEN_6 = mux(_T_2, _T_3_operation, _T_5_operation) @[Reg.scala 16:19]
    node _GEN_7 = mux(_T_2, _T_3_writedata, _T_5_writedata) @[Reg.scala 16:19]
    node _GEN_8 = mux(_T_2, _T_3_address, _T_5_address) @[Reg.scala 16:19]
    reg _T_6 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_6) @[Valid.scala 117:22]
    reg _T_7_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_7_address) @[Reg.scala 15:16]
    reg _T_7_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_7_writedata) @[Reg.scala 15:16]
    reg _T_7_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_7_operation) @[Reg.scala 15:16]
    node _GEN_9 = mux(_T_4, _T_5_operation, _T_7_operation) @[Reg.scala 16:19]
    node _GEN_10 = mux(_T_4, _T_5_writedata, _T_7_writedata) @[Reg.scala 16:19]
    node _GEN_11 = mux(_T_4, _T_5_address, _T_7_address) @[Reg.scala 16:19]
    reg _T_8 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_8) @[Valid.scala 117:22]
    reg _T_9_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_9_address) @[Reg.scala 15:16]
    reg _T_9_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_9_writedata) @[Reg.scala 15:16]
    reg _T_9_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_9_operation) @[Reg.scala 15:16]
    node _GEN_12 = mux(_T_6, _T_7_operation, _T_9_operation) @[Reg.scala 16:19]
    node _GEN_13 = mux(_T_6, _T_7_writedata, _T_9_writedata) @[Reg.scala 16:19]
    node _GEN_14 = mux(_T_6, _T_7_address, _T_9_address) @[Reg.scala 16:19]
    reg _T_10 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_10) @[Valid.scala 117:22]
    reg _T_11_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_11_address) @[Reg.scala 15:16]
    reg _T_11_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_11_writedata) @[Reg.scala 15:16]
    reg _T_11_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_11_operation) @[Reg.scala 15:16]
    node _GEN_15 = mux(_T_8, _T_9_operation, _T_11_operation) @[Reg.scala 16:19]
    node _GEN_16 = mux(_T_8, _T_9_writedata, _T_11_writedata) @[Reg.scala 16:19]
    node _GEN_17 = mux(_T_8, _T_9_address, _T_11_address) @[Reg.scala 16:19]
    reg _T_12 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_12) @[Valid.scala 117:22]
    reg _T_13_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_13_address) @[Reg.scala 15:16]
    reg _T_13_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_13_writedata) @[Reg.scala 15:16]
    reg _T_13_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_13_operation) @[Reg.scala 15:16]
    node _GEN_18 = mux(_T_10, _T_11_operation, _T_13_operation) @[Reg.scala 16:19]
    node _GEN_19 = mux(_T_10, _T_11_writedata, _T_13_writedata) @[Reg.scala 16:19]
    node _GEN_20 = mux(_T_10, _T_11_address, _T_13_address) @[Reg.scala 16:19]
    reg _T_14 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_14) @[Valid.scala 117:22]
    reg _T_15_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_15_address) @[Reg.scala 15:16]
    reg _T_15_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_15_writedata) @[Reg.scala 15:16]
    reg _T_15_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_15_operation) @[Reg.scala 15:16]
    node _GEN_21 = mux(_T_12, _T_13_operation, _T_15_operation) @[Reg.scala 16:19]
    node _GEN_22 = mux(_T_12, _T_13_writedata, _T_15_writedata) @[Reg.scala 16:19]
    node _GEN_23 = mux(_T_12, _T_13_address, _T_15_address) @[Reg.scala 16:19]
    reg _T_16 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_16) @[Valid.scala 117:22]
    reg _T_17_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_17_address) @[Reg.scala 15:16]
    reg _T_17_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_17_writedata) @[Reg.scala 15:16]
    reg _T_17_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_17_operation) @[Reg.scala 15:16]
    node _GEN_24 = mux(_T_14, _T_15_operation, _T_17_operation) @[Reg.scala 16:19]
    node _GEN_25 = mux(_T_14, _T_15_writedata, _T_17_writedata) @[Reg.scala 16:19]
    node _GEN_26 = mux(_T_14, _T_15_address, _T_17_address) @[Reg.scala 16:19]
    reg _T_18 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_18) @[Valid.scala 117:22]
    reg _T_19_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_19_address) @[Reg.scala 15:16]
    reg _T_19_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_19_writedata) @[Reg.scala 15:16]
    reg _T_19_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_19_operation) @[Reg.scala 15:16]
    node _GEN_27 = mux(_T_16, _T_17_operation, _T_19_operation) @[Reg.scala 16:19]
    node _GEN_28 = mux(_T_16, _T_17_writedata, _T_19_writedata) @[Reg.scala 16:19]
    node _GEN_29 = mux(_T_16, _T_17_address, _T_19_address) @[Reg.scala 16:19]
    reg _T_20 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_20) @[Valid.scala 117:22]
    reg _T_21_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_21_address) @[Reg.scala 15:16]
    reg _T_21_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_21_writedata) @[Reg.scala 15:16]
    reg _T_21_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_21_operation) @[Reg.scala 15:16]
    node _GEN_30 = mux(_T_18, _T_19_operation, _T_21_operation) @[Reg.scala 16:19]
    node _GEN_31 = mux(_T_18, _T_19_writedata, _T_21_writedata) @[Reg.scala 16:19]
    node _GEN_32 = mux(_T_18, _T_19_address, _T_21_address) @[Reg.scala 16:19]
    reg _T_22 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_22) @[Valid.scala 117:22]
    reg _T_23_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_23_address) @[Reg.scala 15:16]
    reg _T_23_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_23_writedata) @[Reg.scala 15:16]
    reg _T_23_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_23_operation) @[Reg.scala 15:16]
    node _GEN_33 = mux(_T_20, _T_21_operation, _T_23_operation) @[Reg.scala 16:19]
    node _GEN_34 = mux(_T_20, _T_21_writedata, _T_23_writedata) @[Reg.scala 16:19]
    node _GEN_35 = mux(_T_20, _T_21_address, _T_23_address) @[Reg.scala 16:19]
    reg _T_24 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_24) @[Valid.scala 117:22]
    reg _T_25_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_25_address) @[Reg.scala 15:16]
    reg _T_25_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_25_writedata) @[Reg.scala 15:16]
    reg _T_25_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_25_operation) @[Reg.scala 15:16]
    node _GEN_36 = mux(_T_22, _T_23_operation, _T_25_operation) @[Reg.scala 16:19]
    node _GEN_37 = mux(_T_22, _T_23_writedata, _T_25_writedata) @[Reg.scala 16:19]
    node _GEN_38 = mux(_T_22, _T_23_address, _T_25_address) @[Reg.scala 16:19]
    reg _T_26 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_26) @[Valid.scala 117:22]
    reg _T_27_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_27_address) @[Reg.scala 15:16]
    reg _T_27_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_27_writedata) @[Reg.scala 15:16]
    reg _T_27_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_27_operation) @[Reg.scala 15:16]
    node _GEN_39 = mux(_T_24, _T_25_operation, _T_27_operation) @[Reg.scala 16:19]
    node _GEN_40 = mux(_T_24, _T_25_writedata, _T_27_writedata) @[Reg.scala 16:19]
    node _GEN_41 = mux(_T_24, _T_25_address, _T_27_address) @[Reg.scala 16:19]
    reg _T_28 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_28) @[Valid.scala 117:22]
    reg _T_29_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_29_address) @[Reg.scala 15:16]
    reg _T_29_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_29_writedata) @[Reg.scala 15:16]
    reg _T_29_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_29_operation) @[Reg.scala 15:16]
    node _GEN_42 = mux(_T_26, _T_27_operation, _T_29_operation) @[Reg.scala 16:19]
    node _GEN_43 = mux(_T_26, _T_27_writedata, _T_29_writedata) @[Reg.scala 16:19]
    node _GEN_44 = mux(_T_26, _T_27_address, _T_29_address) @[Reg.scala 16:19]
    reg _T_30 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_30) @[Valid.scala 117:22]
    reg _T_31_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_31_address) @[Reg.scala 15:16]
    reg _T_31_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_31_writedata) @[Reg.scala 15:16]
    reg _T_31_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_31_operation) @[Reg.scala 15:16]
    node _GEN_45 = mux(_T_28, _T_29_operation, _T_31_operation) @[Reg.scala 16:19]
    node _GEN_46 = mux(_T_28, _T_29_writedata, _T_31_writedata) @[Reg.scala 16:19]
    node _GEN_47 = mux(_T_28, _T_29_address, _T_31_address) @[Reg.scala 16:19]
    reg _T_32 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_32) @[Valid.scala 117:22]
    reg _T_33_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_33_address) @[Reg.scala 15:16]
    reg _T_33_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_33_writedata) @[Reg.scala 15:16]
    reg _T_33_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_33_operation) @[Reg.scala 15:16]
    node _GEN_48 = mux(_T_30, _T_31_operation, _T_33_operation) @[Reg.scala 16:19]
    node _GEN_49 = mux(_T_30, _T_31_writedata, _T_33_writedata) @[Reg.scala 16:19]
    node _GEN_50 = mux(_T_30, _T_31_address, _T_33_address) @[Reg.scala 16:19]
    reg _T_34 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_34) @[Valid.scala 117:22]
    reg _T_35_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_35_address) @[Reg.scala 15:16]
    reg _T_35_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_35_writedata) @[Reg.scala 15:16]
    reg _T_35_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_35_operation) @[Reg.scala 15:16]
    node _GEN_51 = mux(_T_32, _T_33_operation, _T_35_operation) @[Reg.scala 16:19]
    node _GEN_52 = mux(_T_32, _T_33_writedata, _T_35_writedata) @[Reg.scala 16:19]
    node _GEN_53 = mux(_T_32, _T_33_address, _T_35_address) @[Reg.scala 16:19]
    reg _T_36 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_36) @[Valid.scala 117:22]
    reg _T_37_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_37_address) @[Reg.scala 15:16]
    reg _T_37_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_37_writedata) @[Reg.scala 15:16]
    reg _T_37_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_37_operation) @[Reg.scala 15:16]
    node _GEN_54 = mux(_T_34, _T_35_operation, _T_37_operation) @[Reg.scala 16:19]
    node _GEN_55 = mux(_T_34, _T_35_writedata, _T_37_writedata) @[Reg.scala 16:19]
    node _GEN_56 = mux(_T_34, _T_35_address, _T_37_address) @[Reg.scala 16:19]
    reg _T_38 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_38) @[Valid.scala 117:22]
    reg _T_39_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_39_address) @[Reg.scala 15:16]
    reg _T_39_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_39_writedata) @[Reg.scala 15:16]
    reg _T_39_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_39_operation) @[Reg.scala 15:16]
    node _GEN_57 = mux(_T_36, _T_37_operation, _T_39_operation) @[Reg.scala 16:19]
    node _GEN_58 = mux(_T_36, _T_37_writedata, _T_39_writedata) @[Reg.scala 16:19]
    node _GEN_59 = mux(_T_36, _T_37_address, _T_39_address) @[Reg.scala 16:19]
    reg _T_40 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_40) @[Valid.scala 117:22]
    reg _T_41_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_41_address) @[Reg.scala 15:16]
    reg _T_41_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_41_writedata) @[Reg.scala 15:16]
    reg _T_41_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_41_operation) @[Reg.scala 15:16]
    node _GEN_60 = mux(_T_38, _T_39_operation, _T_41_operation) @[Reg.scala 16:19]
    node _GEN_61 = mux(_T_38, _T_39_writedata, _T_41_writedata) @[Reg.scala 16:19]
    node _GEN_62 = mux(_T_38, _T_39_address, _T_41_address) @[Reg.scala 16:19]
    reg _T_42 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_42) @[Valid.scala 117:22]
    reg _T_43_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_43_address) @[Reg.scala 15:16]
    reg _T_43_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_43_writedata) @[Reg.scala 15:16]
    reg _T_43_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_43_operation) @[Reg.scala 15:16]
    node _GEN_63 = mux(_T_40, _T_41_operation, _T_43_operation) @[Reg.scala 16:19]
    node _GEN_64 = mux(_T_40, _T_41_writedata, _T_43_writedata) @[Reg.scala 16:19]
    node _GEN_65 = mux(_T_40, _T_41_address, _T_43_address) @[Reg.scala 16:19]
    reg _T_44 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_44) @[Valid.scala 117:22]
    reg _T_45_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_45_address) @[Reg.scala 15:16]
    reg _T_45_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_45_writedata) @[Reg.scala 15:16]
    reg _T_45_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_45_operation) @[Reg.scala 15:16]
    node _GEN_66 = mux(_T_42, _T_43_operation, _T_45_operation) @[Reg.scala 16:19]
    node _GEN_67 = mux(_T_42, _T_43_writedata, _T_45_writedata) @[Reg.scala 16:19]
    node _GEN_68 = mux(_T_42, _T_43_address, _T_45_address) @[Reg.scala 16:19]
    reg _T_46 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_46) @[Valid.scala 117:22]
    reg _T_47_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_47_address) @[Reg.scala 15:16]
    reg _T_47_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_47_writedata) @[Reg.scala 15:16]
    reg _T_47_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_47_operation) @[Reg.scala 15:16]
    node _GEN_69 = mux(_T_44, _T_45_operation, _T_47_operation) @[Reg.scala 16:19]
    node _GEN_70 = mux(_T_44, _T_45_writedata, _T_47_writedata) @[Reg.scala 16:19]
    node _GEN_71 = mux(_T_44, _T_45_address, _T_47_address) @[Reg.scala 16:19]
    reg _T_48 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_48) @[Valid.scala 117:22]
    reg _T_49_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_49_address) @[Reg.scala 15:16]
    reg _T_49_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_49_writedata) @[Reg.scala 15:16]
    reg _T_49_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_49_operation) @[Reg.scala 15:16]
    node _GEN_72 = mux(_T_46, _T_47_operation, _T_49_operation) @[Reg.scala 16:19]
    node _GEN_73 = mux(_T_46, _T_47_writedata, _T_49_writedata) @[Reg.scala 16:19]
    node _GEN_74 = mux(_T_46, _T_47_address, _T_49_address) @[Reg.scala 16:19]
    reg _T_50 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_50) @[Valid.scala 117:22]
    reg _T_51_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_51_address) @[Reg.scala 15:16]
    reg _T_51_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_51_writedata) @[Reg.scala 15:16]
    reg _T_51_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_51_operation) @[Reg.scala 15:16]
    node _GEN_75 = mux(_T_48, _T_49_operation, _T_51_operation) @[Reg.scala 16:19]
    node _GEN_76 = mux(_T_48, _T_49_writedata, _T_51_writedata) @[Reg.scala 16:19]
    node _GEN_77 = mux(_T_48, _T_49_address, _T_51_address) @[Reg.scala 16:19]
    reg _T_52 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_52) @[Valid.scala 117:22]
    reg _T_53_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_53_address) @[Reg.scala 15:16]
    reg _T_53_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_53_writedata) @[Reg.scala 15:16]
    reg _T_53_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_53_operation) @[Reg.scala 15:16]
    node _GEN_78 = mux(_T_50, _T_51_operation, _T_53_operation) @[Reg.scala 16:19]
    node _GEN_79 = mux(_T_50, _T_51_writedata, _T_53_writedata) @[Reg.scala 16:19]
    node _GEN_80 = mux(_T_50, _T_51_address, _T_53_address) @[Reg.scala 16:19]
    reg _T_54 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_54) @[Valid.scala 117:22]
    reg _T_55_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_55_address) @[Reg.scala 15:16]
    reg _T_55_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_55_writedata) @[Reg.scala 15:16]
    reg _T_55_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_55_operation) @[Reg.scala 15:16]
    node _GEN_81 = mux(_T_52, _T_53_operation, _T_55_operation) @[Reg.scala 16:19]
    node _GEN_82 = mux(_T_52, _T_53_writedata, _T_55_writedata) @[Reg.scala 16:19]
    node _GEN_83 = mux(_T_52, _T_53_address, _T_55_address) @[Reg.scala 16:19]
    reg _T_56 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_56) @[Valid.scala 117:22]
    reg _T_57_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_57_address) @[Reg.scala 15:16]
    reg _T_57_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_57_writedata) @[Reg.scala 15:16]
    reg _T_57_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_57_operation) @[Reg.scala 15:16]
    node _GEN_84 = mux(_T_54, _T_55_operation, _T_57_operation) @[Reg.scala 16:19]
    node _GEN_85 = mux(_T_54, _T_55_writedata, _T_57_writedata) @[Reg.scala 16:19]
    node _GEN_86 = mux(_T_54, _T_55_address, _T_57_address) @[Reg.scala 16:19]
    reg _T_58 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_58) @[Valid.scala 117:22]
    reg _T_59_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_59_address) @[Reg.scala 15:16]
    reg _T_59_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_59_writedata) @[Reg.scala 15:16]
    reg _T_59_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_59_operation) @[Reg.scala 15:16]
    node _GEN_87 = mux(_T_56, _T_57_operation, _T_59_operation) @[Reg.scala 16:19]
    node _GEN_88 = mux(_T_56, _T_57_writedata, _T_59_writedata) @[Reg.scala 16:19]
    node _GEN_89 = mux(_T_56, _T_57_address, _T_59_address) @[Reg.scala 16:19]
    reg _T_60 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_60) @[Valid.scala 117:22]
    reg _T_61_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_61_address) @[Reg.scala 15:16]
    reg _T_61_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_61_writedata) @[Reg.scala 15:16]
    reg _T_61_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_61_operation) @[Reg.scala 15:16]
    node _GEN_90 = mux(_T_58, _T_59_operation, _T_61_operation) @[Reg.scala 16:19]
    node _GEN_91 = mux(_T_58, _T_59_writedata, _T_61_writedata) @[Reg.scala 16:19]
    node _GEN_92 = mux(_T_58, _T_59_address, _T_61_address) @[Reg.scala 16:19]
    reg _T_62 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), _T_62) @[Valid.scala 117:22]
    reg _T_63_address : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_63_address) @[Reg.scala 15:16]
    reg _T_63_writedata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), _T_63_writedata) @[Reg.scala 15:16]
    reg _T_63_operation : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _T_63_operation) @[Reg.scala 15:16]
    node _GEN_93 = mux(_T_60, _T_61_operation, _T_63_operation) @[Reg.scala 16:19]
    node _GEN_94 = mux(_T_60, _T_61_writedata, _T_63_writedata) @[Reg.scala 16:19]
    node _GEN_95 = mux(_T_60, _T_61_address, _T_63_address) @[Reg.scala 16:19]
    node _T_64_valid = _T_62 @[Valid.scala 112:21 Valid.scala 113:17]
    node _T_64_bits_address = _T_63_address @[Valid.scala 112:21 Valid.scala 114:16]
    node _T_64_bits_writedata = _T_63_writedata @[Valid.scala 112:21 Valid.scala 114:16]
    node _T_64_bits_operation = _T_63_operation @[Valid.scala 112:21 Valid.scala 114:16]
    io_deq_valid <= _T_64_valid @[Valid.scala 187:10]
    io_deq_bits_address <= _T_64_bits_address @[Valid.scala 187:10]
    io_deq_bits_writedata <= _T_64_bits_writedata @[Valid.scala 187:10]
    io_deq_bits_operation <= _T_64_bits_operation @[Valid.scala 187:10]
    _T <= mux(reset, UInt<1>("h0"), io_enq_valid) @[Valid.scala 117:22]
    _T_1_address <= _GEN_2 @[Reg.scala 16:23]
    _T_1_writedata <= _GEN_1 @[Reg.scala 16:23]
    _T_1_operation <= _GEN_0 @[Reg.scala 16:23]
    _T_2 <= mux(reset, UInt<1>("h0"), _T) @[Valid.scala 117:22]
    _T_3_address <= _GEN_5 @[Reg.scala 16:23]
    _T_3_writedata <= _GEN_4 @[Reg.scala 16:23]
    _T_3_operation <= _GEN_3 @[Reg.scala 16:23]
    _T_4 <= mux(reset, UInt<1>("h0"), _T_2) @[Valid.scala 117:22]
    _T_5_address <= _GEN_8 @[Reg.scala 16:23]
    _T_5_writedata <= _GEN_7 @[Reg.scala 16:23]
    _T_5_operation <= _GEN_6 @[Reg.scala 16:23]
    _T_6 <= mux(reset, UInt<1>("h0"), _T_4) @[Valid.scala 117:22]
    _T_7_address <= _GEN_11 @[Reg.scala 16:23]
    _T_7_writedata <= _GEN_10 @[Reg.scala 16:23]
    _T_7_operation <= _GEN_9 @[Reg.scala 16:23]
    _T_8 <= mux(reset, UInt<1>("h0"), _T_6) @[Valid.scala 117:22]
    _T_9_address <= _GEN_14 @[Reg.scala 16:23]
    _T_9_writedata <= _GEN_13 @[Reg.scala 16:23]
    _T_9_operation <= _GEN_12 @[Reg.scala 16:23]
    _T_10 <= mux(reset, UInt<1>("h0"), _T_8) @[Valid.scala 117:22]
    _T_11_address <= _GEN_17 @[Reg.scala 16:23]
    _T_11_writedata <= _GEN_16 @[Reg.scala 16:23]
    _T_11_operation <= _GEN_15 @[Reg.scala 16:23]
    _T_12 <= mux(reset, UInt<1>("h0"), _T_10) @[Valid.scala 117:22]
    _T_13_address <= _GEN_20 @[Reg.scala 16:23]
    _T_13_writedata <= _GEN_19 @[Reg.scala 16:23]
    _T_13_operation <= _GEN_18 @[Reg.scala 16:23]
    _T_14 <= mux(reset, UInt<1>("h0"), _T_12) @[Valid.scala 117:22]
    _T_15_address <= _GEN_23 @[Reg.scala 16:23]
    _T_15_writedata <= _GEN_22 @[Reg.scala 16:23]
    _T_15_operation <= _GEN_21 @[Reg.scala 16:23]
    _T_16 <= mux(reset, UInt<1>("h0"), _T_14) @[Valid.scala 117:22]
    _T_17_address <= _GEN_26 @[Reg.scala 16:23]
    _T_17_writedata <= _GEN_25 @[Reg.scala 16:23]
    _T_17_operation <= _GEN_24 @[Reg.scala 16:23]
    _T_18 <= mux(reset, UInt<1>("h0"), _T_16) @[Valid.scala 117:22]
    _T_19_address <= _GEN_29 @[Reg.scala 16:23]
    _T_19_writedata <= _GEN_28 @[Reg.scala 16:23]
    _T_19_operation <= _GEN_27 @[Reg.scala 16:23]
    _T_20 <= mux(reset, UInt<1>("h0"), _T_18) @[Valid.scala 117:22]
    _T_21_address <= _GEN_32 @[Reg.scala 16:23]
    _T_21_writedata <= _GEN_31 @[Reg.scala 16:23]
    _T_21_operation <= _GEN_30 @[Reg.scala 16:23]
    _T_22 <= mux(reset, UInt<1>("h0"), _T_20) @[Valid.scala 117:22]
    _T_23_address <= _GEN_35 @[Reg.scala 16:23]
    _T_23_writedata <= _GEN_34 @[Reg.scala 16:23]
    _T_23_operation <= _GEN_33 @[Reg.scala 16:23]
    _T_24 <= mux(reset, UInt<1>("h0"), _T_22) @[Valid.scala 117:22]
    _T_25_address <= _GEN_38 @[Reg.scala 16:23]
    _T_25_writedata <= _GEN_37 @[Reg.scala 16:23]
    _T_25_operation <= _GEN_36 @[Reg.scala 16:23]
    _T_26 <= mux(reset, UInt<1>("h0"), _T_24) @[Valid.scala 117:22]
    _T_27_address <= _GEN_41 @[Reg.scala 16:23]
    _T_27_writedata <= _GEN_40 @[Reg.scala 16:23]
    _T_27_operation <= _GEN_39 @[Reg.scala 16:23]
    _T_28 <= mux(reset, UInt<1>("h0"), _T_26) @[Valid.scala 117:22]
    _T_29_address <= _GEN_44 @[Reg.scala 16:23]
    _T_29_writedata <= _GEN_43 @[Reg.scala 16:23]
    _T_29_operation <= _GEN_42 @[Reg.scala 16:23]
    _T_30 <= mux(reset, UInt<1>("h0"), _T_28) @[Valid.scala 117:22]
    _T_31_address <= _GEN_47 @[Reg.scala 16:23]
    _T_31_writedata <= _GEN_46 @[Reg.scala 16:23]
    _T_31_operation <= _GEN_45 @[Reg.scala 16:23]
    _T_32 <= mux(reset, UInt<1>("h0"), _T_30) @[Valid.scala 117:22]
    _T_33_address <= _GEN_50 @[Reg.scala 16:23]
    _T_33_writedata <= _GEN_49 @[Reg.scala 16:23]
    _T_33_operation <= _GEN_48 @[Reg.scala 16:23]
    _T_34 <= mux(reset, UInt<1>("h0"), _T_32) @[Valid.scala 117:22]
    _T_35_address <= _GEN_53 @[Reg.scala 16:23]
    _T_35_writedata <= _GEN_52 @[Reg.scala 16:23]
    _T_35_operation <= _GEN_51 @[Reg.scala 16:23]
    _T_36 <= mux(reset, UInt<1>("h0"), _T_34) @[Valid.scala 117:22]
    _T_37_address <= _GEN_56 @[Reg.scala 16:23]
    _T_37_writedata <= _GEN_55 @[Reg.scala 16:23]
    _T_37_operation <= _GEN_54 @[Reg.scala 16:23]
    _T_38 <= mux(reset, UInt<1>("h0"), _T_36) @[Valid.scala 117:22]
    _T_39_address <= _GEN_59 @[Reg.scala 16:23]
    _T_39_writedata <= _GEN_58 @[Reg.scala 16:23]
    _T_39_operation <= _GEN_57 @[Reg.scala 16:23]
    _T_40 <= mux(reset, UInt<1>("h0"), _T_38) @[Valid.scala 117:22]
    _T_41_address <= _GEN_62 @[Reg.scala 16:23]
    _T_41_writedata <= _GEN_61 @[Reg.scala 16:23]
    _T_41_operation <= _GEN_60 @[Reg.scala 16:23]
    _T_42 <= mux(reset, UInt<1>("h0"), _T_40) @[Valid.scala 117:22]
    _T_43_address <= _GEN_65 @[Reg.scala 16:23]
    _T_43_writedata <= _GEN_64 @[Reg.scala 16:23]
    _T_43_operation <= _GEN_63 @[Reg.scala 16:23]
    _T_44 <= mux(reset, UInt<1>("h0"), _T_42) @[Valid.scala 117:22]
    _T_45_address <= _GEN_68 @[Reg.scala 16:23]
    _T_45_writedata <= _GEN_67 @[Reg.scala 16:23]
    _T_45_operation <= _GEN_66 @[Reg.scala 16:23]
    _T_46 <= mux(reset, UInt<1>("h0"), _T_44) @[Valid.scala 117:22]
    _T_47_address <= _GEN_71 @[Reg.scala 16:23]
    _T_47_writedata <= _GEN_70 @[Reg.scala 16:23]
    _T_47_operation <= _GEN_69 @[Reg.scala 16:23]
    _T_48 <= mux(reset, UInt<1>("h0"), _T_46) @[Valid.scala 117:22]
    _T_49_address <= _GEN_74 @[Reg.scala 16:23]
    _T_49_writedata <= _GEN_73 @[Reg.scala 16:23]
    _T_49_operation <= _GEN_72 @[Reg.scala 16:23]
    _T_50 <= mux(reset, UInt<1>("h0"), _T_48) @[Valid.scala 117:22]
    _T_51_address <= _GEN_77 @[Reg.scala 16:23]
    _T_51_writedata <= _GEN_76 @[Reg.scala 16:23]
    _T_51_operation <= _GEN_75 @[Reg.scala 16:23]
    _T_52 <= mux(reset, UInt<1>("h0"), _T_50) @[Valid.scala 117:22]
    _T_53_address <= _GEN_80 @[Reg.scala 16:23]
    _T_53_writedata <= _GEN_79 @[Reg.scala 16:23]
    _T_53_operation <= _GEN_78 @[Reg.scala 16:23]
    _T_54 <= mux(reset, UInt<1>("h0"), _T_52) @[Valid.scala 117:22]
    _T_55_address <= _GEN_83 @[Reg.scala 16:23]
    _T_55_writedata <= _GEN_82 @[Reg.scala 16:23]
    _T_55_operation <= _GEN_81 @[Reg.scala 16:23]
    _T_56 <= mux(reset, UInt<1>("h0"), _T_54) @[Valid.scala 117:22]
    _T_57_address <= _GEN_86 @[Reg.scala 16:23]
    _T_57_writedata <= _GEN_85 @[Reg.scala 16:23]
    _T_57_operation <= _GEN_84 @[Reg.scala 16:23]
    _T_58 <= mux(reset, UInt<1>("h0"), _T_56) @[Valid.scala 117:22]
    _T_59_address <= _GEN_89 @[Reg.scala 16:23]
    _T_59_writedata <= _GEN_88 @[Reg.scala 16:23]
    _T_59_operation <= _GEN_87 @[Reg.scala 16:23]
    _T_60 <= mux(reset, UInt<1>("h0"), _T_58) @[Valid.scala 117:22]
    _T_61_address <= _GEN_92 @[Reg.scala 16:23]
    _T_61_writedata <= _GEN_91 @[Reg.scala 16:23]
    _T_61_operation <= _GEN_90 @[Reg.scala 16:23]
    _T_62 <= mux(reset, UInt<1>("h0"), _T_60) @[Valid.scala 117:22]
    _T_63_address <= _GEN_95 @[Reg.scala 16:23]
    _T_63_writedata <= _GEN_94 @[Reg.scala 16:23]
    _T_63_operation <= _GEN_93 @[Reg.scala 16:23]

  module DualPortedNonCombinMemory :
    input clock : Clock
    input reset : UInt<1>
    output io_imem_request_ready : UInt<1>
    input io_imem_request_valid : UInt<1>
    input io_imem_request_bits_address : UInt<32>
    input io_imem_request_bits_writedata : UInt<32>
    input io_imem_request_bits_operation : UInt<2>
    output io_imem_response_valid : UInt<1>
    output io_imem_response_bits_data : UInt<32>
    output io_dmem_request_ready : UInt<1>
    input io_dmem_request_valid : UInt<1>
    input io_dmem_request_bits_address : UInt<32>
    input io_dmem_request_bits_writedata : UInt<32>
    input io_dmem_request_bits_operation : UInt<2>
    output io_dmem_response_valid : UInt<1>
    output io_dmem_response_bits_data : UInt<32>
  
    mem memory : @[base-memory-components.scala 39:19]
      data-type => UInt<32>
      depth => 512
      read-latency => 0
      write-latency => 1
      reader => _T_12
      reader => _T_24
      writer => _T_27
      read-under-write => undefined
    inst imemPipe of Pipe @[memory-noncombin.scala 34:24]
    inst dmemPipe of Pipe @[memory-noncombin.scala 62:28]
    node _GEN_0 = validif(io_imem_request_valid, io_imem_request_bits_operation) @[memory-noncombin.scala 38:32]
    node _GEN_1 = validif(io_imem_request_valid, io_imem_request_bits_writedata) @[memory-noncombin.scala 38:32]
    node _GEN_2 = validif(io_imem_request_valid, io_imem_request_bits_address) @[memory-noncombin.scala 38:32]
    node _GEN_3 = mux(io_imem_request_valid, UInt<1>("h1"), UInt<1>("h0")) @[memory-noncombin.scala 38:32]
    node _T_2 = eq(imemPipe.io_deq_bits_operation, UInt<1>("h0")) @[memory-noncombin.scala 49:43]
    node _T_3 = asUInt(reset) @[memory-noncombin.scala 49:11]
    node _T_4 = or(_T_2, _T_3) @[memory-noncombin.scala 49:11]
    node _T_5 = eq(_T_4, UInt<1>("h0")) @[memory-noncombin.scala 49:11]
    node _T_6 = lt(imemPipe.io_deq_bits_address, UInt<12>("h800")) @[memory-noncombin.scala 52:32]
    node _T_7 = asUInt(reset) @[memory-noncombin.scala 52:12]
    node _T_8 = or(_T_6, _T_7) @[memory-noncombin.scala 52:12]
    node _T_9 = eq(_T_8, UInt<1>("h0")) @[memory-noncombin.scala 52:12]
    node _T_10 = shr(imemPipe.io_deq_bits_address, 2) @[memory-noncombin.scala 54:64]
    node _T_11 = bits(_T_10, 8, 0) @[memory-noncombin.scala 54:44]
    node _GEN_4 = mux(imemPipe.io_deq_valid, UInt<1>("h1"), UInt<1>("h0")) @[memory-noncombin.scala 47:32]
    node _GEN_5 = validif(imemPipe.io_deq_valid, _T_11) @[memory-noncombin.scala 47:32]
    node _GEN_6 = validif(imemPipe.io_deq_valid, clock) @[memory-noncombin.scala 47:32]
    node _T_bits_data = UInt<32>("h0") @[base-memory-components.scala 36:35 base-memory-components.scala 36:35]
    node _GEN_7 = mux(imemPipe.io_deq_valid, memory._T_12.data, _T_bits_data) @[memory-noncombin.scala 47:32]
    node _GEN_8 = validif(io_dmem_request_valid, io_dmem_request_bits_operation) @[memory-noncombin.scala 66:32]
    node _GEN_9 = validif(io_dmem_request_valid, io_dmem_request_bits_writedata) @[memory-noncombin.scala 66:32]
    node _GEN_10 = validif(io_dmem_request_valid, io_dmem_request_bits_address) @[memory-noncombin.scala 66:32]
    node _GEN_11 = mux(io_dmem_request_valid, UInt<1>("h1"), UInt<1>("h0")) @[memory-noncombin.scala 66:32]
    node _T_13 = neq(dmemPipe.io_deq_bits_operation, UInt<2>("h2")) @[memory-noncombin.scala 76:44]
    node _T_14 = asUInt(reset) @[memory-noncombin.scala 76:12]
    node _T_15 = or(_T_13, _T_14) @[memory-noncombin.scala 76:12]
    node _T_16 = eq(_T_15, UInt<1>("h0")) @[memory-noncombin.scala 76:12]
    node _T_17 = shr(dmemPipe.io_deq_bits_address, 2) @[memory-noncombin.scala 79:38]
    node _T_18 = lt(dmemPipe.io_deq_bits_address, UInt<12>("h800")) @[memory-noncombin.scala 81:32]
    node _T_19 = asUInt(reset) @[memory-noncombin.scala 81:12]
    node _T_20 = or(_T_18, _T_19) @[memory-noncombin.scala 81:12]
    node _T_21 = eq(_T_20, UInt<1>("h0")) @[memory-noncombin.scala 81:12]
    node _T_22 = eq(dmemPipe.io_deq_bits_operation, UInt<1>("h0")) @[memory-noncombin.scala 83:32]
    node _T_23 = bits(_T_17, 8, 0) @[memory-noncombin.scala 85:46]
    node _T_25 = eq(dmemPipe.io_deq_bits_operation, UInt<1>("h1")) @[memory-noncombin.scala 86:39]
    node _T_26 = bits(_T_17, 8, 0) @[memory-noncombin.scala 88:13]
    node _GEN_12 = mux(_T_25, UInt<1>("h0"), UInt<1>("h0")) @[memory-noncombin.scala 86:50]
    node _GEN_13 = validif(_T_25, _T_26) @[memory-noncombin.scala 86:50]
    node _GEN_14 = validif(_T_25, clock) @[memory-noncombin.scala 86:50]
    node _GEN_15 = mux(_T_25, UInt<1>("h1"), UInt<1>("h0")) @[memory-noncombin.scala 86:50]
    node _GEN_16 = validif(_T_25, UInt<1>("h1")) @[memory-noncombin.scala 86:50]
    node _GEN_17 = validif(_T_25, dmemPipe.io_deq_bits_writedata) @[memory-noncombin.scala 86:50]
    node _GEN_18 = mux(_T_22, UInt<1>("h1"), _GEN_12) @[memory-noncombin.scala 83:42]
    node _GEN_19 = validif(_T_22, _T_23) @[memory-noncombin.scala 83:42]
    node _GEN_20 = validif(_T_22, clock) @[memory-noncombin.scala 83:42]
    node _GEN_21 = mux(_T_22, UInt<1>("h1"), UInt<1>("h0")) @[memory-noncombin.scala 83:42]
    node _T_1_bits_data = UInt<32>("h0") @[base-memory-components.scala 37:35 base-memory-components.scala 37:35]
    node _GEN_22 = mux(_T_22, memory._T_24.data, _T_1_bits_data) @[memory-noncombin.scala 83:42]
    node _GEN_23 = validif(eq(_T_22, UInt<1>("h0")), _GEN_13) @[memory-noncombin.scala 83:42]
    node _GEN_24 = validif(eq(_T_22, UInt<1>("h0")), _GEN_14) @[memory-noncombin.scala 83:42]
    node _GEN_25 = mux(_T_22, UInt<1>("h0"), _GEN_15) @[memory-noncombin.scala 83:42]
    node _GEN_26 = validif(eq(_T_22, UInt<1>("h0")), _GEN_16) @[memory-noncombin.scala 83:42]
    node _GEN_27 = validif(eq(_T_22, UInt<1>("h0")), _GEN_17) @[memory-noncombin.scala 83:42]
    node _GEN_28 = mux(dmemPipe.io_deq_valid, _GEN_18, UInt<1>("h0")) @[memory-noncombin.scala 75:32]
    node _GEN_29 = validif(dmemPipe.io_deq_valid, _GEN_19) @[memory-noncombin.scala 75:32]
    node _GEN_30 = validif(dmemPipe.io_deq_valid, _GEN_20) @[memory-noncombin.scala 75:32]
    node _GEN_31 = mux(dmemPipe.io_deq_valid, _GEN_21, UInt<1>("h0")) @[memory-noncombin.scala 75:32]
    node _GEN_32 = mux(dmemPipe.io_deq_valid, _GEN_22, _T_1_bits_data) @[memory-noncombin.scala 75:32]
    node _GEN_33 = validif(dmemPipe.io_deq_valid, _GEN_23) @[memory-noncombin.scala 75:32]
    node _GEN_34 = validif(dmemPipe.io_deq_valid, _GEN_24) @[memory-noncombin.scala 75:32]
    node _GEN_35 = mux(dmemPipe.io_deq_valid, _GEN_25, UInt<1>("h0")) @[memory-noncombin.scala 75:32]
    node _GEN_36 = validif(dmemPipe.io_deq_valid, _GEN_26) @[memory-noncombin.scala 75:32]
    node _GEN_37 = validif(dmemPipe.io_deq_valid, _GEN_27) @[memory-noncombin.scala 75:32]
    node _T_valid = UInt<1>("h0") @[base-memory-components.scala 36:35 base-memory-components.scala 36:35]
    node _T_1_valid = UInt<1>("h0") @[base-memory-components.scala 37:35 base-memory-components.scala 37:35]
    io_imem_request_ready <= UInt<1>("h1") @[memory-noncombin.scala 29:26]
    io_imem_response_valid <= _GEN_4 @[base-memory-components.scala 36:20 memory-noncombin.scala 24:27 memory-noncombin.scala 53:35 memory-noncombin.scala 57:28]
    io_imem_response_bits_data <= _GEN_7 @[base-memory-components.scala 36:20 memory-noncombin.scala 54:35]
    io_dmem_request_ready <= UInt<1>("h1") @[memory-noncombin.scala 29:26]
    io_dmem_response_valid <= _GEN_28 @[base-memory-components.scala 37:20 memory-noncombin.scala 24:27 memory-noncombin.scala 84:37 memory-noncombin.scala 87:37 memory-noncombin.scala 92:28]
    io_dmem_response_bits_data <= _GEN_32 @[base-memory-components.scala 37:20 memory-noncombin.scala 85:37]
    memory._T_12.addr <= _GEN_5 @[memory-noncombin.scala 54:44]
    memory._T_12.en <= _GEN_4 @[base-memory-components.scala 39:19 memory-noncombin.scala 54:44]
    memory._T_12.clk <= _GEN_6 @[memory-noncombin.scala 54:44]
    memory._T_24.addr <= _GEN_29 @[memory-noncombin.scala 85:46]
    memory._T_24.en <= _GEN_31 @[base-memory-components.scala 39:19 memory-noncombin.scala 85:46]
    memory._T_24.clk <= _GEN_30 @[memory-noncombin.scala 85:46]
    memory._T_27.addr <= _GEN_33 @[memory-noncombin.scala 88:13]
    memory._T_27.en <= _GEN_35 @[base-memory-components.scala 39:19 memory-noncombin.scala 88:13]
    memory._T_27.clk <= _GEN_34 @[memory-noncombin.scala 88:13]
    memory._T_27.data <= _GEN_37 @[memory-noncombin.scala 88:23]
    memory._T_27.mask <= _GEN_36 @[memory-noncombin.scala 88:13 memory-noncombin.scala 88:23]
    imemPipe.clock <= clock
    imemPipe.reset <= reset
    imemPipe.io_enq_valid <= _GEN_3 @[memory-noncombin.scala 23:27 memory-noncombin.scala 42:27 memory-noncombin.scala 44:27]
    imemPipe.io_enq_bits_address <= _GEN_2 @[memory-noncombin.scala 41:27]
    imemPipe.io_enq_bits_writedata <= _GEN_1 @[memory-noncombin.scala 41:27]
    imemPipe.io_enq_bits_operation <= _GEN_0 @[memory-noncombin.scala 41:27]
    dmemPipe.clock <= clock
    dmemPipe.reset <= reset
    dmemPipe.io_enq_valid <= _GEN_11 @[memory-noncombin.scala 23:27 memory-noncombin.scala 70:27 memory-noncombin.scala 72:27]
    dmemPipe.io_enq_bits_address <= _GEN_10 @[memory-noncombin.scala 69:27]
    dmemPipe.io_enq_bits_writedata <= _GEN_9 @[memory-noncombin.scala 69:27]
    dmemPipe.io_enq_bits_operation <= _GEN_8 @[memory-noncombin.scala 69:27]
    printf(clock, and(and(and(UInt<1>("h1"), imemPipe.io_deq_valid), _T_5), UInt<1>("h1")), "Assertion failed\n    at memory-noncombin.scala:49 assert(imemPipe.io.deq.bits.operation === Read)\n") @[memory-noncombin.scala 49:11]
    stop(clock, and(and(and(UInt<1>("h1"), imemPipe.io_deq_valid), _T_5), UInt<1>("h1")), 1) @[memory-noncombin.scala 49:11]
    printf(clock, and(and(and(UInt<1>("h1"), imemPipe.io_deq_valid), _T_9), UInt<1>("h1")), "Assertion failed\n    at memory-noncombin.scala:52 assert (outRequest.address < size.U)\n") @[memory-noncombin.scala 52:12]
    stop(clock, and(and(and(UInt<1>("h1"), imemPipe.io_deq_valid), _T_9), UInt<1>("h1")), 1) @[memory-noncombin.scala 52:12]
    printf(clock, and(and(and(UInt<1>("h1"), dmemPipe.io_deq_valid), _T_16), UInt<1>("h1")), "Assertion failed\n    at memory-noncombin.scala:76 assert (dmemPipe.io.deq.bits.operation =/= ReadWrite)\n") @[memory-noncombin.scala 76:12]
    stop(clock, and(and(and(UInt<1>("h1"), dmemPipe.io_deq_valid), _T_16), UInt<1>("h1")), 1) @[memory-noncombin.scala 76:12]
    printf(clock, and(and(and(UInt<1>("h1"), dmemPipe.io_deq_valid), _T_21), UInt<1>("h1")), "Assertion failed\n    at memory-noncombin.scala:81 assert (outRequest.address < size.U)\n") @[memory-noncombin.scala 81:12]
    stop(clock, and(and(and(UInt<1>("h1"), dmemPipe.io_deq_valid), _T_21), UInt<1>("h1")), 1) @[memory-noncombin.scala 81:12]

  module NonCombinMemoryTestHarness :
    input clock : Clock
    input reset : UInt<1>
    input io_imem_address : UInt<32>
    input io_imem_valid : UInt<1>
    output io_imem_instruction : UInt<32>
    output io_imem_good : UInt<1>
    input io_dmem_address : UInt<32>
    input io_dmem_valid : UInt<1>
    input io_dmem_writedata : UInt<32>
    input io_dmem_memread : UInt<1>
    input io_dmem_memwrite : UInt<1>
    input io_dmem_maskmode : UInt<2>
    input io_dmem_sext : UInt<1>
    output io_dmem_readdata : UInt<32>
    output io_dmem_good : UInt<1>
  
    inst imem of INonCombinMemPort @[NonCombinMemoryUnitTest.scala 42:20]
    inst dmem of DNonCombinMemPort @[NonCombinMemoryUnitTest.scala 44:20]
    inst memory of DualPortedNonCombinMemory @[NonCombinMemoryUnitTest.scala 45:22]
    io_imem_instruction <= imem.io_pipeline_instruction @[NonCombinMemoryUnitTest.scala 51:23]
    io_imem_good <= imem.io_pipeline_good @[NonCombinMemoryUnitTest.scala 52:23]
    io_dmem_readdata <= dmem.io_pipeline_readdata @[NonCombinMemoryUnitTest.scala 60:23]
    io_dmem_good <= dmem.io_pipeline_good @[NonCombinMemoryUnitTest.scala 61:23]
    imem.clock <= clock
    imem.reset <= reset
    imem.io_pipeline_address <= io_imem_address @[NonCombinMemoryUnitTest.scala 49:32]
    imem.io_pipeline_valid <= io_imem_valid @[NonCombinMemoryUnitTest.scala 50:32]
    imem.io_bus_request_ready <= memory.io_imem_request_ready @[base-memory-components.scala 16:26]
    imem.io_bus_response_valid <= memory.io_imem_response_valid @[base-memory-components.scala 17:26]
    imem.io_bus_response_bits_data <= memory.io_imem_response_bits_data @[base-memory-components.scala 17:26]
    dmem.clock <= clock
    dmem.reset <= reset
    dmem.io_pipeline_address <= io_dmem_address @[NonCombinMemoryUnitTest.scala 53:32]
    dmem.io_pipeline_valid <= io_dmem_valid @[NonCombinMemoryUnitTest.scala 54:32]
    dmem.io_pipeline_writedata <= io_dmem_writedata @[NonCombinMemoryUnitTest.scala 55:32]
    dmem.io_pipeline_memread <= io_dmem_memread @[NonCombinMemoryUnitTest.scala 56:32]
    dmem.io_pipeline_memwrite <= io_dmem_memwrite @[NonCombinMemoryUnitTest.scala 57:32]
    dmem.io_pipeline_maskmode <= io_dmem_maskmode @[NonCombinMemoryUnitTest.scala 58:32]
    dmem.io_pipeline_sext <= io_dmem_sext @[NonCombinMemoryUnitTest.scala 59:32]
    dmem.io_bus_request_ready <= memory.io_dmem_request_ready @[base-memory-components.scala 19:26]
    dmem.io_bus_response_valid <= memory.io_dmem_response_valid @[base-memory-components.scala 20:26]
    dmem.io_bus_response_bits_data <= memory.io_dmem_response_bits_data @[base-memory-components.scala 20:26]
    memory.clock <= clock
    memory.reset <= reset
    memory.io_imem_request_valid <= imem.io_bus_request_valid @[base-memory-components.scala 16:26]
    memory.io_imem_request_bits_address <= imem.io_bus_request_bits_address @[base-memory-components.scala 16:26]
    memory.io_imem_request_bits_writedata <= imem.io_bus_request_bits_writedata @[base-memory-components.scala 16:26]
    memory.io_imem_request_bits_operation <= imem.io_bus_request_bits_operation @[base-memory-components.scala 16:26]
    memory.io_dmem_request_valid <= dmem.io_bus_request_valid @[base-memory-components.scala 19:26]
    memory.io_dmem_request_bits_address <= dmem.io_bus_request_bits_address @[base-memory-components.scala 19:26]
    memory.io_dmem_request_bits_writedata <= dmem.io_bus_request_bits_writedata @[base-memory-components.scala 19:26]
    memory.io_dmem_request_bits_operation <= dmem.io_bus_request_bits_operation @[base-memory-components.scala 19:26]
