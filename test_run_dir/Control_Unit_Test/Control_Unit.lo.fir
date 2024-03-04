circuit Control_Unit :
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
