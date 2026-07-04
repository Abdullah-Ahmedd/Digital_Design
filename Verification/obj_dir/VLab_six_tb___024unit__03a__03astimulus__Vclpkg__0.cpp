// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VLab_six_tb.h for the primary calling header

#include "VLab_six_tb__pch.h"

void VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_pre_randomize(VLab_six_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_pre_randomize\n"); );
    // Body
    VL_WRITEF_NX("///////////////pre randomization values///////////////\nthe command is cmd=%0h\n payload[0]=%0h\n payload[1]=%0h\n payload[2]=%0h\n payload[3]=%0h\n",5
                 , '#',8,this->__PVT__cmd, '#',8,this->__PVT__payload[0U]
                 , '#',8,this->__PVT__payload[1U], '#',8,this->__PVT__payload[2U]
                 , '#',8,this->__PVT__payload[3U]);
}

void VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_post_randomize(VLab_six_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_post_randomize\n"); );
    // Body
    VL_WRITEF_NX("///////////////post randomization values///////////////\nthe command is cmd=%0h\n payload[0]=%0h\n payload[1]=%0h\n payload[2]=%0h\n payload[3]=%0h\n",5
                 , '#',8,this->__PVT__cmd, '#',8,this->__PVT__payload[0U]
                 , '#',8,this->__PVT__payload[1U], '#',8,this->__PVT__payload[2U]
                 , '#',8,this->__PVT__payload[3U]);
}

VlCoroutine VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_drive(VLab_six_tb__Syms* __restrict vlSymsp, CData/*7:0*/ &sig, CData/*0:0*/ &c) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_drive\n"); );
    // Locals
    CData/*0:0*/ __Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__1;
    __Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__1 = 0;
    CData/*0:0*/ __Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__0;
    __Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__0 = 0;
    // Body
    VL_KEEP_THIS;
    IData/*31:0*/ unnamedblk3__DOT__i;
    unnamedblk3__DOT__i = 0;
    CData/*0:0*/ __VdynTrigger_hbf03fd6e__0;
    __VdynTrigger_hbf03fd6e__0 = 0;
    __VdynTrigger_hbf03fd6e__0 = 0U;
    __Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__0 
        = c;
    while ((1U & (~ (IData)(__VdynTrigger_hbf03fd6e__0)))) {
        co_await vlSymsp->TOP.__VdynSched.evaluation(
                                                     nullptr, 
                                                     "@(posedge $unit::stimulus.c)", 
                                                     "Labs/Lab_six\\stimulus.sv", 
                                                     30);
        __VdynTrigger_hbf03fd6e__0 = ((IData)(c) & 
                                      (~ (IData)(__Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__0)));
        vlSymsp->TOP.__VdynSched.anyTriggered(__VdynTrigger_hbf03fd6e__0);
        __Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__0 
            = c;
    }
    co_await vlSymsp->TOP.__VdynSched.resumption(nullptr, 
                                                 "@(posedge $unit::stimulus.c)", 
                                                 "Labs/Lab_six\\stimulus.sv", 
                                                 30);
    sig = this->__PVT__cmd;
    unnamedblk3__DOT__i = 0U;
    while (VL_GTES_III(32, 3U, unnamedblk3__DOT__i)) {
        CData/*0:0*/ __VdynTrigger_hbf03fd6e__1;
        __VdynTrigger_hbf03fd6e__1 = 0;
        __VdynTrigger_hbf03fd6e__1 = 0U;
        __Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__1 
            = c;
        while ((1U & (~ (IData)(__VdynTrigger_hbf03fd6e__1)))) {
            co_await vlSymsp->TOP.__VdynSched.evaluation(
                                                         nullptr, 
                                                         "@(posedge $unit::stimulus.c)", 
                                                         "Labs/Lab_six\\stimulus.sv", 
                                                         38);
            __VdynTrigger_hbf03fd6e__1 = ((IData)(c) 
                                          & (~ (IData)(__Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__1)));
            vlSymsp->TOP.__VdynSched.anyTriggered(__VdynTrigger_hbf03fd6e__1);
            __Vtrigprevexpr___TOP____024unit__03a__03astimulus__c__1 
                = c;
        }
        co_await vlSymsp->TOP.__VdynSched.resumption(
                                                     nullptr, 
                                                     "@(posedge $unit::stimulus.c)", 
                                                     "Labs/Lab_six\\stimulus.sv", 
                                                     38);
        sig = this->__PVT__payload[(3U & unnamedblk3__DOT__i)];
        VL_WRITEF_NX("the payload has been driven by the value payload[%0d]=%0d\n",2
                     , '~',32,unnamedblk3__DOT__i, '#',8,this->__PVT__payload
                     [(3U & unnamedblk3__DOT__i)]);
        unnamedblk3__DOT__i = ((IData)(1U) + unnamedblk3__DOT__i);
    }
    co_return;
}

void VLab_six_tb___024unit__03a__03astimulus::init(VLab_six_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::new\n"); );
    // Body
    _ctor_var_reset(vlSymsp);
    this->__PVT__constraint.write_var(this->__PVT__cmd, 8ULL, 
                                      "cmd", 0ULL);
    this->__PVT__constraint.write_var(this->__PVT__payload, 8ULL, 
                                      "payload", 1ULL);
}

void VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_randomize(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ &randomize__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_randomize\n"); );
    // Body
    IData/*31:0*/ __VlefCall_0____VBasicRand;
    this->__VnoInFunc_pre_randomize(vlSymsp);
    this->__PVT__constraint.clearConstraints();
    this->__VnoInFunc___Vsetup_constraints(vlSymsp);
    randomize__Vfuncrtn = this->__PVT__constraint.next(__Vm_rng);
    this->__VnoInFunc___VBasicRand(vlSymsp, __VlefCall_0____VBasicRand);
    randomize__Vfuncrtn = (randomize__Vfuncrtn & __VlefCall_0____VBasicRand);
    this->__VnoInFunc_post_randomize(vlSymsp);
}

void VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_c_setup_constraint(VLab_six_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc_c_setup_constraint\n"); );
    // Body
    QData/*63:0*/ __Vdist_bucket0;
    __Vdist_bucket0 = 0;
    __Vdist_bucket0 = (1ULL + VL_MODDIV_QQQ(64, (QData)(
                                                        VL_RANDOM_Q()), 9ULL));
    this->__PVT__constraint.hard(((3ULL >= __Vdist_bucket0)
                                   ? "(__Vbv (= ((_ zero_extend 24) cmd) #x00000001))"s
                                   : ((8ULL >= __Vdist_bucket0)
                                       ? "(__Vbv (= ((_ zero_extend 24) cmd) #x00000002))"s
                                       : "(__Vbv (= ((_ zero_extend 24) cmd) #x000000ff))"s)), "Labs/Lab_six\\stimulus.sv", 8U, 
                                 "    cmd dist {'h01:=3 ,'h02:=5 , 'hff:=1};");
    this->__PVT__constraint.hard("(bvand (__Vbv (bvuge (select payload #x00000000) #x10)) (__Vbv (bvule (select payload #x00000000) #x20)))"s, "Labs/Lab_six\\stimulus.sv", 0x0000000aU, 
                                 "            payload[i] inside {[8'h10 : 8'h20]};");
    this->__PVT__constraint.hard("(bvand (__Vbv (bvuge (select payload #x00000001) #x10)) (__Vbv (bvule (select payload #x00000001) #x20)))"s, "Labs/Lab_six\\stimulus.sv", 0x0000000aU, 
                                 "            payload[i] inside {[8'h10 : 8'h20]};");
    this->__PVT__constraint.hard("(bvand (__Vbv (bvuge (select payload #x00000002) #x10)) (__Vbv (bvule (select payload #x00000002) #x20)))"s, "Labs/Lab_six\\stimulus.sv", 0x0000000aU, 
                                 "            payload[i] inside {[8'h10 : 8'h20]};");
    this->__PVT__constraint.hard("(bvand (__Vbv (bvuge (select payload #x00000003) #x10)) (__Vbv (bvule (select payload #x00000003) #x20)))"s, "Labs/Lab_six\\stimulus.sv", 0x0000000aU, 
                                 "            payload[i] inside {[8'h10 : 8'h20]};");
}

void VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc___Vsetup_constraints(VLab_six_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc___Vsetup_constraints\n"); );
    // Body
    this->__VnoInFunc_c_setup_constraint(vlSymsp);
}

void VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc___VBasicRand(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ &__VBasicRand__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::__VnoInFunc___VBasicRand\n"); );
    // Body
    __VBasicRand__Vfuncrtn = 1U;
}

void VLab_six_tb___024unit__03a__03astimulus::_ctor_var_reset(VLab_six_tb__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::_ctor_var_reset\n"); );
    // Body
    (void)vlSymsp;  // Prevent unused variable warning
    __PVT__cmd = 0;
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        __PVT__payload[__Vi0] = 0;
    }
    __PVT__clk = 0;
}

std::string VLab_six_tb___024unit__03a__03astimulus::to_string() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::to_string\n"); );
    // Body
    return ("'{"s + to_string_middle() + "}");
}

std::string VLab_six_tb___024unit__03a__03astimulus::to_string_middle() const {
    VL_DEBUG_IF(VL_DBG_MSGF("+          VLab_six_tb___024unit__03a__03astimulus::to_string_middle\n"); );
    // Body
    std::string out;
    out += "cmd:" + VL_TO_STRING(__PVT__cmd);
    out += ", payload:" + VL_TO_STRING(__PVT__payload);
    out += ", clk:" + VL_TO_STRING(__PVT__clk);
    return (out);
}
