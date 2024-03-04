package SC

import chisel3._
import chisel3.util._
    
class Data_Memory extends Module {
    val io= IO(new Bundle{
    val Data_Mem_address = Input(UInt(32.W))
    val Data_Mem_data = Input(SInt(32.W))
    val Data_Mem_write = Input(Bool())
    val Data_Mem_read = Input(Bool())
    val Data_Mem_output = Output(SInt(32.W))
})

    val Memory = Mem(1024, SInt(32.W))

    when(io.Data_Mem_write){
        Memory.write(io.Data_Mem_address,io.Data_Mem_data)
    }
    when(io.Data_Mem_read){
        io.Data_Mem_output := Memory.read(io.Data_Mem_address)
    }

    .otherwise{
        io.Data_Mem_output := DontCare
    }




}




