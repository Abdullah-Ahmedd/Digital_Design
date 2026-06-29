// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VLab_four__pch.h"

//============================================================
// Constructors

VLab_four::VLab_four(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VLab_four__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

VLab_four::VLab_four(const char* _vcname__)
    : VLab_four(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VLab_four::~VLab_four() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VLab_four___024root___eval_debug_assertions(VLab_four___024root* vlSelf);
#endif  // VL_DEBUG
void VLab_four___024root___eval_static(VLab_four___024root* vlSelf);
void VLab_four___024root___eval_initial(VLab_four___024root* vlSelf);
void VLab_four___024root___eval_settle(VLab_four___024root* vlSelf);
void VLab_four___024root___eval(VLab_four___024root* vlSelf);

void VLab_four::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VLab_four::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VLab_four___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VLab_four___024root___eval_static(&(vlSymsp->TOP));
        VLab_four___024root___eval_initial(&(vlSymsp->TOP));
        VLab_four___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VLab_four___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool VLab_four::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty() && !contextp()->gotFinish(); }

uint64_t VLab_four::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* VLab_four::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VLab_four___024root___eval_final(VLab_four___024root* vlSelf);

VL_ATTR_COLD void VLab_four::final() {
    contextp()->executingFinal(true);
    VLab_four___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VLab_four::hierName() const { return vlSymsp->name(); }
const char* VLab_four::modelName() const { return "VLab_four"; }
unsigned VLab_four::threads() const { return 1; }
void VLab_four::prepareClone() const { contextp()->prepareClone(); }
void VLab_four::atClone() const {
    contextp()->threadPoolpOnClone();
}
