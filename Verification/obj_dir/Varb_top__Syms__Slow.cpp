// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Varb_top__pch.h"

Varb_top__Syms::Varb_top__Syms(VerilatedContext* contextp, const char* namep, Varb_top* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup top module instance
    , TOP{this, namep}
{
    // Check resources
    Verilated::stackCheck(366);
    // Setup sub module instances
    TOP____024unit.ctor(this, "$unit");
    TOP__arb_top__DOT__inter.ctor(this, "arb_top.inter");
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-9);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    TOP.__PVT____024unit = &TOP____024unit;
    TOP.__PVT__arb_top__DOT__inter = &TOP__arb_top__DOT__inter;
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
    TOP____024unit.__Vconfigure(true);
    TOP__arb_top__DOT__inter.__Vconfigure(true);
    // Setup scopes
}

Varb_top__Syms::~Varb_top__Syms() {
    // Tear down scopes
    // Tear down sub module instances
    TOP__arb_top__DOT__inter.dtor();
    TOP____024unit.dtor();
}
