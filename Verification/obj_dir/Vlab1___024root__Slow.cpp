// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlab1.h for the primary calling header

#include "Vlab1__pch.h"

void Vlab1___024root___ctor_var_reset(Vlab1___024root* vlSelf);

Vlab1___024root::Vlab1___024root(Vlab1__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vlab1___024root___ctor_var_reset(this);
}

void Vlab1___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vlab1___024root::~Vlab1___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
