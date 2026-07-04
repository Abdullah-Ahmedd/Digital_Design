// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VLab_six_tb.h for the primary calling header

#ifndef VERILATED_VLAB_SIX_TB_STD__03A__03APROCESS__VCLPKG_H_
#define VERILATED_VLAB_SIX_TB_STD__03A__03APROCESS__VCLPKG_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"
#include "verilated_random.h"
class VLab_six_tb_std__03a__03aprocess;


class VLab_six_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) VLab_six_tb_std__03a__03aprocess__Vclpkg final {
  public:

    // INTERNAL VARIABLES
    VLab_six_tb__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    VLab_six_tb_std__03a__03aprocess__Vclpkg();
    ~VLab_six_tb_std__03a__03aprocess__Vclpkg();
    void ctor(VLab_six_tb__Syms* symsp, const char* namep);
    void dtor();
    VL_UNCOPYABLE(VLab_six_tb_std__03a__03aprocess__Vclpkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
    void __VnoInFunc_killQueue(VLab_six_tb__Syms* __restrict vlSymsp, VlQueue<VlClassRef<VLab_six_tb_std__03a__03aprocess>> &processQueue);
    void __VnoInFunc_self(VlProcessRef vlProcess, VLab_six_tb__Syms* __restrict vlSymsp, VlClassRef<VLab_six_tb_std__03a__03aprocess> &self__Vfuncrtn);
};


class VLab_six_tb__Syms;

class VLab_six_tb_std__03a__03aprocess : public virtual VlClass {
  public:

    // DESIGN SPECIFIC STATE
    VlProcessRef __PVT__m_process;

    // INTERNAL METHODS
    virtual const char* typeName() const { return "std::process"; }
    VlClass* clone() const { return new VLab_six_tb_std__03a__03aprocess(*this); }
    VlCoroutine __VnoInFunc_await(VLab_six_tb__Syms* __restrict vlSymsp);
    void __VnoInFunc_get_randstate(VLab_six_tb__Syms* __restrict vlSymsp, std::string &get_randstate__Vfuncrtn);
    void __VnoInFunc_kill(VLab_six_tb__Syms* __restrict vlSymsp);
    void __VnoInFunc_resume(VLab_six_tb__Syms* __restrict vlSymsp);
    void __VnoInFunc_set_randstate(VLab_six_tb__Syms* __restrict vlSymsp, std::string s);
    void __VnoInFunc_set_status(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ s);
    void __VnoInFunc_status(VLab_six_tb__Syms* __restrict vlSymsp, IData/*31:0*/ &status__Vfuncrtn);
    void __VnoInFunc_suspend(VLab_six_tb__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset(VLab_six_tb__Syms* __restrict vlSymsp);
  public:
    VLab_six_tb_std__03a__03aprocess() = default;
    void init(VLab_six_tb__Syms* __restrict vlSymsp);
    virtual std::string to_string() const;
    std::string to_string_middle() const;
    ~VLab_six_tb_std__03a__03aprocess() {}
};



//*** Below code from `systemc in Verilog file
// From `systemc at C:/msys64/ucrt64/share/verilator\include\verilated_std.sv:200:21

template<> template<>
inline bool VlClassRef<VLab_six_tb_std__03a__03aprocess>::operator==(const VlClassRef<VLab_six_tb_std__03a__03aprocess>& rhs) const {
    if (!m_objp && !rhs.m_objp) return true;
    if (!m_objp || !rhs.m_objp) return false;
    return m_objp->__PVT__m_process == rhs.m_objp->__PVT__m_process;
};
template<> template<>
inline bool VlClassRef<VLab_six_tb_std__03a__03aprocess>::operator!=(const VlClassRef<VLab_six_tb_std__03a__03aprocess>& rhs) const {
    if (!m_objp && !rhs.m_objp) return false;
    if (!m_objp || !rhs.m_objp) return true;
    return m_objp->__PVT__m_process != rhs.m_objp->__PVT__m_process;
};
template<> template<>
inline bool VlClassRef<VLab_six_tb_std__03a__03aprocess>::operator<(const VlClassRef<VLab_six_tb_std__03a__03aprocess>& rhs) const {
    if (!m_objp && !rhs.m_objp) return false;
    if (!m_objp || !rhs.m_objp) return false;
    return m_objp->__PVT__m_process < rhs.m_objp->__PVT__m_process;
};
//*** Above code from `systemc in Verilog file


#endif  // guard
