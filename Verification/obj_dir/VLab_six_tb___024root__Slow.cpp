// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VLab_six_tb.h for the primary calling header

#include "VLab_six_tb__pch.h"

void VLab_six_tb___024root___ctor_var_reset(VLab_six_tb___024root* vlSelf);

VLab_six_tb___024root::VLab_six_tb___024root(VLab_six_tb__Syms* symsp, const char* namep)
    : __VdlySched{*symsp->_vm_contextp__}
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    VLab_six_tb___024root___ctor_var_reset(this);
}

void VLab_six_tb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

VLab_six_tb___024root::~VLab_six_tb___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
