package SC

import chisel3._ 
import chisel3.util._ 


object ALUOP1 {
    val ALU_ADD = 0.U(4.W)
    val ALU_SUB = 1.U(4.W)
    val ALU_AND = 2.U(4.W)
    val ALU_OR  = 3.U(4.W)
    val ALU_XOR = 4.U(4.W)
    val ALU_SLT = 5.U(4.W)
    val ALU_SLL = 6.U(4.W)
    val ALU_SLTU= 7.U(4.W)
    val ALU_SRL = 8.U(4.W)
    val ALU_SRA = 9.U(4.W)
    val ALU_COPY_A = 10.U(4.W)
    val ALU_COPY_B = 11.U(4.W)
    val ALU_XXX = 12.U(4.W) 

//---------Branch-Control-------------

    val ALU_BEQ = "b0000". U (4. W )
    val ALU_BNE = "b0001". U (4. W )
    val ALU_BLT = "b0100". U (4. W )
    val ALU_BGE = "b0101". U (4. W )
    val ALU_BLTU = "b0110". U (4. W )
    val ALU_BGEU = "b0111". U (4. W )
    val ALU_BLTE = "b0010". U (4. W )
}

trait Config{
    val WLEN = 32
    val ALUOP_SIG_LEN = 4
}

import ALUOP1._

class ALUIO extends Bundle with Config {
    val in_A = Input(UInt(WLEN.W))
    val in_B = Input(UInt(WLEN.W))
    val func3 = Input(UInt(WLEN.W))
    val alu_Op = Input(UInt(ALUOP_SIG_LEN.W))
    val out = Output(UInt(WLEN.W))
    val sum = Output(UInt(WLEN.W))
    // val CU_Branch = Input ( Bool () )
    val CU_Branch_taken = Output ( Bool () )
    

}

class ALU extends Module with Config {  
    val io = IO(new ALUIO)

    val sum = io.in_A + io.in_B
    val cmp = Mux(io.in_A(WLEN-1) === io.in_B(WLEN-1), sum(WLEN-1),
                Mux(io.alu_Op(1), io.in_B(WLEN-1), io.in_A(WLEN-1)))

    val shamt = io.in_B(4,0).asUInt
    val shin = Mux(io.alu_Op(3), io.in_A, Reverse(io.in_A))
    val shiftr = (Cat(io.alu_Op(0) && shin(WLEN-1), shin).asSInt >> shamt)(WLEN-1,0)
    val shitfl = Reverse(shiftr)
    val out = 
    Mux(io.alu_Op === ALU_ADD || io.alu_Op === ALU_SUB, sum, 
    Mux(io.alu_Op === ALU_SLT || io.alu_Op === ALU_SLTU, cmp, 
    Mux(io.alu_Op === ALU_SRA || io.alu_Op === ALU_SRL, shiftr,
    Mux(io.alu_Op === ALU_SLL, shitfl, 
    Mux(io.alu_Op === ALU_AND, (io.in_A & io.in_B),
    Mux(io.alu_Op === ALU_OR, (io.in_A | io.in_B),
    Mux(io.alu_Op === ALU_XOR, (io.in_A ^ io.in_B),
    Mux(io.alu_Op === ALU_COPY_A, io.in_A, 
    Mux(io.alu_Op === ALU_COPY_B, io.in_B, 0.U)))))))))


    io.out := out
    io.sum := sum

  io.CU_Branch_taken := false.B

  // when() {
  //   switch(io.func3) {
  //     is(ALU_BEQ) {
  //       io.alu_Op := io.in_A === io.in_B
  //     }
  //     is(ALU_BNE) {
  //       io.alu_Op := io.in_A =/= io.in_B
  //     }
  //     is(ALU_BLT) {
  //       io.alu_Op := io.in_A < io.in_B
  //     }
  //     is(ALU_BGE) {
  //       io.alu_Op := io.in_A >= io.in_B
  //     }
  //     is(ALU_BLTU) {
  //       io.alu_Op := io.in_A <= io.in_B
  //     }
  //     is(ALU_BGEU) {
  //       io.alu_Op := io.in_A > io.in_B
  //     }
  //     is(ALU_BLTE) {
  //       io.alu_Op := io.in_A <= io.in_B // Check if this is the intended behavior
  //     }

 // Use a wire to store the result of the match block
  val branchResult = io.func3 match {
    case ALU_BEQ  => io.in_A === io.in_B
    case ALU_BNE  => io.in_A =/= io.in_B
    case ALU_BLT  => io.in_A < io.in_B
    case ALU_BGE  => io.in_A >= io.in_B
    case ALU_BLTU => io.in_A <= io.in_B
    case ALU_BGEU => io.in_A > io.in_B
    case ALU_BLTE => io.in_A <= io.in_B // Check if this is the intended behavior
    case _        => false.B // Default case, you might want to handle it according to your requirements
  }

  // Connect the wire to the output
  io.CU_Branch_taken := branchResult

      // Add a default case for unexpected values of io.fnct3
  //}.otherwise {
    //io.br_taken := false.B
  //}
}
 