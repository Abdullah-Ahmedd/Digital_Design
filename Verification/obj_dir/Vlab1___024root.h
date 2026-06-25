// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vlab1.h for the primary calling header

#ifndef VERILATED_VLAB1___024ROOT_H_
#define VERILATED_VLAB1___024ROOT_H_  // guard

#include "verilated.h"


class Vlab1__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vlab1___024root final {
  public:

    // DESIGN SPECIFIC STATE
    VlUnpacked<CData/*7:0*/, 5> lab1__DOT__arr1;
    VlUnpacked<CData/*7:0*/, 3> lab1__DOT__arr3;
    VlQueue<CData/*7:0*/> lab1__DOT__darr;

    // INTERNAL VARIABLES
    Vlab1__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vlab1___024root(Vlab1__Syms* symsp, const char* namep);
    ~Vlab1___024root();
    VL_UNCOPYABLE(Vlab1___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
