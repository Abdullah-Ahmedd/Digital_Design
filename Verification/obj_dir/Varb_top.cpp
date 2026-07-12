// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Varb_top__pch.h"

//============================================================
// Constructors

Varb_top::Varb_top(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Varb_top__Syms(contextp(), _vcname__, this)}
    , __PVT____024unit{vlSymsp->TOP.__PVT____024unit}
    , __PVT__arb_top__DOT__inter{vlSymsp->TOP.__PVT__arb_top__DOT__inter}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Varb_top::Varb_top(const char* _vcname__)
    : Varb_top(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Varb_top::~Varb_top() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Varb_top___024root___eval_debug_assertions(Varb_top___024root* vlSelf);
#endif  // VL_DEBUG
void Varb_top___024root___eval_static(Varb_top___024root* vlSelf);
void Varb_top___024root___eval_initial(Varb_top___024root* vlSelf);
void Varb_top___024root___eval_settle(Varb_top___024root* vlSelf);
void Varb_top___024root___eval(Varb_top___024root* vlSelf);

void Varb_top::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Varb_top::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Varb_top___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Varb_top___024root___eval_static(&(vlSymsp->TOP));
        Varb_top___024root___eval_initial(&(vlSymsp->TOP));
        Varb_top___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Varb_top___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Varb_top::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty() && !contextp()->gotFinish(); }

uint64_t Varb_top::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Varb_top::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Varb_top___024root___eval_final(Varb_top___024root* vlSelf);

VL_ATTR_COLD void Varb_top::final() {
    contextp()->executingFinal(true);
    Varb_top___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Varb_top::hierName() const { return vlSymsp->name(); }
const char* Varb_top::modelName() const { return "Varb_top"; }
unsigned Varb_top::threads() const { return 1; }
void Varb_top::prepareClone() const { contextp()->prepareClone(); }
void Varb_top::atClone() const {
    contextp()->threadPoolpOnClone();
}
