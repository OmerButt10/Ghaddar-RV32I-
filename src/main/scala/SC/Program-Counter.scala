package SC

import chisel3._
import chisel3.util._

class PC extends Module {
    val io = IO ( new Bundle {
    val pc = Input(SInt(32.W))
    val pc1 = Output(SInt(32.W))
    val pc4 = Output(SInt(32.W))


    })


    
    val pc_reg = RegInit(0.S(32.W))
    pc_reg := io.pc

    io.pc1 := pc_reg
    io.pc4 := pc_reg + 4.S

  

  

}