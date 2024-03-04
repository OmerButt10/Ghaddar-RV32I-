package SC

import org.scalatest._ 
import chiseltest._ 
import chisel3._ 

class Program_Counter_Tester extends FreeSpec with ChiselScalatestTester{
    "Program Counter" in {
        test(new PC()){
            c =>
            c.io.pc.poke(8.S)
            c.clock.step(100)

            c.io.pc1.expect(8.S)
            
        }
    }
}
