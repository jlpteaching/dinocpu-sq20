circuit CombinMemoryTestHarness :
  module ICombinMemPort :
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
    node _T_address = io_pipeline_address @[base-memory-components.scala 52:31 base-memory-components.scala 52:31 base-memory-components.scala 52:15]
    node _T_valid = io_pipeline_valid @[base-memory-components.scala 52:31 base-memory-components.scala 52:31 base-memory-components.scala 52:15]
    node _T_good = UInt<1>("h0") @[base-memory-components.scala 52:31 base-memory-components.scala 52:31]
    node _T_instruction = UInt<32>("h0") @[base-memory-components.scala 52:31 base-memory-components.scala 52:31]
    node _T_ready = UInt<1>("h0") @[base-memory-components.scala 52:31 base-memory-components.scala 52:31]
    io_pipeline_good <= UInt<1>("h1") @[base-memory-components.scala 52:15 memory-combin-ports.scala 32:20]
    io_pipeline_instruction <= io_bus_response_bits_data @[base-memory-components.scala 52:15 memory-combin-ports.scala 33:27]
    io_pipeline_ready <= UInt<1>("h1") @[base-memory-components.scala 52:15 memory-combin-ports.scala 29:21]
    io_bus_request_valid <= _GEN_3 @[memory-combin-ports.scala 23:26 memory-combin-ports.scala 25:26]
    io_bus_request_bits_address <= _GEN_2 @[memory-combin-ports.scala 22:26]
    io_bus_request_bits_writedata <= _GEN_1 @[memory-combin-ports.scala 22:26]
    io_bus_request_bits_operation <= _GEN_0 @[memory-combin-ports.scala 22:26]

  module DCombinMemPort :
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
  
    node _T_1 = or(io_pipeline_memread, io_pipeline_memwrite) @[memory-combin-ports.scala 44:51]
    node _T_2 = and(io_pipeline_valid, _T_1) @[memory-combin-ports.scala 44:27]
    node _T_3 = and(io_pipeline_memread, io_pipeline_memwrite) @[memory-combin-ports.scala 46:34]
    node _T_4 = eq(_T_3, UInt<1>("h0")) @[memory-combin-ports.scala 46:12]
    node _T_5 = asUInt(reset) @[memory-combin-ports.scala 46:11]
    node _T_6 = or(_T_4, _T_5) @[memory-combin-ports.scala 46:11]
    node _T_7 = eq(_T_6, UInt<1>("h0")) @[memory-combin-ports.scala 46:11]
    node _GEN_0 = mux(io_pipeline_memwrite, UInt<2>("h2"), UInt<1>("h0")) @[memory-combin-ports.scala 51:33]
    node _GEN_1 = validif(_T_2, io_pipeline_address) @[memory-combin-ports.scala 44:77]
    node _GEN_2 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[memory-combin-ports.scala 44:77]
    node _GEN_3 = validif(_T_2, _GEN_0) @[memory-combin-ports.scala 44:77]
    node _T_9 = neq(io_pipeline_maskmode, UInt<2>("h2")) @[memory-combin-ports.scala 77:34]
    node _T_10 = bits(io_pipeline_address, 1, 0) @[memory-combin-ports.scala 79:42]
    node _T_12 = eq(io_pipeline_maskmode, UInt<1>("h0")) @[memory-combin-ports.scala 85:36]
    node _T_13 = eq(_T_10, UInt<1>("h0")) @[memory-combin-ports.scala 86:23]
    node _T_11 = io_bus_response_bits_data @[memory-combin-ports.scala 80:29 memory-combin-ports.scala 82:18]
    node _T_14 = bits(_T_11, 31, 8) @[memory-combin-ports.scala 87:38]
    node _T_15 = bits(io_pipeline_writedata, 7, 0) @[memory-combin-ports.scala 87:67]
    node _T_16 = cat(_T_14, _T_15) @[Cat.scala 29:58]
    node _T_17 = eq(_T_10, UInt<1>("h1")) @[memory-combin-ports.scala 88:29]
    node _T_18 = bits(_T_11, 31, 16) @[memory-combin-ports.scala 89:38]
    node _T_19 = bits(io_pipeline_writedata, 15, 8) @[memory-combin-ports.scala 89:72]
    node _T_20 = bits(_T_11, 7, 0) @[memory-combin-ports.scala 89:88]
    node _T_21 = cat(_T_19, _T_20) @[Cat.scala 29:58]
    node _T_22 = cat(_T_18, _T_21) @[Cat.scala 29:58]
    node _T_23 = eq(_T_10, UInt<2>("h2")) @[memory-combin-ports.scala 90:29]
    node _T_24 = bits(_T_11, 31, 24) @[memory-combin-ports.scala 91:38]
    node _T_25 = bits(io_pipeline_writedata, 23, 16) @[memory-combin-ports.scala 91:72]
    node _T_26 = bits(_T_11, 15, 0) @[memory-combin-ports.scala 91:88]
    node _T_27 = cat(_T_25, _T_26) @[Cat.scala 29:58]
    node _T_28 = cat(_T_24, _T_27) @[Cat.scala 29:58]
    node _T_29 = bits(io_pipeline_writedata, 31, 24) @[memory-combin-ports.scala 93:51]
    node _T_30 = bits(_T_11, 23, 0) @[memory-combin-ports.scala 93:68]
    node _T_31 = cat(_T_29, _T_30) @[Cat.scala 29:58]
    node _GEN_4 = mux(_T_23, _T_28, _T_31) @[memory-combin-ports.scala 90:38]
    node _GEN_5 = mux(_T_17, _T_22, _GEN_4) @[memory-combin-ports.scala 88:38]
    node _GEN_6 = mux(_T_13, _T_16, _GEN_5) @[memory-combin-ports.scala 86:32]
    node _T_32 = eq(_T_10, UInt<1>("h0")) @[memory-combin-ports.scala 96:24]
    node _T_33 = bits(_T_11, 31, 16) @[memory-combin-ports.scala 97:38]
    node _T_34 = bits(io_pipeline_writedata, 15, 0) @[memory-combin-ports.scala 97:67]
    node _T_35 = cat(_T_33, _T_34) @[Cat.scala 29:58]
    node _T_36 = bits(io_pipeline_writedata, 31, 16) @[memory-combin-ports.scala 99:51]
    node _T_37 = bits(_T_11, 15, 0) @[memory-combin-ports.scala 99:68]
    node _T_38 = cat(_T_36, _T_37) @[Cat.scala 29:58]
    node _GEN_7 = mux(_T_32, _T_35, _T_38) @[memory-combin-ports.scala 96:33]
    node _GEN_8 = mux(_T_12, _GEN_6, _GEN_7) @[memory-combin-ports.scala 85:45]
    node _GEN_9 = mux(_T_9, _GEN_8, io_pipeline_writedata) @[memory-combin-ports.scala 77:43]
    node _T_41 = bits(io_pipeline_address, 1, 0) @[memory-combin-ports.scala 113:39]
    node _T_42 = eq(io_pipeline_maskmode, UInt<1>("h0")) @[memory-combin-ports.scala 114:34]
    node _T_43 = mul(_T_41, UInt<4>("h8")) @[memory-combin-ports.scala 116:64]
    node _T_44 = dshr(io_bus_response_bits_data, _T_43) @[memory-combin-ports.scala 116:53]
    node _T_45 = and(_T_44, UInt<8>("hff")) @[memory-combin-ports.scala 116:72]
    node _T_46 = eq(io_pipeline_maskmode, UInt<1>("h1")) @[memory-combin-ports.scala 117:41]
    node _T_47 = mul(_T_41, UInt<4>("h8")) @[memory-combin-ports.scala 119:64]
    node _T_48 = dshr(io_bus_response_bits_data, _T_47) @[memory-combin-ports.scala 119:53]
    node _T_49 = and(_T_48, UInt<16>("hffff")) @[memory-combin-ports.scala 119:72]
    node _GEN_10 = mux(_T_46, _T_49, io_bus_response_bits_data) @[memory-combin-ports.scala 117:50]
    node _GEN_11 = mux(_T_42, _T_45, _GEN_10) @[memory-combin-ports.scala 114:43]
    node _T_50 = eq(io_pipeline_maskmode, UInt<1>("h0")) @[memory-combin-ports.scala 125:36]
    node _T_39 = _GEN_11 @[memory-combin-ports.scala 110:36 memory-combin-ports.scala 116:23 memory-combin-ports.scala 119:23 memory-combin-ports.scala 121:23]
    node _T_51 = bits(_T_39, 7, 7) @[memory-combin-ports.scala 127:59]
    node _T_52 = bits(_T_51, 0, 0) @[Bitwise.scala 71:15]
    node _T_53 = mux(_T_52, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 71:12]
    node _T_54 = bits(_T_39, 7, 0) @[memory-combin-ports.scala 127:79]
    node _T_55 = cat(_T_53, _T_54) @[Cat.scala 29:58]
    node _T_56 = eq(io_pipeline_maskmode, UInt<1>("h1")) @[memory-combin-ports.scala 128:43]
    node _T_57 = bits(_T_39, 15, 15) @[memory-combin-ports.scala 130:59]
    node _T_58 = bits(_T_57, 0, 0) @[Bitwise.scala 71:15]
    node _T_59 = mux(_T_58, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 71:12]
    node _T_60 = bits(_T_39, 15, 0) @[memory-combin-ports.scala 130:79]
    node _T_61 = cat(_T_59, _T_60) @[Cat.scala 29:58]
    node _GEN_12 = mux(_T_56, _T_61, _T_39) @[memory-combin-ports.scala 128:52]
    node _GEN_13 = mux(_T_50, _T_55, _GEN_12) @[memory-combin-ports.scala 125:45]
    node _GEN_14 = mux(io_pipeline_sext, _GEN_13, _T_39) @[memory-combin-ports.scala 124:31]
    node _T_40 = _GEN_14 @[memory-combin-ports.scala 111:36 memory-combin-ports.scala 127:30 memory-combin-ports.scala 130:30 memory-combin-ports.scala 133:30 memory-combin-ports.scala 136:28]
    node _T_readdata = UInt<32>("h0") @[base-memory-components.scala 69:31 base-memory-components.scala 69:31]
    node _GEN_15 = mux(io_pipeline_memread, _T_40, _T_readdata) @[memory-combin-ports.scala 108:39]
    node _T_8 = _GEN_9 @[memory-combin-ports.scala 74:28 memory-combin-ports.scala 87:23 memory-combin-ports.scala 89:23 memory-combin-ports.scala 91:23 memory-combin-ports.scala 93:23 memory-combin-ports.scala 97:23 memory-combin-ports.scala 99:23 memory-combin-ports.scala 104:19]
    node _GEN_16 = validif(io_pipeline_memwrite, _T_8) @[memory-combin-ports.scala 72:33]
    node _GEN_17 = mux(io_pipeline_memwrite, _T_readdata, _GEN_15) @[memory-combin-ports.scala 72:33]
    node _GEN_18 = validif(io_bus_response_valid, _GEN_16) @[memory-combin-ports.scala 71:32]
    node _GEN_19 = mux(io_bus_response_valid, _GEN_17, _T_readdata) @[memory-combin-ports.scala 71:32]
    node _T_address = io_pipeline_address @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_valid = io_pipeline_valid @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_good = UInt<1>("h0") @[base-memory-components.scala 69:31 base-memory-components.scala 69:31]
    node _T_writedata = io_pipeline_writedata @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_memread = io_pipeline_memread @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_memwrite = io_pipeline_memwrite @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_maskmode = io_pipeline_maskmode @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    node _T_sext = io_pipeline_sext @[base-memory-components.scala 69:31 base-memory-components.scala 69:31 base-memory-components.scala 69:15]
    io_pipeline_good <= UInt<1>("h1") @[base-memory-components.scala 69:15 base-memory-components.scala 76:20 memory-combin-ports.scala 42:20]
    io_pipeline_readdata <= _GEN_19 @[base-memory-components.scala 69:15 memory-combin-ports.scala 139:28]
    io_bus_request_valid <= _GEN_2 @[memory-combin-ports.scala 49:26 memory-combin-ports.scala 67:26]
    io_bus_request_bits_address <= _GEN_1 @[memory-combin-ports.scala 48:33]
    io_bus_request_bits_writedata <= _GEN_18 @[memory-combin-ports.scala 107:37]
    io_bus_request_bits_operation <= _GEN_3 @[memory-combin-ports.scala 60:37 memory-combin-ports.scala 63:37]
    printf(clock, and(and(and(UInt<1>("h1"), _T_2), _T_7), UInt<1>("h1")), "Assertion failed\n    at memory-combin-ports.scala:46 assert(!(io.pipeline.memread && io.pipeline.memwrite))\n") @[memory-combin-ports.scala 46:11]
    stop(clock, and(and(and(UInt<1>("h1"), _T_2), _T_7), UInt<1>("h1")), 1) @[memory-combin-ports.scala 46:11]

  module DualPortedCombinMemory :
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
      reader => _T_9
      reader => _T_20
      writer => _T_24
      read-under-write => undefined
    node _T_2 = eq(io_imem_request_bits_operation, UInt<1>("h0")) @[memory.scala 30:30]
    node _T_3 = asUInt(reset) @[memory.scala 30:11]
    node _T_4 = or(_T_2, _T_3) @[memory.scala 30:11]
    node _T_5 = eq(_T_4, UInt<1>("h0")) @[memory.scala 30:11]
    node _T_6 = lt(io_imem_request_bits_address, UInt<12>("h800")) @[memory.scala 35:27]
    node _T_7 = shr(io_imem_request_bits_address, 2) @[memory.scala 37:60]
    node _T_8 = bits(_T_7, 8, 0) @[memory.scala 37:43]
    node _GEN_0 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[memory.scala 35:37]
    node _GEN_1 = validif(_T_6, _T_8) @[memory.scala 35:37]
    node _GEN_2 = validif(_T_6, clock) @[memory.scala 35:37]
    node _T_bits_data = UInt<32>("h0") @[base-memory-components.scala 36:35 base-memory-components.scala 36:35]
    node _GEN_3 = mux(_T_6, memory._T_9.data, _T_bits_data) @[memory.scala 35:37]
    node _GEN_4 = mux(io_imem_request_valid, _GEN_0, UInt<1>("h0")) @[memory.scala 25:32]
    node _GEN_5 = validif(io_imem_request_valid, _GEN_1) @[memory.scala 25:32]
    node _GEN_6 = validif(io_imem_request_valid, _GEN_2) @[memory.scala 25:32]
    node _GEN_7 = mux(io_imem_request_valid, _GEN_3, _T_bits_data) @[memory.scala 25:32]
    node _T_10 = neq(io_dmem_request_bits_operation, UInt<1>("h1")) @[memory.scala 56:31]
    node _T_11 = asUInt(reset) @[memory.scala 56:12]
    node _T_12 = or(_T_10, _T_11) @[memory.scala 56:12]
    node _T_13 = eq(_T_12, UInt<1>("h0")) @[memory.scala 56:12]
    node _T_14 = lt(io_dmem_request_bits_address, UInt<12>("h800")) @[memory.scala 58:29]
    node _T_15 = asUInt(reset) @[memory.scala 58:12]
    node _T_16 = or(_T_14, _T_15) @[memory.scala 58:12]
    node _T_17 = eq(_T_16, UInt<1>("h0")) @[memory.scala 58:12]
    node _T_18 = shr(io_dmem_request_bits_address, 2) @[memory.scala 61:58]
    node _T_19 = bits(_T_18, 8, 0) @[memory.scala 61:46]
    node _T_21 = eq(io_dmem_request_bits_operation, UInt<2>("h2")) @[memory.scala 65:29]
    node _T_22 = shr(io_dmem_request_bits_address, 2) @[memory.scala 66:25]
    node _T_23 = bits(_T_22, 8, 0) @[memory.scala 66:13]
    node _GEN_8 = validif(_T_21, _T_23) @[memory.scala 65:44]
    node _GEN_9 = validif(_T_21, clock) @[memory.scala 65:44]
    node _GEN_10 = mux(_T_21, UInt<1>("h1"), UInt<1>("h0")) @[memory.scala 65:44]
    node _GEN_11 = validif(_T_21, UInt<1>("h1")) @[memory.scala 65:44]
    node _GEN_12 = validif(_T_21, io_dmem_request_bits_writedata) @[memory.scala 65:44]
    node _GEN_13 = validif(io_dmem_request_valid, _T_19) @[memory.scala 52:32]
    node _GEN_14 = validif(io_dmem_request_valid, clock) @[memory.scala 52:32]
    node _GEN_15 = mux(io_dmem_request_valid, UInt<1>("h1"), UInt<1>("h0")) @[memory.scala 52:32]
    node _T_1_bits_data = UInt<32>("h0") @[base-memory-components.scala 37:35 base-memory-components.scala 37:35]
    node _GEN_16 = mux(io_dmem_request_valid, memory._T_20.data, _T_1_bits_data) @[memory.scala 52:32]
    node _GEN_17 = validif(io_dmem_request_valid, _GEN_8) @[memory.scala 52:32]
    node _GEN_18 = validif(io_dmem_request_valid, _GEN_9) @[memory.scala 52:32]
    node _GEN_19 = mux(io_dmem_request_valid, _GEN_10, UInt<1>("h0")) @[memory.scala 52:32]
    node _GEN_20 = validif(io_dmem_request_valid, _GEN_11) @[memory.scala 52:32]
    node _GEN_21 = validif(io_dmem_request_valid, _GEN_12) @[memory.scala 52:32]
    node _T_valid = UInt<1>("h0") @[base-memory-components.scala 36:35 base-memory-components.scala 36:35]
    node _T_1_valid = UInt<1>("h0") @[base-memory-components.scala 37:35 base-memory-components.scala 37:35]
    io_imem_request_ready <= UInt<1>("h1") @[memory.scala 19:26]
    io_imem_response_valid <= _GEN_4 @[base-memory-components.scala 36:20 memory.scala 17:27 memory.scala 36:30 memory.scala 39:30 memory.scala 42:28]
    io_imem_response_bits_data <= _GEN_7 @[base-memory-components.scala 36:20 memory.scala 37:34]
    io_dmem_request_ready <= UInt<1>("h1") @[memory.scala 19:26]
    io_dmem_response_valid <= _GEN_15 @[base-memory-components.scala 37:20 memory.scala 17:27 memory.scala 62:28 memory.scala 69:28]
    io_dmem_response_bits_data <= _GEN_16 @[base-memory-components.scala 37:20 memory.scala 61:32]
    memory._T_9.addr <= _GEN_5 @[memory.scala 37:43]
    memory._T_9.en <= _GEN_4 @[base-memory-components.scala 39:19 memory.scala 37:43]
    memory._T_9.clk <= _GEN_6 @[memory.scala 37:43]
    memory._T_20.addr <= _GEN_13 @[memory.scala 61:46]
    memory._T_20.en <= _GEN_15 @[base-memory-components.scala 39:19 memory.scala 61:46]
    memory._T_20.clk <= _GEN_14 @[memory.scala 61:46]
    memory._T_24.addr <= _GEN_17 @[memory.scala 66:13]
    memory._T_24.en <= _GEN_19 @[base-memory-components.scala 39:19 memory.scala 66:13]
    memory._T_24.clk <= _GEN_18 @[memory.scala 66:13]
    memory._T_24.data <= _GEN_21 @[memory.scala 66:31]
    memory._T_24.mask <= _GEN_20 @[memory.scala 66:13 memory.scala 66:31]
    printf(clock, and(and(and(UInt<1>("h1"), io_imem_request_valid), _T_5), UInt<1>("h1")), "Assertion failed\n    at memory.scala:30 assert(request.operation === Read)\n") @[memory.scala 30:11]
    stop(clock, and(and(and(UInt<1>("h1"), io_imem_request_valid), _T_5), UInt<1>("h1")), 1) @[memory.scala 30:11]
    printf(clock, and(and(and(UInt<1>("h1"), io_dmem_request_valid), _T_13), UInt<1>("h1")), "Assertion failed\n    at memory.scala:56 assert (request.operation =/= Write)\n") @[memory.scala 56:12]
    stop(clock, and(and(and(UInt<1>("h1"), io_dmem_request_valid), _T_13), UInt<1>("h1")), 1) @[memory.scala 56:12]
    printf(clock, and(and(and(UInt<1>("h1"), io_dmem_request_valid), _T_17), UInt<1>("h1")), "Assertion failed\n    at memory.scala:58 assert (request.address < size.U)\n") @[memory.scala 58:12]
    stop(clock, and(and(and(UInt<1>("h1"), io_dmem_request_valid), _T_17), UInt<1>("h1")), 1) @[memory.scala 58:12]

  module CombinMemoryTestHarness :
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
  
    inst imem of ICombinMemPort @[CombinMemoryUnitTest.scala 39:20]
    inst dmem of DCombinMemPort @[CombinMemoryUnitTest.scala 41:20]
    inst memory of DualPortedCombinMemory @[CombinMemoryUnitTest.scala 42:22]
    io_imem_instruction <= imem.io_pipeline_instruction @[CombinMemoryUnitTest.scala 48:23]
    io_imem_good <= imem.io_pipeline_good @[CombinMemoryUnitTest.scala 49:23]
    io_dmem_readdata <= dmem.io_pipeline_readdata @[CombinMemoryUnitTest.scala 57:23]
    io_dmem_good <= dmem.io_pipeline_good @[CombinMemoryUnitTest.scala 58:23]
    imem.clock <= clock
    imem.reset <= reset
    imem.io_pipeline_address <= io_imem_address @[CombinMemoryUnitTest.scala 46:32]
    imem.io_pipeline_valid <= io_imem_valid @[CombinMemoryUnitTest.scala 47:32]
    imem.io_bus_request_ready <= memory.io_imem_request_ready @[base-memory-components.scala 16:26]
    imem.io_bus_response_valid <= memory.io_imem_response_valid @[base-memory-components.scala 17:26]
    imem.io_bus_response_bits_data <= memory.io_imem_response_bits_data @[base-memory-components.scala 17:26]
    dmem.clock <= clock
    dmem.reset <= reset
    dmem.io_pipeline_address <= io_dmem_address @[CombinMemoryUnitTest.scala 50:32]
    dmem.io_pipeline_valid <= io_dmem_valid @[CombinMemoryUnitTest.scala 51:32]
    dmem.io_pipeline_writedata <= io_dmem_writedata @[CombinMemoryUnitTest.scala 52:32]
    dmem.io_pipeline_memread <= io_dmem_memread @[CombinMemoryUnitTest.scala 53:32]
    dmem.io_pipeline_memwrite <= io_dmem_memwrite @[CombinMemoryUnitTest.scala 54:32]
    dmem.io_pipeline_maskmode <= io_dmem_maskmode @[CombinMemoryUnitTest.scala 55:32]
    dmem.io_pipeline_sext <= io_dmem_sext @[CombinMemoryUnitTest.scala 56:32]
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
