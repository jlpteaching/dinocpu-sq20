circuit ALUControl :
  module ALUControl :
    input clock : Clock
    input reset : UInt<1>
    input io_aluop : UInt<2>
    input io_itype : UInt<1>
    input io_funct7 : UInt<7>
    input io_funct3 : UInt<3>
    output io_operation : UInt<4>
  
    node _T = eq(io_aluop, UInt<1>("h0")) @[alucontrol.scala 29:18]
    node _T_1 = eq(io_aluop, UInt<2>("h2")) @[alucontrol.scala 31:25]
    node _T_2 = eq(io_funct3, UInt<1>("h0")) @[alucontrol.scala 32:21]
    node _T_3 = eq(io_funct7, UInt<1>("h0")) @[alucontrol.scala 33:35]
    node _T_4 = or(io_itype, _T_3) @[alucontrol.scala 33:22]
    node _GEN_0 = mux(_T_4, UInt<2>("h2"), UInt<2>("h3")) @[alucontrol.scala 33:53]
    node _T_5 = eq(io_funct3, UInt<1>("h1")) @[alucontrol.scala 39:26]
    node _T_6 = eq(io_funct3, UInt<2>("h2")) @[alucontrol.scala 40:26]
    node _T_7 = eq(io_funct3, UInt<2>("h3")) @[alucontrol.scala 41:26]
    node _T_8 = eq(io_funct3, UInt<3>("h4")) @[alucontrol.scala 42:26]
    node _T_9 = eq(io_funct3, UInt<3>("h5")) @[alucontrol.scala 43:26]
    node _T_10 = eq(io_funct7, UInt<1>("h0")) @[alucontrol.scala 44:23]
    node _GEN_1 = mux(_T_10, UInt<3>("h7"), UInt<3>("h4")) @[alucontrol.scala 44:41]
    node _T_11 = eq(io_funct3, UInt<3>("h6")) @[alucontrol.scala 50:26]
    node _GEN_2 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[alucontrol.scala 50:40]
    node _GEN_3 = mux(_T_9, _GEN_1, _GEN_2) @[alucontrol.scala 43:40]
    node _GEN_4 = mux(_T_8, UInt<3>("h6"), _GEN_3) @[alucontrol.scala 42:40]
    node _GEN_5 = mux(_T_7, UInt<3>("h5"), _GEN_4) @[alucontrol.scala 41:40]
    node _GEN_6 = mux(_T_6, UInt<4>("h8"), _GEN_5) @[alucontrol.scala 40:40]
    node _GEN_7 = mux(_T_5, UInt<4>("h9"), _GEN_6) @[alucontrol.scala 39:40]
    node _GEN_8 = mux(_T_2, _GEN_0, _GEN_7) @[alucontrol.scala 32:35]
    node _T_12 = eq(io_aluop, UInt<1>("h1")) @[alucontrol.scala 53:25]
    node _T_13 = eq(io_funct3, UInt<1>("h0")) @[alucontrol.scala 54:21]
    node _T_14 = eq(io_funct3, UInt<1>("h1")) @[alucontrol.scala 55:26]
    node _T_15 = eq(io_funct3, UInt<3>("h4")) @[alucontrol.scala 56:26]
    node _T_16 = eq(io_funct3, UInt<3>("h5")) @[alucontrol.scala 57:26]
    node _T_17 = eq(io_funct3, UInt<3>("h6")) @[alucontrol.scala 58:26]
    node _T_18 = eq(io_funct3, UInt<3>("h7")) @[alucontrol.scala 59:26]
    node _GEN_9 = mux(_T_18, UInt<4>("hc"), UInt<4>("hf")) @[alucontrol.scala 59:40]
    node _GEN_10 = mux(_T_17, UInt<3>("h5"), _GEN_9) @[alucontrol.scala 58:40]
    node _GEN_11 = mux(_T_16, UInt<4>("hb"), _GEN_10) @[alucontrol.scala 57:40]
    node _GEN_12 = mux(_T_15, UInt<4>("h8"), _GEN_11) @[alucontrol.scala 56:40]
    node _GEN_13 = mux(_T_14, UInt<4>("he"), _GEN_12) @[alucontrol.scala 55:40]
    node _GEN_14 = mux(_T_13, UInt<4>("hd"), _GEN_13) @[alucontrol.scala 54:35]
    node _GEN_15 = mux(_T_12, _GEN_14, UInt<4>("hf")) @[alucontrol.scala 53:38]
    node _GEN_16 = mux(_T_1, _GEN_8, _GEN_15) @[alucontrol.scala 31:39]
    node _GEN_17 = mux(_T, UInt<2>("h2"), _GEN_16) @[alucontrol.scala 29:31]
    io_operation <= _GEN_17 @[alucontrol.scala 30:18 alucontrol.scala 34:22 alucontrol.scala 36:22 alucontrol.scala 39:55 alucontrol.scala 40:55 alucontrol.scala 41:55 alucontrol.scala 42:55 alucontrol.scala 45:22 alucontrol.scala 47:22 alucontrol.scala 50:55 alucontrol.scala 52:20 alucontrol.scala 54:50 alucontrol.scala 55:55 alucontrol.scala 56:55 alucontrol.scala 57:55 alucontrol.scala 58:55 alucontrol.scala 59:55 alucontrol.scala 60:31 alucontrol.scala 61:31]
