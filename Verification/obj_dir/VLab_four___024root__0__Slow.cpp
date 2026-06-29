// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VLab_four.h for the primary calling header

#include "VLab_four__pch.h"

VL_ATTR_COLD void VLab_four___024root___eval_static(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_static\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    do {
        vlSelfRef.__VactTriggeredAcc[vlSelfRef.__Vi] 
            = vlSelfRef.__VactTriggered[vlSelfRef.__Vi];
        vlSelfRef.__Vi = ((IData)(1U) + vlSelfRef.__Vi);
    } while ((0U >= vlSelfRef.__Vi));
}

VL_ATTR_COLD void VLab_four___024root___eval_final(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_final\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VLab_four___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool VLab_four___024root___eval_phase__stl(VLab_four___024root* vlSelf);

VL_ATTR_COLD void VLab_four___024root___eval_settle(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_settle\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VstlIterCount;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            VLab_four___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
            VL_FATAL_MT("Labs/Lab_four\\Lab_four.sv", 1, "", "DIDNOTCONVERGE: Settle region did not converge after '--converge-limit' of 10000 tries");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        vlSelfRef.__VstlPhaseResult = VLab_four___024root___eval_phase__stl(vlSelf);
        vlSelfRef.__VstlFirstIteration = 0U;
    } while (vlSelfRef.__VstlPhaseResult);
}

VL_ATTR_COLD void VLab_four___024root___eval_triggers_vec__stl(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_triggers_vec__stl\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VstlTriggered[0U] = ((0xfffffffffffffffeULL 
                                      & vlSelfRef.__VstlTriggered[0U]) 
                                     | (IData)((IData)(vlSelfRef.__VstlFirstIteration)));
}

VL_ATTR_COLD bool VLab_four___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void VLab_four___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(VLab_four___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool VLab_four___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___trigger_anySet__stl\n"); );
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

VL_ATTR_COLD void VLab_four___024root___eval_stl(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_stl\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
        vlSelfRef.Lab_four__DOT__c = (0x0000ffffU & 
                                      ((IData)(vlSelfRef.Lab_four__DOT__b) 
                                       + (IData)(vlSelfRef.Lab_four__DOT__a)));
    }
}

VL_ATTR_COLD bool VLab_four___024root___eval_phase__stl(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___eval_phase__stl\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VstlExecute;
    // Body
    VLab_four___024root___eval_triggers_vec__stl(vlSelf);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VLab_four___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
    __VstlExecute = VLab_four___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        VLab_four___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

bool VLab_four___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void VLab_four___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(VLab_four___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VLab_four___024root___ctor_var_reset(VLab_four___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VLab_four___024root___ctor_var_reset\n"); );
    VLab_four__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->Lab_four__DOT__a = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4753624044921862366ull);
    vlSelf->Lab_four__DOT__b = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 10521414701808237326ull);
    vlSelf->Lab_four__DOT__c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 14892763433944016482ull);
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VstlTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggeredAcc[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
    vlSelf->__Vi = 0;
}
