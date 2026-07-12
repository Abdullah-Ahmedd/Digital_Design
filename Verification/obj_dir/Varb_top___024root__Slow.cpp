// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Varb_top.h for the primary calling header

#include "Varb_top__pch.h"

void Varb_top___024root___ctor_var_reset(Varb_top___024root* vlSelf);

Varb_top___024root::Varb_top___024root(Varb_top__Syms* symsp, const char* namep)
    : __VdlySched{*symsp->_vm_contextp__}
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Varb_top___024root___ctor_var_reset(this);
}

void Varb_top___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Varb_top___024root::~Varb_top___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
