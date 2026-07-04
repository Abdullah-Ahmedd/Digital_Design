// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VLab_six_tb.h for the primary calling header

#include "VLab_six_tb__pch.h"

VlCoroutine VLab_six_tb___024root___eval_initial__TOP__Vtiming__0(VLab_six_tb___024root* vlSelf);
VlCoroutine VLab_six_tb___024root___eval_initial__TOP__Vtiming__1(VLab_six_tb___024root* vlSelf);

void VLab_six_tb___024root___eval_initial(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___eval_initial\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VLab_six_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    VLab_six_tb___024root___eval_initial__TOP__Vtiming__1(vlSelf);
}

VlCoroutine VLab_six_tb___024root___eval_initial__TOP__Vtiming__0(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    VlClassRef<VLab_six_tb___024unit__03a__03astimulus> Lab_six_tb__DOT__stim;
    IData/*31:0*/ Lab_six_tb__DOT__unnamedblk1_1__DOT____Vrepeat0;
    Lab_six_tb__DOT__unnamedblk1_1__DOT____Vrepeat0 = 0;
    // Body
    Lab_six_tb__DOT__stim = VL_NEW(VLab_six_tb___024unit__03a__03astimulus, vlSymsp);
    vlSelfRef.Lab_six_tb__DOT__clk = 0U;
    co_await vlSelfRef.__VdlySched.delay(0x000000000000001eULL, 
                                         nullptr, "Labs/Lab_six\\Lab_six_tb.sv", 
                                         25);
    Lab_six_tb__DOT__unnamedblk1_1__DOT____Vrepeat0 = 5U;
    while (VL_LTS_III(32, 0U, Lab_six_tb__DOT__unnamedblk1_1__DOT____Vrepeat0)) {
        if (vlSymsp->_vm_contextp__->assertOnGet(2, 1)) {
            if ((VlNull{} != Lab_six_tb__DOT__stim)) {
                VL_NULL_CHECK(Lab_six_tb__DOT__stim, "Labs/Lab_six\\Lab_six_tb.sv", 29)->__VnoInFunc_randomize(vlSymsp, vlSelfRef.Lab_six_tb__DOT____VlemCall_0__randomize);
                vlSelfRef.Lab_six_tb__DOT____VlemCond_1 
                    = vlSelfRef.Lab_six_tb__DOT____VlemCall_0__randomize;
            } else {
                vlSelfRef.Lab_six_tb__DOT____VlemCond_1 = 0U;
            }
            if (VL_UNLIKELY(((1U & (~ (0U != vlSelfRef.Lab_six_tb__DOT____VlemCond_1)))))) {
                VL_WRITEF_NX("[%0t] %%Error: Lab_six_tb.sv:30: Assertion failed in %m: something is not working correctly\n",3, 'M',vlSymsp->name(),"Lab_six_tb.unnamedblk1_1", 'T',-9
                             , '#',64,VL_TIME_UNITED_Q(1));
                VL_STOP_MT("Labs/Lab_six\\Lab_six_tb.sv", 30, "");
            }
        }
        co_await VL_NULL_CHECK(Lab_six_tb__DOT__stim, "Labs/Lab_six\\Lab_six_tb.sv", 31)->__VnoInFunc_drive(vlSymsp, vlSelfRef.Lab_six_tb__DOT__data_in, vlSelfRef.Lab_six_tb__DOT__clk);
        Lab_six_tb__DOT__unnamedblk1_1__DOT____Vrepeat0 
            = (Lab_six_tb__DOT__unnamedblk1_1__DOT____Vrepeat0 
               - (IData)(1U));
    }
    VL_FINISH_MT("Labs/Lab_six\\Lab_six_tb.sv", 34, "");
    co_return;
}

VlCoroutine VLab_six_tb___024root___eval_initial__TOP__Vtiming__1(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___eval_initial__TOP__Vtiming__1\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (VL_LIKELY(!vlSymsp->_vm_contextp__->gotFinish())) {
        co_await vlSelfRef.__VdlySched.delay(0x000000000000000aULL, 
                                             nullptr, 
                                             "Labs/Lab_six\\Lab_six_tb.sv", 
                                             17);
        vlSelfRef.Lab_six_tb__DOT__clk = (1U & (~ (IData)(vlSelfRef.Lab_six_tb__DOT__clk)));
    }
    co_return;
}

void VLab_six_tb___024root___eval_triggers_vec__act(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___eval_triggers_vec__act\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered[0U] = VL_EXTEND_QI(64,2, 
                                                 ((vlSelfRef.__VdynSched.evaluate() 
                                                   << 1U) 
                                                  | vlSelfRef.__VdlySched.awaitingCurrentTime()));
    vlSelfRef.__VdynSched.doPostUpdates();
}

bool VLab_six_tb___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void VLab_six_tb___024root___timing_resume(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___timing_resume\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VdynSched.resume();
    if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
        vlSelfRef.__VdlySched.resume();
    }
}

void VLab_six_tb___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VLab_six_tb___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool VLab_six_tb___024root___eval_phase__act(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___eval_phase__act\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VactExecute;
    // Body
    VLab_six_tb___024root___eval_triggers_vec__act(vlSelf);
    VLab_six_tb___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VactTriggered, vlSelfRef.__VactTriggeredAcc);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VLab_six_tb___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    VLab_six_tb___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    __VactExecute = VLab_six_tb___024root___trigger_anySet__act(vlSelfRef.__VactTriggered);
    if (__VactExecute) {
        vlSelfRef.__VactTriggeredAcc.fill(0ULL);
        VLab_six_tb___024root___timing_resume(vlSelf);
    }
    return (__VactExecute);
}

bool VLab_six_tb___024root___eval_phase__inact(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___eval_phase__inact\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VinactExecute;
    // Body
    __VinactExecute = vlSelfRef.__VdlySched.awaitingZeroDelay();
    if (__VinactExecute) {
        VL_FATAL_MT("Labs/Lab_six\\Lab_six_tb.sv", 4, "", "ZERODLY: Design Verilated with '--no-sched-zero-delay', but #0 delay executed at runtime");
    }
    return (__VinactExecute);
}

void VLab_six_tb___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool VLab_six_tb___024root___eval_phase__nba(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___eval_phase__nba\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = VLab_six_tb___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        VLab_six_tb___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void VLab_six_tb___024root___eval(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___eval\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            VLab_six_tb___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("Labs/Lab_six\\Lab_six_tb.sv", 4, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VinactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VinactIterCount)))) {
                VL_FATAL_MT("Labs/Lab_six\\Lab_six_tb.sv", 4, "", "DIDNOTCONVERGE: Inactive region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VinactIterCount = ((IData)(1U) 
                                           + vlSelfRef.__VinactIterCount);
            vlSelfRef.__VactIterCount = 0U;
            do {
                if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                    VLab_six_tb___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                    VL_FATAL_MT("Labs/Lab_six\\Lab_six_tb.sv", 4, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
                }
                vlSelfRef.__VactIterCount = ((IData)(1U) 
                                             + vlSelfRef.__VactIterCount);
                vlSelfRef.__VactPhaseResult = VLab_six_tb___024root___eval_phase__act(vlSelf);
            } while (vlSelfRef.__VactPhaseResult);
            vlSelfRef.__VinactPhaseResult = VLab_six_tb___024root___eval_phase__inact(vlSelf);
        } while (vlSelfRef.__VinactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = VLab_six_tb___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void VLab_six_tb___024root___eval_debug_assertions(VLab_six_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_six_tb___024root___eval_debug_assertions\n"); );
    VLab_six_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
