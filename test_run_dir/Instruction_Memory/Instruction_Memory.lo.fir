circuit Instruction_Memory :
  module Instruction_Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_memory_address : UInt<32>
    output io_memory_instruction : UInt<32>

    mem mem : @[Instruction-Memory.scala 15:16]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_memory_instruction_MPORT
      read-under-write => undefined
    node _io_memory_instruction_T = bits(io_memory_address, 9, 0) @[Instruction-Memory.scala 18:29]
    io_memory_instruction <= mem.io_memory_instruction_MPORT.data @[Instruction-Memory.scala 18:24]
    mem.io_memory_instruction_MPORT.addr <= _io_memory_instruction_T @[Instruction-Memory.scala 18:29]
    mem.io_memory_instruction_MPORT.en <= UInt<1>("h1") @[Instruction-Memory.scala 18:29]
    mem.io_memory_instruction_MPORT.clk <= clock @[Instruction-Memory.scala 18:29]
