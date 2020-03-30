circuit Top :
  module Control :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_branch : UInt<1>
    output io_pcfromalu : UInt<1>
    output io_jump : UInt<1>
    output io_memread : UInt<1>
    output io_memwrite : UInt<1>
    output io_regwrite : UInt<1>
    output io_toreg : UInt<2>
    output io_alusrc : UInt<1>
    output io_pcadd : UInt<1>
    output io_itype : UInt<1>
    output io_aluop : UInt<2>
    output io_validinst : UInt<1>
  
    node _T = and(io_opcode, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_1 = eq(UInt<6>("h33"), _T) @[Lookup.scala 31:38]
    node _T_2 = and(io_opcode, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_3 = eq(UInt<5>("h13"), _T_2) @[Lookup.scala 31:38]
    node _T_4 = and(io_opcode, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_5 = eq(UInt<2>("h3"), _T_4) @[Lookup.scala 31:38]
    node _T_6 = and(io_opcode, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_7 = eq(UInt<6>("h23"), _T_6) @[Lookup.scala 31:38]
    node _T_8 = and(io_opcode, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_9 = eq(UInt<7>("h63"), _T_8) @[Lookup.scala 31:38]
    node _T_10 = and(io_opcode, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_11 = eq(UInt<6>("h37"), _T_10) @[Lookup.scala 31:38]
    node _T_12 = and(io_opcode, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_13 = eq(UInt<5>("h17"), _T_12) @[Lookup.scala 31:38]
    node _T_14 = and(io_opcode, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_15 = eq(UInt<7>("h6f"), _T_14) @[Lookup.scala 31:38]
    node _T_16 = and(io_opcode, UInt<7>("h7f")) @[Lookup.scala 31:38]
    node _T_17 = eq(UInt<7>("h67"), _T_16) @[Lookup.scala 31:38]
    node _T_18 = mux(_T_17, UInt<1>("h0"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_19 = mux(_T_15, UInt<1>("h0"), _T_18) @[Lookup.scala 33:37]
    node _T_20 = mux(_T_13, UInt<1>("h0"), _T_19) @[Lookup.scala 33:37]
    node _T_21 = mux(_T_11, UInt<1>("h0"), _T_20) @[Lookup.scala 33:37]
    node _T_22 = mux(_T_9, UInt<1>("h1"), _T_21) @[Lookup.scala 33:37]
    node _T_23 = mux(_T_7, UInt<1>("h0"), _T_22) @[Lookup.scala 33:37]
    node _T_24 = mux(_T_5, UInt<1>("h0"), _T_23) @[Lookup.scala 33:37]
    node _T_25 = mux(_T_3, UInt<1>("h0"), _T_24) @[Lookup.scala 33:37]
    node signals_0 = mux(_T_1, UInt<1>("h0"), _T_25) @[Lookup.scala 33:37]
    node _T_26 = mux(_T_17, UInt<1>("h1"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_27 = mux(_T_15, UInt<1>("h0"), _T_26) @[Lookup.scala 33:37]
    node _T_28 = mux(_T_13, UInt<1>("h0"), _T_27) @[Lookup.scala 33:37]
    node _T_29 = mux(_T_11, UInt<1>("h0"), _T_28) @[Lookup.scala 33:37]
    node _T_30 = mux(_T_9, UInt<1>("h0"), _T_29) @[Lookup.scala 33:37]
    node _T_31 = mux(_T_7, UInt<1>("h0"), _T_30) @[Lookup.scala 33:37]
    node _T_32 = mux(_T_5, UInt<1>("h0"), _T_31) @[Lookup.scala 33:37]
    node _T_33 = mux(_T_3, UInt<1>("h0"), _T_32) @[Lookup.scala 33:37]
    node signals_1 = mux(_T_1, UInt<1>("h0"), _T_33) @[Lookup.scala 33:37]
    node _T_34 = mux(_T_17, UInt<1>("h1"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_35 = mux(_T_15, UInt<1>("h1"), _T_34) @[Lookup.scala 33:37]
    node _T_36 = mux(_T_13, UInt<1>("h0"), _T_35) @[Lookup.scala 33:37]
    node _T_37 = mux(_T_11, UInt<1>("h0"), _T_36) @[Lookup.scala 33:37]
    node _T_38 = mux(_T_9, UInt<1>("h0"), _T_37) @[Lookup.scala 33:37]
    node _T_39 = mux(_T_7, UInt<1>("h0"), _T_38) @[Lookup.scala 33:37]
    node _T_40 = mux(_T_5, UInt<1>("h0"), _T_39) @[Lookup.scala 33:37]
    node _T_41 = mux(_T_3, UInt<1>("h0"), _T_40) @[Lookup.scala 33:37]
    node signals_2 = mux(_T_1, UInt<1>("h0"), _T_41) @[Lookup.scala 33:37]
    node _T_42 = mux(_T_17, UInt<1>("h0"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_43 = mux(_T_15, UInt<1>("h0"), _T_42) @[Lookup.scala 33:37]
    node _T_44 = mux(_T_13, UInt<1>("h0"), _T_43) @[Lookup.scala 33:37]
    node _T_45 = mux(_T_11, UInt<1>("h0"), _T_44) @[Lookup.scala 33:37]
    node _T_46 = mux(_T_9, UInt<1>("h0"), _T_45) @[Lookup.scala 33:37]
    node _T_47 = mux(_T_7, UInt<1>("h0"), _T_46) @[Lookup.scala 33:37]
    node _T_48 = mux(_T_5, UInt<1>("h1"), _T_47) @[Lookup.scala 33:37]
    node _T_49 = mux(_T_3, UInt<1>("h0"), _T_48) @[Lookup.scala 33:37]
    node signals_3 = mux(_T_1, UInt<1>("h0"), _T_49) @[Lookup.scala 33:37]
    node _T_50 = mux(_T_17, UInt<1>("h0"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_51 = mux(_T_15, UInt<1>("h0"), _T_50) @[Lookup.scala 33:37]
    node _T_52 = mux(_T_13, UInt<1>("h0"), _T_51) @[Lookup.scala 33:37]
    node _T_53 = mux(_T_11, UInt<1>("h0"), _T_52) @[Lookup.scala 33:37]
    node _T_54 = mux(_T_9, UInt<1>("h0"), _T_53) @[Lookup.scala 33:37]
    node _T_55 = mux(_T_7, UInt<1>("h1"), _T_54) @[Lookup.scala 33:37]
    node _T_56 = mux(_T_5, UInt<1>("h0"), _T_55) @[Lookup.scala 33:37]
    node _T_57 = mux(_T_3, UInt<1>("h0"), _T_56) @[Lookup.scala 33:37]
    node signals_4 = mux(_T_1, UInt<1>("h0"), _T_57) @[Lookup.scala 33:37]
    node _T_58 = mux(_T_17, UInt<1>("h1"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_59 = mux(_T_15, UInt<1>("h1"), _T_58) @[Lookup.scala 33:37]
    node _T_60 = mux(_T_13, UInt<1>("h1"), _T_59) @[Lookup.scala 33:37]
    node _T_61 = mux(_T_11, UInt<1>("h1"), _T_60) @[Lookup.scala 33:37]
    node _T_62 = mux(_T_9, UInt<1>("h0"), _T_61) @[Lookup.scala 33:37]
    node _T_63 = mux(_T_7, UInt<1>("h0"), _T_62) @[Lookup.scala 33:37]
    node _T_64 = mux(_T_5, UInt<1>("h1"), _T_63) @[Lookup.scala 33:37]
    node _T_65 = mux(_T_3, UInt<1>("h1"), _T_64) @[Lookup.scala 33:37]
    node signals_5 = mux(_T_1, UInt<1>("h1"), _T_65) @[Lookup.scala 33:37]
    node _T_66 = mux(_T_17, UInt<2>("h2"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_67 = mux(_T_15, UInt<2>("h2"), _T_66) @[Lookup.scala 33:37]
    node _T_68 = mux(_T_13, UInt<1>("h0"), _T_67) @[Lookup.scala 33:37]
    node _T_69 = mux(_T_11, UInt<1>("h1"), _T_68) @[Lookup.scala 33:37]
    node _T_70 = mux(_T_9, UInt<1>("h0"), _T_69) @[Lookup.scala 33:37]
    node _T_71 = mux(_T_7, UInt<1>("h0"), _T_70) @[Lookup.scala 33:37]
    node _T_72 = mux(_T_5, UInt<2>("h3"), _T_71) @[Lookup.scala 33:37]
    node _T_73 = mux(_T_3, UInt<1>("h0"), _T_72) @[Lookup.scala 33:37]
    node signals_6 = mux(_T_1, UInt<1>("h0"), _T_73) @[Lookup.scala 33:37]
    node _T_74 = mux(_T_17, UInt<1>("h1"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_75 = mux(_T_15, UInt<1>("h0"), _T_74) @[Lookup.scala 33:37]
    node _T_76 = mux(_T_13, UInt<1>("h1"), _T_75) @[Lookup.scala 33:37]
    node _T_77 = mux(_T_11, UInt<1>("h0"), _T_76) @[Lookup.scala 33:37]
    node _T_78 = mux(_T_9, UInt<1>("h0"), _T_77) @[Lookup.scala 33:37]
    node _T_79 = mux(_T_7, UInt<1>("h1"), _T_78) @[Lookup.scala 33:37]
    node _T_80 = mux(_T_5, UInt<1>("h1"), _T_79) @[Lookup.scala 33:37]
    node _T_81 = mux(_T_3, UInt<1>("h1"), _T_80) @[Lookup.scala 33:37]
    node signals_7 = mux(_T_1, UInt<1>("h0"), _T_81) @[Lookup.scala 33:37]
    node _T_82 = mux(_T_17, UInt<1>("h0"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_83 = mux(_T_15, UInt<1>("h0"), _T_82) @[Lookup.scala 33:37]
    node _T_84 = mux(_T_13, UInt<1>("h1"), _T_83) @[Lookup.scala 33:37]
    node _T_85 = mux(_T_11, UInt<1>("h0"), _T_84) @[Lookup.scala 33:37]
    node _T_86 = mux(_T_9, UInt<1>("h0"), _T_85) @[Lookup.scala 33:37]
    node _T_87 = mux(_T_7, UInt<1>("h0"), _T_86) @[Lookup.scala 33:37]
    node _T_88 = mux(_T_5, UInt<1>("h0"), _T_87) @[Lookup.scala 33:37]
    node _T_89 = mux(_T_3, UInt<1>("h0"), _T_88) @[Lookup.scala 33:37]
    node signals_8 = mux(_T_1, UInt<1>("h0"), _T_89) @[Lookup.scala 33:37]
    node _T_90 = mux(_T_17, UInt<1>("h0"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_91 = mux(_T_15, UInt<1>("h0"), _T_90) @[Lookup.scala 33:37]
    node _T_92 = mux(_T_13, UInt<1>("h0"), _T_91) @[Lookup.scala 33:37]
    node _T_93 = mux(_T_11, UInt<1>("h0"), _T_92) @[Lookup.scala 33:37]
    node _T_94 = mux(_T_9, UInt<1>("h0"), _T_93) @[Lookup.scala 33:37]
    node _T_95 = mux(_T_7, UInt<1>("h0"), _T_94) @[Lookup.scala 33:37]
    node _T_96 = mux(_T_5, UInt<1>("h0"), _T_95) @[Lookup.scala 33:37]
    node _T_97 = mux(_T_3, UInt<1>("h1"), _T_96) @[Lookup.scala 33:37]
    node signals_9 = mux(_T_1, UInt<1>("h0"), _T_97) @[Lookup.scala 33:37]
    node _T_98 = mux(_T_17, UInt<1>("h0"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_99 = mux(_T_15, UInt<1>("h0"), _T_98) @[Lookup.scala 33:37]
    node _T_100 = mux(_T_13, UInt<1>("h0"), _T_99) @[Lookup.scala 33:37]
    node _T_101 = mux(_T_11, UInt<1>("h0"), _T_100) @[Lookup.scala 33:37]
    node _T_102 = mux(_T_9, UInt<1>("h1"), _T_101) @[Lookup.scala 33:37]
    node _T_103 = mux(_T_7, UInt<1>("h0"), _T_102) @[Lookup.scala 33:37]
    node _T_104 = mux(_T_5, UInt<1>("h0"), _T_103) @[Lookup.scala 33:37]
    node _T_105 = mux(_T_3, UInt<2>("h2"), _T_104) @[Lookup.scala 33:37]
    node signals_10 = mux(_T_1, UInt<2>("h2"), _T_105) @[Lookup.scala 33:37]
    node _T_106 = mux(_T_17, UInt<1>("h1"), UInt<1>("h0")) @[Lookup.scala 33:37]
    node _T_107 = mux(_T_15, UInt<1>("h1"), _T_106) @[Lookup.scala 33:37]
    node _T_108 = mux(_T_13, UInt<1>("h1"), _T_107) @[Lookup.scala 33:37]
    node _T_109 = mux(_T_11, UInt<1>("h1"), _T_108) @[Lookup.scala 33:37]
    node _T_110 = mux(_T_9, UInt<1>("h1"), _T_109) @[Lookup.scala 33:37]
    node _T_111 = mux(_T_7, UInt<1>("h1"), _T_110) @[Lookup.scala 33:37]
    node _T_112 = mux(_T_5, UInt<1>("h1"), _T_111) @[Lookup.scala 33:37]
    node _T_113 = mux(_T_3, UInt<1>("h1"), _T_112) @[Lookup.scala 33:37]
    node signals_11 = mux(_T_1, UInt<1>("h1"), _T_113) @[Lookup.scala 33:37]
    io_branch <= signals_0 @[control.scala 73:16]
    io_pcfromalu <= signals_1 @[control.scala 74:16]
    io_jump <= signals_2 @[control.scala 75:16]
    io_memread <= signals_3 @[control.scala 76:16]
    io_memwrite <= signals_4 @[control.scala 77:16]
    io_regwrite <= signals_5 @[control.scala 78:16]
    io_toreg <= signals_6 @[control.scala 79:16]
    io_alusrc <= signals_7 @[control.scala 80:16]
    io_pcadd <= signals_8 @[control.scala 81:16]
    io_itype <= signals_9 @[control.scala 82:16]
    io_aluop <= signals_10 @[control.scala 83:16]
    io_validinst <= signals_11 @[control.scala 84:16]

  module RegisterFile :
    input clock : Clock
    input reset : UInt<1>
    input io_readreg1 : UInt<5>
    input io_readreg2 : UInt<5>
    input io_writereg : UInt<5>
    input io_writedata : UInt<32>
    input io_wen : UInt<1>
    output io_readdata1 : UInt<32>
    output io_readdata2 : UInt<32>
  
    reg regs_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_0) @[register-file.scala 49:17]
    reg regs_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_1) @[register-file.scala 49:17]
    reg regs_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_2) @[register-file.scala 49:17]
    reg regs_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_3) @[register-file.scala 49:17]
    reg regs_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_4) @[register-file.scala 49:17]
    reg regs_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_5) @[register-file.scala 49:17]
    reg regs_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_6) @[register-file.scala 49:17]
    reg regs_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_7) @[register-file.scala 49:17]
    reg regs_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_8) @[register-file.scala 49:17]
    reg regs_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_9) @[register-file.scala 49:17]
    reg regs_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_10) @[register-file.scala 49:17]
    reg regs_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_11) @[register-file.scala 49:17]
    reg regs_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_12) @[register-file.scala 49:17]
    reg regs_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_13) @[register-file.scala 49:17]
    reg regs_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_14) @[register-file.scala 49:17]
    reg regs_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_15) @[register-file.scala 49:17]
    reg regs_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_16) @[register-file.scala 49:17]
    reg regs_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_17) @[register-file.scala 49:17]
    reg regs_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_18) @[register-file.scala 49:17]
    reg regs_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_19) @[register-file.scala 49:17]
    reg regs_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_20) @[register-file.scala 49:17]
    reg regs_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_21) @[register-file.scala 49:17]
    reg regs_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_22) @[register-file.scala 49:17]
    reg regs_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_23) @[register-file.scala 49:17]
    reg regs_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_24) @[register-file.scala 49:17]
    reg regs_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_25) @[register-file.scala 49:17]
    reg regs_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_26) @[register-file.scala 49:17]
    reg regs_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_27) @[register-file.scala 49:17]
    reg regs_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_28) @[register-file.scala 49:17]
    reg regs_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_29) @[register-file.scala 49:17]
    reg regs_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_30) @[register-file.scala 49:17]
    reg regs_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_31) @[register-file.scala 49:17]
    node _regs_io_writereg = io_writedata @[register-file.scala 53:23 register-file.scala 53:23]
    node _GEN_0 = mux(eq(UInt<1>("h0"), io_writereg), _regs_io_writereg, regs_0) @[register-file.scala 53:23]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_writereg), _regs_io_writereg, regs_1) @[register-file.scala 53:23]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_writereg), _regs_io_writereg, regs_2) @[register-file.scala 53:23]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_writereg), _regs_io_writereg, regs_3) @[register-file.scala 53:23]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_writereg), _regs_io_writereg, regs_4) @[register-file.scala 53:23]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_writereg), _regs_io_writereg, regs_5) @[register-file.scala 53:23]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_writereg), _regs_io_writereg, regs_6) @[register-file.scala 53:23]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_writereg), _regs_io_writereg, regs_7) @[register-file.scala 53:23]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_writereg), _regs_io_writereg, regs_8) @[register-file.scala 53:23]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_writereg), _regs_io_writereg, regs_9) @[register-file.scala 53:23]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_writereg), _regs_io_writereg, regs_10) @[register-file.scala 53:23]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_writereg), _regs_io_writereg, regs_11) @[register-file.scala 53:23]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_writereg), _regs_io_writereg, regs_12) @[register-file.scala 53:23]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_writereg), _regs_io_writereg, regs_13) @[register-file.scala 53:23]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_writereg), _regs_io_writereg, regs_14) @[register-file.scala 53:23]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_writereg), _regs_io_writereg, regs_15) @[register-file.scala 53:23]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_writereg), _regs_io_writereg, regs_16) @[register-file.scala 53:23]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_writereg), _regs_io_writereg, regs_17) @[register-file.scala 53:23]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_writereg), _regs_io_writereg, regs_18) @[register-file.scala 53:23]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_writereg), _regs_io_writereg, regs_19) @[register-file.scala 53:23]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_writereg), _regs_io_writereg, regs_20) @[register-file.scala 53:23]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_writereg), _regs_io_writereg, regs_21) @[register-file.scala 53:23]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_writereg), _regs_io_writereg, regs_22) @[register-file.scala 53:23]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_writereg), _regs_io_writereg, regs_23) @[register-file.scala 53:23]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_writereg), _regs_io_writereg, regs_24) @[register-file.scala 53:23]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_writereg), _regs_io_writereg, regs_25) @[register-file.scala 53:23]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_writereg), _regs_io_writereg, regs_26) @[register-file.scala 53:23]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_writereg), _regs_io_writereg, regs_27) @[register-file.scala 53:23]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_writereg), _regs_io_writereg, regs_28) @[register-file.scala 53:23]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_writereg), _regs_io_writereg, regs_29) @[register-file.scala 53:23]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_writereg), _regs_io_writereg, regs_30) @[register-file.scala 53:23]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_writereg), _regs_io_writereg, regs_31) @[register-file.scala 53:23]
    node _GEN_32 = mux(io_wen, _GEN_0, regs_0) @[register-file.scala 52:17]
    node _GEN_33 = mux(io_wen, _GEN_1, regs_1) @[register-file.scala 52:17]
    node _GEN_34 = mux(io_wen, _GEN_2, regs_2) @[register-file.scala 52:17]
    node _GEN_35 = mux(io_wen, _GEN_3, regs_3) @[register-file.scala 52:17]
    node _GEN_36 = mux(io_wen, _GEN_4, regs_4) @[register-file.scala 52:17]
    node _GEN_37 = mux(io_wen, _GEN_5, regs_5) @[register-file.scala 52:17]
    node _GEN_38 = mux(io_wen, _GEN_6, regs_6) @[register-file.scala 52:17]
    node _GEN_39 = mux(io_wen, _GEN_7, regs_7) @[register-file.scala 52:17]
    node _GEN_40 = mux(io_wen, _GEN_8, regs_8) @[register-file.scala 52:17]
    node _GEN_41 = mux(io_wen, _GEN_9, regs_9) @[register-file.scala 52:17]
    node _GEN_42 = mux(io_wen, _GEN_10, regs_10) @[register-file.scala 52:17]
    node _GEN_43 = mux(io_wen, _GEN_11, regs_11) @[register-file.scala 52:17]
    node _GEN_44 = mux(io_wen, _GEN_12, regs_12) @[register-file.scala 52:17]
    node _GEN_45 = mux(io_wen, _GEN_13, regs_13) @[register-file.scala 52:17]
    node _GEN_46 = mux(io_wen, _GEN_14, regs_14) @[register-file.scala 52:17]
    node _GEN_47 = mux(io_wen, _GEN_15, regs_15) @[register-file.scala 52:17]
    node _GEN_48 = mux(io_wen, _GEN_16, regs_16) @[register-file.scala 52:17]
    node _GEN_49 = mux(io_wen, _GEN_17, regs_17) @[register-file.scala 52:17]
    node _GEN_50 = mux(io_wen, _GEN_18, regs_18) @[register-file.scala 52:17]
    node _GEN_51 = mux(io_wen, _GEN_19, regs_19) @[register-file.scala 52:17]
    node _GEN_52 = mux(io_wen, _GEN_20, regs_20) @[register-file.scala 52:17]
    node _GEN_53 = mux(io_wen, _GEN_21, regs_21) @[register-file.scala 52:17]
    node _GEN_54 = mux(io_wen, _GEN_22, regs_22) @[register-file.scala 52:17]
    node _GEN_55 = mux(io_wen, _GEN_23, regs_23) @[register-file.scala 52:17]
    node _GEN_56 = mux(io_wen, _GEN_24, regs_24) @[register-file.scala 52:17]
    node _GEN_57 = mux(io_wen, _GEN_25, regs_25) @[register-file.scala 52:17]
    node _GEN_58 = mux(io_wen, _GEN_26, regs_26) @[register-file.scala 52:17]
    node _GEN_59 = mux(io_wen, _GEN_27, regs_27) @[register-file.scala 52:17]
    node _GEN_60 = mux(io_wen, _GEN_28, regs_28) @[register-file.scala 52:17]
    node _GEN_61 = mux(io_wen, _GEN_29, regs_29) @[register-file.scala 52:17]
    node _GEN_62 = mux(io_wen, _GEN_30, regs_30) @[register-file.scala 52:17]
    node _GEN_63 = mux(io_wen, _GEN_31, regs_31) @[register-file.scala 52:17]
    node _GEN_64 = validif(eq(UInt<1>("h0"), io_readreg1), regs_0) @[register-file.scala 58:16]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_readreg1), regs_1, _GEN_64) @[register-file.scala 58:16]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_readreg1), regs_2, _GEN_65) @[register-file.scala 58:16]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_readreg1), regs_3, _GEN_66) @[register-file.scala 58:16]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_readreg1), regs_4, _GEN_67) @[register-file.scala 58:16]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_readreg1), regs_5, _GEN_68) @[register-file.scala 58:16]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_readreg1), regs_6, _GEN_69) @[register-file.scala 58:16]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_readreg1), regs_7, _GEN_70) @[register-file.scala 58:16]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_readreg1), regs_8, _GEN_71) @[register-file.scala 58:16]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_readreg1), regs_9, _GEN_72) @[register-file.scala 58:16]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_readreg1), regs_10, _GEN_73) @[register-file.scala 58:16]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_readreg1), regs_11, _GEN_74) @[register-file.scala 58:16]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_readreg1), regs_12, _GEN_75) @[register-file.scala 58:16]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_readreg1), regs_13, _GEN_76) @[register-file.scala 58:16]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_readreg1), regs_14, _GEN_77) @[register-file.scala 58:16]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_readreg1), regs_15, _GEN_78) @[register-file.scala 58:16]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_readreg1), regs_16, _GEN_79) @[register-file.scala 58:16]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_readreg1), regs_17, _GEN_80) @[register-file.scala 58:16]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_readreg1), regs_18, _GEN_81) @[register-file.scala 58:16]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_readreg1), regs_19, _GEN_82) @[register-file.scala 58:16]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_readreg1), regs_20, _GEN_83) @[register-file.scala 58:16]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_readreg1), regs_21, _GEN_84) @[register-file.scala 58:16]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_readreg1), regs_22, _GEN_85) @[register-file.scala 58:16]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_readreg1), regs_23, _GEN_86) @[register-file.scala 58:16]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_readreg1), regs_24, _GEN_87) @[register-file.scala 58:16]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_readreg1), regs_25, _GEN_88) @[register-file.scala 58:16]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_readreg1), regs_26, _GEN_89) @[register-file.scala 58:16]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_readreg1), regs_27, _GEN_90) @[register-file.scala 58:16]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_readreg1), regs_28, _GEN_91) @[register-file.scala 58:16]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_readreg1), regs_29, _GEN_92) @[register-file.scala 58:16]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_readreg1), regs_30, _GEN_93) @[register-file.scala 58:16]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_readreg1), regs_31, _GEN_94) @[register-file.scala 58:16]
    node _GEN_96 = validif(eq(UInt<1>("h0"), io_readreg2), regs_0) @[register-file.scala 59:16]
    node _GEN_97 = mux(eq(UInt<1>("h1"), io_readreg2), regs_1, _GEN_96) @[register-file.scala 59:16]
    node _GEN_98 = mux(eq(UInt<2>("h2"), io_readreg2), regs_2, _GEN_97) @[register-file.scala 59:16]
    node _GEN_99 = mux(eq(UInt<2>("h3"), io_readreg2), regs_3, _GEN_98) @[register-file.scala 59:16]
    node _GEN_100 = mux(eq(UInt<3>("h4"), io_readreg2), regs_4, _GEN_99) @[register-file.scala 59:16]
    node _GEN_101 = mux(eq(UInt<3>("h5"), io_readreg2), regs_5, _GEN_100) @[register-file.scala 59:16]
    node _GEN_102 = mux(eq(UInt<3>("h6"), io_readreg2), regs_6, _GEN_101) @[register-file.scala 59:16]
    node _GEN_103 = mux(eq(UInt<3>("h7"), io_readreg2), regs_7, _GEN_102) @[register-file.scala 59:16]
    node _GEN_104 = mux(eq(UInt<4>("h8"), io_readreg2), regs_8, _GEN_103) @[register-file.scala 59:16]
    node _GEN_105 = mux(eq(UInt<4>("h9"), io_readreg2), regs_9, _GEN_104) @[register-file.scala 59:16]
    node _GEN_106 = mux(eq(UInt<4>("ha"), io_readreg2), regs_10, _GEN_105) @[register-file.scala 59:16]
    node _GEN_107 = mux(eq(UInt<4>("hb"), io_readreg2), regs_11, _GEN_106) @[register-file.scala 59:16]
    node _GEN_108 = mux(eq(UInt<4>("hc"), io_readreg2), regs_12, _GEN_107) @[register-file.scala 59:16]
    node _GEN_109 = mux(eq(UInt<4>("hd"), io_readreg2), regs_13, _GEN_108) @[register-file.scala 59:16]
    node _GEN_110 = mux(eq(UInt<4>("he"), io_readreg2), regs_14, _GEN_109) @[register-file.scala 59:16]
    node _GEN_111 = mux(eq(UInt<4>("hf"), io_readreg2), regs_15, _GEN_110) @[register-file.scala 59:16]
    node _GEN_112 = mux(eq(UInt<5>("h10"), io_readreg2), regs_16, _GEN_111) @[register-file.scala 59:16]
    node _GEN_113 = mux(eq(UInt<5>("h11"), io_readreg2), regs_17, _GEN_112) @[register-file.scala 59:16]
    node _GEN_114 = mux(eq(UInt<5>("h12"), io_readreg2), regs_18, _GEN_113) @[register-file.scala 59:16]
    node _GEN_115 = mux(eq(UInt<5>("h13"), io_readreg2), regs_19, _GEN_114) @[register-file.scala 59:16]
    node _GEN_116 = mux(eq(UInt<5>("h14"), io_readreg2), regs_20, _GEN_115) @[register-file.scala 59:16]
    node _GEN_117 = mux(eq(UInt<5>("h15"), io_readreg2), regs_21, _GEN_116) @[register-file.scala 59:16]
    node _GEN_118 = mux(eq(UInt<5>("h16"), io_readreg2), regs_22, _GEN_117) @[register-file.scala 59:16]
    node _GEN_119 = mux(eq(UInt<5>("h17"), io_readreg2), regs_23, _GEN_118) @[register-file.scala 59:16]
    node _GEN_120 = mux(eq(UInt<5>("h18"), io_readreg2), regs_24, _GEN_119) @[register-file.scala 59:16]
    node _GEN_121 = mux(eq(UInt<5>("h19"), io_readreg2), regs_25, _GEN_120) @[register-file.scala 59:16]
    node _GEN_122 = mux(eq(UInt<5>("h1a"), io_readreg2), regs_26, _GEN_121) @[register-file.scala 59:16]
    node _GEN_123 = mux(eq(UInt<5>("h1b"), io_readreg2), regs_27, _GEN_122) @[register-file.scala 59:16]
    node _GEN_124 = mux(eq(UInt<5>("h1c"), io_readreg2), regs_28, _GEN_123) @[register-file.scala 59:16]
    node _GEN_125 = mux(eq(UInt<5>("h1d"), io_readreg2), regs_29, _GEN_124) @[register-file.scala 59:16]
    node _GEN_126 = mux(eq(UInt<5>("h1e"), io_readreg2), regs_30, _GEN_125) @[register-file.scala 59:16]
    node _GEN_127 = mux(eq(UInt<5>("h1f"), io_readreg2), regs_31, _GEN_126) @[register-file.scala 59:16]
    node _T = eq(io_readreg1, io_writereg) @[register-file.scala 63:23]
    node _T_1 = and(_T, io_wen) @[register-file.scala 63:39]
    node _T_2 = eq(io_readreg2, io_writereg) @[register-file.scala 65:30]
    node _T_3 = and(_T_2, io_wen) @[register-file.scala 65:46]
    node _regs_io_readreg2 = _GEN_127 @[register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16 register-file.scala 59:16]
    node _GEN_128 = mux(_T_3, io_writedata, _regs_io_readreg2) @[register-file.scala 65:57]
    node _regs_io_readreg1 = _GEN_95 @[register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16 register-file.scala 58:16]
    node _GEN_129 = mux(_T_1, io_writedata, _regs_io_readreg1) @[register-file.scala 63:50]
    node _GEN_130 = mux(_T_1, _regs_io_readreg2, _GEN_128) @[register-file.scala 63:50]
    io_readdata1 <= _GEN_129 @[register-file.scala 58:16 register-file.scala 64:20]
    io_readdata2 <= _GEN_130 @[register-file.scala 59:16 register-file.scala 66:20]
    regs_0 <= _GEN_32 @[register-file.scala 53:23]
    regs_1 <= _GEN_33 @[register-file.scala 53:23]
    regs_2 <= _GEN_34 @[register-file.scala 53:23]
    regs_3 <= _GEN_35 @[register-file.scala 53:23]
    regs_4 <= _GEN_36 @[register-file.scala 53:23]
    regs_5 <= _GEN_37 @[register-file.scala 53:23]
    regs_6 <= _GEN_38 @[register-file.scala 53:23]
    regs_7 <= _GEN_39 @[register-file.scala 53:23]
    regs_8 <= _GEN_40 @[register-file.scala 53:23]
    regs_9 <= _GEN_41 @[register-file.scala 53:23]
    regs_10 <= _GEN_42 @[register-file.scala 53:23]
    regs_11 <= _GEN_43 @[register-file.scala 53:23]
    regs_12 <= _GEN_44 @[register-file.scala 53:23]
    regs_13 <= _GEN_45 @[register-file.scala 53:23]
    regs_14 <= _GEN_46 @[register-file.scala 53:23]
    regs_15 <= _GEN_47 @[register-file.scala 53:23]
    regs_16 <= _GEN_48 @[register-file.scala 53:23]
    regs_17 <= _GEN_49 @[register-file.scala 53:23]
    regs_18 <= _GEN_50 @[register-file.scala 53:23]
    regs_19 <= _GEN_51 @[register-file.scala 53:23]
    regs_20 <= _GEN_52 @[register-file.scala 53:23]
    regs_21 <= _GEN_53 @[register-file.scala 53:23]
    regs_22 <= _GEN_54 @[register-file.scala 53:23]
    regs_23 <= _GEN_55 @[register-file.scala 53:23]
    regs_24 <= _GEN_56 @[register-file.scala 53:23]
    regs_25 <= _GEN_57 @[register-file.scala 53:23]
    regs_26 <= _GEN_58 @[register-file.scala 53:23]
    regs_27 <= _GEN_59 @[register-file.scala 53:23]
    regs_28 <= _GEN_60 @[register-file.scala 53:23]
    regs_29 <= _GEN_61 @[register-file.scala 53:23]
    regs_30 <= _GEN_62 @[register-file.scala 53:23]
    regs_31 <= _GEN_63 @[register-file.scala 53:23]

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

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_operation : UInt<4>
    input io_inputx : UInt<32>
    input io_inputy : UInt<32>
    output io_result : UInt<32>
  
    node _T = eq(io_operation, UInt<1>("h0")) @[alu.scala 25:22]
    node _T_1 = and(io_inputx, io_inputy) @[alu.scala 26:28]
    node _T_2 = eq(io_operation, UInt<1>("h1")) @[alu.scala 28:27]
    node _T_3 = or(io_inputx, io_inputy) @[alu.scala 29:28]
    node _T_4 = eq(io_operation, UInt<2>("h2")) @[alu.scala 31:27]
    node _T_5 = add(io_inputx, io_inputy) @[alu.scala 32:28]
    node _T_6 = tail(_T_5, 1) @[alu.scala 32:28]
    node _T_7 = eq(io_operation, UInt<2>("h3")) @[alu.scala 34:27]
    node _T_8 = sub(io_inputx, io_inputy) @[alu.scala 35:28]
    node _T_9 = tail(_T_8, 1) @[alu.scala 35:28]
    node _T_10 = eq(io_operation, UInt<3>("h4")) @[alu.scala 37:27]
    node _T_11 = asSInt(io_inputx) @[alu.scala 38:29]
    node _T_12 = bits(io_inputy, 4, 0) @[alu.scala 38:48]
    node _T_13 = dshr(_T_11, _T_12) @[alu.scala 38:36]
    node _T_14 = asUInt(_T_13) @[alu.scala 38:55]
    node _T_15 = eq(io_operation, UInt<3>("h5")) @[alu.scala 40:27]
    node _T_16 = lt(io_inputx, io_inputy) @[alu.scala 41:29]
    node _T_17 = eq(io_operation, UInt<3>("h6")) @[alu.scala 43:27]
    node _T_18 = xor(io_inputx, io_inputy) @[alu.scala 44:28]
    node _T_19 = eq(io_operation, UInt<3>("h7")) @[alu.scala 46:27]
    node _T_20 = bits(io_inputy, 4, 0) @[alu.scala 47:40]
    node _T_21 = dshr(io_inputx, _T_20) @[alu.scala 47:28]
    node _T_22 = eq(io_operation, UInt<4>("h8")) @[alu.scala 49:27]
    node _T_23 = asSInt(io_inputx) @[alu.scala 50:29]
    node _T_24 = asSInt(io_inputy) @[alu.scala 50:48]
    node _T_25 = lt(_T_23, _T_24) @[alu.scala 50:36]
    node _T_26 = eq(io_operation, UInt<4>("h9")) @[alu.scala 52:27]
    node _T_27 = bits(io_inputy, 4, 0) @[alu.scala 53:40]
    node _T_28 = dshl(io_inputx, _T_27) @[alu.scala 53:28]
    node _T_29 = eq(io_operation, UInt<4>("ha")) @[alu.scala 55:27]
    node _T_30 = or(io_inputx, io_inputy) @[alu.scala 56:30]
    node _T_31 = not(_T_30) @[alu.scala 56:18]
    node _T_32 = eq(io_operation, UInt<4>("hb")) @[alu.scala 58:27]
    node _T_33 = asSInt(io_inputx) @[alu.scala 59:29]
    node _T_34 = asSInt(io_inputy) @[alu.scala 59:49]
    node _T_35 = geq(_T_33, _T_34) @[alu.scala 59:36]
    node _T_36 = eq(io_operation, UInt<4>("hc")) @[alu.scala 61:27]
    node _T_37 = geq(io_inputx, io_inputy) @[alu.scala 62:29]
    node _T_38 = eq(io_operation, UInt<4>("hd")) @[alu.scala 64:27]
    node _T_39 = eq(io_inputx, io_inputy) @[alu.scala 65:28]
    node _T_40 = eq(io_operation, UInt<4>("he")) @[alu.scala 67:27]
    node _T_41 = neq(io_inputx, io_inputy) @[alu.scala 68:28]
    node _GEN_0 = mux(_T_40, _T_41, UInt<1>("h0")) @[alu.scala 67:42]
    node _GEN_1 = mux(_T_38, _T_39, _GEN_0) @[alu.scala 64:42]
    node _GEN_2 = mux(_T_36, _T_37, _GEN_1) @[alu.scala 61:42]
    node _GEN_3 = mux(_T_32, _T_35, _GEN_2) @[alu.scala 58:42]
    node _GEN_4 = mux(_T_29, _T_31, _GEN_3) @[alu.scala 55:42]
    node _GEN_5 = mux(_T_26, _T_28, _GEN_4) @[alu.scala 52:42]
    node _GEN_6 = mux(_T_22, _T_25, _GEN_5) @[alu.scala 49:42]
    node _GEN_7 = mux(_T_19, _T_21, _GEN_6) @[alu.scala 46:42]
    node _GEN_8 = mux(_T_17, _T_18, _GEN_7) @[alu.scala 43:42]
    node _GEN_9 = mux(_T_15, _T_16, _GEN_8) @[alu.scala 40:42]
    node _GEN_10 = mux(_T_10, _T_14, _GEN_9) @[alu.scala 37:42]
    node _GEN_11 = mux(_T_7, _T_9, _GEN_10) @[alu.scala 34:42]
    node _GEN_12 = mux(_T_4, _T_6, _GEN_11) @[alu.scala 31:42]
    node _GEN_13 = mux(_T_2, _T_3, _GEN_12) @[alu.scala 28:42]
    node _GEN_14 = mux(_T, _T_1, _GEN_13) @[alu.scala 25:37]
    io_result <= bits(_GEN_14, 31, 0) @[alu.scala 26:15 alu.scala 29:15 alu.scala 32:15 alu.scala 35:15 alu.scala 38:15 alu.scala 41:15 alu.scala 44:15 alu.scala 47:15 alu.scala 50:15 alu.scala 53:15 alu.scala 56:15 alu.scala 59:15 alu.scala 62:15 alu.scala 65:15 alu.scala 68:15 alu.scala 71:15]

  module ImmediateGenerator :
    input clock : Clock
    input reset : UInt<1>
    input io_instruction : UInt<32>
    output io_sextImm : UInt<32>
  
    node opcode = bits(io_instruction, 6, 0) @[helpers.scala 44:30]
    node _T = eq(UInt<6>("h37"), opcode) @[Conditional.scala 37:30]
    node _T_1 = bits(io_instruction, 31, 12) @[helpers.scala 47:31]
    node _T_2 = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 71:12]
    node _T_3 = cat(_T_1, _T_2) @[Cat.scala 29:58]
    node _T_4 = eq(UInt<5>("h17"), opcode) @[Conditional.scala 37:30]
    node _T_5 = bits(io_instruction, 31, 12) @[helpers.scala 51:31]
    node _T_6 = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 71:12]
    node _T_7 = cat(_T_5, _T_6) @[Cat.scala 29:58]
    node _T_8 = eq(UInt<7>("h6f"), opcode) @[Conditional.scala 37:30]
    node _T_9 = bits(io_instruction, 31, 31) @[helpers.scala 55:35]
    node _T_10 = bits(io_instruction, 19, 12) @[helpers.scala 55:55]
    node _T_11 = bits(io_instruction, 20, 20) @[helpers.scala 56:35]
    node _T_12 = bits(io_instruction, 30, 21) @[helpers.scala 56:55]
    node _T_13 = cat(_T_11, _T_12) @[Cat.scala 29:58]
    node _T_14 = cat(_T_9, _T_10) @[Cat.scala 29:58]
    node _T_15 = cat(_T_14, _T_13) @[Cat.scala 29:58]
    node _T_16 = bits(_T_15, 19, 19) @[helpers.scala 57:36]
    node _T_17 = bits(_T_16, 0, 0) @[Bitwise.scala 71:15]
    node _T_18 = mux(_T_17, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 71:12]
    node _T_19 = cat(_T_18, _T_15) @[Cat.scala 29:58]
    node _T_20 = cat(_T_19, UInt<1>("h0")) @[Cat.scala 29:58]
    node _T_21 = eq(UInt<7>("h67"), opcode) @[Conditional.scala 37:30]
    node _T_22 = bits(io_instruction, 31, 20) @[helpers.scala 60:31]
    node _T_23 = bits(_T_22, 11, 11) @[helpers.scala 61:36]
    node _T_24 = bits(_T_23, 0, 0) @[Bitwise.scala 71:15]
    node _T_25 = mux(_T_24, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 71:12]
    node _T_26 = cat(_T_25, _T_22) @[Cat.scala 29:58]
    node _T_27 = eq(UInt<7>("h63"), opcode) @[Conditional.scala 37:30]
    node _T_28 = bits(io_instruction, 31, 31) @[helpers.scala 64:35]
    node _T_29 = bits(io_instruction, 7, 7) @[helpers.scala 64:55]
    node _T_30 = bits(io_instruction, 30, 25) @[helpers.scala 65:35]
    node _T_31 = bits(io_instruction, 11, 8) @[helpers.scala 65:58]
    node _T_32 = cat(_T_30, _T_31) @[Cat.scala 29:58]
    node _T_33 = cat(_T_28, _T_29) @[Cat.scala 29:58]
    node _T_34 = cat(_T_33, _T_32) @[Cat.scala 29:58]
    node _T_35 = bits(_T_34, 11, 11) @[helpers.scala 66:37]
    node _T_36 = bits(_T_35, 0, 0) @[Bitwise.scala 71:15]
    node _T_37 = mux(_T_36, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 71:12]
    node _T_38 = cat(_T_37, _T_34) @[Cat.scala 29:58]
    node _T_39 = cat(_T_38, UInt<1>("h0")) @[Cat.scala 29:58]
    node _T_40 = eq(UInt<2>("h3"), opcode) @[Conditional.scala 37:30]
    node _T_41 = bits(io_instruction, 31, 20) @[helpers.scala 69:31]
    node _T_42 = bits(_T_41, 11, 11) @[helpers.scala 70:36]
    node _T_43 = bits(_T_42, 0, 0) @[Bitwise.scala 71:15]
    node _T_44 = mux(_T_43, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 71:12]
    node _T_45 = cat(_T_44, _T_41) @[Cat.scala 29:58]
    node _T_46 = eq(UInt<6>("h23"), opcode) @[Conditional.scala 37:30]
    node _T_47 = bits(io_instruction, 31, 25) @[helpers.scala 73:35]
    node _T_48 = bits(io_instruction, 11, 7) @[helpers.scala 73:59]
    node _T_49 = cat(_T_47, _T_48) @[Cat.scala 29:58]
    node _T_50 = bits(_T_49, 11, 11) @[helpers.scala 74:36]
    node _T_51 = bits(_T_50, 0, 0) @[Bitwise.scala 71:15]
    node _T_52 = mux(_T_51, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 71:12]
    node _T_53 = cat(_T_52, _T_49) @[Cat.scala 29:58]
    node _T_54 = eq(UInt<5>("h13"), opcode) @[Conditional.scala 37:30]
    node _T_55 = bits(io_instruction, 31, 20) @[helpers.scala 77:31]
    node _T_56 = bits(_T_55, 11, 11) @[helpers.scala 78:36]
    node _T_57 = bits(_T_56, 0, 0) @[Bitwise.scala 71:15]
    node _T_58 = mux(_T_57, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 71:12]
    node _T_59 = cat(_T_58, _T_55) @[Cat.scala 29:58]
    node _T_60 = eq(UInt<7>("h73"), opcode) @[Conditional.scala 37:30]
    node _T_61 = mux(UInt<1>("h0"), UInt<27>("h7ffffff"), UInt<27>("h0")) @[Bitwise.scala 71:12]
    node _T_62 = bits(io_instruction, 19, 15) @[helpers.scala 81:53]
    node _T_63 = cat(_T_61, _T_62) @[Cat.scala 29:58]
    node _GEN_0 = mux(_T_60, _T_63, UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_1 = mux(_T_54, _T_59, _GEN_0) @[Conditional.scala 39:67]
    node _GEN_2 = mux(_T_46, _T_53, _GEN_1) @[Conditional.scala 39:67]
    node _GEN_3 = mux(_T_40, _T_45, _GEN_2) @[Conditional.scala 39:67]
    node _GEN_4 = mux(_T_27, _T_39, _GEN_3) @[Conditional.scala 39:67]
    node _GEN_5 = mux(_T_21, _T_26, _GEN_4) @[Conditional.scala 39:67]
    node _GEN_6 = mux(_T_8, _T_20, _GEN_5) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_4, _T_7, _GEN_6) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T, _T_3, _GEN_7) @[Conditional.scala 40:58]
    io_sextImm <= _GEN_8 @[helpers.scala 42:14 helpers.scala 48:18 helpers.scala 52:18 helpers.scala 57:18 helpers.scala 61:18 helpers.scala 66:18 helpers.scala 70:18 helpers.scala 74:18 helpers.scala 78:18 helpers.scala 81:18]

  module Adder :
    input clock : Clock
    input reset : UInt<1>
    input io_inputx : UInt<32>
    input io_inputy : UInt<32>
    output io_result : UInt<32>
  
    node _T = add(io_inputx, io_inputy) @[helpers.scala 23:26]
    node _T_1 = tail(_T, 1) @[helpers.scala 23:26]
    io_result <= _T_1 @[helpers.scala 23:13]

  module ForwardingUnit :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1 : UInt<5>
    input io_rs2 : UInt<5>
    input io_exmemrd : UInt<5>
    input io_exmemrw : UInt<1>
    input io_exmembypass : UInt<1>
    input io_memwbrd : UInt<5>
    input io_memwbrw : UInt<1>
    output io_forwardA : UInt<2>
    output io_forwardB : UInt<2>
  
    node _T = eq(io_rs1, io_exmemrd) @[forwarding.scala 40:34]
    node _T_1 = and(io_exmembypass, _T) @[forwarding.scala 40:24]
    node _T_2 = neq(io_exmemrd, UInt<1>("h0")) @[forwarding.scala 40:64]
    node _T_3 = and(_T_1, _T_2) @[forwarding.scala 40:50]
    node _T_4 = eq(io_rs1, io_exmemrd) @[forwarding.scala 42:38]
    node _T_5 = and(io_exmemrw, _T_4) @[forwarding.scala 42:28]
    node _T_6 = neq(io_exmemrd, UInt<1>("h0")) @[forwarding.scala 42:68]
    node _T_7 = and(_T_5, _T_6) @[forwarding.scala 42:54]
    node _T_8 = eq(io_rs1, io_memwbrd) @[forwarding.scala 44:37]
    node _T_9 = and(io_memwbrw, _T_8) @[forwarding.scala 44:27]
    node _T_10 = neq(io_memwbrd, UInt<1>("h0")) @[forwarding.scala 44:67]
    node _T_11 = and(_T_9, _T_10) @[forwarding.scala 44:53]
    node _GEN_0 = mux(_T_11, UInt<2>("h2"), UInt<1>("h0")) @[forwarding.scala 44:78]
    node _GEN_1 = mux(_T_7, UInt<1>("h1"), _GEN_0) @[forwarding.scala 42:79]
    node _GEN_2 = mux(_T_3, UInt<2>("h3"), _GEN_1) @[forwarding.scala 40:75]
    node _T_12 = eq(io_rs2, io_exmemrd) @[forwarding.scala 50:34]
    node _T_13 = and(io_exmembypass, _T_12) @[forwarding.scala 50:24]
    node _T_14 = neq(io_exmemrd, UInt<1>("h0")) @[forwarding.scala 50:64]
    node _T_15 = and(_T_13, _T_14) @[forwarding.scala 50:50]
    node _T_16 = eq(io_rs2, io_exmemrd) @[forwarding.scala 52:38]
    node _T_17 = and(io_exmemrw, _T_16) @[forwarding.scala 52:28]
    node _T_18 = neq(io_exmemrd, UInt<1>("h0")) @[forwarding.scala 52:68]
    node _T_19 = and(_T_17, _T_18) @[forwarding.scala 52:54]
    node _T_20 = eq(io_rs2, io_memwbrd) @[forwarding.scala 54:37]
    node _T_21 = and(io_memwbrw, _T_20) @[forwarding.scala 54:27]
    node _T_22 = neq(io_memwbrd, UInt<1>("h0")) @[forwarding.scala 54:67]
    node _T_23 = and(_T_21, _T_22) @[forwarding.scala 54:53]
    node _GEN_3 = mux(_T_23, UInt<2>("h2"), UInt<1>("h0")) @[forwarding.scala 54:79]
    node _GEN_4 = mux(_T_19, UInt<1>("h1"), _GEN_3) @[forwarding.scala 52:79]
    node _GEN_5 = mux(_T_15, UInt<2>("h3"), _GEN_4) @[forwarding.scala 50:75]
    io_forwardA <= _GEN_2 @[forwarding.scala 41:17 forwarding.scala 43:17 forwarding.scala 45:17 forwarding.scala 47:17]
    io_forwardB <= _GEN_5 @[forwarding.scala 51:17 forwarding.scala 53:17 forwarding.scala 55:17 forwarding.scala 57:17]

  module HazardUnit :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1 : UInt<5>
    input io_rs2 : UInt<5>
    input io_idex_memread : UInt<1>
    input io_idex_rd : UInt<5>
    input io_exmem_taken : UInt<1>
    output io_pcfromtaken : UInt<1>
    output io_pcstall : UInt<1>
    output io_if_id_stall : UInt<1>
    output io_id_ex_flush : UInt<1>
    output io_ex_mem_flush : UInt<1>
    output io_if_id_flush : UInt<1>
  
    node _T = eq(io_idex_rd, io_rs1) @[hazard.scala 52:21]
    node _T_1 = eq(io_idex_rd, io_rs2) @[hazard.scala 52:46]
    node _T_2 = or(_T, _T_1) @[hazard.scala 52:32]
    node _T_3 = and(io_idex_memread, _T_2) @[hazard.scala 51:25]
    node _GEN_0 = mux(_T_3, UInt<1>("h0"), UInt<1>("h0")) @[hazard.scala 52:59]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[hazard.scala 52:59]
    node _GEN_2 = mux(io_exmem_taken, UInt<1>("h1"), _GEN_0) @[hazard.scala 60:25]
    node _GEN_3 = mux(io_exmem_taken, UInt<1>("h0"), _GEN_1) @[hazard.scala 60:25]
    node _GEN_4 = mux(io_exmem_taken, UInt<1>("h1"), UInt<1>("h0")) @[hazard.scala 60:25]
    node _GEN_5 = mux(io_exmem_taken, UInt<1>("h1"), _GEN_1) @[hazard.scala 60:25]
    io_pcfromtaken <= _GEN_2 @[hazard.scala 43:19 hazard.scala 53:20 hazard.scala 61:21]
    io_pcstall <= _GEN_3 @[hazard.scala 44:19 hazard.scala 54:20 hazard.scala 62:21]
    io_if_id_stall <= _GEN_1 @[hazard.scala 45:19 hazard.scala 55:20]
    io_id_ex_flush <= _GEN_5 @[hazard.scala 46:19 hazard.scala 56:20 hazard.scala 64:21]
    io_ex_mem_flush <= _GEN_4 @[hazard.scala 47:19 hazard.scala 65:21]
    io_if_id_flush <= _GEN_4 @[hazard.scala 48:19 hazard.scala 63:21]

  module StageReg :
    input clock : Clock
    input reset : UInt<1>
    input io_in_instruction : UInt<32>
    input io_in_pc : UInt<32>
    input io_in_pcplusfour : UInt<32>
    input io_flush : UInt<1>
    input io_valid : UInt<1>
    output io_data_instruction : UInt<32>
    output io_data_pc : UInt<32>
    output io_data_pcplusfour : UInt<32>
  
    reg reg_instruction : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_instruction) @[stage-register.scala 43:21]
    reg reg_pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_pc) @[stage-register.scala 43:21]
    reg reg_pcplusfour : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_pcplusfour) @[stage-register.scala 43:21]
    node _GEN_0 = mux(io_valid, io_in_pcplusfour, reg_pcplusfour) @[stage-register.scala 47:19]
    node _GEN_1 = mux(io_valid, io_in_pc, reg_pc) @[stage-register.scala 47:19]
    node _GEN_2 = mux(io_valid, io_in_instruction, reg_instruction) @[stage-register.scala 47:19]
    node _T_1_pcplusfour = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_3 = mux(io_flush, _T_1_pcplusfour, _GEN_0) @[stage-register.scala 51:19]
    node _T_1_pc = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_4 = mux(io_flush, _T_1_pc, _GEN_1) @[stage-register.scala 51:19]
    node _T_1_instruction = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_5 = mux(io_flush, _T_1_instruction, _GEN_2) @[stage-register.scala 51:19]
    node _T_instruction = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_pc = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_pcplusfour = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    io_data_instruction <= reg_instruction @[stage-register.scala 45:11]
    io_data_pc <= reg_pc @[stage-register.scala 45:11]
    io_data_pcplusfour <= reg_pcplusfour @[stage-register.scala 45:11]
    reg_instruction <= mux(reset, _T_instruction, _GEN_5) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_pc <= mux(reset, _T_pc, _GEN_4) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_pcplusfour <= mux(reset, _T_pcplusfour, _GEN_3) @[stage-register.scala 48:9 stage-register.scala 52:9]

  module StageReg_1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_writereg : UInt<5>
    input io_in_funct7 : UInt<7>
    input io_in_funct3 : UInt<3>
    input io_in_imm : UInt<32>
    input io_in_readdata2 : UInt<32>
    input io_in_readdata1 : UInt<32>
    input io_in_pc : UInt<32>
    input io_in_pcplusfour : UInt<32>
    input io_in_rs1 : UInt<5>
    input io_in_rs2 : UInt<5>
    input io_flush : UInt<1>
    input io_valid : UInt<1>
    output io_data_writereg : UInt<5>
    output io_data_funct7 : UInt<7>
    output io_data_funct3 : UInt<3>
    output io_data_imm : UInt<32>
    output io_data_readdata2 : UInt<32>
    output io_data_readdata1 : UInt<32>
    output io_data_pc : UInt<32>
    output io_data_pcplusfour : UInt<32>
    output io_data_rs1 : UInt<5>
    output io_data_rs2 : UInt<5>
  
    reg reg_writereg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), reg_writereg) @[stage-register.scala 43:21]
    reg reg_funct7 : UInt<7>, clock with :
      reset => (UInt<1>("h0"), reg_funct7) @[stage-register.scala 43:21]
    reg reg_funct3 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), reg_funct3) @[stage-register.scala 43:21]
    reg reg_imm : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_imm) @[stage-register.scala 43:21]
    reg reg_readdata2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_readdata2) @[stage-register.scala 43:21]
    reg reg_readdata1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_readdata1) @[stage-register.scala 43:21]
    reg reg_pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_pc) @[stage-register.scala 43:21]
    reg reg_pcplusfour : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_pcplusfour) @[stage-register.scala 43:21]
    reg reg_rs1 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), reg_rs1) @[stage-register.scala 43:21]
    reg reg_rs2 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), reg_rs2) @[stage-register.scala 43:21]
    node _GEN_0 = mux(io_valid, io_in_rs2, reg_rs2) @[stage-register.scala 47:19]
    node _GEN_1 = mux(io_valid, io_in_rs1, reg_rs1) @[stage-register.scala 47:19]
    node _GEN_2 = mux(io_valid, io_in_pcplusfour, reg_pcplusfour) @[stage-register.scala 47:19]
    node _GEN_3 = mux(io_valid, io_in_pc, reg_pc) @[stage-register.scala 47:19]
    node _GEN_4 = mux(io_valid, io_in_readdata1, reg_readdata1) @[stage-register.scala 47:19]
    node _GEN_5 = mux(io_valid, io_in_readdata2, reg_readdata2) @[stage-register.scala 47:19]
    node _GEN_6 = mux(io_valid, io_in_imm, reg_imm) @[stage-register.scala 47:19]
    node _GEN_7 = mux(io_valid, io_in_funct3, reg_funct3) @[stage-register.scala 47:19]
    node _GEN_8 = mux(io_valid, io_in_funct7, reg_funct7) @[stage-register.scala 47:19]
    node _GEN_9 = mux(io_valid, io_in_writereg, reg_writereg) @[stage-register.scala 47:19]
    node _T_1_rs2 = UInt<5>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_10 = mux(io_flush, _T_1_rs2, _GEN_0) @[stage-register.scala 51:19]
    node _T_1_rs1 = UInt<5>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_11 = mux(io_flush, _T_1_rs1, _GEN_1) @[stage-register.scala 51:19]
    node _T_1_pcplusfour = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_12 = mux(io_flush, _T_1_pcplusfour, _GEN_2) @[stage-register.scala 51:19]
    node _T_1_pc = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_13 = mux(io_flush, _T_1_pc, _GEN_3) @[stage-register.scala 51:19]
    node _T_1_readdata1 = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_14 = mux(io_flush, _T_1_readdata1, _GEN_4) @[stage-register.scala 51:19]
    node _T_1_readdata2 = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_15 = mux(io_flush, _T_1_readdata2, _GEN_5) @[stage-register.scala 51:19]
    node _T_1_imm = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_16 = mux(io_flush, _T_1_imm, _GEN_6) @[stage-register.scala 51:19]
    node _T_1_funct3 = UInt<3>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_17 = mux(io_flush, _T_1_funct3, _GEN_7) @[stage-register.scala 51:19]
    node _T_1_funct7 = UInt<7>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_18 = mux(io_flush, _T_1_funct7, _GEN_8) @[stage-register.scala 51:19]
    node _T_1_writereg = UInt<5>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_19 = mux(io_flush, _T_1_writereg, _GEN_9) @[stage-register.scala 51:19]
    node _T_writereg = UInt<5>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_funct7 = UInt<7>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_funct3 = UInt<3>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_imm = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_readdata2 = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_readdata1 = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_pc = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_pcplusfour = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_rs1 = UInt<5>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_rs2 = UInt<5>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    io_data_writereg <= reg_writereg @[stage-register.scala 45:11]
    io_data_funct7 <= reg_funct7 @[stage-register.scala 45:11]
    io_data_funct3 <= reg_funct3 @[stage-register.scala 45:11]
    io_data_imm <= reg_imm @[stage-register.scala 45:11]
    io_data_readdata2 <= reg_readdata2 @[stage-register.scala 45:11]
    io_data_readdata1 <= reg_readdata1 @[stage-register.scala 45:11]
    io_data_pc <= reg_pc @[stage-register.scala 45:11]
    io_data_pcplusfour <= reg_pcplusfour @[stage-register.scala 45:11]
    io_data_rs1 <= reg_rs1 @[stage-register.scala 45:11]
    io_data_rs2 <= reg_rs2 @[stage-register.scala 45:11]
    reg_writereg <= mux(reset, _T_writereg, _GEN_19) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_funct7 <= mux(reset, _T_funct7, _GEN_18) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_funct3 <= mux(reset, _T_funct3, _GEN_17) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_imm <= mux(reset, _T_imm, _GEN_16) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_readdata2 <= mux(reset, _T_readdata2, _GEN_15) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_readdata1 <= mux(reset, _T_readdata1, _GEN_14) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_pc <= mux(reset, _T_pc, _GEN_13) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_pcplusfour <= mux(reset, _T_pcplusfour, _GEN_12) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_rs1 <= mux(reset, _T_rs1, _GEN_11) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_rs2 <= mux(reset, _T_rs2, _GEN_10) @[stage-register.scala 48:9 stage-register.scala 52:9]

  module StageReg_2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_ex_ctrl_itype : UInt<1>
    input io_in_ex_ctrl_aluop : UInt<2>
    input io_in_ex_ctrl_alusrc : UInt<1>
    input io_in_ex_ctrl_pcadd : UInt<1>
    input io_in_ex_ctrl_branch : UInt<1>
    input io_in_ex_ctrl_jump : UInt<1>
    input io_in_ex_ctrl_pcfromalu : UInt<1>
    input io_in_mem_ctrl_memread : UInt<1>
    input io_in_mem_ctrl_memwrite : UInt<1>
    input io_in_mem_ctrl_taken : UInt<1>
    input io_in_mem_ctrl_maskmode : UInt<2>
    input io_in_mem_ctrl_sext : UInt<1>
    input io_in_wb_ctrl_toreg : UInt<2>
    input io_in_wb_ctrl_regwrite : UInt<1>
    input io_flush : UInt<1>
    input io_valid : UInt<1>
    output io_data_ex_ctrl_itype : UInt<1>
    output io_data_ex_ctrl_aluop : UInt<2>
    output io_data_ex_ctrl_alusrc : UInt<1>
    output io_data_ex_ctrl_pcadd : UInt<1>
    output io_data_ex_ctrl_branch : UInt<1>
    output io_data_ex_ctrl_jump : UInt<1>
    output io_data_ex_ctrl_pcfromalu : UInt<1>
    output io_data_mem_ctrl_memread : UInt<1>
    output io_data_mem_ctrl_memwrite : UInt<1>
    output io_data_mem_ctrl_taken : UInt<1>
    output io_data_mem_ctrl_maskmode : UInt<2>
    output io_data_mem_ctrl_sext : UInt<1>
    output io_data_wb_ctrl_toreg : UInt<2>
    output io_data_wb_ctrl_regwrite : UInt<1>
  
    reg reg_ex_ctrl_itype : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_ex_ctrl_itype) @[stage-register.scala 43:21]
    reg reg_ex_ctrl_aluop : UInt<2>, clock with :
      reset => (UInt<1>("h0"), reg_ex_ctrl_aluop) @[stage-register.scala 43:21]
    reg reg_ex_ctrl_alusrc : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_ex_ctrl_alusrc) @[stage-register.scala 43:21]
    reg reg_ex_ctrl_pcadd : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_ex_ctrl_pcadd) @[stage-register.scala 43:21]
    reg reg_ex_ctrl_branch : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_ex_ctrl_branch) @[stage-register.scala 43:21]
    reg reg_ex_ctrl_jump : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_ex_ctrl_jump) @[stage-register.scala 43:21]
    reg reg_ex_ctrl_pcfromalu : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_ex_ctrl_pcfromalu) @[stage-register.scala 43:21]
    reg reg_mem_ctrl_memread : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_memread) @[stage-register.scala 43:21]
    reg reg_mem_ctrl_memwrite : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_memwrite) @[stage-register.scala 43:21]
    reg reg_mem_ctrl_taken : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_taken) @[stage-register.scala 43:21]
    reg reg_mem_ctrl_maskmode : UInt<2>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_maskmode) @[stage-register.scala 43:21]
    reg reg_mem_ctrl_sext : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_sext) @[stage-register.scala 43:21]
    reg reg_wb_ctrl_toreg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), reg_wb_ctrl_toreg) @[stage-register.scala 43:21]
    reg reg_wb_ctrl_regwrite : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_wb_ctrl_regwrite) @[stage-register.scala 43:21]
    node _GEN_0 = mux(io_valid, io_in_wb_ctrl_regwrite, reg_wb_ctrl_regwrite) @[stage-register.scala 47:19]
    node _GEN_1 = mux(io_valid, io_in_wb_ctrl_toreg, reg_wb_ctrl_toreg) @[stage-register.scala 47:19]
    node _GEN_2 = mux(io_valid, io_in_mem_ctrl_sext, reg_mem_ctrl_sext) @[stage-register.scala 47:19]
    node _GEN_3 = mux(io_valid, io_in_mem_ctrl_maskmode, reg_mem_ctrl_maskmode) @[stage-register.scala 47:19]
    node _GEN_4 = mux(io_valid, io_in_mem_ctrl_taken, reg_mem_ctrl_taken) @[stage-register.scala 47:19]
    node _GEN_5 = mux(io_valid, io_in_mem_ctrl_memwrite, reg_mem_ctrl_memwrite) @[stage-register.scala 47:19]
    node _GEN_6 = mux(io_valid, io_in_mem_ctrl_memread, reg_mem_ctrl_memread) @[stage-register.scala 47:19]
    node _GEN_7 = mux(io_valid, io_in_ex_ctrl_pcfromalu, reg_ex_ctrl_pcfromalu) @[stage-register.scala 47:19]
    node _GEN_8 = mux(io_valid, io_in_ex_ctrl_jump, reg_ex_ctrl_jump) @[stage-register.scala 47:19]
    node _GEN_9 = mux(io_valid, io_in_ex_ctrl_branch, reg_ex_ctrl_branch) @[stage-register.scala 47:19]
    node _GEN_10 = mux(io_valid, io_in_ex_ctrl_pcadd, reg_ex_ctrl_pcadd) @[stage-register.scala 47:19]
    node _GEN_11 = mux(io_valid, io_in_ex_ctrl_alusrc, reg_ex_ctrl_alusrc) @[stage-register.scala 47:19]
    node _GEN_12 = mux(io_valid, io_in_ex_ctrl_aluop, reg_ex_ctrl_aluop) @[stage-register.scala 47:19]
    node _GEN_13 = mux(io_valid, io_in_ex_ctrl_itype, reg_ex_ctrl_itype) @[stage-register.scala 47:19]
    node _T_1_wb_ctrl_regwrite = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_14 = mux(io_flush, _T_1_wb_ctrl_regwrite, _GEN_0) @[stage-register.scala 51:19]
    node _T_1_wb_ctrl_toreg = UInt<2>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_15 = mux(io_flush, _T_1_wb_ctrl_toreg, _GEN_1) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_sext = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_16 = mux(io_flush, _T_1_mem_ctrl_sext, _GEN_2) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_maskmode = UInt<2>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_17 = mux(io_flush, _T_1_mem_ctrl_maskmode, _GEN_3) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_taken = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_18 = mux(io_flush, _T_1_mem_ctrl_taken, _GEN_4) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_memwrite = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_19 = mux(io_flush, _T_1_mem_ctrl_memwrite, _GEN_5) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_memread = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_20 = mux(io_flush, _T_1_mem_ctrl_memread, _GEN_6) @[stage-register.scala 51:19]
    node _T_1_ex_ctrl_pcfromalu = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_21 = mux(io_flush, _T_1_ex_ctrl_pcfromalu, _GEN_7) @[stage-register.scala 51:19]
    node _T_1_ex_ctrl_jump = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_22 = mux(io_flush, _T_1_ex_ctrl_jump, _GEN_8) @[stage-register.scala 51:19]
    node _T_1_ex_ctrl_branch = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_23 = mux(io_flush, _T_1_ex_ctrl_branch, _GEN_9) @[stage-register.scala 51:19]
    node _T_1_ex_ctrl_pcadd = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_24 = mux(io_flush, _T_1_ex_ctrl_pcadd, _GEN_10) @[stage-register.scala 51:19]
    node _T_1_ex_ctrl_alusrc = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_25 = mux(io_flush, _T_1_ex_ctrl_alusrc, _GEN_11) @[stage-register.scala 51:19]
    node _T_1_ex_ctrl_aluop = UInt<2>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_26 = mux(io_flush, _T_1_ex_ctrl_aluop, _GEN_12) @[stage-register.scala 51:19]
    node _T_1_ex_ctrl_itype = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_27 = mux(io_flush, _T_1_ex_ctrl_itype, _GEN_13) @[stage-register.scala 51:19]
    node _T_ex_ctrl_itype = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_ex_ctrl_aluop = UInt<2>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_ex_ctrl_alusrc = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_ex_ctrl_pcadd = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_ex_ctrl_branch = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_ex_ctrl_jump = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_ex_ctrl_pcfromalu = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_mem_ctrl_memread = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_mem_ctrl_memwrite = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_mem_ctrl_taken = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_mem_ctrl_maskmode = UInt<2>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_mem_ctrl_sext = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_wb_ctrl_toreg = UInt<2>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_wb_ctrl_regwrite = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    io_data_ex_ctrl_itype <= reg_ex_ctrl_itype @[stage-register.scala 45:11]
    io_data_ex_ctrl_aluop <= reg_ex_ctrl_aluop @[stage-register.scala 45:11]
    io_data_ex_ctrl_alusrc <= reg_ex_ctrl_alusrc @[stage-register.scala 45:11]
    io_data_ex_ctrl_pcadd <= reg_ex_ctrl_pcadd @[stage-register.scala 45:11]
    io_data_ex_ctrl_branch <= reg_ex_ctrl_branch @[stage-register.scala 45:11]
    io_data_ex_ctrl_jump <= reg_ex_ctrl_jump @[stage-register.scala 45:11]
    io_data_ex_ctrl_pcfromalu <= reg_ex_ctrl_pcfromalu @[stage-register.scala 45:11]
    io_data_mem_ctrl_memread <= reg_mem_ctrl_memread @[stage-register.scala 45:11]
    io_data_mem_ctrl_memwrite <= reg_mem_ctrl_memwrite @[stage-register.scala 45:11]
    io_data_mem_ctrl_taken <= reg_mem_ctrl_taken @[stage-register.scala 45:11]
    io_data_mem_ctrl_maskmode <= reg_mem_ctrl_maskmode @[stage-register.scala 45:11]
    io_data_mem_ctrl_sext <= reg_mem_ctrl_sext @[stage-register.scala 45:11]
    io_data_wb_ctrl_toreg <= reg_wb_ctrl_toreg @[stage-register.scala 45:11]
    io_data_wb_ctrl_regwrite <= reg_wb_ctrl_regwrite @[stage-register.scala 45:11]
    reg_ex_ctrl_itype <= mux(reset, _T_ex_ctrl_itype, _GEN_27) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_ex_ctrl_aluop <= mux(reset, _T_ex_ctrl_aluop, _GEN_26) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_ex_ctrl_alusrc <= mux(reset, _T_ex_ctrl_alusrc, _GEN_25) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_ex_ctrl_pcadd <= mux(reset, _T_ex_ctrl_pcadd, _GEN_24) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_ex_ctrl_branch <= mux(reset, _T_ex_ctrl_branch, _GEN_23) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_ex_ctrl_jump <= mux(reset, _T_ex_ctrl_jump, _GEN_22) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_ex_ctrl_pcfromalu <= mux(reset, _T_ex_ctrl_pcfromalu, _GEN_21) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_mem_ctrl_memread <= mux(reset, _T_mem_ctrl_memread, _GEN_20) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_mem_ctrl_memwrite <= mux(reset, _T_mem_ctrl_memwrite, _GEN_19) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_mem_ctrl_taken <= mux(reset, _T_mem_ctrl_taken, _GEN_18) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_mem_ctrl_maskmode <= mux(reset, _T_mem_ctrl_maskmode, _GEN_17) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_mem_ctrl_sext <= mux(reset, _T_mem_ctrl_sext, _GEN_16) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_wb_ctrl_toreg <= mux(reset, _T_wb_ctrl_toreg, _GEN_15) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_wb_ctrl_regwrite <= mux(reset, _T_wb_ctrl_regwrite, _GEN_14) @[stage-register.scala 48:9 stage-register.scala 52:9]

  module StageReg_3 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_writereg : UInt<5>
    input io_in_readdata2 : UInt<32>
    input io_in_aluresult : UInt<32>
    input io_in_nextpc : UInt<32>
    input io_in_imm : UInt<32>
    input io_in_pcplusfour : UInt<32>
    input io_flush : UInt<1>
    input io_valid : UInt<1>
    output io_data_writereg : UInt<5>
    output io_data_readdata2 : UInt<32>
    output io_data_aluresult : UInt<32>
    output io_data_nextpc : UInt<32>
    output io_data_imm : UInt<32>
    output io_data_pcplusfour : UInt<32>
  
    reg reg_writereg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), reg_writereg) @[stage-register.scala 43:21]
    reg reg_readdata2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_readdata2) @[stage-register.scala 43:21]
    reg reg_aluresult : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_aluresult) @[stage-register.scala 43:21]
    reg reg_nextpc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_nextpc) @[stage-register.scala 43:21]
    reg reg_imm : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_imm) @[stage-register.scala 43:21]
    reg reg_pcplusfour : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_pcplusfour) @[stage-register.scala 43:21]
    node _GEN_0 = mux(io_valid, io_in_pcplusfour, reg_pcplusfour) @[stage-register.scala 47:19]
    node _GEN_1 = mux(io_valid, io_in_imm, reg_imm) @[stage-register.scala 47:19]
    node _GEN_2 = mux(io_valid, io_in_nextpc, reg_nextpc) @[stage-register.scala 47:19]
    node _GEN_3 = mux(io_valid, io_in_aluresult, reg_aluresult) @[stage-register.scala 47:19]
    node _GEN_4 = mux(io_valid, io_in_readdata2, reg_readdata2) @[stage-register.scala 47:19]
    node _GEN_5 = mux(io_valid, io_in_writereg, reg_writereg) @[stage-register.scala 47:19]
    node _T_1_pcplusfour = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_6 = mux(io_flush, _T_1_pcplusfour, _GEN_0) @[stage-register.scala 51:19]
    node _T_1_imm = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_7 = mux(io_flush, _T_1_imm, _GEN_1) @[stage-register.scala 51:19]
    node _T_1_nextpc = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_8 = mux(io_flush, _T_1_nextpc, _GEN_2) @[stage-register.scala 51:19]
    node _T_1_aluresult = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_9 = mux(io_flush, _T_1_aluresult, _GEN_3) @[stage-register.scala 51:19]
    node _T_1_readdata2 = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_10 = mux(io_flush, _T_1_readdata2, _GEN_4) @[stage-register.scala 51:19]
    node _T_1_writereg = UInt<5>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_11 = mux(io_flush, _T_1_writereg, _GEN_5) @[stage-register.scala 51:19]
    node _T_writereg = UInt<5>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_readdata2 = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_aluresult = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_nextpc = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_imm = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_pcplusfour = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    io_data_writereg <= reg_writereg @[stage-register.scala 45:11]
    io_data_readdata2 <= reg_readdata2 @[stage-register.scala 45:11]
    io_data_aluresult <= reg_aluresult @[stage-register.scala 45:11]
    io_data_nextpc <= reg_nextpc @[stage-register.scala 45:11]
    io_data_imm <= reg_imm @[stage-register.scala 45:11]
    io_data_pcplusfour <= reg_pcplusfour @[stage-register.scala 45:11]
    reg_writereg <= mux(reset, _T_writereg, _GEN_11) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_readdata2 <= mux(reset, _T_readdata2, _GEN_10) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_aluresult <= mux(reset, _T_aluresult, _GEN_9) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_nextpc <= mux(reset, _T_nextpc, _GEN_8) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_imm <= mux(reset, _T_imm, _GEN_7) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_pcplusfour <= mux(reset, _T_pcplusfour, _GEN_6) @[stage-register.scala 48:9 stage-register.scala 52:9]

  module StageReg_4 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_mem_ctrl_memread : UInt<1>
    input io_in_mem_ctrl_memwrite : UInt<1>
    input io_in_mem_ctrl_taken : UInt<1>
    input io_in_mem_ctrl_maskmode : UInt<2>
    input io_in_mem_ctrl_sext : UInt<1>
    input io_in_wb_ctrl_toreg : UInt<2>
    input io_in_wb_ctrl_regwrite : UInt<1>
    input io_flush : UInt<1>
    input io_valid : UInt<1>
    output io_data_mem_ctrl_memread : UInt<1>
    output io_data_mem_ctrl_memwrite : UInt<1>
    output io_data_mem_ctrl_taken : UInt<1>
    output io_data_mem_ctrl_maskmode : UInt<2>
    output io_data_mem_ctrl_sext : UInt<1>
    output io_data_wb_ctrl_toreg : UInt<2>
    output io_data_wb_ctrl_regwrite : UInt<1>
  
    reg reg_mem_ctrl_memread : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_memread) @[stage-register.scala 43:21]
    reg reg_mem_ctrl_memwrite : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_memwrite) @[stage-register.scala 43:21]
    reg reg_mem_ctrl_taken : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_taken) @[stage-register.scala 43:21]
    reg reg_mem_ctrl_maskmode : UInt<2>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_maskmode) @[stage-register.scala 43:21]
    reg reg_mem_ctrl_sext : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_mem_ctrl_sext) @[stage-register.scala 43:21]
    reg reg_wb_ctrl_toreg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), reg_wb_ctrl_toreg) @[stage-register.scala 43:21]
    reg reg_wb_ctrl_regwrite : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_wb_ctrl_regwrite) @[stage-register.scala 43:21]
    node _GEN_0 = mux(io_valid, io_in_wb_ctrl_regwrite, reg_wb_ctrl_regwrite) @[stage-register.scala 47:19]
    node _GEN_1 = mux(io_valid, io_in_wb_ctrl_toreg, reg_wb_ctrl_toreg) @[stage-register.scala 47:19]
    node _GEN_2 = mux(io_valid, io_in_mem_ctrl_sext, reg_mem_ctrl_sext) @[stage-register.scala 47:19]
    node _GEN_3 = mux(io_valid, io_in_mem_ctrl_maskmode, reg_mem_ctrl_maskmode) @[stage-register.scala 47:19]
    node _GEN_4 = mux(io_valid, io_in_mem_ctrl_taken, reg_mem_ctrl_taken) @[stage-register.scala 47:19]
    node _GEN_5 = mux(io_valid, io_in_mem_ctrl_memwrite, reg_mem_ctrl_memwrite) @[stage-register.scala 47:19]
    node _GEN_6 = mux(io_valid, io_in_mem_ctrl_memread, reg_mem_ctrl_memread) @[stage-register.scala 47:19]
    node _T_1_wb_ctrl_regwrite = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_7 = mux(io_flush, _T_1_wb_ctrl_regwrite, _GEN_0) @[stage-register.scala 51:19]
    node _T_1_wb_ctrl_toreg = UInt<2>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_8 = mux(io_flush, _T_1_wb_ctrl_toreg, _GEN_1) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_sext = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_9 = mux(io_flush, _T_1_mem_ctrl_sext, _GEN_2) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_maskmode = UInt<2>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_10 = mux(io_flush, _T_1_mem_ctrl_maskmode, _GEN_3) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_taken = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_11 = mux(io_flush, _T_1_mem_ctrl_taken, _GEN_4) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_memwrite = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_12 = mux(io_flush, _T_1_mem_ctrl_memwrite, _GEN_5) @[stage-register.scala 51:19]
    node _T_1_mem_ctrl_memread = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_13 = mux(io_flush, _T_1_mem_ctrl_memread, _GEN_6) @[stage-register.scala 51:19]
    node _T_mem_ctrl_memread = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_mem_ctrl_memwrite = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_mem_ctrl_taken = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_mem_ctrl_maskmode = UInt<2>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_mem_ctrl_sext = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_wb_ctrl_toreg = UInt<2>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_wb_ctrl_regwrite = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    io_data_mem_ctrl_memread <= reg_mem_ctrl_memread @[stage-register.scala 45:11]
    io_data_mem_ctrl_memwrite <= reg_mem_ctrl_memwrite @[stage-register.scala 45:11]
    io_data_mem_ctrl_taken <= reg_mem_ctrl_taken @[stage-register.scala 45:11]
    io_data_mem_ctrl_maskmode <= reg_mem_ctrl_maskmode @[stage-register.scala 45:11]
    io_data_mem_ctrl_sext <= reg_mem_ctrl_sext @[stage-register.scala 45:11]
    io_data_wb_ctrl_toreg <= reg_wb_ctrl_toreg @[stage-register.scala 45:11]
    io_data_wb_ctrl_regwrite <= reg_wb_ctrl_regwrite @[stage-register.scala 45:11]
    reg_mem_ctrl_memread <= mux(reset, _T_mem_ctrl_memread, _GEN_13) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_mem_ctrl_memwrite <= mux(reset, _T_mem_ctrl_memwrite, _GEN_12) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_mem_ctrl_taken <= mux(reset, _T_mem_ctrl_taken, _GEN_11) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_mem_ctrl_maskmode <= mux(reset, _T_mem_ctrl_maskmode, _GEN_10) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_mem_ctrl_sext <= mux(reset, _T_mem_ctrl_sext, _GEN_9) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_wb_ctrl_toreg <= mux(reset, _T_wb_ctrl_toreg, _GEN_8) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_wb_ctrl_regwrite <= mux(reset, _T_wb_ctrl_regwrite, _GEN_7) @[stage-register.scala 48:9 stage-register.scala 52:9]

  module StageReg_5 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_writereg : UInt<5>
    input io_in_aluresult : UInt<32>
    input io_in_imm : UInt<32>
    input io_in_pcplusfour : UInt<32>
    input io_in_readdata : UInt<32>
    input io_flush : UInt<1>
    input io_valid : UInt<1>
    output io_data_writereg : UInt<5>
    output io_data_aluresult : UInt<32>
    output io_data_imm : UInt<32>
    output io_data_pcplusfour : UInt<32>
    output io_data_readdata : UInt<32>
  
    reg reg_writereg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), reg_writereg) @[stage-register.scala 43:21]
    reg reg_aluresult : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_aluresult) @[stage-register.scala 43:21]
    reg reg_imm : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_imm) @[stage-register.scala 43:21]
    reg reg_pcplusfour : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_pcplusfour) @[stage-register.scala 43:21]
    reg reg_readdata : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg_readdata) @[stage-register.scala 43:21]
    node _GEN_0 = mux(io_valid, io_in_readdata, reg_readdata) @[stage-register.scala 47:19]
    node _GEN_1 = mux(io_valid, io_in_pcplusfour, reg_pcplusfour) @[stage-register.scala 47:19]
    node _GEN_2 = mux(io_valid, io_in_imm, reg_imm) @[stage-register.scala 47:19]
    node _GEN_3 = mux(io_valid, io_in_aluresult, reg_aluresult) @[stage-register.scala 47:19]
    node _GEN_4 = mux(io_valid, io_in_writereg, reg_writereg) @[stage-register.scala 47:19]
    node _T_1_readdata = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_5 = mux(io_flush, _T_1_readdata, _GEN_0) @[stage-register.scala 51:19]
    node _T_1_pcplusfour = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_6 = mux(io_flush, _T_1_pcplusfour, _GEN_1) @[stage-register.scala 51:19]
    node _T_1_imm = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_7 = mux(io_flush, _T_1_imm, _GEN_2) @[stage-register.scala 51:19]
    node _T_1_aluresult = UInt<32>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_8 = mux(io_flush, _T_1_aluresult, _GEN_3) @[stage-register.scala 51:19]
    node _T_1_writereg = UInt<5>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_9 = mux(io_flush, _T_1_writereg, _GEN_4) @[stage-register.scala 51:19]
    node _T_writereg = UInt<5>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_aluresult = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_imm = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_pcplusfour = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_readdata = UInt<32>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    io_data_writereg <= reg_writereg @[stage-register.scala 45:11]
    io_data_aluresult <= reg_aluresult @[stage-register.scala 45:11]
    io_data_imm <= reg_imm @[stage-register.scala 45:11]
    io_data_pcplusfour <= reg_pcplusfour @[stage-register.scala 45:11]
    io_data_readdata <= reg_readdata @[stage-register.scala 45:11]
    reg_writereg <= mux(reset, _T_writereg, _GEN_9) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_aluresult <= mux(reset, _T_aluresult, _GEN_8) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_imm <= mux(reset, _T_imm, _GEN_7) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_pcplusfour <= mux(reset, _T_pcplusfour, _GEN_6) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_readdata <= mux(reset, _T_readdata, _GEN_5) @[stage-register.scala 48:9 stage-register.scala 52:9]

  module StageReg_6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_wb_ctrl_toreg : UInt<2>
    input io_in_wb_ctrl_regwrite : UInt<1>
    input io_flush : UInt<1>
    input io_valid : UInt<1>
    output io_data_wb_ctrl_toreg : UInt<2>
    output io_data_wb_ctrl_regwrite : UInt<1>
  
    reg reg_wb_ctrl_toreg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), reg_wb_ctrl_toreg) @[stage-register.scala 43:21]
    reg reg_wb_ctrl_regwrite : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_wb_ctrl_regwrite) @[stage-register.scala 43:21]
    node _GEN_0 = mux(io_valid, io_in_wb_ctrl_regwrite, reg_wb_ctrl_regwrite) @[stage-register.scala 47:19]
    node _GEN_1 = mux(io_valid, io_in_wb_ctrl_toreg, reg_wb_ctrl_toreg) @[stage-register.scala 47:19]
    node _T_1_wb_ctrl_regwrite = UInt<1>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_2 = mux(io_flush, _T_1_wb_ctrl_regwrite, _GEN_0) @[stage-register.scala 51:19]
    node _T_1_wb_ctrl_toreg = UInt<2>("h0") @[stage-register.scala 52:25 stage-register.scala 52:25]
    node _GEN_3 = mux(io_flush, _T_1_wb_ctrl_toreg, _GEN_1) @[stage-register.scala 51:19]
    node _T_wb_ctrl_toreg = UInt<2>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    node _T_wb_ctrl_regwrite = UInt<1>("h0") @[stage-register.scala 43:35 stage-register.scala 43:35]
    io_data_wb_ctrl_toreg <= reg_wb_ctrl_toreg @[stage-register.scala 45:11]
    io_data_wb_ctrl_regwrite <= reg_wb_ctrl_regwrite @[stage-register.scala 45:11]
    reg_wb_ctrl_toreg <= mux(reset, _T_wb_ctrl_toreg, _GEN_3) @[stage-register.scala 48:9 stage-register.scala 52:9]
    reg_wb_ctrl_regwrite <= mux(reset, _T_wb_ctrl_regwrite, _GEN_2) @[stage-register.scala 48:9 stage-register.scala 52:9]

  module PipelinedCPU :
    input clock : Clock
    input reset : UInt<1>
    output io_imem_address : UInt<32>
    output io_imem_valid : UInt<1>
    input io_imem_good : UInt<1>
    input io_imem_instruction : UInt<32>
    input io_imem_ready : UInt<1>
    output io_dmem_address : UInt<32>
    output io_dmem_valid : UInt<1>
    input io_dmem_good : UInt<1>
    output io_dmem_writedata : UInt<32>
    output io_dmem_memread : UInt<1>
    output io_dmem_memwrite : UInt<1>
    output io_dmem_maskmode : UInt<2>
    output io_dmem_sext : UInt<1>
    input io_dmem_readdata : UInt<32>
  
    inst control of Control @[cpu.scala 105:26]
    inst registers of RegisterFile @[cpu.scala 106:26]
    inst aluControl of ALUControl @[cpu.scala 107:26]
    inst alu of ALU @[cpu.scala 108:26]
    inst immGen of ImmediateGenerator @[cpu.scala 109:26]
    inst pcPlusFour of Adder @[cpu.scala 110:26]
    inst branchAdd of Adder @[cpu.scala 111:26]
    inst forwarding of ForwardingUnit @[cpu.scala 112:26]
    inst hazard of HazardUnit @[cpu.scala 113:26]
    inst if_id of StageReg @[cpu.scala 117:27]
    inst id_ex of StageReg_1 @[cpu.scala 119:27]
    inst id_ex_ctrl of StageReg_2 @[cpu.scala 120:27]
    inst ex_mem of StageReg_3 @[cpu.scala 122:27]
    inst ex_mem_ctrl of StageReg_4 @[cpu.scala 123:27]
    inst mem_wb of StageReg_5 @[cpu.scala 125:27]
    inst mem_wb_ctrl of StageReg_6 @[cpu.scala 128:27]
    reg pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc) @[cpu.scala 104:27]
    reg value : UInt<30>, clock with :
      reset => (UInt<1>("h0"), value) @[Counter.scala 29:33]
    node _T = eq(value, UInt<30>("h3fffffff")) @[Counter.scala 37:24]
    node _T_1 = add(value, UInt<1>("h1")) @[Counter.scala 38:22]
    node _T_2 = tail(_T_1, 1) @[Counter.scala 38:22]
    node _GEN_0 = mux(UInt<1>("h1"), _T_2, value) @[Counter.scala 71:17]
    node _T_3 = and(UInt<1>("h1"), _T) @[Counter.scala 72:20]
    node next_pc = ex_mem.io_data_nextpc @[cpu.scala 133:26 cpu.scala 330:11]
    node _T_4 = mux(hazard.io_pcfromtaken, next_pc, pcPlusFour.io_result) @[cpu.scala 146:15]
    node _T_5 = mux(hazard.io_pcstall, pc, _T_4) @[cpu.scala 145:12]
    node _T_6 = eq(hazard.io_if_id_stall, UInt<1>("h0")) @[cpu.scala 153:20]
    node _T_7 = eq(hazard.io_if_id_stall, UInt<1>("h0")) @[cpu.scala 161:21]
    node rs1 = bits(if_id.io_data_instruction, 19, 15) @[cpu.scala 174:38]
    node rs2 = bits(if_id.io_data_instruction, 24, 20) @[cpu.scala 175:38]
    node _T_8 = bits(if_id.io_data_instruction, 6, 0) @[cpu.scala 182:49]
    node _T_9 = bits(if_id.io_data_instruction, 11, 7) @[cpu.scala 196:54]
    node _T_10 = bits(if_id.io_data_instruction, 31, 25) @[cpu.scala 199:54]
    node _T_11 = bits(if_id.io_data_instruction, 14, 12) @[cpu.scala 200:54]
    node _T_12 = bits(if_id.io_data_instruction, 13, 12) @[cpu.scala 221:66]
    node _T_13 = bits(if_id.io_data_instruction, 14, 14) @[cpu.scala 222:67]
    node _T_14 = not(_T_13) @[cpu.scala 222:41]
    node _T_15 = eq(forwarding.io_forwardA, UInt<1>("h0")) @[cpu.scala 254:52]
    node _T_16 = eq(forwarding.io_forwardA, UInt<1>("h1")) @[cpu.scala 255:52]
    node _T_17 = eq(forwarding.io_forwardA, UInt<2>("h2")) @[cpu.scala 256:52]
    node _T_18 = eq(forwarding.io_forwardA, UInt<2>("h3")) @[cpu.scala 257:52]
    node _T_19 = mux(_T_18, ex_mem.io_data_imm, UInt<1>("h0")) @[Mux.scala 87:16]
    node _T_38 = eq(mem_wb_ctrl.io_data_wb_ctrl_toreg, UInt<1>("h0")) @[cpu.scala 363:63]
    node _T_39 = eq(mem_wb_ctrl.io_data_wb_ctrl_toreg, UInt<1>("h1")) @[cpu.scala 364:63]
    node _T_40 = eq(mem_wb_ctrl.io_data_wb_ctrl_toreg, UInt<2>("h2")) @[cpu.scala 365:63]
    node _T_41 = eq(mem_wb_ctrl.io_data_wb_ctrl_toreg, UInt<2>("h3")) @[cpu.scala 366:63]
    node _T_42 = mux(_T_41, mem_wb.io_data_readdata, UInt<1>("h0")) @[Mux.scala 87:16]
    node _T_43 = mux(_T_40, mem_wb.io_data_pcplusfour, _T_42) @[Mux.scala 87:16]
    node _T_44 = mux(_T_39, mem_wb.io_data_imm, _T_43) @[Mux.scala 87:16]
    node _T_45 = mux(_T_38, mem_wb.io_data_aluresult, _T_44) @[Mux.scala 87:16]
    node write_data = _T_45 @[cpu.scala 137:24 cpu.scala 362:14]
    node _T_20 = mux(_T_17, write_data, _T_19) @[Mux.scala 87:16]
    node _T_21 = mux(_T_16, ex_mem.io_data_aluresult, _T_20) @[Mux.scala 87:16]
    node _T_22 = mux(_T_15, id_ex.io_data_readdata1, _T_21) @[Mux.scala 87:16]
    node forward_inputx = _T_22 @[cpu.scala 252:28 cpu.scala 253:19]
    node _T_23 = mux(id_ex_ctrl.io_data_ex_ctrl_pcadd, id_ex.io_data_pc, forward_inputx) @[cpu.scala 261:20]
    node _T_24 = eq(forwarding.io_forwardB, UInt<1>("h0")) @[cpu.scala 267:52]
    node _T_25 = eq(forwarding.io_forwardB, UInt<1>("h1")) @[cpu.scala 268:52]
    node _T_26 = eq(forwarding.io_forwardB, UInt<2>("h2")) @[cpu.scala 269:52]
    node _T_27 = eq(forwarding.io_forwardB, UInt<2>("h3")) @[cpu.scala 270:52]
    node _T_28 = mux(_T_27, ex_mem.io_data_imm, UInt<1>("h0")) @[Mux.scala 87:16]
    node _T_29 = mux(_T_26, write_data, _T_28) @[Mux.scala 87:16]
    node _T_30 = mux(_T_25, ex_mem.io_data_aluresult, _T_29) @[Mux.scala 87:16]
    node forward_inputy = mux(_T_24, id_ex.io_data_readdata2, _T_30) @[Mux.scala 87:16]
    node alu_inputy = forward_inputy @[cpu.scala 272:24 cpu.scala 273:14]
    node _T_31 = mux(id_ex_ctrl.io_data_ex_ctrl_alusrc, id_ex.io_data_imm, alu_inputy) @[cpu.scala 276:23]
    node _T_32 = mux(id_ex_ctrl.io_data_ex_ctrl_pcfromalu, alu.io_result, branchAdd.io_result) @[cpu.scala 302:29]
    node _T_33 = bits(alu.io_result, 0, 0) @[cpu.scala 304:95]
    node _T_34 = and(id_ex_ctrl.io_data_ex_ctrl_branch, _T_33) @[cpu.scala 304:79]
    node _T_35 = or(id_ex_ctrl.io_data_ex_ctrl_jump, _T_34) @[cpu.scala 304:41]
    node _GEN_1 = mux(_T_35, UInt<1>("h1"), UInt<1>("h0")) @[cpu.scala 304:101]
    node _T_36 = or(io_dmem_memread, io_dmem_memwrite) @[cpu.scala 327:37]
    node _T_37 = eq(ex_mem_ctrl.io_data_wb_ctrl_toreg, UInt<1>("h1")) @[cpu.scala 338:67]
    node _T_46 = neq(mem_wb.io_data_writereg, UInt<1>("h0")) @[cpu.scala 371:94]
    node _T_47 = and(mem_wb_ctrl.io_data_wb_ctrl_regwrite, _T_46) @[cpu.scala 371:66]
    node alu_inputx = _T_23 @[cpu.scala 259:24 cpu.scala 261:14]
    io_imem_address <= pc @[cpu.scala 149:19]
    io_imem_valid <= _T_6 @[cpu.scala 153:17]
    io_dmem_address <= ex_mem.io_data_aluresult @[cpu.scala 319:21]
    io_dmem_valid <= _T_36 @[cpu.scala 327:17]
    io_dmem_writedata <= ex_mem.io_data_readdata2 @[cpu.scala 320:21]
    io_dmem_memread <= ex_mem_ctrl.io_data_mem_ctrl_memread @[cpu.scala 321:21]
    io_dmem_memwrite <= ex_mem_ctrl.io_data_mem_ctrl_memwrite @[cpu.scala 322:21]
    io_dmem_maskmode <= ex_mem_ctrl.io_data_mem_ctrl_maskmode @[cpu.scala 323:21]
    io_dmem_sext <= ex_mem_ctrl.io_data_mem_ctrl_sext @[cpu.scala 324:21]
    pc <= mux(reset, UInt<1>("h0"), _T_5) @[cpu.scala 145:6]
    control.clock <= clock
    control.reset <= reset
    control.io_opcode <= _T_8 @[cpu.scala 182:21]
    registers.clock <= clock
    registers.reset <= reset
    registers.io_readreg1 <= rs1 @[cpu.scala 185:25]
    registers.io_readreg2 <= rs2 @[cpu.scala 186:25]
    registers.io_writereg <= mem_wb.io_data_writereg @[cpu.scala 370:26]
    registers.io_writedata <= write_data @[cpu.scala 369:26]
    registers.io_wen <= _T_47 @[cpu.scala 371:26]
    aluControl.clock <= clock
    aluControl.reset <= reset
    aluControl.io_aluop <= id_ex_ctrl.io_data_ex_ctrl_aluop @[cpu.scala 246:27]
    aluControl.io_itype <= id_ex_ctrl.io_data_ex_ctrl_itype @[cpu.scala 247:27]
    aluControl.io_funct7 <= id_ex.io_data_funct7 @[cpu.scala 248:27]
    aluControl.io_funct3 <= id_ex.io_data_funct3 @[cpu.scala 249:27]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_operation <= aluControl.io_operation @[cpu.scala 279:20]
    alu.io_inputx <= alu_inputx @[cpu.scala 263:17]
    alu.io_inputy <= _T_31 @[cpu.scala 276:17]
    immGen.clock <= clock
    immGen.reset <= reset
    immGen.io_instruction <= if_id.io_data_instruction @[cpu.scala 189:25]
    pcPlusFour.clock <= clock
    pcPlusFour.reset <= reset
    pcPlusFour.io_inputx <= pc @[cpu.scala 156:24]
    pcPlusFour.io_inputy <= UInt<3>("h4") @[cpu.scala 157:24]
    branchAdd.clock <= clock
    branchAdd.reset <= reset
    branchAdd.io_inputx <= id_ex.io_data_pc @[cpu.scala 282:23]
    branchAdd.io_inputy <= id_ex.io_data_imm @[cpu.scala 283:23]
    forwarding.clock <= clock
    forwarding.reset <= reset
    forwarding.io_rs1 <= id_ex.io_data_rs1 @[cpu.scala 242:21]
    forwarding.io_rs2 <= id_ex.io_data_rs2 @[cpu.scala 243:21]
    forwarding.io_exmemrd <= ex_mem.io_data_writereg @[cpu.scala 336:29]
    forwarding.io_exmemrw <= ex_mem_ctrl.io_data_wb_ctrl_regwrite @[cpu.scala 337:29]
    forwarding.io_exmembypass <= _T_37 @[cpu.scala 338:29]
    forwarding.io_memwbrd <= mem_wb.io_data_writereg @[cpu.scala 374:25]
    forwarding.io_memwbrw <= mem_wb_ctrl.io_data_wb_ctrl_regwrite @[cpu.scala 375:25]
    hazard.clock <= clock
    hazard.reset <= reset
    hazard.io_rs1 <= rs1 @[cpu.scala 178:17]
    hazard.io_rs2 <= rs2 @[cpu.scala 179:17]
    hazard.io_idex_memread <= id_ex_ctrl.io_data_mem_ctrl_memread @[cpu.scala 238:26]
    hazard.io_idex_rd <= id_ex.io_data_writereg @[cpu.scala 239:26]
    hazard.io_exmem_taken <= ex_mem_ctrl.io_data_mem_ctrl_taken @[cpu.scala 333:25]
    value <= mux(reset, UInt<30>("h0"), _GEN_0) @[Counter.scala 38:13]
    if_id.clock <= clock
    if_id.reset <= reset
    if_id.io_in_instruction <= io_imem_instruction @[cpu.scala 164:27]
    if_id.io_in_pc <= pc @[cpu.scala 165:27]
    if_id.io_in_pcplusfour <= pcPlusFour.io_result @[cpu.scala 166:27]
    if_id.io_flush <= hazard.io_if_id_flush @[cpu.scala 168:19]
    if_id.io_valid <= _T_7 @[cpu.scala 161:18]
    id_ex.clock <= clock
    id_ex.reset <= reset
    id_ex.io_in_writereg <= _T_9 @[cpu.scala 196:26]
    id_ex.io_in_funct7 <= _T_10 @[cpu.scala 199:26]
    id_ex.io_in_funct3 <= _T_11 @[cpu.scala 200:26]
    id_ex.io_in_imm <= immGen.io_sextImm @[cpu.scala 201:26]
    id_ex.io_in_readdata2 <= registers.io_readdata2 @[cpu.scala 202:26]
    id_ex.io_in_readdata1 <= registers.io_readdata1 @[cpu.scala 203:26]
    id_ex.io_in_pc <= if_id.io_data_pc @[cpu.scala 204:26]
    id_ex.io_in_pcplusfour <= if_id.io_data_pcplusfour @[cpu.scala 205:26]
    id_ex.io_in_rs1 <= rs1 @[cpu.scala 197:26]
    id_ex.io_in_rs2 <= rs2 @[cpu.scala 198:26]
    id_ex.io_flush <= UInt<1>("h0") @[cpu.scala 194:18]
    id_ex.io_valid <= UInt<1>("h1") @[cpu.scala 192:18]
    id_ex_ctrl.clock <= clock
    id_ex_ctrl.reset <= reset
    id_ex_ctrl.io_in_ex_ctrl_itype <= control.io_itype @[cpu.scala 211:38]
    id_ex_ctrl.io_in_ex_ctrl_aluop <= control.io_aluop @[cpu.scala 210:38]
    id_ex_ctrl.io_in_ex_ctrl_alusrc <= control.io_alusrc @[cpu.scala 212:38]
    id_ex_ctrl.io_in_ex_ctrl_pcadd <= control.io_pcadd @[cpu.scala 213:38]
    id_ex_ctrl.io_in_ex_ctrl_branch <= control.io_branch @[cpu.scala 214:38]
    id_ex_ctrl.io_in_ex_ctrl_jump <= control.io_jump @[cpu.scala 215:38]
    id_ex_ctrl.io_in_ex_ctrl_pcfromalu <= control.io_pcfromalu @[cpu.scala 216:38]
    id_ex_ctrl.io_in_mem_ctrl_memread <= control.io_memread @[cpu.scala 219:38]
    id_ex_ctrl.io_in_mem_ctrl_memwrite <= control.io_memwrite @[cpu.scala 220:38]
    id_ex_ctrl.io_in_mem_ctrl_taken <= UInt<1>("h0") @[cpu.scala 223:38]
    id_ex_ctrl.io_in_mem_ctrl_maskmode <= _T_12 @[cpu.scala 221:38]
    id_ex_ctrl.io_in_mem_ctrl_sext <= _T_14 @[cpu.scala 222:38]
    id_ex_ctrl.io_in_wb_ctrl_toreg <= control.io_toreg @[cpu.scala 226:38]
    id_ex_ctrl.io_in_wb_ctrl_regwrite <= control.io_regwrite @[cpu.scala 227:38]
    id_ex_ctrl.io_flush <= hazard.io_id_ex_flush @[cpu.scala 231:23]
    id_ex_ctrl.io_valid <= UInt<1>("h1") @[cpu.scala 208:23]
    ex_mem.clock <= clock
    ex_mem.reset <= reset
    ex_mem.io_in_writereg <= id_ex.io_data_writereg @[cpu.scala 292:27]
    ex_mem.io_in_readdata2 <= alu_inputy @[cpu.scala 290:27]
    ex_mem.io_in_aluresult <= alu.io_result @[cpu.scala 291:27]
    ex_mem.io_in_nextpc <= _T_32 @[cpu.scala 302:23]
    ex_mem.io_in_imm <= id_ex.io_data_imm @[cpu.scala 294:27]
    ex_mem.io_in_pcplusfour <= id_ex.io_data_pcplusfour @[cpu.scala 293:27]
    ex_mem.io_flush <= UInt<1>("h0") @[cpu.scala 288:19]
    ex_mem.io_valid <= UInt<1>("h1") @[cpu.scala 286:19]
    ex_mem_ctrl.clock <= clock
    ex_mem_ctrl.reset <= reset
    ex_mem_ctrl.io_in_mem_ctrl_memread <= id_ex_ctrl.io_data_mem_ctrl_memread @[cpu.scala 298:30]
    ex_mem_ctrl.io_in_mem_ctrl_memwrite <= id_ex_ctrl.io_data_mem_ctrl_memwrite @[cpu.scala 298:30]
    ex_mem_ctrl.io_in_mem_ctrl_taken <= _GEN_1 @[cpu.scala 298:30 cpu.scala 305:39 cpu.scala 308:39]
    ex_mem_ctrl.io_in_mem_ctrl_maskmode <= id_ex_ctrl.io_data_mem_ctrl_maskmode @[cpu.scala 298:30]
    ex_mem_ctrl.io_in_mem_ctrl_sext <= id_ex_ctrl.io_data_mem_ctrl_sext @[cpu.scala 298:30]
    ex_mem_ctrl.io_in_wb_ctrl_toreg <= id_ex_ctrl.io_data_wb_ctrl_toreg @[cpu.scala 299:30]
    ex_mem_ctrl.io_in_wb_ctrl_regwrite <= id_ex_ctrl.io_data_wb_ctrl_regwrite @[cpu.scala 299:30]
    ex_mem_ctrl.io_flush <= hazard.io_ex_mem_flush @[cpu.scala 312:24]
    ex_mem_ctrl.io_valid <= UInt<1>("h1") @[cpu.scala 297:30]
    mem_wb.clock <= clock
    mem_wb.reset <= reset
    mem_wb.io_in_writereg <= ex_mem.io_data_writereg @[cpu.scala 345:27]
    mem_wb.io_in_aluresult <= ex_mem.io_data_aluresult @[cpu.scala 346:27]
    mem_wb.io_in_imm <= ex_mem.io_data_imm @[cpu.scala 349:27]
    mem_wb.io_in_pcplusfour <= ex_mem.io_data_pcplusfour @[cpu.scala 347:27]
    mem_wb.io_in_readdata <= io_dmem_readdata @[cpu.scala 348:27]
    mem_wb.io_flush <= UInt<1>("h0") @[cpu.scala 343:19]
    mem_wb.io_valid <= UInt<1>("h1") @[cpu.scala 341:19]
    mem_wb_ctrl.clock <= clock
    mem_wb_ctrl.reset <= reset
    mem_wb_ctrl.io_in_wb_ctrl_toreg <= ex_mem_ctrl.io_data_wb_ctrl_toreg @[cpu.scala 355:30]
    mem_wb_ctrl.io_in_wb_ctrl_regwrite <= ex_mem_ctrl.io_data_wb_ctrl_regwrite @[cpu.scala 355:30]
    mem_wb_ctrl.io_flush <= UInt<1>("h0") @[cpu.scala 354:30]
    mem_wb_ctrl.io_valid <= UInt<1>("h1") @[cpu.scala 352:30]

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
      depth => 16384
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
    node _T_6 = lt(io_imem_request_bits_address, UInt<17>("h10000")) @[memory.scala 35:27]
    node _T_7 = shr(io_imem_request_bits_address, 2) @[memory.scala 37:60]
    node _T_8 = bits(_T_7, 13, 0) @[memory.scala 37:43]
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
    node _T_14 = lt(io_dmem_request_bits_address, UInt<17>("h10000")) @[memory.scala 58:29]
    node _T_15 = asUInt(reset) @[memory.scala 58:12]
    node _T_16 = or(_T_14, _T_15) @[memory.scala 58:12]
    node _T_17 = eq(_T_16, UInt<1>("h0")) @[memory.scala 58:12]
    node _T_18 = shr(io_dmem_request_bits_address, 2) @[memory.scala 61:58]
    node _T_19 = bits(_T_18, 13, 0) @[memory.scala 61:46]
    node _T_21 = eq(io_dmem_request_bits_operation, UInt<2>("h2")) @[memory.scala 65:29]
    node _T_22 = shr(io_dmem_request_bits_address, 2) @[memory.scala 66:25]
    node _T_23 = bits(_T_22, 13, 0) @[memory.scala 66:13]
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

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io_success : UInt<1>
  
    inst cpu of PipelinedCPU @[top.scala 14:20]
    inst mem of DualPortedCombinMemory @[top.scala 15:20]
    inst imem of ICombinMemPort @[top.scala 17:20]
    inst dmem of DCombinMemPort @[top.scala 18:20]
    io_success is invalid
    cpu.clock <= clock
    cpu.reset <= reset
    cpu.io_imem_good <= imem.io_pipeline_good @[top.scala 23:15]
    cpu.io_imem_instruction <= imem.io_pipeline_instruction @[top.scala 23:15]
    cpu.io_imem_ready <= imem.io_pipeline_ready @[top.scala 23:15]
    cpu.io_dmem_good <= dmem.io_pipeline_good @[top.scala 24:15]
    cpu.io_dmem_readdata <= dmem.io_pipeline_readdata @[top.scala 24:15]
    mem.clock <= clock
    mem.reset <= reset
    mem.io_imem_request_valid <= imem.io_bus_request_valid @[base-memory-components.scala 16:26]
    mem.io_imem_request_bits_address <= imem.io_bus_request_bits_address @[base-memory-components.scala 16:26]
    mem.io_imem_request_bits_writedata <= imem.io_bus_request_bits_writedata @[base-memory-components.scala 16:26]
    mem.io_imem_request_bits_operation <= imem.io_bus_request_bits_operation @[base-memory-components.scala 16:26]
    mem.io_dmem_request_valid <= dmem.io_bus_request_valid @[base-memory-components.scala 19:26]
    mem.io_dmem_request_bits_address <= dmem.io_bus_request_bits_address @[base-memory-components.scala 19:26]
    mem.io_dmem_request_bits_writedata <= dmem.io_bus_request_bits_writedata @[base-memory-components.scala 19:26]
    mem.io_dmem_request_bits_operation <= dmem.io_bus_request_bits_operation @[base-memory-components.scala 19:26]
    imem.clock <= clock
    imem.reset <= reset
    imem.io_pipeline_address <= cpu.io_imem_address @[top.scala 23:15]
    imem.io_pipeline_valid <= cpu.io_imem_valid @[top.scala 23:15]
    imem.io_bus_request_ready <= mem.io_imem_request_ready @[base-memory-components.scala 16:26]
    imem.io_bus_response_valid <= mem.io_imem_response_valid @[base-memory-components.scala 17:26]
    imem.io_bus_response_bits_data <= mem.io_imem_response_bits_data @[base-memory-components.scala 17:26]
    dmem.clock <= clock
    dmem.reset <= reset
    dmem.io_pipeline_address <= cpu.io_dmem_address @[top.scala 24:15]
    dmem.io_pipeline_valid <= cpu.io_dmem_valid @[top.scala 24:15]
    dmem.io_pipeline_writedata <= cpu.io_dmem_writedata @[top.scala 24:15]
    dmem.io_pipeline_memread <= cpu.io_dmem_memread @[top.scala 24:15]
    dmem.io_pipeline_memwrite <= cpu.io_dmem_memwrite @[top.scala 24:15]
    dmem.io_pipeline_maskmode <= cpu.io_dmem_maskmode @[top.scala 24:15]
    dmem.io_pipeline_sext <= cpu.io_dmem_sext @[top.scala 24:15]
    dmem.io_bus_request_ready <= mem.io_dmem_request_ready @[base-memory-components.scala 19:26]
    dmem.io_bus_response_valid <= mem.io_dmem_response_valid @[base-memory-components.scala 20:26]
    dmem.io_bus_response_bits_data <= mem.io_dmem_response_bits_data @[base-memory-components.scala 20:26]
