// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VMULTI_OP_PROCESSOR_TB__SYMS_H_
#define VERILATED_VMULTI_OP_PROCESSOR_TB__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vmulti_op_processor_tb.h"

// INCLUDE MODULE CLASSES
#include "Vmulti_op_processor_tb___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vmulti_op_processor_tb__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vmulti_op_processor_tb* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vmulti_op_processor_tb___024root TOP;

    // CONSTRUCTORS
    Vmulti_op_processor_tb__Syms(VerilatedContext* contextp, const char* namep, Vmulti_op_processor_tb* modelp);
    ~Vmulti_op_processor_tb__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
