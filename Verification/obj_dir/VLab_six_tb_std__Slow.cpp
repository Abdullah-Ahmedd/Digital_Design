// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VLab_six_tb.h for the primary calling header

#include "VLab_six_tb__pch.h"


VLab_six_tb_std::VLab_six_tb_std() = default;
VLab_six_tb_std::~VLab_six_tb_std() = default;

void VLab_six_tb_std::ctor(VLab_six_tb__Syms* symsp, const char* namep) {
    vlSymsp = symsp;
    vlNamep = strdup(Verilated::catName(vlSymsp->name(), namep));
    // Reset structure values
}

void VLab_six_tb_std::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

void VLab_six_tb_std::dtor() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
