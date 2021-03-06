LOCAL_PATH:= $(call my-dir)

orcjit_SRC_FILES := \
  Core.cpp \
  ExecutionUtils.cpp \
  IndirectionUtils.cpp \
  IRCompileLayer.cpp \
  IRTransformLayer.cpp \
  Legacy.cpp \
  Layer.cpp \
  NullResolver.cpp \
  ObjectTransformLayer.cpp \
  OrcABISupport.cpp \
  OrcCBindings.cpp \
  OrcError.cpp \
  OrcMCJITReplacement.cpp \
  RPCUtils.cpp \
  RTDyldObjectLinkingLayer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(orcjit_SRC_FILES)
LOCAL_MODULE := libLLVM70OrcJIT

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(orcjit_SRC_FILES)
LOCAL_MODULE := libLLVM70OrcJIT

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
