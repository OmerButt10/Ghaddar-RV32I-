package SC

import org.scalatest._ 
import chiseltest._ 
import chisel3._ 

class Data_Memory_Tester extends FreeSpec with ChiselScalatestTester{
    "Data Memory" in{
        test(new Data_Memory()){
            c => 
            c.io.Data_Mem_address.poke(32.U)
            c.io.Data_Mem_data.poke(32.S)
            c.io.Data_Mem_write.poke(1.B)
            c.io.Data_Mem_read.poke(1.B)
            c.clock.step(100)
        }

    } 

}