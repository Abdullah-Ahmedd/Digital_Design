// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Varb_top.h for the primary calling header

#include "Varb_top__pch.h"

VL_ATTR_COLD void Varb_top___024unit___ctor_var_reset(Varb_top___024unit* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+      Varb_top___024unit___ctor_var_reset\n"); );
    Varb_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->__VmonitorOff = 0;
}
