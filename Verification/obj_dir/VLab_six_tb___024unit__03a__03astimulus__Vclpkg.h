// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VLab_six_tb.h for the primary calling header

#ifndef VERILATED_VLAB_SIX_TB___024UNIT__03A__03ASTIMULUS__VCLPKG_H_
#define VERILATED_VLAB_SIX_TB___024UNIT__03A__03ASTIMULUS__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
#include "verilated_random.h"


class VLab_six_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) VLab_six_tb___024unit__03a__03astimulus__Vclpkg final {
  public:

    // INTERNAL VARIABLES
    VLab_six_tb__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    VLab_six_tb___024unit__03a__03astimulus__Vclpkg();
    ~VLab_six_tb___024unit__03a__03astimulus__Vclpkg();
    void ctor(VLab_six_tb__Syms* symsp, const char* namep);
    void dtor();
    VL_UNCOPYABLE(VLab_six_tb___024unit__03a__03astimulus__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


class VLab_six_tb__Syms;

class VLab_six_tb___024unit__03a__03astimulus : public virtual VlClass {
  public:

    // DESIGN SPECIFIC STATE
    CData/*7:0*/ __PVT__cmd;
    CData/*0:0*/ __PVT__clk;
    VlUnpacked<CData/*7:0*/, 4> __PVT__payload;
    VlRandomizer __PVT__constraint;

    // INTERNAL VARIABLES
    VlRNG __Vm_rng;

    // INTERNAL METHODS
    virtual const char* typeName() const { return "$unit::stimulus"; }
    VlClass* clone() const { return new VLab_six_tb___024unit__03a__03astimulus(*this); }
    void __VnoInFunc___VBasicRand(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ &__VBasicRand__Vfuncrtn);
    virtual void __VnoInFunc___Vsetup_constraints(VLab_six_tb__Syms* __restrict vlSymsp);
    void __VnoInFunc_c_setup_constraint(VLab_six_tb__Syms* __restrict vlSymsp);
    VlCoroutine __VnoInFunc_drive(VLab_six_tb__Syms* __restrict vlSymsp, CData/*7:0*/ &sig, CData/*0:0*/ &c);
    void __VnoInFunc_post_randomize(VLab_six_tb__Syms* __restrict vlSymsp);
    void __VnoInFunc_pre_randomize(VLab_six_tb__Syms* __restrict vlSymsp);
    void __VnoInFunc_randomize(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ &randomize__Vfuncrtn);
  private:
    void _ctor_var_reset(VLab_six_tb__Syms* __restrict vlSymsp);
  public:
    VLab_six_tb___024unit__03a__03astimulus() = default;
    void init(VLab_six_tb__Syms* __restrict vlSymsp);
    virtual std::string to_string() const;
    std::string to_string_middle() const;
    ~VLab_six_tb___024unit__03a__03astimulus() {}
};


#endif  // guard
