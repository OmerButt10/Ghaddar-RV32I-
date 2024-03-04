package SC

import org.scalatest._ 
import chiseltest._ 
import chisel3._

class Jalr_Tester extends FreeSpec with ChiselScalatestTester{
    "Jalr_Address" in{
        test(new Jalr){
            c => 
            c.io.rd.poke(4.S)
            c.io.rs1.poke(8.S)
            c.clock.step(100)
        }

    } 

}