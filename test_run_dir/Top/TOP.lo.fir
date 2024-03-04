circuit TOP :
  module Instruction_Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_memory_address : UInt<32>
    output io_memory_instruction : UInt<32>

    mem mem : @[Instruction-Memory.scala 15:16]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_memory_instruction_MPORT
      read-under-write => undefined
    node _io_memory_instruction_T = bits(io_memory_address, 9, 0) @[Instruction-Memory.scala 18:29]
    io_memory_instruction <= mem.io_memory_instruction_MPORT.data @[Instruction-Memory.scala 18:24]
    mem.io_memory_instruction_MPORT.addr <= _io_memory_instruction_T @[Instruction-Memory.scala 18:29]
    mem.io_memory_instruction_MPORT.en <= UInt<1>("h1") @[Instruction-Memory.scala 18:29]
    mem.io_memory_instruction_MPORT.clk <= clock @[Instruction-Memory.scala 18:29]

  module Control_Unit :
    input clock : Clock
    input reset : UInt<1>
    input io_CU_Opcode : UInt<7>
    output io_CU_MemWrite : UInt<1>
    output io_CU_Branch : UInt<1>
    output io_CU_MemRead : UInt<1>
    output io_CU_RegWrite : UInt<1>
    output io_CU_MemToReg : UInt<1>
    output io_CU_ALU_op : UInt<3>
    output io_CU_InA : UInt<2>
    output io_CU_InB : UInt<1>
    output io_CU_Extend_sel : UInt<2>
    output io_CU_Next_PC : UInt<2>

    node _T = eq(io_CU_Opcode, UInt<2>("h3")) @[Control-Unit.scala 20:23]
    node _T_1 = eq(io_CU_Opcode, UInt<4>("hf")) @[Control-Unit.scala 32:29]
    node _T_2 = eq(io_CU_Opcode, UInt<5>("h17")) @[Control-Unit.scala 32:64]
    node _T_3 = or(_T_1, _T_2) @[Control-Unit.scala 32:47]
    node _T_4 = eq(io_CU_Opcode, UInt<5>("h1b")) @[Control-Unit.scala 32:99]
    node _T_5 = or(_T_3, _T_4) @[Control-Unit.scala 32:82]
    node _T_6 = eq(io_CU_Opcode, UInt<6>("h3b")) @[Control-Unit.scala 32:134]
    node _T_7 = or(_T_5, _T_6) @[Control-Unit.scala 32:117]
    node _T_8 = eq(io_CU_Opcode, UInt<7>("h73")) @[Control-Unit.scala 32:169]
    node _T_9 = or(_T_7, _T_8) @[Control-Unit.scala 32:152]
    node _T_10 = eq(io_CU_Opcode, UInt<5>("h13")) @[Control-Unit.scala 45:28]
    node _T_11 = eq(io_CU_Opcode, UInt<6>("h23")) @[Control-Unit.scala 57:28]
    node _T_12 = eq(io_CU_Opcode, UInt<6>("h33")) @[Control-Unit.scala 69:28]
    node _T_13 = eq(io_CU_Opcode, UInt<6>("h37")) @[Control-Unit.scala 81:28]
    node _T_14 = eq(io_CU_Opcode, UInt<7>("h63")) @[Control-Unit.scala 96:28]
    node _T_15 = eq(io_CU_Opcode, UInt<7>("h67")) @[Control-Unit.scala 108:28]
    node _T_16 = eq(io_CU_Opcode, UInt<7>("h6f")) @[Control-Unit.scala 120:28]
    node _GEN_0 = validif(_T_16, UInt<1>("h0")) @[Control-Unit.scala 120:45 Control-Unit.scala 121:24]
    node _GEN_1 = validif(_T_16, UInt<1>("h1")) @[Control-Unit.scala 120:45 Control-Unit.scala 124:24]
    node _GEN_2 = validif(_T_16, UInt<2>("h3")) @[Control-Unit.scala 120:45 Control-Unit.scala 126:22]
    node _GEN_3 = validif(_T_16, UInt<2>("h2")) @[Control-Unit.scala 120:45 Control-Unit.scala 127:19]
    node _GEN_4 = mux(_T_15, UInt<1>("h0"), _GEN_0) @[Control-Unit.scala 108:45 Control-Unit.scala 109:24]
    node _GEN_5 = mux(_T_15, UInt<1>("h1"), _GEN_1) @[Control-Unit.scala 108:45 Control-Unit.scala 112:24]
    node _GEN_6 = mux(_T_15, UInt<2>("h3"), _GEN_2) @[Control-Unit.scala 108:45 Control-Unit.scala 114:22]
    node _GEN_7 = mux(_T_15, UInt<2>("h2"), _GEN_3) @[Control-Unit.scala 108:45 Control-Unit.scala 115:19]
    node _GEN_8 = mux(_T_15, UInt<2>("h3"), _GEN_3) @[Control-Unit.scala 108:45 Control-Unit.scala 118:23]
    node _GEN_9 = mux(_T_14, UInt<1>("h0"), _GEN_4) @[Control-Unit.scala 96:45 Control-Unit.scala 97:24]
    node _GEN_10 = mux(_T_14, UInt<1>("h1"), _GEN_4) @[Control-Unit.scala 96:45 Control-Unit.scala 98:22]
    node _GEN_11 = mux(_T_14, UInt<1>("h0"), _GEN_5) @[Control-Unit.scala 96:45 Control-Unit.scala 100:24]
    node _GEN_12 = mux(_T_14, UInt<2>("h2"), _GEN_6) @[Control-Unit.scala 96:45 Control-Unit.scala 102:22]
    node _GEN_13 = mux(_T_14, UInt<1>("h0"), _GEN_7) @[Control-Unit.scala 96:45 Control-Unit.scala 103:19]
    node _GEN_14 = mux(_T_14, UInt<1>("h1"), _GEN_8) @[Control-Unit.scala 96:45 Control-Unit.scala 106:23]
    node _GEN_15 = mux(_T_13, UInt<1>("h0"), _GEN_9) @[Control-Unit.scala 81:45 Control-Unit.scala 82:24]
    node _GEN_16 = mux(_T_13, UInt<1>("h0"), _GEN_10) @[Control-Unit.scala 81:45 Control-Unit.scala 83:22]
    node _GEN_17 = mux(_T_13, UInt<1>("h1"), _GEN_11) @[Control-Unit.scala 81:45 Control-Unit.scala 86:24]
    node _GEN_18 = mux(_T_13, UInt<3>("h6"), _GEN_12) @[Control-Unit.scala 81:45 Control-Unit.scala 88:22]
    node _GEN_19 = mux(_T_13, UInt<2>("h3"), _GEN_13) @[Control-Unit.scala 81:45 Control-Unit.scala 89:19]
    node _GEN_20 = mux(_T_13, UInt<1>("h1"), _GEN_9) @[Control-Unit.scala 81:45 Control-Unit.scala 90:19]
    node _GEN_21 = mux(_T_13, UInt<1>("h0"), _GEN_14) @[Control-Unit.scala 81:45 Control-Unit.scala 94:23]
    node _GEN_22 = mux(_T_12, UInt<1>("h0"), _GEN_15) @[Control-Unit.scala 69:45 Control-Unit.scala 70:24]
    node _GEN_23 = mux(_T_12, UInt<1>("h0"), _GEN_16) @[Control-Unit.scala 69:45 Control-Unit.scala 71:22]
    node _GEN_24 = mux(_T_12, UInt<1>("h1"), _GEN_17) @[Control-Unit.scala 69:45 Control-Unit.scala 73:24]
    node _GEN_25 = mux(_T_12, UInt<1>("h0"), _GEN_18) @[Control-Unit.scala 69:45 Control-Unit.scala 75:22]
    node _GEN_26 = mux(_T_12, UInt<1>("h0"), _GEN_19) @[Control-Unit.scala 69:45 Control-Unit.scala 76:19]
    node _GEN_27 = mux(_T_12, UInt<1>("h0"), _GEN_20) @[Control-Unit.scala 69:45 Control-Unit.scala 77:19]
    node _GEN_28 = mux(_T_12, UInt<1>("h0"), _GEN_21) @[Control-Unit.scala 69:45 Control-Unit.scala 79:23]
    node _GEN_29 = mux(_T_11, UInt<1>("h1"), _GEN_22) @[Control-Unit.scala 57:45 Control-Unit.scala 58:24]
    node _GEN_30 = mux(_T_11, UInt<1>("h0"), _GEN_23) @[Control-Unit.scala 57:45 Control-Unit.scala 59:22]
    node _GEN_31 = mux(_T_11, UInt<1>("h0"), _GEN_22) @[Control-Unit.scala 57:45 Control-Unit.scala 60:23]
    node _GEN_32 = mux(_T_11, UInt<1>("h0"), _GEN_24) @[Control-Unit.scala 57:45 Control-Unit.scala 61:24]
    node _GEN_33 = mux(_T_11, UInt<3>("h5"), _GEN_25) @[Control-Unit.scala 57:45 Control-Unit.scala 63:22]
    node _GEN_34 = mux(_T_11, UInt<1>("h0"), _GEN_26) @[Control-Unit.scala 57:45 Control-Unit.scala 64:19]
    node _GEN_35 = mux(_T_11, UInt<1>("h1"), _GEN_27) @[Control-Unit.scala 57:45 Control-Unit.scala 65:19]
    node _GEN_36 = mux(_T_11, UInt<2>("h2"), _GEN_27) @[Control-Unit.scala 57:45 Control-Unit.scala 66:26]
    node _GEN_37 = mux(_T_11, UInt<1>("h0"), _GEN_28) @[Control-Unit.scala 57:45 Control-Unit.scala 67:23]
    node _GEN_38 = mux(_T_10, UInt<1>("h0"), _GEN_29) @[Control-Unit.scala 45:45 Control-Unit.scala 46:24]
    node _GEN_39 = mux(_T_10, UInt<1>("h0"), _GEN_30) @[Control-Unit.scala 45:45 Control-Unit.scala 47:22]
    node _GEN_40 = mux(_T_10, UInt<1>("h0"), _GEN_31) @[Control-Unit.scala 45:45 Control-Unit.scala 48:23]
    node _GEN_41 = mux(_T_10, UInt<1>("h1"), _GEN_32) @[Control-Unit.scala 45:45 Control-Unit.scala 49:24]
    node _GEN_42 = mux(_T_10, UInt<1>("h1"), _GEN_33) @[Control-Unit.scala 45:45 Control-Unit.scala 51:22]
    node _GEN_43 = mux(_T_10, UInt<1>("h0"), _GEN_34) @[Control-Unit.scala 45:45 Control-Unit.scala 52:19]
    node _GEN_44 = mux(_T_10, UInt<1>("h1"), _GEN_35) @[Control-Unit.scala 45:45 Control-Unit.scala 53:19]
    node _GEN_45 = mux(_T_10, UInt<1>("h0"), _GEN_36) @[Control-Unit.scala 45:45 Control-Unit.scala 54:26]
    node _GEN_46 = mux(_T_10, UInt<1>("h0"), _GEN_37) @[Control-Unit.scala 45:45 Control-Unit.scala 55:23]
    node _GEN_47 = mux(_T_9, UInt<1>("h0"), _GEN_38) @[Control-Unit.scala 32:187 Control-Unit.scala 33:24]
    node _GEN_48 = mux(_T_9, UInt<1>("h0"), _GEN_39) @[Control-Unit.scala 32:187 Control-Unit.scala 34:22]
    node _GEN_49 = mux(_T_9, UInt<1>("h0"), _GEN_40) @[Control-Unit.scala 32:187 Control-Unit.scala 35:23]
    node _GEN_50 = mux(_T_9, UInt<1>("h0"), _GEN_41) @[Control-Unit.scala 32:187 Control-Unit.scala 36:24]
    node _GEN_51 = mux(_T_9, UInt<3>("h7"), _GEN_42) @[Control-Unit.scala 32:187 Control-Unit.scala 38:22]
    node _GEN_52 = mux(_T_9, UInt<1>("h0"), _GEN_43) @[Control-Unit.scala 32:187 Control-Unit.scala 39:19]
    node _GEN_53 = mux(_T_9, UInt<1>("h0"), _GEN_44) @[Control-Unit.scala 32:187 Control-Unit.scala 40:19]
    node _GEN_54 = mux(_T_9, UInt<1>("h0"), _GEN_45) @[Control-Unit.scala 32:187 Control-Unit.scala 41:26]
    node _GEN_55 = mux(_T_9, UInt<1>("h0"), _GEN_46) @[Control-Unit.scala 32:187 Control-Unit.scala 42:23]
    node _GEN_56 = mux(_T, UInt<1>("h0"), _GEN_47) @[Control-Unit.scala 20:40 Control-Unit.scala 21:24]
    node _GEN_57 = mux(_T, UInt<1>("h0"), _GEN_48) @[Control-Unit.scala 20:40 Control-Unit.scala 22:22]
    node _GEN_58 = mux(_T, UInt<1>("h1"), _GEN_49) @[Control-Unit.scala 20:40 Control-Unit.scala 23:23]
    node _GEN_59 = mux(_T, UInt<1>("h1"), _GEN_50) @[Control-Unit.scala 20:40 Control-Unit.scala 24:24]
    node _GEN_60 = mux(_T, UInt<3>("h4"), _GEN_51) @[Control-Unit.scala 20:40 Control-Unit.scala 26:22]
    node _GEN_61 = mux(_T, UInt<1>("h0"), _GEN_52) @[Control-Unit.scala 20:40 Control-Unit.scala 27:19]
    node _GEN_62 = mux(_T, UInt<1>("h1"), _GEN_53) @[Control-Unit.scala 20:40 Control-Unit.scala 28:19]
    node _GEN_63 = mux(_T, UInt<1>("h0"), _GEN_54) @[Control-Unit.scala 20:40 Control-Unit.scala 29:26]
    node _GEN_64 = mux(_T, UInt<1>("h0"), _GEN_55) @[Control-Unit.scala 20:40 Control-Unit.scala 30:23]
    io_CU_MemWrite <= _GEN_56
    io_CU_Branch <= _GEN_57
    io_CU_MemRead <= _GEN_58
    io_CU_RegWrite <= _GEN_59
    io_CU_MemToReg <= _GEN_58
    io_CU_ALU_op <= _GEN_60
    io_CU_InA <= _GEN_61
    io_CU_InB <= _GEN_62
    io_CU_Extend_sel <= _GEN_63
    io_CU_Next_PC <= _GEN_64

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_func3 : UInt<32>
    input io_alu_Op : UInt<4>
    output io_out : UInt<32>
    output io_sum : UInt<32>
    output io_CU_Branch_taken : UInt<1>

    node _sum_T = add(io_in_A, io_in_B) @[ALU.scala 56:23]
    node sum = tail(_sum_T, 1) @[ALU.scala 56:23]
    node _cmp_T = bits(io_in_A, 31, 31) @[ALU.scala 57:26]
    node _cmp_T_1 = bits(io_in_B, 31, 31) @[ALU.scala 57:46]
    node _cmp_T_2 = eq(_cmp_T, _cmp_T_1) @[ALU.scala 57:35]
    node _cmp_T_3 = bits(sum, 31, 31) @[ALU.scala 57:59]
    node _cmp_T_4 = bits(io_alu_Op, 1, 1) @[ALU.scala 58:30]
    node _cmp_T_5 = bits(io_in_B, 31, 31) @[ALU.scala 58:42]
    node _cmp_T_6 = bits(io_in_A, 31, 31) @[ALU.scala 58:59]
    node _cmp_T_7 = mux(_cmp_T_4, _cmp_T_5, _cmp_T_6) @[ALU.scala 58:20]
    node cmp = mux(_cmp_T_2, _cmp_T_3, _cmp_T_7) @[ALU.scala 57:18]
    node shamt = bits(io_in_B, 4, 0) @[ALU.scala 60:24]
    node _shin_T = bits(io_alu_Op, 3, 3) @[ALU.scala 61:29]
    node _shin_T_1 = shl(UInt<16>("hffff"), 16) @[Bitwise.scala 102:47]
    node _shin_T_2 = xor(UInt<32>("hffffffff"), _shin_T_1) @[Bitwise.scala 102:21]
    node _shin_T_3 = shr(io_in_A, 16) @[Bitwise.scala 103:21]
    node _shin_T_4 = and(_shin_T_3, _shin_T_2) @[Bitwise.scala 103:31]
    node _shin_T_5 = bits(io_in_A, 15, 0) @[Bitwise.scala 103:46]
    node _shin_T_6 = shl(_shin_T_5, 16) @[Bitwise.scala 103:65]
    node _shin_T_7 = not(_shin_T_2) @[Bitwise.scala 103:77]
    node _shin_T_8 = and(_shin_T_6, _shin_T_7) @[Bitwise.scala 103:75]
    node _shin_T_9 = or(_shin_T_4, _shin_T_8) @[Bitwise.scala 103:39]
    node _shin_T_10 = bits(_shin_T_2, 23, 0) @[Bitwise.scala 102:28]
    node _shin_T_11 = shl(_shin_T_10, 8) @[Bitwise.scala 102:47]
    node _shin_T_12 = xor(_shin_T_2, _shin_T_11) @[Bitwise.scala 102:21]
    node _shin_T_13 = shr(_shin_T_9, 8) @[Bitwise.scala 103:21]
    node _shin_T_14 = and(_shin_T_13, _shin_T_12) @[Bitwise.scala 103:31]
    node _shin_T_15 = bits(_shin_T_9, 23, 0) @[Bitwise.scala 103:46]
    node _shin_T_16 = shl(_shin_T_15, 8) @[Bitwise.scala 103:65]
    node _shin_T_17 = not(_shin_T_12) @[Bitwise.scala 103:77]
    node _shin_T_18 = and(_shin_T_16, _shin_T_17) @[Bitwise.scala 103:75]
    node _shin_T_19 = or(_shin_T_14, _shin_T_18) @[Bitwise.scala 103:39]
    node _shin_T_20 = bits(_shin_T_12, 27, 0) @[Bitwise.scala 102:28]
    node _shin_T_21 = shl(_shin_T_20, 4) @[Bitwise.scala 102:47]
    node _shin_T_22 = xor(_shin_T_12, _shin_T_21) @[Bitwise.scala 102:21]
    node _shin_T_23 = shr(_shin_T_19, 4) @[Bitwise.scala 103:21]
    node _shin_T_24 = and(_shin_T_23, _shin_T_22) @[Bitwise.scala 103:31]
    node _shin_T_25 = bits(_shin_T_19, 27, 0) @[Bitwise.scala 103:46]
    node _shin_T_26 = shl(_shin_T_25, 4) @[Bitwise.scala 103:65]
    node _shin_T_27 = not(_shin_T_22) @[Bitwise.scala 103:77]
    node _shin_T_28 = and(_shin_T_26, _shin_T_27) @[Bitwise.scala 103:75]
    node _shin_T_29 = or(_shin_T_24, _shin_T_28) @[Bitwise.scala 103:39]
    node _shin_T_30 = bits(_shin_T_22, 29, 0) @[Bitwise.scala 102:28]
    node _shin_T_31 = shl(_shin_T_30, 2) @[Bitwise.scala 102:47]
    node _shin_T_32 = xor(_shin_T_22, _shin_T_31) @[Bitwise.scala 102:21]
    node _shin_T_33 = shr(_shin_T_29, 2) @[Bitwise.scala 103:21]
    node _shin_T_34 = and(_shin_T_33, _shin_T_32) @[Bitwise.scala 103:31]
    node _shin_T_35 = bits(_shin_T_29, 29, 0) @[Bitwise.scala 103:46]
    node _shin_T_36 = shl(_shin_T_35, 2) @[Bitwise.scala 103:65]
    node _shin_T_37 = not(_shin_T_32) @[Bitwise.scala 103:77]
    node _shin_T_38 = and(_shin_T_36, _shin_T_37) @[Bitwise.scala 103:75]
    node _shin_T_39 = or(_shin_T_34, _shin_T_38) @[Bitwise.scala 103:39]
    node _shin_T_40 = bits(_shin_T_32, 30, 0) @[Bitwise.scala 102:28]
    node _shin_T_41 = shl(_shin_T_40, 1) @[Bitwise.scala 102:47]
    node _shin_T_42 = xor(_shin_T_32, _shin_T_41) @[Bitwise.scala 102:21]
    node _shin_T_43 = shr(_shin_T_39, 1) @[Bitwise.scala 103:21]
    node _shin_T_44 = and(_shin_T_43, _shin_T_42) @[Bitwise.scala 103:31]
    node _shin_T_45 = bits(_shin_T_39, 30, 0) @[Bitwise.scala 103:46]
    node _shin_T_46 = shl(_shin_T_45, 1) @[Bitwise.scala 103:65]
    node _shin_T_47 = not(_shin_T_42) @[Bitwise.scala 103:77]
    node _shin_T_48 = and(_shin_T_46, _shin_T_47) @[Bitwise.scala 103:75]
    node _shin_T_49 = or(_shin_T_44, _shin_T_48) @[Bitwise.scala 103:39]
    node shin = mux(_shin_T, io_in_A, _shin_T_49) @[ALU.scala 61:19]
    node _shiftr_T = bits(io_alu_Op, 0, 0) @[ALU.scala 62:32]
    node _shiftr_T_1 = bits(shin, 31, 31) @[ALU.scala 62:43]
    node shiftr_hi = and(_shiftr_T, _shiftr_T_1) @[ALU.scala 62:36]
    node _shiftr_T_2 = cat(shiftr_hi, shin) @[Cat.scala 30:58]
    node _shiftr_T_3 = asSInt(_shiftr_T_2) @[ALU.scala 62:59]
    node _shiftr_T_4 = dshr(_shiftr_T_3, shamt) @[ALU.scala 62:66]
    node shiftr = bits(_shiftr_T_4, 31, 0) @[ALU.scala 62:75]
    node _shitfl_T = shl(UInt<16>("hffff"), 16) @[Bitwise.scala 102:47]
    node _shitfl_T_1 = xor(UInt<32>("hffffffff"), _shitfl_T) @[Bitwise.scala 102:21]
    node _shitfl_T_2 = shr(shiftr, 16) @[Bitwise.scala 103:21]
    node _shitfl_T_3 = and(_shitfl_T_2, _shitfl_T_1) @[Bitwise.scala 103:31]
    node _shitfl_T_4 = bits(shiftr, 15, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_5 = shl(_shitfl_T_4, 16) @[Bitwise.scala 103:65]
    node _shitfl_T_6 = not(_shitfl_T_1) @[Bitwise.scala 103:77]
    node _shitfl_T_7 = and(_shitfl_T_5, _shitfl_T_6) @[Bitwise.scala 103:75]
    node _shitfl_T_8 = or(_shitfl_T_3, _shitfl_T_7) @[Bitwise.scala 103:39]
    node _shitfl_T_9 = bits(_shitfl_T_1, 23, 0) @[Bitwise.scala 102:28]
    node _shitfl_T_10 = shl(_shitfl_T_9, 8) @[Bitwise.scala 102:47]
    node _shitfl_T_11 = xor(_shitfl_T_1, _shitfl_T_10) @[Bitwise.scala 102:21]
    node _shitfl_T_12 = shr(_shitfl_T_8, 8) @[Bitwise.scala 103:21]
    node _shitfl_T_13 = and(_shitfl_T_12, _shitfl_T_11) @[Bitwise.scala 103:31]
    node _shitfl_T_14 = bits(_shitfl_T_8, 23, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_15 = shl(_shitfl_T_14, 8) @[Bitwise.scala 103:65]
    node _shitfl_T_16 = not(_shitfl_T_11) @[Bitwise.scala 103:77]
    node _shitfl_T_17 = and(_shitfl_T_15, _shitfl_T_16) @[Bitwise.scala 103:75]
    node _shitfl_T_18 = or(_shitfl_T_13, _shitfl_T_17) @[Bitwise.scala 103:39]
    node _shitfl_T_19 = bits(_shitfl_T_11, 27, 0) @[Bitwise.scala 102:28]
    node _shitfl_T_20 = shl(_shitfl_T_19, 4) @[Bitwise.scala 102:47]
    node _shitfl_T_21 = xor(_shitfl_T_11, _shitfl_T_20) @[Bitwise.scala 102:21]
    node _shitfl_T_22 = shr(_shitfl_T_18, 4) @[Bitwise.scala 103:21]
    node _shitfl_T_23 = and(_shitfl_T_22, _shitfl_T_21) @[Bitwise.scala 103:31]
    node _shitfl_T_24 = bits(_shitfl_T_18, 27, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_25 = shl(_shitfl_T_24, 4) @[Bitwise.scala 103:65]
    node _shitfl_T_26 = not(_shitfl_T_21) @[Bitwise.scala 103:77]
    node _shitfl_T_27 = and(_shitfl_T_25, _shitfl_T_26) @[Bitwise.scala 103:75]
    node _shitfl_T_28 = or(_shitfl_T_23, _shitfl_T_27) @[Bitwise.scala 103:39]
    node _shitfl_T_29 = bits(_shitfl_T_21, 29, 0) @[Bitwise.scala 102:28]
    node _shitfl_T_30 = shl(_shitfl_T_29, 2) @[Bitwise.scala 102:47]
    node _shitfl_T_31 = xor(_shitfl_T_21, _shitfl_T_30) @[Bitwise.scala 102:21]
    node _shitfl_T_32 = shr(_shitfl_T_28, 2) @[Bitwise.scala 103:21]
    node _shitfl_T_33 = and(_shitfl_T_32, _shitfl_T_31) @[Bitwise.scala 103:31]
    node _shitfl_T_34 = bits(_shitfl_T_28, 29, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_35 = shl(_shitfl_T_34, 2) @[Bitwise.scala 103:65]
    node _shitfl_T_36 = not(_shitfl_T_31) @[Bitwise.scala 103:77]
    node _shitfl_T_37 = and(_shitfl_T_35, _shitfl_T_36) @[Bitwise.scala 103:75]
    node _shitfl_T_38 = or(_shitfl_T_33, _shitfl_T_37) @[Bitwise.scala 103:39]
    node _shitfl_T_39 = bits(_shitfl_T_31, 30, 0) @[Bitwise.scala 102:28]
    node _shitfl_T_40 = shl(_shitfl_T_39, 1) @[Bitwise.scala 102:47]
    node _shitfl_T_41 = xor(_shitfl_T_31, _shitfl_T_40) @[Bitwise.scala 102:21]
    node _shitfl_T_42 = shr(_shitfl_T_38, 1) @[Bitwise.scala 103:21]
    node _shitfl_T_43 = and(_shitfl_T_42, _shitfl_T_41) @[Bitwise.scala 103:31]
    node _shitfl_T_44 = bits(_shitfl_T_38, 30, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_45 = shl(_shitfl_T_44, 1) @[Bitwise.scala 103:65]
    node _shitfl_T_46 = not(_shitfl_T_41) @[Bitwise.scala 103:77]
    node _shitfl_T_47 = and(_shitfl_T_45, _shitfl_T_46) @[Bitwise.scala 103:75]
    node shitfl = or(_shitfl_T_43, _shitfl_T_47) @[Bitwise.scala 103:39]
    node _out_T = eq(io_alu_Op, UInt<4>("h0")) @[ALU.scala 65:19]
    node _out_T_1 = eq(io_alu_Op, UInt<4>("h1")) @[ALU.scala 65:44]
    node _out_T_2 = or(_out_T, _out_T_1) @[ALU.scala 65:31]
    node _out_T_3 = eq(io_alu_Op, UInt<4>("h5")) @[ALU.scala 66:19]
    node _out_T_4 = eq(io_alu_Op, UInt<4>("h7")) @[ALU.scala 66:44]
    node _out_T_5 = or(_out_T_3, _out_T_4) @[ALU.scala 66:31]
    node _out_T_6 = eq(io_alu_Op, UInt<4>("h9")) @[ALU.scala 67:19]
    node _out_T_7 = eq(io_alu_Op, UInt<4>("h8")) @[ALU.scala 67:44]
    node _out_T_8 = or(_out_T_6, _out_T_7) @[ALU.scala 67:31]
    node _out_T_9 = eq(io_alu_Op, UInt<4>("h6")) @[ALU.scala 68:19]
    node _out_T_10 = eq(io_alu_Op, UInt<4>("h2")) @[ALU.scala 69:19]
    node _out_T_11 = and(io_in_A, io_in_B) @[ALU.scala 69:41]
    node _out_T_12 = eq(io_alu_Op, UInt<4>("h3")) @[ALU.scala 70:19]
    node _out_T_13 = or(io_in_A, io_in_B) @[ALU.scala 70:40]
    node _out_T_14 = eq(io_alu_Op, UInt<4>("h4")) @[ALU.scala 71:19]
    node _out_T_15 = xor(io_in_A, io_in_B) @[ALU.scala 71:41]
    node _out_T_16 = eq(io_alu_Op, UInt<4>("ha")) @[ALU.scala 72:19]
    node _out_T_17 = eq(io_alu_Op, UInt<4>("hb")) @[ALU.scala 73:19]
    node _out_T_18 = mux(_out_T_17, io_in_B, UInt<1>("h0")) @[ALU.scala 73:8]
    node _out_T_19 = mux(_out_T_16, io_in_A, _out_T_18) @[ALU.scala 72:8]
    node _out_T_20 = mux(_out_T_14, _out_T_15, _out_T_19) @[ALU.scala 71:8]
    node _out_T_21 = mux(_out_T_12, _out_T_13, _out_T_20) @[ALU.scala 70:8]
    node _out_T_22 = mux(_out_T_10, _out_T_11, _out_T_21) @[ALU.scala 69:8]
    node _out_T_23 = mux(_out_T_9, shitfl, _out_T_22) @[ALU.scala 68:8]
    node _out_T_24 = mux(_out_T_8, shiftr, _out_T_23) @[ALU.scala 67:8]
    node _out_T_25 = mux(_out_T_5, cmp, _out_T_24) @[ALU.scala 66:8]
    node out = mux(_out_T_2, sum, _out_T_25) @[ALU.scala 65:8]
    io_out <= out @[ALU.scala 76:12]
    io_sum <= sum @[ALU.scala 77:12]
    io_CU_Branch_taken <= UInt<1>("h0") @[ALU.scala 118:22]

  module Data_Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_Data_Mem_address : UInt<32>
    input io_Data_Mem_data : SInt<32>
    input io_Data_Mem_write : UInt<1>
    input io_Data_Mem_read : UInt<1>
    output io_Data_Mem_output : SInt<32>

    mem Memory : @[Data-Memory.scala 15:21]
      data-type => SInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_Data_Mem_output_MPORT
      writer => MPORT
      read-under-write => undefined
    node _T = bits(io_Data_Mem_address, 9, 0)
    node _GEN_0 = validif(io_Data_Mem_write, _T) @[Data-Memory.scala 17:28]
    node _GEN_1 = validif(io_Data_Mem_write, clock) @[Data-Memory.scala 17:28]
    node _GEN_2 = mux(io_Data_Mem_write, UInt<1>("h1"), UInt<1>("h0")) @[Data-Memory.scala 17:28 Data-Memory.scala 15:21]
    node _GEN_3 = validif(io_Data_Mem_write, UInt<1>("h1")) @[Data-Memory.scala 17:28]
    node _GEN_4 = validif(io_Data_Mem_write, io_Data_Mem_data) @[Data-Memory.scala 17:28]
    node _io_Data_Mem_output_T = bits(io_Data_Mem_address, 9, 0) @[Data-Memory.scala 21:42]
    node _GEN_5 = validif(io_Data_Mem_read, _io_Data_Mem_output_T) @[Data-Memory.scala 20:27 Data-Memory.scala 21:42]
    node _GEN_6 = validif(io_Data_Mem_read, clock) @[Data-Memory.scala 20:27 Data-Memory.scala 21:42]
    node _GEN_7 = mux(io_Data_Mem_read, UInt<1>("h1"), UInt<1>("h0")) @[Data-Memory.scala 20:27 Data-Memory.scala 21:42 Data-Memory.scala 15:21]
    node _GEN_8 = validif(io_Data_Mem_read, Memory.io_Data_Mem_output_MPORT.data) @[Data-Memory.scala 20:27 Data-Memory.scala 21:28]
    io_Data_Mem_output <= _GEN_8
    Memory.io_Data_Mem_output_MPORT.addr <= _GEN_5
    Memory.io_Data_Mem_output_MPORT.en <= _GEN_7
    Memory.io_Data_Mem_output_MPORT.clk <= _GEN_6
    Memory.MPORT.addr <= _GEN_0
    Memory.MPORT.en <= _GEN_2
    Memory.MPORT.clk <= _GEN_1
    Memory.MPORT.data <= _GEN_4
    Memory.MPORT.mask <= _GEN_3

  module ImmdValGen :
    input clock : Clock
    input reset : UInt<1>
    input io_Imm_instr : SInt<32>
    output io_immd_se_I : SInt<32>
    output io_immd_se_U : SInt<32>
    output io_immd_se_UJ : SInt<32>
    output io_immd_se_S : SInt<32>
    output io_immd_se_SB : SInt<32>

    node _T = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 20:18]
    node _T_1 = eq(_T, UInt<5>("h1b")) @[Immediate-Generation.scala 20:24]
    node _T_2 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 21:18]
    node _T_3 = eq(_T_2, UInt<2>("h3")) @[Immediate-Generation.scala 21:24]
    node _T_4 = or(_T_1, _T_3) @[Immediate-Generation.scala 20:42]
    node _T_5 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 22:18]
    node _T_6 = eq(_T_5, UInt<4>("hf")) @[Immediate-Generation.scala 22:24]
    node _T_7 = or(_T_4, _T_6) @[Immediate-Generation.scala 21:42]
    node _T_8 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 23:18]
    node _T_9 = eq(_T_8, UInt<5>("h1b")) @[Immediate-Generation.scala 23:24]
    node _T_10 = or(_T_7, _T_9) @[Immediate-Generation.scala 22:42]
    node _T_11 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 24:18]
    node _T_12 = eq(_T_11, UInt<7>("h67")) @[Immediate-Generation.scala 24:24]
    node _T_13 = or(_T_10, _T_12) @[Immediate-Generation.scala 23:42]
    node _T_14 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 25:18]
    node _T_15 = eq(_T_14, UInt<7>("h73")) @[Immediate-Generation.scala 25:24]
    node _T_16 = or(_T_13, _T_15) @[Immediate-Generation.scala 24:42]
    node _io_immd_se_I_T = bits(io_Imm_instr, 31, 20) @[Immediate-Generation.scala 29:38]
    node _io_immd_se_I_T_1 = asSInt(_io_immd_se_I_T) @[Immediate-Generation.scala 29:52]
    node _io_immd_se_I_T_2 = or(asSInt(UInt<1>("h0")), _io_immd_se_I_T_1) @[Immediate-Generation.scala 29:24]
    node _io_immd_se_I_T_3 = asSInt(_io_immd_se_I_T_2) @[Immediate-Generation.scala 29:24]
    node _T_17 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 36:18]
    node _T_18 = eq(_T_17, UInt<5>("h17")) @[Immediate-Generation.scala 36:24]
    node _T_19 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 37:18]
    node _T_20 = eq(_T_19, UInt<6>("h37")) @[Immediate-Generation.scala 37:24]
    node _T_21 = or(_T_18, _T_20) @[Immediate-Generation.scala 36:42]
    node _io_immd_se_U_T = bits(io_Imm_instr, 31, 12) @[Immediate-Generation.scala 41:37]
    node _io_immd_se_U_T_1 = asSInt(_io_immd_se_U_T) @[Immediate-Generation.scala 41:51]
    node _io_immd_se_U_T_2 = or(asSInt(UInt<1>("h0")), _io_immd_se_U_T_1) @[Immediate-Generation.scala 41:23]
    node _io_immd_se_U_T_3 = asSInt(_io_immd_se_U_T_2) @[Immediate-Generation.scala 41:23]
    node _T_22 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 48:18]
    node _T_23 = eq(_T_22, UInt<7>("h6f")) @[Immediate-Generation.scala 48:24]
    node io_immd_se_UJ_hi_hi_hi = bits(io_Imm_instr, 31, 31) @[Immediate-Generation.scala 52:40]
    node io_immd_se_UJ_hi_hi_lo = bits(io_Imm_instr, 19, 12) @[Immediate-Generation.scala 52:58]
    node io_immd_se_UJ_hi_lo = bits(io_Imm_instr, 20, 20) @[Immediate-Generation.scala 52:80]
    node io_immd_se_UJ_lo_hi = bits(io_Imm_instr, 30, 21) @[Immediate-Generation.scala 52:98]
    node io_immd_se_UJ_lo = cat(io_immd_se_UJ_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_immd_se_UJ_hi_hi = cat(io_immd_se_UJ_hi_hi_hi, io_immd_se_UJ_hi_hi_lo) @[Cat.scala 30:58]
    node io_immd_se_UJ_hi = cat(io_immd_se_UJ_hi_hi, io_immd_se_UJ_hi_lo) @[Cat.scala 30:58]
    node _io_immd_se_UJ_T = cat(io_immd_se_UJ_hi, io_immd_se_UJ_lo) @[Cat.scala 30:58]
    node _io_immd_se_UJ_T_1 = asSInt(_io_immd_se_UJ_T) @[Immediate-Generation.scala 52:118]
    node _io_immd_se_UJ_T_2 = sub(asSInt(UInt<1>("h0")), _io_immd_se_UJ_T_1) @[Immediate-Generation.scala 52:22]
    node _io_immd_se_UJ_T_3 = tail(_io_immd_se_UJ_T_2, 1) @[Immediate-Generation.scala 52:22]
    node _io_immd_se_UJ_T_4 = asSInt(_io_immd_se_UJ_T_3) @[Immediate-Generation.scala 52:22]
    node _T_24 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 61:18]
    node _T_25 = eq(_T_24, UInt<6>("h23")) @[Immediate-Generation.scala 61:24]
    node _T_26 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 62:18]
    node _T_27 = eq(_T_26, UInt<7>("h63")) @[Immediate-Generation.scala 62:24]
    node _T_28 = or(_T_25, _T_27) @[Immediate-Generation.scala 61:42]
    node _io_immd_se_S_T = bits(io_Imm_instr, 31, 22) @[Immediate-Generation.scala 66:37]
    node _io_immd_se_S_T_1 = asSInt(_io_immd_se_S_T) @[Immediate-Generation.scala 66:51]
    node _io_immd_se_S_T_2 = or(asSInt(UInt<1>("h0")), _io_immd_se_S_T_1) @[Immediate-Generation.scala 66:23]
    node _io_immd_se_S_T_3 = asSInt(_io_immd_se_S_T_2) @[Immediate-Generation.scala 66:23]
    node _T_29 = bits(io_Imm_instr, 6, 0) @[Immediate-Generation.scala 74:18]
    node _T_30 = eq(_T_29, UInt<7>("h63")) @[Immediate-Generation.scala 74:24]
    node _io_immd_se_SB_T = bits(io_Imm_instr, 31, 22) @[Immediate-Generation.scala 78:38]
    node _io_immd_se_SB_T_1 = asSInt(_io_immd_se_SB_T) @[Immediate-Generation.scala 78:52]
    node _io_immd_se_SB_T_2 = or(asSInt(UInt<1>("h0")), _io_immd_se_SB_T_1) @[Immediate-Generation.scala 78:24]
    node _io_immd_se_SB_T_3 = asSInt(_io_immd_se_SB_T_2) @[Immediate-Generation.scala 78:24]
    node _GEN_0 = validif(_T_30, _io_immd_se_SB_T_3) @[Immediate-Generation.scala 77:3 Immediate-Generation.scala 78:18]
    node _GEN_1 = validif(_T_28, _io_immd_se_S_T_3) @[Immediate-Generation.scala 65:3 Immediate-Generation.scala 66:17]
    node _GEN_2 = validif(eq(_T_28, UInt<1>("h0")), _GEN_0) @[Immediate-Generation.scala 65:3]
    node _GEN_3 = validif(_T_23, _io_immd_se_UJ_T_4) @[Immediate-Generation.scala 51:3 Immediate-Generation.scala 52:19]
    node _GEN_4 = validif(eq(_T_23, UInt<1>("h0")), _GEN_1) @[Immediate-Generation.scala 51:3]
    node _GEN_5 = validif(eq(_T_23, UInt<1>("h0")), _GEN_2) @[Immediate-Generation.scala 51:3]
    node _GEN_6 = validif(_T_21, _io_immd_se_U_T_3) @[Immediate-Generation.scala 40:3 Immediate-Generation.scala 41:17]
    node _GEN_7 = validif(eq(_T_21, UInt<1>("h0")), _GEN_3) @[Immediate-Generation.scala 40:3]
    node _GEN_8 = validif(eq(_T_21, UInt<1>("h0")), _GEN_4) @[Immediate-Generation.scala 40:3]
    node _GEN_9 = validif(eq(_T_21, UInt<1>("h0")), _GEN_5) @[Immediate-Generation.scala 40:3]
    node _GEN_10 = validif(_T_16, _io_immd_se_I_T_3) @[Immediate-Generation.scala 28:3 Immediate-Generation.scala 29:17]
    node _GEN_11 = validif(eq(_T_16, UInt<1>("h0")), _GEN_6) @[Immediate-Generation.scala 28:3]
    node _GEN_12 = validif(eq(_T_16, UInt<1>("h0")), _GEN_7) @[Immediate-Generation.scala 28:3]
    node _GEN_13 = validif(eq(_T_16, UInt<1>("h0")), _GEN_8) @[Immediate-Generation.scala 28:3]
    node _GEN_14 = validif(eq(_T_16, UInt<1>("h0")), _GEN_9) @[Immediate-Generation.scala 28:3]
    io_immd_se_I <= _GEN_10
    io_immd_se_U <= _GEN_11
    io_immd_se_UJ <= _GEN_12
    io_immd_se_S <= _GEN_13
    io_immd_se_SB <= _GEN_14

  module PC :
    input clock : Clock
    input reset : UInt<1>
    input io_pc : SInt<32>
    output io_pc1 : SInt<32>
    output io_pc4 : SInt<32>

    reg pc_reg : SInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_reg) @[Program-Counter.scala 17:25]
    node _io_pc4_T = add(pc_reg, asSInt(UInt<4>("h4"))) @[Program-Counter.scala 21:22]
    node _io_pc4_T_1 = tail(_io_pc4_T, 1) @[Program-Counter.scala 21:22]
    node _io_pc4_T_2 = asSInt(_io_pc4_T_1) @[Program-Counter.scala 21:22]
    io_pc1 <= pc_reg @[Program-Counter.scala 20:12]
    io_pc4 <= _io_pc4_T_2 @[Program-Counter.scala 21:12]
    pc_reg <= mux(reset, asSInt(UInt<32>("h0")), io_pc) @[Program-Counter.scala 17:25 Program-Counter.scala 17:25 Program-Counter.scala 18:12]

  module Jalr :
    input clock : Clock
    input reset : UInt<1>
    input io_rd : SInt<32>
    input io_rs1 : SInt<32>
    output io_imm : SInt<32>

    node _io_imm_T = add(io_rd, io_rs1) @[Jalr.scala 13:19]
    node _io_imm_T_1 = tail(_io_imm_T, 1) @[Jalr.scala 13:19]
    node _io_imm_T_2 = asSInt(_io_imm_T_1) @[Jalr.scala 13:19]
    node _io_imm_T_3 = and(_io_imm_T_2, asSInt(UInt<37>("hffffffffe"))) @[Jalr.scala 13:28]
    node _io_imm_T_4 = asSInt(_io_imm_T_3) @[Jalr.scala 13:28]
    io_imm <= asSInt(bits(_io_imm_T_4, 31, 0)) @[Jalr.scala 13:10]

  module Register_File :
    input clock : Clock
    input reset : UInt<1>
    input io_ReadReg1 : UInt<5>
    input io_ReadReg2 : UInt<5>
    input io_RegWrite : UInt<1>
    input io_WriteReg : UInt<5>
    input io_WriteData : SInt<32>
    output io_ReadData1 : SInt<32>
    output io_ReadData2 : SInt<32>

    reg Reg_File_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_0) @[Register-File.scala 16:27]
    reg Reg_File_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_1) @[Register-File.scala 16:27]
    reg Reg_File_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_2) @[Register-File.scala 16:27]
    reg Reg_File_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_3) @[Register-File.scala 16:27]
    reg Reg_File_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_4) @[Register-File.scala 16:27]
    reg Reg_File_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_5) @[Register-File.scala 16:27]
    reg Reg_File_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_6) @[Register-File.scala 16:27]
    reg Reg_File_7 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_7) @[Register-File.scala 16:27]
    reg Reg_File_8 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_8) @[Register-File.scala 16:27]
    reg Reg_File_9 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_9) @[Register-File.scala 16:27]
    reg Reg_File_10 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_10) @[Register-File.scala 16:27]
    reg Reg_File_11 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_11) @[Register-File.scala 16:27]
    reg Reg_File_12 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_12) @[Register-File.scala 16:27]
    reg Reg_File_13 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_13) @[Register-File.scala 16:27]
    reg Reg_File_14 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_14) @[Register-File.scala 16:27]
    reg Reg_File_15 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_15) @[Register-File.scala 16:27]
    reg Reg_File_16 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_16) @[Register-File.scala 16:27]
    reg Reg_File_17 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_17) @[Register-File.scala 16:27]
    reg Reg_File_18 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_18) @[Register-File.scala 16:27]
    reg Reg_File_19 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_19) @[Register-File.scala 16:27]
    reg Reg_File_20 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_20) @[Register-File.scala 16:27]
    reg Reg_File_21 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_21) @[Register-File.scala 16:27]
    reg Reg_File_22 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_22) @[Register-File.scala 16:27]
    reg Reg_File_23 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_23) @[Register-File.scala 16:27]
    reg Reg_File_24 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_24) @[Register-File.scala 16:27]
    reg Reg_File_25 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_25) @[Register-File.scala 16:27]
    reg Reg_File_26 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_26) @[Register-File.scala 16:27]
    reg Reg_File_27 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_27) @[Register-File.scala 16:27]
    reg Reg_File_28 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_28) @[Register-File.scala 16:27]
    reg Reg_File_29 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_29) @[Register-File.scala 16:27]
    reg Reg_File_30 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_30) @[Register-File.scala 16:27]
    reg Reg_File_31 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg_File_31) @[Register-File.scala 16:27]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_ReadReg1), Reg_File_0) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_ReadReg1), Reg_File_1, _GEN_0) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_ReadReg1), Reg_File_2, _GEN_1) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_ReadReg1), Reg_File_3, _GEN_2) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_ReadReg1), Reg_File_4, _GEN_3) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_ReadReg1), Reg_File_5, _GEN_4) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_ReadReg1), Reg_File_6, _GEN_5) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_ReadReg1), Reg_File_7, _GEN_6) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_ReadReg1), Reg_File_8, _GEN_7) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_ReadReg1), Reg_File_9, _GEN_8) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_ReadReg1), Reg_File_10, _GEN_9) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_ReadReg1), Reg_File_11, _GEN_10) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_ReadReg1), Reg_File_12, _GEN_11) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_ReadReg1), Reg_File_13, _GEN_12) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_ReadReg1), Reg_File_14, _GEN_13) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_ReadReg1), Reg_File_15, _GEN_14) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_ReadReg1), Reg_File_16, _GEN_15) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_ReadReg1), Reg_File_17, _GEN_16) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_ReadReg1), Reg_File_18, _GEN_17) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_ReadReg1), Reg_File_19, _GEN_18) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_ReadReg1), Reg_File_20, _GEN_19) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_ReadReg1), Reg_File_21, _GEN_20) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_ReadReg1), Reg_File_22, _GEN_21) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_ReadReg1), Reg_File_23, _GEN_22) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_ReadReg1), Reg_File_24, _GEN_23) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_ReadReg1), Reg_File_25, _GEN_24) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_ReadReg1), Reg_File_26, _GEN_25) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_ReadReg1), Reg_File_27, _GEN_26) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_ReadReg1), Reg_File_28, _GEN_27) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_ReadReg1), Reg_File_29, _GEN_28) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_ReadReg1), Reg_File_30, _GEN_29) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_ReadReg1), Reg_File_31, _GEN_30) @[Register-File.scala 19:18 Register-File.scala 19:18]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_ReadReg2), Reg_File_0) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_ReadReg2), Reg_File_1, _GEN_32) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_ReadReg2), Reg_File_2, _GEN_33) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_ReadReg2), Reg_File_3, _GEN_34) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_ReadReg2), Reg_File_4, _GEN_35) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_ReadReg2), Reg_File_5, _GEN_36) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_ReadReg2), Reg_File_6, _GEN_37) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_ReadReg2), Reg_File_7, _GEN_38) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_ReadReg2), Reg_File_8, _GEN_39) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_ReadReg2), Reg_File_9, _GEN_40) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_ReadReg2), Reg_File_10, _GEN_41) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_ReadReg2), Reg_File_11, _GEN_42) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_ReadReg2), Reg_File_12, _GEN_43) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_ReadReg2), Reg_File_13, _GEN_44) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_ReadReg2), Reg_File_14, _GEN_45) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_ReadReg2), Reg_File_15, _GEN_46) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_ReadReg2), Reg_File_16, _GEN_47) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_ReadReg2), Reg_File_17, _GEN_48) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_ReadReg2), Reg_File_18, _GEN_49) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_ReadReg2), Reg_File_19, _GEN_50) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_ReadReg2), Reg_File_20, _GEN_51) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_ReadReg2), Reg_File_21, _GEN_52) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_ReadReg2), Reg_File_22, _GEN_53) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_ReadReg2), Reg_File_23, _GEN_54) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_ReadReg2), Reg_File_24, _GEN_55) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_ReadReg2), Reg_File_25, _GEN_56) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_ReadReg2), Reg_File_26, _GEN_57) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_ReadReg2), Reg_File_27, _GEN_58) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_ReadReg2), Reg_File_28, _GEN_59) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_ReadReg2), Reg_File_29, _GEN_60) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_ReadReg2), Reg_File_30, _GEN_61) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_ReadReg2), Reg_File_31, _GEN_62) @[Register-File.scala 20:18 Register-File.scala 20:18]
    node _Reg_File_io_WriteReg = io_WriteData @[Register-File.scala 23:31 Register-File.scala 23:31]
    node _GEN_64 = mux(eq(UInt<1>("h0"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_0) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_1) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_2) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_3) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_4) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_5) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_6) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_7) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_8) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_9) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_10) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_11) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_12) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_13) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_14) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_15) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_16) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_17) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_18) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_19) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_20) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_21) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_22) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_23) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_24) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_25) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_26) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_27) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_28) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_29) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_30) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_WriteReg), _Reg_File_io_WriteReg, Reg_File_31) @[Register-File.scala 23:31 Register-File.scala 23:31 Register-File.scala 16:27]
    node _GEN_96 = mux(io_RegWrite, _GEN_64, Reg_File_0) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_97 = mux(io_RegWrite, _GEN_65, Reg_File_1) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_98 = mux(io_RegWrite, _GEN_66, Reg_File_2) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_99 = mux(io_RegWrite, _GEN_67, Reg_File_3) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_100 = mux(io_RegWrite, _GEN_68, Reg_File_4) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_101 = mux(io_RegWrite, _GEN_69, Reg_File_5) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_102 = mux(io_RegWrite, _GEN_70, Reg_File_6) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_103 = mux(io_RegWrite, _GEN_71, Reg_File_7) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_104 = mux(io_RegWrite, _GEN_72, Reg_File_8) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_105 = mux(io_RegWrite, _GEN_73, Reg_File_9) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_106 = mux(io_RegWrite, _GEN_74, Reg_File_10) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_107 = mux(io_RegWrite, _GEN_75, Reg_File_11) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_108 = mux(io_RegWrite, _GEN_76, Reg_File_12) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_109 = mux(io_RegWrite, _GEN_77, Reg_File_13) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_110 = mux(io_RegWrite, _GEN_78, Reg_File_14) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_111 = mux(io_RegWrite, _GEN_79, Reg_File_15) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_112 = mux(io_RegWrite, _GEN_80, Reg_File_16) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_113 = mux(io_RegWrite, _GEN_81, Reg_File_17) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_114 = mux(io_RegWrite, _GEN_82, Reg_File_18) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_115 = mux(io_RegWrite, _GEN_83, Reg_File_19) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_116 = mux(io_RegWrite, _GEN_84, Reg_File_20) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_117 = mux(io_RegWrite, _GEN_85, Reg_File_21) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_118 = mux(io_RegWrite, _GEN_86, Reg_File_22) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_119 = mux(io_RegWrite, _GEN_87, Reg_File_23) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_120 = mux(io_RegWrite, _GEN_88, Reg_File_24) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_121 = mux(io_RegWrite, _GEN_89, Reg_File_25) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_122 = mux(io_RegWrite, _GEN_90, Reg_File_26) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_123 = mux(io_RegWrite, _GEN_91, Reg_File_27) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_124 = mux(io_RegWrite, _GEN_92, Reg_File_28) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_125 = mux(io_RegWrite, _GEN_93, Reg_File_29) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_126 = mux(io_RegWrite, _GEN_94, Reg_File_30) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _GEN_127 = mux(io_RegWrite, _GEN_95, Reg_File_31) @[Register-File.scala 22:22 Register-File.scala 16:27]
    node _Reg_File_WIRE_0 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_1 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_2 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_3 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_4 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_5 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_6 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_7 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_8 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_9 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_10 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_11 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_12 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_13 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_14 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_15 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_16 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_17 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_18 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_19 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_20 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_21 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_22 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_23 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_24 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_25 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_26 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_27 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_28 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_29 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_30 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_WIRE_31 = asSInt(UInt<32>("h0")) @[Register-File.scala 16:35 Register-File.scala 16:35]
    node _Reg_File_io_ReadReg1 = _GEN_31 @[Register-File.scala 19:18]
    node _Reg_File_io_ReadReg2 = _GEN_63 @[Register-File.scala 20:18]
    io_ReadData1 <= _Reg_File_io_ReadReg1 @[Register-File.scala 19:18]
    io_ReadData2 <= _Reg_File_io_ReadReg2 @[Register-File.scala 20:18]
    Reg_File_0 <= mux(reset, _Reg_File_WIRE_0, asSInt(UInt<1>("h0"))) @[Register-File.scala 16:27 Register-File.scala 16:27 Register-File.scala 25:17]
    Reg_File_1 <= mux(reset, _Reg_File_WIRE_1, _GEN_97) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_2 <= mux(reset, _Reg_File_WIRE_2, _GEN_98) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_3 <= mux(reset, _Reg_File_WIRE_3, _GEN_99) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_4 <= mux(reset, _Reg_File_WIRE_4, _GEN_100) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_5 <= mux(reset, _Reg_File_WIRE_5, _GEN_101) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_6 <= mux(reset, _Reg_File_WIRE_6, _GEN_102) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_7 <= mux(reset, _Reg_File_WIRE_7, _GEN_103) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_8 <= mux(reset, _Reg_File_WIRE_8, _GEN_104) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_9 <= mux(reset, _Reg_File_WIRE_9, _GEN_105) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_10 <= mux(reset, _Reg_File_WIRE_10, _GEN_106) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_11 <= mux(reset, _Reg_File_WIRE_11, _GEN_107) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_12 <= mux(reset, _Reg_File_WIRE_12, _GEN_108) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_13 <= mux(reset, _Reg_File_WIRE_13, _GEN_109) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_14 <= mux(reset, _Reg_File_WIRE_14, _GEN_110) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_15 <= mux(reset, _Reg_File_WIRE_15, _GEN_111) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_16 <= mux(reset, _Reg_File_WIRE_16, _GEN_112) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_17 <= mux(reset, _Reg_File_WIRE_17, _GEN_113) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_18 <= mux(reset, _Reg_File_WIRE_18, _GEN_114) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_19 <= mux(reset, _Reg_File_WIRE_19, _GEN_115) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_20 <= mux(reset, _Reg_File_WIRE_20, _GEN_116) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_21 <= mux(reset, _Reg_File_WIRE_21, _GEN_117) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_22 <= mux(reset, _Reg_File_WIRE_22, _GEN_118) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_23 <= mux(reset, _Reg_File_WIRE_23, _GEN_119) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_24 <= mux(reset, _Reg_File_WIRE_24, _GEN_120) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_25 <= mux(reset, _Reg_File_WIRE_25, _GEN_121) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_26 <= mux(reset, _Reg_File_WIRE_26, _GEN_122) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_27 <= mux(reset, _Reg_File_WIRE_27, _GEN_123) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_28 <= mux(reset, _Reg_File_WIRE_28, _GEN_124) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_29 <= mux(reset, _Reg_File_WIRE_29, _GEN_125) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_30 <= mux(reset, _Reg_File_WIRE_30, _GEN_126) @[Register-File.scala 16:27 Register-File.scala 16:27]
    Reg_File_31 <= mux(reset, _Reg_File_WIRE_31, _GEN_127) @[Register-File.scala 16:27 Register-File.scala 16:27]

  module TOP :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<32>

    inst Instr_Mod of Instruction_Memory @[TOP.scala 14:27]
    inst CU_Mod of Control_Unit @[TOP.scala 15:24]
    inst ALU_Mod of ALU @[TOP.scala 16:25]
    inst Data_Memory_Mod of Data_Memory @[TOP.scala 17:33]
    inst Immediate_Gen_Mod of ImmdValGen @[TOP.scala 18:35]
    inst PC_Mod of PC @[TOP.scala 19:24]
    inst Jalr_Mod of Jalr @[TOP.scala 20:26]
    inst Reg_Mod of Register_File @[TOP.scala 21:25]
    node Main_ALU_Mux = mux(ALU_Mod.io_CU_Branch_taken, ALU_Mod.io_in_A, ALU_Mod.io_in_B) @[TOP.scala 33:27]
    node br = and(ALU_Mod.io_CU_Branch_taken, CU_Mod.io_CU_Branch) @[TOP.scala 36:41]
    node Br_Mux = mux(br, Immediate_Gen_Mod.io_immd_se_SB, PC_Mod.io_pc4) @[TOP.scala 37:21]
    node _pc_input_T = eq(UInt<1>("h1"), CU_Mod.io_CU_Next_PC) @[Mux.scala 80:60]
    node _pc_input_T_1 = mux(_pc_input_T, Br_Mux, PC_Mod.io_pc4) @[Mux.scala 80:57]
    node _pc_input_T_2 = eq(UInt<2>("h2"), CU_Mod.io_CU_Next_PC) @[Mux.scala 80:60]
    node _pc_input_T_3 = mux(_pc_input_T_2, Immediate_Gen_Mod.io_immd_se_UJ, _pc_input_T_1) @[Mux.scala 80:57]
    node _pc_input_T_4 = eq(UInt<2>("h3"), CU_Mod.io_CU_Next_PC) @[Mux.scala 80:60]
    node pc_input = mux(_pc_input_T_4, Jalr_Mod.io_imm, _pc_input_T_3) @[Mux.scala 80:57]
    node _Instr_Mod_io_memory_address_T = bits(PC_Mod.io_pc1, 21, 2) @[TOP.scala 54:50]
    node _CU_Mod_io_CU_Opcode_T = bits(Instr_Mod.io_memory_instruction, 6, 0) @[TOP.scala 58:59]
    node _Reg_Mod_io_ReadReg1_T = bits(Instr_Mod.io_memory_instruction, 19, 15) @[TOP.scala 62:59]
    node _Reg_Mod_io_ReadReg2_T = bits(Instr_Mod.io_memory_instruction, 24, 20) @[TOP.scala 63:59]
    node _Reg_Mod_io_WriteReg_T = bits(Instr_Mod.io_memory_instruction, 11, 7) @[TOP.scala 64:60]
    node _Reg_Mod_io_WriteData_T = asSInt(ALU_Mod.io_out) @[TOP.scala 67:111]
    node _Reg_Mod_io_WriteData_T_1 = mux(CU_Mod.io_CU_MemToReg, Data_Memory_Mod.io_Data_Mem_output, _Reg_Mod_io_WriteData_T) @[TOP.scala 67:32]
    node _Immediate_Gen_Mod_io_Imm_instr_T = asSInt(Instr_Mod.io_memory_instruction) @[TOP.scala 71:77]
    node _Imm_Mux_Output_T = eq(UInt<1>("h0"), CU_Mod.io_CU_Extend_sel) @[Mux.scala 80:60]
    node _Imm_Mux_Output_T_1 = mux(_Imm_Mux_Output_T, Immediate_Gen_Mod.io_immd_se_I, asSInt(UInt<1>("h0"))) @[Mux.scala 80:57]
    node _Imm_Mux_Output_T_2 = eq(UInt<1>("h1"), CU_Mod.io_CU_Extend_sel) @[Mux.scala 80:60]
    node _Imm_Mux_Output_T_3 = mux(_Imm_Mux_Output_T_2, Immediate_Gen_Mod.io_immd_se_S, _Imm_Mux_Output_T_1) @[Mux.scala 80:57]
    node _Imm_Mux_Output_T_4 = eq(UInt<2>("h2"), CU_Mod.io_CU_Extend_sel) @[Mux.scala 80:60]
    node Imm_Mux_Output = mux(_Imm_Mux_Output_T_4, Immediate_Gen_Mod.io_immd_se_U, _Imm_Mux_Output_T_3) @[Mux.scala 80:57]
    node ALU_Mux_2 = mux(CU_Mod.io_CU_InB, Imm_Mux_Output, Reg_Mod.io_ReadData2) @[TOP.scala 94:24]
    node _ALU_Mux_1_T = eq(UInt<1>("h1"), CU_Mod.io_CU_InA) @[Mux.scala 80:60]
    node _ALU_Mux_1_T_1 = mux(_ALU_Mux_1_T, PC_Mod.io_pc1, Reg_Mod.io_ReadData1) @[Mux.scala 80:57]
    node _ALU_Mux_1_T_2 = eq(UInt<2>("h2"), CU_Mod.io_CU_InA) @[Mux.scala 80:60]
    node _ALU_Mux_1_T_3 = mux(_ALU_Mux_1_T_2, PC_Mod.io_pc4, _ALU_Mux_1_T_1) @[Mux.scala 80:57]
    node _ALU_Mux_1_T_4 = eq(UInt<2>("h3"), CU_Mod.io_CU_InA) @[Mux.scala 80:60]
    node ALU_Mux_1 = mux(_ALU_Mux_1_T_4, Reg_Mod.io_ReadData1, _ALU_Mux_1_T_3) @[Mux.scala 80:57]
    node Func3 = bits(Instr_Mod.io_memory_instruction, 14, 12) @[TOP.scala 105:48]
    node Func7 = bits(Instr_Mod.io_memory_instruction, 30, 30) @[TOP.scala 106:48]
    node _ALU_Mod_io_in_A_T = asUInt(ALU_Mux_1) @[TOP.scala 111:40]
    node _ALU_Mod_io_in_B_T = asUInt(ALU_Mux_2) @[TOP.scala 112:40]
    io_out <= CU_Mod.io_CU_MemWrite @[TOP.scala 120:8]
    Instr_Mod.clock <= clock
    Instr_Mod.reset <= reset
    Instr_Mod.io_memory_address <= _Instr_Mod_io_memory_address_T @[TOP.scala 54:33]
    CU_Mod.clock <= clock
    CU_Mod.reset <= reset
    CU_Mod.io_CU_Opcode <= _CU_Mod_io_CU_Opcode_T @[TOP.scala 58:25]
    ALU_Mod.clock <= clock
    ALU_Mod.reset <= reset
    ALU_Mod.io_in_A <= _ALU_Mod_io_in_A_T @[TOP.scala 111:21]
    ALU_Mod.io_in_B <= _ALU_Mod_io_in_B_T @[TOP.scala 112:21]
    ALU_Mod.io_func3 <= CU_Mod.io_CU_Opcode @[TOP.scala 115:22]
    ALU_Mod.io_alu_Op <= CU_Mod.io_CU_ALU_op @[TOP.scala 108:23]
    Data_Memory_Mod.clock <= clock
    Data_Memory_Mod.reset <= reset
    Data_Memory_Mod.io_Data_Mem_address <= ALU_Mod.io_out @[TOP.scala 75:41]
    Data_Memory_Mod.io_Data_Mem_data <= Reg_Mod.io_ReadData1 @[TOP.scala 76:38]
    Data_Memory_Mod.io_Data_Mem_write <= CU_Mod.io_CU_MemWrite @[TOP.scala 77:39]
    Data_Memory_Mod.io_Data_Mem_read <= CU_Mod.io_CU_MemRead @[TOP.scala 78:38]
    Immediate_Gen_Mod.clock <= clock
    Immediate_Gen_Mod.reset <= reset
    Immediate_Gen_Mod.io_Imm_instr <= _Immediate_Gen_Mod_io_Imm_instr_T @[TOP.scala 71:36]
    PC_Mod.clock <= clock
    PC_Mod.reset <= reset
    PC_Mod.io_pc <= pc_input @[TOP.scala 51:18]
    Jalr_Mod.clock <= clock
    Jalr_Mod.reset <= reset
    Jalr_Mod.io_rd <= Reg_Mod.io_ReadData1 @[TOP.scala 88:20]
    Jalr_Mod.io_rs1 <= Imm_Mux_Output @[TOP.scala 89:21]
    Reg_Mod.clock <= clock
    Reg_Mod.reset <= reset
    Reg_Mod.io_ReadReg1 <= _Reg_Mod_io_ReadReg1_T @[TOP.scala 62:25]
    Reg_Mod.io_ReadReg2 <= _Reg_Mod_io_ReadReg2_T @[TOP.scala 63:25]
    Reg_Mod.io_RegWrite <= CU_Mod.io_CU_RegWrite @[TOP.scala 65:25]
    Reg_Mod.io_WriteReg <= _Reg_Mod_io_WriteReg_T @[TOP.scala 64:26]
    Reg_Mod.io_WriteData <= _Reg_Mod_io_WriteData_T_1 @[TOP.scala 67:26]
