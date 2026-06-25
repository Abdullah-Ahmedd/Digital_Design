// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlab1.h for the primary calling header

#include "Vlab1__pch.h"

VL_ATTR_COLD void Vlab1___024root___eval_static(Vlab1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlab1___024root___eval_static\n"); );
    Vlab1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vlab1___024root___eval_initial__TOP(Vlab1___024root* vlSelf);

VL_ATTR_COLD void Vlab1___024root___eval_initial(Vlab1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlab1___024root___eval_initial\n"); );
    Vlab1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vlab1___024root___eval_initial__TOP(vlSelf);
}

VL_ATTR_COLD void Vlab1___024root___eval_initial__TOP(Vlab1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlab1___024root___eval_initial__TOP\n"); );
    Vlab1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ lab1__DOT__unnamedblk6__DOT__i;
    lab1__DOT__unnamedblk6__DOT__i = 0;
    IData/*31:0*/ lab1__DOT__unnamedblk7__DOT__i;
    lab1__DOT__unnamedblk7__DOT__i = 0;
    IData/*31:0*/ lab1__DOT__unnamedblk8__DOT__i;
    lab1__DOT__unnamedblk8__DOT__i = 0;
    // Body
    VL_WRITEF_NX("=== Part 2: arr1 initialized with 2*i ===\n",0);
    vlSelfRef.lab1__DOT__arr1[0U] = 0U;
    vlSelfRef.lab1__DOT__arr1[1U] = 2U;
    vlSelfRef.lab1__DOT__arr1[2U] = 4U;
    vlSelfRef.lab1__DOT__arr1[3U] = 6U;
    vlSelfRef.lab1__DOT__arr1[4U] = 8U;
    VL_WRITEF_NX("arr1[0] = %0d\narr1[1] = %0d\narr1[2] = %0d\narr1[3] = %0d\narr1[4] = %0d\n\n=== Part 3: arr2 (packed) = 24-bit max hex value ===\narr2[2] = ff\narr2[1] = ff\narr2[0] = ff\n\n=== Part 4: arr3 initialized with AA, BB, CC ===\n",5
                 , '#',8,vlSelfRef.lab1__DOT__arr1[0U]
                 , '#',8,vlSelfRef.lab1__DOT__arr1[1U]
                 , '#',8,vlSelfRef.lab1__DOT__arr1[2U]
                 , '#',8,vlSelfRef.lab1__DOT__arr1[3U]
                 , '#',8,vlSelfRef.lab1__DOT__arr1[4U]);
    vlSelfRef.lab1__DOT__arr3[0U] = 0xaaU;
    vlSelfRef.lab1__DOT__arr3[1U] = 0xbbU;
    vlSelfRef.lab1__DOT__arr3[2U] = 0xccU;
    VL_WRITEF_NX("arr3[0] = %0h\narr3[1] = %0h\narr3[2] = %0h\n\n=== Part 5: dynamic array allocated and copied from arr1 ===\n",3
                 , '#',8,vlSelfRef.lab1__DOT__arr3[0U]
                 , '#',8,vlSelfRef.lab1__DOT__arr3[1U]
                 , '#',8,vlSelfRef.lab1__DOT__arr3[2U]);
    vlSelfRef.lab1__DOT__darr.renew(5U);
    vlSelfRef.lab1__DOT__darr.atWrite(0U) = vlSelfRef.lab1__DOT__arr1[0U];
    vlSelfRef.lab1__DOT__darr.atWrite(1U) = vlSelfRef.lab1__DOT__arr1[1U];
    vlSelfRef.lab1__DOT__darr.atWrite(2U) = vlSelfRef.lab1__DOT__arr1[2U];
    vlSelfRef.lab1__DOT__darr.atWrite(3U) = vlSelfRef.lab1__DOT__arr1[3U];
    vlSelfRef.lab1__DOT__darr.atWrite(4U) = vlSelfRef.lab1__DOT__arr1[4U];
    lab1__DOT__unnamedblk6__DOT__i = 0U;
    while (VL_LTS_III(32, lab1__DOT__unnamedblk6__DOT__i, vlSelfRef.lab1__DOT__darr.size())) {
        VL_WRITEF_NX("darr[%0d] = %0d\n",2, '~',32,lab1__DOT__unnamedblk6__DOT__i
                     , '~',8,vlSelfRef.lab1__DOT__darr.at(lab1__DOT__unnamedblk6__DOT__i));
        lab1__DOT__unnamedblk6__DOT__i = ((IData)(1U) 
                                          + lab1__DOT__unnamedblk6__DOT__i);
    }
    VL_WRITEF_NX("\n=== Part 6: dynamic array resized (+2 elements) ===\n",0);
    vlSelfRef.lab1__DOT__darr.renew_copy(7U, vlSelfRef.lab1__DOT__darr);
    vlSelfRef.lab1__DOT__darr.atWrite(5U) = 0x32U;
    vlSelfRef.lab1__DOT__darr.atWrite(6U) = 0x3cU;
    lab1__DOT__unnamedblk7__DOT__i = 0U;
    while (VL_LTS_III(32, lab1__DOT__unnamedblk7__DOT__i, vlSelfRef.lab1__DOT__darr.size())) {
        VL_WRITEF_NX("darr[%0d] = %0d\n",2, '~',32,lab1__DOT__unnamedblk7__DOT__i
                     , '~',8,vlSelfRef.lab1__DOT__darr.at(lab1__DOT__unnamedblk7__DOT__i));
        lab1__DOT__unnamedblk7__DOT__i = ((IData)(1U) 
                                          + lab1__DOT__unnamedblk7__DOT__i);
    }
    VL_WRITEF_NX("\n=== Part 7: delete last element ===\n",0);
    vlSelfRef.lab1__DOT__darr.renew_copy((vlSelfRef.lab1__DOT__darr.size() 
                                          - (IData)(1U)), vlSelfRef.lab1__DOT__darr);
    VL_WRITEF_NX("New size of darr = %0d\n",1, '~',32,vlSelfRef.lab1__DOT__darr.size());
    lab1__DOT__unnamedblk8__DOT__i = 0U;
    while (VL_LTS_III(32, lab1__DOT__unnamedblk8__DOT__i, vlSelfRef.lab1__DOT__darr.size())) {
        VL_WRITEF_NX("darr[%0d] = %0d\n",2, '~',32,lab1__DOT__unnamedblk8__DOT__i
                     , '~',8,vlSelfRef.lab1__DOT__darr.at(lab1__DOT__unnamedblk8__DOT__i));
        lab1__DOT__unnamedblk8__DOT__i = ((IData)(1U) 
                                          + lab1__DOT__unnamedblk8__DOT__i);
    }
    VL_WRITEF_NX("\n=== Part 8: delete all elements ===\n",0);
    vlSelfRef.lab1__DOT__darr.clear();
    VL_WRITEF_NX("Size of darr after delete() = %0d\n",1
                 , '~',32,vlSelfRef.lab1__DOT__darr.size());
}

VL_ATTR_COLD void Vlab1___024root___eval_final(Vlab1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlab1___024root___eval_final\n"); );
    Vlab1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vlab1___024root___eval_settle(Vlab1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlab1___024root___eval_settle\n"); );
    Vlab1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vlab1___024root___ctor_var_reset(Vlab1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlab1___024root___ctor_var_reset\n"); );
    Vlab1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->lab1__DOT__arr1[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->lab1__DOT__arr3[__Vi0] = 0;
    }
    vlSelf->lab1__DOT__darr.atDefault() = 0;
}
