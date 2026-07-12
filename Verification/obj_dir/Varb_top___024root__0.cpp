// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Varb_top.h for the primary calling header

#include "Varb_top__pch.h"

VlCoroutine Varb_top___024root___eval_initial__TOP__Vtiming__0(Varb_top___024root* vlSelf);
VlCoroutine Varb_top___024root___eval_initial__TOP__Vtiming__1(Varb_top___024root* vlSelf);

void Varb_top___024root___eval_initial(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_initial\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Varb_top___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    Varb_top___024root___eval_initial__TOP__Vtiming__1(vlSelf);
}

void Varb_top___024root____VbeforeTrig_heb2db5ce__0(Varb_top___024root* vlSelf, const char* __VeventDescription);

VlCoroutine Varb_top___024root___eval_initial__TOP__Vtiming__0(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_initial__TOP__Vtiming__0\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ arb_top__DOT__arbit_tb__DOT__unnamedblk1_1__DOT____Vrepeat0;
    arb_top__DOT__arbit_tb__DOT__unnamedblk1_1__DOT____Vrepeat0 = 0;
    // Body
    vlSymsp->TOP__arb_top__DOT__inter.rst = 0U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "Labs/Lab_11\\arbiter_tb.sv", 
                                         13);
    vlSymsp->TOP__arb_top__DOT__inter.rst = 1U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "Labs/Lab_11\\arbiter_tb.sv", 
                                         15);
    Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                   "@(posedge arb_top.clk)");
    co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge arb_top.clk)", 
                                                         "Labs/Lab_11\\arbiter_tb.sv", 
                                                         17);
    vlSymsp->TOP__arb_top__DOT__inter.req = 1U;
    Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                   "@(posedge arb_top.clk)");
    co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge arb_top.clk)", 
                                                         "Labs/Lab_11\\arbiter_tb.sv", 
                                                         18);
    vlSymsp->TOP__arb_top__DOT__inter.req = 2U;
    Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                   "@(posedge arb_top.clk)");
    co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge arb_top.clk)", 
                                                         "Labs/Lab_11\\arbiter_tb.sv", 
                                                         19);
    vlSymsp->TOP__arb_top__DOT__inter.req = 4U;
    Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                   "@(posedge arb_top.clk)");
    co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge arb_top.clk)", 
                                                         "Labs/Lab_11\\arbiter_tb.sv", 
                                                         20);
    vlSymsp->TOP__arb_top__DOT__inter.req = 8U;
    Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                   "@(posedge arb_top.clk)");
    co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge arb_top.clk)", 
                                                         "Labs/Lab_11\\arbiter_tb.sv", 
                                                         23);
    vlSymsp->TOP__arb_top__DOT__inter.req = 3U;
    Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                   "@(posedge arb_top.clk)");
    co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge arb_top.clk)", 
                                                         "Labs/Lab_11\\arbiter_tb.sv", 
                                                         24);
    vlSymsp->TOP__arb_top__DOT__inter.req = 6U;
    Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                   "@(posedge arb_top.clk)");
    co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge arb_top.clk)", 
                                                         "Labs/Lab_11\\arbiter_tb.sv", 
                                                         25);
    vlSymsp->TOP__arb_top__DOT__inter.req = 0x0cU;
    Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                   "@(posedge arb_top.clk)");
    co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge arb_top.clk)", 
                                                         "Labs/Lab_11\\arbiter_tb.sv", 
                                                         26);
    vlSymsp->TOP__arb_top__DOT__inter.req = 0x0fU;
    Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                   "@(posedge arb_top.clk)");
    co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge arb_top.clk)", 
                                                         "Labs/Lab_11\\arbiter_tb.sv", 
                                                         29);
    vlSymsp->TOP__arb_top__DOT__inter.req = 0U;
    arb_top__DOT__arbit_tb__DOT__unnamedblk1_1__DOT____Vrepeat0 = 4U;
    while (VL_LTS_III(32, 0U, arb_top__DOT__arbit_tb__DOT__unnamedblk1_1__DOT____Vrepeat0)) {
        Varb_top___024root____VbeforeTrig_heb2db5ce__0(vlSelf, 
                                                       "@(posedge arb_top.clk)");
        co_await vlSelfRef.__VtrigSched_heb2db5ce__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge arb_top.clk)", 
                                                             "Labs/Lab_11\\arbiter_tb.sv", 
                                                             34);
        vlSelfRef.arb_top__DOT__arbit_tb__DOT____VlemExpr_0 
            = VL_URANDOM_RANGE_I(0U, 0x0000000fU);
        vlSymsp->TOP__arb_top__DOT__inter.req = (0x0000000fU 
                                                 & vlSelfRef.arb_top__DOT__arbit_tb__DOT____VlemExpr_0);
        arb_top__DOT__arbit_tb__DOT__unnamedblk1_1__DOT____Vrepeat0 
            = (arb_top__DOT__arbit_tb__DOT__unnamedblk1_1__DOT____Vrepeat0 
               - (IData)(1U));
    }
    VL_FINISH_MT("Labs/Lab_11\\arbiter_tb.sv", 36, "");
    co_return;
}

VlCoroutine Varb_top___024root___eval_initial__TOP__Vtiming__1(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_initial__TOP__Vtiming__1\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (VL_LIKELY(!vlSymsp->_vm_contextp__->gotFinish())) {
        vlSelfRef.arb_top__DOT__clk = 0U;
        co_await vlSelfRef.__VdlySched.delay(0x0000000000001388ULL, 
                                             nullptr, 
                                             "Labs/Lab_11\\arb_top.sv", 
                                             18);
        vlSelfRef.arb_top__DOT__clk = 1U;
        co_await vlSelfRef.__VdlySched.delay(0x0000000000001388ULL, 
                                             nullptr, 
                                             "Labs/Lab_11\\arb_top.sv", 
                                             20);
    }
    co_return;
}

void Varb_top___024root___eval_triggers_vec__act(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_triggers_vec__act\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                    ((vlSelfRef.__VdlySched.awaitingCurrentTime() 
                                                      << 2U) 
                                                     | ((((~ (IData)(vlSymsp->TOP__arb_top__DOT__inter.rst)) 
                                                          & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__arb_top__DOT__inter__rst__0)) 
                                                         << 1U) 
                                                        | ((IData)(vlSelfRef.arb_top__DOT__clk) 
                                                           & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__arb_top__DOT__clk__0)))))));
    vlSelfRef.__Vtrigprevexpr___TOP__arb_top__DOT__clk__0 
        = vlSelfRef.arb_top__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__arb_top__DOT__inter__rst__0 
        = vlSymsp->TOP__arb_top__DOT__inter.rst;
}

bool Varb_top___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___trigger_anySet__act\n"); );
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

void Varb_top___024root___act_comb__TOP__0(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___act_comb__TOP__0\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((1U & (~ (IData)(vlSymsp->TOP____024unit.__VmonitorOff)))))) {
        VL_WRITEF_NX("[%0t] req=%0b , grant=%0b\n",4, 'T',-9
                     , '#',64,VL_TIME_UNITED_Q(1000)
                     , '#',4,(IData)(vlSymsp->TOP__arb_top__DOT__inter.req)
                     , '#',4,vlSymsp->TOP__arb_top__DOT__inter.grant);
    }
}

void Varb_top___024root___eval_act(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_act\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((5ULL & vlSelfRef.__VactTriggered[0U])) {
        if (VL_UNLIKELY(((1U & (~ (IData)(vlSymsp->TOP____024unit.__VmonitorOff)))))) {
            VL_WRITEF_NX("[%0t] req=%0b , grant=%0b\n",4, 'T',-9
                         , '#',64,VL_TIME_UNITED_Q(1000)
                         , '#',4,(IData)(vlSymsp->TOP__arb_top__DOT__inter.req)
                         , '#',4,vlSymsp->TOP__arb_top__DOT__inter.grant);
        }
    }
}

void Varb_top___024root___nba_sequent__TOP__1(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___nba_sequent__TOP__1\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __Vdly__arb_top__DOT__arbit__DOT__index;
    __Vdly__arb_top__DOT__arbit__DOT__index = 0;
    IData/*31:0*/ __VdlyMask__arb_top__DOT__arbit__DOT__index;
    __VdlyMask__arb_top__DOT__arbit__DOT__index = 0;
    // Body
    if (vlSymsp->TOP__arb_top__DOT__inter.rst) {
        vlSymsp->TOP__arb_top__DOT__inter.grant = 0U;
        vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i = 0U;
        {
            while (VL_GTS_III(32, 4U, vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i)) {
                vlSelfRef.arb_top__DOT__arbit__DOT__index 
                    = (3U & ((IData)(vlSelfRef.arb_top__DOT__arbit__DOT__ptr) 
                             + vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i));
                if ((1U & ((IData)(vlSymsp->TOP__arb_top__DOT__inter.req) 
                           >> (3U & vlSelfRef.arb_top__DOT__arbit__DOT__index)))) {
                    vlSymsp->TOP__arb_top__DOT__inter.grant 
                        = ((IData)(vlSymsp->TOP__arb_top__DOT__inter.grant) 
                           | (0x0fU & ((IData)(1U) 
                                       << (3U & vlSelfRef.arb_top__DOT__arbit__DOT__index))));
                    vlSelfRef.arb_top__DOT__arbit__DOT__ptr 
                        = (3U & VL_MODDIVS_III(32, 
                                               ((IData)(1U) 
                                                + vlSelfRef.arb_top__DOT__arbit__DOT__index), (IData)(4U)));
                    goto __Vlabel0;
                }
                vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i 
                    = ((IData)(1U) + vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i);
            }
            __Vlabel0: ;
        }
    } else {
        vlSelfRef.arb_top__DOT__arbit__DOT__ptr = 0U;
        __Vdly__arb_top__DOT__arbit__DOT__index = 0U;
        __VdlyMask__arb_top__DOT__arbit__DOT__index = 0xffffffffU;
        vlSymsp->TOP__arb_top__DOT__inter.grant = 0U;
    }
    vlSelfRef.arb_top__DOT__arbit__DOT__index = ((__Vdly__arb_top__DOT__arbit__DOT__index 
                                                  & __VdlyMask__arb_top__DOT__arbit__DOT__index) 
                                                 | (vlSelfRef.arb_top__DOT__arbit__DOT__index 
                                                    & (~ __VdlyMask__arb_top__DOT__arbit__DOT__index)));
    __VdlyMask__arb_top__DOT__arbit__DOT__index = 0U;
}

void Varb_top___024root___eval_nba(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_nba\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __Vinline__nba_sequent__TOP__1___Vdly__arb_top__DOT__arbit__DOT__index;
    __Vinline__nba_sequent__TOP__1___Vdly__arb_top__DOT__arbit__DOT__index = 0;
    IData/*31:0*/ __Vinline__nba_sequent__TOP__1___VdlyMask__arb_top__DOT__arbit__DOT__index;
    __Vinline__nba_sequent__TOP__1___VdlyMask__arb_top__DOT__arbit__DOT__index = 0;
    // Body
    if ((3ULL & vlSelfRef.__VnbaTriggered[0U])) {
        if (vlSymsp->TOP__arb_top__DOT__inter.rst) {
            vlSymsp->TOP__arb_top__DOT__inter.grant = 0U;
            vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i = 0U;
            {
                while (VL_GTS_III(32, 4U, vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i)) {
                    vlSelfRef.arb_top__DOT__arbit__DOT__index 
                        = (3U & ((IData)(vlSelfRef.arb_top__DOT__arbit__DOT__ptr) 
                                 + vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i));
                    if ((1U & ((IData)(vlSymsp->TOP__arb_top__DOT__inter.req) 
                               >> (3U & vlSelfRef.arb_top__DOT__arbit__DOT__index)))) {
                        vlSymsp->TOP__arb_top__DOT__inter.grant 
                            = ((IData)(vlSymsp->TOP__arb_top__DOT__inter.grant) 
                               | (0x0fU & ((IData)(1U) 
                                           << (3U & vlSelfRef.arb_top__DOT__arbit__DOT__index))));
                        vlSelfRef.arb_top__DOT__arbit__DOT__ptr 
                            = (3U & VL_MODDIVS_III(32, 
                                                   ((IData)(1U) 
                                                    + vlSelfRef.arb_top__DOT__arbit__DOT__index), (IData)(4U)));
                        goto __Vlabel0;
                    }
                    vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i 
                        = ((IData)(1U) + vlSelfRef.arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i);
                }
                __Vlabel0: ;
            }
        } else {
            vlSelfRef.arb_top__DOT__arbit__DOT__ptr = 0U;
            __Vinline__nba_sequent__TOP__1___Vdly__arb_top__DOT__arbit__DOT__index = 0U;
            __Vinline__nba_sequent__TOP__1___VdlyMask__arb_top__DOT__arbit__DOT__index = 0xffffffffU;
            vlSymsp->TOP__arb_top__DOT__inter.grant = 0U;
        }
        vlSelfRef.arb_top__DOT__arbit__DOT__index = 
            ((__Vinline__nba_sequent__TOP__1___Vdly__arb_top__DOT__arbit__DOT__index 
              & __Vinline__nba_sequent__TOP__1___VdlyMask__arb_top__DOT__arbit__DOT__index) 
             | (vlSelfRef.arb_top__DOT__arbit__DOT__index 
                & (~ __Vinline__nba_sequent__TOP__1___VdlyMask__arb_top__DOT__arbit__DOT__index)));
        __Vinline__nba_sequent__TOP__1___VdlyMask__arb_top__DOT__arbit__DOT__index = 0U;
    }
    if ((7ULL & vlSelfRef.__VnbaTriggered[0U])) {
        if (VL_UNLIKELY(((1U & (~ (IData)(vlSymsp->TOP____024unit.__VmonitorOff)))))) {
            VL_WRITEF_NX("[%0t] req=%0b , grant=%0b\n",4, 'T',-9
                         , '#',64,VL_TIME_UNITED_Q(1000)
                         , '#',4,(IData)(vlSymsp->TOP__arb_top__DOT__inter.req)
                         , '#',4,vlSymsp->TOP__arb_top__DOT__inter.grant);
        }
    }
}

void Varb_top___024root___timing_ready(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___timing_ready\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready("@(posedge arb_top.clk)");
    }
}

void Varb_top___024root___timing_resume(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___timing_resume\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VtrigSched_heb2db5ce__0.moveToResumeQueue(
                                                          "@(posedge arb_top.clk)");
    vlSelfRef.__VtrigSched_heb2db5ce__0.resume("@(posedge arb_top.clk)");
    if ((4ULL & vlSelfRef.__VactTriggered[0U])) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Varb_top___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___trigger_orInto__act_vec_vec\n"); );
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
VL_ATTR_COLD void Varb_top___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Varb_top___024root___eval_phase__act(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_phase__act\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VactExecute;
    // Body
    Varb_top___024root___eval_triggers_vec__act(vlSelf);
    Varb_top___024root___timing_ready(vlSelf);
    Varb_top___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VactTriggered, vlSelfRef.__VactTriggeredAcc);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Varb_top___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Varb_top___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    __VactExecute = Varb_top___024root___trigger_anySet__act(vlSelfRef.__VactTriggered);
    if (__VactExecute) {
        vlSelfRef.__VactTriggeredAcc.fill(0ULL);
        Varb_top___024root___timing_resume(vlSelf);
        Varb_top___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Varb_top___024root___eval_phase__inact(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_phase__inact\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VinactExecute;
    // Body
    __VinactExecute = vlSelfRef.__VdlySched.awaitingZeroDelay();
    if (__VinactExecute) {
        VL_FATAL_MT("Labs/Lab_11\\arb_top.sv", 9, "", "ZERODLY: Design Verilated with '--no-sched-zero-delay', but #0 delay executed at runtime");
    }
    return (__VinactExecute);
}

void Varb_top___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Varb_top___024root___eval_phase__nba(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_phase__nba\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Varb_top___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        Varb_top___024root___eval_nba(vlSelf);
        Varb_top___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void Varb_top___024root___eval(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Varb_top___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("Labs/Lab_11\\arb_top.sv", 9, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VinactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VinactIterCount)))) {
                VL_FATAL_MT("Labs/Lab_11\\arb_top.sv", 9, "", "DIDNOTCONVERGE: Inactive region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VinactIterCount = ((IData)(1U) 
                                           + vlSelfRef.__VinactIterCount);
            vlSelfRef.__VactIterCount = 0U;
            do {
                if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                    Varb_top___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                    VL_FATAL_MT("Labs/Lab_11\\arb_top.sv", 9, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
                }
                vlSelfRef.__VactIterCount = ((IData)(1U) 
                                             + vlSelfRef.__VactIterCount);
                vlSelfRef.__VactPhaseResult = Varb_top___024root___eval_phase__act(vlSelf);
            } while (vlSelfRef.__VactPhaseResult);
            vlSelfRef.__VinactPhaseResult = Varb_top___024root___eval_phase__inact(vlSelf);
        } while (vlSelfRef.__VinactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Varb_top___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

void Varb_top___024root____VbeforeTrig_heb2db5ce__0(Varb_top___024root* vlSelf, const char* __VeventDescription) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root____VbeforeTrig_heb2db5ce__0\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    VlUnpacked<QData/*63:0*/, 1> __VTmp;
    // Body
    __VTmp[0U] = (QData)((IData)(((IData)(vlSelfRef.arb_top__DOT__clk) 
                                  & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__arb_top__DOT__clk__0)))));
    vlSelfRef.__Vtrigprevexpr___TOP__arb_top__DOT__clk__0 
        = vlSelfRef.arb_top__DOT__clk;
    if ((1ULL & __VTmp[0U])) {
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
        vlSelfRef.__VtrigSched_heb2db5ce__0.ready(__VeventDescription);
    }
    vlSelfRef.__VactTriggeredAcc[0U] = (vlSelfRef.__VactTriggeredAcc[0U] 
                                        | __VTmp[0U]);
}

#ifdef VL_DEBUG
void Varb_top___024root___eval_debug_assertions(Varb_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Varb_top___024root___eval_debug_assertions\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
