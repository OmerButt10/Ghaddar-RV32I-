// package SC

// import chisel3._
// import chisel3.util._
// import ALUOPR._

// object ALUOPR {
//     val ALU_BEQ = "b000". U (3. W )
//     val ALU_BNE = "b001". U (3. W )
//     val ALU_BLT = "b100". U (3. W )
//     val ALU_BGE = "b101". U (3. W )
//     val ALU_BLTU = "b110". U (3. W )
//     val ALU_BGEU = "b111". U (3. W )
//     val ALU_BLTE = "b010". U (3. W )
// }
// class LM_IO_Interface_CU_BranchControl extends Bundle {
//     val fnct3 = Input ( UInt (3. W ) )
//     val CU_Branch = Input ( Bool () )
//     val CU_Branch_alu_inx = Input ( UInt (32. W ) )
//     val CU_Branch_alu_iny = Input ( UInt (32. W ) )
//     val CU_Branch_taken = Output ( Bool () )
    
// }

    
    
// class CU_BranchControl extends Module {
//   val io = IO(new LM_IO_Interface_CU_BranchControl)

//   io.CU_Branch_taken := false.B

//   when(io.CU_Branch) {
//     switch(io.fnct3) {
//       is(ALU_BEQ) {
//         io.CU_Branch_taken := io.CU_Branch_alu_inx === io.CU_Branch_alu_iny
//       }
//       is(ALU_BNE) {
//         io.CU_Branch_taken := io.CU_Branch_alu_inx =/= io.CU_Branch_alu_iny
//       }
//       is(ALU_BLT) {
//         io.CU_Branch_taken := io.CU_Branch_alu_inx < io.CU_Branch_alu_iny
//       }
//       is(ALU_BGE) {
//         io.CU_Branch_taken := io.CU_Branch_alu_inx >= io.CU_Branch_alu_iny
//       }
//       is(ALU_BLTU) {
//         io.CU_Branch_taken := io.CU_Branch_alu_inx <= io.CU_Branch_alu_iny
//       }
//       is(ALU_BGEU) {
//         io.CU_Branch_taken := io.CU_Branch_alu_inx > io.CU_Branch_alu_iny
//       }
//       is(ALU_BLTE) {
//         io.CU_Branch_taken := io.CU_Branch_alu_inx <= io.CU_Branch_alu_iny // Check if this is the intended behavior
//       }
//       // Add a default case for unexpected values of io.fnct3
//   //}.otherwise {
//     //io.CU_Branch_taken := false.B
//   //}
// }
// }
// }