circuit PC :
  module PC :
    input clock : Clock
    input reset : UInt<1>
    input io_pc : SInt<32>
    output io_pc1 : SInt<32>
    output io_pc4 : SInt<32>

    reg pc_reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_reg) @[Program-Counter.scala 17:25]
    node _io_pc4_T = add(pc_reg, asSInt(UInt<4>("h4"))) @[Program-Counter.scala 21:22]
    node _io_pc4_T_1 = tail(_io_pc4_T, 1) @[Program-Counter.scala 21:22]
    node _io_pc4_T_2 = asSInt(_io_pc4_T_1) @[Program-Counter.scala 21:22]
    io_pc1 <= pc_reg @[Program-Counter.scala 20:12]
    io_pc4 <= _io_pc4_T_2 @[Program-Counter.scala 21:12]
    pc_reg <= mux(reset, asSInt(UInt<32>("h0")), io_pc) @[Program-Counter.scala 17:25 Program-Counter.scala 17:25 Program-Counter.scala 18:12]
