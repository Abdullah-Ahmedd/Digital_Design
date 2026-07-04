// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VLab_six_tb.h for the primary calling header

#ifndef VERILATED_VLAB_SIX_TB___024ROOT_H_
#define VERILATED_VLAB_SIX_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
#include "verilated_random.h"
class VLab_six_tb___024unit;
class VLab_six_tb___024unit__03a__03astimulus;
class VLab_six_tb___024unit__03a__03astimulus__Vclpkg;
class VLab_six_tb_std;
class VLab_six_tb_std__03a__03aprocess__Vclpkg;
class VLab_six_tb_std__03a__03asemaphore__Vclpkg;


class VLab_six_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) VLab_six_tb___024root final {
  public:
    // CELLS
    VLab_six_tb_std* __PVT__std;
    VLab_six_tb___024unit* __PVT____024unit;
    VLab_six_tb_std__03a__03asemaphore__Vclpkg* std__03a__03asemaphore__Vclpkg;
    VLab_six_tb_std__03a__03aprocess__Vclpkg* std__03a__03aprocess__Vclpkg;
    VLab_six_tb___024unit__03a__03astimulus__Vclpkg* __024unit__03a__03astimulus__Vclpkg;

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ Lab_six_tb__DOT__clk;
    CData/*7:0*/ Lab_six_tb__DOT__data_in;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VinactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    IData/*31:0*/ Lab_six_tb__DOT____VlemCond_1;
    IData/*31:0*/ Lab_six_tb__DOT____VlemCall_0__randomize;
    IData/*31:0*/ __VactIterCount;
    IData/*31:0*/ __VinactIterCount;
    IData/*31:0*/ __Vi;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggeredAcc;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
    VlDelayScheduler __VdlySched;
    VlDynamicTriggerScheduler __VdynSched;

    // INTERNAL VARIABLES
    VLab_six_tb__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    VLab_six_tb___024root(VLab_six_tb__Syms* symsp, const char* namep);
    ~VLab_six_tb___024root();
    VL_UNCOPYABLE(VLab_six_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
