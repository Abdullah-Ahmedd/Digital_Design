// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vlab1__pch.h"

//============================================================
// Constructors

Vlab1::Vlab1(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vlab1__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vlab1::Vlab1(const char* _vcname__)
    : Vlab1(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vlab1::~Vlab1() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vlab1___024root___eval_debug_assertions(Vlab1___024root* vlSelf);
#endif  // VL_DEBUG
void Vlab1___024root___eval_static(Vlab1___024root* vlSelf);
void Vlab1___024root___eval_initial(Vlab1___024root* vlSelf);
void Vlab1___024root___eval_settle(Vlab1___024root* vlSelf);
void Vlab1___024root___eval(Vlab1___024root* vlSelf);

void Vlab1::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vlab1::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vlab1___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vlab1___024root___eval_static(&(vlSymsp->TOP));
        Vlab1___024root___eval_initial(&(vlSymsp->TOP));
        Vlab1___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vlab1___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vlab1::eventsPending() { return false; }

uint64_t Vlab1::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vlab1::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vlab1___024root___eval_final(Vlab1___024root* vlSelf);

VL_ATTR_COLD void Vlab1::final() {
    contextp()->executingFinal(true);
    Vlab1___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vlab1::hierName() const { return vlSymsp->name(); }
const char* Vlab1::modelName() const { return "Vlab1"; }
unsigned Vlab1::threads() const { return 1; }
void Vlab1::prepareClone() const { contextp()->prepareClone(); }
void Vlab1::atClone() const {
    contextp()->threadPoolpOnClone();
}
