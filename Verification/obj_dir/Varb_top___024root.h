// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Varb_top.h for the primary calling header

#ifndef VERILATED_VARB_TOP___024ROOT_H_
#define VERILATED_VARB_TOP___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
class Varb_top___024unit;
class Varb_top_arb_if;


class Varb_top__Syms;

class alignas(VL_CACHE_LINE_BYTES) Varb_top___024root final {
  public:
    // CELLS
    Varb_top___024unit* __PVT____024unit;
    Varb_top_arb_if* __PVT__arb_top__DOT__inter;

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ arb_top__DOT__clk;
    CData/*1:0*/ arb_top__DOT__arbit__DOT__ptr;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VstlPhaseResult;
    CData/*0:0*/ __Vtrigprevexpr___TOP__arb_top__DOT__clk__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__arb_top__DOT__inter__rst__0;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VinactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    IData/*31:0*/ arb_top__DOT__arbit__DOT__index;
    IData/*31:0*/ arb_top__DOT__arbit__DOT__unnamedblk1__DOT__i;
    IData/*31:0*/ arb_top__DOT__arbit_tb__DOT____VlemExpr_0;
    IData/*31:0*/ __VactIterCount;
    IData/*31:0*/ __VinactIterCount;
    IData/*31:0*/ __Vi;
    VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggeredAcc;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
    VlDelayScheduler __VdlySched;
    VlTriggerScheduler __VtrigSched_heb2db5ce__0;

    // INTERNAL VARIABLES
    Varb_top__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Varb_top___024root(Varb_top__Syms* symsp, const char* namep);
    ~Varb_top___024root();
    VL_UNCOPYABLE(Varb_top___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
