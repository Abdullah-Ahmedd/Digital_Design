// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Varb_top.h for the primary calling header

#ifndef VERILATED_VARB_TOP_ARB_IF_H_
#define VERILATED_VARB_TOP_ARB_IF_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Varb_top__Syms;

class alignas(VL_CACHE_LINE_BYTES) Varb_top_arb_if final {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ clk;
    CData/*3:0*/ req;
    CData/*3:0*/ grant;
    CData/*0:0*/ rst;

    // INTERNAL VARIABLES
    Varb_top__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Varb_top_arb_if();
    ~Varb_top_arb_if();
    void ctor(Varb_top__Syms* symsp, const char* namep);
    void dtor();
    VL_UNCOPYABLE(Varb_top_arb_if);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};

std::string VL_TO_STRING(const Varb_top_arb_if* obj);

#endif  // guard
