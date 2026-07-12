// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Varb_top.h for the primary calling header

#ifndef VERILATED_VARB_TOP___024UNIT_H_
#define VERILATED_VARB_TOP___024UNIT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Varb_top__Syms;

class alignas(VL_CACHE_LINE_BYTES) Varb_top___024unit final {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ __VmonitorOff;

    // INTERNAL VARIABLES
    Varb_top__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Varb_top___024unit();
    ~Varb_top___024unit();
    void ctor(Varb_top__Syms* symsp, const char* namep);
    void dtor();
    VL_UNCOPYABLE(Varb_top___024unit);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
