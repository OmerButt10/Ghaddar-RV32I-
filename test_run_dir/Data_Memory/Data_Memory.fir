;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Data_Memory : 
  module Data_Memory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip Data_Mem_address : UInt<32>, flip Data_Mem_data : SInt<32>, flip Data_Mem_write : UInt<1>, flip Data_Mem_read : UInt<1>, Data_Mem_output : SInt<32>}
    
    cmem Memory : SInt<32>[1024] @[Data-Memory.scala 15:21]
    when io.Data_Mem_write : @[Data-Memory.scala 17:28]
      node _T = bits(io.Data_Mem_address, 9, 0)
      write mport MPORT = Memory[_T], clock
      MPORT <= io.Data_Mem_data
      skip @[Data-Memory.scala 17:28]
    when io.Data_Mem_read : @[Data-Memory.scala 20:27]
      node _io_Data_Mem_output_T = bits(io.Data_Mem_address, 9, 0) @[Data-Memory.scala 21:42]
      read mport io_Data_Mem_output_MPORT = Memory[_io_Data_Mem_output_T], clock @[Data-Memory.scala 21:42]
      io.Data_Mem_output <= io_Data_Mem_output_MPORT @[Data-Memory.scala 21:28]
      skip @[Data-Memory.scala 20:27]
    else : @[Data-Memory.scala 24:15]
      io.Data_Mem_output is invalid @[Data-Memory.scala 25:28]
      skip @[Data-Memory.scala 24:15]
    
