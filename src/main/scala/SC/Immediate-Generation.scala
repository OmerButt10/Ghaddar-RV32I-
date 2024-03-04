package SC
import chisel3._
import chisel3.util._
    
class LM_IO_Interface_ImmdValGen extends Bundle {
    val Imm_instr = Input ( SInt (32. W ) )
    val immd_se_I = Output ( SInt (32. W ) )
    val immd_se_U = Output ( SInt (32. W ) )
    val immd_se_UJ = Output ( SInt (32. W ) )
    val immd_se_S = Output ( SInt (32. W ) )
    val immd_se_SB = Output ( SInt (32. W ) )
    
    //val filledArray=Input(UInt(32.W))
}

class ImmdValGen extends Module {
    val io = IO ( new LM_IO_Interface_ImmdValGen )

    when(
    (io.Imm_instr(6,0) === "b0011011".U) ||
    (io.Imm_instr(6,0) === "b0000011".U) ||
    (io.Imm_instr(6,0) === "b0001111".U) ||
    (io.Imm_instr(6,0) === "b0011011".U) ||
    (io.Imm_instr(6,0) === "b1100111".U) ||
    (io.Imm_instr(6,0) === "b1110011".U)
    //I-Type
    )
  {
    io.immd_se_I:= 0.S | io.Imm_instr(31,20).asSInt()
    io.immd_se_U:=DontCare
    io.immd_se_UJ:=DontCare
    io.immd_se_S:=DontCare
    io.immd_se_SB:=DontCare
  }
  .elsewhen(
    (io.Imm_instr(6,0) === "b0010111".U) ||
    (io.Imm_instr(6,0) === "b0110111".U)
    //U-Type
     ) 
  {
    io.immd_se_U:=0.S | io.Imm_instr(31,12).asSInt()
    io.immd_se_I:=DontCare
    io.immd_se_UJ:=DontCare
    io.immd_se_S:=DontCare
    io.immd_se_SB:=DontCare
  }
  .elsewhen(
    (io.Imm_instr(6,0) === "b1101111".U)
    //UJ-Type
     ) 
  {
    io.immd_se_UJ := - Cat(io.Imm_instr(31), io.Imm_instr(19, 12), io.Imm_instr(20), io.Imm_instr(30, 21),0.U).asSInt()
    io.immd_se_U:=DontCare
    io.immd_se_I:=DontCare
    io.immd_se_S:=DontCare
    io.immd_se_SB:=DontCare
  }


  .elsewhen(
    (io.Imm_instr(6,0) === "b0100011".U) ||
    (io.Imm_instr(6,0) === "b1100011".U)
    //S-Type 
    ) 
  {
    io.immd_se_S:=0.S | io.Imm_instr(31,22).asSInt()
    io.immd_se_U:=DontCare
    io.immd_se_UJ:=DontCare
    io.immd_se_I:=DontCare
    io.immd_se_SB:=DontCare

  }
  .elsewhen(
    (io.Imm_instr(6,0) === "b1100011".U)
    //SB-Type 
    ) 
  {
    io.immd_se_SB:=0.S | io.Imm_instr(31,22).asSInt()
    io.immd_se_U:=DontCare
    io.immd_se_UJ:=DontCare
    io.immd_se_S:=DontCare
    io.immd_se_I:=DontCare

  }
  .otherwise{
      io.immd_se_I:=DontCare
      io.immd_se_U:=DontCare
      io.immd_se_UJ:=DontCare
      io.immd_se_S:=DontCare
      io.immd_se_SB:=DontCare

  }
}