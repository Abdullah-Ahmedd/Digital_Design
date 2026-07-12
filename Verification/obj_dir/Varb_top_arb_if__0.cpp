// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Varb_top.h for the primary calling header

#include "Varb_top__pch.h"

std::string VL_TO_STRING(const Varb_top_arb_if* obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+          Varb_top_arb_if::VL_TO_STRING\n"); );
    // Body
    return (obj ? obj->vlNamep : "null");
}
