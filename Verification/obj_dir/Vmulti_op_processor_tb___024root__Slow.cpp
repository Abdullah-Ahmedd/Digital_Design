// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmulti_op_processor_tb.h for the primary calling header

#include "Vmulti_op_processor_tb__pch.h"

void Vmulti_op_processor_tb___024root___ctor_var_reset(Vmulti_op_processor_tb___024root* vlSelf);

Vmulti_op_processor_tb___024root::Vmulti_op_processor_tb___024root(Vmulti_op_processor_tb__Syms* symsp, const char* namep)
    : __VdlySched{*symsp->_vm_contextp__}
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vmulti_op_processor_tb___024root___ctor_var_reset(this);
}

void Vmulti_op_processor_tb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vmulti_op_processor_tb___024root::~Vmulti_op_processor_tb___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
