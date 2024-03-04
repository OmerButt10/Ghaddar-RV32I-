package SC

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import scala.io.Source


class TOP extends Module {
    val io=IO(new Bundle {
        val out = Output(UInt(32.W))
    })
    
    val Instr_Mod = Module(new Instruction_Memory)
    val CU_Mod = Module(new Control_Unit)
    val ALU_Mod = Module(new ALU)
    val Data_Memory_Mod = Module(new Data_Memory)
    val Immediate_Gen_Mod = Module(new ImmdValGen)
    val PC_Mod = Module(new PC)
    val Jalr_Mod = Module(new Jalr)
    val Reg_Mod = Module(new Register_File)


    dontTouch(Reg_Mod.io)
    dontTouch(Jalr_Mod.io)
    dontTouch(Immediate_Gen_Mod.io)
    dontTouch(Data_Memory_Mod.io)
    dontTouch(ALU_Mod.io)
    



    val Main_ALU_Mux = Mux(ALU_Mod.io.CU_Branch_taken,ALU_Mod.io.in_A ,ALU_Mod.io.in_B)

    
    val br = ALU_Mod.io.CU_Branch_taken && CU_Mod.io.CU_Branch
    val Br_Mux = Mux(br, Immediate_Gen_Mod.io.immd_se_SB,PC_Mod.io.pc4.asSInt())


    //PC_Input
    val  pc_input = MuxLookup(CU_Mod.io.CU_Next_PC, 0.S, Array(
        "b00".U -> PC_Mod.io.pc4.asSInt(),
        "b01".U -> Br_Mux.asSInt(),
        "b10".U -> Immediate_Gen_Mod.io.immd_se_UJ,
        "b11".U -> Jalr_Mod.io.imm
    ))  
dontTouch(pc_input)



    PC_Mod.io.pc := pc_input

    //PC-Start
    Instr_Mod.io.memory_address :=  PC_Mod.io.pc1(21,2)


    //Control-Unit-Module
    CU_Mod.io.CU_Opcode := Instr_Mod.io.memory_instruction(6, 0)
    

    //Register-Modules
    Reg_Mod.io.ReadReg1 := Instr_Mod.io.memory_instruction(19, 15)
    Reg_Mod.io.ReadReg2 := Instr_Mod.io.memory_instruction(24, 20)
    Reg_Mod.io.WriteReg  := Instr_Mod.io.memory_instruction(11, 7)
    Reg_Mod.io.RegWrite := CU_Mod.io.CU_RegWrite 

    Reg_Mod.io.WriteData := Mux(CU_Mod.io.CU_MemToReg,Data_Memory_Mod.io.Data_Mem_output,ALU_Mod.io.out.asSInt())


    //Immediate-Generation
    Immediate_Gen_Mod.io.Imm_instr := Instr_Mod.io.memory_instruction.asSInt()


    //Data-Memory
    Data_Memory_Mod.io.Data_Mem_address := ALU_Mod.io.out
    Data_Memory_Mod.io.Data_Mem_data := Reg_Mod.io.ReadData1
    Data_Memory_Mod.io.Data_Mem_write := CU_Mod.io.CU_MemWrite
    Data_Memory_Mod.io.Data_Mem_read := CU_Mod.io.CU_MemRead

    //Imm-Gen-Output Mux
    val Imm_Mux_Output = MuxLookup(CU_Mod.io.CU_Extend_sel,0.S,Array( 
    0.U -> Immediate_Gen_Mod.io.immd_se_I,
    1.U -> Immediate_Gen_Mod.io.immd_se_S,
    2.U -> Immediate_Gen_Mod.io.immd_se_U,
    ))

    //Jalr Input
    Jalr_Mod.io.rd := Reg_Mod.io.ReadData1
    Jalr_Mod.io.rs1 := Imm_Mux_Output.asSInt()



    //Operand Data Selection Mux 
    val ALU_Mux_2 = Mux(CU_Mod.io.CU_InB,Imm_Mux_Output.asSInt(),Reg_Mod.io.ReadData2)

    //Operand-A-Selector
    val ALU_Mux_1 = MuxLookup(CU_Mod.io.CU_InA,0.U,Array(
    0.U -> Reg_Mod.io.ReadData1,
    1.U -> PC_Mod.io.pc1.asSInt(),
    2.U -> PC_Mod.io.pc4.asSInt(),
    3.U -> Reg_Mod.io.ReadData1
    ))    

    //ALU Control
    val Func3 = Instr_Mod.io.memory_instruction(14,12)
    val Func7 = Instr_Mod.io.memory_instruction(30)
    
    ALU_Mod.io.alu_Op := CU_Mod.io.CU_ALU_op  

    //ALU
    ALU_Mod.io.in_A := ALU_Mux_1.asUInt()
    ALU_Mod.io.in_B := ALU_Mux_2.asUInt()

    //ALU-Branch
    ALU_Mod.io.func3 := CU_Mod.io.CU_Opcode
    // ALU_Mod.io.in_A := Reg_Mod.io.ReadData1.asUInt()
    // ALU_Mod.io.in_B := Reg_Mod.io.ReadData2.asUInt()
    

io.out := CU_Mod.io.CU_MemWrite
}




