;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit PC : 
  module PC : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc : SInt<32>, pc1 : SInt<32>, pc4 : SInt<32>}
    
    reg pc_reg : SInt<32>, clock with : (reset => (reset, asSInt(UInt<32>("h00")))) @[Program-Counter.scala 17:25]
    pc_reg <= io.pc @[Program-Counter.scala 18:12]
    io.pc1 <= pc_reg @[Program-Counter.scala 20:12]
    node _io_pc4_T = add(pc_reg, asSInt(UInt<4>("h04"))) @[Program-Counter.scala 21:22]
    node _io_pc4_T_1 = tail(_io_pc4_T, 1) @[Program-Counter.scala 21:22]
    node _io_pc4_T_2 = asSInt(_io_pc4_T_1) @[Program-Counter.scala 21:22]
    io.pc4 <= _io_pc4_T_2 @[Program-Counter.scala 21:12]
    
