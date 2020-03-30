;buildInfoPackage: chisel3, version: 3.2.4, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit GlobalHistoryPredictor : 
  module GlobalHistoryPredictor : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc : UInt<32>, flip update : UInt<1>, flip taken : UInt<1>, prediction : UInt<1>}
    
    wire _T : UInt<2>[4] @[branchpred.scala 37:40]
    _T[0] <= UInt<2>("h02") @[branchpred.scala 37:40]
    _T[1] <= UInt<2>("h02") @[branchpred.scala 37:40]
    _T[2] <= UInt<2>("h02") @[branchpred.scala 37:40]
    _T[3] <= UInt<2>("h02") @[branchpred.scala 37:40]
    reg predictionTable : UInt<2>[4], clock with : (reset => (reset, _T)) @[branchpred.scala 37:32]
    reg history : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[branchpred.scala 108:24]
    node curhist = bits(history, 2, 0) @[branchpred.scala 110:24]
    when io.update : @[branchpred.scala 111:19]
      when io.taken : @[branchpred.scala 114:21]
        node _T_1 = bits(curhist, 1, 0)
        node _T_2 = neq(predictionTable[_T_1], UInt<2>("h03")) @[branchpred.scala 42:19]
        when _T_2 : @[branchpred.scala 42:30]
          node _T_3 = add(predictionTable[_T_1], UInt<1>("h01")) @[branchpred.scala 43:26]
          node _T_4 = tail(_T_3, 1) @[branchpred.scala 43:26]
          predictionTable[_T_1] <= _T_4 @[branchpred.scala 43:15]
          skip @[branchpred.scala 42:30]
        skip @[branchpred.scala 114:21]
      else : @[branchpred.scala 116:18]
        node _T_5 = bits(curhist, 1, 0)
        node _T_6 = neq(predictionTable[_T_5], UInt<1>("h00")) @[branchpred.scala 49:19]
        when _T_6 : @[branchpred.scala 49:28]
          node _T_7 = sub(predictionTable[_T_5], UInt<1>("h01")) @[branchpred.scala 50:26]
          node _T_8 = tail(_T_7, 1) @[branchpred.scala 50:26]
          predictionTable[_T_5] <= _T_8 @[branchpred.scala 50:15]
          skip @[branchpred.scala 49:28]
        skip @[branchpred.scala 116:18]
      node _T_9 = cat(curhist, io.taken) @[Cat.scala 29:58]
      history <= _T_9 @[branchpred.scala 120:13]
      skip @[branchpred.scala 111:19]
    node _T_10 = bits(curhist, 1, 0)
    node _T_11 = bits(predictionTable[_T_10], 1, 1) @[branchpred.scala 123:44]
    io.prediction <= _T_11 @[branchpred.scala 123:17]
    
