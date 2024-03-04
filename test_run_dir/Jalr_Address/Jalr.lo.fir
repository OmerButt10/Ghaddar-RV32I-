circuit Jalr :
  module Jalr :
    input clock : Clock
    input reset : UInt<1>
    input io_rd : SInt<32>
    input io_rs1 : SInt<32>
    output io_imm : SInt<32>

    node _io_imm_T = add(io_rd, io_rs1) @[Jalr.scala 13:19]
    node _io_imm_T_1 = tail(_io_imm_T, 1) @[Jalr.scala 13:19]
    node _io_imm_T_2 = asSInt(_io_imm_T_1) @[Jalr.scala 13:19]
    node _io_imm_T_3 = and(_io_imm_T_2, asSInt(UInt<37>("hffffffffe"))) @[Jalr.scala 13:28]
    node _io_imm_T_4 = asSInt(_io_imm_T_3) @[Jalr.scala 13:28]
    io_imm <= asSInt(bits(_io_imm_T_4, 31, 0)) @[Jalr.scala 13:10]
