// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VLab_six_tb.h for the primary calling header

#include "VLab_six_tb__pch.h"


VLab_six_tb_std__03a__03aprocess__Vclpkg::VLab_six_tb_std__03a__03aprocess__Vclpkg() = default;
VLab_six_tb_std__03a__03aprocess__Vclpkg::~VLab_six_tb_std__03a__03aprocess__Vclpkg() = default;

void VLab_six_tb_std__03a__03aprocess__Vclpkg::ctor(VLab_six_tb__Syms* symsp, const char* namep) {
    vlSymsp = symsp;
    vlNamep = strdup(Verilated::catName(vlSymsp->name(), namep));
    // Reset structure values
}

void VLab_six_tb_std__03a__03aprocess__Vclpkg::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

void VLab_six_tb_std__03a__03aprocess__Vclpkg::dtor() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
