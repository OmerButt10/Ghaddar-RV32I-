package SC
import org.scalatest.FreeSpec
import chiseltest._ 
import chisel3._ 

class Immediate_Generation_Tester extends FreeSpec with ChiselScalatestTester{
    "Immediate Generation" in {
        test(new ImmdValGen()){
            c=>
            c.io.Imm_instr.poke(78.S)
            c.clock.step(100)
            //c.io.immd_se.expect("b001".U)
        }

    }
}
