// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VLab_four.h for the primary calling header

#ifndef VERILATED_VLAB_FOUR___024ROOT_H_
#define VERILATED_VLAB_FOUR___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class VLab_four__Syms;

class alignas(VL_CACHE_LINE_BYTES) VLab_four___024root final {
  public:

    // DESIGN SPECIFIC STATE
    CData/*7:0*/ Lab_four__DOT__a;
    CData/*7:0*/ Lab_four__DOT__b;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VstlPhaseResult;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VinactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    SData/*15:0*/ Lab_four__DOT__c;
    IData/*31:0*/ __VactIterCount;
    IData/*31:0*/ __VinactIterCount;
    IData/*31:0*/ __Vi;
    VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggeredAcc;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
    VlDelayScheduler __VdlySched;

    // INTERNAL VARIABLES
    VLab_four__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    VLab_four___024root(VLab_four__Syms* symsp, const char* namep);
    ~VLab_four___024root();
    VL_UNCOPYABLE(VLab_four___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
