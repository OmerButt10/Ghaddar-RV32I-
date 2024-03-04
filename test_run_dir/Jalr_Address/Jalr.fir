;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Jalr : 
  module Jalr : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rd : SInt<32>, flip rs1 : SInt<32>, imm : SInt<32>}
    
    node _io_imm_T = add(io.rd, io.rs1) @[Jalr.scala 13:19]
    node _io_imm_T_1 = tail(_io_imm_T, 1) @[Jalr.scala 13:19]
    node _io_imm_T_2 = asSInt(_io_imm_T_1) @[Jalr.scala 13:19]
    node _io_imm_T_3 = and(_io_imm_T_2, asSInt(UInt<37>("h0ffffffffe"))) @[Jalr.scala 13:28]
    node _io_imm_T_4 = asSInt(_io_imm_T_3) @[Jalr.scala 13:28]
    io.imm <= _io_imm_T_4 @[Jalr.scala 13:10]
    
