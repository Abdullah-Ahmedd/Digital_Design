// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Varb_top.h for the primary calling header

#include "Varb_top__pch.h"

void Varb_top___024root___timing_ready(Varb_top___024root* vlSelf);

VL_ATTR_COLD void Varb_top___024root___eval_static(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_static\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__arb_top__DOT__clk__0 
        = vlSelfRef.arb_top__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__arb_top__DOT__inter__rst__0 
        = vlSymsp->TOP__arb_top__DOT__inter.rst;
    Varb_top___024root___timing_ready(vlSelf);
    do {
        vlSelfRef.__VactTriggeredAcc[vlSelfRef.__Vi] 
            = vlSelfRef.__VactTriggered[vlSelfRef.__Vi];
        vlSelfRef.__Vi = ((IData)(1U) + vlSelfRef.__Vi);
    } while ((0U >= vlSelfRef.__Vi));
}

VL_ATTR_COLD void Varb_top___024root___eval_final(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_final\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Varb_top___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Varb_top___024root___eval_phase__stl(Varb_top___024root* vlSelf);

VL_ATTR_COLD void Varb_top___024root___eval_settle(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_settle\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VstlIterCount;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Varb_top___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
            VL_FATAL_MT("Labs/Lab_11\\arb_top.sv", 9, "", "DIDNOTCONVERGE: Settle region did not converge after '--converge-limit' of 10000 tries");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        vlSelfRef.__VstlPhaseResult = Varb_top___024root___eval_phase__stl(vlSelf);
        vlSelfRef.__VstlFirstIteration = 0U;
    } while (vlSelfRef.__VstlPhaseResult);
}

VL_ATTR_COLD void Varb_top___024root___eval_triggers_vec__stl(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_triggers_vec__stl\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VstlTriggered[0U] = ((0xfffffffffffffffeULL 
                                      & vlSelfRef.__VstlTriggered[0U]) 
                                     | (IData)((IData)(vlSelfRef.__VstlFirstIteration)));
}

VL_ATTR_COLD bool Varb_top___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Varb_top___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(Varb_top___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool Varb_top___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___trigger_anySet__stl\n"); );
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

VL_ATTR_COLD void Varb_top___024root___eval_stl(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_stl\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
        if (VL_UNLIKELY(((1U & (~ (IData)(vlSymsp->TOP____024unit.__VmonitorOff)))))) {
            VL_WRITEF_NX("[%0t] req=%0b , grant=%0b\n",4, 'T',-9
                         , '#',64,VL_TIME_UNITED_Q(1000)
                         , '#',4,(IData)(vlSymsp->TOP__arb_top__DOT__inter.req)
                         , '#',4,vlSymsp->TOP__arb_top__DOT__inter.grant);
        }
    }
}

VL_ATTR_COLD bool Varb_top___024root___eval_phase__stl(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_phase__stl\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VstlExecute;
    // Body
    Varb_top___024root___eval_triggers_vec__stl(vlSelf);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Varb_top___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
    __VstlExecute = Varb_top___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        Varb_top___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

bool Varb_top___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Varb_top___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Varb_top___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @(posedge arb_top.clk)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 1U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 1 is active: @(negedge arb_top.inter.rst)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 2U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 2 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Varb_top___024root___ctor_var_reset(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___ctor_var_reset\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->arb_top__DOT__clk = 0;
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->arb_top__DOT__arbit__DOT__ptr = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 9202617756464182265ull);
    vlSelf->arb_top__DOT__arbit__DOT__index = 0;
    vlSelf->arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VstlTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggeredAcc[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__arb_top__DOT__clk__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__arb_top__DOT__inter__rst__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
    vlSelf->__Vi = 0;
}
