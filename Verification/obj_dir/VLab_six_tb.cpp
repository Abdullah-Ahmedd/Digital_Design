// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VLab_six_tb__pch.h"

//============================================================
// Constructors

VLab_six_tb::VLab_six_tb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VLab_six_tb__Syms(contextp(), _vcname__, this)}
    , __PVT__std{vlSymsp->TOP.__PVT__std}
    , __PVT____024unit{vlSymsp->TOP.__PVT____024unit}
    , std__03a__03asemaphore__Vclpkg{vlSymsp->TOP.std__03a__03asemaphore__Vclpkg}
    , std__03a__03aprocess__Vclpkg{vlSymsp->TOP.std__03a__03aprocess__Vclpkg}
    , __024unit__03a__03astimulus__Vclpkg{vlSymsp->TOP.__024unit__03a__03astimulus__Vclpkg}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

VLab_six_tb::VLab_six_tb(const char* _vcname__)
    : VLab_six_tb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VLab_six_tb::~VLab_six_tb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VLab_six_tb___024root___eval_debug_assertions(VLab_six_tb___024root* vlSelf);
#endif  // VL_DEBUG
void VLab_six_tb___024root___eval_static(VLab_six_tb___024root* vlSelf);
void VLab_six_tb___024root___eval_initial(VLab_six_tb___024root* vlSelf);
void VLab_six_tb___024root___eval_settle(VLab_six_tb___024root* vlSelf);
void VLab_six_tb___024root___eval(VLab_six_tb___024root* vlSelf);

void VLab_six_tb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VLab_six_tb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VLab_six_tb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VLab_six_tb___024root___eval_static(&(vlSymsp->TOP));
        VLab_six_tb___024root___eval_initial(&(vlSymsp->TOP));
        VLab_six_tb___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VLab_six_tb___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool VLab_six_tb::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty() && !contextp()->gotFinish(); }

uint64_t VLab_six_tb::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* VLab_six_tb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VLab_six_tb___024root___eval_final(VLab_six_tb___024root* vlSelf);

VL_ATTR_COLD void VLab_six_tb::final() {
    contextp()->executingFinal(true);
    VLab_six_tb___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VLab_six_tb::hierName() const { return vlSymsp->name(); }
const char* VLab_six_tb::modelName() const { return "VLab_six_tb"; }
unsigned VLab_six_tb::threads() const { return 1; }
void VLab_six_tb::prepareClone() const { contextp()->prepareClone(); }
void VLab_six_tb::atClone() const {
    contextp()->threadPoolpOnClone();
}
