// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vmulti_op_processor_tb.h for the primary calling header

#ifndef VERILATED_VMULTI_OP_PROCESSOR_TB___024ROOT_H_
#define VERILATED_VMULTI_OP_PROCESSOR_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
#include "Vmulti_op_processor_tb___024root.h"


class Vmulti_op_processor_tb__Syms;
struct Vmulti_op_processor_tb_multi_op_processor_tb__DOT__stim__struct__0 {
    CData/*7:0*/ __PVT__data_in;
    CData/*1:0*/ __PVT__op_sel;

    bool operator==(const Vmulti_op_processor_tb_multi_op_processor_tb__DOT__stim__struct__0& rhs) const {
        return __PVT__data_in == rhs.__PVT__data_in
            && __PVT__op_sel == rhs.__PVT__op_sel;
    }
    bool operator!=(const Vmulti_op_processor_tb_multi_op_processor_tb__DOT__stim__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vmulti_op_processor_tb_multi_op_processor_tb__DOT__stim__struct__0& rhs) const {
        return std::tie(__PVT__data_in, __PVT__op_sel)
            <  std::tie(rhs.__PVT__data_in, rhs.__PVT__op_sel);
    }
};
template <>
struct VlIsCustomStruct<Vmulti_op_processor_tb_multi_op_processor_tb__DOT__stim__struct__0> : public std::true_type {};

class alignas(VL_CACHE_LINE_BYTES) Vmulti_op_processor_tb___024root final {
  public:

    // DESIGN SPECIFIC STATE
    CData/*7:0*/ multi_op_processor_tb__DOT__data_in;
    CData/*1:0*/ multi_op_processor_tb__DOT__op_sel;
    CData/*7:0*/ multi_op_processor_tb__DOT__data_out;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VstlPhaseResult;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VinactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    IData/*31:0*/ __VactIterCount;
    IData/*31:0*/ __VinactIterCount;
    IData/*31:0*/ __Vi;
    VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggeredAcc;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
    VlQueue<Vmulti_op_processor_tb_multi_op_processor_tb__DOT__stim__struct__0> multi_op_processor_tb__DOT__dyn_arr;
    VlQueue<CData/*7:0*/> multi_op_processor_tb__DOT__data_q;
    VlAssocArray<IData/*31:0*/, CData/*7:0*/> multi_op_processor_tb__DOT__expected;
    VlDelayScheduler __VdlySched;

    // INTERNAL VARIABLES
    Vmulti_op_processor_tb__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vmulti_op_processor_tb___024root(Vmulti_op_processor_tb__Syms* symsp, const char* namep);
    ~Vmulti_op_processor_tb___024root();
    VL_UNCOPYABLE(Vmulti_op_processor_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};

std::string VL_TO_STRING(const Vmulti_op_processor_tb_multi_op_processor_tb__DOT__stim__struct__0& obj);

#endif  // guard
