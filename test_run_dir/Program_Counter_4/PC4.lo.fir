circuit PC4 :
  module PC4 :
    input clock : Clock
    input reset : UInt<1>
    input io_pc4 : UInt<32>
    output io_pc4_Out : UInt<32>

    reg pc_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_reg) @[Program-Counter-4.scala 15:21]
    node _pc_reg_T = add(io_pc4, UInt<3>("h4")) @[Program-Counter-4.scala 16:22]
    node _pc_reg_T_1 = tail(_pc_reg_T, 1) @[Program-Counter-4.scala 16:22]
    io_pc4_Out <= pc_reg @[Program-Counter-4.scala 18:16]
    pc_reg <= _pc_reg_T_1 @[Program-Counter-4.scala 16:12]
