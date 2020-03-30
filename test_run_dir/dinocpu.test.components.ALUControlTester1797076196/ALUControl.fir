;buildInfoPackage: chisel3, version: 3.2.4, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit ALUControl : 
  module ALUControl : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip aluop : UInt<2>, flip itype : UInt<1>, flip funct7 : UInt<7>, flip funct3 : UInt<3>, operation : UInt<4>}
    
    io.operation <= UInt<4>("h0f") @[alucontrol.scala 62:16]
    
