// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VLab_six_tb.h for the primary calling header

#ifndef VERILATED_VLAB_SIX_TB___024UNIT_H_
#define VERILATED_VLAB_SIX_TB___024UNIT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
#include "verilated_random.h"


class VLab_six_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) VLab_six_tb___024unit final {
  public:

    // INTERNAL VARIABLES
    VLab_six_tb__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    VLab_six_tb___024unit();
    ~VLab_six_tb___024unit();
    void ctor(VLab_six_tb__Syms* symsp, const char* namep);
    void dtor();
    VL_UNCOPYABLE(VLab_six_tb___024unit);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
