package SC

import org.scalatest._ 
import chiseltest._ 
import chisel3._ 


class Instruction_Memory_Tester extends FreeSpec with ChiselScalatestTester{
    "Instruction Memory" in {
        test(new Instruction_Memory){
            c =>
            c.io.memory_address.poke("b01010101010101010101010101".U)
            c.clock.step(100)
        }
    }
}