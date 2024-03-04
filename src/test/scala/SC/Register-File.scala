package SC

import org.scalatest._ 
import chiseltest._ 
import chisel3._ 

class Register_File_Tester extends FreeSpec with ChiselScalatestTester{
    "Register File" in{
        test(new Register_File()){
            c => 
            c.io.ReadReg1.poke(32.U)
            c.io.ReadReg2.poke(32.U)
            c.clock.step(100)
        }

    } 

}