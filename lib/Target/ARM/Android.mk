LOCAL_PATH := $(call my-dir)

arm_codegen_TBLGEN_TABLES70 := \
  ARMGenRegisterInfo.inc \
  ARMGenInstrInfo.inc \
  ARMGenCodeEmitter.inc \
  ARMGenMCCodeEmitter.inc \
  ARMGenMCPseudoLowering.inc \
  ARMGenAsmWriter.inc \
  ARMGenAsmMatcher.inc \
  ARMGenDAGISel.inc \
  ARMGenFastISel.inc \
  ARMGenCallingConv.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenDisassemblerTables.inc \
  ARMGenSystemRegister.inc

arm_codegen_SRC_FILES := \
  A15SDOptimizer.cpp \
  ARMAsmPrinter.cpp \
  ARMBaseInstrInfo.cpp \
  ARMBaseRegisterInfo.cpp \
  ARMCodeGenPrepare.cpp \
  ARMConstantIslandPass.cpp \
  ARMConstantPoolValue.cpp \
  ARMExpandPseudoInsts.cpp \
  ARMFastISel.cpp \
  ARMFrameLowering.cpp \
  ARMHazardRecognizer.cpp \
  ARMISelDAGToDAG.cpp \
  ARMISelLowering.cpp \
  ARMInstrInfo.cpp \
  ARMLoadStoreOptimizer.cpp \
  ARMMCInstLower.cpp \
  ARMMachineFunctionInfo.cpp \
  ARMMacroFusion.cpp \
  ARMRegisterInfo.cpp \
  ARMOptimizeBarriersPass.cpp \
  ARMParallelDSP.cpp \
  ARMSelectionDAGInfo.cpp \
  ARMSubtarget.cpp \
  ARMTargetMachine.cpp \
  ARMTargetObjectFile.cpp \
  ARMTargetTransformInfo.cpp \
  MLxExpansionPass.cpp \
  Thumb1FrameLowering.cpp \
  Thumb1InstrInfo.cpp \
  ThumbRegisterInfo.cpp \
  Thumb2ITBlockPass.cpp \
  Thumb2InstrInfo.cpp \
  Thumb2SizeReduction.cpp \
  ARMComputeBlockSize.cpp

ifeq ($(FORCE_BUILD_LLVM_GLOBAL_ISEL),true)
arm_codegen_TBLGEN_TABLES70 += \
  ARMGenRegisterBank.inc \
  ARMGenGlobalISel.inc

arm_codegen_SRC_FILES += \
  ARMCallLowering.cpp \
  ARMInstructionSelector.cpp \
  ARMLegalizerInfo.cpp \
  ARMRegisterBankInfo.cpp
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE:= libLLVM70ARMCodeGen
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(arm_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
TBLGEN_TABLES70 := $(arm_codegen_TBLGEN_TABLES70)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE:= libLLVM70ARMCodeGen

LOCAL_SRC_FILES := $(arm_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
TBLGEN_TABLES70 := $(arm_codegen_TBLGEN_TABLES70)

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
