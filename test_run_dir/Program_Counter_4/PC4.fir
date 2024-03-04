;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit PC4 : 
  module PC4 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc4 : UInt<32>, pc4_Out : UInt<32>}
    
    reg pc_reg : UInt<32>, clock @[Program-Counter-4.scala 15:21]
    node _pc_reg_T = add(io.pc4, UInt<3>("h04")) @[Program-Counter-4.scala 16:22]
    node _pc_reg_T_1 = tail(_pc_reg_T, 1) @[Program-Counter-4.scala 16:22]
    pc_reg <= _pc_reg_T_1 @[Program-Counter-4.scala 16:12]
    io.pc4_Out <= pc_reg @[Program-Counter-4.scala 18:16]
    
