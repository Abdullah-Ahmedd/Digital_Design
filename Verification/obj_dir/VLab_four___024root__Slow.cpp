// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VLab_four.h for the primary calling header

#include "VLab_four__pch.h"

void VLab_four___024root___ctor_var_reset(VLab_four___024root* vlSelf);

VLab_four___024root::VLab_four___024root(VLab_four__Syms* symsp, const char* namep)
    : __VdlySched{*symsp->_vm_contextp__}
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    VLab_four___024root___ctor_var_reset(this);
}

void VLab_four___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

VLab_four___024root::~VLab_four___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
