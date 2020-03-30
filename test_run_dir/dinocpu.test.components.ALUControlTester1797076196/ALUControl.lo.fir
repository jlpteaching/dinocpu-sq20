circuit ALUControl :
  module ALUControl :
    input clock : Clock
    input reset : UInt<1>
    input io_aluop : UInt<2>
    input io_itype : UInt<1>
    input io_funct7 : UInt<7>
    input io_funct3 : UInt<3>
    output io_operation : UInt<4>
  
    io_operation <= UInt<4>("hf") @[alucontrol.scala 62:16]
