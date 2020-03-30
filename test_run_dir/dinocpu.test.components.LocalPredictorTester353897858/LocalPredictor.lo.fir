circuit LocalPredictor :
  module LocalPredictor :
    input clock : Clock
    input reset : UInt<1>
    input io_pc : UInt<32>
    input io_update : UInt<1>
    input io_taken : UInt<1>
    output io_prediction : UInt<1>
  
    reg predictionTable_0 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), predictionTable_0) @[branchpred.scala 37:32]
    reg predictionTable_1 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), predictionTable_1) @[branchpred.scala 37:32]
    reg predictionTable_2 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), predictionTable_2) @[branchpred.scala 37:32]
    reg predictionTable_3 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), predictionTable_3) @[branchpred.scala 37:32]
    reg predictionTable_4 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), predictionTable_4) @[branchpred.scala 37:32]
    reg lastBranch : UInt<3>, clock with :
      reset => (UInt<1>("h0"), lastBranch) @[branchpred.scala 79:23]
    node _T_1 = or(lastBranch, UInt<3>("h0"))
    node _T_2 = bits(_T_1, 2, 0)
    node _GEN_0 = validif(eq(UInt<1>("h0"), _T_2), predictionTable_0) @[branchpred.scala 42:19]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_2), predictionTable_1, _GEN_0) @[branchpred.scala 42:19]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _T_2), predictionTable_2, _GEN_1) @[branchpred.scala 42:19]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _T_2), predictionTable_3, _GEN_2) @[branchpred.scala 42:19]
    node _GEN_4 = mux(eq(UInt<3>("h4"), _T_2), predictionTable_4, _GEN_3) @[branchpred.scala 42:19]
    node _predictionTable_T_2 = _GEN_4 @[branchpred.scala 42:19 branchpred.scala 42:19 branchpred.scala 42:19 branchpred.scala 42:19 branchpred.scala 42:19 branchpred.scala 42:19]
    node _T_3 = neq(_predictionTable_T_2, UInt<2>("h3")) @[branchpred.scala 42:19]
    node _predictionTable_T_2_0 = _GEN_4 @[branchpred.scala 43:26 branchpred.scala 43:26 branchpred.scala 43:26 branchpred.scala 43:26 branchpred.scala 43:26 branchpred.scala 43:26]
    node _T_4 = add(_predictionTable_T_2_0, UInt<1>("h1")) @[branchpred.scala 43:26]
    node _T_5 = tail(_T_4, 1) @[branchpred.scala 43:26]
    node _predictionTable_T_2_1 = _T_5 @[branchpred.scala 43:15 branchpred.scala 43:15]
    node _GEN_5 = mux(eq(UInt<1>("h0"), _T_2), _predictionTable_T_2_1, predictionTable_0) @[branchpred.scala 43:15]
    node _GEN_6 = mux(eq(UInt<1>("h1"), _T_2), _predictionTable_T_2_1, predictionTable_1) @[branchpred.scala 43:15]
    node _GEN_7 = mux(eq(UInt<2>("h2"), _T_2), _predictionTable_T_2_1, predictionTable_2) @[branchpred.scala 43:15]
    node _GEN_8 = mux(eq(UInt<2>("h3"), _T_2), _predictionTable_T_2_1, predictionTable_3) @[branchpred.scala 43:15]
    node _GEN_9 = mux(eq(UInt<3>("h4"), _T_2), _predictionTable_T_2_1, predictionTable_4) @[branchpred.scala 43:15]
    node _GEN_10 = mux(_T_3, _GEN_5, predictionTable_0) @[branchpred.scala 42:30]
    node _GEN_11 = mux(_T_3, _GEN_6, predictionTable_1) @[branchpred.scala 42:30]
    node _GEN_12 = mux(_T_3, _GEN_7, predictionTable_2) @[branchpred.scala 42:30]
    node _GEN_13 = mux(_T_3, _GEN_8, predictionTable_3) @[branchpred.scala 42:30]
    node _GEN_14 = mux(_T_3, _GEN_9, predictionTable_4) @[branchpred.scala 42:30]
    node _T_6 = or(lastBranch, UInt<3>("h0"))
    node _T_7 = bits(_T_6, 2, 0)
    node _GEN_15 = validif(eq(UInt<1>("h0"), _T_7), predictionTable_0) @[branchpred.scala 49:19]
    node _GEN_16 = mux(eq(UInt<1>("h1"), _T_7), predictionTable_1, _GEN_15) @[branchpred.scala 49:19]
    node _GEN_17 = mux(eq(UInt<2>("h2"), _T_7), predictionTable_2, _GEN_16) @[branchpred.scala 49:19]
    node _GEN_18 = mux(eq(UInt<2>("h3"), _T_7), predictionTable_3, _GEN_17) @[branchpred.scala 49:19]
    node _GEN_19 = mux(eq(UInt<3>("h4"), _T_7), predictionTable_4, _GEN_18) @[branchpred.scala 49:19]
    node _predictionTable_T_7 = _GEN_19 @[branchpred.scala 49:19 branchpred.scala 49:19 branchpred.scala 49:19 branchpred.scala 49:19 branchpred.scala 49:19 branchpred.scala 49:19]
    node _T_8 = neq(_predictionTable_T_7, UInt<1>("h0")) @[branchpred.scala 49:19]
    node _predictionTable_T_7_0 = _GEN_19 @[branchpred.scala 50:26 branchpred.scala 50:26 branchpred.scala 50:26 branchpred.scala 50:26 branchpred.scala 50:26 branchpred.scala 50:26]
    node _T_9 = sub(_predictionTable_T_7_0, UInt<1>("h1")) @[branchpred.scala 50:26]
    node _T_10 = tail(_T_9, 1) @[branchpred.scala 50:26]
    node _predictionTable_T_7_1 = _T_10 @[branchpred.scala 50:15 branchpred.scala 50:15]
    node _GEN_20 = mux(eq(UInt<1>("h0"), _T_7), _predictionTable_T_7_1, predictionTable_0) @[branchpred.scala 50:15]
    node _GEN_21 = mux(eq(UInt<1>("h1"), _T_7), _predictionTable_T_7_1, predictionTable_1) @[branchpred.scala 50:15]
    node _GEN_22 = mux(eq(UInt<2>("h2"), _T_7), _predictionTable_T_7_1, predictionTable_2) @[branchpred.scala 50:15]
    node _GEN_23 = mux(eq(UInt<2>("h3"), _T_7), _predictionTable_T_7_1, predictionTable_3) @[branchpred.scala 50:15]
    node _GEN_24 = mux(eq(UInt<3>("h4"), _T_7), _predictionTable_T_7_1, predictionTable_4) @[branchpred.scala 50:15]
    node _GEN_25 = mux(_T_8, _GEN_20, predictionTable_0) @[branchpred.scala 49:28]
    node _GEN_26 = mux(_T_8, _GEN_21, predictionTable_1) @[branchpred.scala 49:28]
    node _GEN_27 = mux(_T_8, _GEN_22, predictionTable_2) @[branchpred.scala 49:28]
    node _GEN_28 = mux(_T_8, _GEN_23, predictionTable_3) @[branchpred.scala 49:28]
    node _GEN_29 = mux(_T_8, _GEN_24, predictionTable_4) @[branchpred.scala 49:28]
    node _GEN_30 = mux(io_taken, _GEN_10, _GEN_25) @[branchpred.scala 82:21]
    node _GEN_31 = mux(io_taken, _GEN_11, _GEN_26) @[branchpred.scala 82:21]
    node _GEN_32 = mux(io_taken, _GEN_12, _GEN_27) @[branchpred.scala 82:21]
    node _GEN_33 = mux(io_taken, _GEN_13, _GEN_28) @[branchpred.scala 82:21]
    node _GEN_34 = mux(io_taken, _GEN_14, _GEN_29) @[branchpred.scala 82:21]
    node _GEN_35 = mux(io_update, _GEN_30, predictionTable_0) @[branchpred.scala 81:20]
    node _GEN_36 = mux(io_update, _GEN_31, predictionTable_1) @[branchpred.scala 81:20]
    node _GEN_37 = mux(io_update, _GEN_32, predictionTable_2) @[branchpred.scala 81:20]
    node _GEN_38 = mux(io_update, _GEN_33, predictionTable_3) @[branchpred.scala 81:20]
    node _GEN_39 = mux(io_update, _GEN_34, predictionTable_4) @[branchpred.scala 81:20]
    node tableIndex = bits(io_pc, 4, 2) @[branchpred.scala 91:25]
    node _GEN_40 = validif(eq(UInt<1>("h0"), tableIndex), predictionTable_0) @[branchpred.scala 94:47]
    node _GEN_41 = mux(eq(UInt<1>("h1"), tableIndex), predictionTable_1, _GEN_40) @[branchpred.scala 94:47]
    node _GEN_42 = mux(eq(UInt<2>("h2"), tableIndex), predictionTable_2, _GEN_41) @[branchpred.scala 94:47]
    node _GEN_43 = mux(eq(UInt<2>("h3"), tableIndex), predictionTable_3, _GEN_42) @[branchpred.scala 94:47]
    node _GEN_44 = mux(eq(UInt<3>("h4"), tableIndex), predictionTable_4, _GEN_43) @[branchpred.scala 94:47]
    node _predictionTable_tableIndex = _GEN_44 @[branchpred.scala 94:47 branchpred.scala 94:47 branchpred.scala 94:47 branchpred.scala 94:47 branchpred.scala 94:47 branchpred.scala 94:47]
    node _T_11 = bits(_predictionTable_tableIndex, 1, 1) @[branchpred.scala 94:47]
    node _T__0 = UInt<2>("h2") @[branchpred.scala 37:40 branchpred.scala 37:40]
    node _T__1 = UInt<2>("h2") @[branchpred.scala 37:40 branchpred.scala 37:40]
    node _T__2 = UInt<2>("h2") @[branchpred.scala 37:40 branchpred.scala 37:40]
    node _T__3 = UInt<2>("h2") @[branchpred.scala 37:40 branchpred.scala 37:40]
    node _T__4 = UInt<2>("h2") @[branchpred.scala 37:40 branchpred.scala 37:40]
    io_prediction <= _T_11 @[branchpred.scala 94:17]
    predictionTable_0 <= mux(reset, _T__0, _GEN_35) @[branchpred.scala 43:15 branchpred.scala 50:15]
    predictionTable_1 <= mux(reset, _T__1, _GEN_36) @[branchpred.scala 43:15 branchpred.scala 50:15]
    predictionTable_2 <= mux(reset, _T__2, _GEN_37) @[branchpred.scala 43:15 branchpred.scala 50:15]
    predictionTable_3 <= mux(reset, _T__3, _GEN_38) @[branchpred.scala 43:15 branchpred.scala 50:15]
    predictionTable_4 <= mux(reset, _T__4, _GEN_39) @[branchpred.scala 43:15 branchpred.scala 50:15]
    lastBranch <= tableIndex @[branchpred.scala 97:14]
