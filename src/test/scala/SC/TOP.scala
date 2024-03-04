package SC
import chisel3._
import chisel3.util._
import org.scalatest.FreeSpec
import chiseltest._

class TopTest extends FreeSpec with ChiselScalatestTester{
    "Top" in{
        test (new TOP ){ c =>
           c.clock.step(100)
}}
}