// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VLab_six_tb.h for the primary calling header

#ifndef VERILATED_VLAB_SIX_TB_STD__03A__03ASEMAPHORE__VCLPKG_H_
#define VERILATED_VLAB_SIX_TB_STD__03A__03ASEMAPHORE__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
#include "verilated_random.h"


class VLab_six_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) VLab_six_tb_std__03a__03asemaphore__Vclpkg final {
  public:

    // INTERNAL VARIABLES
    VLab_six_tb__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    VLab_six_tb_std__03a__03asemaphore__Vclpkg();
    ~VLab_six_tb_std__03a__03asemaphore__Vclpkg();
    void ctor(VLab_six_tb__Syms* symsp, const char* namep);
    void dtor();
    VL_UNCOPYABLE(VLab_six_tb_std__03a__03asemaphore__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


class VLab_six_tb__Syms;

class VLab_six_tb_std__03a__03asemaphore : public virtual VlClass {
  public:

    // DESIGN SPECIFIC STATE
    IData/*31:0*/ __PVT__m_keyCount;

    // INTERNAL METHODS
    virtual const char* typeName() const { return "std::semaphore"; }
    VlClass* clone() const { return new VLab_six_tb_std__03a__03asemaphore(*this); }
    VlCoroutine __VnoInFunc_get(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ keyCount);
    void __VnoInFunc_put(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ keyCount);
    void __VnoInFunc_try_get(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ keyCount, IData/*31:0*/ &try_get__Vfuncrtn);
  private:
    void _ctor_var_reset(VLab_six_tb__Syms* __restrict vlSymsp);
  public:
    VLab_six_tb_std__03a__03asemaphore() = default;
    void init(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ keyCount);
    virtual std::string to_string() const;
    std::string to_string_middle() const;
    ~VLab_six_tb_std__03a__03asemaphore() {}
};


#endif  // guard
