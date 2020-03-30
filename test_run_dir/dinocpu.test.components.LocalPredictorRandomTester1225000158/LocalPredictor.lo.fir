circuit LocalPredictor :
  module LocalPredictor :
    input clock : Clock
    input reset : UInt<1>
    input io_pc : UInt<32>
    input io_update : UInt<1>
    input io_taken : UInt<1>
    output io_prediction : UInt<1>
  
    reg predictionTable_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), predictionTable_0) @[branchpred.scala 37:32]
    reg predictionTable_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), predictionTable_1) @[branchpred.scala 37:32]
    reg lastBranch : UInt<2>, clock with :
      reset => (UInt<1>("h0"), lastBranch) @[branchpred.scala 79:23]
    node _T_1 = or(lastBranch, UInt<1>("h0"))
    node _T_2 = bits(_T_1, 0, 0)
    node _GEN_0 = validif(eq(UInt<1>("h0"), _T_2), predictionTable_0) @[branchpred.scala 42:19]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_2), predictionTable_1, _GEN_0) @[branchpred.scala 42:19]
    node _predictionTable_T_2 = _GEN_1 @[branchpred.scala 42:19 branchpred.scala 42:19 branchpred.scala 42:19]
    node _T_3 = neq(_predictionTable_T_2, UInt<1>("h1")) @[branchpred.scala 42:19]
    node _predictionTable_T_2_0 = _GEN_1 @[branchpred.scala 43:26 branchpred.scala 43:26 branchpred.scala 43:26]
    node _T_4 = add(_predictionTable_T_2_0, UInt<1>("h1")) @[branchpred.scala 43:26]
    node _T_5 = tail(_T_4, 1) @[branchpred.scala 43:26]
    node _predictionTable_T_2_1 = _T_5 @[branchpred.scala 43:15 branchpred.scala 43:15]
    node _GEN_2 = mux(eq(UInt<1>("h0"), _T_2), _predictionTable_T_2_1, predictionTable_0) @[branchpred.scala 43:15]
    node _GEN_3 = mux(eq(UInt<1>("h1"), _T_2), _predictionTable_T_2_1, predictionTable_1) @[branchpred.scala 43:15]
    node _GEN_4 = mux(_T_3, _GEN_2, predictionTable_0) @[branchpred.scala 42:30]
    node _GEN_5 = mux(_T_3, _GEN_3, predictionTable_1) @[branchpred.scala 42:30]
    node _T_6 = or(lastBranch, UInt<1>("h0"))
    node _T_7 = bits(_T_6, 0, 0)
    node _GEN_6 = validif(eq(UInt<1>("h0"), _T_7), predictionTable_0) @[branchpred.scala 49:19]
    node _GEN_7 = mux(eq(UInt<1>("h1"), _T_7), predictionTable_1, _GEN_6) @[branchpred.scala 49:19]
    node _predictionTable_T_7 = _GEN_7 @[branchpred.scala 49:19 branchpred.scala 49:19 branchpred.scala 49:19]
    node _T_8 = neq(_predictionTable_T_7, UInt<1>("h0")) @[branchpred.scala 49:19]
    node _predictionTable_T_7_0 = _GEN_7 @[branchpred.scala 50:26 branchpred.scala 50:26 branchpred.scala 50:26]
    node _T_9 = sub(_predictionTable_T_7_0, UInt<1>("h1")) @[branchpred.scala 50:26]
    node _T_10 = tail(_T_9, 1) @[branchpred.scala 50:26]
    node _predictionTable_T_7_1 = _T_10 @[branchpred.scala 50:15 branchpred.scala 50:15]
    node _GEN_8 = mux(eq(UInt<1>("h0"), _T_7), _predictionTable_T_7_1, predictionTable_0) @[branchpred.scala 50:15]
    node _GEN_9 = mux(eq(UInt<1>("h1"), _T_7), _predictionTable_T_7_1, predictionTable_1) @[branchpred.scala 50:15]
    node _GEN_10 = mux(_T_8, _GEN_8, predictionTable_0) @[branchpred.scala 49:28]
    node _GEN_11 = mux(_T_8, _GEN_9, predictionTable_1) @[branchpred.scala 49:28]
    node _GEN_12 = mux(io_taken, _GEN_4, _GEN_10) @[branchpred.scala 82:21]
    node _GEN_13 = mux(io_taken, _GEN_5, _GEN_11) @[branchpred.scala 82:21]
    node _GEN_14 = mux(io_update, _GEN_12, predictionTable_0) @[branchpred.scala 81:20]
    node _GEN_15 = mux(io_update, _GEN_13, predictionTable_1) @[branchpred.scala 81:20]
    node tableIndex = bits(io_pc, 3, 2) @[branchpred.scala 91:25]
    node _T_11 = bits(tableIndex, 0, 0)
    node _GEN_16 = validif(eq(UInt<1>("h0"), _T_11), predictionTable_0) @[branchpred.scala 94:47]
    node _GEN_17 = mux(eq(UInt<1>("h1"), _T_11), predictionTable_1, _GEN_16) @[branchpred.scala 94:47]
    node _predictionTable_T_11 = _GEN_17 @[branchpred.scala 94:47 branchpred.scala 94:47 branchpred.scala 94:47]
    node _T_12 = bits(_predictionTable_T_11, 0, 0) @[branchpred.scala 94:47]
    node _T__0 = UInt<1>("h1") @[branchpred.scala 37:40 branchpred.scala 37:40]
    node _T__1 = UInt<1>("h1") @[branchpred.scala 37:40 branchpred.scala 37:40]
    io_prediction <= _T_12 @[branchpred.scala 94:17]
    predictionTable_0 <= mux(reset, _T__0, _GEN_14) @[branchpred.scala 43:15 branchpred.scala 50:15]
    predictionTable_1 <= mux(reset, _T__1, _GEN_15) @[branchpred.scala 43:15 branchpred.scala 50:15]
    lastBranch <= tableIndex @[branchpred.scala 97:14]
