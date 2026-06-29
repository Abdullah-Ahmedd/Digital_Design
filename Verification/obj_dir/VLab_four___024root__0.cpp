// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VLab_four.h for the primary calling header

#include "VLab_four__pch.h"

VlCoroutine VLab_four___024root___eval_initial__TOP__Vtiming__0(VLab_four___024root* vlSelf);

void VLab_four___024root___eval_initial(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_initial\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VLab_four___024root___eval_initial__TOP__Vtiming__0(vlSelf);
}

VlCoroutine VLab_four___024root___eval_initial__TOP__Vtiming__0(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_initial__TOP__Vtiming__0\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ Lab_four__DOT__unnamedblk1__DOT__i;
    Lab_four__DOT__unnamedblk1__DOT__i = 0;
    SData/*15:0*/ __Vtask_Lab_four__DOT__send_and_check__0__expected;
    __Vtask_Lab_four__DOT__send_and_check__0__expected = 0;
    SData/*15:0*/ __Vfunc_Lab_four__DOT__expected_sum__1__Vfuncout;
    __Vfunc_Lab_four__DOT__expected_sum__1__Vfuncout = 0;
    CData/*7:0*/ __Vfunc_Lab_four__DOT__expected_sum__1__a_fun;
    __Vfunc_Lab_four__DOT__expected_sum__1__a_fun = 0;
    CData/*7:0*/ __Vfunc_Lab_four__DOT__expected_sum__1__b_fun;
    __Vfunc_Lab_four__DOT__expected_sum__1__b_fun = 0;
    // Body
    Lab_four__DOT__unnamedblk1__DOT__i = 0U;
    while (VL_GTS_III(32, 9U, Lab_four__DOT__unnamedblk1__DOT__i)) {
        __Vtask_Lab_four__DOT__send_and_check__0__expected = 0;
        vlSelfRef.Lab_four__DOT__a = (0x000000ffU & 
                                      VL_RANDOM_I());
        vlSelfRef.Lab_four__DOT__b = (0x000000ffU & 
                                      VL_RANDOM_I());
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "Labs/Lab_four\\Lab_four.sv", 
                                             35);
        __Vfunc_Lab_four__DOT__expected_sum__1__b_fun 
            = vlSelfRef.Lab_four__DOT__b;
        __Vfunc_Lab_four__DOT__expected_sum__1__a_fun 
            = vlSelfRef.Lab_four__DOT__a;
        __Vfunc_Lab_four__DOT__expected_sum__1__Vfuncout 
            = (0x0000ffffU & ((IData)(__Vfunc_Lab_four__DOT__expected_sum__1__a_fun) 
                              + (IData)(__Vfunc_Lab_four__DOT__expected_sum__1__b_fun)));
        __Vtask_Lab_four__DOT__send_and_check__0__expected 
            = __Vfunc_Lab_four__DOT__expected_sum__1__Vfuncout;
        if (VL_UNLIKELY((((IData)(vlSelfRef.Lab_four__DOT__c) 
                          != (IData)(__Vtask_Lab_four__DOT__send_and_check__0__expected))))) {
            VL_WRITEF_NX("[%0t] %%Error: Lab_four.sv:40: Assertion failed in %m: The two operands are %0d %0d and the expected result was %0d however it was %0d\n",7, 'M',vlSymsp->name(),"Lab_four.send_and_check", 'T',-12
                         , '#',64,VL_TIME_UNITED_Q(1)
                         , '#',8,(IData)(vlSelfRef.Lab_four__DOT__a)
                         , '#',8,vlSelfRef.Lab_four__DOT__b
                         , '#',16,(IData)(__Vtask_Lab_four__DOT__send_and_check__0__expected)
                         , '#',16,vlSelfRef.Lab_four__DOT__c);
            VL_STOP_MT("Labs/Lab_four\\Lab_four.sv", 40, "");
        } else {
            VL_WRITEF_NX("/////////////////testcase passed successfully/////////////////\n%0d + %0d = %0d\n",3
                         , '#',8,vlSelfRef.Lab_four__DOT__a
                         , '#',8,(IData)(vlSelfRef.Lab_four__DOT__b)
                         , '#',16,vlSelfRef.Lab_four__DOT__c);
        }
        Lab_four__DOT__unnamedblk1__DOT__i = ((IData)(1U) 
                                              + Lab_four__DOT__unnamedblk1__DOT__i);
    }
    VL_FINISH_MT("Labs/Lab_four\\Lab_four.sv", 18, "");
    co_return;
}

void VLab_four___024root___eval_triggers_vec__act(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_triggers_vec__act\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered[0U] = (QData)((IData)(vlSelfRef.__VdlySched.awaitingCurrentTime()));
}

bool VLab_four___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___trigger_anySet__act\n"); );
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

void VLab_four___024root___act_sequent__TOP__0(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___act_sequent__TOP__0\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.Lab_four__DOT__c = (0x0000ffffU & ((IData)(vlSelfRef.Lab_four__DOT__b) 
                                                 + (IData)(vlSelfRef.Lab_four__DOT__a)));
}

void VLab_four___024root___eval_act(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_act\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
        vlSelfRef.Lab_four__DOT__c = (0x0000ffffU & 
                                      ((IData)(vlSelfRef.Lab_four__DOT__b) 
                                       + (IData)(vlSelfRef.Lab_four__DOT__a)));
    }
}

void VLab_four___024root___eval_nba(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_nba\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
        vlSelfRef.Lab_four__DOT__c = (0x0000ffffU & 
                                      ((IData)(vlSelfRef.Lab_four__DOT__b) 
                                       + (IData)(vlSelfRef.Lab_four__DOT__a)));
    }
}

void VLab_four___024root___timing_resume(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___timing_resume\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
        vlSelfRef.__VdlySched.resume();
    }
}

void VLab_four___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___trigger_orInto__act_vec_vec\n"); );
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
VL_ATTR_COLD void VLab_four___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool VLab_four___024root___eval_phase__act(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_phase__act\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VactExecute;
    // Body
    VLab_four___024root___eval_triggers_vec__act(vlSelf);
    VLab_four___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VactTriggered, vlSelfRef.__VactTriggeredAcc);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VLab_four___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    VLab_four___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    __VactExecute = VLab_four___024root___trigger_anySet__act(vlSelfRef.__VactTriggered);
    if (__VactExecute) {
        vlSelfRef.__VactTriggeredAcc.fill(0ULL);
        VLab_four___024root___timing_resume(vlSelf);
        VLab_four___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool VLab_four___024root___eval_phase__inact(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_phase__inact\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VinactExecute;
    // Body
    __VinactExecute = vlSelfRef.__VdlySched.awaitingZeroDelay();
    if (__VinactExecute) {
        VL_FATAL_MT("Labs/Lab_four\\Lab_four.sv", 1, "", "ZERODLY: Design Verilated with '--no-sched-zero-delay', but #0 delay executed at runtime");
    }
    return (__VinactExecute);
}

void VLab_four___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool VLab_four___024root___eval_phase__nba(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_phase__nba\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = VLab_four___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        VLab_four___024root___eval_nba(vlSelf);
        VLab_four___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void VLab_four___024root___eval(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            VLab_four___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("Labs/Lab_four\\Lab_four.sv", 1, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VinactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VinactIterCount)))) {
                VL_FATAL_MT("Labs/Lab_four\\Lab_four.sv", 1, "", "DIDNOTCONVERGE: Inactive region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VinactIterCount = ((IData)(1U) 
                                           + vlSelfRef.__VinactIterCount);
            vlSelfRef.__VactIterCount = 0U;
            do {
                if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                    VLab_four___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                    VL_FATAL_MT("Labs/Lab_four\\Lab_four.sv", 1, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
                }
                vlSelfRef.__VactIterCount = ((IData)(1U) 
                                             + vlSelfRef.__VactIterCount);
                vlSelfRef.__VactPhaseResult = VLab_four___024root___eval_phase__act(vlSelf);
            } while (vlSelfRef.__VactPhaseResult);
            vlSelfRef.__VinactPhaseResult = VLab_four___024root___eval_phase__inact(vlSelf);
        } while (vlSelfRef.__VinactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = VLab_four___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void VLab_four___024root___eval_debug_assertions(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_debug_assertions\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
