// package SC

// import chisel3._
// import chisel3.util._

// class PC4 extends Module {
//     val io = IO ( new Bundle {
//     val pc4 = Input(UInt(32.W))
//     val pc4_Out = Output(UInt(32.W))

//     })

//     // io.pc4 := 0.U    
    
//     val pc_reg = Reg(UInt(32.W))
//     pc_reg := io.pc4 + 4.U
  
//     io.pc4_Out := pc_reg    
    

// }