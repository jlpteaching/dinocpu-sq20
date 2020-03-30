circuit GlobalHistoryPredictor :
  module GlobalHistoryPredictor :
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
    reg history : UInt<3>, clock with :
      reset => (UInt<1>("h0"), history) @[branchpred.scala 108:24]
    node curhist = bits(history, 2, 0) @[branchpred.scala 110:24]
    node _T_1 = bits(curhist, 1, 0)
    node _GEN_0 = validif(eq(UInt<1>("h0"), _T_1), predictionTable_0) @[branchpred.scala 42:19]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T_1), predictionTable_1, _GEN_0) @[branchpred.scala 42:19]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _T_1), predictionTable_2, _GEN_1) @[branchpred.scala 42:19]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _T_1), predictionTable_3, _GEN_2) @[branchpred.scala 42:19]
    node _predictionTable_T_1 = _GEN_3 @[branchpred.scala 42:19 branchpred.scala 42:19 branchpred.scala 42:19 branchpred.scala 42:19 branchpred.scala 42:19]
    node _T_2 = neq(_predictionTable_T_1, UInt<2>("h3")) @[branchpred.scala 42:19]
    node _predictionTable_T_1_0 = _GEN_3 @[branchpred.scala 43:26 branchpred.scala 43:26 branchpred.scala 43:26 branchpred.scala 43:26 branchpred.scala 43:26]
    node _T_3 = add(_predictionTable_T_1_0, UInt<1>("h1")) @[branchpred.scala 43:26]
    node _T_4 = tail(_T_3, 1) @[branchpred.scala 43:26]
    node _predictionTable_T_1_1 = _T_4 @[branchpred.scala 43:15 branchpred.scala 43:15]
    node _GEN_4 = mux(eq(UInt<1>("h0"), _T_1), _predictionTable_T_1_1, predictionTable_0) @[branchpred.scala 43:15]
    node _GEN_5 = mux(eq(UInt<1>("h1"), _T_1), _predictionTable_T_1_1, predictionTable_1) @[branchpred.scala 43:15]
    node _GEN_6 = mux(eq(UInt<2>("h2"), _T_1), _predictionTable_T_1_1, predictionTable_2) @[branchpred.scala 43:15]
    node _GEN_7 = mux(eq(UInt<2>("h3"), _T_1), _predictionTable_T_1_1, predictionTable_3) @[branchpred.scala 43:15]
    node _GEN_8 = mux(_T_2, _GEN_4, predictionTable_0) @[branchpred.scala 42:30]
    node _GEN_9 = mux(_T_2, _GEN_5, predictionTable_1) @[branchpred.scala 42:30]
    node _GEN_10 = mux(_T_2, _GEN_6, predictionTable_2) @[branchpred.scala 42:30]
    node _GEN_11 = mux(_T_2, _GEN_7, predictionTable_3) @[branchpred.scala 42:30]
    node _T_5 = bits(curhist, 1, 0)
    node _GEN_12 = validif(eq(UInt<1>("h0"), _T_5), predictionTable_0) @[branchpred.scala 49:19]
    node _GEN_13 = mux(eq(UInt<1>("h1"), _T_5), predictionTable_1, _GEN_12) @[branchpred.scala 49:19]
    node _GEN_14 = mux(eq(UInt<2>("h2"), _T_5), predictionTable_2, _GEN_13) @[branchpred.scala 49:19]
    node _GEN_15 = mux(eq(UInt<2>("h3"), _T_5), predictionTable_3, _GEN_14) @[branchpred.scala 49:19]
    node _predictionTable_T_5 = _GEN_15 @[branchpred.scala 49:19 branchpred.scala 49:19 branchpred.scala 49:19 branchpred.scala 49:19 branchpred.scala 49:19]
    node _T_6 = neq(_predictionTable_T_5, UInt<1>("h0")) @[branchpred.scala 49:19]
    node _predictionTable_T_5_0 = _GEN_15 @[branchpred.scala 50:26 branchpred.scala 50:26 branchpred.scala 50:26 branchpred.scala 50:26 branchpred.scala 50:26]
    node _T_7 = sub(_predictionTable_T_5_0, UInt<1>("h1")) @[branchpred.scala 50:26]
    node _T_8 = tail(_T_7, 1) @[branchpred.scala 50:26]
    node _predictionTable_T_5_1 = _T_8 @[branchpred.scala 50:15 branchpred.scala 50:15]
    node _GEN_16 = mux(eq(UInt<1>("h0"), _T_5), _predictionTable_T_5_1, predictionTable_0) @[branchpred.scala 50:15]
    node _GEN_17 = mux(eq(UInt<1>("h1"), _T_5), _predictionTable_T_5_1, predictionTable_1) @[branchpred.scala 50:15]
    node _GEN_18 = mux(eq(UInt<2>("h2"), _T_5), _predictionTable_T_5_1, predictionTable_2) @[branchpred.scala 50:15]
    node _GEN_19 = mux(eq(UInt<2>("h3"), _T_5), _predictionTable_T_5_1, predictionTable_3) @[branchpred.scala 50:15]
    node _GEN_20 = mux(_T_6, _GEN_16, predictionTable_0) @[branchpred.scala 49:28]
    node _GEN_21 = mux(_T_6, _GEN_17, predictionTable_1) @[branchpred.scala 49:28]
    node _GEN_22 = mux(_T_6, _GEN_18, predictionTable_2) @[branchpred.scala 49:28]
    node _GEN_23 = mux(_T_6, _GEN_19, predictionTable_3) @[branchpred.scala 49:28]
    node _GEN_24 = mux(io_taken, _GEN_8, _GEN_20) @[branchpred.scala 114:21]
    node _GEN_25 = mux(io_taken, _GEN_9, _GEN_21) @[branchpred.scala 114:21]
    node _GEN_26 = mux(io_taken, _GEN_10, _GEN_22) @[branchpred.scala 114:21]
    node _GEN_27 = mux(io_taken, _GEN_11, _GEN_23) @[branchpred.scala 114:21]
    node _T_9 = cat(curhist, io_taken) @[Cat.scala 29:58]
    node _GEN_28 = mux(io_update, _GEN_24, predictionTable_0) @[branchpred.scala 111:19]
    node _GEN_29 = mux(io_update, _GEN_25, predictionTable_1) @[branchpred.scala 111:19]
    node _GEN_30 = mux(io_update, _GEN_26, predictionTable_2) @[branchpred.scala 111:19]
    node _GEN_31 = mux(io_update, _GEN_27, predictionTable_3) @[branchpred.scala 111:19]
    node _GEN_32 = mux(io_update, _T_9, history) @[branchpred.scala 111:19]
    node _T_10 = bits(curhist, 1, 0)
    node _GEN_33 = validif(eq(UInt<1>("h0"), _T_10), predictionTable_0) @[branchpred.scala 123:44]
    node _GEN_34 = mux(eq(UInt<1>("h1"), _T_10), predictionTable_1, _GEN_33) @[branchpred.scala 123:44]
    node _GEN_35 = mux(eq(UInt<2>("h2"), _T_10), predictionTable_2, _GEN_34) @[branchpred.scala 123:44]
    node _GEN_36 = mux(eq(UInt<2>("h3"), _T_10), predictionTable_3, _GEN_35) @[branchpred.scala 123:44]
    node _predictionTable_T_10 = _GEN_36 @[branchpred.scala 123:44 branchpred.scala 123:44 branchpred.scala 123:44 branchpred.scala 123:44 branchpred.scala 123:44]
    node _T_11 = bits(_predictionTable_T_10, 1, 1) @[branchpred.scala 123:44]
    node _T__0 = UInt<2>("h2") @[branchpred.scala 37:40 branchpred.scala 37:40]
    node _T__1 = UInt<2>("h2") @[branchpred.scala 37:40 branchpred.scala 37:40]
    node _T__2 = UInt<2>("h2") @[branchpred.scala 37:40 branchpred.scala 37:40]
    node _T__3 = UInt<2>("h2") @[branchpred.scala 37:40 branchpred.scala 37:40]
    io_prediction <= _T_11 @[branchpred.scala 123:17]
    predictionTable_0 <= mux(reset, _T__0, _GEN_28) @[branchpred.scala 43:15 branchpred.scala 50:15]
    predictionTable_1 <= mux(reset, _T__1, _GEN_29) @[branchpred.scala 43:15 branchpred.scala 50:15]
    predictionTable_2 <= mux(reset, _T__2, _GEN_30) @[branchpred.scala 43:15 branchpred.scala 50:15]
    predictionTable_3 <= mux(reset, _T__3, _GEN_31) @[branchpred.scala 43:15 branchpred.scala 50:15]
    history <= mux(reset, UInt<3>("h0"), bits(_GEN_32, 2, 0)) @[branchpred.scala 120:13]
