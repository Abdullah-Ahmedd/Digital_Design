// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmulti_op_processor_tb.h for the primary calling header

#include "Vmulti_op_processor_tb__pch.h"

VlCoroutine Vmulti_op_processor_tb___024root___eval_initial__TOP__Vtiming__0(Vmulti_op_processor_tb___024root* vlSelf);

void Vmulti_op_processor_tb___024root___eval_initial(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_initial\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vmulti_op_processor_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
}

VlCoroutine Vmulti_op_processor_tb___024root___eval_initial__TOP__Vtiming__0(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1____VlefExpr_1;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1____VlefExpr_1 = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1____VlefExpr_0;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1____VlefExpr_0 = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__unnamedblk1__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__unnamedblk1__DOT__i = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__drive_stim__2__unnamedblk2__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__2__unnamedblk2__DOT__i = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__drive_stim__2__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__2__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize = 0;
    CData/*7:0*/ __Vtask_multi_op_processor_tb__DOT__collect_output_data__3__temp;
    __Vtask_multi_op_processor_tb__DOT__collect_output_data__3__temp = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i = 0;
    CData/*0:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__5____VlefExpr_0;
    __Vtask_multi_op_processor_tb__DOT__check_results__5____VlefExpr_0 = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__5__unnamedblk4__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__check_results__5__unnamedblk4__DOT__i = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext;
    __Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext = 0;
    CData/*0:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore;
    __Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__5__pass_count;
    __Vtask_multi_op_processor_tb__DOT__check_results__5__pass_count = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__5__fail_count;
    __Vtask_multi_op_processor_tb__DOT__check_results__5__fail_count = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__configure_stim_storage__6__size;
    __Vtask_multi_op_processor_tb__DOT__configure_stim_storage__6__size = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7____VlefExpr_1;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7____VlefExpr_1 = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7____VlefExpr_0;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7____VlefExpr_0 = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__unnamedblk1__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__unnamedblk1__DOT__i = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__drive_stim__8__unnamedblk2__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__8__unnamedblk2__DOT__i = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__drive_stim__8__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__8__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize = 0;
    CData/*7:0*/ __Vtask_multi_op_processor_tb__DOT__collect_output_data__9__temp;
    __Vtask_multi_op_processor_tb__DOT__collect_output_data__9__temp = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i = 0;
    CData/*0:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__11____VlefExpr_0;
    __Vtask_multi_op_processor_tb__DOT__check_results__11____VlefExpr_0 = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__11__unnamedblk4__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__check_results__11__unnamedblk4__DOT__i = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext;
    __Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext = 0;
    CData/*0:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore;
    __Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__11__pass_count;
    __Vtask_multi_op_processor_tb__DOT__check_results__11__pass_count = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__11__fail_count;
    __Vtask_multi_op_processor_tb__DOT__check_results__11__fail_count = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__configure_stim_storage__12__size;
    __Vtask_multi_op_processor_tb__DOT__configure_stim_storage__12__size = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__drive_stim__14__unnamedblk2__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__14__unnamedblk2__DOT__i = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__drive_stim__14__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__14__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize = 0;
    CData/*7:0*/ __Vtask_multi_op_processor_tb__DOT__collect_output_data__15__temp;
    __Vtask_multi_op_processor_tb__DOT__collect_output_data__15__temp = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i = 0;
    CData/*0:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__17____VlefExpr_0;
    __Vtask_multi_op_processor_tb__DOT__check_results__17____VlefExpr_0 = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__17__unnamedblk4__DOT__i;
    __Vtask_multi_op_processor_tb__DOT__check_results__17__unnamedblk4__DOT__i = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext;
    __Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext = 0;
    CData/*0:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore;
    __Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__17__pass_count;
    __Vtask_multi_op_processor_tb__DOT__check_results__17__pass_count = 0;
    IData/*31:0*/ __Vtask_multi_op_processor_tb__DOT__check_results__17__fail_count;
    __Vtask_multi_op_processor_tb__DOT__check_results__17__fail_count = 0;
    // Body
    VL_WRITEF_NX("///////////////////////////// RUN1:configure 100 runs//////////////////////////////////\n",0);
    vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.renew(0x00000064U);
    vlSelfRef.multi_op_processor_tb__DOT__data_q.clear();
    vlSelfRef.multi_op_processor_tb__DOT__expected.clear();
    VL_WRITEF_NX("the stimulus has been configured to 100 locations\n",0);
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize = 0;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__unnamedblk1__DOT__i = 0U;
    while (VL_LTS_III(32, __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__unnamedblk1__DOT__i, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
        __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size();
        __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1____VlefExpr_0 
            = VL_URANDOM_RANGE_I(0U, 0x000000ffU);
        vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.atWrite(__Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__unnamedblk1__DOT__i).__PVT__data_in 
            = (0x000000ffU & __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1____VlefExpr_0);
        __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1____VlefExpr_1 
            = VL_URANDOM_RANGE_I(0U, 3U);
        vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.atWrite(__Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__unnamedblk1__DOT__i).__PVT__op_sel 
            = (3U & __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1____VlefExpr_1);
        if ((__Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize 
             <= vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
            __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__unnamedblk1__DOT__i 
                = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__generate_stimulus__1__unnamedblk1__DOT__i);
        }
    }
    VL_WRITEF_NX("the stimulus have been generated with size %0d\n",1
                 , '~',32,vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size());
    __Vtask_multi_op_processor_tb__DOT__drive_stim__2__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize = 0;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__2__unnamedblk2__DOT__i = 0U;
    while (VL_LTS_III(32, __Vtask_multi_op_processor_tb__DOT__drive_stim__2__unnamedblk2__DOT__i, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
        __Vtask_multi_op_processor_tb__DOT__drive_stim__2__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size();
        vlSelfRef.multi_op_processor_tb__DOT__data_in 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__drive_stim__2__unnamedblk2__DOT__i)
            .__PVT__data_in;
        vlSelfRef.multi_op_processor_tb__DOT__op_sel 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__drive_stim__2__unnamedblk2__DOT__i)
            .__PVT__op_sel;
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "Assignments/Assignment_two\\multi_op_processor_tb.sv", 
                                             57);
        __Vtask_multi_op_processor_tb__DOT__collect_output_data__3__temp 
            = vlSelfRef.multi_op_processor_tb__DOT__data_out;
        vlSelfRef.multi_op_processor_tb__DOT__data_q.push_back(__Vtask_multi_op_processor_tb__DOT__collect_output_data__3__temp);
        if ((__Vtask_multi_op_processor_tb__DOT__drive_stim__2__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize 
             <= vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
            __Vtask_multi_op_processor_tb__DOT__drive_stim__2__unnamedblk2__DOT__i 
                = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__drive_stim__2__unnamedblk2__DOT__i);
        }
    }
    __Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i = 0U;
    __Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i = 0U;
    while (VL_LTS_III(32, __Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
        if ((2U & vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i)
             .__PVT__op_sel)) {
            if ((1U & vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i)
                 .__PVT__op_sel)) {
                vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i) 
                    = (0x000000ffU & VL_SHIFTL_III(8,8,32, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i)
                                                   .__PVT__data_in, 1U));
            } else {
                vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i) 
                    = (0x000000ffU & (~ vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i)
                                      .__PVT__data_in));
            }
        } else if ((1U & vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i)
                    .__PVT__op_sel)) {
            vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i) 
                = (0x000000ffU & (vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i)
                                  .__PVT__data_in - (IData)(1U)));
        } else {
            vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i) 
                = (0x000000ffU & ((IData)(1U) + vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i)
                                  .__PVT__data_in));
        }
        VL_WRITEF_NX("the expected result for the generated stimulus is %0d\n",1
                     , '#',8,vlSelfRef.multi_op_processor_tb__DOT__expected
                     .at(__Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i));
        __Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i 
            = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__golden_model__4__unnamedblk3__DOT__i);
    }
    __Vtask_multi_op_processor_tb__DOT__check_results__5__unnamedblk4__DOT__i = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__5__pass_count = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__5__fail_count = 0U;
    if (VL_UNLIKELY(((vlSelfRef.multi_op_processor_tb__DOT__expected.size() 
                      != vlSelfRef.multi_op_processor_tb__DOT__data_q.size())))) {
        VL_WRITEF_NX("there is a mismatch, the size of the expected array and the actuall array dont match\n[%0t] %%Error: multi_op_processor_tb.sv:93: Assertion failed in %m: expected array (assosciative array) size :%0d , actual array (queue) size :%0d\n",5, 'M',vlSymsp->name(),"multi_op_processor_tb.check_results", 'T',-9
                     , '#',64,VL_TIME_UNITED_Q(1), '~',32,vlSelfRef.multi_op_processor_tb__DOT__expected.size()
                     , '~',32,vlSelfRef.multi_op_processor_tb__DOT__data_q.size());
        VL_STOP_MT("Assignments/Assignment_two\\multi_op_processor_tb.sv", 93, "");
    } else {
        __Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore 
            = (0U != vlSelfRef.multi_op_processor_tb__DOT__expected.first(__Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext));
        while (__Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore) {
            __Vtask_multi_op_processor_tb__DOT__check_results__5__unnamedblk4__DOT__i 
                = __Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext;
            __Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore 
                = (0U != vlSelfRef.multi_op_processor_tb__DOT__expected.next(__Vtask_multi_op_processor_tb__DOT__check_results__5__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext));
            __Vtask_multi_op_processor_tb__DOT__check_results__5____VlefExpr_0 
                = (vlSelfRef.multi_op_processor_tb__DOT__expected
                   .at(__Vtask_multi_op_processor_tb__DOT__check_results__5__unnamedblk4__DOT__i) 
                   == vlSelfRef.multi_op_processor_tb__DOT__data_q.at(__Vtask_multi_op_processor_tb__DOT__check_results__5__unnamedblk4__DOT__i));
            if (__Vtask_multi_op_processor_tb__DOT__check_results__5____VlefExpr_0) {
                __Vtask_multi_op_processor_tb__DOT__check_results__5__pass_count 
                    = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__check_results__5__pass_count);
                VL_WRITEF_NX("test number : %0d passed successfully\n",1
                             , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__5__unnamedblk4__DOT__i);
            } else {
                __Vtask_multi_op_processor_tb__DOT__check_results__5__fail_count 
                    = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__check_results__5__fail_count);
                VL_WRITEF_NX("test number : %0d failed---------------->\n",1
                             , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__5__unnamedblk4__DOT__i);
            }
        }
        VL_WRITEF_NX("//////////////////////////////////////TEST SUMMARY://////////////////////////////////////\nthe number of passed tests :%0d----------- the number of failed tests : %0d\n",2
                     , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__5__pass_count
                     , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__5__fail_count);
    }
    VL_WRITEF_NX("///////////////////////////// RUN2:configure 200 runs//////////////////////////////////\n",0);
    __Vtask_multi_op_processor_tb__DOT__configure_stim_storage__6__size = 0x000000c8U;
    vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.renew(__Vtask_multi_op_processor_tb__DOT__configure_stim_storage__6__size);
    vlSelfRef.multi_op_processor_tb__DOT__data_q.clear();
    vlSelfRef.multi_op_processor_tb__DOT__expected.clear();
    VL_WRITEF_NX("the stimulus has been configured to %0d locations\n",1
                 , '~',32,__Vtask_multi_op_processor_tb__DOT__configure_stim_storage__6__size);
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__unnamedblk1__DOT__i = 0U;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize = 0;
    __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__unnamedblk1__DOT__i = 0U;
    while (VL_LTS_III(32, __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__unnamedblk1__DOT__i, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
        __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size();
        __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7____VlefExpr_0 
            = VL_URANDOM_RANGE_I(0U, 0x000000ffU);
        vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.atWrite(__Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__unnamedblk1__DOT__i).__PVT__data_in 
            = (0x000000ffU & __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7____VlefExpr_0);
        __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7____VlefExpr_1 
            = VL_URANDOM_RANGE_I(0U, 3U);
        vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.atWrite(__Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__unnamedblk1__DOT__i).__PVT__op_sel 
            = (3U & __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7____VlefExpr_1);
        if ((__Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__multi_op_processor_tb__DOT__unnamedblk1__DOT__i__Vloopsize 
             <= vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
            __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__unnamedblk1__DOT__i 
                = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__generate_stimulus__7__unnamedblk1__DOT__i);
        }
    }
    VL_WRITEF_NX("the stimulus have been generated with size %0d\n",1
                 , '~',32,vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size());
    __Vtask_multi_op_processor_tb__DOT__drive_stim__8__unnamedblk2__DOT__i = 0U;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__8__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize = 0;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__8__unnamedblk2__DOT__i = 0U;
    while (VL_LTS_III(32, __Vtask_multi_op_processor_tb__DOT__drive_stim__8__unnamedblk2__DOT__i, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
        __Vtask_multi_op_processor_tb__DOT__drive_stim__8__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size();
        vlSelfRef.multi_op_processor_tb__DOT__data_in 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__drive_stim__8__unnamedblk2__DOT__i)
            .__PVT__data_in;
        vlSelfRef.multi_op_processor_tb__DOT__op_sel 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__drive_stim__8__unnamedblk2__DOT__i)
            .__PVT__op_sel;
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "Assignments/Assignment_two\\multi_op_processor_tb.sv", 
                                             57);
        __Vtask_multi_op_processor_tb__DOT__collect_output_data__9__temp 
            = vlSelfRef.multi_op_processor_tb__DOT__data_out;
        vlSelfRef.multi_op_processor_tb__DOT__data_q.push_back(__Vtask_multi_op_processor_tb__DOT__collect_output_data__9__temp);
        if ((__Vtask_multi_op_processor_tb__DOT__drive_stim__8__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize 
             <= vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
            __Vtask_multi_op_processor_tb__DOT__drive_stim__8__unnamedblk2__DOT__i 
                = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__drive_stim__8__unnamedblk2__DOT__i);
        }
    }
    __Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i = 0U;
    __Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i = 0U;
    while (VL_LTS_III(32, __Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
        if ((2U & vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i)
             .__PVT__op_sel)) {
            if ((1U & vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i)
                 .__PVT__op_sel)) {
                vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i) 
                    = (0x000000ffU & VL_SHIFTL_III(8,8,32, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i)
                                                   .__PVT__data_in, 1U));
            } else {
                vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i) 
                    = (0x000000ffU & (~ vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i)
                                      .__PVT__data_in));
            }
        } else if ((1U & vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i)
                    .__PVT__op_sel)) {
            vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i) 
                = (0x000000ffU & (vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i)
                                  .__PVT__data_in - (IData)(1U)));
        } else {
            vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i) 
                = (0x000000ffU & ((IData)(1U) + vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i)
                                  .__PVT__data_in));
        }
        VL_WRITEF_NX("the expected result for the generated stimulus is %0d\n",1
                     , '#',8,vlSelfRef.multi_op_processor_tb__DOT__expected
                     .at(__Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i));
        __Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i 
            = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__golden_model__10__unnamedblk3__DOT__i);
    }
    __Vtask_multi_op_processor_tb__DOT__check_results__11__unnamedblk4__DOT__i = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__11__pass_count = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__11__fail_count = 0U;
    if (VL_UNLIKELY(((vlSelfRef.multi_op_processor_tb__DOT__expected.size() 
                      != vlSelfRef.multi_op_processor_tb__DOT__data_q.size())))) {
        VL_WRITEF_NX("there is a mismatch, the size of the expected array and the actuall array dont match\n[%0t] %%Error: multi_op_processor_tb.sv:93: Assertion failed in %m: expected array (assosciative array) size :%0d , actual array (queue) size :%0d\n",5, 'M',vlSymsp->name(),"multi_op_processor_tb.check_results", 'T',-9
                     , '#',64,VL_TIME_UNITED_Q(1), '~',32,vlSelfRef.multi_op_processor_tb__DOT__expected.size()
                     , '~',32,vlSelfRef.multi_op_processor_tb__DOT__data_q.size());
        VL_STOP_MT("Assignments/Assignment_two\\multi_op_processor_tb.sv", 93, "");
    } else {
        __Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore 
            = (0U != vlSelfRef.multi_op_processor_tb__DOT__expected.first(__Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext));
        while (__Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore) {
            __Vtask_multi_op_processor_tb__DOT__check_results__11__unnamedblk4__DOT__i 
                = __Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext;
            __Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore 
                = (0U != vlSelfRef.multi_op_processor_tb__DOT__expected.next(__Vtask_multi_op_processor_tb__DOT__check_results__11__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext));
            __Vtask_multi_op_processor_tb__DOT__check_results__11____VlefExpr_0 
                = (vlSelfRef.multi_op_processor_tb__DOT__expected
                   .at(__Vtask_multi_op_processor_tb__DOT__check_results__11__unnamedblk4__DOT__i) 
                   == vlSelfRef.multi_op_processor_tb__DOT__data_q.at(__Vtask_multi_op_processor_tb__DOT__check_results__11__unnamedblk4__DOT__i));
            if (__Vtask_multi_op_processor_tb__DOT__check_results__11____VlefExpr_0) {
                __Vtask_multi_op_processor_tb__DOT__check_results__11__pass_count 
                    = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__check_results__11__pass_count);
                VL_WRITEF_NX("test number : %0d passed successfully\n",1
                             , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__11__unnamedblk4__DOT__i);
            } else {
                __Vtask_multi_op_processor_tb__DOT__check_results__11__fail_count 
                    = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__check_results__11__fail_count);
                VL_WRITEF_NX("test number : %0d failed---------------->\n",1
                             , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__11__unnamedblk4__DOT__i);
            }
        }
        VL_WRITEF_NX("//////////////////////////////////////TEST SUMMARY://////////////////////////////////////\nthe number of passed tests :%0d----------- the number of failed tests : %0d\n",2
                     , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__11__pass_count
                     , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__11__fail_count);
    }
    VL_WRITEF_NX("///////////////////////////// RUN3:reorder run 2 using reconfigure_stim and run the test again//////////////////////////////////\n",0);
    __Vtask_multi_op_processor_tb__DOT__configure_stim_storage__12__size = 0x000000c8U;
    vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.renew(__Vtask_multi_op_processor_tb__DOT__configure_stim_storage__12__size);
    vlSelfRef.multi_op_processor_tb__DOT__data_q.clear();
    vlSelfRef.multi_op_processor_tb__DOT__expected.clear();
    VL_WRITEF_NX("the stimulus has been configured to %0d locations\n",1
                 , '~',32,__Vtask_multi_op_processor_tb__DOT__configure_stim_storage__12__size);
    vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.shuffle();
    VL_WRITEF_NX("the dynamic array has been shuffled sucessfully\n",0);
    __Vtask_multi_op_processor_tb__DOT__drive_stim__14__unnamedblk2__DOT__i = 0U;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__14__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize = 0;
    __Vtask_multi_op_processor_tb__DOT__drive_stim__14__unnamedblk2__DOT__i = 0U;
    while (VL_LTS_III(32, __Vtask_multi_op_processor_tb__DOT__drive_stim__14__unnamedblk2__DOT__i, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
        __Vtask_multi_op_processor_tb__DOT__drive_stim__14__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size();
        vlSelfRef.multi_op_processor_tb__DOT__data_in 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__drive_stim__14__unnamedblk2__DOT__i)
            .__PVT__data_in;
        vlSelfRef.multi_op_processor_tb__DOT__op_sel 
            = vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__drive_stim__14__unnamedblk2__DOT__i)
            .__PVT__op_sel;
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "Assignments/Assignment_two\\multi_op_processor_tb.sv", 
                                             57);
        __Vtask_multi_op_processor_tb__DOT__collect_output_data__15__temp 
            = vlSelfRef.multi_op_processor_tb__DOT__data_out;
        vlSelfRef.multi_op_processor_tb__DOT__data_q.push_back(__Vtask_multi_op_processor_tb__DOT__collect_output_data__15__temp);
        if ((__Vtask_multi_op_processor_tb__DOT__drive_stim__14__multi_op_processor_tb__DOT__unnamedblk2__DOT__i__Vloopsize 
             <= vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
            __Vtask_multi_op_processor_tb__DOT__drive_stim__14__unnamedblk2__DOT__i 
                = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__drive_stim__14__unnamedblk2__DOT__i);
        }
    }
    __Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i = 0U;
    __Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i = 0U;
    while (VL_LTS_III(32, __Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.size())) {
        if ((2U & vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i)
             .__PVT__op_sel)) {
            if ((1U & vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i)
                 .__PVT__op_sel)) {
                vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i) 
                    = (0x000000ffU & VL_SHIFTL_III(8,8,32, vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i)
                                                   .__PVT__data_in, 1U));
            } else {
                vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i) 
                    = (0x000000ffU & (~ vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i)
                                      .__PVT__data_in));
            }
        } else if ((1U & vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i)
                    .__PVT__op_sel)) {
            vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i) 
                = (0x000000ffU & (vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i)
                                  .__PVT__data_in - (IData)(1U)));
        } else {
            vlSelfRef.multi_op_processor_tb__DOT__expected.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i) 
                = (0x000000ffU & ((IData)(1U) + vlSelfRef.multi_op_processor_tb__DOT__dyn_arr.at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i)
                                  .__PVT__data_in));
        }
        VL_WRITEF_NX("the expected result for the generated stimulus is %0d\n",1
                     , '#',8,vlSelfRef.multi_op_processor_tb__DOT__expected
                     .at(__Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i));
        __Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i 
            = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__golden_model__16__unnamedblk3__DOT__i);
    }
    __Vtask_multi_op_processor_tb__DOT__check_results__17__unnamedblk4__DOT__i = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__17__pass_count = 0U;
    __Vtask_multi_op_processor_tb__DOT__check_results__17__fail_count = 0U;
    if (VL_UNLIKELY(((vlSelfRef.multi_op_processor_tb__DOT__expected.size() 
                      != vlSelfRef.multi_op_processor_tb__DOT__data_q.size())))) {
        VL_WRITEF_NX("there is a mismatch, the size of the expected array and the actuall array dont match\n[%0t] %%Error: multi_op_processor_tb.sv:93: Assertion failed in %m: expected array (assosciative array) size :%0d , actual array (queue) size :%0d\n",5, 'M',vlSymsp->name(),"multi_op_processor_tb.check_results", 'T',-9
                     , '#',64,VL_TIME_UNITED_Q(1), '~',32,vlSelfRef.multi_op_processor_tb__DOT__expected.size()
                     , '~',32,vlSelfRef.multi_op_processor_tb__DOT__data_q.size());
        VL_STOP_MT("Assignments/Assignment_two\\multi_op_processor_tb.sv", 93, "");
    } else {
        __Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore 
            = (0U != vlSelfRef.multi_op_processor_tb__DOT__expected.first(__Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext));
        while (__Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore) {
            __Vtask_multi_op_processor_tb__DOT__check_results__17__unnamedblk4__DOT__i 
                = __Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext;
            __Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vmore 
                = (0U != vlSelfRef.multi_op_processor_tb__DOT__expected.next(__Vtask_multi_op_processor_tb__DOT__check_results__17__multi_op_processor_tb__DOT__unnamedblk4__DOT__i__Vnext));
            __Vtask_multi_op_processor_tb__DOT__check_results__17____VlefExpr_0 
                = (vlSelfRef.multi_op_processor_tb__DOT__expected
                   .at(__Vtask_multi_op_processor_tb__DOT__check_results__17__unnamedblk4__DOT__i) 
                   == vlSelfRef.multi_op_processor_tb__DOT__data_q.at(__Vtask_multi_op_processor_tb__DOT__check_results__17__unnamedblk4__DOT__i));
            if (__Vtask_multi_op_processor_tb__DOT__check_results__17____VlefExpr_0) {
                __Vtask_multi_op_processor_tb__DOT__check_results__17__pass_count 
                    = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__check_results__17__pass_count);
                VL_WRITEF_NX("test number : %0d passed successfully\n",1
                             , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__17__unnamedblk4__DOT__i);
            } else {
                __Vtask_multi_op_processor_tb__DOT__check_results__17__fail_count 
                    = ((IData)(1U) + __Vtask_multi_op_processor_tb__DOT__check_results__17__fail_count);
                VL_WRITEF_NX("test number : %0d failed---------------->\n",1
                             , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__17__unnamedblk4__DOT__i);
            }
        }
        VL_WRITEF_NX("//////////////////////////////////////TEST SUMMARY://////////////////////////////////////\nthe number of passed tests :%0d----------- the number of failed tests : %0d\n",2
                     , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__17__pass_count
                     , '~',32,__Vtask_multi_op_processor_tb__DOT__check_results__17__fail_count);
    }
    VL_WRITEF_NX("///////////////////////////// END OF THE TEST //////////////////////////////////\n",0);
    co_return;
}

void Vmulti_op_processor_tb___024root___eval_triggers_vec__act(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_triggers_vec__act\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered[0U] = (QData)((IData)(vlSelfRef.__VdlySched.awaitingCurrentTime()));
}

bool Vmulti_op_processor_tb___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

extern const VlUnpacked<CData/*7:0*/, 1024> Vmulti_op_processor_tb__ConstPool__TABLE_h07e0d7f0_0;

void Vmulti_op_processor_tb___024root___act_sequent__TOP__0(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___act_sequent__TOP__0\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    SData/*9:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    // Body
    __Vtableidx1 = (((IData)(vlSelfRef.multi_op_processor_tb__DOT__data_in) 
                     << 2U) | (IData)(vlSelfRef.multi_op_processor_tb__DOT__op_sel));
    vlSelfRef.multi_op_processor_tb__DOT__data_out 
        = Vmulti_op_processor_tb__ConstPool__TABLE_h07e0d7f0_0
        [__Vtableidx1];
}

void Vmulti_op_processor_tb___024root___eval_act(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_act\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    SData/*9:0*/ __Vinline__act_sequent__TOP__0___Vtableidx1;
    __Vinline__act_sequent__TOP__0___Vtableidx1 = 0;
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
        __Vinline__act_sequent__TOP__0___Vtableidx1 
            = (((IData)(vlSelfRef.multi_op_processor_tb__DOT__data_in) 
                << 2U) | (IData)(vlSelfRef.multi_op_processor_tb__DOT__op_sel));
        vlSelfRef.multi_op_processor_tb__DOT__data_out 
            = Vmulti_op_processor_tb__ConstPool__TABLE_h07e0d7f0_0
            [__Vinline__act_sequent__TOP__0___Vtableidx1];
    }
}

void Vmulti_op_processor_tb___024root___eval_nba(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_nba\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    SData/*9:0*/ __Vinline__act_sequent__TOP__0___Vtableidx1;
    __Vinline__act_sequent__TOP__0___Vtableidx1 = 0;
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
        __Vinline__act_sequent__TOP__0___Vtableidx1 
            = (((IData)(vlSelfRef.multi_op_processor_tb__DOT__data_in) 
                << 2U) | (IData)(vlSelfRef.multi_op_processor_tb__DOT__op_sel));
        vlSelfRef.multi_op_processor_tb__DOT__data_out 
            = Vmulti_op_processor_tb__ConstPool__TABLE_h07e0d7f0_0
            [__Vinline__act_sequent__TOP__0___Vtableidx1];
    }
}

void Vmulti_op_processor_tb___024root___timing_resume(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___timing_resume\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vmulti_op_processor_tb___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmulti_op_processor_tb___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vmulti_op_processor_tb___024root___eval_phase__act(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_phase__act\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VactExecute;
    // Body
    Vmulti_op_processor_tb___024root___eval_triggers_vec__act(vlSelf);
    Vmulti_op_processor_tb___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VactTriggered, vlSelfRef.__VactTriggeredAcc);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vmulti_op_processor_tb___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vmulti_op_processor_tb___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    __VactExecute = Vmulti_op_processor_tb___024root___trigger_anySet__act(vlSelfRef.__VactTriggered);
    if (__VactExecute) {
        vlSelfRef.__VactTriggeredAcc.fill(0ULL);
        Vmulti_op_processor_tb___024root___timing_resume(vlSelf);
        Vmulti_op_processor_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vmulti_op_processor_tb___024root___eval_phase__inact(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_phase__inact\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VinactExecute;
    // Body
    __VinactExecute = vlSelfRef.__VdlySched.awaitingZeroDelay();
    if (__VinactExecute) {
        VL_FATAL_MT("Assignments/Assignment_two\\multi_op_processor_tb.sv", 3, "", "ZERODLY: Design Verilated with '--no-sched-zero-delay', but #0 delay executed at runtime");
    }
    return (__VinactExecute);
}

void Vmulti_op_processor_tb___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Vmulti_op_processor_tb___024root___eval_phase__nba(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_phase__nba\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vmulti_op_processor_tb___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        Vmulti_op_processor_tb___024root___eval_nba(vlSelf);
        Vmulti_op_processor_tb___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void Vmulti_op_processor_tb___024root___eval(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vmulti_op_processor_tb___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("Assignments/Assignment_two\\multi_op_processor_tb.sv", 3, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VinactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VinactIterCount)))) {
                VL_FATAL_MT("Assignments/Assignment_two\\multi_op_processor_tb.sv", 3, "", "DIDNOTCONVERGE: Inactive region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VinactIterCount = ((IData)(1U) 
                                           + vlSelfRef.__VinactIterCount);
            vlSelfRef.__VactIterCount = 0U;
            do {
                if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                    Vmulti_op_processor_tb___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                    VL_FATAL_MT("Assignments/Assignment_two\\multi_op_processor_tb.sv", 3, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
                }
                vlSelfRef.__VactIterCount = ((IData)(1U) 
                                             + vlSelfRef.__VactIterCount);
                vlSelfRef.__VactPhaseResult = Vmulti_op_processor_tb___024root___eval_phase__act(vlSelf);
            } while (vlSelfRef.__VactPhaseResult);
            vlSelfRef.__VinactPhaseResult = Vmulti_op_processor_tb___024root___eval_phase__inact(vlSelf);
        } while (vlSelfRef.__VinactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Vmulti_op_processor_tb___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void Vmulti_op_processor_tb___024root___eval_debug_assertions(Vmulti_op_processor_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root___eval_debug_assertions\n"); );
    Vmulti_op_processor_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG

std::string VL_TO_STRING(const Vmulti_op_processor_tb_multi_op_processor_tb__DOT__stim__struct__0& obj) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmulti_op_processor_tb___024root::VL_TO_STRING\n"); );
    // Body
    std::string out;
    out += "'{data_in:" + VL_TO_STRING(obj.__PVT__data_in);
    out += ", op_sel:" + VL_TO_STRING(obj.__PVT__op_sel);
    out += "}";
    return (out);
}
