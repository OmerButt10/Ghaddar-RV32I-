package SC
import chisel3._ 
import chisel3.util._ 

class Control_Unit  extends Module {
    val io = IO (new Bundle {
        val CU_Opcode =  Input(UInt(7.W))
        val CU_MemWrite =  Output(Bool())
        val CU_Branch =  Output(Bool())
        val CU_MemRead =  Output(Bool())
        val CU_RegWrite =  Output(Bool())
        val CU_MemToReg =  Output(Bool())
        val CU_ALU_op =  Output(UInt(3.W))
        val CU_InA =  Output(UInt(2.W))
        val CU_InB =  Output(Bool())
        val CU_Extend_sel =  Output(UInt(2.W))
        val CU_Next_PC =  Output(UInt(2.W))
    })

    when(io.CU_Opcode === "b0000011".U){
        io.CU_MemWrite := 0.B 
        io.CU_Branch :=  0.B 
        io.CU_MemRead := 1.B
        io.CU_RegWrite := 1.B
        io.CU_MemToReg := 1.B
        io.CU_ALU_op :=  "b100".U
        io.CU_InA := "b00".U
        io.CU_InB := 1.B
        io.CU_Extend_sel :=  "b00".U
        io.CU_Next_PC := "b00".U
    }
    .elsewhen((io.CU_Opcode === "b0001111".U) || (io.CU_Opcode === "b0010111".U) || (io.CU_Opcode === "b0011011".U) || (io.CU_Opcode === "b0111011".U) || (io.CU_Opcode === "b1110011".U)){
        io.CU_MemWrite := 0.B
        io.CU_Branch :=  0.B
        io.CU_MemRead := 0.B
        io.CU_RegWrite := 0.B
        io.CU_MemToReg := 0.B
        io.CU_ALU_op :=  "b111".U
        io.CU_InA := "b00".U
        io.CU_InB := 0.B
        io.CU_Extend_sel :=  "b00".U
        io.CU_Next_PC := "b00".U

    }
    .elsewhen(io.CU_Opcode === "b0010011".U){
        io.CU_MemWrite := 0.B
        io.CU_Branch :=  0.B
        io.CU_MemRead := 0.B
        io.CU_RegWrite := 1.B
        io.CU_MemToReg := 0.B
        io.CU_ALU_op :=  "b001".U
        io.CU_InA := "b00".U
        io.CU_InB := 1.B
        io.CU_Extend_sel :=  "b00".U
        io.CU_Next_PC := "b00".U
    }
    .elsewhen(io.CU_Opcode === "b0100011".U){
        io.CU_MemWrite := 1.B
        io.CU_Branch :=  0.B
        io.CU_MemRead := 0.B
        io.CU_RegWrite := 0.B
        io.CU_MemToReg := 0.B
        io.CU_ALU_op :=  "b101".U
        io.CU_InA := "b00".U
        io.CU_InB := 1.B
        io.CU_Extend_sel :=  "b10".U
        io.CU_Next_PC := "b00".U
    }
    .elsewhen(io.CU_Opcode === "b0110011".U){
        io.CU_MemWrite := 0.B
        io.CU_Branch :=  0.B
        io.CU_MemRead := 0.B
        io.CU_RegWrite := 1.B
        io.CU_MemToReg := 0.B
        io.CU_ALU_op :=  "b000".U
        io.CU_InA := "b00".U
        io.CU_InB := 0.B
        io.CU_Extend_sel :=  "b00".U
        io.CU_Next_PC := "b00".U
    }
    .elsewhen(io.CU_Opcode === "b0110111".U){
        io.CU_MemWrite := 0.B
        io.CU_Branch :=  0.B
        
        io.CU_MemRead := 0.B
        io.CU_RegWrite := 1.B
        io.CU_MemToReg := 0.B
        io.CU_ALU_op :=  "b110".U
        io.CU_InA := "b11".U
        io.CU_InB := 1.B
        
        io.CU_Extend_sel :=  "b01".U
        
        io.CU_Next_PC := "b00".U
    }
    .elsewhen(io.CU_Opcode === "b1100011".U){
        io.CU_MemWrite := 0.B
        io.CU_Branch :=  1.B
        io.CU_MemRead := 0.B
        io.CU_RegWrite := 0.B
        io.CU_MemToReg := 0.B
        io.CU_ALU_op :=  "b010".U
        io.CU_InA := "b00".U
        io.CU_InB := 0.B
        io.CU_Extend_sel :=  "b00".U
        io.CU_Next_PC := "b01".U
    }
    .elsewhen(io.CU_Opcode === "b1100111".U){
        io.CU_MemWrite := 0.B
        io.CU_Branch :=  0.B
        io.CU_MemRead := 0.B
        io.CU_RegWrite := 1.B
        io.CU_MemToReg := 0.B
        io.CU_ALU_op :=  "b011".U
        io.CU_InA := "b10".U
        io.CU_InB := 0.B
        io.CU_Extend_sel :=  "b00".U
        io.CU_Next_PC := "b11".U
    }
    .elsewhen(io.CU_Opcode === "b1101111".U){
        io.CU_MemWrite := 0.B
        io.CU_Branch :=  0.B
        io.CU_MemRead := 0.B
        io.CU_RegWrite := 1.B
        io.CU_MemToReg := 0.B
        io.CU_ALU_op :=  "b011".U
        io.CU_InA := "b10".U
        io.CU_InB := 0.B
        io.CU_Extend_sel :=  "b00".U
        io.CU_Next_PC := "b10".U
    }
    .otherwise{
        io.CU_MemWrite := DontCare
        io.CU_Branch :=  DontCare
        io.CU_MemRead := DontCare
        io.CU_RegWrite := DontCare
        io.CU_MemToReg := DontCare
        io.CU_ALU_op :=  DontCare
        io.CU_InA := DontCare
        io.CU_InB := DontCare
        io.CU_Extend_sel :=  DontCare
        io.CU_Next_PC := DontCare
    }
}