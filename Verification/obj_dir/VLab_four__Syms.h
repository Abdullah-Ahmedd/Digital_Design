// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VLAB_FOUR__SYMS_H_
#define VERILATED_VLAB_FOUR__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "VLab_four.h"

// INCLUDE MODULE CLASSES
#include "VLab_four___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) VLab_four__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VLab_four* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VLab_four___024root            TOP;

    // CONSTRUCTORS
    VLab_four__Syms(VerilatedContext* contextp, const char* namep, VLab_four* modelp);
    ~VLab_four__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
