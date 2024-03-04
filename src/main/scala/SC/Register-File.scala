package SC
import chisel3._
import chisel3.util._
    
class Register_File extends Module {
    val io= IO(new Bundle{
        val ReadReg1 = Input(UInt(5.W))
        val ReadReg2 = Input(UInt(5.W))
        val RegWrite = Input(Bool()) 
        val WriteReg = Input(UInt(5.W))
        val WriteData = Input(SInt(32.W))
        val ReadData1 =Output(SInt(32.W))
        val ReadData2 =Output(SInt(32.W))
    }
)
    val Reg_File = RegInit(VecInit(Seq.fill(32)(0.S(32.W))))


    io.ReadData1 := Reg_File(io.ReadReg1)
    io.ReadData2 := Reg_File(io.ReadReg2)

    when(io.RegWrite){
        Reg_File(io.WriteReg) := io.WriteData
    }
    Reg_File(0) := 0.S

}
