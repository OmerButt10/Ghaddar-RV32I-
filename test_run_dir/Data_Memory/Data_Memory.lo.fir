circuit Data_Memory :
  module Data_Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_Data_Mem_address : UInt<32>
    input io_Data_Mem_data : SInt<32>
    input io_Data_Mem_write : UInt<1>
    input io_Data_Mem_read : UInt<1>
    output io_Data_Mem_output : SInt<32>

    mem Memory : @[Data-Memory.scala 15:21]
      data-type => SInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_Data_Mem_output_MPORT
      writer => MPORT
      read-under-write => undefined
    node _T = bits(io_Data_Mem_address, 9, 0)
    node _GEN_0 = validif(io_Data_Mem_write, _T) @[Data-Memory.scala 17:28]
    node _GEN_1 = validif(io_Data_Mem_write, clock) @[Data-Memory.scala 17:28]
    node _GEN_2 = mux(io_Data_Mem_write, UInt<1>("h1"), UInt<1>("h0")) @[Data-Memory.scala 17:28 Data-Memory.scala 15:21]
    node _GEN_3 = validif(io_Data_Mem_write, UInt<1>("h1")) @[Data-Memory.scala 17:28]
    node _GEN_4 = validif(io_Data_Mem_write, io_Data_Mem_data) @[Data-Memory.scala 17:28]
    node _io_Data_Mem_output_T = bits(io_Data_Mem_address, 9, 0) @[Data-Memory.scala 21:42]
    node _GEN_5 = validif(io_Data_Mem_read, _io_Data_Mem_output_T) @[Data-Memory.scala 20:27 Data-Memory.scala 21:42]
    node _GEN_6 = validif(io_Data_Mem_read, clock) @[Data-Memory.scala 20:27 Data-Memory.scala 21:42]
    node _GEN_7 = mux(io_Data_Mem_read, UInt<1>("h1"), UInt<1>("h0")) @[Data-Memory.scala 20:27 Data-Memory.scala 21:42 Data-Memory.scala 15:21]
    node _GEN_8 = validif(io_Data_Mem_read, Memory.io_Data_Mem_output_MPORT.data) @[Data-Memory.scala 20:27 Data-Memory.scala 21:28]
    io_Data_Mem_output <= _GEN_8
    Memory.io_Data_Mem_output_MPORT.addr <= _GEN_5
    Memory.io_Data_Mem_output_MPORT.en <= _GEN_7
    Memory.io_Data_Mem_output_MPORT.clk <= _GEN_6
    Memory.MPORT.addr <= _GEN_0
    Memory.MPORT.en <= _GEN_2
    Memory.MPORT.clk <= _GEN_1
    Memory.MPORT.data <= _GEN_4
    Memory.MPORT.mask <= _GEN_3
