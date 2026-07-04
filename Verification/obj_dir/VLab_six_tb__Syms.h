// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VLAB_SIX_TB__SYMS_H_
#define VERILATED_VLAB_SIX_TB__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "VLab_six_tb.h"

// INCLUDE MODULE CLASSES
#include "VLab_six_tb___024root.h"
#include "VLab_six_tb_std.h"
#include "VLab_six_tb___024unit.h"
#include "VLab_six_tb_std__03a__03asemaphore__Vclpkg.h"
#include "VLab_six_tb_std__03a__03aprocess__Vclpkg.h"
#include "VLab_six_tb___024unit__03a__03astimulus__Vclpkg.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) VLab_six_tb__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VLab_six_tb* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VLab_six_tb___024root          TOP;
    VLab_six_tb___024unit__03a__03astimulus__Vclpkg TOP____024unit__03a__03astimulus__Vclpkg;
    VLab_six_tb___024unit          TOP____024unit;
    VLab_six_tb_std                TOP__std;
    VLab_six_tb_std__03a__03aprocess__Vclpkg TOP__std__03a__03aprocess__Vclpkg;
    VLab_six_tb_std__03a__03asemaphore__Vclpkg TOP__std__03a__03asemaphore__Vclpkg;

    // CONSTRUCTORS
    VLab_six_tb__Syms(VerilatedContext* contextp, const char* namep, VLab_six_tb* modelp);
    ~VLab_six_tb__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
