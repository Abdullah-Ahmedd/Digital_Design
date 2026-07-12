// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Varb_top.h for the primary calling header

#include "Varb_top__pch.h"

VL_ATTR_COLD void Varb_top_arb_if___ctor_var_reset(Varb_top_arb_if* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Varb_top_arb_if___ctor_var_reset\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16707436170211756652ull);
    vlSelf->req = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13082299938826996746ull);
    vlSelf->grant = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 741988092961692266ull);
    vlSelf->rst = 0;
}
