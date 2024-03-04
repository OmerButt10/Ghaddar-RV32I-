circuit CU_BranchControl :
  module CU_BranchControl :
    input clock : Clock
    input reset : UInt<1>
    input io_fnct3 : UInt<3>
    input io_CU_Branch : UInt<1>
    input io_CU_Branch_alu_inx : UInt<32>
    input io_CU_Branch_alu_iny : UInt<32>
    output io_CU_Branch_taken : UInt<1>

    node _T = eq(UInt<3>("h0"), io_fnct3) @[Conditional.scala 37:30]
    node _io_CU_Branch_taken_T = eq(io_CU_Branch_alu_inx, io_CU_Branch_alu_iny) @[ALU-CU_Branch-Control.scala 35:32]
    node _T_1 = eq(UInt<3>("h1"), io_fnct3) @[Conditional.scala 37:30]
    node _io_CU_Branch_taken_T_1 = neq(io_CU_Branch_alu_inx, io_CU_Branch_alu_iny) @[ALU-CU_Branch-Control.scala 38:32]
    node _T_2 = eq(UInt<3>("h4"), io_fnct3) @[Conditional.scala 37:30]
    node _io_CU_Branch_taken_T_2 = lt(io_CU_Branch_alu_inx, io_CU_Branch_alu_iny) @[ALU-CU_Branch-Control.scala 41:32]
    node _T_3 = eq(UInt<3>("h5"), io_fnct3) @[Conditional.scala 37:30]
    node _io_CU_Branch_taken_T_3 = geq(io_CU_Branch_alu_inx, io_CU_Branch_alu_iny) @[ALU-CU_Branch-Control.scala 44:32]
    node _T_4 = eq(UInt<3>("h6"), io_fnct3) @[Conditional.scala 37:30]
    node _io_CU_Branch_taken_T_4 = leq(io_CU_Branch_alu_inx, io_CU_Branch_alu_iny) @[ALU-CU_Branch-Control.scala 47:32]
    node _T_5 = eq(UInt<3>("h7"), io_fnct3) @[Conditional.scala 37:30]
    node _io_CU_Branch_taken_T_5 = gt(io_CU_Branch_alu_inx, io_CU_Branch_alu_iny) @[ALU-CU_Branch-Control.scala 50:32]
    node _T_6 = eq(UInt<3>("h2"), io_fnct3) @[Conditional.scala 37:30]
    node _io_CU_Branch_taken_T_6 = leq(io_CU_Branch_alu_inx, io_CU_Branch_alu_iny) @[ALU-CU_Branch-Control.scala 53:32]
    node _GEN_0 = mux(_T_6, _io_CU_Branch_taken_T_6, UInt<1>("h0")) @[Conditional.scala 39:67 ALU-CU_Branch-Control.scala 53:21 ALU-CU_Branch-Control.scala 30:15]
    node _GEN_1 = mux(_T_5, _io_CU_Branch_taken_T_5, _GEN_0) @[Conditional.scala 39:67 ALU-CU_Branch-Control.scala 50:21]
    node _GEN_2 = mux(_T_4, _io_CU_Branch_taken_T_4, _GEN_1) @[Conditional.scala 39:67 ALU-CU_Branch-Control.scala 47:21]
    node _GEN_3 = mux(_T_3, _io_CU_Branch_taken_T_3, _GEN_2) @[Conditional.scala 39:67 ALU-CU_Branch-Control.scala 44:21]
    node _GEN_4 = mux(_T_2, _io_CU_Branch_taken_T_2, _GEN_3) @[Conditional.scala 39:67 ALU-CU_Branch-Control.scala 41:21]
    node _GEN_5 = mux(_T_1, _io_CU_Branch_taken_T_1, _GEN_4) @[Conditional.scala 39:67 ALU-CU_Branch-Control.scala 38:21]
    node _GEN_6 = mux(_T, _io_CU_Branch_taken_T, _GEN_5) @[Conditional.scala 40:58 ALU-CU_Branch-Control.scala 35:21]
    node _GEN_7 = mux(io_CU_Branch, _GEN_6, UInt<1>("h0")) @[ALU-CU_Branch-Control.scala 32:19 ALU-CU_Branch-Control.scala 30:15]
    io_CU_Branch_taken <= _GEN_7
