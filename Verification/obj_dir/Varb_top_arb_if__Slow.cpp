// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Varb_top.h for the primary calling header

#include "Varb_top__pch.h"

void Varb_top_arb_if___ctor_var_reset(Varb_top_arb_if* vlSelf);

Varb_top_arb_if::Varb_top_arb_if() = default;
Varb_top_arb_if::~Varb_top_arb_if() = default;

void Varb_top_arb_if::ctor(Varb_top__Syms* symsp, const char* namep) {
    vlSymsp = symsp;
    vlNamep = strdup(Verilated::catName(vlSymsp->name(), namep));
    // Reset structure values
    Varb_top_arb_if___ctor_var_reset(this);
}

void Varb_top_arb_if::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

void Varb_top_arb_if::dtor() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
