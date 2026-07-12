// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Varb_top.h for the primary calling header

#include "Varb_top__pch.h"

void Varb_top___024unit___ctor_var_reset(Varb_top___024unit* vlSelf);

Varb_top___024unit::Varb_top___024unit() = default;
Varb_top___024unit::~Varb_top___024unit() = default;

void Varb_top___024unit::ctor(Varb_top__Syms* symsp, const char* namep) {
    vlSymsp = symsp;
    vlNamep = strdup(Verilated::catName(vlSymsp->name(), namep));
    // Reset structure values
    Varb_top___024unit___ctor_var_reset(this);
}

void Varb_top___024unit::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

void Varb_top___024unit::dtor() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
