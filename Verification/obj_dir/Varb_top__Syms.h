// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VARB_TOP__SYMS_H_
#define VERILATED_VARB_TOP__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Varb_top.h"

// INCLUDE MODULE CLASSES
#include "Varb_top___024root.h"
#include "Varb_top_arb_if.h"
#include "Varb_top___024unit.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Varb_top__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Varb_top* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Varb_top___024root             TOP;
    Varb_top___024unit             TOP____024unit;
    Varb_top_arb_if                TOP__arb_top__DOT__inter;

    // CONSTRUCTORS
    Varb_top__Syms(VerilatedContext* contextp, const char* namep, Varb_top* modelp);
    ~Varb_top__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
