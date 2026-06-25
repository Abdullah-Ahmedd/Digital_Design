// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VLAB1__SYMS_H_
#define VERILATED_VLAB1__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vlab1.h"

// INCLUDE MODULE CLASSES
#include "Vlab1___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vlab1__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vlab1* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vlab1___024root                TOP;

    // CONSTRUCTORS
    Vlab1__Syms(VerilatedContext* contextp, const char* namep, Vlab1* modelp);
    ~Vlab1__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
