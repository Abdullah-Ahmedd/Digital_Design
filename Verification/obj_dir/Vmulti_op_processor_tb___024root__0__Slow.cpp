// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmulti_op_processor_tb.h for the primary calling header

#include "Vmulti_op_processor_tb__pch.h"

VL_ATTR_COLD void Vmulti_op_processor_tb___024root___eval_static(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_static\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    do {
        vlSelfRef.__VactTriggeredAcc[vlSelfRef.__Vi] 
            = vlSelfRef.__VactTriggered[vlSelfRef.__Vi];
        vlSelfRef.__Vi = ((IData)(1U) + vlSelfRef.__Vi);
    } while ((0U >= vlSelfRef.__Vi));
}

VL_ATTR_COLD void Vmulti_op_processor_tb___024root___eval_final(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_final\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmulti_op_processor_tb___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vmulti_op_processor_tb___024root___eval_phase__stl(Vmulti_op_processor_tb___024root* vlSelf);

VL_ATTR_COLD void Vmulti_op_processor_tb___024root___eval_settle(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_settle\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VstlIterCount;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vmulti_op_processor_tb___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
            VL_FATAL_MT("Assignments/Assignment_two\\multi_op_processor_tb.sv", 3, "", "DIDNOTCONVERGE: Settle region did not converge after '--converge-limit' of 10000 tries");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        vlSelfRef.__VstlPhaseResult = Vmulti_op_processor_tb___024root___eval_phase__stl(vlSelf);
        vlSelfRef.__VstlFirstIteration = 0U;
    } while (vlSelfRef.__VstlPhaseResult);
}

VL_ATTR_COLD void Vmulti_op_processor_tb___024root___eval_triggers_vec__stl(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_triggers_vec__stl\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VstlTriggered[0U] = ((0xfffffffffffffffeULL 
                                      & vlSelfRef.__VstlTriggered[0U]) 
                                     | (IData)((IData)(vlSelfRef.__VstlFirstIteration)));
}

VL_ATTR_COLD bool Vmulti_op_processor_tb___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmulti_op_processor_tb___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(Vmulti_op_processor_tb___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool Vmulti_op_processor_tb___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___trigger_anySet__stl\n"); );
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

extern const VlUnpacked<CData/*7:0*/, 1024> Vmulti_op_processor_tb__ConstPool__TABLE_h07e0d7f0_0;

VL_ATTR_COLD void Vmulti_op_processor_tb___024root___eval_stl(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_stl\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    SData/*9:0*/ __Vinline__act_sequent__TOP__0___Vtableidx1;
    __Vinline__act_sequent__TOP__0___Vtableidx1 = 0;
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
        __Vinline__act_sequent__TOP__0___Vtableidx1 
            = (((IData)(vlSelfRef.multi_op_processor_tb__DOT__data_in) 
                << 2U) | (IData)(vlSelfRef.multi_op_processor_tb__DOT__op_sel));
        vlSelfRef.multi_op_processor_tb__DOT__data_out 
            = Vmulti_op_processor_tb__ConstPool__TABLE_h07e0d7f0_0
            [__Vinline__act_sequent__TOP__0___Vtableidx1];
    }
}

VL_ATTR_COLD bool Vmulti_op_processor_tb___024root___eval_phase__stl(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_phase__stl\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VstlExecute;
    // Body
    Vmulti_op_processor_tb___024root___eval_triggers_vec__stl(vlSelf);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vmulti_op_processor_tb___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
    __VstlExecute = Vmulti_op_processor_tb___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        Vmulti_op_processor_tb___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

bool Vmulti_op_processor_tb___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmulti_op_processor_tb___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Vmulti_op_processor_tb___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vmulti_op_processor_tb___024root___ctor_var_reset(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___ctor_var_reset\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->multi_op_processor_tb__DOT__data_in = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7028458140878566492ull);
    vlSelf->multi_op_processor_tb__DOT__op_sel = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 1007736010091076974ull);
    vlSelf->multi_op_processor_tb__DOT__data_out = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 3971053950146155651ull);
    vlSelf->multi_op_processor_tb__DOT__dyn_arr.atDefault().__PVT__data_in = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 17240345615270998956ull);
    vlSelf->multi_op_processor_tb__DOT__dyn_arr.atDefault().__PVT__op_sel = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 17240345615270998956ull);
    vlSelf->multi_op_processor_tb__DOT__data_q.atDefault() = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 8959582814244179279ull);
    vlSelf->multi_op_processor_tb__DOT__expected.atDefault() = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7924113401004732331ull);
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
