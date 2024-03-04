package SC

import chisel3._
import chisel3.util._

class Jalr extends Module {
  val io = IO(new Bundle {
    val rd = Input(SInt(32.W))
    val rs1 = Input(SInt(32.W))
    val imm = Output(SInt(32.W))
  })

  io.imm := (io.rd+io.rs1) & 68719476734L.S


}
