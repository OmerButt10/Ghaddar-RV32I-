// package SC

// import org.scalatest.FreeSpec
// import chisel3._ 
// import chiseltest._


// class ALU_CU_BranchControl_Tester extends FreeSpec with ChiselScalatestTester{
//     "ALU CU_Branch Control" in {
//         test(new CU_BranchControl){
//             c=>
//             c.io.CU_Branch_alu_inx.poke(1.U)
//             c.io.CU_Branch_alu_iny.poke(0.U)
//             c.io.CU_Branch.poke(1.B)
//             c.io.fnct3.poke("b000".U)
//             c.clock.step(10)

//             //val expectedValue = true
//             //assert(c.io.CU_Branch_taken.peek().litToBoolean == expectedValue)

//         }

//     }
// }