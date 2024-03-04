;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Instruction_Memory : 
  module Instruction_Memory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip memory_address : UInt<32>, memory_instruction : UInt<32>}
    
    cmem mem : UInt<32>[1024] @[Instruction-Memory.scala 15:16]
    node _io_memory_instruction_T = bits(io.memory_address, 9, 0) @[Instruction-Memory.scala 18:29]
    infer mport io_memory_instruction_MPORT = mem[_io_memory_instruction_T], clock @[Instruction-Memory.scala 18:29]
    io.memory_instruction <= io_memory_instruction_MPORT @[Instruction-Memory.scala 18:24]
    
