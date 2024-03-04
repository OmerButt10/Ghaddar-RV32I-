package SC


import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import scala.io.Source

class Instruction_Memory extends Module {
  val io = IO(new Bundle {
    val memory_address = Input(UInt(32.W)) 
    val memory_instruction = Output(UInt(32.W)) 
  })
  
  val mem = Mem(1024, UInt(32.W)) 

  loadMemoryFromFile( mem, "/home/omer/Single Cycle/Instruction-Memory.txt")
  io.memory_instruction:=mem(io.memory_address)
}



