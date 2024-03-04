package SC
import chisel3._
import chisel3.util._
import org.scalatest._
import chiseltest._

class Control_Unit_Tester extends FreeSpec with ChiselScalatestTester {
    "Control Unit Test" in {
        test (new Control_Unit()) { 
            c =>
        
            c.io.CU_Opcode.poke("b0000011".U)
            c.clock.step(100)
        }
    }
}
