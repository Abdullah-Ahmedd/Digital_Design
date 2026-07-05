// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vmulti_op_processor_tb__pch.h"

//============================================================
// Constructors

Vmulti_op_processor_tb::Vmulti_op_processor_tb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vmulti_op_processor_tb__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vmulti_op_processor_tb::Vmulti_op_processor_tb(const char* _vcname__)
    : Vmulti_op_processor_tb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vmulti_op_processor_tb::~Vmulti_op_processor_tb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vmulti_op_processor_tb___024root___eval_debug_assertions(Vmulti_op_processor_tb___024root* vlSelf);
#endif  // VL_DEBUG
void Vmulti_op_processor_tb___024root___eval_static(Vmulti_op_processor_tb___024root* vlSelf);
void Vmulti_op_processor_tb___024root___eval_initial(Vmulti_op_processor_tb___024root* vlSelf);
void Vmulti_op_processor_tb___024root___eval_settle(Vmulti_op_processor_tb___024root* vlSelf);
void Vmulti_op_processor_tb___024root___eval(Vmulti_op_processor_tb___024root* vlSelf);

void Vmulti_op_processor_tb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vmulti_op_processor_tb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vmulti_op_processor_tb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vmulti_op_processor_tb___024root___eval_static(&(vlSymsp->TOP));
        Vmulti_op_processor_tb___024root___eval_initial(&(vlSymsp->TOP));
        Vmulti_op_processor_tb___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vmulti_op_processor_tb___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vmulti_op_processor_tb::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty() && !contextp()->gotFinish(); }

uint64_t Vmulti_op_processor_tb::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vmulti_op_processor_tb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vmulti_op_processor_tb___024root___eval_final(Vmulti_op_processor_tb___024root* vlSelf);

VL_ATTR_COLD void Vmulti_op_processor_tb::final() {
    contextp()->executingFinal(true);
    Vmulti_op_processor_tb___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vmulti_op_processor_tb::hierName() const { return vlSymsp->name(); }
const char* Vmulti_op_processor_tb::modelName() const { return "Vmulti_op_processor_tb"; }
unsigned Vmulti_op_processor_tb::threads() const { return 1; }
void Vmulti_op_processor_tb::prepareClone() const { contextp()->prepareClone(); }
void Vmulti_op_processor_tb::atClone() const {
    contextp()->threadPoolpOnClone();
}
